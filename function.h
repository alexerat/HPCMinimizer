
#ifdef USE_MPI
#include <mpi.h>
#endif

#include "precision.h"

#define MAX_PRECISION_LEVEL 2
#define MAX_PRECISION_T dd_real

// CHANGE: Remove the dim setting, this is now dynamic based on stage, replace with FULLDIM
#define FULLDIM 1

#define EXPDATE "2019-02-22"
#define EXPNAME "2 Qubit Gate Test"
#define EXPPARAMETERS 0
#define EXPFORMAT "{[nk,chi],[lowerBound, upperBound], tau, f, [X]}"
#define BOUNDED true

// CHANGE: Remove the bsets setting, this is now dynamic based on stage, replace with FULLBSETS
#define FULLBSETS 1

// CHANGE: We now need to define the number of stages
#define NSTAGES 1

#define BOUNDS boundary_t<MAX_PRECISION_T> b0;b0.startUpper=2.;b0.startLower=-2.;b0.steps=49;b0.incrementUpper=2.;b0.incrementLower=-2.;b0.intCast=true;b0.dim=1;b0.hasSym=true;boundaries[0]=b0;

#define BUCKETORD 9
#define NBINSOUT 5
#define REPORTFAILS false
#define REPORTROUNDING false
#define MEMSIZE 12
#define MAXLINE 50
#define MAXIT 50
#define SIGDIG 9

#define DYNDENSITY 1000*(1 + bState[0])

#define NEXTRADATA 0
#define EXTRAOUT

/* 0: bgfs, 1: Genetic Evolution */
#define ALGO 0

/* These are the settings for a Genetic Evolution algorithm. */
#define STRAT 3
#define POPSIZE 30
#define POPSPREAD 0.005
#define MAXGEN 60
#define PARAM_F 0.85
#define PARAM_CR 1.0

/* These are the settings for a bgfs algorithm. */
#define RANDOMSEARCH true
#define DIMSCALE false
#define NDIMPOINTS 13
#define NRUNS 3000

#define ROBUST false
#define SAMPLES 10
#define NOISE 0.0001

#define NPARAMS 0



#define PARAMETERS 

#define PARAMCOMPUTE(params) ({})

#define FUNCTION0(x, params) ({0.;})
#define DERIVATIVES0(g, x, params, f, step) ({g[0]=0.;})
