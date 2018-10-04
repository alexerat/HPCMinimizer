#include <time.h>
#include <stdlib.h>
#include <string>
#include <iostream>
#include <fstream>
#include <iomanip>
#include <pthread.h>
#include <stdio.h>
#include <sys/sysinfo.h>

#ifdef FHEADER
#include FHEADER
#else /*FHEADER*/
#include "function.h"
#endif /*!FHEADER*/

#ifdef USE_MPI
#include <mpi.h>
#endif /*USE_MPI*/

#include "precision.h"
#include "lbfgs.h"
#include "de.h"

// TODO: Remove
#include <unistd.h>

using namespace std;
using std::cout;
using std::cerr;
using std::endl;

struct OptimizeResult
{
	floatval_t  f;
	floatval_t* X;
};

typedef struct
{
	floatval_t (*get)(int i, floatval_t* params, int depth);
	int (*steps)(floatval_t* params, int depth);
	int (*findPos)(floatval_t value, floatval_t* params, int depth);
} parameter_t;

typedef struct
{
	floatval_t startLower;
	floatval_t incrementLower;
	floatval_t startUpper;
	floatval_t incrementUpper;
	int steps;
	int dim;
	bool intCast;
	bool hasSym;
} boundary_t;

int nruns = 0;
bool startBound = true;

floatval_t* params;

#ifdef PARAMSCONSTSCOUNT
floatval_t precompute[PARAMSCONSTSCOUNT];
#endif /*PARAMSCONSTSCOUNT*/

floatval_t* ubounds = NULL;
floatval_t* lbounds = NULL;

int nodeNum = 0;
#ifdef USE_MPI
	// floatval_t datatype
	MPI_Datatype MPI_FLOATVAL_T;

	// MPI Windows
	MPI_Win m_state_window;
	MPI_Win s_state_window;
	MPI_Win stats_window;
	MPI_Win res_window;

	// Global states (master keeps)
	int* m_state;
	int* globalNRuns;
	int* currentCollectionID;

	// Slave states and results (slaves keep)
	int* s_state;
	int* readyForCollection;

	floatval_t* s_res;
	floatval_t* nodeBest;
	floatval_t** nodeX;

	int* s_stats;
	int* nodeFails;
	int* nodeLowestBin;
	int** nodeBins;

	int falseReady;

	int pWorkNumber;
	int bucketNum;
	int collectionID;

	bool checkMPIError(int code)
	{
		switch(code)
		{
			case MPI_SUCCESS:
				return true;
			default:
				cout << "Unknown MPI error." << endl;
				return false;
		}
	}
#endif /*USE_MPI*/

int nThreads = 1;

pthread_spinlock_t workLock;
pthread_mutex_t theadCoordLock;
pthread_cond_t threadsComplete;
pthread_cond_t threadsStart;
pthread_t* threadPool;
volatile int threadsDone = 0;
volatile int workNumber = 0;
volatile bool finished = false;
volatile int threadStartCount = 0;
bool threadError = false;


parameter_t* parameters;
boundary_t* boundaries;

int* threadMinBin;
int** threadBins;
int* threadFails;
int num_nodes;
bool* startLatch;

#ifdef DETERMINISTIC
int detDebug = 0;
#endif /*DETERMINISTIC*/

struct OptimizeResult bestRes;
struct OptimizeResult* results;

/**
 *
 *
 */
class objective_function
{
public:
	bool initialized;
protected:
    floatval_t* m_x;
    floatval_t* localLower;
    floatval_t* localUpper;
	floatval_t* bStepDown;
	floatval_t* bStepUp;

	/* DE Workspace */
	floatval_t* ini_upper;
	floatval_t* ini_lower;
	floatval_t* c;
    floatval_t* d;
    floatval_t* oldarray;
	floatval_t* newarray;
	floatval_t* swaparray;
	floatval_t* tmp;
    floatval_t* best;
	floatval_t* energy;
    floatval_t* bestit;

	int threadNum;
	int ret;
	lbfgs_wspace_t wspace;

public:
	/**
	 *
	 *
	 */
    objective_function(int threadNum_in)
    {
	    lbfgs_parameter_t param;

		initialized = false;

		threadNum = threadNum_in;

	    param.m = MEMSIZE;
	    param.epsilon = CONVEPS;
	    param.past = 0;
	    param.delta = DELTA;
	    param.max_iterations = MAXIT;
	    param.linesearch = LBFGS_LINESEARCH_MORETHUENTE;
	    param.max_linesearch = MAXLINE;
	    param.min_step = MINSTEP;
	    param.max_step = MAXSTEP;
	    param.ftol = 1e-4;
	    param.wolfe = 0.9;
	    param.gtol = 0.9;
	    param.xtol = XTOL;
	    param.orthantwise_c = 0.0;
	    param.orthantwise_start = 0;
	    param.orthantwise_end = -1;

		ret = -1;
        m_x = new floatval_t[DIM];
        localLower = new floatval_t[DIM];
        localUpper = new floatval_t[DIM];
		bStepDown = new floatval_t[DIM];
		bStepUp = new floatval_t[DIM];

		int dimCount = 0;
		for (int i = 0;i < BSETS;i++)
		{
			for(int j = 0; j < boundaries[i].dim; j++)
			{
				bStepDown[dimCount + j] = boundaries[i].incrementLower;
				bStepUp[dimCount + j] = boundaries[i].incrementUpper;
				if(j == 0 && boundaries[i].hasSym)
				{
#ifdef VERBOSE
					cout << "Fixed a boundry." << endl;
#endif /*VERBOSE*/
					bStepDown[dimCount + j] = 0.0;
				}
			}
			dimCount += boundaries[i].dim;
		}

		if(ALGO == 0)
		{
			ret = lbfgs_init(DIM, &wspace, &param);
			if(ret != 0)
			{
				cout << "Initialization error: " << ret << endl;
				std::cout.flush();
				std::_Exit(EXIT_FAILURE);
			}
		}
		else if(ALGO == 1)
		{
			ini_upper = new floatval_t[DIM];
		  	ini_lower = new floatval_t[DIM];
			c = new floatval_t[POPSIZE*DIM];
		  	d = new floatval_t[POPSIZE*DIM];
		  	oldarray = new floatval_t[POPSIZE*DIM];
		    newarray = new floatval_t[POPSIZE*DIM];
		    swaparray = new floatval_t[POPSIZE*DIM];
		    tmp = new floatval_t[DIM];
		    best = new floatval_t[DIM];
		    bestit = new floatval_t[DIM];
		    energy = new floatval_t[POPSIZE];
		}

		if (m_x == NULL || localLower == NULL || localUpper == NULL)
        {
            cout << "ERROR: Failed to allocate a memory block for variables." << endl;
			return;
        }

		initialized = true;
    }

	/**
	 *
	 *
	 */
    virtual ~objective_function()
    {
        if (m_x != NULL)
        {
            delete[] m_x;
            m_x = NULL;
        }
        if (localLower != NULL)
        {
            delete[] localLower;
        }
        if (localUpper != NULL)
        {
            delete[] localUpper;
        }
		if (bStepDown != NULL)
        {
            delete[] bStepDown;
        }
        if (bStepUp != NULL)
        {
            delete[] bStepUp;
        }

		if(ALGO == 0)
		{
			lbfgs_dest(&wspace);
		}
		else if(ALGO == 1)
		{
			delete[] ini_upper;
		    delete[] ini_lower;
			delete[] c;
		    delete[] d;
		    delete[] oldarray;
		    delete[] newarray;
		    delete[] swaparray;
		    delete[] tmp;
		    delete[] best;
		    delete[] bestit;
		    delete[] energy;
		}
    }

	/**
	 * Find a start location within an unsearched area of the expanded search zone.
	 * Used for algortithms using a single start point local optimizer.
	 */
	int getSingleStartPos(int workNumber)
	{
		int dim;
		int remaining;
		int dimNumber;
		int workPos;
		int dimCount = 0;

		floatval_t stepScale;

		// Random seach chooses points at random
		if(RANDOMSEARCH)
		{
			// We need to do this for each boundary set. NOTE: There is a higher density of searching in the corners due to overlap. Resolving this is complicated.
			for(int j = 0; j < BSETS; j++)
			{
				int sect = rand() % (2*boundaries[j].dim - (boundaries[j].hasSym ? 1 : 0));

				/* Initialize the variables. */
				for (int i = dimCount;i < (dimCount + boundaries[j].dim);i++)
				{
					if(abs(bStepDown[i]) < EPS && sect >= 2*i)
							sect++;
					if(abs(bStepUp[i]) < EPS && sect > 2*i)
							sect++;

#ifdef VERBOSE
					cout << "Section is: " << (sect / 2) << endl;
					cout << "Initial values are " << endl;
#endif /*VERBOSE*/

					if((sect / 2) == i)
					{
						if((sect % 2))
							m_x[i] = localUpper[i] - bStepUp[i]*rnd_uni();
						else
							m_x[i] = localLower[i] - bStepDown[i]*rnd_uni();

					}
					else
					{
						m_x[i] = (localUpper[i] - localLower[i])*rnd_uni() + localLower[i];
					}

#ifdef DEBUG
#ifdef VERBOSE
					cout << ", x[" << i << "] = " << m_x[i].to_out_string(5);
#endif /*VERBOSE*/

					if(m_x[i] > localUpper[i] || m_x[i] < localLower[i])
					{
						cout << endl;
						cout << "Exceeded boundary: " << i << endl;
						std::cout.flush();
						std::_Exit(EXIT_FAILURE);
					}
#endif /*DEBUG*/
				}
#ifdef VERBOSE
				cout << endl;
#endif /*VERBOSE*/

				dimCount += boundaries[j].dim;
			}
		}
		else // Otherwise we pick points in a regular grid.
		{
			// TODO: Add boundary fixing and boundary sets.
			if(startBound)
			{
				remaining = workNumber;
				// Fill in a regular square spacing in the search volume.
				for(int i = 0; i < DIM; i++)
				{
					dimNumber = remaining / (int)pow(NDIMPOINTS, DIM - dimCount);
					remaining = remaining % (int)pow(NDIMPOINTS, DIM - dimCount);
					dimCount++;
					stepScale = (localUpper[i] - localLower[i]) / NDIMPOINTS;

					m_x[i] = localLower[i] + (dimNumber + 0.5) * stepScale;
				}
			}
			else
			{
				if(workNumber > 2 * DIM * (int)pow(NDIMPOINTS, DIM - 1))
				{
					// Inner set
					workNumber -= 2 * DIM * (int)pow(NDIMPOINTS, DIM - 1);
					dim = workNumber / (2 * (int)pow(NDIMPOINTS - 1, DIM - 1));
					workPos = workNumber % (2 * (int)pow(NDIMPOINTS - 1, DIM - 1));

					if(workPos > (int)pow(NDIMPOINTS - 1, DIM - 1))
					{
						// Negative side
						remaining = workPos - (int)pow(NDIMPOINTS - 1, DIM - 1);

						for(int i = 0; i < DIM; i++)
						{
							if(dim == i)
							{
								m_x[i] = localLower[i] - bStepDown[i];
							}
							else
							{
								dimNumber = remaining / (int)pow(NDIMPOINTS - 1, DIM - 1 - dimCount);
								remaining = remaining % (int)pow(NDIMPOINTS - 1, DIM - 1 - dimCount);
								dimCount++;
								stepScale = (localUpper[i] - localLower[i]) / (NDIMPOINTS - 1);

								m_x[i] = localLower[i] + (dimNumber * stepScale - bStepDown[i]);
							}
						}
					}
					else
					{
						// Upper bound side
						remaining = workPos;

						for(int i = 0; i < DIM; i++)
						{
							if(dim == i)
							{
								m_x[i] = localUpper[i] - bStepUp[i];
							}
							else
							{
								dimNumber = remaining / (int)pow(NDIMPOINTS - 1, DIM - 1 - dimCount);
								remaining = remaining % (int)pow(NDIMPOINTS - 1, DIM - 1 - dimCount);
								dimCount++;
								stepScale = (localUpper[i] - localLower[i]) / (NDIMPOINTS - 1);

								m_x[i] = localUpper[i] - (dimNumber * stepScale + bStepUp[i]);
							}
						}
					}
				}
				else
				{
					// Lower bound set
					dim = workNumber / (2 * (int)pow(NDIMPOINTS, DIM - 1));
					workPos = workNumber % (2 * (int)pow(NDIMPOINTS, DIM - 1));

					if(workPos > (int)pow(NDIMPOINTS, DIM - 1))
					{
						// Negative side
						remaining = workPos - (int)pow(NDIMPOINTS, DIM - 1);

						for(int i = 0; i < DIM; i++)
						{
							if(dim == i)
							{
								m_x[i] = localLower[i] - bStepDown[i] / 2;
							}
							else
							{
								dimNumber = remaining / (int)pow(NDIMPOINTS, DIM - 1 - dimCount);
								remaining = remaining % (int)pow(NDIMPOINTS, DIM - 1 - dimCount);
								dimCount++;
								stepScale = (localUpper[i] - localLower[i]) / (NDIMPOINTS);

								m_x[i] = localLower[i] + (dimNumber * stepScale - bStepDown[i] / 2);
							}
						}
					}
					else
					{
						// Upper bound side
						remaining = workPos;

						for(int i = 0; i < DIM; i++)
						{
							if(dim == i)
							{
								m_x[i] = localUpper[i] - bStepUp[i] / 2;
							}
							else
							{
								dimNumber = remaining / (int)pow(NDIMPOINTS, DIM - 1 - dimCount);
								remaining = remaining % (int)pow(NDIMPOINTS, DIM - 1 - dimCount);
								dimCount++;
								stepScale = (localUpper[i] - localLower[i]) / (NDIMPOINTS);

								m_x[i] = localUpper[i] - (dimNumber * stepScale + bStepUp[i] / 2);
							}
						}
					}
				}
			}
		}

		return 0;
	}

	/**
	 *
	 *
	 */
	int getSwarmStartPos(int workNumber)
	{
		int dimCount = 0;

		if(workNumber == 1 && !startBound)
		{
			// TODO: Fix for boundary sets.
			for (int i = 0;i < DIM;i++)
			{
				m_x[i] = bestRes.X[i];

				ini_lower[i] = bestRes.X[i] - POPSPREAD;
				ini_upper[i] = bestRes.X[i] + POPSPREAD;
			}
		}
		else
		{
			// We need to do this for each boundary set. NOTE: There is a higher density of searching in the corners due to overlap. Resolving this is complicated.
			for(int j = 0; j < BSETS; j++)
			{

				int sect = rand() % (2*boundaries[j].dim - (boundaries[j].hasSym ? 1 : 0));
				int upper = sect % 2;
				sect = (sect / 2) + dimCount;

				int fixedCounter = 0;

#ifdef VERBOSE
				cout << "Section is: " << sect << endl;
				cout << "Upper: " << upper << endl;
				cout << "Initial values are " << endl;
#endif /*VERBOSE*/

				/* Initialize the variables. */
				for (int i = dimCount;i < (dimCount + boundaries[j].dim);i++)
				{
					bool fixed = !((bStepDown[i] > EPS && !upper) || (bStepUp[i] > EPS && upper));
					if(sect + fixedCounter == i && !fixed)
					{
						if(upper)
						{
							m_x[i] = (localUpper[i] - POPSPREAD) - (bStepUp[i] - 2*POPSPREAD)*rnd_uni();
							ini_lower[i] = m_x[i] - POPSPREAD;
							ini_upper[i] = m_x[i] + POPSPREAD;
						}
						else
						{
							m_x[i] = (localLower[i] + POPSPREAD) - (bStepDown[i] - 2*POPSPREAD)*rnd_uni();
							ini_lower[i] = m_x[i] - POPSPREAD;
							ini_upper[i] = m_x[i] + POPSPREAD;
						}
					}
					else
					{
						if(fixed)
						{
#ifdef VERBOSE
							cout << "Set fixed" << endl;
#endif /*VERBOSE*/
							fixedCounter++;
							upper = !(upper);
						}

						m_x[i] = (localUpper[i] - localLower[i] - 2*POPSPREAD)*rnd_uni() + localLower[i] + POPSPREAD;
						ini_lower[i] = m_x[i] - POPSPREAD;
						ini_upper[i] = m_x[i] + POPSPREAD;
					}

#ifdef DEBUG
#ifdef VERBOSE
					cout << ", x[" << i << "] = " << m_x[i].to_out_string(5);
#endif /*VERBOSE*/

					if(m_x[i] > localUpper[i] || m_x[i] < localLower[i])
					{
						cout << endl;
						cout << "Exceeded boundary: " << i << endl;
						std::cout.flush();
						std::_Exit(EXIT_FAILURE);
					}
#endif /*DEBUG*/
				}
#ifdef VERBOSE
				cout << endl;
#endif /*VERBOSE*/

				dimCount += boundaries[j].dim;
			}
		}

		return 0;
	}

	int getStartPosition(int workNumber)
	{
		for (int i = 0;i < DIM;i++)
		{
			localLower[i] = lbounds[i];
			localUpper[i] = ubounds[i];
		}

#ifdef VERBOSE
		cout << "Getting start points." << endl;
#endif /*VERBOSE*/
		int ret;
		if(ALGO == 0)
		{
			ret = getSingleStartPos(workNumber);
		}
		else if(ALGO == 1)
		{
			ret = getSwarmStartPos(workNumber);
		}
		else
		{
			ret = -1;
		}

#if defined(TEST_START_POINTS) || defined(OUTPUT_STARTS)
		/* Output the test data */
		ofstream outfile;
		//char str[10];
		//sprintf(str, "%d", threadNum);

		//outfile.open(strcat(strcat("start_points_1", str), ".csv"), ios::app );

		outfile.open("start_points_1.csv", ios::app );

#ifdef VERBOSE
		cout << "Opening output file." << endl;
		cout << "Outputting start points." << endl;
#endif /*VERBOSE*/

		if(NPARAMS > 0)
		{
			outfile << params[0];

			for(int i = 1; i < NPARAMS; i++)
			{
				outfile << "," << params[i];
			}
		}

		for(int i = 0; i < DIM; i++)
		{
			outfile << "," << lbounds[i] << "," << ubounds[i];
		}

		for(int i = 0; i < DIM; i++)
		{
			outfile << "," << m_x[i];
		}

		outfile << endl;

		outfile.close();

#ifdef VERBOSE
		cout << "Finished Outputting start points." << endl;
#endif /*VERBOSE*/

#endif /*TEST_START_POINTS || OUTPUT_STARTS*/
		return ret;
	}

    int run(struct OptimizeResult* result, int workNumber)
    {
        int ret = -1;
        floatval_t fx = MAXSTEP;

#ifdef DETERMINISTIC
		pthread_spin_lock(&workLock);
		int detNum = detDebug++;
		pthread_spin_unlock(&workLock);
		srand(detNum);
#endif /*DETERMINISTIC*/

		ret = getStartPosition(workNumber);

		if(ALGO == 0)
		{
			/*
	            Start the L-BFGS optimization; this will invoke the callback functions
	            lbgfs_evaluate() and progress() when necessary.
	        */
#ifdef OPT_PROGRESS
			if(workNumber % SAMPLE_SPACING == 0)
				ret = lbfgs(DIM, m_x, &fx, localLower, localUpper, params, _lbgfs_evaluate, _progress, this, &wspace);
			else
				ret = lbfgs(DIM, m_x, &fx, localLower, localUpper, params, _lbgfs_evaluate, NULL, this, &wspace);
#else /*OPT_PROGRESS*/
	    	ret = lbfgs(DIM, m_x, &fx, localLower, localUpper, params, _lbgfs_evaluate, NULL, this, &wspace);
#endif /*!OPT_PROGRESS*/

	       /* Report the result. */
#ifdef VERBOSE
	       cout << "L-BFGS optimization terminated with status code = " << ret << endl;
#endif /*VERBOSE*/
	       //cout << "  fx = " << fx.to_out_string(SIGDIG);
		}
		else if(ALGO == 1)
		{
			ret = de(DIM, m_x, &fx, localLower, localUpper, params, _de_evaluate, this, POPSIZE, ini_lower, ini_upper,
				 STRAT, MAXGEN, PARAM_F, PARAM_CR, 0, c, d, oldarray, newarray, swaparray, tmp, best, bestit, energy);

			//cout << "DE optimization terminated with status code = " << ret << endl;
		}
		else
		{
			cout << "Unknown search algorithm." << endl;
		}

#ifdef VERBOSE
		cout << "Final values are";
        for (int i = 0;i < DIM;i++)
        {
			cout << ", x[" << i << "] = " << m_x[i].to_out_string(5);
		}
		cout << endl;
#endif /*VERBOSE*/

        for (int i = 0;i < DIM;i++)
        {
            result->X[i] = m_x[i];
        }
        result->f = fx;

        return ret;
    }

	static floatval_t evaluate(
        const floatval_t *X,
        const floatval_t *params
        )
    {
        floatval_t fx = 0.;

		fx = FUNCTION(X, params);

        return fx;
    }

protected:
    static floatval_t _lbgfs_evaluate(
        void *instance,
        const floatval_t *X,
        const floatval_t *params,
        floatval_t *g,
        const int n,
        const floatval_t step
        )
    {
        return reinterpret_cast<objective_function*>(instance)->lbgfs_evaluate(X, params, g, n, step);
    }

    static floatval_t lbgfs_evaluate(
        const floatval_t *X,
        const floatval_t *params,
        floatval_t *g,
        const int n,
        const floatval_t step
        )
    {
		floatval_t* batch_x;
        floatval_t fx = 0.;
		floatval_t fx_sum = 0.;
		floatval_t* g_sum;

		for(int i=0;i<n;i++)
		{
			g[i] = 0.;
		}

		if(ROBUST)
		{
			batch_x = new floatval_t[DIM];
			g_sum = new floatval_t[DIM];

			for(int i=0;i<n;i++)
			{
				g_sum[i] = 0.;
			}

			for(int i=0;i<SAMPLES;i++)
			{
				for(int j=0;j<n;j++)
				{
					batch_x[j] = X[j] + NOISE * ((floatval_t)rand() / RAND_MAX - 0.5);
				}

				fx = FUNCTION(batch_x, params);

				// Derivatives
				DERIVATIVES(g, batch_x, params, fx, step);

				for(int j=0;j<n;j++)
				{
					g_sum[j] += g[j];
				}

				fx_sum += fx;
			}

			fx = fx_sum / SAMPLES;
			for(int i=0;i<n;i++)
			{
				g[i] = g_sum[i] / SAMPLES;
			}

			delete[] batch_x;
			delete[] g_sum;
		}
		else
		{
			fx = FUNCTION(X, params);

			// Derivatives
			DERIVATIVES(g, X, params, fx, step);

			/*
			cout << "At : ";

			for(int k = 0; k < DIM; k++)
			{
				cout << X[k].to_out_string(7) << " ";
			}

			cout << endl << "Function is: " << fx.to_out_string(7);

			cout << endl << "Dertivatives are: ";
			for(int k = 0; k < DIM; k++)
			{
				cout << g[k].to_out_string(7) << " ";
			}
			cout << endl;

			cout << "Params are : ";

			for(int k = 0; k < NPARAMS; k++)
			{
				cout << params[k].to_out_string(7) << " ";
			}
			cout << endl;
			*/
		}


		//if(abs(fx) < EPS)
        //{
        //    if(fx > 0.)
        //    {
        //        fx = EPS;
        //    }
        //    else
        //    {
        //        fx = -EPS;
        //    }
        //}

		if(fx < 0.0)
			cout << "The cost function was negative!" << endl;

        return fx;
    }

	static floatval_t _de_evaluate(
        void *instance,
        const floatval_t *X,
        const floatval_t *params,
        const int n
        )
    {
        return reinterpret_cast<objective_function*>(instance)->de_evaluate(X, params, n);
    }

    static floatval_t de_evaluate(
        const floatval_t *X,
        const floatval_t *params,
        const int n
        )
    {
		floatval_t* batch_x;
        floatval_t fx = 0.;
		floatval_t fx_sum = 0.;

		if(ROBUST)
		{
			batch_x = new floatval_t[DIM];

			for(int i=0;i<SAMPLES;i++)
			{
				for(int j=0;j<n;j++)
				{
					batch_x[j] = X[j] + NOISE * ((floatval_t)rand() / RAND_MAX - 0.5);
				}

				fx = FUNCTION(batch_x, params);

				fx_sum += fx;
			}

			fx = fx_sum / SAMPLES;

			delete[] batch_x;
		}
		else
		{
			fx = FUNCTION(X, params);
		}

        return fx;
    }

    static int _progress(
        void *instance,
        const floatval_t *x,
        const floatval_t *g,
        const floatval_t fx,
        const floatval_t xnorm,
        const floatval_t gnorm,
        const floatval_t step,
        int n,
        int k,
        int ls
        )
    {
        return reinterpret_cast<objective_function*>(instance)->progress(x, g, fx, xnorm, gnorm, step, n, k, ls);
    }

    int progress(
        const floatval_t *x,
        const floatval_t *g,
        const floatval_t fx,
        const floatval_t xnorm,
        const floatval_t gnorm,
        const floatval_t step,
        int n,
        int k,
        int ls
        )
    {
        cout << "Iteration " << k << ":" << endl;
        cout << "  fx = " << fx.to_out_string(SIGDIG);

		for(int j = 0; j < DIM; j++)
		{
			cout << ", x[" << j << "] = " << x[j].to_out_string(SIGDIG);
		}

        cout << endl;
        cout << "  xnorm = " << xnorm.to_out_string(SIGDIG) << ", gnorm =" << gnorm.to_out_string(SIGDIG);
        cout << ", step = " << step.to_out_string(SIGDIG) << endl;
        cout << endl;

		ofstream outfile;

		outfile.open("progress.csv", ios::app );

		outfile << k << "," << fx.to_out_string(SIGDIG) << ",";
		for(int j = 0; j < DIM; j++)
		{
			outfile << x[j].to_out_string(SIGDIG) << ",";
		}
		for(int j = 0; j < DIM; j++)
		{
			outfile << g[j].to_out_string(SIGDIG) << ",";
		}
		outfile << step.to_out_string(SIGDIG) << "," << ls << endl;

        return 0;
    }
};

#ifdef TEST_START_POINTS
objective_function *objTest;
#endif /*TEST_START_POINTS*/

void castBoundaries(int depth, int dimCount, objective_function *obj, floatval_t* params, floatval_t* Xin, floatval_t* X, floatval_t* best, floatval_t* bestX);

void locCastRecurs(int depth, int locDepth, int dimCount, objective_function *obj, floatval_t* params, floatval_t* Xin, floatval_t* X, floatval_t* best, floatval_t* bestX)
{
	if(locDepth == boundaries[depth].dim)
	{
		castBoundaries(depth + 1, dimCount + boundaries[depth].dim, obj, params, Xin, X, best, bestX);
	}
	else
	{
		X[dimCount + locDepth] = floor(Xin[dimCount + locDepth]);
		locCastRecurs(depth, locDepth + 1, dimCount, obj, params, Xin, X, best, bestX);

		X[dimCount + locDepth] = ceil(Xin[dimCount + locDepth]);
		locCastRecurs(depth, locDepth + 1, dimCount, obj, params, Xin, X, best, bestX);
	}
}

void castBoundaries(int depth, int dimCount, objective_function *obj, floatval_t* params, floatval_t* Xin, floatval_t* X, floatval_t* best, floatval_t* bestX)
{
	if(depth == BSETS)
	{
		floatval_t f = obj->evaluate(X, params);
		if(f < *best)
		{
			*best = f;
			for(int k = 0; k < DIM; k++)
			{
				bestX[k] = X[k];
			}
		}
	}
	else
	{
		if(boundaries[depth].intCast)
		{
			locCastRecurs(depth, 0, dimCount, obj, params, Xin, X, best, bestX);
		}
		else
		{
			for(int i = 0; i < boundaries[depth].dim; i++)
			{
				X[dimCount + i] = Xin[dimCount + i];
			}
			castBoundaries(depth + 1, dimCount + boundaries[depth].dim, obj, params, Xin, X, best, bestX);
		}
	}
}


void *run_multi(void *threadarg)
{
	pthread_mutex_lock(&theadCoordLock);

	int threadNum = threadStartCount++;

	srand((int)time(NULL) ^ (threadNum*(1+nodeNum)));
    objective_function *obj = new objective_function(threadNum);
	struct OptimizeResult locResults;

	bool workDone = false;
	bool exitFlag = true;
	bool mustCast = false;

	int item;
	int numWorks = nruns / nThreads;

	int n;
	int ret;

	floatval_t bestCast;
	floatval_t* bestCastX = new floatval_t[DIM];
	floatval_t* XCast = new floatval_t[DIM];

	if(!obj->initialized)
	{
		delete obj;
		threadError = true;
		pthread_exit(NULL);
		return NULL;
	}

	if(threadNum == nThreads - 1 && nruns % nThreads != 0)
	{
		numWorks = nruns % nThreads;
	}

	locResults.X = new floatval_t[DIM];

	for(int i = 0; i < BSETS; i++)
	{
		if(boundaries[i].intCast)
		{
			mustCast = true;
		}
	}

#ifndef SILENT
	cout << "Thread number " << threadNum << " started." << endl;
#endif /*!SILENT*/
	while(startLatch[threadNum])
	{
		pthread_cond_wait(&threadsStart, &theadCoordLock);
	}
	startLatch[threadNum] = true;
	pthread_mutex_unlock(&theadCoordLock);

	if(threadError)
	{
		delete obj;
		pthread_exit(NULL);
		return NULL;
	}

	while(!finished)
	{
		pthread_spin_lock(&workLock);
		if(workNumber < nruns)
		{
			item = workNumber++;
			exitFlag = false;
		}
		pthread_spin_unlock(&workLock);

		n = 0;
		threadFails[threadNum] = 0;
		threadMinBin[threadNum] = 2<<(BUCKETORD+1);
		for(int i = 0; i < NBINSOUT; i++)
		{
			threadBins[threadNum][i] = 0;
		}

		while(!exitFlag)
		{
			if(threadError)
			{
				delete obj;
				pthread_exit(NULL);
				return NULL;
			}

			ret = obj->run(&locResults, item);

			if(ret < 0)
			{
				if(ret != LBFGSERR_ROUNDING_ERROR || REPORTROUNDING)
				{

					if(REPORTFAILS)
					{
						cout << "Failure code was: " << ret << endl;
					}

					threadFails[threadNum]++;
				}
			}

			if(locResults.f < 0.0)
			{
				cout << "The cost function was negative before cast at: ";

				for(int i = 0; i < DIM; i++)
				{
					cout << locResults.X[i].to_out_string(25) << ",";
				}

				cout << endl;

				cout << "Applying hack to make it 0.0." << endl;

				locResults.f = 0.0;
			}

			if(mustCast)
			{
				bestCast = 1e10;
				castBoundaries(0, 0, obj, params, locResults.X, XCast, &bestCast, bestCastX);

				for(int i = 0; i < DIM; i++)
				{
					locResults.X[i] = bestCastX[i];
				}
				locResults.f = bestCast;
			}

			if(locResults.f < 0.0)
			{
				cout << "About to take negative log." << endl;
				std::_Exit(EXIT_FAILURE);
			}


			floatval_t logRes = log10(locResults.f + EPS);
			int binNum;

			if(logRes > 0)
			{
				binNum = (2<<(BUCKETORD+1)) - 1;
			}
			else if(abs(logRes) > BUCKETORD)
			{
				binNum = 0;
			}
			else
			{
				binNum = to_int(floor((locResults.f / pow(10.0,floor(abs(logRes)))) * (2<<(BUCKETORD - to_int(floor(abs(logRes))))))) + (2<<(BUCKETORD - to_int(floor(abs(logRes))))) - 1;
			}

			if(binNum < threadMinBin[threadNum])
			{
				if(threadMinBin[threadNum] - binNum < NBINSOUT)
				{
					// Shift bins
					for(int i = 0; i < NBINSOUT; i++)
					{
						if((i + threadMinBin[threadNum] - binNum) < NBINSOUT)
						{
							threadBins[threadNum][i] = threadBins[threadNum][i + threadMinBin[threadNum] - binNum];
						}
						else
						{
							threadBins[threadNum][i] = 0;
						}
					}
				}
				else
				{
					// Reset bins
					for(int i = 0; i < NBINSOUT; i++)
					{
						threadBins[threadNum][i] = 0;
					}
				}
				threadMinBin[threadNum] = binNum;
				threadBins[threadNum][0]++;
				//cout << "Setting thread minimum bin to: " << binNum << endl;
			}
			else if(binNum - threadMinBin[threadNum] < NBINSOUT)
			{
				threadBins[threadNum][binNum - threadMinBin[threadNum]]++;
			}

			if(locResults.f < results[threadNum].f)
			{
				for(int i = 0; i < DIM; i++)
				{
					results[threadNum].X[i] = locResults.X[i];
				}
				results[threadNum].f = locResults.f;
			}

#ifdef USE_MPI
			if(threadNum == 0)
			{
				int threadsChange = 0;
				int mpierr = MPI_SUCCESS;

				if(nodeNum == 0)
				{
					// Just lock and update globals with this nodes change.
					pthread_spin_lock(&workLock);
					threadsChange = workNumber - pWorkNumber;
					pWorkNumber = workNumber;
					(*globalNRuns) += threadsChange;
					workNumber = (*globalNRuns);
					pthread_spin_unlock(&workLock);
				}
				else
				{
					// Determine our change since last global update.
					pthread_spin_lock(&workLock);
					threadsChange = workNumber - pWorkNumber;
					pWorkNumber = workNumber;
					pthread_spin_unlock(&workLock);

					// Make global update.
					mpierr = MPI_Fetch_and_op(&threadsChange, globalNRuns, MPI_INT, 0, nodeNum, MPI_SUM, m_state_window);
					if(!checkMPIError(mpierr))
						return NULL;

					// Now update us based on the global changes and changes while we waited for global update.
					// This stops us spin locking over the MPI comm which would be bad.
					(*globalNRuns) += threadsChange;
					pthread_spin_lock(&workLock);
					threadsChange = workNumber - pWorkNumber;
					(*globalNRuns) += threadsChange;
					workNumber = (*globalNRuns);
					pthread_spin_unlock(&workLock);

				}
			}
#endif /*USE_MPI*/

			pthread_spin_lock(&workLock);
			if(workNumber < nruns)
				item = workNumber++;
			else
				exitFlag = true;
			pthread_spin_unlock(&workLock);
		}

		pthread_mutex_lock(&theadCoordLock);
		threadsDone++;
		if(threadsDone >= (nThreads))
		{
#ifndef SILENT
			cout << "Signalling threads complete...." << endl;
#endif /*!SILENT*/
			pthread_cond_signal(&threadsComplete);
		}
		while(startLatch[threadNum])
		{
			pthread_cond_wait(&threadsStart, &theadCoordLock);
		}
		startLatch[threadNum] = true;
		pthread_mutex_unlock(&theadCoordLock);
	}

	delete[] bestCastX;
	delete[] XCast;
	delete[] locResults.X;
	delete obj;
	pthread_exit(NULL);
	return NULL;
}

int find_minima(struct OptimizeResult* bestResult, struct OptimizeResult* prevBest)
{
	ofstream outfile;
	floatval_t best;
	floatval_t* bestX;
	floatval_t avRes = 0.0;
	floatval_t stdDev = 0.0;
	int nClose = 0;
	int* binsOut = new int[NBINSOUT];
	int lBin = 2<<(BUCKETORD+1);
	int fails = 0;

#ifdef TEST_START_POINTS
	srand((int)time(NULL));

	for(int item = 0; item < NRUNS; item++)
	{
		objTest->getStartPosition(item);
	}

	delete[] binsOut;
	return;
#endif /*TEST_START_POINTS*/

	for(int i=0; i<NBINSOUT; i++)
	{
		binsOut[i] = 0;
	}

	for(int i=0; i<nThreads; i++)
	{
		results[i].f = 1e10;
	}

	// Reset threads.
	pthread_mutex_lock(&theadCoordLock);
	pthread_spin_lock(&workLock);
	workNumber = 0;
	threadsDone = 0;

#ifdef USE_MPI
	int mpierr = MPI_SUCCESS;
	pWorkNumber = 0;
#endif /*USE_MPI*/

	pthread_spin_unlock(&workLock);
	for(int i = 0; i < nThreads; i++)
	{
		startLatch[i] = false;
	}
	pthread_cond_broadcast(&threadsStart);

#ifndef SILENT
	cout << "Waiting for threads to finish..." << endl;
#endif /*!SILENT*/

	while((threadsDone < (nThreads)))
	{
		pthread_cond_wait(&threadsComplete, &theadCoordLock);
	}
	pthread_mutex_unlock(&theadCoordLock);

#ifndef SILENT
	cout << "Finished threads." << endl;
#endif /*!SILENT*/

	bestResult->f = 1e10;

	for(int i=0; i<(nThreads); i++)
	{
#ifndef SILENT
		cout << "Thread " << i << " result is: " << results[i].f.to_out_string(4);
		cout << " at: ";

		for(int k = 0; k < DIM; k++)
		{
			cout << results[i].X[k].to_out_string(4) << " ";
		}
		cout << endl;
#endif /*!SILENT*/

		best = results[i].f;
		bestX = results[i].X;

		if(i == 0 || best < bestResult->f)
		{
			bestResult->f = best;

			for(int k = 0; k < DIM; k++)
			{
				bestResult->X[k] = bestX[k];
			}
		}

		/* Calculate statistics results. */
		fails += threadFails[i];

#ifndef SILENT
		cout << "Thread minimum bin is: " << threadMinBin[i] << endl;
#endif /*!SILENT*/

		if(lBin > threadMinBin[i])
		{
			for(int j = 0; j < NBINSOUT; j++)
			{
				if((j + lBin - threadMinBin[i]) < NBINSOUT)
				{
					binsOut[j + lBin - threadMinBin[i]] = binsOut[j];
					binsOut[j] = 0;
				}

				binsOut[j] += threadBins[i][j];
			}
			lBin = threadMinBin[i];
		}
		else
		{
			for(int j = threadMinBin[i] - lBin; j < NBINSOUT; j++)
			{
				binsOut[j] += threadBins[i][j - (threadMinBin[i] - lBin)];
			}
		}
	}

#ifndef SILENT
	cout << "Finished working results." << endl;
	cout << "Finalising statistics." << endl;
#endif /*!SILENT*/

#ifdef USE_MPI
	if(nodeNum == 0)
	{
		bool waitingForNodes = true;
		int nodesDone = 1;
		bool* nodeDone = new bool[num_nodes];
		for(int i = 1; i < num_nodes; i++)
		{
			nodeDone[i] = false;
		}

		// When this is the master check to see if other nodes are ready.
		while(waitingForNodes)
		{
			for(int i = 1; i < num_nodes; i++)
			{
				if(!nodeDone[i])
				{
					// Check to see if this node has posted a ready result.
					mpierr = MPI_Get(readyForCollection, 1, MPI_INT, i, bucketNum, 1, MPI_INT, s_state_window);
					if(readyForCollection[0])
					{
						// Get node result
						mpierr = MPI_Get(nodeBest, 1, MPI_FLOATVAL_T, i, bucketNum, 1, MPI_FLOATVAL_T, res_window);
						if(!checkMPIError(mpierr))
							return -1;
						mpierr = MPI_Get(nodeX, DIM, MPI_FLOATVAL_T, i, 2 + bucketNum*DIM, DIM, MPI_FLOATVAL_T, res_window);
						if(!checkMPIError(mpierr))
							return -1

						mpierr = MPI_Get(nodeFails, 1, MPI_INT, i, bucketNum, 1, MPI_INT, stats_window);
						if(!checkMPIError(mpierr))
							return -1;
						mpierr = MPI_Get(nodeLowestBin, 1, MPI_INT, i, 2 + bucketNum, 1, MPI_INT, stats_window);
						if(!checkMPIError(mpierr))
							return -1;
						mpierr = MPI_Get(nodeBins, 1, MPI_INT, i, 2 + bucketNum, 1, MPI_INT, stats_window);
						if(!checkMPIError(mpierr))
							return -1;

						nodesDone++;
						nodeDone[i] = true;

						// Reset threads pickup
						mpierr = MPI_Put(&falseReady, 1, MPI_INT, i, bucketNum, 1, MPI_INT, s_state_window);
						if(!checkMPIError(mpierr))
							return -1;

						// Compare and set results.
						if(nodeBest[0] < bestResult->f)
						{
							bestResult->f = nodeBest[0];

							for(int k = 0; k < DIM; k++)
							{
								bestResult->X[k] = nodeX[0][k];
							}
						}

						fails += nodeFails[0];

						// Compare and set stats.
						if(lBin > nodeLowestBin[0])
						{
							for(int j = 0; j < NBINSOUT; j++)
							{
								if((j + lBin - nodeLowestBin[0]) < NBINSOUT)
								{
									binsOut[j + lBin - nodeLowestBin[0]] = binsOut[j];
									binsOut[j] = 0;
								}

								binsOut[j] += nodeBins[0][j];
							}
							lBin = nodeLowestBin[0];
						}
						else
						{
							for(int j = nodeLowestBin[0] - lBin; j < NBINSOUT; j++)
							{
								binsOut[j] += nodeBins[0][j - (nodeLowestBin[0] - lBin)];
							}
						}
					}
				}
			}

			if(nodesDone >= num_nodes)
			{
				waitingForNodes = false;
			}
		}

		// Set bucket to clear.
		globalNRuns[bucketNum] = 0;
		currentCollectionID[bucketNum] += 2;
		bucketNum = bucketNum ^ 1;
		delete[] nodeDone;
#endif /*USE_MPI*/
		/* Output the search statistics */
		outfile.open("stats.csv", ios::app );

		outfile << workNumber << "," << fails;
		if(prevBest->f > bestResult->f)
			outfile << ",1,";
		else
			outfile << ",0,";
		outfile << lBin << "," << binsOut[0];

		for(int i = 1; i < NBINSOUT; i++)
		{
			outfile << "," << binsOut[i];
		}

		outfile << endl;

		outfile.close();

#ifdef USE_MPI
	}
	else
	{
		// Wait for bucket to be open for results.
		int hostCollectionID = -1;
		bool waiting = true;
		while(waiting)
		{
			// Check to see if we are ready to collect the right collectionID
			mpierr = MPI_Get(&hostCollectionID, 1, MPI_INT, 0, 2 + bucketNum, 1, MPI_INT, m_state_window);
			if(!checkMPIError(mpierr))
				return;

			if(hostCollectionID == collectionID)
			{
				waiting = false;
			}
		}

		// Put our results ready for the master and indicate it's ready for pick up.
		nodeBest[bucketNum] = bestResult->f;
		for(int i = 0; i < DIM; i++)
		{
			nodeX[bucketNum][i] = bestResult->X[i];
		}

		nodeFails[bucketNum] = fails;
		nodeLowestBin[bucketNum] = lBin;
		for(int i = 0; i < NBINSOUT; i++)
		{
			nodeBins[bucketNum][i] = binsOut[i];
		}

		readyForCollection[bucketNum] = true;
		collectionID++;
		// Alternate bucket. bucketNum XOR bucketNum
		bucketNum = bucketNum ^ 1;
	}
#endif /*USE_MPI*/

#ifndef SILENT
	cout << "Finished working statistics." << endl;
#endif /*!SILENT*/

	delete[] binsOut;

	return 0;
}

void runExperiment(struct OptimizeResult* prevBest)
{
	ofstream outfile;
    struct OptimizeResult bestRun;
	floatval_t best;
	floatval_t* bestX = new floatval_t[DIM];
	bestRun.X = new floatval_t[DIM];

#ifndef SILENT
    cout << "---------Starting test---------" << endl;
#endif /*!SILENT*/

    find_minima(&bestRun, prevBest);

#ifndef SILENT
    cout << "---------Finished test---------" << endl;
#endif /*!SILENT*/

#ifndef TEST_START_POINTS

#ifndef SILENT
	cout << "Best result is: " << bestRun.f.to_out_string(4);
	cout << " at: ";

	for(int k = 0; k < DIM; k++)
	{
		cout << bestRun.X[k].to_out_string(4) << " ";
	}
	cout << endl;
#endif /*!SILENT*/


    best = bestRun.f;
	for(int k = 0; k < DIM; k++)
	{
		bestX[k] = bestRun.X[k];
	}

	if(BOUNDED)
	{
		if(best < prevBest->f)
		{
			prevBest->f = best;
			for(int k = 0; k < DIM; k++)
			{
				prevBest->X[k] = bestX[k];
			}
		}
		else
		{
			best = prevBest->f;
			for(int k = 0; k < DIM; k++)
			{
				bestX[k] = prevBest->X[k];
			}
		}
	}

	if(nodeNum == 0)
	{

#ifndef SILENT
		cout << "Best result now: " << best.to_out_string(4);
		cout << " at: ";

		for(int k = 0; k < DIM; k++)
		{
			cout << bestX[k].to_out_string(4) << " ";
		}
		cout << endl;
#endif /*!SILENT*/

		outfile.open("results.csv", ios::app );

	    if(NPARAMS > 0)
	    {
	        outfile << params[0].to_out_string(4);

	        for(int i=1; i<NPARAMS; i++)
	        {
	            outfile << "," << params[i].to_out_string(4);
	        }

	        outfile << ",";
	    }

	    if(BOUNDED)
	    {
	        outfile << lbounds[0].to_out_string(4) << "," << ubounds[0].to_out_string(4);
	        for(int k = 1; k < DIM; k++)
	        {
	            outfile << "," << lbounds[k].to_out_string(4) << "," << ubounds[k].to_out_string(4);
	        }
	        outfile << ",";
	    }

		EXTRAOUT

		outfile << "," << best.to_out_string(SIGDIG);

	    for(int k = 0; k < DIM; k++)
	    {
	        outfile << "," << bestX[k].to_out_string(SIGDIG);
	    }

	    outfile << endl;

	    outfile.close();
	}
#endif /*!TEST_START_POINTS*/

	delete[] bestRun.X;
	delete[] bestX;
}

int getMult(int depth)
{
	int mult = 1;
	for(int i = depth + 1; i < BSETS; i++)
	{
		mult *= (boundaries[i].steps + 1);
	}
	return mult;
}

void getAdjacentRes(int depth, int* bState, floatval_t** pBest, floatval_t*** pPoint, struct OptimizeResult* res)
{
#ifndef SILENT
	cout << "Getting adjacent result." << endl;
#endif /*!SILENT*/

	if(boundaries[depth].steps > 0)
	{
		floatval_t* depthRes = pBest[depth];
		floatval_t** depthP = pPoint[depth];

		int index = 0;

		for(int i = depth + 1; i < BSETS; i++)
		{
			index += getMult(i) * bState[i];
		}

#ifndef SILENT
		cout << "Index now is: " << index << endl;
#endif /*!SILENT*/

		res->f = depthRes[index];
		for(int k = 0; k < DIM; k++)
		{
			res->X[k] = depthP[index][k];
		}

#ifndef SILENT
		cout << "Got it, it was: " << res->f << endl;
#endif /*!SILENT*/
	}
	else
	{
		res->f = 1e10;
#ifndef SILENT
		cout << "Only 1 item in this layer so ignore." << endl;
#endif /*!SILENT*/
	}
}

int boundaryRecursion(int depth, int dimCount, int* bState, floatval_t** pBest, floatval_t*** pPoint, bool isStart)
{
#ifndef SILENT
	cout << "Running Boundary Recursion." << endl;
#endif /*!SILENT*/
	int mult = 1;

	if(depth == 0)
	{
		bestRes.f = 1e10;
		bestRes.X = new floatval_t[DIM];
		ubounds = new floatval_t[DIM];
        lbounds = new floatval_t[DIM];
	}

	if(BOUNDED)
	{
		if(depth == BSETS)
		{
#ifdef TEST_START_POINTS
			runExperiment(&bestRes);
			return mult;
#else /*TEST_START_POINTS*/

#ifndef SILENT
			for(int k = 0; k < DIM; k++)
			{
				cout << "Boundaries for dimension " << k << " lower: ";
				cout << lbounds[k].to_out_string(4) << " upper: ";
				cout << ubounds[k].to_out_string(4) << endl;
			}
#endif /*!SILENT*/

			struct OptimizeResult res;
			res.X = new floatval_t[DIM];
			floatval_t currBest = 1e10;
			floatval_t* point;

#ifndef SILENT
			int stepCount = 1;

			cout << "Before getting bests: " << endl;
			for(int i = BSETS - 1; i >= 0; i--)
			{
				for(int j = 0; j < stepCount; j++)
				{
					cout << pBest[i][j].to_out_string(4) << ", ";
				}
				stepCount *= (boundaries[i].steps + 1);
				cout << endl;
			}

			cout << "Getting adjacent results." << endl;
#endif /*!SILENT*/

			for(int j = 0; j < BSETS; j++)
			{
				// Only get layer previous result when we aren't at the start of that layer.
				if(bState[j] > 0)
				{
					getAdjacentRes(j, bState, pBest, pPoint, &res);
#ifndef SILENT
					cout << "Post function, it was: " << res.f << endl;
#endif /*!SILENT*/
					if(res.f < currBest)
					{
						currBest = res.f;
						point = res.X;
					}
				}
				else
				{
					point = res.X;
				}
			}

#ifndef SILENT
			cout << "Setting Bests, current best is: " << currBest.to_out_string(4) << endl;
#endif /*!SILENT*/

			bestRes.f = currBest;
			for(int k = 0; k < DIM; k++)
			{
				bestRes.X[k] = point[k];
			}

			delete[] res.X;

			if(isStart && !RANDOMSEARCH)
			{
				if(2 * DIM * pow(NDIMPOINTS, DIM - 1) + 2 * DIM * pow(NDIMPOINTS - 1, DIM - 1) > workNumber)
				{
					workNumber = 2 * DIM * pow(NDIMPOINTS, DIM - 1) + 2 * DIM * pow(NDIMPOINTS - 1, DIM - 1);
				}

				nruns = 2 * DIM * pow(NDIMPOINTS, DIM - 1) + 2 * DIM * pow(NDIMPOINTS - 1, DIM - 1);

				startBound = false;
			}

#ifdef DYNDENSITY
			nruns = DYNDENSITY;
#endif /*DYNDENSITY*/

#ifndef SILENT
			cout << "Running experiment." << endl;
#endif /*!SILENT*/
			runExperiment(&bestRes);
#ifndef SILENT
			cout << "Finished experiment." << endl;
#endif /*!SILENT*/

			pBest[BSETS - 1][0] = bestRes.f;
			for(int k = 0; k < DIM; k++)
			{
				pPoint[BSETS - 1][0][k] = bestRes.X[k];
			}
#endif /*!TEST_START_POINTS*/
		}
		else
		{
#ifndef SILENT
			cout << "Boundary start at boundary set: " << depth << " is: " << bState[depth] << endl;
#endif /*!SILENT*/

			for(int i = bState[depth]; i <= boundaries[depth].steps; i++)
	    	{
				bState[depth] = i;
				for(int j = 0; j < boundaries[depth].dim; j++)
				{
					lbounds[j + dimCount] = boundaries[depth].startLower + boundaries[depth].incrementLower * i;
					ubounds[j + dimCount] = boundaries[depth].startUpper + boundaries[depth].incrementUpper * i;

					if(boundaries[depth].hasSym && j == 0)
					{
						lbounds[j + dimCount] = 0.0;
					}
				}

				mult = boundaryRecursion(depth + 1, dimCount + boundaries[depth].dim, bState, pBest, pPoint, i == 0);

#ifndef TEST_START_POINTS
				// Copy results to layer below.
				if(BSETS > 1 && depth > 0)
				{
					floatval_t* nextLevelBest = pBest[depth];
					floatval_t** nextLevelPoint = pPoint[depth];
					floatval_t* levelBest = pBest[depth - 1];
					floatval_t** levelPoint = pPoint[depth - 1];

					for(int j = 0; j < mult; j++)
					{
						levelBest[i*mult + j] = nextLevelBest[j];
						for(int k = 0; k < DIM; k++)
						{
							levelPoint[i*mult + j][k] = nextLevelPoint[j][k];
						}
					}
				}
#endif /*!TEST_START_POINTS*/
			}
			bState[depth] = 0;
			mult *= (boundaries[depth].steps + 1);

#ifndef TEST_START_POINTS
			int stepCount = 1;
#ifndef SILENT
			cout << "After propagating bests: " << endl;
			for(int i = BSETS - 1; i >= 0; i--)
			{
				for(int j = 0; j < stepCount; j++)
				{
					cout << pBest[i][j].to_out_string(4) << ", ";
				}
				stepCount *= (boundaries[i].steps + 1);
				cout << endl;
			}
#endif /*!SILENT*/
#endif /*!TEST_START_POINTS*/
		}
	}
	else
    {
        runExperiment(&bestRes);
    }

	if(depth == 0)
	{
		delete[] bestRes.X;
		delete[] ubounds;
		delete[] lbounds;
	}

	return mult;
}

void parameterRecursion(int depth, int* paramState, int* bState, floatval_t** pBest, floatval_t*** pPoint)
{
#ifndef SILENT
	cout << "Running Parameter Recursion." << endl;
#endif /*!SILENT*/

    if(depth == NPARAMS)
    {
#ifdef PARAMSCONSTSCOUNT
			PARAMCOMPUTE(params);
#endif /*PARAMSCONSTSCOUNT*/

        boundaryRecursion(0, 0, bState, pBest, pPoint, false);
		bState[0] = 0;
		pBest[BSETS - 1][0] = 1e10;
    }
    else
    {
		// This may seem hanky, but we use function pointers stored by the function.h file. This allows for conditions dependent on previous parameters.
        parameter_t currentParam  = parameters[depth];
        for(int i=paramState[depth]; i <= (*(currentParam.steps))(params, depth); i++)
        {
            params[depth] = (*(currentParam.get))(i, params, depth);

#ifndef SILENT
			cout << "Parameter at: " << depth << " is: " << params[depth].to_out_string(4) << endl;
#endif /*!SILENT*/

            parameterRecursion(depth + 1, paramState, bState, pBest, pPoint);
        }
		paramState[depth] = 0;
    }
}

bool skipBackLine(ifstream* infile)
{
	infile->seekg(-2,ios_base::cur);

	int count = 0;
	while(true)
	{
		char ch;
		infile->get(ch);                         	// Get current byte's data

		if((int)infile->tellg() <= 1)
		{             								// If the data was at or before the 0th byte
			infile->seekg(0);
			return true;
		}
		else if(ch == '\n')
		{
			// If the data was a newline
			if(count > 0)
			{
				return false;						// Stop at the current position.
			}
			else
			{
				count++;
				infile->seekg(-2,ios_base::cur);
			}
		}
		else
		{                                 			// If the data was neither a newline nor at the 0 byte
			infile->seekg(-2,ios_base::cur);		// Move to the front of that data, then to the front of the data before it
		}
	}
}

void getLineResult(string line, struct OptimizeResult* res)
{
	istringstream iss(line);
	string s;
	for(int i = 0; i < NPARAMS + 2*DIM + NEXTRADATA; i++)
	{
		getline( iss, s, ',' );
	}

	getline( iss, s, ',' );
	res->f = floatval_t(s.c_str());
	for(int i = 0; i < DIM; i++)
	{
		getline( iss, s, ',' );
		res->X[i] = floatval_t(s.c_str());
	}
}

bool setFileToLastLine(ifstream* infile)
{
	infile->seekg(-1,ios_base::end);             // go to one spot before the EOF

	int count = 0;
	while(true)
	{
		char ch;
		infile->get(ch);                         // Get current byte's data

		if((int)infile->tellg() <= 1)
		{             							// If the data was at or before the 0th byte
			infile->seekg(0);                    // The first line is the last line

			if(count == 0)
				return false;

			return true;
		}
		else if(ch == '\n')
		{
			// If the data was a newline
			if(count > 0)
			{
				return true;
			}
			else
			{
				count++;
				infile->seekg(-2,ios_base::cur);
			}
		}
		else
		{                                 			// If the data was neither a newline nor at the 0 byte
			infile->seekg(-2,ios_base::cur);		// Move to the front of that data, then to the front of the data before it
		}
	}
}

void getPrevResuts(ifstream* infile, int* bState, floatval_t** pBest, floatval_t*** pPoint)
{
	int dimSize = 1;
	bool startReached = false;
	bool usePrev = false;
	if(infile->is_open())
	{
		struct OptimizeResult res;
		res.X = new floatval_t[DIM];

#ifndef SILENT
		cout << "Previous results are: " << endl;
#endif /*!SILENT*/

		for(int i = BSETS - 1; i >= 0; i--)
		{
			startReached = false;

			floatval_t* dimPBest = pBest[i];
			floatval_t** dimPPoint = pPoint[i];

			setFileToLastLine(infile);

			for(int j = dimSize - 1; j >= 0; j--)
			{
				if(startReached)
				{
#ifndef SILENT
					cout << "Hit the start" << endl;
#endif /*!SILENT*/
				}
				else
				{
					if(j < dimSize - 1)
					{
						startReached = skipBackLine(infile);
						if((int)infile->tellg() <= 1)
						{
#ifndef SILENT
							cout << "Hit the start" << endl;
#endif /*!SILENT*/
							startReached = true;
						}
					}

					string lastLine;
					// Read the current line
					getline(*infile,lastLine);
					getLineResult(lastLine, &res);

					//  Wrap the result into the right index.
					int index = (bState[i + 1] + j) % dimSize;

					dimPBest[index] = res.f;
					floatval_t* newX = dimPPoint[index];

					for(int k = 0; k < DIM; k++)
					{
						newX[k] = res.X[k];
					}

#ifndef SILENT
					cout << ", " << res.f.to_out_string(4);
#endif /*!SILENT*/
				}
			}

			cout << endl;

			dimSize *= (boundaries[i].steps + 1);
#ifndef SILENT
			cout << "Dim size is now: " << dimSize << endl;
#endif /*!SILENT*/
		}

		delete[] res.X;
	}
	else
	{
		// TODO: SOME ERROR.
	}
}

int main(int argc, char **argv)
{
    int threadReturn;
	floatval_t* pParams;

	int ierr, my_id;

	num_nodes = 1;

#ifdef USE_MPI
	falseReady = false;
	bucketNum = 0;
	collectionID = 0;

	ierr = MPI_Init(&argc, &argv);
	if(!checkMPIError(ierr))
		return 0;
	ierr = MPI_Comm_rank(MPI_COMM_WORLD, &nodeNum);
	if(!checkMPIError(ierr))
		return 0;
  	ierr = MPI_Comm_size(MPI_COMM_WORLD, &num_nodes);
	if(!checkMPIError(ierr))
		return 0;


	ierr = floatval_t_MPI_Datatype(&MPI_FLOATVAL_T);
	if(!checkMPIError(ierr))
		return 0;
	ierr = MPI_Type_commit(&MPI_FLOATVAL_T);
	if(!checkMPIError(ierr))
		return 0;

	// Global states (master keeps)
	ierr = MPI_Alloc_mem(4*sizeof(int), MPI_INFO_NULL, m_state);
	if(!checkMPIError(ierr))
		return 0;
	globalNRuns = &m_state[0];
	currentCollectionID = &m_state[2];

	// Slave states
	ierr = MPI_Alloc_mem(2*sizeof(int), MPI_INFO_NULL, s_state);
	if(!checkMPIError(ierr))
		return 0;
	readyForCollection = s_state;

	// Slave results
	ierr = MPI_Alloc_mem(2*(1+DIM)*sizeof(floatval_t), MPI_INFO_NULL, s_res);
	if(!checkMPIError(ierr))
		return 0;
	nodeBest = &s_res[0];
	nodeX = new floatval_t*[2];
	nodeX[0] = &s_res[2];
	nodeX[1] = &s_res[2 + DIM];

	// Slave stats
	ierr = MPI_Alloc_mem(2*(2+NBINSOUT)*sizeof(int), MPI_INFO_NULL, s_stats);
	if(!checkMPIError(ierr))
		return 0;
	nodeFails = &s_stats[0];
	nodeLowestBin = &s_stats[2];
	nodeBins = new int*[2];
	nodeBins[0] = &s_stats[4];
	nodeBins[1] = &s_stats[4 + NBINSOUT];

	ierr = MPI_Win_create(&m_state, 4*sizeof(int), sizeof(int), MPI_INFO_NULL, MPI_COMM_WORLD, &m_state_window);
	if(!checkMPIError(ierr))
		return 0;
	ierr = MPI_Win_create(&s_state, 2*sizeof(int), sizeof(int), MPI_INFO_NULL, MPI_COMM_WORLD, &s_state_window);
	if(!checkMPIError(ierr))
		return 0;
	ierr = MPI_Win_create(&s_stats, 2*(2+NBINSOUT)*sizeof(int), sizeof(int), MPI_INFO_NULL, MPI_COMM_WORLD, &stats_window);
	if(!checkMPIError(ierr))
		return 0;
	ierr = MPI_Win_create(&s_res, 2*(1+DIM)*sizeof(floatval_t), sizeof(floatval_t), MPI_INFO_NULL, MPI_COMM_WORLD, &res_window);
	if(!checkMPIError(ierr))
		return 0;

#endif /*USE_MPI*/

#ifdef USEMP
		mp::mp_init(NDIGITS);
#endif /*USEMP*/

#ifndef SILENT
	cout << "Rand max is: " << RAND_MAX << endl;
#endif /*!SILENT*/

	workNumber = pow(NDIMPOINTS, DIM);
	if(DIMSCALE)
	{
		nruns = pow(NDIMPOINTS, DIM);
	}
	else
	{
		nruns = NRUNS;
	}
    params = new floatval_t[NPARAMS];
    parameters = new parameter_t[NPARAMS];
    boundaries = new boundary_t[BSETS];

    BOUNDS
    //cout << "Finished bounds." << endl;
    PARAMETERS

    ifstream infile;
	bool gotLastLine = false;
	string lastLine;

	infile.open("results.csv", std::ifstream::in );
	if(infile.is_open())
	{
        gotLastLine = setFileToLastLine(&infile);

        getline(infile,lastLine);                   // Read the current line
        infile.close();
    }

	int paramState[NPARAMS];
	int bState[BSETS];


	floatval_t** pBest = new floatval_t*[BSETS];
	floatval_t*** pPoint = new floatval_t**[BSETS];

	int stepCount = 1;

	for(int i = BSETS - 1; i >= 0; i--)
	{
		pBest[i] = new floatval_t[stepCount];
		pPoint[i] = new floatval_t*[stepCount];
		for(int j = 0; j < stepCount; j++)
		{
			pPoint[i][j] = new floatval_t[DIM];
		}
		stepCount *= (boundaries[i].steps + 1);
	}

	for(int i = 0; i < NPARAMS; i++)
	{
		paramState[i] = 0;
	}

	for(int i = 0; i < BSETS; i++)
	{
		bState[i] = 0;
	}

#ifdef TEST_START_POINTS
	objTest = new objective_function(0);
#else /*TEST_START_POINTS*/
	ofstream outfile;
	outfile.open("header.txt", ios::app );

    char buff[DTTMSZ];
	time_t t = time(0);
    strftime(buff, DTTMSZ, DTTMFMT, localtime (&t));

	if(gotLastLine)
	{
		infile.open("results.csv", std::ifstream::in );
		if(infile.is_open())
		{
#ifndef SILENT
			cout << "Found previous results." << endl;
		 	cout << lastLine.c_str() << endl;
#endif /*!SILENT*/
	  		istringstream iss(lastLine);
			string s;
			pParams = new floatval_t[NPARAMS];
			for(int i = 0; i < NPARAMS; i++)
			{
				getline( iss, s, ',' );

				floatval_t param = floatval_t(s.c_str());
				pParams[i] = param;
				parameter_t currentParam  = parameters[i];

				int iteration = (*(currentParam.findPos))(param,pParams,i);

				paramState[i] = iteration;
#ifndef SILENT
				cout << iteration << endl;
#endif /*!SILENT*/
			}
			delete[] pParams;

			for(int i = 0; i < BSETS; i++)
			{
				bool bSetComplete = false;
				int bDims = boundaries[i].dim;
				for(int j = 0; j < bDims; j++)
				{
					getline( iss, s, ',' );
					getline( iss, s, ',' );
					if(!bSetComplete)
					{
						floatval_t bound = floatval_t(s.c_str());
						int iteration = 0;
						if((bound - boundaries[i].startUpper) > EPS)
						{
							iteration = to_int(nint((bound - boundaries[i].startUpper) / boundaries[i].incrementUpper));
						}

						bSetComplete = true;
						bState[i] = iteration;

#ifndef SILENT
						cout << "Read Bount as: " << bound.to_out_string(4) << endl;
						cout << "Upper start: " << boundaries[i].startUpper.to_out_string(4) << endl;
						cout << "Upper increment: " << boundaries[i].incrementUpper.to_out_string(4) << endl;
						cout << iteration << endl;
#endif /*!SILENT*/
					}
				}
			}

			// We want to process the very next item.
			bState[BSETS - 1]++;


			getPrevResuts(&infile, bState, pBest, pPoint);
			infile.close();
		}

		outfile << "=======================================================================================================================" << endl;
		outfile << "Resuming previous experiment: " << EXPNAME << endl;
		outfile << "Date Created: " << EXPDATE << endl;
		outfile << "Time Resumed: " << buff << endl;

		if(NPARAMS > 0)
		{
			outfile << "Parameter start iterations: ";

			outfile << paramState[0];
			for(int i = 1; i < NPARAMS; i++)
			{
				outfile << ',' << paramState[i];
		  	}

			outfile << endl;
		}

		outfile << "Boundary start iterations: ";
		outfile << bState[0];
		for(int i = 1; i < BSETS; i++)
		{
			outfile << ',' << bState[i];
		}
		outfile << endl;
		outfile << "=======================================================================================================================" << endl;
	}
	else
	{
		pBest[BSETS - 1][0] = 1e10;

		outfile << "=======================================================================================================================" << endl;
		outfile << "Running expermiment: " << EXPNAME << endl;
		outfile << "Date Created: " << EXPDATE << endl;
		outfile << "Time Run: " << buff << endl;
		outfile << "Parameters: " << EXPPARAMETERS << endl;
		outfile << "Format: " << EXPFORMAT << endl;
		outfile << "=======================================================================================================================" << endl;
	}

    outfile.close();

	nThreads = get_nprocs();

#ifdef OPT_PROGRESS
	nThreads = 1;
#endif /*OPT_PROGRESS*/

    pthread_spin_init(&workLock, PTHREAD_PROCESS_PRIVATE);
	pthread_mutex_init(&theadCoordLock, NULL);
	pthread_cond_init(&threadsStart, NULL);
	pthread_cond_init(&threadsComplete, NULL);

#ifndef SILENT
	cout << "Number of threads on this node: " << nThreads << endl;
#endif /*!SILENT*/

	threadPool = new pthread_t[nThreads];

	threadMinBin = new int[nThreads];
	threadBins = new int*[nThreads];
	threadFails = new int[nThreads];

	startLatch = new bool[nThreads];

	results = new OptimizeResult[nThreads];
    for(int i=0; i<(nThreads); i++)
	{
        results[i].X = new floatval_t[DIM];
		threadBins[i] = new int[NBINSOUT];
		startLatch[i] = true;
    }

#ifndef SILENT
    cout << "Starting threads...." << endl;
#endif /*!SILENT*/

	for(int i=0; i<(nThreads); i++)
	{
		int threadNum = i;
		threadReturn = pthread_create(&threadPool[i], NULL, run_multi, &threadNum);
		if(threadReturn)
		{
			cout << "Error: Unable to create thread: " << threadReturn << endl;
			return -1;
		}
	}

	bool ready = false;
	while(!ready)
	{
		pthread_mutex_lock(&theadCoordLock);
		if(threadStartCount >= (nThreads))
			ready = true;
#ifndef SILENT
		cout << "Still waiting...." << endl;
#endif /*!SILENT*/
		pthread_mutex_unlock(&theadCoordLock);
	}

#endif /* !TEST_START_POINTS */

    parameterRecursion(0, paramState, bState, pBest, pPoint);

#ifndef TEST_START_POINTS
	pthread_mutex_lock(&theadCoordLock);
	pthread_spin_lock(&workLock);
    finished = true;
	pthread_spin_unlock(&workLock);
	for(int i = 0; i < nThreads; i++)
	{
		startLatch[i] = false;
	}
	pthread_mutex_unlock(&theadCoordLock);
	pthread_cond_broadcast(&threadsStart);

#ifndef SILENT
	cout << "Waiting for threads to finish work...." << endl;
#endif /*!SILENT*/

	for(int i=0; i<(nThreads); i++)
	{
		threadReturn = pthread_join(threadPool[i], NULL);
		if (threadReturn)
		{
			cout << "Error: Unable to join thread: " << threadReturn << endl;
			return -1;
		}
	}

    for(int i=0; i<(nThreads); i++)
	{
        delete[] results[i].X;
		delete[] threadBins[i];
    }

	delete[] threadPool;
	delete[] threadMinBin;
	delete[] threadBins;
	delete[] results;
	delete[] threadFails;
	delete[] startLatch;
#endif /* !TEST_START_POINTS */

	stepCount = 1;
	for(int i = BSETS - 1; i >= 0; i--)
	{
		delete[] pBest[i];

		for(int j = 0; j < stepCount; j++)
		{
			delete[] pPoint[i][j];
		}
		delete[] pPoint[i];
		stepCount *= (boundaries[i].steps + 1);
	}

	delete[] pBest;
	delete[] pPoint;

	delete[] params;
	delete[] parameters;
	delete[] boundaries;

	pthread_spin_destroy(&workLock);
	pthread_mutex_destroy(&theadCoordLock);
	pthread_cond_destroy(&threadsStart);
	pthread_cond_destroy(&threadsComplete);

#ifdef USE_MPI
	ierr = MPI_Win_free(&m_state_window);
	ierr = MPI_Win_free(&s_state_window);
	ierr = MPI_Win_free(&stats_window);
	ierr = MPI_Win_free(&m_state_window);

	ierr = MPI_Free_mem(m_state);
	ierr = MPI_Free_mem(s_state);
	ierr = MPI_Free_mem(s_res);
	ierr = MPI_Free_mem(s_stats);

	ierr = MPI_Type_free(&MPI_FLOATVAL_T);

	ierr = MPI_Finalize();
#endif /*USE_MPI*/
}
