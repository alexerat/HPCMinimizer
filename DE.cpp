//       D I F F E R E N T I A L     E V O L U T I O N
//
// Program: de.c
// Version: 3.6
//
// Authors: Dr. Rainer Storn
//         c/o ICSI, 1947 Center Street, Suite 600
//         Berkeley, CA 94707
//         Tel.:   510-642-4274 (extension 192)
//         Fax.:   510-643-7684
//         E-mail: storn@icsi.berkeley.edu
//         WWW: http://http.icsi.berkeley.edu/~storn/
//         on leave from
//         Siemens AG, ZFE T SN 2, Otto-Hahn Ring 6
//         D-81739 Muenchen, Germany
//         Tel:    636-40502
//         Fax:    636-44577
//         E-mail: rainer.storn@zfe.siemens.de
//
//         Kenneth Price
//         836 Owl Circle
//         Vacaville, CA 95687
//         E-mail: kprice@solano.community.net
//
//  Changes for Visual Sutdio 2010, by Charles Brauer
//
// This program implements some variants of Differential
// Evolution (DE) as described in part in the techreport
// tr-95-012.ps of ICSI. You can get this report either via
// ftp.icsi.berkeley.edu/pub/techreports/1995/tr-95-012.ps.Z
// or via WWW: http://http.icsi.berkeley.edu/~storn/litera.html*
// A more extended version of tr-95-012.ps is submitted for
// publication in the Journal Evolutionary Computation.
//
// ou may use this program for any purpose, give it to any
// person or change it according to your needs as long as you
// are referring to Rainer Storn and Ken Price as the origi-
// nators of the the DE idea.
// If you have questions concerning DE feel free to contact
// us. We also will be happy to know about your experiences
// with DE and your suggestions of improvement.

#include <iostream>
#include "de.h"

using namespace std;

floatval_t rnd_uni(long *idum);

int CopyVector(floatval_t* a, floatval_t* b, int D)
{
    for (int k=0; k<D; k++)
    {
        a[k] = b[k];
    }
    return 0;
}

int CopyArray(floatval_t* dest, floatval_t* src, int D, int NP)
{
    for (int j=0; j<NP; j++)
    {
        for (int k=0; k<D; k++)
        {
            dest[j * D + k] = src[j * D + k];
        }
    }
    return 0;
}

// SRC-FUNCTION   :de()
// LONG_NAME      :de program
// AUTHOR         :Rainer Storn, Kenneth Price
//
// DESCRIPTION    :driver program for differential evolution.
//
// FUNCTIONS      :rnd_uni(), evaluate(), printf(), fprintf(),
//                fopen(), fclose(), fscanf().
//
// GLOBALS        :rnd_uni_init    input variable for rnd_uni()
//
// PARAMETERS     :D            Dimension of the problem.
//                NP            Size of the population to maintain.
//                lbound        Lower box bounds.
//                ubound        Upper box bounds.
//                ini_lbound    Lower initial point box bounds.
//                ini_ubound    Upper initial point box bounds.
//                strategy      Strategy to use for mutation.
//                genmax        Maximum number of generations.
//                F             Control variable for DE.
//                CR            Control variable for DE.
//                refresh       Number of iterations for output cycle, 0 for no output.
//                seed          The random seed to use for random numbers.
//
// PRECONDITIONS  :main must be called with three parameters
//                e.g. like de1 <input-file> <output-file>, if
//                the executable file is called de1.
//                The input file must contain valid inputs accor-
//                ding to the fscanf() section of main().
//
// POSTCONDITIONS :main() produces consecutive console outputs and
//                writes the final results in an output file if
//                the program terminates without an error.

int de(int D, floatval_t *x, floatval_t *fx, floatval_t* lbound, floatval_t* ubound, floatval_t *extparams,
       de_evaluate_t proc_evaluate, void *instance, int NP, floatval_t* ini_lbound, floatval_t* ini_ubound,
       int strategy, int genmax, floatval_t F, floatval_t CR, int refresh, floatval_t* c, floatval_t* d,
       floatval_t* oldarray, floatval_t* newarray, floatval_t* swaparray, floatval_t* tmp, floatval_t* best,
       floatval_t* bestit, floatval_t* energy)
{
    int   i, j, L, n;      // counting variables
    int   r1, r2, r3, r4;  // placeholders for random indexes
    int   r5;              // placeholders for random indexes
    int   imin;            // index to member with lowest energy
    int   gen;
    long  nfeval = 0;          // number of function evaluations
    bool  terminate = false;
    floatval_t trial_energy;    // buffer variable
    floatval_t emin;            // help variables
    floatval_t mean;
    floatval_t stdDev;
    floatval_t convergence;
    floatval_t r;

    // spread initial population members
    for (i=0; i<NP; i++)
    {
        for (j=0; j<D; j++)
        {
            r = rnd_uni();
            c[i * D + j] = ini_lbound[j] + r*(ini_ubound[j] - ini_lbound[j]);
        }
        energy[i] = proc_evaluate(instance, &c[i * D], extparams, D);
        nfeval++;
        // printf("%2d %20.8f %3d\n", i, energy[i], nfeval);
        // cin.get(ch);
    }

    emin = energy[0];
    imin = 0;
    for (i=1; i<NP; i++)
    {
        if (energy[i] < emin)
        {
            emin = energy[i];
            imin = i;
        }
    }

    CopyVector(best, &c[imin * D], D);
    CopyVector(bestit, &c[imin * D], D);

    // old population (generation G)
    // new population (generation G+1)
    CopyArray(oldarray, c, D, NP);
    // new population (generation G+1)
    CopyArray(newarray, d, D, NP);

    // Iteration loop
    gen = 0; // generation counter reset
    while ((gen < genmax) && !terminate)
    {
        gen++;
        imin = 0;
        mean = 0.;
        stdDev = 0.;

        for (i=0; i<NP; i++)
        {
            // Pick a random population member
            do
            {
                // Endless loop for NP < 2 !!!
                r1 = rand()%NP;
            } while(r1 == i);

            do
            {
                // Endless loop for NP < 3 !!!
                r2 = rand()%NP;
            } while((r2 == i) || (r2 == r1));

            do
            {
                // Endless loop for NP < 4 !!!
                r3 = rand()%NP;
            } while((r3 == i) || (r3 == r1) || (r3 == r2));

            do
            {
                // Endless loop for NP < 5 !!!
                r4 = rand()%NP;
            } while((r4 == i) || (r4 == r1) || (r4 == r2) || (r4 == r3));

            do
            {
                // Endless loop for NP < 6 !!!
                r5 = rand()%NP;
            } while((r5==i) || (r5==r1) || (r5==r2) || (r5==r3) || (r5==r4));

            // Choice of strategy
            // We have tried to come up with a sensible naming-convention: DE/x/y/z
            //   DE :  stands for Differential Evolution
            //   x  :  a string which denotes the vector to be perturbed
            //   y  :  number of difference vectors taken for perturbation of x
            //   z  :  crossover method (exp = exponential, bin = binomial)
            //
            // There are some simple rules which are worth following:
            //   1)  F is usually between 0.5 and 1 (in rare cases > 1)
            //   2)  CR is between 0 and 1 with 0., 0.3, 0.7 and 1. being worth to be tried first
            //   3)  To start off NP = 10*D is a reasonable choice. Increase NP if misconvergence=
            //       happens.
            //   4)  If you increase NP, F usually has to be decreased
            //   5)  When the DE/best... schemes fail DE/rand... usually works and vice versa


            // EXPONENTIAL CROSSOVER
            // DE/best/1/exp
            // Our oldest strategy but still not bad. However, we have found several
            // optimization problems where misconvergence occurs.

            // strategy DE0 (not in our paper)
            if(strategy == 1)
            {
                for (int k=0; k<D; k++)
                {
                    tmp[k] = oldarray[i * D + k];
                }
                n = rand()%D;
                L = 0;
                do
                {
                    tmp[n] = bestit[n] + F*(oldarray[r2 * D + n] - oldarray[r3 * D + n]);

                    if(ubound != NULL && tmp[n] - ubound[n] > EPS)
                    {
                        tmp[n] = ubound[n];
                    }
                    else if(lbound != NULL && lbound[n] - tmp[n] > EPS)
                    {
                        tmp[n] = lbound[n];
                    }

                    n = (n+1)%D;
                    L++;
                } while((rnd_uni() < CR) && (L < D));
            }
            // DE/rand/1/exp
            // This is one of my favourite strategies. It works especially well when the
            // "bestit[]"-schemes experience misconvergence. Try e.g. F=0.7 and CR = 0.5
            // as a first guess.
            // strategy DE1 in the techreport
            else if (strategy == 2)
            {
                for (int k=0; k<D; k++)
                {
                    tmp[k] = oldarray[i * D + k];
                }

                n = rand()%D;
                L = 0;

                do
                {
                    tmp[n] = oldarray[r1 * D + n] + F*(oldarray[r2 * D + n] - oldarray[r3 * D + n]);

                    if(ubound != NULL && tmp[n] - ubound[n] > EPS)
                    {
                        tmp[n] = ubound[n];
                    }
                    else if(lbound != NULL && lbound[n] - tmp[n] > EPS)
                    {
                        tmp[n] = lbound[n];
                    }

                    n = (n+1)%D;
                    L++;
                } while((rnd_uni() < CR) && (L < D));
            }
            // DE/rand-to-best/1/exp
            // This strategy seems to be one of the best strategies. Try F=0.85 and CR = 1.0
            // If you get misconvergence try to increase NP. If this doesn't help you
            // should play around with all three control variables.
            // similiar to DE2 but generally better
            else if (strategy == 3)
            {
                for (int k=0; k<D; k++)
                {
                    tmp[k] = oldarray[i * D + k];
                }

                n = rand()%D;
                L = 0;

                do
                {
                    tmp[n] = tmp[n] + F*(bestit[n] - tmp[n]) + F*(oldarray[r1 * D + n] - oldarray[r2 * D + n]);

                    if(ubound != NULL && tmp[n] - ubound[n] > EPS)
                    {
                        tmp[n] = ubound[n];
                    }
                    else if(lbound != NULL && lbound[n] - tmp[n] > EPS)
                    {
                        tmp[n] = lbound[n];
                    }

                    n = (n+1)%D;
                    L++;
                } while((rnd_uni() < CR) && (L < D));
            }
            // DE/best/2/exp is another powerful strategy worth trying
            else if (strategy == 4)
            {
                for (int k=0; k<D; k++)
                {
                    tmp[k] = oldarray[i * D + k];
                }

                n = rand()%D;
                L = 0;

                do
                {
                    tmp[n] = bestit[n] + (oldarray[r1 * D + n] + oldarray[r2 * D + n] - oldarray[r3 * D + n] - oldarray[r4 * D + n])*F;

                    if(ubound != NULL && tmp[n] - ubound[n] > EPS)
                    {
                        tmp[n] = ubound[n];
                    }
                    else if(lbound != NULL && lbound[n] - tmp[n] > EPS)
                    {
                        tmp[n] = lbound[n];
                    }

                    n = (n+1)%D;
                    L++;
                } while((rnd_uni() < CR) && (L < D));
            }
            // DE/rand/2/exp seems to be a robust optimizer for many functions
            else if (strategy == 5)
            {
                for (int k=0; k<D; k++)
                {
                    tmp[k] = oldarray[i * D + k];
                }

                n = rand()%D;
                L = 0;

                do
                {
                    tmp[n] = oldarray[r5 * D + n] + (oldarray[r1 * D + n] + oldarray[r2 * D + n] - oldarray[r3 * D + n] - oldarray[r4 * D + n])*F;

                    if(ubound != NULL && tmp[n] - ubound[n] > EPS)
                    {
                        tmp[n] = ubound[n];
                    }
                    else if(lbound != NULL && lbound[n] - tmp[n] > EPS)
                    {
                        tmp[n] = lbound[n];
                    }

                    n = (n+1)%D;
                    L++;
                } while((rnd_uni() < CR) && (L < D));
            }
            // Essentially same strategies but BINOMIAL CROSSOVER
            // DE/best/1/bin
            else if (strategy == 6)
            {
                for (int k=0; k<D; k++)
                {
                    tmp[k] = oldarray[i * D + k];
                }

                n = rand()%D;

                // perform D binomial trials
                for (L=0; L<D; L++)
                {
                    // change at least one parameter
                    if ((rnd_uni() < CR) || L == (D-1))
                    {
                        tmp[n] = bestit[n] + F*(oldarray[r2 * D + n] - oldarray[r3 * D + n]);

                        if(ubound != NULL && tmp[n] - ubound[n] > EPS)
                        {
                            tmp[n] = ubound[n];
                        }
                        else if(lbound != NULL && lbound[n] - tmp[n] > EPS)
                        {
                            tmp[n] = lbound[n];
                        }
                    }
                    n = (n+1)%D;
                }
            }
            // DE/rand/1/bin
            else if (strategy == 7)
            {
                for (int k=0; k<D; k++)
                {
                    tmp[k] = oldarray[i * D + k];
                }

                n = rand()%D;

                // perform D binomial trials */
                for (L=0; L<D; L++)
                {
                    // change at least one parameter
                    if ((rnd_uni() < CR) || L == (D-1))
                    {
                        tmp[n] = oldarray[r1 * D + n] + F*(oldarray[r2 * D + n] - oldarray[r3 * D + n]);

                        if(ubound != NULL && tmp[n] - ubound[n] > EPS)
                        {
                            tmp[n] = ubound[n];
                        }
                        else if(lbound != NULL && lbound[n] - tmp[n] > EPS)
                        {
                            tmp[n] = lbound[n];
                        }
                    }
                    n = (n+1)%D;
                }
            }
            // DE/rand-to-best/1/bin
            else if (strategy == 8)
            {
                for (int k=0; k<D; k++)
                {
                    tmp[k] = oldarray[i * D + k];
                }

                n = rand()%D;

                for (L=0; L<D; L++)
                {
                    if ((rnd_uni() < CR) || L == (D-1))
                    {
                        tmp[n] = tmp[n] + F*(bestit[n] - tmp[n]) + F*(oldarray[r1 * D + n] - oldarray[r2 * D + n]);

                        if(ubound != NULL && tmp[n] - ubound[n] > EPS)
                        {
                            tmp[n] = ubound[n];
                        }
                        else if(lbound != NULL && lbound[n] - tmp[n] > EPS)
                        {
                            tmp[n] = lbound[n];
                        }
                    }
                    n = (n+1)%D;
                }
            }
            // DE/best/2/bin
            else if (strategy == 9)
            {
                for (int k=0; k<D; k++)
                {
                    tmp[k] = oldarray[i * D + k];
                }

                n = rand()%D;

                for (L=0; L<D; L++)
                {
                    if ((rnd_uni() < CR) || L == (D-1))
                    {
                        tmp[n] = bestit[n] + (oldarray[r1 * D + n] + oldarray[r2 * D + n] - oldarray[r3 * D + n] - oldarray[r4 * D + n])*F;

                        if(ubound != NULL && tmp[n] - ubound[n] > EPS)
                        {
                            tmp[n] = ubound[n];
                        }
                        else if(lbound != NULL && lbound[n] - tmp[n] > EPS)
                        {
                            tmp[n] = lbound[n];
                        }
                    }
                    n = (n+1)%D;
                }
            }
            // DE/rand/2/bin
            else
            {
                for (int k=0; k<D; k++)
                {
                    tmp[k] = oldarray[i * D + k];
                }

                n = rand()%D;

                for (L=0; L<D; L++)
                {
                    if ((rnd_uni() < CR) || L == (D-1))
                    {
                        tmp[n] = oldarray[r5 * D + n] + (oldarray[r1 * D + n] + oldarray[r2 * D + n] - oldarray[r3 * D + n] - oldarray[r4 * D + n])*F;

                        if(ubound != NULL && tmp[n] - ubound[n] > EPS)
                        {
                            tmp[n] = ubound[n];
                        }
                        else if(lbound != NULL && lbound[n] - tmp[n] > EPS)
                        {
                            tmp[n] = lbound[n];
                        }
                    }
                    n = (n+1)%D;
                }
            }

            // Trial mutation now in tmp[]. Test how good this choice really was.
            trial_energy = proc_evaluate(instance, tmp, extparams, D);
            nfeval++;

            // improved objective function value?
            if (trial_energy - energy[i] < -EPS)
            {
                energy[i] = trial_energy;
                for (int k=0; k<D; k++)
                {
                    newarray[i * D + k] = tmp[k];
                }
                // Was this a new minimum?
                if (trial_energy - emin < -EPS)
                {
                    // reset emin to new low...
                    emin = trial_energy;
                    imin = i;
                    for (int k=0; k<D; k++)
                    {
                        best[k] = tmp[k];
                    }
                }
            }
            else
            {
                // replace target with old value
                for (int k=0; k<D; k++)
                {
                    newarray[i * D + k] = oldarray[i * D + k];
                }
            }

            mean += energy[i];
        }

        mean = mean / NP;

        for (i=0; i<NP; i++)
        {
            stdDev += pow(energy[i] - mean, 2);
        }

        stdDev = stdDev / NP;

        convergence = mean * TOL / stdDev;

        if(convergence > 1)
            terminate = true;

        CopyVector(bestit, best, D);  // Save best population member of current iteration

        // swap population arrays. New generation becomes old one
        CopyArray(swaparray, oldarray, D, NP);
        CopyArray(oldarray, newarray, D, NP);
        CopyArray(newarray, swaparray, D, NP);

        // display after every refresh generations
        if (refresh > 0 && gen % refresh == 1)
        {
            cout << endl << "Best-so-far objective funct. value: " << emin.to_out_string(5) << endl;
            for (j=0; j<D; j++)
            {
                cout << " best[" << j << "]: " << best[j].to_out_string(5) << endl;
            }
            cout << "Generation: " << gen << " NFEvals: " << nfeval << endl;
            cout << "Strategy: " << strategy << " NP: " << NP << " F: " << F.to_out_string(5);
            cout << "CR: " << CR.to_out_string(5) << endl;
        }
    }


    if(refresh > -1)
    {
        cout << endl << "Best-so-far objective funct. value: " << emin.to_out_string(5) << endl;
        for (j=0; j<D; j++)
        {
            cout << " best[" << j << "]: " << best[j].to_out_string(5) << endl;
        }
        cout << "No. of Generations: " << gen << endl;
        cout << "Numner of Function Evaluations: " << nfeval << endl;
        cout << "Strategy: " << strategy << " NP: " << NP << " F: " << F.to_out_string(5);
        cout << "CR: " << CR.to_out_string(5) << endl;
    }

    *fx = emin;
    for (j=0; j<D; j++)
    {
        x[j] = best[j];
    }

    return(0);
}
