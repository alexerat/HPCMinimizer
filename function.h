
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

#define NSTAGES 2
#define FULLDIM 10
#define BOUNDED true
#define FULLBSETS 6


// Boundary data
// Boundary functions
// Start upper boundary
inline MAX_PRECISION_T bounds_su0(MAX_PRECISION_T* x0) { return MAX_PRECISION_T(10.); }
inline MAX_PRECISION_T bounds_su1(MAX_PRECISION_T* x0) { return (MAX_PRECISION_T(0.5) - MAX_PRECISION_T(0.002)/(abs(x0[0]) + abs(x0[1])))/MAX_PRECISION_T(2.); }
inline MAX_PRECISION_T bounds_su2(MAX_PRECISION_T* x0) { return (MAX_PRECISION_T(0.5) - MAX_PRECISION_T(0.002)/(x0[1] + x0[2]))/MAX_PRECISION_T(2.); }
inline MAX_PRECISION_T bounds_su3(MAX_PRECISION_T* x0) { return (MAX_PRECISION_T(0.5) - MAX_PRECISION_T(0.002)/(x0[2] + x0[3]))/MAX_PRECISION_T(2.); }
inline MAX_PRECISION_T bounds_su4(MAX_PRECISION_T* x0) { return (MAX_PRECISION_T(0.5) - MAX_PRECISION_T(0.002)/(x0[3] + x0[4]))/MAX_PRECISION_T(2.); }
inline MAX_PRECISION_T bounds_su5(MAX_PRECISION_T* x0) { return MAX_PRECISION_T(0.5); }

// Start lower boundary
// TODO: Make these somewhat more flexible, ultimately requires changing some random start point probabilities
inline MAX_PRECISION_T bounds_sl0(MAX_PRECISION_T* x0) { return MAX_PRECISION_T(-10.); }
inline MAX_PRECISION_T bounds_sl1(MAX_PRECISION_T* x0) { return (MAX_PRECISION_T(-1.) + MAX_PRECISION_T(0.001)/x0[0])/MAX_PRECISION_T(2.); }
inline MAX_PRECISION_T bounds_sl2(MAX_PRECISION_T* x0) { return (MAX_PRECISION_T(-0.5) + MAX_PRECISION_T(0.002)/(x0[0] + x0[1]))/MAX_PRECISION_T(2.); }
inline MAX_PRECISION_T bounds_sl3(MAX_PRECISION_T* x0) { return (MAX_PRECISION_T(-0.5) + MAX_PRECISION_T(0.002)/(x0[1] + x0[2]))/MAX_PRECISION_T(2.); }
inline MAX_PRECISION_T bounds_sl4(MAX_PRECISION_T* x0) { return (MAX_PRECISION_T(-0.5) + MAX_PRECISION_T(0.002)/(x0[2] + x0[3]))/MAX_PRECISION_T(2.); }
inline MAX_PRECISION_T bounds_sl5(MAX_PRECISION_T* x0) { return (MAX_PRECISION_T(-0.5) + MAX_PRECISION_T(0.002)/(x0[3] + x0[4]))/MAX_PRECISION_T(2.); }

// Increment upper boundary
inline MAX_PRECISION_T bounds_iu0(MAX_PRECISION_T* x0) { return MAX_PRECISION_T(2.); }
inline MAX_PRECISION_T bounds_iu1(MAX_PRECISION_T* x0) { return MAX_PRECISION_T(0.); }
inline MAX_PRECISION_T bounds_iu2(MAX_PRECISION_T* x0) { return MAX_PRECISION_T(0.); }
inline MAX_PRECISION_T bounds_iu3(MAX_PRECISION_T* x0) { return MAX_PRECISION_T(0.); }
inline MAX_PRECISION_T bounds_iu4(MAX_PRECISION_T* x0) { return MAX_PRECISION_T(0.); }
inline MAX_PRECISION_T bounds_iu5(MAX_PRECISION_T* x0) { return MAX_PRECISION_T(0.); }

// Increment lower boundary
inline MAX_PRECISION_T bounds_il0(MAX_PRECISION_T* x0) { return MAX_PRECISION_T(-2.); }
inline MAX_PRECISION_T bounds_il1(MAX_PRECISION_T* x0) { return MAX_PRECISION_T(0.); }
inline MAX_PRECISION_T bounds_il2(MAX_PRECISION_T* x0) { return MAX_PRECISION_T(0.); }
inline MAX_PRECISION_T bounds_il3(MAX_PRECISION_T* x0) { return MAX_PRECISION_T(0.); }
inline MAX_PRECISION_T bounds_il4(MAX_PRECISION_T* x0) { return MAX_PRECISION_T(0.); }
inline MAX_PRECISION_T bounds_il5(MAX_PRECISION_T* x0) { return MAX_PRECISION_T(0.); }

// Big Fix: Reorder dim and hasSym flag, the indexing on the boundaries array assignment is wrong.
#define BOUNDS const boundary_t<MAX_PRECISION_T> bounds_b0={bounds_sl0,bounds_il0,bounds_su0,bounds_iu0,20,5,true,true};boundaries[0]=bounds_b0;const boundary_t<MAX_PRECISION_T> bounds_b1={bounds_sl1,bounds_il1,bounds_su1,bounds_iu1,0,1,false,false};boundaries[1]=bounds_b1;const boundary_t<MAX_PRECISION_T> bounds_b2={bounds_sl2,bounds_il2,bounds_su2,bounds_iu2,0,1,false,false};boundaries[2]=bounds_b2;const boundary_t<MAX_PRECISION_T> bounds_b3={bounds_sl3,bounds_il3,bounds_su3,bounds_iu3,0,1,false,false};boundaries[3]=bounds_b3;const boundary_t<MAX_PRECISION_T> bounds_b4={bounds_sl4,bounds_il4,bounds_su4,bounds_iu4,0,1,false,false};boundaries[4]=bounds_b4;const boundary_t<MAX_PRECISION_T> bounds_b5={bounds_sl5,bounds_il5,bounds_su5,bounds_iu5,0,1,false,false};boundaries[5]=bounds_b5;

// Stage data
// Variables used by each stage
const int stages_s0vars[5]={0,1,2,3,4};
const int stages_s1vars[5]={5,6,7,8,9};

// For every boundary set used in a previous stage, we set a maximum search width. We actually do this for all of them but it only matters if they get used.
inline MAX_PRECISION_T stages_os00(MAX_PRECISION_T* x0) { return MAX_PRECISION_T(0.); }
inline MAX_PRECISION_T stages_os01(MAX_PRECISION_T* x0) { return MAX_PRECISION_T(0.); }
inline MAX_PRECISION_T stages_os02(MAX_PRECISION_T* x0) { return MAX_PRECISION_T(0.); }
inline MAX_PRECISION_T stages_os03(MAX_PRECISION_T* x0) { return MAX_PRECISION_T(0.); }
inline MAX_PRECISION_T stages_os04(MAX_PRECISION_T* x0) { return MAX_PRECISION_T(0.); }
inline MAX_PRECISION_T stages_os05(MAX_PRECISION_T* x0) { return MAX_PRECISION_T(0.); }
inline MAX_PRECISION_T stages_os10(MAX_PRECISION_T* x0) { return MAX_PRECISION_T(0.); }
inline MAX_PRECISION_T stages_os11(MAX_PRECISION_T* x0) { return MAX_PRECISION_T(0.); }
inline MAX_PRECISION_T stages_os12(MAX_PRECISION_T* x0) { return MAX_PRECISION_T(0.); }
inline MAX_PRECISION_T stages_os13(MAX_PRECISION_T* x0) { return MAX_PRECISION_T(0.); }
inline MAX_PRECISION_T stages_os14(MAX_PRECISION_T* x0) { return MAX_PRECISION_T(0.); }
inline MAX_PRECISION_T stages_os15(MAX_PRECISION_T* x0) { return MAX_PRECISION_T(0.); }

// Now put these functions in an array to be used by the stages
MAX_PRECISION_T (*stages_os0[6])(MAX_PRECISION_T* x0)={&stages_os00,&stages_os01,&stages_os02,&stages_os03,&stages_os04,&stages_os05};
MAX_PRECISION_T (*stages_os1[6])(MAX_PRECISION_T* x0)={&stages_os10,&stages_os11,&stages_os12,&stages_os13,&stages_os14,&stages_os15};

// Now the dynamic density to be used by each stage
inline int dyn_density_0(int* bState) {return 1*bState[0]+1;}
inline int dyn_density_1(int* bState) {return 1;}


// And put together the stages
#define STAGES const stage_t<MAX_PRECISION_T> stages_s0={5,1,0,1,stages_s0vars,false,stages_os0,dyn_density_0};stages[0]=stages_s0;const stage_t<MAX_PRECISION_T> stages_s1={5,5,0,1,stages_s1vars,true,stages_os1,dyn_density_1};stages[1]=stages_s1;


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

int P0FP(MAX_PRECISION_T value, MAX_PRECISION_T* params, int depth) { return to_int(nint(MAX_PRECISION_T(0.))); }
int P0S(MAX_PRECISION_T* params, int depth) { return to_int(nint(MAX_PRECISION_T(0.))); } 
MAX_PRECISION_T P0G(int i, MAX_PRECISION_T* params, int depth) { return MAX_PRECISION_T(0.001); } 


#define PARAMETERS parameter_t<MAX_PRECISION_T> p0;p0.get=P0G;p0.steps=P0S;p0.findPos=P0FP;parameters[0]=p0;

#define PARAMCOMPUTE(params) ({})

// TODO: Implement
// CHANGE: All non-x non-param dependent values get evaluated on initialisation, param dependent will get done at a param sequence
#define NCONSTANTS 0
// #define CONSTANTS(floatval_t) const floatval_t const_arr_##floatval_t[NCONSTANTS]={con_fun<floatval_t>("2.0"),sqrt(con_fun<floatval_t>("2.0"))};


#define FUNCTION0(x, x0, params, precompute, floatval_t) (__extension__({floatval_t(floatval_t(0.6666666666666666))*pow(floatval_t(floatval_t(-0.7853981633974483)) + floatval_t(floatval_t(0.2048))*abs((floatval_t(floatval_t(4.))*x[0]*x[1] - floatval_t(floatval_t(4.))*x[0]*x[3] + floatval_t(floatval_t(4.))*x[2]*x[3])/floatval_t(floatval_t(2.)) - floatval_t(floatval_t(0.49991001619708436))*(floatval_t(floatval_t(0.000565486647508331))*pow(x[0],2) + floatval_t(floatval_t(3.9999992005620872))*x[0]*x[1] - floatval_t(floatval_t(0.0011309731141880709))*pow(x[1],2) - floatval_t(floatval_t(0.0033929195233928042))*x[0]*x[2] + floatval_t(floatval_t(1.9186507631552274e-6))*x[1]*x[2] + floatval_t(floatval_t(0.001696459219209798))*pow(x[2],2) - floatval_t(floatval_t(3.999997281911324))*x[0]*x[3] + floatval_t(floatval_t(0.002261945143402934))*x[1]*x[3] + floatval_t(floatval_t(3.9999960028114967))*x[2]*x[3] - floatval_t(floatval_t(0.0022619447817477595))*pow(x[3],2) + floatval_t(floatval_t(0.0028274323333978687))*x[0]*x[4] - floatval_t(floatval_t(1.5988752952722507e-6))*x[1]*x[4] - floatval_t(floatval_t(0.002827431429256091))*x[2]*x[4] + floatval_t(floatval_t(3.197750079064754e-6))*x[3]*x[4])),2) + floatval_t(floatval_t(0.08191999999999998))*pow(floatval_t(floatval_t(1.9998199443597544))*x[0] - floatval_t(floatval_t(0.0011308715211593753))*x[1] - floatval_t(floatval_t(1.9998193048669837))*x[2] + floatval_t(floatval_t(0.002261742680694113))*x[3] + floatval_t(floatval_t(1.9998180258816465))*x[4],2) + floatval_t(floatval_t(0.08191999999999998))*pow(floatval_t(floatval_t(2.))*x[0] - floatval_t(floatval_t(2.))*x[2] + floatval_t(floatval_t(2.))*x[4],2);}))
#define FUNCTION1(x, x0, params, precompute, floatval_t) (__extension__({ode_costFunc(x,x0,n,func_wspace);}))

#define DERIVATIVES0(g, xorig, x0, x, params, precompute, f, step, floatval_t) (__extension__({x[0]+=step;g[0]=((floatval_t(floatval_t(0.6666666666666666))*pow(floatval_t(floatval_t(-0.7853981633974483)) + floatval_t(floatval_t(0.2048))*abs((floatval_t(floatval_t(4.))*x[0]*x[1] - floatval_t(floatval_t(4.))*x[0]*x[3] + floatval_t(floatval_t(4.))*x[2]*x[3])/floatval_t(floatval_t(2.)) - floatval_t(floatval_t(0.49991001619708436))*(floatval_t(floatval_t(0.000565486647508331))*pow(x[0],2) + floatval_t(floatval_t(3.9999992005620872))*x[0]*x[1] - floatval_t(floatval_t(0.0011309731141880709))*pow(x[1],2) - floatval_t(floatval_t(0.0033929195233928042))*x[0]*x[2] + floatval_t(floatval_t(1.9186507631552274e-6))*x[1]*x[2] + floatval_t(floatval_t(0.001696459219209798))*pow(x[2],2) - floatval_t(floatval_t(3.999997281911324))*x[0]*x[3] + floatval_t(floatval_t(0.002261945143402934))*x[1]*x[3] + floatval_t(floatval_t(3.9999960028114967))*x[2]*x[3] - floatval_t(floatval_t(0.0022619447817477595))*pow(x[3],2) + floatval_t(floatval_t(0.0028274323333978687))*x[0]*x[4] - floatval_t(floatval_t(1.5988752952722507e-6))*x[1]*x[4] - floatval_t(floatval_t(0.002827431429256091))*x[2]*x[4] + floatval_t(floatval_t(3.197750079064754e-6))*x[3]*x[4])),2) + floatval_t(floatval_t(0.08191999999999998))*pow(floatval_t(floatval_t(1.9998199443597544))*x[0] - floatval_t(floatval_t(0.0011308715211593753))*x[1] - floatval_t(floatval_t(1.9998193048669837))*x[2] + floatval_t(floatval_t(0.002261742680694113))*x[3] + floatval_t(floatval_t(1.9998180258816465))*x[4],2) + floatval_t(floatval_t(0.08191999999999998))*pow(floatval_t(floatval_t(2.))*x[0] - floatval_t(floatval_t(2.))*x[2] + floatval_t(floatval_t(2.))*x[4],2))-f)/step;x[0]=xorig[0];x[1]+=step;g[1]=((floatval_t(floatval_t(0.6666666666666666))*pow(floatval_t(floatval_t(-0.7853981633974483)) + floatval_t(floatval_t(0.2048))*abs((floatval_t(floatval_t(4.))*x[0]*x[1] - floatval_t(floatval_t(4.))*x[0]*x[3] + floatval_t(floatval_t(4.))*x[2]*x[3])/floatval_t(floatval_t(2.)) - floatval_t(floatval_t(0.49991001619708436))*(floatval_t(floatval_t(0.000565486647508331))*pow(x[0],2) + floatval_t(floatval_t(3.9999992005620872))*x[0]*x[1] - floatval_t(floatval_t(0.0011309731141880709))*pow(x[1],2) - floatval_t(floatval_t(0.0033929195233928042))*x[0]*x[2] + floatval_t(floatval_t(1.9186507631552274e-6))*x[1]*x[2] + floatval_t(floatval_t(0.001696459219209798))*pow(x[2],2) - floatval_t(floatval_t(3.999997281911324))*x[0]*x[3] + floatval_t(floatval_t(0.002261945143402934))*x[1]*x[3] + floatval_t(floatval_t(3.9999960028114967))*x[2]*x[3] - floatval_t(floatval_t(0.0022619447817477595))*pow(x[3],2) + floatval_t(floatval_t(0.0028274323333978687))*x[0]*x[4] - floatval_t(floatval_t(1.5988752952722507e-6))*x[1]*x[4] - floatval_t(floatval_t(0.002827431429256091))*x[2]*x[4] + floatval_t(floatval_t(3.197750079064754e-6))*x[3]*x[4])),2) + floatval_t(floatval_t(0.08191999999999998))*pow(floatval_t(floatval_t(1.9998199443597544))*x[0] - floatval_t(floatval_t(0.0011308715211593753))*x[1] - floatval_t(floatval_t(1.9998193048669837))*x[2] + floatval_t(floatval_t(0.002261742680694113))*x[3] + floatval_t(floatval_t(1.9998180258816465))*x[4],2) + floatval_t(floatval_t(0.08191999999999998))*pow(floatval_t(floatval_t(2.))*x[0] - floatval_t(floatval_t(2.))*x[2] + floatval_t(floatval_t(2.))*x[4],2))-f)/step;x[1]=xorig[1];x[2]+=step;g[2]=((floatval_t(floatval_t(0.6666666666666666))*pow(floatval_t(floatval_t(-0.7853981633974483)) + floatval_t(floatval_t(0.2048))*abs((floatval_t(floatval_t(4.))*x[0]*x[1] - floatval_t(floatval_t(4.))*x[0]*x[3] + floatval_t(floatval_t(4.))*x[2]*x[3])/floatval_t(floatval_t(2.)) - floatval_t(floatval_t(0.49991001619708436))*(floatval_t(floatval_t(0.000565486647508331))*pow(x[0],2) + floatval_t(floatval_t(3.9999992005620872))*x[0]*x[1] - floatval_t(floatval_t(0.0011309731141880709))*pow(x[1],2) - floatval_t(floatval_t(0.0033929195233928042))*x[0]*x[2] + floatval_t(floatval_t(1.9186507631552274e-6))*x[1]*x[2] + floatval_t(floatval_t(0.001696459219209798))*pow(x[2],2) - floatval_t(floatval_t(3.999997281911324))*x[0]*x[3] + floatval_t(floatval_t(0.002261945143402934))*x[1]*x[3] + floatval_t(floatval_t(3.9999960028114967))*x[2]*x[3] - floatval_t(floatval_t(0.0022619447817477595))*pow(x[3],2) + floatval_t(floatval_t(0.0028274323333978687))*x[0]*x[4] - floatval_t(floatval_t(1.5988752952722507e-6))*x[1]*x[4] - floatval_t(floatval_t(0.002827431429256091))*x[2]*x[4] + floatval_t(floatval_t(3.197750079064754e-6))*x[3]*x[4])),2) + floatval_t(floatval_t(0.08191999999999998))*pow(floatval_t(floatval_t(1.9998199443597544))*x[0] - floatval_t(floatval_t(0.0011308715211593753))*x[1] - floatval_t(floatval_t(1.9998193048669837))*x[2] + floatval_t(floatval_t(0.002261742680694113))*x[3] + floatval_t(floatval_t(1.9998180258816465))*x[4],2) + floatval_t(floatval_t(0.08191999999999998))*pow(floatval_t(floatval_t(2.))*x[0] - floatval_t(floatval_t(2.))*x[2] + floatval_t(floatval_t(2.))*x[4],2))-f)/step;x[2]=xorig[2];x[3]+=step;g[3]=((floatval_t(floatval_t(0.6666666666666666))*pow(floatval_t(floatval_t(-0.7853981633974483)) + floatval_t(floatval_t(0.2048))*abs((floatval_t(floatval_t(4.))*x[0]*x[1] - floatval_t(floatval_t(4.))*x[0]*x[3] + floatval_t(floatval_t(4.))*x[2]*x[3])/floatval_t(floatval_t(2.)) - floatval_t(floatval_t(0.49991001619708436))*(floatval_t(floatval_t(0.000565486647508331))*pow(x[0],2) + floatval_t(floatval_t(3.9999992005620872))*x[0]*x[1] - floatval_t(floatval_t(0.0011309731141880709))*pow(x[1],2) - floatval_t(floatval_t(0.0033929195233928042))*x[0]*x[2] + floatval_t(floatval_t(1.9186507631552274e-6))*x[1]*x[2] + floatval_t(floatval_t(0.001696459219209798))*pow(x[2],2) - floatval_t(floatval_t(3.999997281911324))*x[0]*x[3] + floatval_t(floatval_t(0.002261945143402934))*x[1]*x[3] + floatval_t(floatval_t(3.9999960028114967))*x[2]*x[3] - floatval_t(floatval_t(0.0022619447817477595))*pow(x[3],2) + floatval_t(floatval_t(0.0028274323333978687))*x[0]*x[4] - floatval_t(floatval_t(1.5988752952722507e-6))*x[1]*x[4] - floatval_t(floatval_t(0.002827431429256091))*x[2]*x[4] + floatval_t(floatval_t(3.197750079064754e-6))*x[3]*x[4])),2) + floatval_t(floatval_t(0.08191999999999998))*pow(floatval_t(floatval_t(1.9998199443597544))*x[0] - floatval_t(floatval_t(0.0011308715211593753))*x[1] - floatval_t(floatval_t(1.9998193048669837))*x[2] + floatval_t(floatval_t(0.002261742680694113))*x[3] + floatval_t(floatval_t(1.9998180258816465))*x[4],2) + floatval_t(floatval_t(0.08191999999999998))*pow(floatval_t(floatval_t(2.))*x[0] - floatval_t(floatval_t(2.))*x[2] + floatval_t(floatval_t(2.))*x[4],2))-f)/step;x[3]=xorig[3];x[4]+=step;g[4]=((floatval_t(floatval_t(0.6666666666666666))*pow(floatval_t(floatval_t(-0.7853981633974483)) + floatval_t(floatval_t(0.2048))*abs((floatval_t(floatval_t(4.))*x[0]*x[1] - floatval_t(floatval_t(4.))*x[0]*x[3] + floatval_t(floatval_t(4.))*x[2]*x[3])/floatval_t(floatval_t(2.)) - floatval_t(floatval_t(0.49991001619708436))*(floatval_t(floatval_t(0.000565486647508331))*pow(x[0],2) + floatval_t(floatval_t(3.9999992005620872))*x[0]*x[1] - floatval_t(floatval_t(0.0011309731141880709))*pow(x[1],2) - floatval_t(floatval_t(0.0033929195233928042))*x[0]*x[2] + floatval_t(floatval_t(1.9186507631552274e-6))*x[1]*x[2] + floatval_t(floatval_t(0.001696459219209798))*pow(x[2],2) - floatval_t(floatval_t(3.999997281911324))*x[0]*x[3] + floatval_t(floatval_t(0.002261945143402934))*x[1]*x[3] + floatval_t(floatval_t(3.9999960028114967))*x[2]*x[3] - floatval_t(floatval_t(0.0022619447817477595))*pow(x[3],2) + floatval_t(floatval_t(0.0028274323333978687))*x[0]*x[4] - floatval_t(floatval_t(1.5988752952722507e-6))*x[1]*x[4] - floatval_t(floatval_t(0.002827431429256091))*x[2]*x[4] + floatval_t(floatval_t(3.197750079064754e-6))*x[3]*x[4])),2) + floatval_t(floatval_t(0.08191999999999998))*pow(floatval_t(floatval_t(1.9998199443597544))*x[0] - floatval_t(floatval_t(0.0011308715211593753))*x[1] - floatval_t(floatval_t(1.9998193048669837))*x[2] + floatval_t(floatval_t(0.002261742680694113))*x[3] + floatval_t(floatval_t(1.9998180258816465))*x[4],2) + floatval_t(floatval_t(0.08191999999999998))*pow(floatval_t(floatval_t(2.))*x[0] - floatval_t(floatval_t(2.))*x[2] + floatval_t(floatval_t(2.))*x[4],2))-f)/step;x[4]=xorig[4];}))
#define DERIVATIVES1(g, xorig, x0, x, params, precompute, f, step, floatval_t) (__extension__({x[0]+=step;g[0]=((ode_costFunc(x,x0,n,func_wspace))-f)/step;x[0]=xorig[0];x[1]+=step;g[1]=((ode_costFunc(x,x0,n,func_wspace))-f)/step;x[1]=xorig[1];x[2]+=step;g[2]=((ode_costFunc(x,x0,n,func_wspace))-f)/step;x[2]=xorig[2];x[3]+=step;g[3]=((ode_costFunc(x,x0,n,func_wspace))-f)/step;x[3]=xorig[3];x[4]+=step;g[4]=((ode_costFunc(x,x0,n,func_wspace))-f)/step;x[4]=xorig[4];}))


#define FUNC_INIT0 ode_init
#define FUNC_INIT1 ode_init

#define FUNC_DEST0 ode_dest
#define FUNC_DEST1 ode_dest



