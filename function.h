#ifndef USER_FUNCTION_H
#define USER_FUNCTION_H

#ifdef USE_MPI
#include <mpi.h>
#endif


#include "precision.h"
#include "opt_prec.h"

// CHANGE: Remove the dim setting, this is now dynamic based on stage, replace with FULLDIM
#define FULLDIM 7

#define EXPDATE "2019-02-22"
#define EXPNAME "2 Qubit Gate Test"
#define EXPPARAMETERS 0
#define EXPFORMAT "{[nk,chi],[lowerBound, upperBound], tau, f, [X]}"
#define BOUNDED true

// CHANGE: Remove the bsets setting, this is now dynamic based on stage, replace with FULLBSETS
#define FULLBSETS 1

// CHANGE: The starts and increments are now given as functions of x0
// CHNAGE: Make const definitions, also be careful to use the correct assignment ordering

/*
floatval_t (*startLower)(floatval_t* x0);
floatval_t (*incrementLower)(floatval_t* x0);
floatval_t (*startUpper)(floatval_t* x0);
floatval_t (*incrementUpper)(floatval_t* x0);
int steps;
int dim;
bool intCast;
bool hasSym;
*/
// NOTE: These are inline functiosn to prevent multiple definition errors.
inline MAX_PRECISION_T bounds_su0(MAX_PRECISION_T* x0) { return con_fun<MAX_PRECISION_T>("0.0000001"); }
inline MAX_PRECISION_T bounds_sl0(MAX_PRECISION_T* x0) { return con_fun<MAX_PRECISION_T>("-0.0000001"); }
inline MAX_PRECISION_T bounds_iu0(MAX_PRECISION_T* x0) { return con_fun<MAX_PRECISION_T>("0.09"); }
inline MAX_PRECISION_T bounds_il0(MAX_PRECISION_T* x0) { return con_fun<MAX_PRECISION_T>("-0.09"); }

#define BOUNDS const boundary_t<MAX_PRECISION_T> bounds_b0={bounds_sl0,bounds_il0,bounds_su0,bounds_iu0,1,7,false,false};boundaries[0]=bounds_b0;

// CHANGE: We now need to define the number of stages
#define NSTAGES 1

/*
int dim;
int bSets;    
int algorithm;
int* vars;     
// Not very clear, but this will be an array of function pointers, allows for bounds to be functions of prev stage x's
floatval_t (*(*pBSetOptSize))(floatval_t* x0);   
*/
// CHANGE: Define stages in header
// NOTE: These are inline functiosn to prevent multiple definition errors.
// NOTE: The variables to be used in this stage (done for each stage and put into the stages constant)
const int stages_s0vars[7] = {0,1,2,3,4,5,6};
inline MAX_PRECISION_T stages_os00(MAX_PRECISION_T* x0) { return 1.0; }
MAX_PRECISION_T (*stages_os0[1])(MAX_PRECISION_T* x0) = { &stages_os00 }; 

// NOTE: Example of another stage
const int s1vars[1] = {0};
inline MAX_PRECISION_T stages_os10(MAX_PRECISION_T* x0) { return 1.0; }
MAX_PRECISION_T (*stages_os1[1])(MAX_PRECISION_T* x0) = { &stages_os10 }; 

// CHANGE: This will be stage dependent and given as a function
inline int dyn_density_0(int* bState) { return 50+bState[0]*(100000); }
#define STAGES const stage_t<MAX_PRECISION_T> stages_s0 = {7,1,0,1,stages_s0vars,true,stages_os0,dyn_density_0};stages[0]=stages_s0;/*const stage_t<MAX_PRECISION_T> s1 = {1,1,0,s1vars,os1};stages[1]=s1;*/

// CHANGE:
// These will be optimisation labels generated from the optimisation type codes
#define OPT0 lbgfs


#define BUCKETORD 9
#define NBINSOUT 5
#define REPORTFAILS true
#define REPORTROUNDING false
#define MEMSIZE 12
#define MAXLINE 50
#define MAXIT 50
#define SIGDIG 9


#define NEXTRADATA 0
#define EXTRAOUT

/* 0: bgfs, 1: Genetic Evolution */
// CHANGE: Removed, now in stages
//#define ALGO 0

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

// CHANGE: Only define robust when using robust.
//#define ROBUST false
#define SAMPLES 10
#define NOISE 0.0001

#define NPARAMS 0



#define PARAMETERS 

#define PARAMCOMPUTE(params) ({})

// CHANGE: All non-x non-param dependent values get evaluated on initialisation, param dependent will get done at a param sequence
#define NCONSTANTS 2
#define CONSTANTS(floatval_t) const floatval_t const_arr_##floatval_t[NCONSTANTS]={con_fun<floatval_t>("2.0"),sqrt(con_fun<floatval_t>("2.0"))};

// CHANGE: Functions are now stage specific
#define FUNCTION0(x, x0, params, precompute) (__extension__({ode_costFunc(x, x0, n, ode_wspace);}))
#define DERIVATIVES0(g, x, x0, xs, params, precompute, f, step) (__extension__({xs[0]+=step;g[0]=(ode_costFunc(xs, x0, n, ode_wspace)-fx)/step;xs[0]=x[0];xs[1]+=step;g[1]=(ode_costFunc(xs, x0, n, ode_wspace)-fx)/step;xs[1]=x[1];xs[2]+=step;g[2]=(ode_costFunc(xs, x0, n, ode_wspace)-fx)/step;xs[2]=x[2];xs[3]+=step;g[3]=(ode_costFunc(xs, x0, n, ode_wspace)-fx)/step;xs[3]=x[3];xs[4]+=step;g[4]=(ode_costFunc(xs, x0, n, ode_wspace)-fx)/step;xs[4]=x[4];xs[5]+=step;g[5]=(ode_costFunc(xs, x0, n, ode_wspace)-fx)/step;xs[5]=x[5];xs[6]+=step;g[6]=(ode_costFunc(xs, x0, n, ode_wspace)-fx)/step;xs[6]=x[6];}))


// CHANGE: These defines direct to the relavent ODE initialize and destroy for this stage, if not present these are to be defined but blank
#define ODE_INIT0 ode_init
#define ODE_DEST0 ode_dest


#endif /*USER_FUNCTION_H*/