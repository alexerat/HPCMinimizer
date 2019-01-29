
#ifdef USE_MPI
#include <mpi.h>
#endif
#include "precision.h"

#define MAX_PRECISION_LEVEL 2
#define MAX_PRECISION_T dd_real

#define DIM 3
#define EXPDATE "2018-11-27"
#define EXPNAME "FRAG Scheme Gate Optimization (Dimensionless Micromotion)"
#define EXPPARAMETERS "{nk: 2.-40.,chi: 0.00018-0.00018}"
#define EXPFORMAT "{[nk,chi],[lowerBound, upperBound], tau, f, [X]}"
#define BOUNDED true
#define BSETS 1
#define BOUNDS boundary_t<MAX_PRECISION_T> b0;b0.startUpper=0.005;b0.startLower=-0.005;b0.steps=299;b0.incrementUpper=0.005;b0.incrementLower=-0.005;b0.intCast=false;b0.dim=3;b0.hasSym=true;boundaries[0]=b0;

#define BUCKETORD 9
#define NBINSOUT 5
#define REPORTFAILS false
#define REPORTROUNDING false
#define MEMSIZE 12
#define MAXLINE 50
#define MAXIT 50
#define SIGDIG 9

#define DYNDENSITY 100*(1 + bState[0])

#define NEXTRADATA 1
#define EXTRAOUT MAX_PRECISION_T gTime = 0.0;for(int k = 0; k < DIM; k++){if(abs(2*bestX[k]) > gTime){gTime = abs(2*bestX[k]);}}outfile << to_out_string(gTime,SIGDIG);

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

#define NPARAMS 2

int P0FP(MAX_PRECISION_T value, MAX_PRECISION_T* params, int depth) { return to_int(nint(MAX_PRECISION_T(99999.99999999999)*(MAX_PRECISION_T(-0.00018) + value))); }
int P0S(MAX_PRECISION_T* params, int depth) { return to_int(nint(MAX_PRECISION_T(0.))); } 
MAX_PRECISION_T P0G(int i, MAX_PRECISION_T* params, int depth) { return MAX_PRECISION_T(0.00018) + MAX_PRECISION_T(0.00001)*i; } 
int P1FP(MAX_PRECISION_T value, MAX_PRECISION_T* params, int depth) { return to_int(nint(MAX_PRECISION_T(0.5)*(MAX_PRECISION_T(-26.) + value))); }
int P1S(MAX_PRECISION_T* params, int depth) { return to_int(nint(MAX_PRECISION_T(7.))); } 
MAX_PRECISION_T P1G(int i, MAX_PRECISION_T* params, int depth) { return MAX_PRECISION_T(26.) + MAX_PRECISION_T(2.)*i; } 


#define PARAMETERS parameter_t<MAX_PRECISION_T> p0;p0.get=P0G;p0.steps=P0S;p0.findPos=P0FP;parameters[0]=p0;parameter_t<MAX_PRECISION_T> p1;p1.get=P1G;p1.steps=P1S;p1.findPos=P1FP;parameters[1]=p1;

#define PARAMCOMPUTE(params) ({})

#define FUNCTION(x, params) ({0.037361887285444456*pow(3.31764450945654 - 1.*abs((pow(params[1],2)*(1.*(1 + params[0])*(sin(12.566370614359172*abs(x[0])) + 4*(sin(6.283185307179586*abs(x[0] - x[1])) + sin(12.566370614359172*abs(x[1])) - sin(6.283185307179586*abs(x[0] + x[1])) - sin(6.283185307179586*abs(x[0] - x[2])) + 2*sin(6.283185307179586*abs(x[1] - x[2])) + sin(12.566370614359172*abs(x[2])) + sin(6.283185307179586*abs(x[0] + x[2])) - 2*sin(6.283185307179586*abs(x[1] + x[2])))) - 1.*sin(12.566370614359172*abs(x[0])*(1 + params[0])) - 4.*sin(6.283185307179586*abs(x[0] - x[1])*(1 + params[0])) - 4.*sin(12.566370614359172*abs(x[1])*(1 + params[0])) + 4.*sin(6.283185307179586*abs(x[0] + x[1])*(1 + params[0])) + 4.*sin(6.283185307179586*abs(x[0] - x[2])*(1 + params[0])) - 8.*sin(6.283185307179586*abs(x[1] - x[2])*(1 + params[0])) - 4.*sin(12.566370614359172*abs(x[2])*(1 + params[0])) - 4.*sin(6.283185307179586*abs(x[0] + x[2])*(1 + params[0])) + 8.*sin(6.283185307179586*abs(x[1] + x[2])*(1 + params[0]))))/(1 + params[0])),2) + 1.7513384665052094*pow(params[1],2)*pow(sin(6.283185307179586*x[0]) - 2.*sin(6.283185307179586*x[1]) + 2.*sin(6.283185307179586*x[2]),2) + (1.7513384665052094*pow(params[1],2)*pow(sin(6.283185307179586*(1 + params[0])*x[0]) - 2.*sin(6.283185307179586*(1 + params[0])*x[1]) + 2.*sin(6.283185307179586*(1 + params[0])*x[2]),2))/(1. + params[0]);})
#define DERIVATIVES(g, x, params, f, step) ({g[0]=((0.037361887285444456*pow(3.31764450945654 - 1.*abs((pow(params[1],2)*(1.*(1 + params[0])*(sin(12.566370614359172*abs((x[0]+step))) + 4*(sin(6.283185307179586*abs((x[0]+step) - x[1])) + sin(12.566370614359172*abs(x[1])) - sin(6.283185307179586*abs((x[0]+step) + x[1])) - sin(6.283185307179586*abs((x[0]+step) - x[2])) + 2*sin(6.283185307179586*abs(x[1] - x[2])) + sin(12.566370614359172*abs(x[2])) + sin(6.283185307179586*abs((x[0]+step) + x[2])) - 2*sin(6.283185307179586*abs(x[1] + x[2])))) - 1.*sin(12.566370614359172*abs((x[0]+step))*(1 + params[0])) - 4.*sin(6.283185307179586*abs((x[0]+step) - x[1])*(1 + params[0])) - 4.*sin(12.566370614359172*abs(x[1])*(1 + params[0])) + 4.*sin(6.283185307179586*abs((x[0]+step) + x[1])*(1 + params[0])) + 4.*sin(6.283185307179586*abs((x[0]+step) - x[2])*(1 + params[0])) - 8.*sin(6.283185307179586*abs(x[1] - x[2])*(1 + params[0])) - 4.*sin(12.566370614359172*abs(x[2])*(1 + params[0])) - 4.*sin(6.283185307179586*abs((x[0]+step) + x[2])*(1 + params[0])) + 8.*sin(6.283185307179586*abs(x[1] + x[2])*(1 + params[0]))))/(1 + params[0])),2) + 1.7513384665052094*pow(params[1],2)*pow(sin(6.283185307179586*(x[0]+step)) - 2.*sin(6.283185307179586*x[1]) + 2.*sin(6.283185307179586*x[2]),2) + (1.7513384665052094*pow(params[1],2)*pow(sin(6.283185307179586*(1 + params[0])*(x[0]+step)) - 2.*sin(6.283185307179586*(1 + params[0])*x[1]) + 2.*sin(6.283185307179586*(1 + params[0])*x[2]),2))/(1. + params[0])) - f) / step;g[1]=((0.037361887285444456*pow(3.31764450945654 - 1.*abs((pow(params[1],2)*(1.*(1 + params[0])*(sin(12.566370614359172*abs(x[0])) + 4*(sin(6.283185307179586*abs(x[0] - (x[1]+step))) + sin(12.566370614359172*abs((x[1]+step))) - sin(6.283185307179586*abs(x[0] + (x[1]+step))) - sin(6.283185307179586*abs(x[0] - x[2])) + 2*sin(6.283185307179586*abs((x[1]+step) - x[2])) + sin(12.566370614359172*abs(x[2])) + sin(6.283185307179586*abs(x[0] + x[2])) - 2*sin(6.283185307179586*abs((x[1]+step) + x[2])))) - 1.*sin(12.566370614359172*abs(x[0])*(1 + params[0])) - 4.*sin(6.283185307179586*abs(x[0] - (x[1]+step))*(1 + params[0])) - 4.*sin(12.566370614359172*abs((x[1]+step))*(1 + params[0])) + 4.*sin(6.283185307179586*abs(x[0] + (x[1]+step))*(1 + params[0])) + 4.*sin(6.283185307179586*abs(x[0] - x[2])*(1 + params[0])) - 8.*sin(6.283185307179586*abs((x[1]+step) - x[2])*(1 + params[0])) - 4.*sin(12.566370614359172*abs(x[2])*(1 + params[0])) - 4.*sin(6.283185307179586*abs(x[0] + x[2])*(1 + params[0])) + 8.*sin(6.283185307179586*abs((x[1]+step) + x[2])*(1 + params[0]))))/(1 + params[0])),2) + 1.7513384665052094*pow(params[1],2)*pow(sin(6.283185307179586*x[0]) - 2.*sin(6.283185307179586*(x[1]+step)) + 2.*sin(6.283185307179586*x[2]),2) + (1.7513384665052094*pow(params[1],2)*pow(sin(6.283185307179586*(1 + params[0])*x[0]) - 2.*sin(6.283185307179586*(1 + params[0])*(x[1]+step)) + 2.*sin(6.283185307179586*(1 + params[0])*x[2]),2))/(1. + params[0])) - f) / step;g[2]=((0.037361887285444456*pow(3.31764450945654 - 1.*abs((pow(params[1],2)*(1.*(1 + params[0])*(sin(12.566370614359172*abs(x[0])) + 4*(sin(6.283185307179586*abs(x[0] - x[1])) + sin(12.566370614359172*abs(x[1])) - sin(6.283185307179586*abs(x[0] + x[1])) - sin(6.283185307179586*abs(x[0] - (x[2]+step))) + 2*sin(6.283185307179586*abs(x[1] - (x[2]+step))) + sin(12.566370614359172*abs((x[2]+step))) + sin(6.283185307179586*abs(x[0] + (x[2]+step))) - 2*sin(6.283185307179586*abs(x[1] + (x[2]+step))))) - 1.*sin(12.566370614359172*abs(x[0])*(1 + params[0])) - 4.*sin(6.283185307179586*abs(x[0] - x[1])*(1 + params[0])) - 4.*sin(12.566370614359172*abs(x[1])*(1 + params[0])) + 4.*sin(6.283185307179586*abs(x[0] + x[1])*(1 + params[0])) + 4.*sin(6.283185307179586*abs(x[0] - (x[2]+step))*(1 + params[0])) - 8.*sin(6.283185307179586*abs(x[1] - (x[2]+step))*(1 + params[0])) - 4.*sin(12.566370614359172*abs((x[2]+step))*(1 + params[0])) - 4.*sin(6.283185307179586*abs(x[0] + (x[2]+step))*(1 + params[0])) + 8.*sin(6.283185307179586*abs(x[1] + (x[2]+step))*(1 + params[0]))))/(1 + params[0])),2) + 1.7513384665052094*pow(params[1],2)*pow(sin(6.283185307179586*x[0]) - 2.*sin(6.283185307179586*x[1]) + 2.*sin(6.283185307179586*(x[2]+step)),2) + (1.7513384665052094*pow(params[1],2)*pow(sin(6.283185307179586*(1 + params[0])*x[0]) - 2.*sin(6.283185307179586*(1 + params[0])*x[1]) + 2.*sin(6.283185307179586*(1 + params[0])*(x[2]+step)),2))/(1. + params[0])) - f) / step;})