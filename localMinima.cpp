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


// TODO: Improve the algorithm interchangability/set
#include "lbfgs.h"
//#include "de.h"
#include "preprocessor_trickery.h"

// TODO: Remove
#include <unistd.h>

#include "ode_opt.cpp"

using namespace std;
using std::cout;
using std::cerr;
using std::endl;

template<typename floatval_t> 
using evaluate_t = floatval_t (*)(
    const floatval_t *,
    const floatval_t *,
	const floatval_t *,
    const int
    );

template<typename floatval_t>
struct OptimizeResult
{
	floatval_t  f;
	floatval_t* X;
};

template <typename floatval_t>
struct parameter_t
{
	floatval_t (*get)(int i, floatval_t* params, int depth);
	int (*steps)(floatval_t* params, int depth);
	int (*findPos)(floatval_t value, floatval_t* params, int depth);
};

typedef void (*fptr)();

template <typename floatval_t>
struct boundary_t
{
	floatval_t (*startLower)(floatval_t* x0);
	floatval_t (*incrementLower)(floatval_t* x0);
	floatval_t (*startUpper)(floatval_t* x0);
	floatval_t (*incrementUpper)(floatval_t* x0);
	int steps;
	int dim;
	bool intCast;
	bool hasSym;
};

// The description of a stage for multistaging optimisations
template <typename floatval_t>
struct stage_t 
{
    int dim;
    int bSets;    
	int algorithm;
    const int* vars;     
	// Not very clear, but this will be an array of function pointers, allows for bounds to be functions of prev stage x's
    floatval_t (*(*pBSetOptSize))(floatval_t* x0);   
	int (*get_density)(int* bState);
};

int nruns = 0;
bool startBound = true;

MAX_PRECISION_T* params;

#ifdef PARAMSCONSTSCOUNT
MAX_PRECISION_T precompute[PARAMSCONSTSCOUNT];
#else
MAX_PRECISION_T* precompute = NULL;
#endif /*PARAMSCONSTSCOUNT*/

OptimizeResult<MAX_PRECISION_T>* currBestRes;

MAX_PRECISION_T* ubounds = NULL;
MAX_PRECISION_T* lbounds = NULL;
MAX_PRECISION_T* stepUp = NULL;
MAX_PRECISION_T* stepDown = NULL;

// The set of full variables, we copy results onto this and use this as the initial positions.
MAX_PRECISION_T* x0;
// The current stage so the worker threads know which cost function to use
int currStage=0;
// The current working dimension
int DIM=0;
// The current working number of boundary sets
int BSETS=0;
// The starting boundary set for the current stage
int bSetStartDepth = 0;

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

ode_workspace_t ode_wspace;

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

// The algorithm used in the previous stage and the algorithm for the current stage
int PALGO = -1;
int ALGO = -1;

parameter_t<MAX_PRECISION_T>* parameters;
boundary_t<MAX_PRECISION_T>* boundaries;
// The description of the stages
stage_t<MAX_PRECISION_T>* stages; 

int* threadMinBin;
int** threadBins;
int* threadFails;
int num_nodes;
bool* startLatch;

#ifdef DETERMINISTIC
int detDebug = 0;
#endif /*DETERMINISTIC*/

struct OptimizeResult<MAX_PRECISION_T>* results;

void stageIteration(int stageNum, int dimCount, int* bState, MAX_PRECISION_T*** pBests, MAX_PRECISION_T**** pPoints);

// Use as: (*lbgfs_evaluates[index])();

#ifdef ROBUST
#define IFDEF_ROBUST(...) __VA_ARGS__
#define IFDEF_NROBUST(...)
#else
#define IFDEF_ROBUST(...)
#define IFDEF_NROBUST(...) __VA_ARGS__
#endif

CONSTANTS(double)
#if (MAX_PRECISION_LEVEL > 1)
CONSTANTS(dd_real)
#endif
#if (MAX_PRECISION_LEVEL > 2)
CONSTANTS(qd_real)
#endif
#if (MAX_PRECISION_LEVEL > 3)
CONSTANTS(mp_real)
#endif

#define eval_code(NUM,floatval_t) static floatval_t lbgfs_evaluate_##NUM##_##floatval_t( \
	const floatval_t *X, \
	const floatval_t *params, \
	const floatval_t *precompute,\
	floatval_t *g, \
	const int n, \
	const floatval_t step \
	) \
{ \
	floatval_t fx = 0.; \
	const floatval_t* c=const_arr_##floatval_t; \
	IFDEF_ROBUST( \
		floatval_t* batch_x; \
		floatval_t fx_sum = 0.; \
		floatval_t* g_sum; \
		batch_x = new floatval_t[DIM]; \
		g_sum = new floatval_t[DIM]; \
		for(int i=0;i<n;i++) \
		{ \
			g_sum[i] = 0.; \
		} \
		for(int i=0;i<SAMPLES;i++) \
		{ \
			for(int j=0;j<n;j++) \
			{ \
				batch_x[j] = X[j] + NOISE * ((floatval_t)rand() / RAND_MAX - 0.5); \
			} \
			fx = FUNCTION##NUM(batch_x, params, precompute); \
			DERIVATIVES##NUM(g, batch_x, params, precompute, fx, step); \
			for(int j=0;j<n;j++) \
			{ \
				g_sum[j] += g[j]; \
			} \
			fx_sum += fx; \
		} \
		fx = fx_sum / SAMPLES; \
		for(int i=0;i<n;i++) \
		{ \
			g[i] = g_sum[i] / SAMPLES; \
		} \
		delete[] batch_x; \
		delete[] g_sum; \
	) \
	IFDEF_NROBUST( \
		fx = FUNCTION##NUM(X, params, precompute); \
		DERIVATIVES##NUM(g, X, params, precompute, fx, step); \
	) \
	if(fx < 0.0) \
		cout << "The cost function was negative!" << endl; \
	return fx; \
}

#define M(i, _) eval_code(i,double)
EVAL_PP(REPEAT_PP(NSTAGES, M, ~)) 
#undef M

#if (MAX_PRECISION_LEVEL > 1)
#define M(i, _) eval_code(i,dd_real)
EVAL_PP(REPEAT_PP(NSTAGES, M, ~)) 
#undef M
#endif

#if (MAX_PRECISION_LEVEL > 2)
#define M(i, _) eval_code(i,qd_real)
EVAL_PP(REPEAT_PP(NSTAGES, M, ~)) 
#undef M
#endif

#if (MAX_PRECISION_LEVEL > 3)
#define M(i, _) eval_code(i,mp_real)
EVAL_PP(REPEAT_PP(NSTAGES, M, ~)) 
#undef M
#endif

#undef eval_code

// General eval code (inc DE)
#define eval_code(NUM,floatval_t) static floatval_t gen_evaluate_##NUM##_##floatval_t( \
	const floatval_t *X,\
	const floatval_t *params,\
	const floatval_t *precompute,\
	const int n\
	)\
{\
	floatval_t fx = 0.;\
	const floatval_t* c=const_arr_##floatval_t; \
	IFDEF_ROBUST(\
		floatval_t* batch_x;\
		floatval_t fx_sum = 0.;\
		batch_x = new floatval_t[DIM];\
		for(int i=0;i<SAMPLES;i++) {\
			for(int j=0;j<n;j++) {\
				batch_x[j] = X[j] + NOISE * ((floatval_t)rand() / RAND_MAX - 0.5);\
			}\
			fx = FUNCTION##NUM(batch_x, params, precompute);\
			fx_sum += fx;\
		}\
		fx = fx_sum / SAMPLES;\
		delete[] batch_x;\
	)\
	IFDEF_NROBUST(\
		fx = FUNCTION##NUM(X, params, precompute);\
	)\
	return fx;\
}\


#define M(i, _) eval_code(i,double)
EVAL_PP(REPEAT_PP(NSTAGES, M, ~)) 
#undef M

#if (MAX_PRECISION_LEVEL > 1)
#define M(i, _) eval_code(i,dd_real)
EVAL_PP(REPEAT_PP(NSTAGES, M, ~)) 
#undef M
#endif

#if (MAX_PRECISION_LEVEL > 2)
#define M(i, _) eval_code(i,qd_real)
EVAL_PP(REPEAT_PP(NSTAGES, M, ~)) 
#undef M
#endif

#if (MAX_PRECISION_LEVEL > 3)
#define M(i, _) eval_code(i,mp_real)
EVAL_PP(REPEAT_PP(NSTAGES, M, ~)) 
#undef M
#endif

#undef eval_code

typedef void (*fptr)();

#define funcptr_code(NUM,floatval_t) COMMA_IF_PP(NUM) reinterpret_cast<fptr>(CAT_PP(CAT_PP(OPT,NUM),_evaluate_##NUM##_##floatval_t))
#define M(i, _) funcptr_code(i,double)

// The array of stage evaluation functions
void (* evaluates_dbl [])( ) = 
{
	EVAL_PP(REPEAT_PP(NSTAGES, M, ~)) 
};
#undef M

#if (MAX_PRECISION_LEVEL > 1)
#define M(i, _) funcptr_code(i,dd_real)
void (* evaluates_dd [])( ) = 
{
	EVAL_PP(REPEAT_PP(NSTAGES, M, ~)) 
};
#undef M
#endif

#if (MAX_PRECISION_LEVEL > 2)
#define M(i, _) funcptr_code(i,qd_real)
void (* evaluates_qd [])( ) = 
{
	EVAL_PP(REPEAT_PP(NSTAGES, M, ~)) 
};
#undef M
#endif

#if (MAX_PRECISION_LEVEL > 3)
#define M(i, _) funcptr_code(i,mp_real)
void (* evaluates_mp [])( ) = 
{
	EVAL_PP(REPEAT_PP(NSTAGES, M, ~)) 
};
#undef M
#endif

#undef funcptr_code

#define funcptr_code(NUM,floatval_t) COMMA_IF_PP(NUM) reinterpret_cast<fptr>(gen_evaluate_##NUM##_##floatval_t)
#define M(i, _) funcptr_code(i,double)

// The array of stage generalized evaluation functions, used for int casting
void (* evaluates_gen_dbl [])( ) = 
{
	EVAL_PP(REPEAT_PP(NSTAGES, M, ~)) 
};
#undef M

#if (MAX_PRECISION_LEVEL > 1)
#define M(i, _) funcptr_code(i,dd_real)
void (* evaluates_gen_dd [])( ) = 
{
	EVAL_PP(REPEAT_PP(NSTAGES, M, ~)) 
};
#undef M
#endif

#if (MAX_PRECISION_LEVEL > 2)
#define M(i, _) funcptr_code(i,qd_real)
void (* evaluates_gen_qd [])( ) = 
{
	EVAL_PP(REPEAT_PP(NSTAGES, M, ~)) 
};
#undef M
#endif

#if (MAX_PRECISION_LEVEL > 3)
#define M(i, _) funcptr_code(i,mp_real)
void (* evaluates_gen_mp [])( ) = 
{
	EVAL_PP(REPEAT_PP(NSTAGES, M, ~)) 
};
#undef M
#endif

#undef funcptr_code


template <typename floatval_t>
static int progress(
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
	cout << "  fx = " << to_out_string(fx,SIGDIG);

	for(int j = 0; j < DIM; j++)
	{
		cout << ", x[" << j << "] = " << to_out_string(x[j],SIGDIG);
	}

	cout << endl;
	cout << "  xnorm = " << to_out_string(xnorm,SIGDIG);
	if(g != NULL)
		cout << ", gnorm =" << to_out_string(gnorm,SIGDIG);
	cout << ", step = " << to_out_string(step,SIGDIG) << endl;
	cout << endl;

	ofstream outfile;

	outfile.open("progress.csv", ios::app );

	outfile << k << "," << to_out_string(fx,SIGDIG) << ",";
	for(int j = 0; j < DIM; j++)
	{
		outfile << to_out_string(x[j],SIGDIG) << ",";
	}
	
	if(g != NULL)
	{
		for(int j = 0; j < DIM; j++)
		{
			outfile << to_out_string(g[j],SIGDIG) << ",";
		}
	}
	
	outfile << to_out_string(step,SIGDIG) << "," << ls << endl;

	return 0;
}


// Code to distribute calls to get the stage evaluation to the correct function pointer
template <typename floatval_t>
inline fptr getEvalFunc(int stage);
template<>
inline fptr getEvalFunc<double>(int stage) { return evaluates_dbl[stage]; }
#if (MAX_PRECISION_LEVEL > 1)
template<>
inline fptr getEvalFunc<dd_real>(int stage) { return evaluates_dd[stage]; }
#endif
#if (MAX_PRECISION_LEVEL > 2)
template<>
inline fptr getEvalFunc<qd_real>(int stage) { return evaluates_qd[stage]; }
#endif
#if (MAX_PRECISION_LEVEL > 3)
template<>
inline fptr getEvalFunc<mp_real>(int stage) { return evaluates_mp[stage]; }
#endif

// Code to distribute calls to get integer cast evaluation to the correct function pointer
template <typename floatval_t>
inline fptr getCastEvalFunc(int stage);
template<>
inline fptr getCastEvalFunc<double>(int stage) { return evaluates_gen_dbl[stage]; }
#if (MAX_PRECISION_LEVEL > 1)
template<>
inline fptr getCastEvalFunc<dd_real>(int stage) { return evaluates_gen_dd[stage]; }
#endif
#if (MAX_PRECISION_LEVEL > 2)
template<>
inline fptr getCastEvalFunc<qd_real>(int stage) { return evaluates_gen_qd[stage]; }
#endif
#if (MAX_PRECISION_LEVEL > 3)
template<>
inline fptr getCastEvalFunc<mp_real>(int stage) { return evaluates_gen_mp[stage]; }
#endif

// Values of the upper bound for different precisions
#if (MAX_PRECISION_LEVEL > 1)
	double* ubounds_dbl = NULL;
#endif
#if (MAX_PRECISION_LEVEL > 2)
	dd_real* ubounds_dd = NULL;
#endif
#if (MAX_PRECISION_LEVEL > 3)
	qd_real* ubounds_qd = NULL;
#endif

// Values of the lower bound for different precisions
#if (MAX_PRECISION_LEVEL > 1)
	double* lbounds_dbl = NULL;
#endif
#if (MAX_PRECISION_LEVEL > 2)
	dd_real* lbounds_dd = NULL;
#endif
#if (MAX_PRECISION_LEVEL > 3)
	qd_real* lbounds_qd = NULL;
#endif

// Values of the up step for different precisions
#if (MAX_PRECISION_LEVEL > 1)
	double* stepUp_dbl = NULL;
#endif
#if (MAX_PRECISION_LEVEL > 2)
	dd_real* stepUp_dd = NULL;
#endif
#if (MAX_PRECISION_LEVEL > 3)
	qd_real* stepUp_qd = NULL;
#endif

// Values of the down step for different precisions
#if (MAX_PRECISION_LEVEL > 1)
	double* stepDown_dbl = NULL;
#endif
#if (MAX_PRECISION_LEVEL > 2)
	dd_real* stepDown_dd = NULL;
#endif
#if (MAX_PRECISION_LEVEL > 3)
	qd_real* stepDown_qd = NULL;
#endif

// Functions to get values of the step down for different precisions
template <typename floatval_t>
inline floatval_t getBStepDown(int idx);
template<>
inline double getBStepDown<double>(int idx) 
{ 
#if (MAX_PRECISION_LEVEL > 1)
	return stepDown_dbl[idx]; 
#else
	return stepDown[idx]; 
#endif
}
template<>
inline dd_real getBStepDown<dd_real>(int idx) 
{ 
#if (MAX_PRECISION_LEVEL > 2)
	return stepDown_dd[idx]; 
#else
	return stepDown[idx]; 
#endif
}
template<>
inline qd_real getBStepDown<qd_real>(int idx) 
{ 
#if (MAX_PRECISION_LEVEL > 3)
	return stepDown_qd[idx]; 
#else
	return stepDown[idx]; 
#endif
}
#if (MAX_PRECISION_LEVEL > 3)
template<>
inline mp_real getBStepDown<mp_real>(int idx) { return stepDown[idx]; };
#endif

// Functions to get values of the step up for different precisions
template <typename floatval_t>
inline floatval_t getBStepUp(int idx);
template<>
inline double getBStepUp<double>(int idx) 
{ 
#if (MAX_PRECISION_LEVEL > 1)
	return stepUp_dbl[idx]; 
#else
	return stepUp[idx]; 
#endif
}
template<>
inline dd_real getBStepUp<dd_real>(int idx) 
{ 
#if (MAX_PRECISION_LEVEL > 2)
	return stepUp_dd[idx]; 
#else
	return stepUp[idx]; 
#endif
}
template<>
inline qd_real getBStepUp<qd_real>(int idx) 
{ 
#if (MAX_PRECISION_LEVEL > 3)
	return stepUp_qd[idx]; 
#else
	return stepUp[idx]; 
#endif
}
#if (MAX_PRECISION_LEVEL > 3)
template<>
inline mp_real getBStepUp<mp_real>(int idx) { return stepUp[idx]; };
#endif

// Functions to get values of the lower bound for different precisions
template <typename floatval_t>
inline floatval_t getLowerBounds(int idx);
template<>
inline double getLowerBounds<double>(int idx) 
{ 
#if (MAX_PRECISION_LEVEL > 1)
	return lbounds_dbl[idx]; 
#else
	return lbounds[idx]; 
#endif
}
template<>
inline dd_real getLowerBounds<dd_real>(int idx) 
{ 
#if (MAX_PRECISION_LEVEL > 2)
	return lbounds_dd[idx]; 
#else
	return lbounds[idx]; 
#endif
}
template<>
inline qd_real getLowerBounds<qd_real>(int idx) 
{ 
#if (MAX_PRECISION_LEVEL > 3)
	return lbounds_qd[idx]; 
#else
	return lbounds[idx]; 
#endif
}
#if (MAX_PRECISION_LEVEL > 3)
template<>
inline mp_real getLowerBounds<mp_real>(int idx) { return lbounds[idx]; };
#endif

// Functions to get values of the upper bound for different precisions
template <typename floatval_t>
inline floatval_t getUpperBounds(int idx);
template<>
inline double getUpperBounds<double>(int idx) 
{ 
#if (MAX_PRECISION_LEVEL > 1)
	return ubounds_dbl[idx]; 
#else
	return ubounds[idx]; 
#endif
}
template<>
inline dd_real getUpperBounds<dd_real>(int idx) 
{ 
#if (MAX_PRECISION_LEVEL > 2)
	return ubounds_dd[idx]; 
#else
	return ubounds[idx]; 
#endif
}
template<>
inline qd_real getUpperBounds<qd_real>(int idx) 
{ 
#if (MAX_PRECISION_LEVEL > 3)
	return ubounds_qd[idx]; 
#else
	return ubounds[idx]; 
#endif
}
#if (MAX_PRECISION_LEVEL > 3)
template<>
inline mp_real getUpperBounds<mp_real>(int idx) { return ubounds[idx]; };
#endif


/**
 *
 *
 */
template <typename floatval_t>
class objective_function
{
public:
	bool initialized;
	// TODO: Make proper getters, we never set outside class
	// These are used to select random points appropriately
	// The number of currently active BSETS
	int NactiveBSETS;
	// The current active BSETS
	int* activeBSETS;
	// The current working DIM's for each active bSet
	int* currBSetDIMS;

protected:
	// Local optimisation variables
    floatval_t* m_x = NULL;
	// Local copy of boundaries, TODO: Assess necessity
    floatval_t* localLower;
    floatval_t* localUpper;
	// Local copy of boundary steps, TODO: Assess necessity
	floatval_t* localBStepDown;
    floatval_t* localBStepUp;

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

	int prevStage = -1;
	int threadNum;
	int ret;
	lbfgs_wspace_t<floatval_t> wspace;

	const floatval_t EPS = get_epsilon<floatval_t>();

	// Thecurrent DIM memory allocation
	int pDIM = 0;

	lbfgs_parameter_t<floatval_t> param;

public:
	/**
	 *	Constructor for the objective function.
	 *
	 */
    objective_function(int threadNum_in)
    {
		// TODO: These options will become stage specific
		initialized = false;
		threadNum = threadNum_in;
	    param.m = MEMSIZE;
	    param.conv_epsilon = get_conv_epsilon<floatval_t>();
		param.eps = EPS;
	    param.past = 0;
	    param.delta = get_delta<floatval_t>();
	    param.max_iterations = MAXIT;
	    param.linesearch = LBFGS_LINESEARCH_MORETHUENTE;
	    param.max_linesearch = MAXLINE;
	    param.min_step = get_min_step<floatval_t>();
	    param.max_step = get_max_step<floatval_t>();
	    param.ftol = 1e10*EPS;
	    param.wolfe = 0.9;
	    param.gtol = 0.9;
	    param.xtol = EPS;
	    param.orthantwise_c = 0.0;
	    param.orthantwise_start = 0;
	    param.orthantwise_end = -1;
		param.gstep = get_gstep<floatval_t>();

		ret = -1;

		initialized = true;
    }

	/**
	 *	Destructor for the objective function.
	 *	Do a final clean up.
	 */
    virtual ~objective_function()
    {
		// CHECK: Fix all this, mainly on the ALGO setup, multiple stages may make use of them
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
		if (localBStepDown != NULL)
        {
            delete[] localBStepDown;
        }
        if (localBStepUp != NULL)
        {
            delete[] localBStepUp;
        }
		if(activeBSETS != NULL)
		{
			delete[] activeBSETS;
		}

		if(ALGO == 0)
		{
			lbfgs_dest<floatval_t>(&wspace);
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

    // Set/reset memory for new stage if necessary and set boundaries
	int setup()
	{
		// TODO: Instead of constant re-allocation, just set at FULLDIM size
		// If the dimensions have changed or the optimisation algorithm changed, reallocate the memory for the new DIM
		if(DIM != pDIM || PALGO != ALGO)
		{
			if(m_x != NULL)
			{
				delete[] m_x;
				delete[] localLower;
				delete[] localUpper;
				delete[] localBStepDown;
				delete[] localBStepUp;

				if(PALGO == 0)
				{
					lbfgs_dest<floatval_t>(&wspace);
				}
				else if(PALGO == 1)
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

			m_x = new floatval_t[DIM];
		
			localLower = new floatval_t[DIM];
			localUpper = new floatval_t[DIM];
			localBStepDown = new floatval_t[DIM];
			localBStepUp = new floatval_t[DIM];

			if (m_x == NULL || localLower == NULL || localUpper == NULL || localBStepDown == NULL || localBStepUp == NULL)
			{
				cout << "ERROR: Failed to allocate a memory block for variables." << endl;
				return -1;
			}

			// Set the algorithm variables
			if(ALGO == 0)
			{
				ret = lbfgs_init<floatval_t>(DIM, &wspace, &param);
				if(ret != 0)
				{
					cout << "Initialization error: " << ret << endl;
					return -1;
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

				if (ini_upper == NULL || ini_lower == NULL || c == NULL || d == NULL || oldarray == NULL || newarray == NULL || swaparray == NULL || tmp == NULL || best == NULL || bestit == NULL || energy == NULL)
				{
					cout << "ERROR: Failed to allocate a memory block for variables." << endl;
					return -1;
				}
			}

			pDIM = DIM;
		}

		
		if(prevStage != currStage)
		{
			NactiveBSETS = 0;

			// If we previously assigned arayas, delete the memory.
			if(prevStage >= 0)
			{
				delete[] activeBSETS;
				delete[] currBSetDIMS;
			}

			int currBSet = 0;
			int dimCount = 0;

			// Determine the number of Bsets covered
			for(int i = 0; i < DIM; i++)
			{
				if(stages[currStage].vars[i] >= boundaries[currBSet].dim + dimCount)
				{
					while(stages[currStage].vars[i] >= boundaries[currBSet].dim + dimCount)
					{
						dimCount += boundaries[currBSet].dim;
						currBSet++;
					}
					NactiveBSETS++;
				}
			}

			activeBSETS = new int[NactiveBSETS];

			int bSetCounter = 0;
			int bDimCount = 0;

			// Set the current Bset DIMS and the active Bsets
			for(int i = 0; i < DIM; i++)
			{
				if(stages[currStage].vars[i] >= boundaries[currBSet].dim + dimCount)
				{
					while(stages[currStage].vars[i] >= boundaries[currBSet].dim + dimCount)
					{
						dimCount += boundaries[currBSet].dim;
						currBSet++;
					}

					currBSetDIMS[bSetCounter] = bDimCount;
					bDimCount = 0;
					activeBSETS[bSetCounter] = currBSet;
					bSetCounter++;
				}
				bDimCount++;
			}

			prevStage = currStage;
		}
		
		// Set local boundaries and steps
		for (int i = 0;i < DIM;i++)
		{
			localLower[i] = getLowerBounds<floatval_t>(i);
			localUpper[i] = getUpperBounds<floatval_t>(i);

			localBStepDown[i] = getBStepDown<floatval_t>(i);
			localBStepUp[i] = getBStepUp<floatval_t>(i);
		}

		return  0;
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
			for(int j = 0; j < NactiveBSETS; j++)
			{
				int sect = -2;
				// We don't want the sym to happen when we are refining points from previous stage
				if(activeBSETS[j] > bSetStartDepth)
					sect = rand() % (2*currBSetDIMS[j] - (boundaries[activeBSETS[j]].hasSym ? 1 : 0));

				/* Initialize the variables. */
				for (int i = dimCount;i < (dimCount + currBSetDIMS[j]);i++)
				{
					if(fabs(localBStepDown[i]) < EPS && sect >= 2*i)
							sect++;
					if(fabs(localBStepUp[i]) < EPS && sect > 2*i)
							sect++;

#ifdef VERBOSE
					cout << "Section is: " << (sect / 2) << endl;
					cout << "Initial values are " << endl;
#endif /*VERBOSE*/

					if((sect / 2) == i)
					{
						if((sect % 2))
							m_x[i] = localUpper[i] - localBStepUp[i]*rnd_uni<floatval_t>();
						else
							m_x[i] = localLower[i] - localBStepDown[i]*rnd_uni<floatval_t>();

					}
					else
					{
						m_x[i] = (localUpper[i] - localLower[i])*rnd_uni<floatval_t>() + localLower[i];
					}

#ifdef DEBUG
#ifdef VERBOSE
					cout << ", x[" << i << "] = " << to_out_string(m_x[i],5);
#endif /*VERBOSE*/

					if(m_x[i] > localUpper[i] || m_x[i] < localLower[i])
					{
						cout << endl;
						cerr << "Exceeded boundary: " << i << endl;
						std::cout.flush();
						std::cout.flush();
						std::_Exit(EXIT_FAILURE);
					}
#endif /*DEBUG*/
				}
#ifdef VERBOSE
				cout << endl;
#endif /*VERBOSE*/

				dimCount += currBSetDIMS[j];
			}
		}
		else // Otherwise we pick points in a regular grid.
		{
#ifdef NEVER // TODO: Fix and re-add, needs boundary set work and stages

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
#endif
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
				m_x[i] = (floatval_t)currBestRes->X[i];

				ini_lower[i] = (floatval_t)(currBestRes->X[i] - POPSPREAD);
				ini_upper[i] = (floatval_t)(currBestRes->X[i] + POPSPREAD);
			}
		}
		else
		{
			// We need to do this for each boundary set. NOTE: There is a higher density of searching in the corners due to overlap. Resolving this is complicated.
			for(int j = 0; j < NactiveBSETS; j++)
			{
				// TODO: This sym handling needs fixing, just don't do it if not using the whole BSET or it isn't the first use of the BSET
				int sect = rand() % (2*currBSetDIMS[j] - (boundaries[activeBSETS[j]].hasSym ? 1 : 0));
				int upper = sect % 2;
				sect = (sect / 2) + dimCount;

				int fixedCounter = 0;

#ifdef VERBOSE
				cout << "Section is: " << sect << endl;
				cout << "Upper: " << upper << endl;
				cout << "Initial values are " << endl;
#endif /*VERBOSE*/

				/* Initialize the variables. */
				for (int i = dimCount;i < (dimCount + currBSetDIMS[j]);i++)
				{
					bool fixed = !((localBStepDown[i] > EPS && !upper) || (localBStepUp[i] > EPS && upper));
					if(sect + fixedCounter == i && !fixed)
					{
						if(upper)
						{
							m_x[i] = (localUpper[i] - POPSPREAD) - (localBStepUp[i] - 2*POPSPREAD)*rnd_uni<floatval_t>();
							ini_lower[i] = m_x[i] - POPSPREAD;
							ini_upper[i] = m_x[i] + POPSPREAD;
						}
						else
						{
							m_x[i] = (localLower[i] + POPSPREAD) - (localBStepDown[i] - 2*POPSPREAD)*rnd_uni<floatval_t>();
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

						m_x[i] = (localUpper[i] - localLower[i] - 2*POPSPREAD)*rnd_uni<floatval_t>() + localLower[i] + POPSPREAD;
						ini_lower[i] = m_x[i] - POPSPREAD;
						ini_upper[i] = m_x[i] + POPSPREAD;
					}

#ifdef DEBUG
#ifdef VERBOSE
					cout << ", x[" << i << "] = " << to_out_string(m_x[i],5);
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

				dimCount += currBSetDIMS[j];
			}
		}

		return 0;
	}

	int getStartPosition(int workNumber)
	{
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

    int run(struct OptimizeResult<floatval_t>* result, int workNumber, floatval_t* locParams, floatval_t* locPreComps, floatval_t* start_x, bool use_start)
    {
        int ret = -1;
        floatval_t fx = get_max_step<floatval_t>();

#ifdef DETERMINISTIC
		pthread_spin_lock(&workLock);
		int detNum = detDebug++;
		pthread_spin_unlock(&workLock);
		srand(detNum);
#endif /*DETERMINISTIC*/

		if(!use_start)
			ret = getStartPosition(workNumber);

		if(ALGO == 0)
		{
			/*
	            Start the L-BFGS optimization; this will invoke the callback functions
	            lbgfs_evaluate() and progress() when necessary.
	        */
#ifdef OPT_PROGRESS
			if(workNumber % SAMPLE_SPACING == 0)
				ret = lbfgs<floatval_t>(DIM, use_start ? start_x : m_x, &fx, localLower, localUpper, locParams, locPreComps, _lbgfs_evaluate, _progress, &wspace);
			else
				ret = lbfgs<floatval_t>(DIM, use_start ? start_x : m_x, &fx, localLower, localUpper, locParams, locPreComps, _lbgfs_evaluate, NULL, &wspace);
#else /*OPT_PROGRESS*/
	    	ret = lbfgs<floatval_t>(DIM, use_start ? start_x : m_x, &fx, localLower, localUpper, locParams, locPreComps, _lbgfs_evaluate, NULL, &wspace);
#endif /*!OPT_PROGRESS*/

	       /* Report the result. */
#ifdef VERBOSE
	       cout << "L-BFGS optimization terminated with status code = " << ret << endl;
#endif /*VERBOSE*/
	       //cout << "  fx = " << to_out_string(fx,SIGDIG);
		}
		// TODO: Re-add this
		/*else if(ALGO == 1)
		{
			ret = de(DIM, m_x, &fx, localLower, localUpper, locParams, _de_evaluate, this, POPSIZE, ini_lower, ini_upper,
				 STRAT, MAXGEN, PARAM_F, PARAM_CR, 0, c, d, oldarray, newarray, swaparray, tmp, best, bestit, energy);

			//cout << "DE optimization terminated with status code = " << ret << endl;
		}*/
		else
		{
			cout << "Unknown search algorithm." << endl;
		}

#ifdef VERBOSE
		cout << "Final values are";
        for (int i = 0;i < DIM;i++)
        {
			if(use_start)
				cout << ", x[" << i << "] = " << to_out_string(start_x[i],5);
			else
				cout << ", x[" << i << "] = " << to_out_string(m_x[i],5);
		}
		cout << endl;
#endif /*VERBOSE*/

        for (int i = 0;i < DIM;i++)
        {
			if(use_start)
				result->X[i] = start_x[i];
			else
				result->X[i] = m_x[i];
            
        }
        result->f = fx;

        return ret;
    }

	static floatval_t evaluate(
        const floatval_t *X,
        const floatval_t *params,
        const floatval_t *precompute,
        const int n
        )
    {
        return (reinterpret_cast<evaluate_t<floatval_t>>(getCastEvalFunc<floatval_t>(currStage)))(X, params, precompute, n);
    }
	

protected:
    static floatval_t _lbgfs_evaluate(
        const floatval_t *X,
        const floatval_t *params,
		const floatval_t *precompute,
        floatval_t *g,
        const int n,
        const floatval_t step
        )
    {
        return (reinterpret_cast<lbfgs_evaluate_t<floatval_t>>(getEvalFunc<floatval_t>(currStage)))(X, params, precompute, g, n, step);
    }
	static floatval_t _de_evaluate(
        const floatval_t *X,
        const floatval_t *params,
		const floatval_t *precompute,
        const int n
        )
    {
        return reinterpret_cast<evaluate_t<floatval_t>*>(getEvalFunc<floatval_t>(currStage))(X, params, precompute, n);
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
        return reinterpret_cast<lbfgs_progress_t<floatval_t>*>(progress<floatval_t>)(x, g, fx, xnorm, gnorm, step, n, k, ls);
    }
};

#ifdef TEST_START_POINTS
objective_function *objTest;
#endif /*TEST_START_POINTS*/

template<typename floatval_t>
void castBoundaries(int depth, int dimCount, objective_function<floatval_t> *obj, floatval_t* params, floatval_t* precompute, floatval_t* Xin, floatval_t* X, floatval_t* best, floatval_t* bestX);

template<typename floatval_t>
void locCastRecurs(int depth, int locDepth, int dimCount, objective_function<floatval_t> *obj, floatval_t* params, floatval_t* precompute, floatval_t* Xin, floatval_t* X, floatval_t* best, floatval_t* bestX)
{
	if(locDepth == obj->currBSetDIMS[depth])
	{
		castBoundaries<floatval_t>(depth + 1, dimCount + obj->currBSetDIMS[depth], obj, params, precompute, Xin, X, best, bestX);
	}
	else
	{
		X[dimCount + locDepth] = floor(Xin[dimCount + locDepth]);
		locCastRecurs<floatval_t>(depth, locDepth + 1, dimCount, obj, params, precompute, Xin, X, best, bestX);

		X[dimCount + locDepth] = ceil(Xin[dimCount + locDepth]);
		locCastRecurs<floatval_t>(depth, locDepth + 1, dimCount, obj, params, precompute, Xin, X, best, bestX);
	}
}

template<typename floatval_t>
void castBoundaries(int depth, int dimCount, objective_function<floatval_t> *obj, floatval_t* params, floatval_t* precompute, floatval_t* Xin, floatval_t* X, floatval_t* best, floatval_t* bestX)
{
	if(depth == obj->NactiveBSETS)
	{
		floatval_t f = obj->evaluate(X, params, precompute, DIM);
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
		
		if(boundaries[obj->activeBSETS[depth]].intCast)
		{
			locCastRecurs(depth, 0, dimCount, obj, params, precompute, Xin, X, best, bestX);
		}
		else
		{
			for(int i = 0; i < obj->currBSetDIMS[depth]; i++)
			{
				X[dimCount + i] = Xin[dimCount + i];
			}
			castBoundaries(depth + 1, dimCount + obj->currBSetDIMS[depth], obj, params, precompute, Xin, X, best, bestX);
		}
	}
}


void *run_multi(void *threadarg)
{
	pthread_mutex_lock(&theadCoordLock);

	int threadNum = threadStartCount++;

	srand((int)time(NULL) ^ (threadNum*(1+nodeNum)));
    
	objective_function<double> *obj_dbl = new objective_function<double>(threadNum);
	OptimizeResult<double> locResults_dbl;
#define obj obj_dbl
#define locResults locResults_dbl

#if (MAX_PRECISION_LEVEL > 1)
	objective_function<dd_real> *obj_dd = new objective_function<dd_real>(threadNum);
	OptimizeResult<dd_real> locResults_dd;
#undef obj
#define obj obj_dd
#undef locResults
#define locResults locResults_dd
#endif
#if (MAX_PRECISION_LEVEL > 2)
	objective_function<qd_real> *obj_qd = new objective_function<qd_real>(threadNum);
	OptimizeResult<qd_real> locResults_qd;
#undef obj
#define obj obj_qd
#undef locResults
#define locResults locResults_qd
#endif
#if (MAX_PRECISION_LEVEL > 3)
	objective_function<mp_real> *obj_mp = new objective_function<mp_real>(threadNum);
	OptimizeResult<mp_real> locResults_mp;
#undef obj
#define obj obj_mp
#undef locResults
#define locResults locResults_mp
#endif

#if (MAX_PRECISION_LEVEL > 1)
	double* locParams_dbl = new double[NPARAMS];
#ifdef PARAMSCONSTSCOUNT
	double* locPreComps_dbl = new double[PARAMSCONSTSCOUNT];
#else /* No parameter precomputes */
	double* locPreComps_dbl = NULL;
#endif
#endif
#if (MAX_PRECISION_LEVEL > 2)
	dd_real* locParams_dd = new dd_real[NPARAMS];
#ifdef PARAMSCONSTSCOUNT
	double* locPreComps_dd = new dd_real[PARAMSCONSTSCOUNT];
#else /* No parameter precomputes */
	double* locPreComps_dd = NULL;
#endif
#endif
#if (MAX_PRECISION_LEVEL > 3)
	qd_real* locParams_qd = new qd_real[NPARAMS];
#ifdef PARAMSCONSTSCOUNT
	double* locPreComps_qd = new qd_real[PARAMSCONSTSCOUNT];
#else /* No parameter precomputes */
	double* locPreComps_qd = NULL;
#endif
#endif

	bool workDone = false;
	bool exitFlag = true;
	bool mustCast = false;

	int item;
	int numWorks = nruns / nThreads;

	int ret;

	MAX_PRECISION_T bestCast;
	MAX_PRECISION_T* bestCastX = new MAX_PRECISION_T[FULLDIM];
	MAX_PRECISION_T* XCast = new MAX_PRECISION_T[FULLDIM];


	if(!obj_dbl->initialized)
	{
		delete obj_dbl;
		threadError = true;
		pthread_exit(NULL);
		return NULL;
	}

#if (MAX_PRECISION_LEVEL > 1)
	if(!obj_dd->initialized)
	{
		delete obj_dd;
		threadError = true;
		pthread_exit(NULL);
		return NULL;
	}
#endif
#if (MAX_PRECISION_LEVEL > 2)
	if(!obj_qd->initialized)
	{
		delete obj_qd;
		threadError = true;
		pthread_exit(NULL);
		return NULL;
	}
#endif
#if (MAX_PRECISION_LEVEL > 3)
	if(!obj_mp->initialized)
	{
		delete obj_mp;
		threadError = true;
		pthread_exit(NULL);
		return NULL;
	}
#endif

	if(threadNum == nThreads - 1 && nruns % nThreads != 0)
	{
		numWorks = nruns % nThreads;
	}

	locResults_dbl.X = new double[FULLDIM];

#if (MAX_PRECISION_LEVEL > 1)
	locResults_dd.X = new dd_real[FULLDIM];
#endif
#if (MAX_PRECISION_LEVEL > 2)
	locResults_qd.X = new qd_real[FULLDIM];
#endif
#if (MAX_PRECISION_LEVEL > 3)
	locResults_mp.X = new mp_real[FULLDIM];
#endif

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
		delete obj_dbl;
#if (MAX_PRECISION_LEVEL > 1)
		delete obj_dd;
#endif
#if (MAX_PRECISION_LEVEL > 2)
		delete obj_qd;
#endif
#if (MAX_PRECISION_LEVEL > 3)
		delete obj_mp;
#endif
		
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

		threadFails[threadNum] = 0;
		threadMinBin[threadNum] = 2<<(BUCKETORD+1);
		for(int i = 0; i < NBINSOUT; i++)
		{
			threadBins[threadNum][i] = 0;
		}
   
		// Setup boundaries and memory for all the workhorses
		ret = obj_dbl->setup();
		if(ret < 0)
		{
			cerr << "Failed to allocate memory." << endl;
 			std::cerr.flush();
			std::_Exit(EXIT_FAILURE);
		}

#if (MAX_PRECISION_LEVEL > 1)
		for(int i = 0; i < NPARAMS; i++)
		{
			locParams_dbl[i] = to_double(params[i]);
		}
#ifdef PARAMSCONSTSCOUNT
		for(int i = 0; i < PARAMSCONSTSCOUNT; i++)
		{
			locPreComps_dbl[i] = (double)precompute[i];
		}
#endif
		ret = obj_dd->setup();
		if(ret < 0)
		{
			cerr << "Failed to allocate memory." << endl;
 			std::cerr.flush();
			std::_Exit(EXIT_FAILURE);
		}
#endif
#if (MAX_PRECISION_LEVEL > 2)
		for(int i = 0; i < NPARAMS; i++)
		{
			locParams_dd[i] = (dd_real)params[i];
		}
#ifdef PARAMSCONSTSCOUNT
		for(int i = 0; i < PARAMSCONSTSCOUNT; i++)
		{
			locPreComps_dd[i] = (dd_real)precompute[i];
		}
#endif
		ret = obj_qd->setup();
		if(ret < 0)
		{
			cerr << "Failed to allocate memory." << endl;
 			std::cerr.flush();
			std::_Exit(EXIT_FAILURE);
		}
#endif
#if (MAX_PRECISION_LEVEL > 3)
		for(int i = 0; i < NPARAMS; i++)
		{
			locParams_qd[i] = (qd_real)params[i];
		}
#ifdef PARAMSCONSTSCOUNT
		for(int i = 0; i < PARAMSCONSTSCOUNT; i++)
		{
			locPreComps_qd[i] = (qd_real)precompute[i];
		}
#endif
		ret = obj_mp->setup();
		if(ret < 0)
		{
			cerr << "Failed to allocate memory." << endl;
 			std::cerr.flush();
			std::_Exit(EXIT_FAILURE);
		}
#endif
		while(!exitFlag)
		{
			if(threadError)
			{
				delete obj_dbl;
#if (MAX_PRECISION_LEVEL > 1)
				delete obj_dd;
#endif
				pthread_exit(NULL);
				return NULL;
			}

			// We only do lower prcisions on the first stage.
#if (MAX_PRECISION_LEVEL > 1)
			if(currStage == 0)
			{
				ret = obj_dbl->run(&locResults_dbl, item, locParams_dbl, locPreComps_dbl, NULL, false);
			}
			else
			{
#if (MAX_PRECISION_LEVEL > 2)
#if (MAX_PRECISION_LEVEL > 3)
				ret = obj_mp->run(&locResults_mp, item, params, precompute, locResults_mp.X, true);
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
				locResults.f = locResults_mp.f;
				for(int i = 0; i < DIM; i++)
				{
					locResults.X[i] = locResults_mp.X[i];
				}
#else /* MAX_PRECISION_LEVEL == 3, qd */
				ret = obj_qd->run(&locResults_qd, item, params, precompute, locResults_qd.X, true);
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
				locResults.f = locResults_qd.f;
				for(int i = 0; i < DIM; i++)
				{
					locResults.X[i] = locResults_qd.X[i];
				}
#endif
#else /* MAX_PRECISION_LEVEL == 2, dd */
				ret = obj_dd->run(&locResults_dd, item, params, precompute, locResults_dd.X, true);
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

				locResults.f = locResults_dd.f;
				for(int i = 0; i < DIM; i++)
				{
					locResults.X[i] = locResults_dd.X[i];
				}
#endif
			}
			
#else
			ret = obj_dbl->run(&locResults_dbl, item, params, precompute, NULL, false);
#endif

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

			if(currStage == 0)
			{
#if (MAX_PRECISION_LEVEL > 1)
				for(int i = 0; i < DIM; i++)
				{
					locResults_dd.X[i] = locResults_dbl.X[i];

					if(locResults_dd.X[i] - lbounds[i] < get_delta<dd_real>())
					{
						locResults_dd.X[i] = lbounds[i];
					}
					else if(ubounds[i] - locResults_dd.X[i] < get_delta<dd_real>())
					{
						locResults_dd.X[i] = ubounds[i];
					}
				}

				if(locResults_dbl.f < results[threadNum].f || locResults_dbl.f < get_delta<double>()*1e5)
				{
#ifdef VERBOSE
					cout << "Increasing precision to double-double" << endl;
					cout << "===============================================================" << endl;
#endif
#if (MAX_PRECISION_LEVEL > 2)
					ret = obj_dd->run(&locResults_dd, item, locParams_dd, locPreComps_dd, locResults_dd.X, true);
#else
					ret = obj_dd->run(&locResults_dd, item, params, precompute, locResults_dd.X, true);
#endif
					
					locResults.f = locResults_dd.f;
					for(int i = 0; i < DIM; i++)
					{
						locResults.X[i] = locResults_dd.X[i];
					}
				}
				else
				{
					locResults_dd.f = dd_real(locResults_dbl.f);
					for(int i = 0; i < DIM; i++)
					{
						locResults_dd.X[i] = dd_real(locResults_dbl.X[i]);
					}
				}

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
#if (MAX_PRECISION_LEVEL > 2)
				for(int i = 0; i < DIM; i++)
				{
					locResults_qd.X[i] = locResults_dd.X[i];
				}

				if(locResults_dd.f < results[threadNum].f || locResults_dd.f < get_delta<dd_real>()*1e5)
				{
#ifdef VERBOSE
					cout << "Increasing precision to qaud-double" << endl;
					cout << "===============================================================" << endl;
#endif					
#if (MAX_PRECISION_LEVEL > 3)
					ret = obj_qd->run(&locResults_qd, item, locParams_qd, locPreComps_qd, locResults_qd.X, true);
#else
					ret = obj_qd->run(&locResults_qd, item, params precompute, locResults_qd.X, true);
#endif
					
					locResults.f = locResults_qd.f;
					for(int i = 0; i < DIM; i++)
					{
						locResults.X[i] = locResults_qd.X[i];
					}
				}
				else
				{
					locResults_qd.f = dd_real(locResults_dd.f);
					for(int i = 0; i < DIM; i++)
					{
						locResults_qd.X[i] = dd_real(locResults_dd.X[i]);
					}
				}

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
#if (MAX_PRECISION_LEVEL > 3)
				for(int i = 0; i < DIM; i++)
				{
					locResults_mp.X[i] = locResults_qd.X[i];
				}

				if(locResults_qd.f < results[threadNum].f || locResults_qd.f < get_delta<qd_real>()*1e5)
				{
#ifdef VERBOSE
					cout << "Increasing precision to multi-precision" << endl;
					cout << "===============================================================" << endl;
#endif	
					ret = obj_mp->run(&locResults_mp, item, params, precompute, locResults_mp.X, true);
					
					locResults.f = locResults_mp.f;
					for(int i = 0; i < DIM; i++)
					{
						locResults.X[i] = locResults_mp.X[i];
					}
				}
				else
				{
					locResults_mp.f = dd_real(locResults_qd.f);
					for(int i = 0; i < DIM; i++)
					{
						locResults_mp.X[i] = dd_real(locResults_qd.X[i]);
					}
				}

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
#endif // (MAX_PRECISION_LEVEL > 3)
#endif // (MAX_PRECISION_LEVEL > 2)
#endif // (MAX_PRECISION_LEVEL > 1)
			}

			if(locResults.f < 0.0)
			{
				cout << "The cost function was negative before cast at: ";

				for(int i = 0; i < DIM; i++)
				{
					cout << to_out_string(locResults.X[i],25) << ",";
				}

				cout << endl;

				cout << "Applying hack to make it 0.0." << endl;

				locResults.f = 0.0;
			}

			

			if(mustCast)
			{
				bestCast = 1e10;
				castBoundaries<MAX_PRECISION_T>(0, 0, obj, params, precompute, locResults.X, XCast, &bestCast, bestCastX);

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


			MAX_PRECISION_T logRes = log10(locResults.f + get_epsilon<MAX_PRECISION_T>());
			int binNum;

			if(logRes > 0)
			{
				binNum = (2<<(BUCKETORD+1)) - 1;
			}
			else if(fabs(logRes) > BUCKETORD)
			{
				binNum = 0;
			}
			else
			{
				binNum = to_int(floor((locResults.f / pow(10.0,floor(fabs(logRes)))) * (2<<(BUCKETORD - to_int(floor(fabs(logRes))))))) + (2<<(BUCKETORD - to_int(floor(fabs(logRes))))) - 1;
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


	delete[] locResults_dbl.X;
	delete obj_dbl;

#if (MAX_PRECISION_LEVEL > 1)
	delete[] locResults_dd.X;
	delete obj_dd;
#endif
#if (MAX_PRECISION_LEVEL > 2)
	delete[] locResults_qd.X;
	delete obj_qd;
#endif
#if (MAX_PRECISION_LEVEL > 3)
	delete[] locResults_mp.X;
	delete obj_mp;
#endif

#if (MAX_PRECISION_LEVEL > 1)
	delete[] locParams_dbl;
#endif
#if (MAX_PRECISION_LEVEL > 2)
	delete[] locParams_dd;
#endif
#if (MAX_PRECISION_LEVEL > 3)
	delete[] locParams_qd;
#endif

	pthread_exit(NULL);
	return NULL;
}

int find_minima(OptimizeResult<MAX_PRECISION_T>* bestResult, OptimizeResult<MAX_PRECISION_T>* prevBest)
{
	ofstream outfile;
	MAX_PRECISION_T best;
	MAX_PRECISION_T* bestX;

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
		cout << "Thread " << i << " result is: " << to_out_string(results[i].f,4);
		cout << " at: ";

		for(int k = 0; k < DIM; k++)
		{
			cout << to_out_string(results[i].X[k],4) << " ";
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
		string fName = "stats_" + to_string(currStage) + ".csv";
		outfile.open(fName, ios::app );

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

void runExperiment(OptimizeResult<MAX_PRECISION_T>* prevBest)
{
	ofstream outfile;
    OptimizeResult<MAX_PRECISION_T> bestRun;
	MAX_PRECISION_T best;
	MAX_PRECISION_T* bestX = new MAX_PRECISION_T[DIM];
	bestRun.X = new MAX_PRECISION_T[DIM];

#ifndef SILENT
    cout << "---------Starting test---------" << endl;
#endif /*!SILENT*/

    find_minima(&bestRun, prevBest);

#ifndef SILENT
    cout << "---------Finished test---------" << endl;
#endif /*!SILENT*/

#ifndef TEST_START_POINTS

#ifndef SILENT
	cout << "Best result is: " << to_out_string(bestRun.f,4);
	cout << " at: ";

	for(int k = 0; k < DIM; k++)
	{
		cout << to_out_string(bestRun.X[k],4) << " ";
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
			cout << "Using previous best: " << to_out_string(prevBest->f,5) << " at: ";
			for(int k = 0; k < DIM; k++)
			{
				cout << to_out_string(prevBest->X[k],5) << ", ";
			}
			cout << endl;
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
		cout << "Best result now: " << to_out_string(best,4);
		cout << " at: ";

		for(int k = 0; k < DIM; k++)
		{
			cout << to_out_string(bestX[k],4) << " ";
		}
		cout << endl;
#endif /*!SILENT*/

		// Final stage will output full results.
		string fName = "results_" + to_string(currStage) + ".csv";
		outfile.open(fName, ios::app );

		outfile << to_string(currStage) << ",";

	    if(NPARAMS > 0)
	    {
	        outfile << to_out_string(params[0],4);

	        for(int i=1; i<NPARAMS; i++)
	        {
	            outfile << "," << to_out_string(params[i],4);
	        }

	        outfile << ",";
	    }

	    if(BOUNDED)
	    {
	        outfile << to_out_string(lbounds[0],4) << "," << to_out_string(ubounds[0],4);
	        for(int k = 1; k < DIM; k++)
	        {
	            outfile << "," << to_out_string(lbounds[k],4) << "," << to_out_string(ubounds[k],4);
	        }
	        outfile << ",";
	    }

		outfile << to_out_string(best,SIGDIG);

	    for(int k = 0; k < DIM; k++)
	    {
	        outfile << "," << to_out_string(bestX[k],SIGDIG);
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

void getAdjacentRes(int depth, int* bState, MAX_PRECISION_T** pBest, MAX_PRECISION_T*** pPoint, OptimizeResult<MAX_PRECISION_T>* res)
{
#ifndef SILENT
	cout << "Getting adjacent result." << endl;
#endif /*!SILENT*/

	if(boundaries[depth].steps > 0)
	{
		MAX_PRECISION_T* depthRes = pBest[depth];
		MAX_PRECISION_T** depthP = pPoint[depth];

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
		cout << "Got it, it was: " << res->f << " at: ";
		for(int k = 0; k < DIM; k++)
		{
			cout << to_out_string(res->X[k],4) << ", ";
		}
		cout << endl;
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

int boundaryRecursion(int depth, int dimCount, int currDimIdx, int* bState, MAX_PRECISION_T*** pBests, MAX_PRECISION_T**** pPoints, struct OptimizeResult<MAX_PRECISION_T>* bestRes, bool isStart, int stageNum)
{
	int initDimIdx = currDimIdx;
#ifndef SILENT
	cout << "Running Boundary Recursion." << endl;
#endif /*!SILENT*/
	int mult = 1;

	MAX_PRECISION_T** pBest = pBests[stageNum];
	MAX_PRECISION_T*** pPoint = pPoints[stageNum];

	if(BOUNDED)
	{
		if(depth == stages[stageNum].bSets)
		{
#ifdef TEST_START_POINTS
			runExperiment(&bestRes);
			return mult;
#else /*TEST_START_POINTS*/

#ifndef SILENT
			for(int k = 0; k < DIM; k++)
			{
				cout << "Boundaries for dimension " << k << " lower: ";
				cout << to_out_string(lbounds[k],4) << " upper: ";
				cout << to_out_string(ubounds[k],4) << endl;
			}
#endif /*!SILENT*/

			OptimizeResult<MAX_PRECISION_T> res;
			res.X = new MAX_PRECISION_T[DIM];
			MAX_PRECISION_T currBest = 1e10;
			MAX_PRECISION_T* point = new MAX_PRECISION_T[DIM];

#ifndef SILENT
			int stepCount = 1;

			cout << "Before getting bests: " << endl;
			for(int i = BSETS - 1; i >= 0; i--)
			{
				for(int j = 0; j < stepCount; j++)
				{
					cout << to_out_string(pBest[i][j],4) << ", ";
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
						for(int k = 0; k < DIM; k++)
						{
							point[k] = res.X[k];
						}
					}
				}
				else
				{
					for(int k = 0; k < DIM; k++)
					{
						point[k] = res.X[k];
					}
				}
			}

#ifndef SILENT
			cout << "Setting Bests, current best is: " << to_out_string(currBest,4) << endl;
#endif /*!SILENT*/

			bestRes->f = currBest;
			for(int k = 0; k < DIM; k++)
			{
				bestRes->X[k] = point[k];
			}

			delete[] res.X;
			delete[] point;

			// TODO: Fix for staging
			if(isStart && !RANDOMSEARCH)
			{
				if(2 * DIM * pow(NDIMPOINTS, DIM - 1) + 2 * DIM * pow(NDIMPOINTS - 1, DIM - 1) > workNumber)
				{
					workNumber = 2 * DIM * pow(NDIMPOINTS, DIM - 1) + 2 * DIM * pow(NDIMPOINTS - 1, DIM - 1);
				}

				nruns = 2 * DIM * pow(NDIMPOINTS, DIM - 1) + 2 * DIM * pow(NDIMPOINTS - 1, DIM - 1);

				startBound = false;
			}
#ifndef SILENT
			cout << "Running experiment." << endl;
#endif /*!SILENT*/

			cout << "Previous best is: " << to_out_string(bestRes->f,5) << " at: ";
			for(int k = 0; k < DIM; k++)
			{
				cout << to_out_string(bestRes->X[k],5) << ", ";
			}
			cout << endl;

			nruns = stages[currStage].get_density(bState);
			runExperiment(bestRes);
#ifndef SILENT
			cout << "Finished experiment." << endl;
#endif /*!SILENT*/

			pBest[BSETS - 1][0] = bestRes->f;
			for(int k = 0; k < DIM; k++)
			{
				pPoint[BSETS - 1][0][k] = bestRes->X[k];
			}

			// Now do the next stages if present.
			stageIteration(stageNum+1, dimCount, bState, pBests, pPoints);
#endif /*!TEST_START_POINTS*/
		}
		else
		{
#ifndef SILENT
			cout << "Boundary start at boundary set: " << depth << " is: " << bState[depth] << endl;
#endif /*!SILENT*/

			if(depth < bSetStartDepth)
			{
				// TEST: Set the boundaries around alredy minimized variables. Search only an isolated region.
				while(currDimIdx < DIM && stages[currStage].vars[currDimIdx] < dimCount + boundaries[depth].dim)
				{
					if(x0[stages[currStage].vars[currDimIdx]] + stages[currStage].pBSetOptSize[depth](x0) > boundaries[depth].startUpper(x0) + boundaries[depth].incrementUpper(x0) * bState[depth])
					{
						lbounds[currDimIdx] = boundaries[depth].startUpper(x0) + boundaries[depth].incrementUpper(x0) * bState[depth] - 2*stages[currStage].pBSetOptSize[depth](x0);
						ubounds[currDimIdx] = boundaries[depth].startUpper(x0) + boundaries[depth].incrementUpper(x0) * bState[depth];

						
					}
					else if(x0[stages[currStage].vars[currDimIdx]] - stages[currStage].pBSetOptSize[depth](x0) < boundaries[depth].startLower(x0) + boundaries[depth].incrementLower(x0) * bState[depth])
					{
						lbounds[currDimIdx] = boundaries[depth].startLower(x0) + boundaries[depth].incrementLower(x0) * bState[depth];
						ubounds[currDimIdx] = boundaries[depth].startLower(x0) + boundaries[depth].incrementLower(x0) * bState[depth] + 2*stages[currStage].pBSetOptSize[depth](x0);
					}
					else
					{
						lbounds[currDimIdx] = x0[stages[currStage].vars[currDimIdx]] + stages[currStage].pBSetOptSize[depth](x0);
						ubounds[currDimIdx] = x0[stages[currStage].vars[currDimIdx]] + stages[currStage].pBSetOptSize[depth](x0);
					}

					stepUp[currDimIdx] = ubounds[currDimIdx] - x0[stages[currStage].vars[currDimIdx]];
					stepDown[currDimIdx] = lbounds[currDimIdx] - x0[stages[currStage].vars[currDimIdx]];

					// Propagate these to lower precisions
#if (MAX_PRECISION_LEVEL > 1)
					stepDown_dbl[currDimIdx] = to_double(stepDown[currDimIdx]);
					stepUp_dbl[currDimIdx] = to_double(stepUp[currDimIdx]);
					lbounds_dbl[currDimIdx] = to_double(lbounds[currDimIdx]);
					ubounds_dbl[currDimIdx] = to_double(ubounds[currDimIdx]);
#endif
#if (MAX_PRECISION_LEVEL > 2)
					stepDown_dd[currDimIdx] = to_dd_real(stepDown[currDimIdx]);
					stepUp_dd[currDimIdx] = to_dd_real(stepUp[currDimIdx]);
					lbounds_dd[currDimIdx] = to_dd_real(lbounds[currDimIdx]);
					ubounds_dd[currDimIdx] = to_dd_real(ubounds[currDimIdx]);
#endif
#if (MAX_PRECISION_LEVEL > 3)
					stepDown_qd[currDimIdx] = to_qd_real(stepDown[currDimIdx]);
					stepUp_qd[currDimIdx] = to_qd_real(stepUp[currDimIdx]);
					lbounds_qd[currDimIdx] = to_qd_real(lbounds[currDimIdx]);
					ubounds_qd[currDimIdx] = to_qd_real(ubounds[currDimIdx]);
#endif
					currDimIdx++;
				}

				mult = boundaryRecursion(depth + 1, dimCount + boundaries[depth].dim, currDimIdx, bState, pBests, pPoints, bestRes, false, stageNum);
#ifndef TEST_START_POINTS
				// Copy results to layer below.
				if(BSETS > 1 && depth > 0)
				{
					MAX_PRECISION_T* nextLevelBest = pBest[depth];
					MAX_PRECISION_T** nextLevelPoint = pPoint[depth];
					MAX_PRECISION_T* levelBest = pBest[depth - 1];
					MAX_PRECISION_T** levelPoint = pPoint[depth - 1];

					for(int j = 0; j < mult; j++)
					{
						levelBest[bState[depth]*mult + j] = nextLevelBest[j];
						for(int k = 0; k < DIM; k++)
						{
							levelPoint[bState[depth]*mult + j][k] = nextLevelPoint[j][k];
						}
					}
				}
#endif /*!TEST_START_POINTS*/
				
			}
			else
			{
				for(int i = bState[depth]; i <= boundaries[depth].steps; i++)
				{
					bState[depth] = i;

					cout << "HERE SUCCESSFULLY" << endl;

					cout << "BSTATE " << bState[0] << endl;

					cout << "INDEX " << i << endl;

					cout << "currDimIdx " << currDimIdx << endl;

					while(currDimIdx < DIM && stages[currStage].vars[currDimIdx] < dimCount + boundaries[depth].dim)
					{
						cout << "LOOPING TO SET BOUNDS" << endl;

						lbounds[currDimIdx] = boundaries[depth].startLower(x0) + boundaries[depth].incrementLower(x0) * i;
						ubounds[currDimIdx] = boundaries[depth].startUpper(x0) + boundaries[depth].incrementUpper(x0) * i;

						cout << "BOUND LOWER IS " << to_out_string(lbounds[currDimIdx],4) << endl;

						// If this is the first boundary in this set and we have the sym option, then just searh upper region
						if(boundaries[depth].hasSym && currDimIdx == dimCount)
						{
							lbounds[currDimIdx] = 0.0;
						}

						stepUp[currDimIdx] = boundaries[depth].incrementUpper(x0);
						stepDown[currDimIdx] =  boundaries[depth].incrementLower(x0);

						// Propagate these to lower precisions
#if (MAX_PRECISION_LEVEL > 1)
						stepDown_dbl[currDimIdx] = to_double(stepDown[currDimIdx]);
						stepUp_dbl[currDimIdx] = to_double(stepUp[currDimIdx]);
						lbounds_dbl[currDimIdx] = to_double(lbounds[currDimIdx]);
						ubounds_dbl[currDimIdx] = to_double(ubounds[currDimIdx]);
#endif
#if (MAX_PRECISION_LEVEL > 2)
						stepDown_dd[currDimIdx] = to_dd_real(stepDown[currDimIdx]);
						stepUp_dd[currDimIdx] = to_dd_real(stepUp[currDimIdx]);
						lbounds_dd[currDimIdx] = to_dd_real(lbounds[currDimIdx]);
						ubounds_dd[currDimIdx] = to_dd_real(ubounds[currDimIdx]);
#endif
#if (MAX_PRECISION_LEVEL > 3)
						stepDown_qd[currDimIdx] = to_qd_real(stepDown[currDimIdx]);
						stepUp_qd[currDimIdx] = to_qd_real(stepUp[currDimIdx]);
						lbounds_qd[currDimIdx] = to_qd_real(lbounds[currDimIdx]);
						ubounds_qd[currDimIdx] = to_qd_real(ubounds[currDimIdx]);
#endif
						currDimIdx++;
					}
					
					mult = boundaryRecursion(depth + 1, dimCount + boundaries[depth].dim, currDimIdx, bState, pBests, pPoints, bestRes, i == 0, stageNum);

#ifndef TEST_START_POINTS
					// Copy results to layer below.
					if(BSETS > 1 && depth > 0)
					{
						MAX_PRECISION_T* nextLevelBest = pBest[depth];
						MAX_PRECISION_T** nextLevelPoint = pPoint[depth];
						MAX_PRECISION_T* levelBest = pBest[depth - 1];
						MAX_PRECISION_T** levelPoint = pPoint[depth - 1];

						for(int j = 0; j < mult; j++)
						{
							levelBest[i*mult + j] = nextLevelBest[j];
							for(int k = 0; k < DIM; k++)
							{
								levelPoint[i*mult + j][k] = nextLevelPoint[j][k];
							}
						}
					}
					cout << "END OF FOR LOOP" << endl;

					currDimIdx = initDimIdx;
#endif /*!TEST_START_POINTS*/
				}
				bState[depth] = 0;
			}
			
			mult *= (boundaries[depth].steps + 1);

#ifndef TEST_START_POINTS
			int stepCount = 1;
#ifndef SILENT
			cout << "After propagating bests: " << endl;
			for(int i = BSETS - 1; i >= 0; i--)
			{
				for(int j = 0; j < stepCount; j++)
				{
					cout << to_out_string(pBest[i][j],4) << ", ";
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
        runExperiment(bestRes);
    }



	return mult;
}

// We do this intermingled with the boundary recursion, so we need to store all the previous bests
void stageIteration(int stageNum, int dimCount, int* bState, MAX_PRECISION_T*** pBests, MAX_PRECISION_T**** pPoints)
{
	struct OptimizeResult<MAX_PRECISION_T> bestRes;

	MAX_PRECISION_T* pubounds;
	MAX_PRECISION_T* plbounds;
	MAX_PRECISION_T* pstepUp;
	MAX_PRECISION_T* pstepDown;
	int pbSetStartDepth;
	int pCurrStage;
	ofstream outfile;

#if (MAX_PRECISION_LEVEL > 1)
	double* pstepDown_dbl;
	double* pstepUp_dbl;
	double* plbounds_dbl;
	double* pubounds_dbl;
#endif
#if (MAX_PRECISION_LEVEL > 2)
	dd_real* pstepDown_dd;
	dd_real* pstepUp_dd;
	dd_real* plbounds_dd;
	dd_real* pubounds_dd;
#endif
#if (MAX_PRECISION_LEVEL > 3)
	qd_real* pstepDown_qd;
	qd_real* pstepUp_qd;
	qd_real* plbounds_qd;
	qd_real* pubounds_qd;
#endif

	if(stageNum < NSTAGES)
	{
		// Set the sizes for current stage
		DIM = stages[stageNum].dim;
		BSETS = stages[stageNum].bSets;
		PALGO = ALGO;
		ALGO = stages[stageNum].algorithm;

		pCurrStage = currStage;
		currStage = stageNum;

		// Allocate memory for x

		// Allocate memory for bounds
		bestRes.f = 1e10;
		bestRes.X = new MAX_PRECISION_T[DIM];
		currBestRes = &bestRes;

		// Count boundary sets covered.
		// Are we just in the same boundary set? Is it a whole new one, or are we stradelling.
		// This causes a very complex scenario for the previous bests. 
		// Actually we just need to shelve and treat previous bests stage by stage

		// Previous bests for all stages are kept and carried in a large array.

		// Shelve previous state
		pbSetStartDepth = bSetStartDepth;
		pubounds = ubounds;
		plbounds = lbounds;
		pstepUp = stepUp;
		pstepDown = stepDown;

#if (MAX_PRECISION_LEVEL > 1)
		pstepDown_dbl = stepDown_dbl;
		pstepUp_dbl = stepUp_dbl;
		plbounds_dbl = lbounds_dbl;
		pubounds_dbl = ubounds_dbl;
#endif
#if (MAX_PRECISION_LEVEL > 2)
		pstepDown_dd= stepDown_dd;
		pstepUp_dd = stepUp_dd;
		plbounds_dd = lbounds_dd;
		pubounds_dd = ubounds_dd;
#endif
#if (MAX_PRECISION_LEVEL > 3)
		pstepDown_qd= stepDown_qd;
		pstepUp_qd = stepUp_qd;
		plbounds_qd = lbounds_qd;
		pubounds_qd = ubounds_qd;
#endif

		if(stageNum > 0)
		{
			bSetStartDepth = stages[stageNum-1].bSets;
		}

		ubounds = new MAX_PRECISION_T[DIM];
        lbounds = new MAX_PRECISION_T[DIM];
		stepUp = new MAX_PRECISION_T[DIM];
		stepDown = new MAX_PRECISION_T[DIM];

#if (MAX_PRECISION_LEVEL > 1)
		stepDown_dbl = new double[DIM];
		stepUp_dbl = new double[DIM];
		lbounds_dbl = new double[DIM];
		ubounds_dbl = new double[DIM];
#endif
#if (MAX_PRECISION_LEVEL > 2)
		stepDown_dd = new dd_real[DIM];
		stepUp_dd = new dd_real[DIM];
		lbounds_dd = new dd_real[DIM];
		ubounds_dd = new dd_real[DIM];
#endif
#if (MAX_PRECISION_LEVEL > 3)
		stepDown_qd = new qd_real[DIM];
		stepUp_qd = new qd_real[DIM];
		lbounds_qd = new qd_real[DIM];
		ubounds_qd = new qd_real[DIM];
#endif
			
		// Run
		cout << "Doing a boundary recursion from the satage iteration." << endl;
		boundaryRecursion(0, dimCount, 0, bState, pBests, pPoints, &bestRes, false, stageNum);

		// Copy current x onto the full x
		for(int k = 0; k < DIM; k++)
		{
			x0[stages[stageNum].vars[k]] = pPoints[stageNum][BSETS - 1][0][k];
		}

		// Free memory
		delete[] bestRes.X;
		delete[] ubounds;
		delete[] lbounds;
		delete[] stepUp;
		delete[] stepDown;

#if (MAX_PRECISION_LEVEL > 1)
		delete[] stepDown_dbl;
		delete[] stepUp_dbl;
		delete[] lbounds_dbl;
		delete[] ubounds_dbl;
#endif
#if (MAX_PRECISION_LEVEL > 2)
		delete[] stepDown_dd;
		delete[] stepUp_dd;
		delete[] lbounds_dd;
		delete[] ubounds_dd;
#endif
#if (MAX_PRECISION_LEVEL > 3)
		delete[] stepDown_qd;
		delete[] stepUp_qd;
		delete[] lbounds_qd;
		delete[] ubounds_qd;
#endif

		ubounds = pubounds;
		lbounds = plbounds;
		stepUp = pstepUp;
		stepDown = pstepDown;
		bSetStartDepth = pbSetStartDepth;

#if (MAX_PRECISION_LEVEL > 1)
		stepDown_dbl = pstepDown_dbl;
		stepUp_dbl = pstepUp_dbl;
		lbounds_dbl = plbounds_dbl;
		ubounds_dbl = pubounds_dbl;
#endif
#if (MAX_PRECISION_LEVEL > 2)
		stepDown_dd = pstepDown_dd;
		stepUp_dd = pstepUp_dd;
		lbounds_dd = plbounds_dd;
		ubounds_dd = pubounds_dd;
#endif
#if (MAX_PRECISION_LEVEL > 3)
		stepDown_qd = pstepDown_qd;
		stepUp_qd = pstepUp_qd;
		lbounds_qd = plbounds_qd;
		ubounds_qd = pubounds_qd;
#endif

		currStage = pCurrStage;
	}
	else
	{
		// Final stage will output full results.
		outfile.open("results.csv", ios::app );

		outfile << to_string(currStage) << ",";

	    if(NPARAMS > 0)
	    {
	        outfile << to_out_string(params[0],4);

	        for(int i=1; i<NPARAMS; i++)
	        {
	            outfile << "," << to_out_string(params[i],4);
	        }

	        outfile << ",";
	    }

	    if(BOUNDED)
	    {
	        outfile << to_out_string(lbounds[0],4) << "," << to_out_string(ubounds[0],4);
	        for(int k = 1; k < DIM; k++)
	        {
	            outfile << "," << to_out_string(lbounds[k],4) << "," << to_out_string(ubounds[k],4);
	        }
	        outfile << ",";
	    }

		/*NOTE: Extra out must bring its own leading comma*/
		EXTRAOUT

		outfile << to_out_string(pBests[NSTAGES-1][BSETS - 1][0],SIGDIG);

	    for(int k = 0; k < FULLDIM; k++)
	    {
	        outfile << "," << to_out_string(x0[k],SIGDIG);
	    }

	    outfile << endl;

	    outfile.close();

		for(int k = 0; k < FULLDIM; k++)
		{
			x0[k] = 0.0;
		}
	}
}

void parameterRecursion(int depth, int* paramState, int* bState, MAX_PRECISION_T*** pBests, MAX_PRECISION_T**** pPoints)
{
#ifndef SILENT
	cout << "Running Parameter Recursion." << endl;
#endif /*!SILENT*/

    if(depth == NPARAMS)
    {
#ifdef PARAMSCONSTSCOUNT
			PARAMCOMPUTE(params);
#endif /*PARAMSCONSTSCOUNT*/

		// Now we call the stage iteration
		stageIteration(0, 0, bState, pBests, pPoints);

		// Test: Fix this, parameter recursion will require resets on alllll stages.
		bState[0] = 0;
		for(int i = 0; i < NSTAGES; i++)
			pBests[i][stages[i].bSets - 1][0] = 1e10;
    }
    else
    {
		// This may seem hanky, but we use function pointers stored by the function.h file. This allows for conditions dependent on previous parameters.
        parameter_t<MAX_PRECISION_T> currentParam  = parameters[depth];
        for(int i=paramState[depth]; i <= (*(currentParam.steps))(params, depth); i++)
        {
            params[depth] = (*(currentParam.get))(i, params, depth);

#ifndef SILENT
			cout << "Parameter at: " << depth << " is: " << to_out_string(params[depth],4) << endl;
#endif /*!SILENT*/

			// Now we call the stage iteration
            parameterRecursion(depth + 1, paramState, bState, pBests, pPoints);
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

void getLineResult(string line, OptimizeResult<MAX_PRECISION_T>* res)
{
	istringstream iss(line);
	string s;
	for(int i = 0; i < NPARAMS + 2*DIM + NEXTRADATA; i++)
	{
		getline( iss, s, ',' );
	}

	getline( iss, s, ',' );
	res->f = MAX_PRECISION_T(s.c_str());
	for(int i = 0; i < DIM; i++)
	{
		getline( iss, s, ',' );
		res->X[i] = MAX_PRECISION_T(s.c_str());
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

// TODO: Fix with the new staged optimisation
void getPrevResuts(ifstream* infile, int* bState, MAX_PRECISION_T** pBest, MAX_PRECISION_T*** pPoint)
{
	int dimSize = 1;
	bool startReached = false;
	if(infile->is_open())
	{
		OptimizeResult<MAX_PRECISION_T> res;
		res.X = new MAX_PRECISION_T[DIM];

#ifndef SILENT
		cout << "Previous results are: " << endl;
#endif /*!SILENT*/

		for(int i = BSETS - 1; i >= 0; i--)
		{
			startReached = false;

			MAX_PRECISION_T* dimPBest = pBest[i];
			MAX_PRECISION_T** dimPPoint = pPoint[i];

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
					MAX_PRECISION_T* newX = dimPPoint[index];

					for(int k = 0; k < DIM; k++)
					{
						newX[k] = res.X[k];
					}

#ifndef SILENT
					cout << ", " << to_out_string(res.f,4);
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
		cerr << "Unable to open results file" << endl;
		std::cerr.flush();
		std::_Exit(EXIT_FAILURE);
	}
}

int main(int argc, char **argv)
{
    int threadReturn;
	MAX_PRECISION_T* pParams;

#ifdef USE_MPI
	int ierr;
#endif

	int ret = ode_init(&ode_wspace);

	int zVec[2] = {2,0};
	MAX_PRECISION_T tVec[2] = {con_fun<MAX_PRECISION_T>("0.0"),con_fun<MAX_PRECISION_T>("0.5")};
	MAX_PRECISION_T rep_time =con_fun<MAX_PRECISION_T>("0.001");
	MAX_PRECISION_T ode_phi = con_fun<MAX_PRECISION_T>("1.0");
	int ode_dim = 2;

	ret = ode_run(zVec,tVec,rep_time,ode_phi,ode_dim,&ode_wspace);


	cout << "Phase is: " << to_out_string(ode_wspace.phase[0],4) << endl;
	cout << "Position is: " << to_out_string(ode_wspace.position[0],4) << endl;

	MAX_PRECISION_T cost = (MAX_PRECISION_T(1.0)/MAX_PRECISION_T(3.0))*pow(abs(ode_wspace.phase[0]) - dd_real::_pi2,2) + dd_real(0.2)*(pow(ode_wspace.position[0]+initDisp,2) + pow(ode_wspace.position[1]-initDisp,2)) + MAX_PRECISION_T(0.2)*(pow(ode_wspace.position[2]+initDisp,2) + pow(ode_wspace.position[3]-initDisp,2));

	ode_dest(&ode_wspace);

	cout << "Cost is: " << to_out_string(cost,4) << endl;

	return 0;
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
	ierr = MPI_Alloc_mem(2*(1+DIM)*sizeof(MAX_PRECISION_T), MPI_INFO_NULL, s_res);
	if(!checkMPIError(ierr))
		return 0;
	nodeBest = &s_res[0];
	nodeX = new MAX_PRECISION_T*[2];
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
	ierr = MPI_Win_create(&s_res, 2*(1+DIM)*sizeof(MAX_PRECISION_T), sizeof(MAX_PRECISION_T), MPI_INFO_NULL, MPI_COMM_WORLD, &res_window);
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
    params = new MAX_PRECISION_T[NPARAMS];
    parameters = new parameter_t<MAX_PRECISION_T>[NPARAMS];

	x0 = new MAX_PRECISION_T[FULLDIM];
    boundaries = new boundary_t<MAX_PRECISION_T>[FULLBSETS];
	stages = new stage_t<MAX_PRECISION_T>[NSTAGES];

	STAGES

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

	int* paramState;

	if(NPARAMS > 0)
		paramState = new int[NPARAMS];

	// TEST: This memory assignment needs changing for new code
	int* bState = new int[FULLBSETS];

	MAX_PRECISION_T*** pBests = new MAX_PRECISION_T**[NSTAGES];
	MAX_PRECISION_T**** pPoints = new MAX_PRECISION_T***[NSTAGES];

	for(int i = 0; i < NSTAGES; i++)
	{

		pBests[i] = new MAX_PRECISION_T*[stages[i].bSets];
		pPoints[i] = new MAX_PRECISION_T**[stages[i].bSets];

		int stepCount = 1;

		for(int j = stages[i].bSets - 1; j >= 0; j--)
		{
			pBests[i][j] = new MAX_PRECISION_T[stepCount];
			pPoints[i][j] = new MAX_PRECISION_T*[stepCount];
			for(int k = 0; k < stepCount; k++)
			{
				pPoints[i][j][k] = new MAX_PRECISION_T[stages[i].dim];
			}
			stepCount *= (boundaries[j].steps + 1);
		}
	}

	for(int i = 0; i < NPARAMS; i++)
	{
		paramState[i] = 0;
	}

	for(int i = 0; i < FULLBSETS; i++)
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
// TODO: Remove this.
#ifdef NEVER
		infile.open("results.csv", std::ifstream::in );
		if(infile.is_open())
		{
#ifndef SILENT
			cout << "Found previous results." << endl;
		 	cout << lastLine.c_str() << endl;
#endif /*!SILENT*/
	  		istringstream iss(lastLine);
			string s;
			pParams = new MAX_PRECISION_T[NPARAMS];
			for(int i = 0; i < NPARAMS; i++)
			{
				getline( iss, s, ',' );

				MAX_PRECISION_T param = MAX_PRECISION_T(s.c_str());
				pParams[i] = param;
				parameter_t<MAX_PRECISION_T> currentParam  = parameters[i];

				int iteration = (*(currentParam.findPos))(param,pParams,i);

				paramState[i] = iteration;
#ifndef SILENT
				cout << iteration << endl;
#endif /*!SILENT*/
			}
			delete[] pParams;

			// TODO: Fix this for the new code
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
						MAX_PRECISION_T bound = MAX_PRECISION_T(s.c_str());
						int iteration = 0;
						if((bound - boundaries[i].startUpper) > get_epsilon<MAX_PRECISION_T>())
						{
							iteration = to_int(nint((bound - boundaries[i].startUpper) / boundaries[i].incrementUpper));
						}

						bSetComplete = true;
						bState[i] = iteration;

#ifndef SILENT
						cout << "Read Bound as: " << to_out_string(bound,4) << endl;
						cout << "Upper start: " << to_out_string(boundaries[i].startUpper,4) << endl;
						cout << "Upper increment: " << to_out_string(boundaries[i].incrementUpper,4) << endl;
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
#endif /* NEVER */
	}
	else
	{
		for(int i = 0; i < NSTAGES; i++)
			pBests[i][stages[i].bSets - 1][0] = 1e10;

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
	nThreads=1;

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

	results = new OptimizeResult<MAX_PRECISION_T>[nThreads];
    for(int i=0; i<(nThreads); i++)
	{
        results[i].X = new MAX_PRECISION_T[FULLDIM];
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
		pthread_mutex_unlock(&theadCoordLock);
	}

#endif /* !TEST_START_POINTS */

    parameterRecursion(0, paramState, bState, pBests, pPoints);

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


	// TEST: Again this memory management needs fixing
	for(int i = 0; i < NSTAGES; i++)
	{
		int stepCount = 1;

		for(int j = stages[i].bSets - 1; j >= 0; j--)
		{
			for(int k = 0; k < stepCount; k++)
			{
				delete[] pPoints[i][j][k];
			}

			delete[] pBests[i][j];
			delete[] pPoints[i][j];
			stepCount *= (boundaries[j].steps + 1);
		}

		delete[] pBests[i];
		delete[] pPoints[i];
	}

	delete[] pBests;
	delete[] pPoints;
	delete[] bState;

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
