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

#include "precision.h"
#include "opt_prec.h"


#include "xpdeint.h"

//#define FPTEST

#define TRAPTYPE 2

using namespace std;

// ********************************************************
// DEFINES
// ********************************************************
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
// vector velocity defines
#define _dimensionless_velocity_ncomponents 6
// vector position defines
#define _dimensionless_position_ncomponents 6
// Vector phase defines
#define _phase_ncomponents 2

// TODO: Template the constants

const long tot_dim = _dimensionless_velocity_ncomponents + _dimensionless_position_ncomponents + _phase_ncomponents;
const long vel_start = 0;
const long pos_start = _dimensionless_velocity_ncomponents;
const long phase_start = _dimensionless_velocity_ncomponents + _dimensionless_position_ncomponents;

// ********************************************************
// GLOBALS
// ********************************************************
//   'Globals' element globals
const MAX_PRECISION_T a=con_fun<MAX_PRECISION_T>("0");
const MAX_PRECISION_T q=con_fun<MAX_PRECISION_T>("0.1");


#if (TRAPTYPE == 1)
  const MAX_PRECISION_T trap=con_fun<MAX_PRECISION_T>("7864.76"); // (2 pi)^2/beta^2
#elif (TRAPTYPE == 2)
  const MAX_PRECISION_T trap=con_fun<MAX_PRECISION_T>("39.4784176043574344753379639995"); // (2 pi)^2
#else
  // Paul Trap
  const MAX_PRECISION_T trap=con_fun<MAX_PRECISION_T>("39.4784176043574344753379639995"); // (2 pi)^2
#endif

const MAX_PRECISION_T pi2sqr=con_fun<MAX_PRECISION_T>("39.47841760435743447533796399950460454125"); // (2 \pi)^2
const MAX_PRECISION_T lambda=con_fun<MAX_PRECISION_T>("2.18932070132059425018071560641491163354e7"); // (e^2 Sqrt[M \[Omega] ])/(4 \pi \[Epsilon]0 \[HBar] Sqrt[\[HBar]]\[Omega])
const MAX_PRECISION_T pi2sqrlambda = pi2sqr*lambda;

const MAX_PRECISION_T coulomb=pi2sqr*lambda;
const MAX_PRECISION_T lambda2=2.0*lambda;
const MAX_PRECISION_T pi2sqrinv=1.0/pi2sqr;

const MAX_PRECISION_T delta=con_fun<MAX_PRECISION_T>("6241.14696541278273431081150408784038292");
const MAX_PRECISION_T wrf=con_fun<MAX_PRECISION_T>("177.367");
const MAX_PRECISION_T eta=con_fun<MAX_PRECISION_T>("0.16");
const MAX_PRECISION_T k=sqrt(con_fun<MAX_PRECISION_T>("2"))*eta;


const MAX_PRECISION_T initDisp=con_fun<MAX_PRECISION_T>("0.56185492316390790205106415377285991690");

// Runge Kutta method constants {0.5, 1/6, 1/3}
const MAX_PRECISION_T rkConsts[3] = {con_fun<MAX_PRECISION_T>("0.5"),con_fun<MAX_PRECISION_T>("1.0")/con_fun<MAX_PRECISION_T>("6.0"),con_fun<MAX_PRECISION_T>("1.0")/con_fun<MAX_PRECISION_T>("3.0")};

template<typename floatval_t>
inline int compare(const void *arr1, const void *arr2)
{
  return 2*(((floatval_t*)arr1)[0] > ((floatval_t*)arr2)[0])-1;
}

template<typename floatval_t>
struct ode_workspace_t {
  /**
    * The workspace memory.
    */
  floatval_t t;

  floatval_t* vec = NULL;
  floatval_t* active_vec = NULL;

  // ********************************************************
  //   segment 2 (RK89 adaptive-step integrator) globals

  floatval_t* evolution_akfield_vec;
  floatval_t* evolution_aifield_vec;
  floatval_t* evolution_agfield_vec;

  floatval_t phi;
};

// ********************************************************
// FUNCTION PROTOTYPES
// ********************************************************
template<typename floatval_t>
void* ode_init(int* workspace);
template<typename floatval_t>
void ode_dest(void* workspace);

template<typename floatval_t>
void _dimensionless_vec_initialise(ode_workspace_t<floatval_t>* workspace);
template<typename floatval_t>
int ode_run(const int* zVec, const floatval_t* tVec, floatval_t rep_time, floatval_t phi_in, int dim, ode_workspace_t<floatval_t>* workspace);
template<typename floatval_t>
void pi_pulse(bool neg, ode_workspace_t<floatval_t>* workspace);
template<typename floatval_t>
void evolution(floatval_t time_interval, ode_workspace_t<floatval_t>* workspace);
template<typename floatval_t>
inline void evolution_dimensionless_operators_evaluate_operator0(floatval_t _step, ode_workspace_t<floatval_t>* workspace);

template<typename floatval_t>
void* ode_init(int* ret)
{
  /* 
  ode_workspace_t<floatval_t>* workspace = (ode_workspace_t<floatval_t>*)malloc(sizeof(ode_workspace_t<floatval_t>));

  workspace->vec = (floatval_t*) malloc(sizeof(floatval_t) * tot_dim);
  workspace->active_vec = workspace->vec;

  workspace->evolution_akfield_vec = (floatval_t*) malloc(sizeof(floatval_t) * tot_dim);
  workspace->evolution_agfield_vec = (floatval_t*) malloc(sizeof(floatval_t) * tot_dim);
  workspace->evolution_aifield_vec = (floatval_t*) malloc(sizeof(floatval_t) * tot_dim);
  */

  ode_workspace_t<floatval_t>* workspace = new ode_workspace_t<floatval_t>[1];

  workspace->vec = new floatval_t[tot_dim];
  workspace->active_vec = workspace->vec;

  workspace->evolution_akfield_vec = new floatval_t[tot_dim];
  workspace->evolution_agfield_vec = new floatval_t[tot_dim];
  workspace->evolution_aifield_vec = new floatval_t[tot_dim];
  
  return (void*)(workspace);

  // TODO: Check mem allocation
}

template<typename floatval_t>
void ode_dest(void* workspace)
{
  /* 
  free(((ode_workspace_t<floatval_t>*)workspace)->vec);
  free(((ode_workspace_t<floatval_t>*)workspace)->evolution_akfield_vec);
  free(((ode_workspace_t<floatval_t>*)workspace)->evolution_agfield_vec);
  free(((ode_workspace_t<floatval_t>*)workspace)->evolution_aifield_vec);

  free(workspace);
  */

  delete[] ((ode_workspace_t<floatval_t>*)workspace)->vec;
  delete[] ((ode_workspace_t<floatval_t>*)workspace)->evolution_akfield_vec;
  delete[] ((ode_workspace_t<floatval_t>*)workspace)->evolution_agfield_vec;
  delete[] ((ode_workspace_t<floatval_t>*)workspace)->evolution_aifield_vec;
  delete[] ((ode_workspace_t<floatval_t>*)workspace);
}

template<typename floatval_t>
floatval_t ode_costFunc(const floatval_t* x, const floatval_t* x0, int dim, void* workspace)
{
  // TODO: move into workspace for speed.



  //int* zVec = new int[dim];
  int zVec[8] = {37, 55, -11, 71, 80, 65, -43, 98};
  floatval_t tInit[8] = {0.0, 0.15625, 0.3125, 0.46875, 0.625, 0.78125, 0.9375, 1.09375};

  //floatval_t tInit[8] = {0.0, 0.0015625, 0.003125, 0.0046875, 0.00625, 0.0078125, 0.009375, 0.0109375};

  floatval_t* tVec = new floatval_t[8];
  tVec[0] = tInit[0];
   
  //floatval_t phi = x[dim];
  floatval_t phi = 0.0;


  floatval_t rep_time = 0.0;

  for(int i = 0; i < dim; i++)
  {
    tVec[i+1] = tInit[i+1] + x[i];
  }

  ode_run<floatval_t>(&zVec[0],tVec,rep_time,phi,dim+1,(ode_workspace_t<floatval_t>*)workspace);

  floatval_t phaseDiff1 = 2.0*abs(((ode_workspace_t<floatval_t>*)workspace)->vec[phase_start+0]) - 1.0;
  floatval_t phaseDiff2 = 2.0*abs(((ode_workspace_t<floatval_t>*)workspace)->vec[phase_start+1]) - 1.0;

  floatval_t posRestCOM1 = ((ode_workspace_t<floatval_t>*)workspace)->vec[pos_start+0] + initDisp;
  floatval_t posRestCOM2 = ((ode_workspace_t<floatval_t>*)workspace)->vec[pos_start+1] - initDisp;
  floatval_t velRestCOM1 = ((ode_workspace_t<floatval_t>*)workspace)->vec[vel_start+0];
  floatval_t velRestCOM2 = ((ode_workspace_t<floatval_t>*)workspace)->vec[vel_start+1];

  floatval_t posRest1BR1 = ((ode_workspace_t<floatval_t>*)workspace)->vec[pos_start+2] + initDisp;
  floatval_t posRest1BR2 = ((ode_workspace_t<floatval_t>*)workspace)->vec[pos_start+3] - initDisp;
  floatval_t velRest1BR1 = ((ode_workspace_t<floatval_t>*)workspace)->vec[vel_start+2];
  floatval_t velRest1BR2 = ((ode_workspace_t<floatval_t>*)workspace)->vec[vel_start+3];

  floatval_t posRest2BR1 = ((ode_workspace_t<floatval_t>*)workspace)->vec[pos_start+4] + initDisp;
  floatval_t posRest2BR2 = ((ode_workspace_t<floatval_t>*)workspace)->vec[pos_start+5] - initDisp;
  floatval_t velRest2BR1 = ((ode_workspace_t<floatval_t>*)workspace)->vec[vel_start+4];
  floatval_t velRest2BR2 = ((ode_workspace_t<floatval_t>*)workspace)->vec[vel_start+5];

  floatval_t fidel1 = (2.0/3.0)*pow((3.14/2.0),2)*pow(phaseDiff1,2) + 0.2*pow(posRestCOM1,2) + 0.2*pow(posRestCOM2,2) + 0.2*pow(posRest1BR1,2) + 0.2*pow(posRest1BR2,2) + pow((1.0/(2*3.14)),2)*(0.2*pow(velRestCOM1,2) + 0.2*pow(velRestCOM2,2) + 0.2*pow(velRest1BR1,2) + 0.2*pow(velRest1BR2,2));
  floatval_t fidel2 = (2.0/3.0)*pow((3.14/2.0),2)*pow(phaseDiff2,2) + 0.2*pow(posRestCOM1,2) + 0.2*pow(posRestCOM2,2) + 0.2*pow(posRest2BR1,2) + 0.2*pow(posRest2BR2,2) + pow((1.0/(2*3.14)),2)*(0.2*pow(velRestCOM1,2) + 0.2*pow(velRestCOM2,2) + 0.2*pow(velRest2BR1,2) + 0.2*pow(velRest2BR2,2));

  floatval_t maxinf = max(fidel1,fidel2);

  delete[] tVec;
  return maxinf;
}

// ********************************************************
// MAIN ROUTINE
// ********************************************************
template<typename floatval_t>
int ode_run(const int* zVec, const floatval_t* tVec, floatval_t rep_time, floatval_t phi, int dim, ode_workspace_t<floatval_t>* workspace)
{
  int p=0;
  int j=0;
  floatval_t* tau = new floatval_t[2*dim];
  floatval_t minimum = tVec[0];

  for(p = 0; p<dim; p++)
  {
    tau[2*p]=tVec[p];
    tau[2*p + 1]=zVec[p];

    //minimum = min(tVec[p],minimum);
  }
  
  for(p=0;p<dim;p++)
  {
    tau[2*p]-=minimum;
  }

/* 
  for(p=0;p<dim;p++)
  {
    printf("tau[%d][0]=%lf\n",p,(double)(tau[2*p]));
  }
*/
  //qsort(tau,dim,sizeof(floatval_t)*2,compare<floatval_t>);
  
/* 
  for(p=0;p<dim;p++)
  {
    printf("tau[%d][0]=%lf, tau[%d][1]=%lf\n",p,(double)(tau[2*p]),p,(double)(tau[2*p+1]));
  }
*/
  // **********************************************
    
  
  /* Code that actually does stuff goes here */
  workspace->t = 0.0;
  
  workspace->active_vec = workspace->vec;
  _dimensionless_vec_initialise(workspace);

  workspace->phi = phi;

  for(p=0;p<dim;p++)
  {
    
    if(p>0)
    {
      //cout << "Evolving" << endl;
      evolution<floatval_t>((tVec[p]-(((floatval_t)abs(zVec[p]))/2)*rep_time) - (tVec[p-1]+((floatval_t)(abs(zVec[p-1]))/2)*rep_time), workspace);
    }

    for(j=0;j<abs(zVec[p]);j++)
    {
      //cout << "Pulsing" << endl;
      pi_pulse(zVec[p] < 0, workspace);

      if(j < abs(zVec[p]) -1)
      {
        //cout << "Evolving" << endl;
        if(rep_time > DBL_EPSILON)
        {
          evolution(rep_time, workspace);
        }
        
      }
        
    }
  }
  
  delete[] tau;

  return 0;
}

// ********************************************************
// FUNCTION IMPLEMENTATIONS
// ********************************************************

// ********************************************************
//   field dimensionless function implementations
// initialisation for vector velocity
template<typename floatval_t>
void _dimensionless_vec_initialise(ode_workspace_t<floatval_t>* workspace)
{
  workspace->vec[vel_start+0]=0.0;
  workspace->vec[vel_start+1]=0.0;
  workspace->vec[vel_start+2]=0.0;
  workspace->vec[vel_start+3]=0.0;
  workspace->vec[vel_start+4]=0.0;
  workspace->vec[vel_start+5]=0.0;

  workspace->vec[pos_start+0]=(-initDisp);
  workspace->vec[pos_start+1]=(initDisp);
  workspace->vec[pos_start+2]=(-initDisp);
  workspace->vec[pos_start+3]=(initDisp);
  workspace->vec[pos_start+4]=(-initDisp);
  workspace->vec[pos_start+5]=(initDisp);

  workspace->vec[phase_start+0]=0.0;
  workspace->vec[phase_start+1]=0.0;
}

// ********************************************************
//   segment 1 (Filter) function implementations
template<typename floatval_t>
void pi_pulse(bool neg, ode_workspace_t<floatval_t>* workspace)
{
  // Twice because there are two pi-pulses for each ions kick, i.e. counter-propagating
  if(neg)
  {
    workspace->vec[vel_start+0]-=2*k;
    workspace->vec[vel_start+1]-=2*k;
    workspace->vec[vel_start+2]-=2*k;
    workspace->vec[vel_start+3]+=2*k;
    workspace->vec[vel_start+4]+=2*k;
    workspace->vec[vel_start+5]-=2*k;
  }
  else
  {
    workspace->vec[vel_start+0]+=2*k;
    workspace->vec[vel_start+1]+=2*k;
    workspace->vec[vel_start+2]+=2*k;
    workspace->vec[vel_start+3]-=2*k;
    workspace->vec[vel_start+4]-=2*k;
    workspace->vec[vel_start+5]+=2*k;
  }
}



template<typename floatval_t>
void evolution(floatval_t time_interval, ode_workspace_t<floatval_t>* workspace)
{
  floatval_t _start_time = workspace->t;
  floatval_t _step = con_fun<floatval_t>("1e-4");
  floatval_t _step_2 = 0.5*_step;

  long nSteps = floor(time_interval/_step);

  //cout << "Number of steps needed: " << nSteps << endl;

  floatval_t* _akfield_vec = workspace->evolution_akfield_vec;
  floatval_t* _aifield_vec = workspace->evolution_aifield_vec;
  floatval_t* _agfield_vec = workspace->evolution_agfield_vec;
  floatval_t* _vec = workspace->vec;

#ifdef NEVER
  ofstream outfile;
  outfile.open("ode.csv", ios::app );
#endif

  for (long _istep = 0; _istep < nSteps; _istep++) 
  {
    memcpy(_akfield_vec, _vec, sizeof(floatval_t) * tot_dim);
    memcpy(_aifield_vec, _vec, sizeof(floatval_t) * tot_dim);
    workspace->active_vec = _akfield_vec;

#ifdef NEVER
    if(_istep % 100 == 0)
    {
      outfile << to_out_string<floatval_t>(workspace->t,15) << "," << to_out_string<floatval_t>(_vec[phase_start],15) << "," << to_out_string<floatval_t>(_vec[pos_start],15) << "," << to_out_string<floatval_t>(_vec[vel_start],15) << endl;
    }
#endif
    

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
    
    workspace->t += _step_2;
    
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

    workspace->t += _step_2;
    
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
  _step_2 = 0.5*_step;

  if(_step > get_epsilon<floatval_t>())
  {
    memcpy(_akfield_vec, _vec, sizeof(floatval_t) * tot_dim);
    memcpy(_aifield_vec, _vec, sizeof(floatval_t) * tot_dim);
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
    
    workspace->t += _step_2;
    
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

    workspace->t += _step_2;
    
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

#ifdef NEVER
  outfile << to_out_string<floatval_t>(workspace->t,15) << "," << to_out_string<floatval_t>(_vec[phase_start],15) << endl;
  outfile.close();
#endif
}

// Delta A propagation operator for field dimensionless
// TODO: Combine steps into constants to gain about another 20-30% speed
template<typename floatval_t>
inline void evolution_dimensionless_operators_evaluate_operator0(floatval_t _step, ode_workspace_t<floatval_t>* workspace)
{
  #define v1_1 workspace->active_vec[vel_start+0]
  #define v2_1 workspace->active_vec[vel_start+1]
  #define x1_1 workspace->active_vec[pos_start+0]
  #define x2_1 workspace->active_vec[pos_start+1]
  #define v1_2 workspace->active_vec[vel_start+2]
  #define v2_2 workspace->active_vec[vel_start+3]
  #define x1_2 workspace->active_vec[pos_start+2]
  #define x2_2 workspace->active_vec[pos_start+3]
  #define v1_3 workspace->active_vec[vel_start+4]
  #define v2_3 workspace->active_vec[vel_start+5]
  #define x1_3 workspace->active_vec[pos_start+4]
  #define x2_3 workspace->active_vec[pos_start+5]
  #define phase1 workspace->active_vec[phase_start+0]
  #define phase2 workspace->active_vec[phase_start+1]
  #define t workspace->t
  #define phi workspace->phi
  floatval_t dx2_1_dt;
  floatval_t dv1_1_dt;
  floatval_t dv2_1_dt;
  floatval_t dx1_1_dt;
  floatval_t dx2_2_dt;
  floatval_t dv1_2_dt;
  floatval_t dv2_2_dt;
  floatval_t dx1_2_dt;
  floatval_t dx2_3_dt;
  floatval_t dv1_3_dt;
  floatval_t dv2_3_dt;
  floatval_t dx1_3_dt;
  floatval_t dphase1_dt;
  floatval_t dphase2_dt;

#if (TRAPTYPE == 1)
  floatval_t dyn_trap = trap*(a - 2*q*cos(wrf*(t)+phi));
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

  
  floatval_t tx1_1 = pi2sqr*x1_1;
  floatval_t tx2_1 = pi2sqr*x2_1;

  floatval_t tmp1 = (delta+x2_1-x1_1);
  floatval_t itd1 = (pi2sqrlambda)/((tmp1)*(tmp1));

  floatval_t tx1_2 = pi2sqr*x1_2;
  floatval_t tx2_2 = pi2sqr*x2_2;

  floatval_t tmp2 = (delta+x2_2-x1_2);
  floatval_t itd2 = (pi2sqrlambda)/((tmp2)*(tmp2));

  floatval_t tx1_3 = pi2sqr*x1_3;
  floatval_t tx2_3 = pi2sqr*x2_3;

  floatval_t tmp3 = (delta+x2_3-x1_3);
  floatval_t itd3 = (pi2sqrlambda)/((tmp3)*(tmp3));

  floatval_t it1 = 2.0*(itd2*tmp2 - itd1*tmp1);
  floatval_t it2 = 2.0*(itd3*tmp3 - itd1*tmp1);


  dv1_1_dt = -itd1 - tx1_1;
  dv2_1_dt = itd1 - tx2_1;
  dv1_2_dt = -itd2 - tx1_2;
  dv2_2_dt = itd2 - tx2_2;
  dv1_3_dt = -itd3 - tx1_3;
  dv2_3_dt = itd3 - tx2_3;

  /*
  dv1_1_dt = -(pi2sqr*lambda)/((delta + x2_1 - x1_1)*(delta + x2_1 - x1_1)) - pi2sqr*x1_1;
  dv2_1_dt = (pi2sqr*lambda)/((delta + x2_1 - x1_1)*(delta + x2_1 - x1_1)) - pi2sqr*x2_1;
  dv1_2_dt = -(pi2sqr*lambda)/((delta + x2_2 - x1_2)*(delta + x2_2 - x1_2)) - pi2sqr*x1_2;
  dv2_2_dt = (pi2sqr*lambda)/((delta + x2_2 - x1_2)*(delta + x2_2 - x1_2)) - pi2sqr*x2_2;
  */

  dphase1_dt = (v1_1+v1_2)*(v1_1-v1_2) + (v2_1+v2_2)*(v2_1-v2_2) + (tx1_2+tx1_1)*(x1_2-x1_1) + (tx2_2+tx2_1)*(x2_2-x2_1) + it1;
  dphase2_dt = (v1_1+v1_3)*(v1_1-v1_3) + (v2_1+v2_3)*(v2_1-v2_3) + (tx1_3+tx1_1)*(x1_3-x1_1) + (tx2_3+tx2_1)*(x2_3-x2_1) + it2;
  //dphase_dt = v1_1*v1_1 + v2_1*v2_1 - v1_2*v1_2 - v2_2*v2_2 + pi2sqr*(x1_2*x1_2+x2_2*x2_2 + lambda2 / (delta + x2_2 - x1_2) - x1_1*x1_1-x2_1*x2_1 - lambda2 / (delta + x2_1 - x1_1));
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

  dx1_3_dt = v1_3;
  dx2_3_dt = v2_3;

  phase1 = dphase1_dt * _step;
  phase2 = dphase2_dt * _step;
  x2_1 = dx2_1_dt * _step;
  v1_1 = dv1_1_dt * _step;
  v2_1 = dv2_1_dt * _step;
  x1_1 = dx1_1_dt * _step;
  x2_2 = dx2_2_dt * _step;
  v1_2 = dv1_2_dt * _step;
  v2_2 = dv2_2_dt * _step;
  x1_2 = dx1_2_dt * _step;
  x2_3 = dx2_3_dt * _step;
  v1_3 = dv1_3_dt * _step;
  v2_3 = dv2_3_dt * _step;
  x1_3 = dx1_3_dt * _step;

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
  #undef phase1
  #undef phase2
}
