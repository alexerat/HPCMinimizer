// ********************************************************
// logging
#define _SAMPLE_LOG_LEVEL             (1 << 0)
#define _SEGMENT_LOG_LEVEL            (1 << 1)
#define _PATH_LOG_LEVEL               (1 << 2)
#define _SIMULATION_LOG_LEVEL         (1 << 3)
#define _WARNING_LOG_LEVEL            (1 << 4)
#define _ERROR_LOG_LEVEL              (1 << 5)
#define _NO_ERROR_TERMINATE_LOG_LEVEL (1 << 6)
#define _ALL_LOG_LEVELS        _SAMPLE_LOG_LEVEL|_SEGMENT_LOG_LEVEL|_PATH_LOG_LEVEL|_SIMULATION_LOG_LEVEL|_WARNING_LOG_LEVEL|_ERROR_LOG_LEVEL|_NO_ERROR_TERMINATE_LOG_LEVEL
#define _LOG_LEVELS_BEING_LOGGED (_ALL_LOG_LEVELS)

#include <stdio.h>

#define _LOG(logLevel, ...) \
  do { \
    if (logLevel & _LOG_LEVELS_BEING_LOGGED) { \
      if (logLevel & (_ERROR_LOG_LEVEL | _WARNING_LOG_LEVEL)) \
          printf("%s:%i: ", __FILE__, __LINE__); \
      printf(__VA_ARGS__); \
      fflush(stdout); \
      if (logLevel & (_ERROR_LOG_LEVEL | _NO_ERROR_TERMINATE_LOG_LEVEL)) \
        exit(logLevel == _ERROR_LOG_LEVEL); \
    } \
  } while (0)

#include "xpdeint_platform.h"
#include <cmath>
#include <string>
#include <cstring>
#include <cstdlib>
#include <list>
#include <vector>
#include <algorithm>
#include <utility>
#include <map>

#include "precision.h"
#include "opt_prec.h"


#include "xpdeint.h"

//#define FPTEST

#define TRAPTYPE 2

typedef MAX_PRECISION_T real_t;
using namespace std;

inline void *xmds_malloc(size_t size);

// ********************************************************
// DEFINES
// ********************************************************
const real_t _EPSILON = get_epsilon<real_t>();
#ifndef INFINITY
#define INFINITY HUGE_VAL
#endif

#ifndef MAX
#define MAX(a, b) \
  ({ typeof(a) _a = (a); \
     typeof(b) _b = (b); \
     _a > _b ? _a : _b; })
#endif

#ifndef MIN
#define MIN(a, b) \
   ({ typeof(a) _a = (a); \
      typeof(b) _b = (b); \
      _a < _b ? _a : _b; })
#endif

// ********************************************************
//   Auto-vectorisation defines
#define _MAKE_AUTOVEC_VARIABLE(x) real_t* const __restrict__ x ## _autovec = (real_t*) x
#define _AUTOVEC(x) (x ## _autovec)

// ********************************************************
// vector velocity defines
#define _dimensionless_velocity_ncomponents 4
// vector position defines
#define _dimensionless_position_ncomponents 4
// Vector phase defines
#define _phase_ncomponents 1

const long tot_dim = _dimensionless_velocity_ncomponents + _dimensionless_position_ncomponents + _phase_ncomponents;
const long vel_start = 0;
const long pos_start = _dimensionless_velocity_ncomponents;
const long phase_start = _dimensionless_velocity_ncomponents + _dimensionless_position_ncomponents;

// ********************************************************
// GLOBALS
// ********************************************************
//   'Globals' element globals
const real_t a=con_fun<real_t>("0");
const real_t q=con_fun<real_t>("0.1");


#if (TRAPTYPE == 1)
  const real_t trap=con_fun<real_t>("7864.76"); // (2 pi)^2/beta^2
#elif (TRAPTYPE == 2)
  const real_t trap=con_fun<real_t>("39.4784176043574344753379639995"); // (2 pi)^2
#else
  // Paul Trap
  const real_t trap=con_fun<real_t>("39.4784176043574344753379639995"); // (2 pi)^2
#endif

const real_t coulomb=con_fun<real_t>("8.64309169165991e8"); //e^2/4 pi eps0
const real_t delta=con_fun<real_t>("6241.146965412783");
const real_t wrf=con_fun<real_t>("177.367");
const real_t eta=con_fun<real_t>("0.16");
const real_t k=sqrt(con_fun<real_t>("200"))*eta;


const real_t initDisp=con_fun<real_t>("0.5618549231638847");

// Runge Kutta method constants {0.5, 1/6, 1/3}
const real_t rkConsts[3] = {con_fun<real_t>("0.5"),con_fun<real_t>("1.0")/con_fun<real_t>("6.0"),con_fun<real_t>("1.0")/con_fun<real_t>("3.0")};

inline int compare(const void *arr1, const void *arr2)
{
  return 2*(((real_t*)arr1)[0] > ((real_t*)arr2)[0])-1;
}

struct ode_workspace_t {
  /**
    * The workspace memory.
    */
  real_t t;

  real_t* vec = NULL;
  real_t* active_vec = NULL;

  // ********************************************************
  //   segment 2 (RK89 adaptive-step integrator) globals

  real_t* evolution_akfield_vec;
  real_t* evolution_aifield_vec;
  real_t* evolution_agfield_vec;

  real_t phi;
};

// ********************************************************
// FUNCTION PROTOTYPES
// ********************************************************
void* ode_init(int* workspace);
void ode_dest(void* workspace);


void _dimensionless_vec_initialise(ode_workspace_t* workspace);
int ode_run(const int* zVec, const real_t* tVec, real_t rep_time, real_t phi_in, int dim, ode_workspace_t* workspace);
void pi_pulse(bool neg, ode_workspace_t* workspace);
void evolution(real_t time_interval, ode_workspace_t* workspace);
inline void evolution_dimensionless_operators_evaluate_operator0(real_t _step, ode_workspace_t* workspace);


void* ode_init(int* ret)
{
  ode_workspace_t* workspace = (ode_workspace_t*)malloc(sizeof(ode_workspace_t));

  workspace->vec = (real_t*) xmds_malloc(sizeof(real_t) * tot_dim);
  workspace->active_vec = workspace->vec;

  workspace->evolution_akfield_vec = (real_t*) xmds_malloc(sizeof(real_t) * tot_dim);
  workspace->evolution_agfield_vec = (real_t*) xmds_malloc(sizeof(real_t) * tot_dim);
  workspace->evolution_aifield_vec = (real_t*) xmds_malloc(sizeof(real_t) * tot_dim);

  // TODO: Check mem allocation

  return (void*)(workspace);
}

void ode_dest(void* workspace)
{
  xmds_free(((ode_workspace_t*)workspace)->evolution_akfield_vec);
  xmds_free(((ode_workspace_t*)workspace)->evolution_agfield_vec);
  xmds_free(((ode_workspace_t*)workspace)->evolution_aifield_vec);
}

real_t ode_costFunc(const real_t* x, const real_t* x0, int dim, void* workspace)
{
  // TODO: move into workspace for speed.


  int* zVec = new int[dim];
  real_t* tVec = new real_t[dim];
  real_t phi = x[dim];
  real_t rep_time = 0.0001;

  for(int i = 0; i < dim; i++)
  {
    zVec[i] = to_int(x0[i]);
    tVec[i] = x[i];
  }

  ode_run(zVec,tVec,rep_time,phi,dim,(ode_workspace_t*)workspace);

  // TODO: Take res and determine cost function.
  MAX_PRECISION_T pi_2 = con_fun<MAX_PRECISION_T>("1.5707963267948966192313216916397514");
  return (__float128(1.0)/__float128(3.0))*pow(abs(((ode_workspace_t*)workspace)->vec[phase_start]) - pi_2,2) + __float128(0.2)*(((ode_workspace_t*)workspace)->vec[pos_start] + ((ode_workspace_t*)workspace)->vec[pos_start+1]) + __float128(0.2)*(((ode_workspace_t*)workspace)->vec[pos_start+2] + ((ode_workspace_t*)workspace)->vec[pos_start+3]);
}

// ********************************************************
// MAIN ROUTINE
// ********************************************************
int ode_run(const int* zVec, const real_t* tVec, real_t rep_time, real_t phi, int dim, ode_workspace_t* workspace)
{
  int p=0;
  int j=0;
  real_t* tau = new real_t[2*dim];
  real_t minimum = tVec[0];

  for(p = 0; p<dim; p++)
  {
    tau[2*p]=tVec[p];
    tau[2*p + 1]=zVec[p];

    minimum = min(tVec[p],minimum);
  }
  
  for(p=0;p<dim;p++)
  {
    tau[2*p]-= minimum;
  }

  for(p=0;p<dim;p++)
  {
    printf("tau[%d][0]=%lf\n",p,(double)(tau[2*p]));
  }
  
  qsort(tau,dim,sizeof(real_t)*2,compare);
  
  for(p=0;p<dim;p++)
  {
    printf("tau[%d][0]=%lf, tau[%d][1]=%lf\n",p,(double)(tau[2*p]),p,(double)(tau[2*p+1]));
  }
  // **********************************************
    
  
  // Run-time validation checks
  if (tau[2*1 + 0] <= 0.0)
    _LOG(_ERROR_LOG_LEVEL, "ERROR: The interval for segment 2 is not positive!\n"
                           "Interval = %e\n", (double)(tau[2*1+0]));
  
  /* Code that actually does stuff goes here */
  workspace->t = 0.0;
  
  workspace->active_vec = workspace->vec;
  _dimensionless_vec_initialise(workspace);

  workspace->phi = phi;

  #pragma ivdep
  for(p=0;p<dim;p++)
  {
    
    if(p>0)
    {
      cout << "Evolving" << endl;
      evolution((tVec[p]-(((real_t)abs(zVec[p]))/2)*rep_time) - (tVec[p-1]+((real_t)(abs(zVec[p-1]))/2)*rep_time), workspace);
    }
      
    #pragma ivdep
    for(j=0;j<abs(zVec[p]);j++)
    {
      cout << "Pulsing" << endl;
      pi_pulse(zVec[p] < 0, workspace);

      if(j < abs(zVec[p]) -1)
      {
        cout << "Evolving" << endl;
        evolution(rep_time, workspace);
      }
        
    }
  }
  
  // Bing!
  _LOG(_SIMULATION_LOG_LEVEL, "\a");
  
  delete[] tau;

  return 0;
}

// ********************************************************
// FUNCTION IMPLEMENTATIONS
// ********************************************************
inline void *xmds_malloc(size_t size)
{
  void *retPointer = _xmds_malloc(size);
  if ( !retPointer )
    _LOG(_ERROR_LOG_LEVEL, "ERROR: Couldn't allocate %zu bytes of memory!", size);
  return retPointer;
}

// ********************************************************
//   field dimensionless function implementations
// initialisation for vector velocity
void _dimensionless_vec_initialise(ode_workspace_t* workspace)
{
  workspace->vec[vel_start+0]=0.0;
  workspace->vec[vel_start+1]=0.0;
  workspace->vec[vel_start+2]=0.0;
  workspace->vec[vel_start+3]=0.0;

  workspace->vec[pos_start+0]=(-initDisp);
  workspace->vec[pos_start+1]=(initDisp);
  workspace->vec[pos_start+2]=(-initDisp);
  workspace->vec[pos_start+3]=(initDisp);

  workspace->vec[phase_start]=0.0;
}

// ********************************************************
//   segment 1 (Filter) function implementations
void pi_pulse(bool neg, ode_workspace_t* workspace)
{
  // Twice because there are two pi-pulses for each ions kick, i.e. counter-propagating
  if(neg)
  {
    workspace->vec[vel_start+0]-=2*k;
    workspace->vec[vel_start+1]-=2*k;
    workspace->vec[vel_start+2]-=2*k;
    workspace->vec[vel_start+3]+=2*k;
  }
  else
  {
    workspace->vec[vel_start+0]+=2*k;
    workspace->vec[vel_start+1]+=2*k;
    workspace->vec[vel_start+2]+=2*k;
    workspace->vec[vel_start+3]-=2*k;
  }
}


void evolution(real_t time_interval, ode_workspace_t* workspace)
{
  real_t _start_time = workspace->t;
  real_t _step = con_fun<real_t>("1e-6");

  long nSteps = floor(time_interval/_step);

  cout << "Number of steps needed: " << nSteps << endl;

  real_t* _akfield_vec = workspace->evolution_akfield_vec;
  real_t* _aifield_vec = workspace->evolution_aifield_vec;
  real_t* _agfield_vec = workspace->evolution_aifield_vec;
  real_t* _vec = workspace->vec;
  
  for (long _istep = 0; _istep < nSteps; _istep++) 
  {
    memcpy(_akfield_vec, _vec, sizeof(real_t) * tot_dim);
    memcpy(_aifield_vec, _vec, sizeof(real_t) * tot_dim);
    workspace->active_vec = _akfield_vec;

    // a_k = G[a_k, t]
    evolution_dimensionless_operators_evaluate_operator0(_step,workspace);
    
    #pragma ivdep
    for (long _i0 = 0; _i0 < tot_dim; _i0++) 
    {
      // a = a + a_k/6
      _vec[_i0] += rkConsts[1]*_akfield_vec[_i0];
      // a_k = a_i + a_k/2
      _agfield_vec[_i0] = _aifield_vec[_i0] + rkConsts[0]*_akfield_vec[_i0];
    }

    workspace->active_vec = _agfield_vec;
    
    workspace->t += rkConsts[0]*_step;
    
    // a_k = G[a_k, t + h/2]
    evolution_dimensionless_operators_evaluate_operator0(_step,workspace);

    #pragma ivdep
    for (long _i0 = 0; _i0 < tot_dim; _i0++) 
    {
      // a = a + a_k/3
      _vec[_i0] += rkConsts[2]*_agfield_vec[_i0];
      // a_k = a_i + a_k/2
      _akfield_vec[_i0] = _aifield_vec[_i0] + rkConsts[0]*_agfield_vec[_i0];
    }
    
    workspace->active_vec = _akfield_vec;
    
    // a_k = G[a_k, t + h/2]
    evolution_dimensionless_operators_evaluate_operator0(_step,workspace);

    #pragma ivdep
    for (long _i0 = 0; _i0 < tot_dim; _i0++) 
    {
      // a = a + a_k/3
      _vec[_i0] += rkConsts[2]*_akfield_vec[_i0];
      // a_k = a_i + a_k
      _agfield_vec[_i0] = _aifield_vec[_i0] + _akfield_vec[_i0];
    }

    workspace->active_vec = _agfield_vec;

    workspace->t += rkConsts[0]*_step;
    
    // a_k = G[a_k, t + h]
    evolution_dimensionless_operators_evaluate_operator0(_step,workspace);

    workspace->active_vec = _vec; 
    
    #pragma ivdep
    for (long _i0 = 0; _i0 < tot_dim; _i0++) 
    {
      // a = a + a_k/6
      _vec[_i0] += rkConsts[1]*_agfield_vec[_i0];
    }
  }

  // Clean Up the last step which may be a fraction
  _step = _start_time + time_interval - workspace->t;

  if(_step > _EPSILON)
  {
    memcpy(_akfield_vec, _vec, sizeof(real_t) * tot_dim);
    memcpy(_aifield_vec, _vec, sizeof(real_t) * tot_dim);
    workspace->active_vec = _akfield_vec;

    // a_k = G[a_k, t]
    evolution_dimensionless_operators_evaluate_operator0(_step,workspace);
    
    #pragma ivdep
    for (long _i0 = 0; _i0 < tot_dim; _i0++) 
    {
      // a = a + a_k/6
      _vec[_i0] += rkConsts[1]*_akfield_vec[_i0];
      // a_k = a_i + a_k/2
      _agfield_vec[_i0] = _aifield_vec[_i0] + rkConsts[0]*_akfield_vec[_i0];
    }

    workspace->active_vec = _agfield_vec;
    
    workspace->t += rkConsts[0]*_step;
    
    // a_k = G[a_k, t + h/2]
    evolution_dimensionless_operators_evaluate_operator0(_step,workspace);

    #pragma ivdep
    for (long _i0 = 0; _i0 < tot_dim; _i0++) 
    {
      // a = a + a_k/3
      _vec[_i0] += rkConsts[2]*_agfield_vec[_i0];
      // a_k = a_i + a_k/2
      _akfield_vec[_i0] = _aifield_vec[_i0] + rkConsts[0]*_agfield_vec[_i0];
    }
    
    workspace->active_vec = _akfield_vec;
    
    // a_k = G[a_k, t + h/2]
    evolution_dimensionless_operators_evaluate_operator0(_step,workspace);

    #pragma ivdep
    for (long _i0 = 0; _i0 < tot_dim; _i0++) 
    {
      // a = a + a_k/3
      _vec[_i0] += rkConsts[2]*_akfield_vec[_i0];
      // a_k = a_i + a_k
      _agfield_vec[_i0] = _aifield_vec[_i0] + _akfield_vec[_i0];
    }

    workspace->active_vec = _agfield_vec;

    workspace->t += rkConsts[0]*_step;
    
    // a_k = G[a_k, t + h]
    evolution_dimensionless_operators_evaluate_operator0(_step,workspace);

    workspace->active_vec = _vec; 
    
    #pragma ivdep
    for (long _i0 = 0; _i0 < tot_dim; _i0++) 
    {
      // a = a + a_k/6
      _vec[_i0] += rkConsts[1]*_agfield_vec[_i0];
    }
  }
}

// Delta A propagation operator for field dimensionless
inline void evolution_dimensionless_operators_evaluate_operator0(real_t _step, ode_workspace_t* workspace)
{
  #define v1_1 workspace->active_vec[vel_start+0]
  #define v2_1 workspace->active_vec[vel_start+1]
  #define x1_1 workspace->active_vec[pos_start+0]
  #define x2_1 workspace->active_vec[pos_start+1]
  #define v1_2 workspace->active_vec[vel_start+2]
  #define v2_2 workspace->active_vec[vel_start+3]
  #define x1_2 workspace->active_vec[pos_start+2]
  #define x2_2 workspace->active_vec[pos_start+3]
  #define phase workspace->active_vec[phase_start+0]
  #define t workspace->t
  #define phi workspace->phi
  real_t dx2_1_dt;
  real_t dv1_1_dt;
  real_t dv2_1_dt;
  real_t dx1_1_dt;
  real_t dx2_2_dt;
  real_t dv1_2_dt;
  real_t dv2_2_dt;
  real_t dx1_2_dt;
  real_t dx2_3_dt;
  real_t dv1_3_dt;
  real_t dv2_3_dt;
  real_t dx1_3_dt;
  real_t dphase_dt;

#if (TRAPTYPE == 1)
  real_t dyn_trap = trap*(a - 2*q*cos(wrf*(t)+phi));
#endif

  // ************* Propagation code ***************

  // Microtrap with micromotion
#if (TRAPTYPE == 1)
  dv1_1_dt = -coulomb/((delta+x2_1-x1_1)*(delta+x2_1-x1_1)) - dyn_trap*x1_1;
  dv2_1_dt = coulomb/((delta+x2_1-x1_1)*(delta+x2_1-x1_1)) - dyn_trap*x2_1;
  dv1_2_dt = -coulomb/((delta+x2_2-x1_2)*(delta+x2_2-x1_2)) - dyn_trap*x1_2;
  dv2_2_dt = coulomb/((delta+x2_2-x1_2)*(delta+x2_2-x1_2)) - dyn_trap*x2_2;
  dphase_dt = 0.5*(v1_1*v1_1 + v2_1*v2_1) - coulomb/((delta+x2_1-x1_1)) - 0.5*dyn_trap*(x1_1*x1_1+x2_1*x2_1) - 0.5*(v1_2*v1_2 + v2_2*v2_2) + coulomb/((delta+x2_2-x1_2)) + 0.5*dyn_trap*(x1_2*x1_2+x2_2*x2_2);
#elif (TRAPTYPE == 2)

  real_t tx1_1 = trap*x1_1;
  real_t tx2_1 = trap*x2_1;

  real_t tmp1 = (delta+x2_1-x1_1);
  real_t itd1 = coulomb/(tmp1*tmp1);
  real_t it1 = itd1 * tmp1;

  real_t tx1_2 = trap*x1_2;
  real_t tx2_2 = trap*x2_2;

  real_t tmp2 = (delta+x2_2-x1_2);
  real_t itd2 = coulomb/(tmp2*tmp2);
  real_t it2 = itd2 * tmp2;

  dv1_2_dt = -itd2 - tx1_2;
  dv2_2_dt = itd2 - tx2_2;
  dv1_1_dt = -itd1 - tx1_1;
  dv2_1_dt = itd1 - tx2_1;
  dphase_dt = rkConsts[0]*(v1_1*v1_1 + v2_1*v2_1) - it1 - rkConsts[0]*(x1_1*tx1_1+x2_1*tx2_1) - rkConsts[0]*(v1_2*v1_2 + v2_2*v2_2) + it2 + rkConsts[0]*(x1_2*tx1_2+x2_2*tx2_2);
#else
  // Paul Trap
  dv1_1_dt = -coulomb/((x2_1-x1_1)*(x2_1-x1_1)) - x1_1;
  dv2_1_dt = coulomb/((x2_1-x1_1)*(x2_1-x1_1)) - x2_1;
  dv1_2_dt = -coulomb/((x2_2-x1_2)*(x2_2-x1_2)) - trap*x1_2;
  dv2_2_dt = coulomb/((x2_2-x1_2)*(x2_2-x1_2)) - trap*x2_2;
  dphase_dt = 0.5*(v1_1*v1_1 + v2_1*v2_1) - coulomb/((x2_1-x1_1)) - 0.5*(x1_1*x1_1+x2_1*x2_1) - 0.5*(v1_2*v1_2 + v2_2*v2_2) + coulomb/((x2_2-x1_2)) + 0.5*(x1_2*x1_2+x2_2*x2_2);
#endif
  // COM mode.
  dx1_1_dt = v1_1;
  dx2_1_dt = v2_1;
  // Breathing mode.
  dx1_2_dt = v1_2;
  dx2_2_dt = v2_2;

  phase = dphase_dt * _step;
  x2_1 = dx2_1_dt * _step;
  v1_1 = dv1_1_dt * _step;
  v2_1 = dv2_1_dt * _step;
  x1_1 = dx1_1_dt * _step;
  x2_2 = dx2_2_dt * _step;
  v1_2 = dv1_2_dt * _step;
  v2_2 = dv2_2_dt * _step;
  x1_2 = dx1_2_dt * _step;

  // **********************************************

  #undef t
  #undef v1_1
  #undef v2_1
  #undef x1_1
  #undef x2_1
  #undef v1_2
  #undef v2_2
  #undef x1_2
  #undef x2_2
  #undef v1_3
  #undef v2_3
  #undef x1_3
  #undef x2_3
  #undef phi
  #undef phase
}
