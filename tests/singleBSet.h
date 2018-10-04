#ifndef __FUNCTION_H__

#define __FUNCTION_H__

#ifdef USE_MPI
#include <mpi.h>
#endif
#include "../precision.h"

#define DIM 3
#define EXPDATE "2018-03-19"
#define EXPNAME "FRAG Scheme Gate Optimization (Dimensionless Micromotion)"
#define EXPPARAMETERS "{nk: 2.-40.,chi: 0.0004-0.0004}"
#define EXPFORMAT "{[nk,chi],[lowerBound, upperBound], tau, f, [X]}"
#define BOUNDED true
#define BSETS 1
#define BOUNDS boundary_t b0;b0.startUpper=0.005;b0.startLower=-0.005;b0.steps=10;b0.incrementUpper=0.005;b0.incrementLower=-0.005;b0.intCast=false;b0.dim=3;b0.hasSym=true;boundaries[0]=b0;

#define BUCKETORD 9
#define NBINSOUT 5
#define REPORTFAILS false
#define REPORTROUNDING false
#define MEMSIZE 12
#define MAXLINE 50
#define MAXIT 50
#define SIGDIG 9

#define NEXTRADATA 1
#define EXTRAOUT floatval_t gTime = 0.0;for(int k = 0; k < DIM; k++){if(abs(2*bestX[k]) > gTime){gTime = abs(2*bestX[k]);}}outfile << gTime.to_out_string(SIGDIG);

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

#define NPARAMS 4

int P0FP(floatval_t value, floatval_t* params, int depth) { return to_int(nint(floatval_t(99999.99999999999)*(floatval_t(-0.0004) + value))); }
int P0S(floatval_t* params, int depth) { return 0; } 
floatval_t P0G(int i, floatval_t* params, int depth) { return floatval_t(0.0004) + floatval_t(0.00001)*i; } 
int P1FP(floatval_t value, floatval_t* params, int depth) { return to_int(nint(floatval_t(10.)*(floatval_t(-0.1) + value))); }
int P1S(floatval_t* params, int depth) { return 0; } 
floatval_t P1G(int i, floatval_t* params, int depth) { return floatval_t(0.1) + floatval_t(0.1)*i; } 
int P2FP(floatval_t value, floatval_t* params, int depth) { return to_int(nint(((to_int(nint(10*params[1])) % 2 + 10*params[1])*(floatval_t(-0.0001) + value + pow(params[1],2)/floatval_t(2.)))/(floatval_t(2.)*(floatval_t(-0.0001) + pow(params[1],2)/floatval_t(2.))))); }
int P2S(floatval_t* params, int depth) { return 0; } 
floatval_t P2G(int i, floatval_t* params, int depth) { return floatval_t(0.0001) - pow(params[1],2)/floatval_t(2.) + (2*i*(floatval_t(-0.0001) + pow(params[1],2)/floatval_t(2.)))/(to_int(nint(10*params[1])) % 2 + 10*params[1]); } 
int P3FP(floatval_t value, floatval_t* params, int depth) { return to_int(nint(floatval_t(-1.) + value)); }
int P3S(floatval_t* params, int depth) { return 0; } 
floatval_t P3G(int i, floatval_t* params, int depth) { return floatval_t(1.) + floatval_t(1.)*i; } 


#define PARAMETERS parameter_t p0;p0.get=P0G;p0.steps=P0S;p0.findPos=P0FP;parameters[0]=p0;parameter_t p1;p1.get=P1G;p1.steps=P1S;p1.findPos=P1FP;parameters[1]=p1;parameter_t p2;p2.get=P2G;p2.steps=P2S;p2.findPos=P2FP;parameters[2]=p2;parameter_t p3;p3.get=P3G;p3.steps=P3S;p3.findPos=P3FP;parameters[3]=p3;
#define PARAMSCONSTSCOUNT 1
#define PARAMCOMPUTE(params) ({precompute[0]=1/(pow(params[1],2)/floatval_t(2.) + params[2]);})

#define FUNCTION(x, params) ({0.6666666666666666*pow(abs((-0.7853981633974483 - 0.7853981633974483*params[0] - 0.40959999999999996*pow(params[3],2)*sin(12.566370614359172*abs(x[1])) - 0.40959999999999996*params[0]*pow(params[3],2)*sin(12.566370614359172*abs(x[1])) + 0.40959999999999996*pow(params[3],2)*sin(abs(6.283185307179586*x[0] + 6.283185307179586*x[1])) + 0.40959999999999996*params[0]*pow(params[3],2)*sin(abs(6.283185307179586*x[0] + 6.283185307179586*x[1])) + 0.40959999999999996*pow(params[3],2)*sin(abs(6.283185307179586*x[0] - 6.283185307179586*x[2])) + 0.40959999999999996*params[0]*pow(params[3],2)*sin(abs(6.283185307179586*x[0] - 6.283185307179586*x[2])) - 0.8191999999999999*pow(params[3],2)*sin(abs(6.283185307179586*x[1] - 6.283185307179586*x[2])) - 0.8191999999999999*params[0]*pow(params[3],2)*sin(abs(6.283185307179586*x[1] - 6.283185307179586*x[2])) - 0.40959999999999996*pow(params[3],2)*sin(12.566370614359172*abs(x[2])) - 0.40959999999999996*params[0]*pow(params[3],2)*sin(12.566370614359172*abs(x[2])) - 0.40959999999999996*pow(params[3],2)*sin(abs(6.283185307179586*x[0] + 6.283185307179586*x[2])) - 0.40959999999999996*params[0]*pow(params[3],2)*sin(abs(6.283185307179586*x[0] + 6.283185307179586*x[2])) + 0.8191999999999999*pow(params[3],2)*sin(abs(6.283185307179586*x[1] + 6.283185307179586*x[2])) + 0.8191999999999999*params[0]*pow(params[3],2)*sin(abs(6.283185307179586*x[1] + 6.283185307179586*x[2])) + 0.10239999999999999*pow(params[3],2)*sin(12.566370614359172*abs(x[0])*(1 + params[0])) + 0.40959999999999996*pow(params[3],2)*sin(abs(6.283185307179586*x[0] - 6.283185307179586*x[1])*(1 + params[0])) + 0.40959999999999996*pow(params[3],2)*sin(12.566370614359172*abs(x[1])*(1 + params[0])) - 0.40959999999999996*pow(params[3],2)*sin(abs(6.283185307179586*x[0] + 6.283185307179586*x[1])*(1 + params[0])) - 0.40959999999999996*pow(params[3],2)*sin(abs(6.283185307179586*x[0] - 6.283185307179586*x[2])*(1 + params[0])) + 0.8191999999999999*pow(params[3],2)*sin(abs(6.283185307179586*x[1] - 6.283185307179586*x[2])*(1 + params[0])) + 0.40959999999999996*pow(params[3],2)*sin(12.566370614359172*abs(x[2])*(1 + params[0])) + 0.40959999999999996*pow(params[3],2)*sin(abs(6.283185307179586*x[0] + 6.283185307179586*x[2])*(1 + params[0])) - 0.8191999999999999*pow(params[3],2)*sin(abs(6.283185307179586*x[1] + 6.283185307179586*x[2])*(1 + params[0])) - 0.025599999999999998*pow(params[1],2)*pow(params[3],2)*sin(12.566370614359172*abs(x[0])*(1 + params[0]))*pow(sin(12.566370614359172*precompute[0]*x[0]),2) + pow(params[3],2)*sin(12.566370614359172*abs(x[0]))*(-0.10239999999999999 - 0.10239999999999999*params[0] + (0.025599999999999998 + 0.025599999999999998*params[0])*pow(params[1],2)*pow(sin(12.566370614359172*precompute[0]*x[0]),2)) - 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[0] + 6.283185307179586*x[1]))*sin(12.566370614359172*precompute[0]*x[0])*sin(12.566370614359172*precompute[0]*x[1]) - 0.10239999999999999*params[0]*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[0] + 6.283185307179586*x[1]))*sin(12.566370614359172*precompute[0]*x[0])*sin(12.566370614359172*precompute[0]*x[1]) + 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[0] - 6.283185307179586*x[1])*(1 + params[0]))*sin(12.566370614359172*precompute[0]*x[0])*sin(12.566370614359172*precompute[0]*x[1]) + 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[0] + 6.283185307179586*x[1])*(1 + params[0]))*sin(12.566370614359172*precompute[0]*x[0])*sin(12.566370614359172*precompute[0]*x[1]) + 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(12.566370614359172*abs(x[1]))*pow(sin(12.566370614359172*precompute[0]*x[1]),2) + 0.10239999999999999*params[0]*pow(params[1],2)*pow(params[3],2)*sin(12.566370614359172*abs(x[1]))*pow(sin(12.566370614359172*precompute[0]*x[1]),2) - 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(12.566370614359172*abs(x[1])*(1 + params[0]))*pow(sin(12.566370614359172*precompute[0]*x[1]),2) + pow(params[3],2)*sin(abs(6.283185307179586*x[0] - 6.283185307179586*x[1]))*(-0.40959999999999996 - 0.40959999999999996*params[0] + (-0.10239999999999999 - 0.10239999999999999*params[0])*pow(params[1],2)*sin(12.566370614359172*precompute[0]*x[0])*sin(12.566370614359172*precompute[0]*x[1])) + 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[0] - 6.283185307179586*x[2]))*sin(12.566370614359172*precompute[0]*x[0])*sin(12.566370614359172*precompute[0]*x[2]) + 0.10239999999999999*params[0]*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[0] - 6.283185307179586*x[2]))*sin(12.566370614359172*precompute[0]*x[0])*sin(12.566370614359172*precompute[0]*x[2]) + 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[0] + 6.283185307179586*x[2]))*sin(12.566370614359172*precompute[0]*x[0])*sin(12.566370614359172*precompute[0]*x[2]) + 0.10239999999999999*params[0]*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[0] + 6.283185307179586*x[2]))*sin(12.566370614359172*precompute[0]*x[0])*sin(12.566370614359172*precompute[0]*x[2]) - 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[0] - 6.283185307179586*x[2])*(1 + params[0]))*sin(12.566370614359172*precompute[0]*x[0])*sin(12.566370614359172*precompute[0]*x[2]) - 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[0] + 6.283185307179586*x[2])*(1 + params[0]))*sin(12.566370614359172*precompute[0]*x[0])*sin(12.566370614359172*precompute[0]*x[2]) - 0.20479999999999998*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[1] - 6.283185307179586*x[2]))*sin(12.566370614359172*precompute[0]*x[1])*sin(12.566370614359172*precompute[0]*x[2]) - 0.20479999999999998*params[0]*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[1] - 6.283185307179586*x[2]))*sin(12.566370614359172*precompute[0]*x[1])*sin(12.566370614359172*precompute[0]*x[2]) - 0.20479999999999998*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[1] + 6.283185307179586*x[2]))*sin(12.566370614359172*precompute[0]*x[1])*sin(12.566370614359172*precompute[0]*x[2]) - 0.20479999999999998*params[0]*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[1] + 6.283185307179586*x[2]))*sin(12.566370614359172*precompute[0]*x[1])*sin(12.566370614359172*precompute[0]*x[2]) + 0.20479999999999998*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[1] - 6.283185307179586*x[2])*(1 + params[0]))*sin(12.566370614359172*precompute[0]*x[1])*sin(12.566370614359172*precompute[0]*x[2]) + 0.20479999999999998*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[1] + 6.283185307179586*x[2])*(1 + params[0]))*sin(12.566370614359172*precompute[0]*x[1])*sin(12.566370614359172*precompute[0]*x[2]) + 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(12.566370614359172*abs(x[2]))*pow(sin(12.566370614359172*precompute[0]*x[2]),2) + 0.10239999999999999*params[0]*pow(params[1],2)*pow(params[3],2)*sin(12.566370614359172*abs(x[2]))*pow(sin(12.566370614359172*precompute[0]*x[2]),2) - 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(12.566370614359172*abs(x[2])*(1 + params[0]))*pow(sin(12.566370614359172*precompute[0]*x[2]),2))/(1. + params[0])),2) + 0.08191999999999998*pow(params[3],2)*pow(sin(6.283185307179586*x[0])*(2 + params[1]*sin(12.566370614359172*precompute[0]*x[0])) - 2*sin(6.283185307179586*x[1])*(2 + params[1]*sin(12.566370614359172*precompute[0]*x[1])) + 2*sin(6.283185307179586*x[2])*(2 + params[1]*sin(12.566370614359172*precompute[0]*x[2])),2) + (0.08191999999999998*pow(params[3],2)*pow(sin(6.283185307179586*(1 + params[0])*x[0])*(2. + params[1]*sin(12.566370614359172*precompute[0]*x[0])) + sin(6.283185307179586*(1 + params[0])*x[1])*(-4. - 2.*params[1]*sin(12.566370614359172*precompute[0]*x[1])) + sin(6.283185307179586*(1 + params[0])*x[2])*(4. + 2.*params[1]*sin(12.566370614359172*precompute[0]*x[2])),2))/(1. + params[0]);})
#define DERIVATIVES(g, x, params, f, step) ({g[0]=((0.6666666666666666*pow(abs((-0.7853981633974483 - 0.7853981633974483*params[0] - 0.40959999999999996*pow(params[3],2)*sin(12.566370614359172*abs(x[1])) - 0.40959999999999996*params[0]*pow(params[3],2)*sin(12.566370614359172*abs(x[1])) + 0.40959999999999996*pow(params[3],2)*sin(abs(6.283185307179586*(x[0]+step) + 6.283185307179586*x[1])) + 0.40959999999999996*params[0]*pow(params[3],2)*sin(abs(6.283185307179586*(x[0]+step) + 6.283185307179586*x[1])) + 0.40959999999999996*pow(params[3],2)*sin(abs(6.283185307179586*(x[0]+step) - 6.283185307179586*x[2])) + 0.40959999999999996*params[0]*pow(params[3],2)*sin(abs(6.283185307179586*(x[0]+step) - 6.283185307179586*x[2])) - 0.8191999999999999*pow(params[3],2)*sin(abs(6.283185307179586*x[1] - 6.283185307179586*x[2])) - 0.8191999999999999*params[0]*pow(params[3],2)*sin(abs(6.283185307179586*x[1] - 6.283185307179586*x[2])) - 0.40959999999999996*pow(params[3],2)*sin(12.566370614359172*abs(x[2])) - 0.40959999999999996*params[0]*pow(params[3],2)*sin(12.566370614359172*abs(x[2])) - 0.40959999999999996*pow(params[3],2)*sin(abs(6.283185307179586*(x[0]+step) + 6.283185307179586*x[2])) - 0.40959999999999996*params[0]*pow(params[3],2)*sin(abs(6.283185307179586*(x[0]+step) + 6.283185307179586*x[2])) + 0.8191999999999999*pow(params[3],2)*sin(abs(6.283185307179586*x[1] + 6.283185307179586*x[2])) + 0.8191999999999999*params[0]*pow(params[3],2)*sin(abs(6.283185307179586*x[1] + 6.283185307179586*x[2])) + 0.10239999999999999*pow(params[3],2)*sin(12.566370614359172*abs((x[0]+step))*(1 + params[0])) + 0.40959999999999996*pow(params[3],2)*sin(abs(6.283185307179586*(x[0]+step) - 6.283185307179586*x[1])*(1 + params[0])) + 0.40959999999999996*pow(params[3],2)*sin(12.566370614359172*abs(x[1])*(1 + params[0])) - 0.40959999999999996*pow(params[3],2)*sin(abs(6.283185307179586*(x[0]+step) + 6.283185307179586*x[1])*(1 + params[0])) - 0.40959999999999996*pow(params[3],2)*sin(abs(6.283185307179586*(x[0]+step) - 6.283185307179586*x[2])*(1 + params[0])) + 0.8191999999999999*pow(params[3],2)*sin(abs(6.283185307179586*x[1] - 6.283185307179586*x[2])*(1 + params[0])) + 0.40959999999999996*pow(params[3],2)*sin(12.566370614359172*abs(x[2])*(1 + params[0])) + 0.40959999999999996*pow(params[3],2)*sin(abs(6.283185307179586*(x[0]+step) + 6.283185307179586*x[2])*(1 + params[0])) - 0.8191999999999999*pow(params[3],2)*sin(abs(6.283185307179586*x[1] + 6.283185307179586*x[2])*(1 + params[0])) - 0.025599999999999998*pow(params[1],2)*pow(params[3],2)*sin(12.566370614359172*abs((x[0]+step))*(1 + params[0]))*pow(sin(12.566370614359172*precompute[0]*(x[0]+step)),2) + pow(params[3],2)*sin(12.566370614359172*abs((x[0]+step)))*(-0.10239999999999999 - 0.10239999999999999*params[0] + (0.025599999999999998 + 0.025599999999999998*params[0])*pow(params[1],2)*pow(sin(12.566370614359172*precompute[0]*(x[0]+step)),2)) - 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*(x[0]+step) + 6.283185307179586*x[1]))*sin(12.566370614359172*precompute[0]*(x[0]+step))*sin(12.566370614359172*precompute[0]*x[1]) - 0.10239999999999999*params[0]*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*(x[0]+step) + 6.283185307179586*x[1]))*sin(12.566370614359172*precompute[0]*(x[0]+step))*sin(12.566370614359172*precompute[0]*x[1]) + 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*(x[0]+step) - 6.283185307179586*x[1])*(1 + params[0]))*sin(12.566370614359172*precompute[0]*(x[0]+step))*sin(12.566370614359172*precompute[0]*x[1]) + 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*(x[0]+step) + 6.283185307179586*x[1])*(1 + params[0]))*sin(12.566370614359172*precompute[0]*(x[0]+step))*sin(12.566370614359172*precompute[0]*x[1]) + 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(12.566370614359172*abs(x[1]))*pow(sin(12.566370614359172*precompute[0]*x[1]),2) + 0.10239999999999999*params[0]*pow(params[1],2)*pow(params[3],2)*sin(12.566370614359172*abs(x[1]))*pow(sin(12.566370614359172*precompute[0]*x[1]),2) - 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(12.566370614359172*abs(x[1])*(1 + params[0]))*pow(sin(12.566370614359172*precompute[0]*x[1]),2) + pow(params[3],2)*sin(abs(6.283185307179586*(x[0]+step) - 6.283185307179586*x[1]))*(-0.40959999999999996 - 0.40959999999999996*params[0] + (-0.10239999999999999 - 0.10239999999999999*params[0])*pow(params[1],2)*sin(12.566370614359172*precompute[0]*(x[0]+step))*sin(12.566370614359172*precompute[0]*x[1])) + 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*(x[0]+step) - 6.283185307179586*x[2]))*sin(12.566370614359172*precompute[0]*(x[0]+step))*sin(12.566370614359172*precompute[0]*x[2]) + 0.10239999999999999*params[0]*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*(x[0]+step) - 6.283185307179586*x[2]))*sin(12.566370614359172*precompute[0]*(x[0]+step))*sin(12.566370614359172*precompute[0]*x[2]) + 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*(x[0]+step) + 6.283185307179586*x[2]))*sin(12.566370614359172*precompute[0]*(x[0]+step))*sin(12.566370614359172*precompute[0]*x[2]) + 0.10239999999999999*params[0]*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*(x[0]+step) + 6.283185307179586*x[2]))*sin(12.566370614359172*precompute[0]*(x[0]+step))*sin(12.566370614359172*precompute[0]*x[2]) - 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*(x[0]+step) - 6.283185307179586*x[2])*(1 + params[0]))*sin(12.566370614359172*precompute[0]*(x[0]+step))*sin(12.566370614359172*precompute[0]*x[2]) - 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*(x[0]+step) + 6.283185307179586*x[2])*(1 + params[0]))*sin(12.566370614359172*precompute[0]*(x[0]+step))*sin(12.566370614359172*precompute[0]*x[2]) - 0.20479999999999998*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[1] - 6.283185307179586*x[2]))*sin(12.566370614359172*precompute[0]*x[1])*sin(12.566370614359172*precompute[0]*x[2]) - 0.20479999999999998*params[0]*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[1] - 6.283185307179586*x[2]))*sin(12.566370614359172*precompute[0]*x[1])*sin(12.566370614359172*precompute[0]*x[2]) - 0.20479999999999998*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[1] + 6.283185307179586*x[2]))*sin(12.566370614359172*precompute[0]*x[1])*sin(12.566370614359172*precompute[0]*x[2]) - 0.20479999999999998*params[0]*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[1] + 6.283185307179586*x[2]))*sin(12.566370614359172*precompute[0]*x[1])*sin(12.566370614359172*precompute[0]*x[2]) + 0.20479999999999998*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[1] - 6.283185307179586*x[2])*(1 + params[0]))*sin(12.566370614359172*precompute[0]*x[1])*sin(12.566370614359172*precompute[0]*x[2]) + 0.20479999999999998*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[1] + 6.283185307179586*x[2])*(1 + params[0]))*sin(12.566370614359172*precompute[0]*x[1])*sin(12.566370614359172*precompute[0]*x[2]) + 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(12.566370614359172*abs(x[2]))*pow(sin(12.566370614359172*precompute[0]*x[2]),2) + 0.10239999999999999*params[0]*pow(params[1],2)*pow(params[3],2)*sin(12.566370614359172*abs(x[2]))*pow(sin(12.566370614359172*precompute[0]*x[2]),2) - 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(12.566370614359172*abs(x[2])*(1 + params[0]))*pow(sin(12.566370614359172*precompute[0]*x[2]),2))/(1. + params[0])),2) + 0.08191999999999998*pow(params[3],2)*pow(sin(6.283185307179586*(x[0]+step))*(2 + params[1]*sin(12.566370614359172*precompute[0]*(x[0]+step))) - 2*sin(6.283185307179586*x[1])*(2 + params[1]*sin(12.566370614359172*precompute[0]*x[1])) + 2*sin(6.283185307179586*x[2])*(2 + params[1]*sin(12.566370614359172*precompute[0]*x[2])),2) + (0.08191999999999998*pow(params[3],2)*pow(sin(6.283185307179586*(1 + params[0])*(x[0]+step))*(2. + params[1]*sin(12.566370614359172*precompute[0]*(x[0]+step))) + sin(6.283185307179586*(1 + params[0])*x[1])*(-4. - 2.*params[1]*sin(12.566370614359172*precompute[0]*x[1])) + sin(6.283185307179586*(1 + params[0])*x[2])*(4. + 2.*params[1]*sin(12.566370614359172*precompute[0]*x[2])),2))/(1. + params[0])) - f) / step;g[1]=((0.6666666666666666*pow(abs((-0.7853981633974483 - 0.7853981633974483*params[0] - 0.40959999999999996*pow(params[3],2)*sin(12.566370614359172*abs((x[1]+step))) - 0.40959999999999996*params[0]*pow(params[3],2)*sin(12.566370614359172*abs((x[1]+step))) + 0.40959999999999996*pow(params[3],2)*sin(abs(6.283185307179586*x[0] + 6.283185307179586*(x[1]+step))) + 0.40959999999999996*params[0]*pow(params[3],2)*sin(abs(6.283185307179586*x[0] + 6.283185307179586*(x[1]+step))) + 0.40959999999999996*pow(params[3],2)*sin(abs(6.283185307179586*x[0] - 6.283185307179586*x[2])) + 0.40959999999999996*params[0]*pow(params[3],2)*sin(abs(6.283185307179586*x[0] - 6.283185307179586*x[2])) - 0.8191999999999999*pow(params[3],2)*sin(abs(6.283185307179586*(x[1]+step) - 6.283185307179586*x[2])) - 0.8191999999999999*params[0]*pow(params[3],2)*sin(abs(6.283185307179586*(x[1]+step) - 6.283185307179586*x[2])) - 0.40959999999999996*pow(params[3],2)*sin(12.566370614359172*abs(x[2])) - 0.40959999999999996*params[0]*pow(params[3],2)*sin(12.566370614359172*abs(x[2])) - 0.40959999999999996*pow(params[3],2)*sin(abs(6.283185307179586*x[0] + 6.283185307179586*x[2])) - 0.40959999999999996*params[0]*pow(params[3],2)*sin(abs(6.283185307179586*x[0] + 6.283185307179586*x[2])) + 0.8191999999999999*pow(params[3],2)*sin(abs(6.283185307179586*(x[1]+step) + 6.283185307179586*x[2])) + 0.8191999999999999*params[0]*pow(params[3],2)*sin(abs(6.283185307179586*(x[1]+step) + 6.283185307179586*x[2])) + 0.10239999999999999*pow(params[3],2)*sin(12.566370614359172*abs(x[0])*(1 + params[0])) + 0.40959999999999996*pow(params[3],2)*sin(abs(6.283185307179586*x[0] - 6.283185307179586*(x[1]+step))*(1 + params[0])) + 0.40959999999999996*pow(params[3],2)*sin(12.566370614359172*abs((x[1]+step))*(1 + params[0])) - 0.40959999999999996*pow(params[3],2)*sin(abs(6.283185307179586*x[0] + 6.283185307179586*(x[1]+step))*(1 + params[0])) - 0.40959999999999996*pow(params[3],2)*sin(abs(6.283185307179586*x[0] - 6.283185307179586*x[2])*(1 + params[0])) + 0.8191999999999999*pow(params[3],2)*sin(abs(6.283185307179586*(x[1]+step) - 6.283185307179586*x[2])*(1 + params[0])) + 0.40959999999999996*pow(params[3],2)*sin(12.566370614359172*abs(x[2])*(1 + params[0])) + 0.40959999999999996*pow(params[3],2)*sin(abs(6.283185307179586*x[0] + 6.283185307179586*x[2])*(1 + params[0])) - 0.8191999999999999*pow(params[3],2)*sin(abs(6.283185307179586*(x[1]+step) + 6.283185307179586*x[2])*(1 + params[0])) - 0.025599999999999998*pow(params[1],2)*pow(params[3],2)*sin(12.566370614359172*abs(x[0])*(1 + params[0]))*pow(sin(12.566370614359172*precompute[0]*x[0]),2) + pow(params[3],2)*sin(12.566370614359172*abs(x[0]))*(-0.10239999999999999 - 0.10239999999999999*params[0] + (0.025599999999999998 + 0.025599999999999998*params[0])*pow(params[1],2)*pow(sin(12.566370614359172*precompute[0]*x[0]),2)) - 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[0] + 6.283185307179586*(x[1]+step)))*sin(12.566370614359172*precompute[0]*x[0])*sin(12.566370614359172*precompute[0]*(x[1]+step)) - 0.10239999999999999*params[0]*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[0] + 6.283185307179586*(x[1]+step)))*sin(12.566370614359172*precompute[0]*x[0])*sin(12.566370614359172*precompute[0]*(x[1]+step)) + 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[0] - 6.283185307179586*(x[1]+step))*(1 + params[0]))*sin(12.566370614359172*precompute[0]*x[0])*sin(12.566370614359172*precompute[0]*(x[1]+step)) + 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[0] + 6.283185307179586*(x[1]+step))*(1 + params[0]))*sin(12.566370614359172*precompute[0]*x[0])*sin(12.566370614359172*precompute[0]*(x[1]+step)) + 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(12.566370614359172*abs((x[1]+step)))*pow(sin(12.566370614359172*precompute[0]*(x[1]+step)),2) + 0.10239999999999999*params[0]*pow(params[1],2)*pow(params[3],2)*sin(12.566370614359172*abs((x[1]+step)))*pow(sin(12.566370614359172*precompute[0]*(x[1]+step)),2) - 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(12.566370614359172*abs((x[1]+step))*(1 + params[0]))*pow(sin(12.566370614359172*precompute[0]*(x[1]+step)),2) + pow(params[3],2)*sin(abs(6.283185307179586*x[0] - 6.283185307179586*(x[1]+step)))*(-0.40959999999999996 - 0.40959999999999996*params[0] + (-0.10239999999999999 - 0.10239999999999999*params[0])*pow(params[1],2)*sin(12.566370614359172*precompute[0]*x[0])*sin(12.566370614359172*precompute[0]*(x[1]+step))) + 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[0] - 6.283185307179586*x[2]))*sin(12.566370614359172*precompute[0]*x[0])*sin(12.566370614359172*precompute[0]*x[2]) + 0.10239999999999999*params[0]*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[0] - 6.283185307179586*x[2]))*sin(12.566370614359172*precompute[0]*x[0])*sin(12.566370614359172*precompute[0]*x[2]) + 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[0] + 6.283185307179586*x[2]))*sin(12.566370614359172*precompute[0]*x[0])*sin(12.566370614359172*precompute[0]*x[2]) + 0.10239999999999999*params[0]*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[0] + 6.283185307179586*x[2]))*sin(12.566370614359172*precompute[0]*x[0])*sin(12.566370614359172*precompute[0]*x[2]) - 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[0] - 6.283185307179586*x[2])*(1 + params[0]))*sin(12.566370614359172*precompute[0]*x[0])*sin(12.566370614359172*precompute[0]*x[2]) - 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[0] + 6.283185307179586*x[2])*(1 + params[0]))*sin(12.566370614359172*precompute[0]*x[0])*sin(12.566370614359172*precompute[0]*x[2]) - 0.20479999999999998*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*(x[1]+step) - 6.283185307179586*x[2]))*sin(12.566370614359172*precompute[0]*(x[1]+step))*sin(12.566370614359172*precompute[0]*x[2]) - 0.20479999999999998*params[0]*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*(x[1]+step) - 6.283185307179586*x[2]))*sin(12.566370614359172*precompute[0]*(x[1]+step))*sin(12.566370614359172*precompute[0]*x[2]) - 0.20479999999999998*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*(x[1]+step) + 6.283185307179586*x[2]))*sin(12.566370614359172*precompute[0]*(x[1]+step))*sin(12.566370614359172*precompute[0]*x[2]) - 0.20479999999999998*params[0]*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*(x[1]+step) + 6.283185307179586*x[2]))*sin(12.566370614359172*precompute[0]*(x[1]+step))*sin(12.566370614359172*precompute[0]*x[2]) + 0.20479999999999998*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*(x[1]+step) - 6.283185307179586*x[2])*(1 + params[0]))*sin(12.566370614359172*precompute[0]*(x[1]+step))*sin(12.566370614359172*precompute[0]*x[2]) + 0.20479999999999998*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*(x[1]+step) + 6.283185307179586*x[2])*(1 + params[0]))*sin(12.566370614359172*precompute[0]*(x[1]+step))*sin(12.566370614359172*precompute[0]*x[2]) + 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(12.566370614359172*abs(x[2]))*pow(sin(12.566370614359172*precompute[0]*x[2]),2) + 0.10239999999999999*params[0]*pow(params[1],2)*pow(params[3],2)*sin(12.566370614359172*abs(x[2]))*pow(sin(12.566370614359172*precompute[0]*x[2]),2) - 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(12.566370614359172*abs(x[2])*(1 + params[0]))*pow(sin(12.566370614359172*precompute[0]*x[2]),2))/(1. + params[0])),2) + 0.08191999999999998*pow(params[3],2)*pow(sin(6.283185307179586*x[0])*(2 + params[1]*sin(12.566370614359172*precompute[0]*x[0])) - 2*sin(6.283185307179586*(x[1]+step))*(2 + params[1]*sin(12.566370614359172*precompute[0]*(x[1]+step))) + 2*sin(6.283185307179586*x[2])*(2 + params[1]*sin(12.566370614359172*precompute[0]*x[2])),2) + (0.08191999999999998*pow(params[3],2)*pow(sin(6.283185307179586*(1 + params[0])*x[0])*(2. + params[1]*sin(12.566370614359172*precompute[0]*x[0])) + sin(6.283185307179586*(1 + params[0])*(x[1]+step))*(-4. - 2.*params[1]*sin(12.566370614359172*precompute[0]*(x[1]+step))) + sin(6.283185307179586*(1 + params[0])*x[2])*(4. + 2.*params[1]*sin(12.566370614359172*precompute[0]*x[2])),2))/(1. + params[0])) - f) / step;g[2]=((0.6666666666666666*pow(abs((-0.7853981633974483 - 0.7853981633974483*params[0] - 0.40959999999999996*pow(params[3],2)*sin(12.566370614359172*abs(x[1])) - 0.40959999999999996*params[0]*pow(params[3],2)*sin(12.566370614359172*abs(x[1])) + 0.40959999999999996*pow(params[3],2)*sin(abs(6.283185307179586*x[0] + 6.283185307179586*x[1])) + 0.40959999999999996*params[0]*pow(params[3],2)*sin(abs(6.283185307179586*x[0] + 6.283185307179586*x[1])) + 0.40959999999999996*pow(params[3],2)*sin(abs(6.283185307179586*x[0] - 6.283185307179586*(x[2]+step))) + 0.40959999999999996*params[0]*pow(params[3],2)*sin(abs(6.283185307179586*x[0] - 6.283185307179586*(x[2]+step))) - 0.8191999999999999*pow(params[3],2)*sin(abs(6.283185307179586*x[1] - 6.283185307179586*(x[2]+step))) - 0.8191999999999999*params[0]*pow(params[3],2)*sin(abs(6.283185307179586*x[1] - 6.283185307179586*(x[2]+step))) - 0.40959999999999996*pow(params[3],2)*sin(12.566370614359172*abs((x[2]+step))) - 0.40959999999999996*params[0]*pow(params[3],2)*sin(12.566370614359172*abs((x[2]+step))) - 0.40959999999999996*pow(params[3],2)*sin(abs(6.283185307179586*x[0] + 6.283185307179586*(x[2]+step))) - 0.40959999999999996*params[0]*pow(params[3],2)*sin(abs(6.283185307179586*x[0] + 6.283185307179586*(x[2]+step))) + 0.8191999999999999*pow(params[3],2)*sin(abs(6.283185307179586*x[1] + 6.283185307179586*(x[2]+step))) + 0.8191999999999999*params[0]*pow(params[3],2)*sin(abs(6.283185307179586*x[1] + 6.283185307179586*(x[2]+step))) + 0.10239999999999999*pow(params[3],2)*sin(12.566370614359172*abs(x[0])*(1 + params[0])) + 0.40959999999999996*pow(params[3],2)*sin(abs(6.283185307179586*x[0] - 6.283185307179586*x[1])*(1 + params[0])) + 0.40959999999999996*pow(params[3],2)*sin(12.566370614359172*abs(x[1])*(1 + params[0])) - 0.40959999999999996*pow(params[3],2)*sin(abs(6.283185307179586*x[0] + 6.283185307179586*x[1])*(1 + params[0])) - 0.40959999999999996*pow(params[3],2)*sin(abs(6.283185307179586*x[0] - 6.283185307179586*(x[2]+step))*(1 + params[0])) + 0.8191999999999999*pow(params[3],2)*sin(abs(6.283185307179586*x[1] - 6.283185307179586*(x[2]+step))*(1 + params[0])) + 0.40959999999999996*pow(params[3],2)*sin(12.566370614359172*abs((x[2]+step))*(1 + params[0])) + 0.40959999999999996*pow(params[3],2)*sin(abs(6.283185307179586*x[0] + 6.283185307179586*(x[2]+step))*(1 + params[0])) - 0.8191999999999999*pow(params[3],2)*sin(abs(6.283185307179586*x[1] + 6.283185307179586*(x[2]+step))*(1 + params[0])) - 0.025599999999999998*pow(params[1],2)*pow(params[3],2)*sin(12.566370614359172*abs(x[0])*(1 + params[0]))*pow(sin(12.566370614359172*precompute[0]*x[0]),2) + pow(params[3],2)*sin(12.566370614359172*abs(x[0]))*(-0.10239999999999999 - 0.10239999999999999*params[0] + (0.025599999999999998 + 0.025599999999999998*params[0])*pow(params[1],2)*pow(sin(12.566370614359172*precompute[0]*x[0]),2)) - 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[0] + 6.283185307179586*x[1]))*sin(12.566370614359172*precompute[0]*x[0])*sin(12.566370614359172*precompute[0]*x[1]) - 0.10239999999999999*params[0]*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[0] + 6.283185307179586*x[1]))*sin(12.566370614359172*precompute[0]*x[0])*sin(12.566370614359172*precompute[0]*x[1]) + 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[0] - 6.283185307179586*x[1])*(1 + params[0]))*sin(12.566370614359172*precompute[0]*x[0])*sin(12.566370614359172*precompute[0]*x[1]) + 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[0] + 6.283185307179586*x[1])*(1 + params[0]))*sin(12.566370614359172*precompute[0]*x[0])*sin(12.566370614359172*precompute[0]*x[1]) + 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(12.566370614359172*abs(x[1]))*pow(sin(12.566370614359172*precompute[0]*x[1]),2) + 0.10239999999999999*params[0]*pow(params[1],2)*pow(params[3],2)*sin(12.566370614359172*abs(x[1]))*pow(sin(12.566370614359172*precompute[0]*x[1]),2) - 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(12.566370614359172*abs(x[1])*(1 + params[0]))*pow(sin(12.566370614359172*precompute[0]*x[1]),2) + pow(params[3],2)*sin(abs(6.283185307179586*x[0] - 6.283185307179586*x[1]))*(-0.40959999999999996 - 0.40959999999999996*params[0] + (-0.10239999999999999 - 0.10239999999999999*params[0])*pow(params[1],2)*sin(12.566370614359172*precompute[0]*x[0])*sin(12.566370614359172*precompute[0]*x[1])) + 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[0] - 6.283185307179586*(x[2]+step)))*sin(12.566370614359172*precompute[0]*x[0])*sin(12.566370614359172*precompute[0]*(x[2]+step)) + 0.10239999999999999*params[0]*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[0] - 6.283185307179586*(x[2]+step)))*sin(12.566370614359172*precompute[0]*x[0])*sin(12.566370614359172*precompute[0]*(x[2]+step)) + 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[0] + 6.283185307179586*(x[2]+step)))*sin(12.566370614359172*precompute[0]*x[0])*sin(12.566370614359172*precompute[0]*(x[2]+step)) + 0.10239999999999999*params[0]*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[0] + 6.283185307179586*(x[2]+step)))*sin(12.566370614359172*precompute[0]*x[0])*sin(12.566370614359172*precompute[0]*(x[2]+step)) - 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[0] - 6.283185307179586*(x[2]+step))*(1 + params[0]))*sin(12.566370614359172*precompute[0]*x[0])*sin(12.566370614359172*precompute[0]*(x[2]+step)) - 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[0] + 6.283185307179586*(x[2]+step))*(1 + params[0]))*sin(12.566370614359172*precompute[0]*x[0])*sin(12.566370614359172*precompute[0]*(x[2]+step)) - 0.20479999999999998*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[1] - 6.283185307179586*(x[2]+step)))*sin(12.566370614359172*precompute[0]*x[1])*sin(12.566370614359172*precompute[0]*(x[2]+step)) - 0.20479999999999998*params[0]*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[1] - 6.283185307179586*(x[2]+step)))*sin(12.566370614359172*precompute[0]*x[1])*sin(12.566370614359172*precompute[0]*(x[2]+step)) - 0.20479999999999998*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[1] + 6.283185307179586*(x[2]+step)))*sin(12.566370614359172*precompute[0]*x[1])*sin(12.566370614359172*precompute[0]*(x[2]+step)) - 0.20479999999999998*params[0]*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[1] + 6.283185307179586*(x[2]+step)))*sin(12.566370614359172*precompute[0]*x[1])*sin(12.566370614359172*precompute[0]*(x[2]+step)) + 0.20479999999999998*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[1] - 6.283185307179586*(x[2]+step))*(1 + params[0]))*sin(12.566370614359172*precompute[0]*x[1])*sin(12.566370614359172*precompute[0]*(x[2]+step)) + 0.20479999999999998*pow(params[1],2)*pow(params[3],2)*sin(abs(6.283185307179586*x[1] + 6.283185307179586*(x[2]+step))*(1 + params[0]))*sin(12.566370614359172*precompute[0]*x[1])*sin(12.566370614359172*precompute[0]*(x[2]+step)) + 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(12.566370614359172*abs((x[2]+step)))*pow(sin(12.566370614359172*precompute[0]*(x[2]+step)),2) + 0.10239999999999999*params[0]*pow(params[1],2)*pow(params[3],2)*sin(12.566370614359172*abs((x[2]+step)))*pow(sin(12.566370614359172*precompute[0]*(x[2]+step)),2) - 0.10239999999999999*pow(params[1],2)*pow(params[3],2)*sin(12.566370614359172*abs((x[2]+step))*(1 + params[0]))*pow(sin(12.566370614359172*precompute[0]*(x[2]+step)),2))/(1. + params[0])),2) + 0.08191999999999998*pow(params[3],2)*pow(sin(6.283185307179586*x[0])*(2 + params[1]*sin(12.566370614359172*precompute[0]*x[0])) - 2*sin(6.283185307179586*x[1])*(2 + params[1]*sin(12.566370614359172*precompute[0]*x[1])) + 2*sin(6.283185307179586*(x[2]+step))*(2 + params[1]*sin(12.566370614359172*precompute[0]*(x[2]+step))),2) + (0.08191999999999998*pow(params[3],2)*pow(sin(6.283185307179586*(1 + params[0])*x[0])*(2. + params[1]*sin(12.566370614359172*precompute[0]*x[0])) + sin(6.283185307179586*(1 + params[0])*x[1])*(-4. - 2.*params[1]*sin(12.566370614359172*precompute[0]*x[1])) + sin(6.283185307179586*(1 + params[0])*(x[2]+step))*(4. + 2.*params[1]*sin(12.566370614359172*precompute[0]*(x[2]+step))),2))/(1. + params[0])) - f) / step;})

#endif /*__FUNCTION_H__*/