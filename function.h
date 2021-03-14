
#ifdef USE_MPI
#include <mpi.h>
#endif
#include "precision.h"
#include "opt_prec.h"

// TODO: This is now written in a serparate file (opt_prec.h) and we use __float128
// #define MAX_PRECISION_LEVEL 2
// #define MAX_PRECISION_T dd_real

#define EXPDATE "2019-08-27"
#define EXPNAME ""
#define EXPPARAMETERS 0
#define EXPFORMAT "{[nk,chi],[lowerBound, upperBound], tau, f, [X]}"

#define NSTAGES 1
#define FULLDIM 3
#define BOUNDED true
#define FULLBSETS 1


// Boundary data
// Boundary functions
// Start upper boundary
inline MAX_PRECISION_T bounds_su0(MAX_PRECISION_T* x0) { return MAX_PRECISION_T(0.001); }

// Start lower boundary
// TODO: Make these somewhat more flexible, ultimately requires changing some random start point probabilities
inline MAX_PRECISION_T bounds_sl0(MAX_PRECISION_T* x0) { return MAX_PRECISION_T(-0.001); }

// Increment upper boundary
inline MAX_PRECISION_T bounds_iu0(MAX_PRECISION_T* x0) { return MAX_PRECISION_T(0.001); }

// Increment lower boundary
inline MAX_PRECISION_T bounds_il0(MAX_PRECISION_T* x0) { return MAX_PRECISION_T(-0.001); }

// Big Fix: Reorder dim and hasSym flag, the indexing on the boundaries array assignment is wrong.
#define BOUNDS const boundary_t<MAX_PRECISION_T> bounds_b0={bounds_sl0,bounds_il0,bounds_su0,bounds_iu0,20,5,true,true};boundaries[0]=bounds_b0;

// Stage data
// Variables used by each stage
const int stages_s0vars[5]={0,1,2};

// For every boundary set used in a previous stage, we set a maximum search width. We actually do this for all of them but it only matters if they get used.
inline MAX_PRECISION_T stages_os00(MAX_PRECISION_T* x0) { return MAX_PRECISION_T(0.); }

// Now put these functions in an array to be used by the stages
MAX_PRECISION_T (*stages_os0[1])(MAX_PRECISION_T* x0)={&stages_os00};

// Now the dynamic density to be used by each stage
inline int dyn_density_0(int* bState) {return 100*bState[0]+100;}


// And put together the stages
#define STAGES const stage_t<MAX_PRECISION_T> stages_s0={3,1,0,1,stages_s0vars,false,stages_os0,dyn_density_0};stages[0]=stages_s0;


// The optimisation algorithms for each stage (by name)
#define OPT0 lbgfs
#define OPT1 lbgfs


//#define CONSTANTS(floatval_t) {}


#define BUCKETORD 9
#define NBINSOUT 5
#define REPORTFAILS false
#define REPORTROUNDING false
#define MEMSIZE 12
#define MAXLINE 50
#define MAXIT 50
#define SIGDIG 9

#define NEXTRADATA 0
#define EXTRAOUT

/* 0: bgfs, 1: Genetic Evolution */
// TODO: Make this a settable option
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

// TODO: Fix this option
// CHANGE: Only define robust when using robust.
//#define ROBUST false

#define SAMPLES 10
#define NOISE 0.0001

#define NPARAMS 1

int P0FP(MAX_PRECISION_T value, MAX_PRECISION_T* params, int depth) { return to_int(nint(MAX_PRECISION_T((value - 10.0)/2.0))); }
int P0S(MAX_PRECISION_T* params, int depth) { return to_int(nint(MAX_PRECISION_T(10.))); } 
MAX_PRECISION_T P0G(int i, MAX_PRECISION_T* params, int depth) { return MAX_PRECISION_T(10+i*2); } 


#define PARAMETERS parameter_t<MAX_PRECISION_T> p0;p0.get=P0G;p0.steps=P0S;p0.findPos=P0FP;parameters[0]=p0;

#define PARAMCOMPUTE(params) ({})

// TODO: Implement
// CHANGE: All non-x non-param dependent values get evaluated on initialisation, param dependent will get done at a param sequence
#define NCONSTANTS 0
// #define CONSTANTS(floatval_t) const floatval_t const_arr_##floatval_t[NCONSTANTS]={con_fun<floatval_t>("2.0"),sqrt(con_fun<floatval_t>("2.0"))};


#define FUNCTION0(x, x0, params, precompute, floatval_t) (__extension__({ode_costFunc(x,x0,n,func_wspace,params);}))

#define DERIVATIVES0(g, xorig, x0, x, params, precompute, f, step, floatval_t) (__extension__({x[0]+=step;g[0]=((ode_costFunc(x,x0,n,func_wspace,params))-f)/step;x[0]=xorig[0];x[1]+=step;g[1]=((ode_costFunc(x,x0,n,func_wspace,params))-f)/step;x[1]=xorig[1];x[2]+=step;g[2]=((ode_costFunc(x,x0,n,func_wspace,params))-f)/step;}))


#define FUNC_INIT0 ode_init

#define FUNC_DEST0 ode_dest



