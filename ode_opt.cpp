// ********************************************************
// simulation logging
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

// ********************************************************
// simulation includes
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
#include "function.h"

typedef long integer;
typedef MAX_PRECISION_T real;

#include "xpdeint.h"

#define complex XMDSComplexType

const complex i(0.0, 1.0);

using namespace std;

inline void *xmds_malloc(size_t size);

// ********************************************************
// DEFINES
// ********************************************************

// ********************************************************
//   Simulation defines
const MAX_PRECISION_T _EPSILON = get_epsilon<MAX_PRECISION_T>();
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
#define _MAKE_AUTOVEC_VARIABLE(x) real* const __restrict__ x ## _autovec = (real*) x
#define _AUTOVEC(x) (x ## _autovec)

// ********************************************************
// vector velocity defines
#define _dimensionless_velocity_ncomponents 2
// vector position defines
#define _dimensionless_position_ncomponents 2

// ********************************************************
// GLOBALS
// ********************************************************
//   Simulation globals
real t;

// ********************************************************
//   'Globals' element globals
const MAX_PRECISION_T a=MAX_PRECISION_T("0");
const MAX_PRECISION_T q=MAX_PRECISION_T("0.8");
const MAX_PRECISION_T trap=MAX_PRECISION_T("83.2666554779159"); // (2 pi)^2/beta^2
const MAX_PRECISION_T coulomb=MAX_PRECISION_T("8.64309169165991e8"); //e^2/4 pi eps0
const MAX_PRECISION_T delta=MAX_PRECISION_T("6241.146965412783");
const MAX_PRECISION_T wrf=MAX_PRECISION_T("18.25011292873728");
const MAX_PRECISION_T eta=MAX_PRECISION_T("0.16");
const MAX_PRECISION_T k=sqrt(MAX_PRECISION_T(2))*eta;
const MAX_PRECISION_T initDisp=MAX_PRECISION_T("0.5618549231638847");

real phi = 0.0;

int done=0;

int compare(const void *arr1, const void *arr2)
{
  return 2*(((real*)arr1)[0] > ((real*)arr2)[0])-1;
}

// ********************************************************
//   Command line argument processing globals
int sz1 = -1; 
int sz2 = -1; 

// ********************************************************
//   field dimensionless globals
// vector velocity globals
size_t _dimensionless_velocity_alloc_size = 0;
real* _dimensionless_velocity = NULL;
real* _active_dimensionless_velocity = NULL;

// vector position globals
size_t _dimensionless_position_alloc_size = 0;
real* _dimensionless_position = NULL;
real* _active_dimensionless_position = NULL;

// ********************************************************
//   segment 2 (RK89 adaptive-step integrator) globals
real* evolution_akafield_dimensionless_velocity;
real* evolution_akbfield_dimensionless_velocity;
real* evolution_akcfield_dimensionless_velocity;
real* evolution_akdfield_dimensionless_velocity;
real* evolution_akefield_dimensionless_velocity;
real* evolution_akffield_dimensionless_velocity;
real* evolution_akgfield_dimensionless_velocity;
real* evolution_akhfield_dimensionless_velocity;
real* evolution_akifield_dimensionless_velocity;
real* evolution_akjfield_dimensionless_velocity;
real* evolution_initial_dimensionless_velocity;
real* evolution_akafield_dimensionless_position;
real* evolution_akbfield_dimensionless_position;
real* evolution_akcfield_dimensionless_position;
real* evolution_akdfield_dimensionless_position;
real* evolution_akefield_dimensionless_position;
real* evolution_akffield_dimensionless_position;
real* evolution_akgfield_dimensionless_position;
real* evolution_akhfield_dimensionless_position;
real* evolution_akifield_dimensionless_position;
real* evolution_akjfield_dimensionless_position;
real* evolution_initial_dimensionless_position;

// ********************************************************
// FUNCTION PROTOTYPES
// ********************************************************
//   field dimensionless function prototypes
void _dimensionless_velocity_initialise();
void _dimensionless_position_initialise();

// ********************************************************
//   segment 1 (Filter) function prototypes
void pi_pulse();

// ********************************************************
//   segment 2 (RK89 adaptive-step integrator) function prototypes
inline void evolution_calculate_delta_a(real _step);
void evolution(real time_interval);
real evolution_setup_sampling(bool* _next_sample_flag, long* _next_sample_counter);
real evolution_dimensionless_velocity_timestep_error(real* _checkfield);
bool evolution_dimensionless_velocity_reset(real* _reset_to);
real evolution_dimensionless_position_timestep_error(real* _checkfield);
bool evolution_dimensionless_position_reset(real* _reset_to);
void evolution_dimensionless_operators_evaluate_operator0(real _step);

// ********************************************************
// MAIN ROUTINE
// ********************************************************
int run_ode(int* zVec, real* tVec, real rep_time, real phi_in, int dim)
{
  int p=0;
  int j=0;
  real* tau = new real[2*dim];
  real minimum = tVec[0];

  phi = phi_in;

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
    printf("tau[%d][0]=%lf\n",p,tau[2*p]);
  }
  
  qsort(tau,numkicks,sizeof(tau)/2,compare);
  
  for(p=0;p<numkicks;p++)
  {
    printf("tau[%d][0]=%lf, tau[%d][1]=%lf\n",p,tau[p][0],p,tau[p][1]);
  }
  // **********************************************
    
  _dimensionless_position_alloc_size = MAX(_dimensionless_position_alloc_size, (1) * _dimensionless_position_ncomponents);
  _dimensionless_velocity_alloc_size = MAX(_dimensionless_velocity_alloc_size, (1) * _dimensionless_velocity_ncomponents);
  
  _dimensionless_velocity = (real*) xmds_malloc(sizeof(real) * MAX(_dimensionless_velocity_alloc_size,1));
  _active_dimensionless_velocity = _dimensionless_velocity;
  
  _dimensionless_position = (real*) xmds_malloc(sizeof(real) * MAX(_dimensionless_position_alloc_size,1));
  _active_dimensionless_position = _dimensionless_position;
  
  // Run-time validation checks
  if (tau[1][0] <= 0.0)
    _LOG(_ERROR_LOG_LEVEL, "ERROR: The interval for segment 2 is not positive!\n"
                           "Interval = %e\n", tau[1][0]);
  
  ptrdiff_t _max_vector_size = 0;
  real* _max_vector_array = NULL;
  
  bool _allocated_temporary_array = false;
  if (!_max_vector_array && _max_vector_size > 0) {
    _max_vector_array = (real*) xmds_malloc(sizeof(real) * _max_vector_size);
    _allocated_temporary_array = true;
  }
  
  // Make all geometry-dependent transformations prepare plans, etc.
  if (_allocated_temporary_array) {
    xmds_free(_max_vector_array);
  }
  
  /* Code that actually does stuff goes here */
  t = 0.0;
  
  _active_dimensionless_velocity = _dimensionless_velocity;
  _dimensionless_velocity_initialise();
  _active_dimensionless_position = _dimensionless_position;
  _dimensionless_position_initialise();

  for(p=0;p<numkicks;p++)
  {
    if(p>0)
      evolution((tVec[p]-(zVec[p]/2)*re_time) - (tVec[p-1]+(zVec[p-1]/2)*re_time));

    for(j=0;j<zVec[p];j++)
    {
      pi_pulse();
      evolution(rep_time);
    }
  }
  
  
  // Bing!
  _LOG(_SIMULATION_LOG_LEVEL, "\a");
  
  xmds_free(_dimensionless_velocity);
  _active_dimensionless_velocity = _dimensionless_velocity = NULL;
  
  
  xmds_free(_dimensionless_position);
  _active_dimensionless_position = _dimensionless_position = NULL;
  
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
void _dimensionless_velocity_initialise()
{
  long _dimensionless_velocity_index_pointer = 0;
  #define v1 _active_dimensionless_velocity[_dimensionless_velocity_index_pointer + 0]
  #define v2 _active_dimensionless_velocity[_dimensionless_velocity_index_pointer + 1]
  // The purpose of the following define is to give a (somewhat helpful) compile-time error
  // if the user has attempted to use the propagation dimension variable in the initialisation
  // block of a <vector> element. If they're trying to do this, what they really want is a 
  // <computed_vector> instead.
  #define t Dont_use_propagation_dimension_t_in_vector_element_CDATA_block___Use_a_computed_vector_instead
  
  // ********** Initialisation code ***************
  v1=0.0;
  v2=0.0;
  // **********************************************
  #undef t
  #undef v1
  #undef v2
}

// initialisation for vector position
void _dimensionless_position_initialise()
{
  long _dimensionless_position_index_pointer = 0;
  #define x1 _active_dimensionless_position[_dimensionless_position_index_pointer + 0]
  #define x2 _active_dimensionless_position[_dimensionless_position_index_pointer + 1]
  // The purpose of the following define is to give a (somewhat helpful) compile-time error
  // if the user has attempted to use the propagation dimension variable in the initialisation
  // block of a <vector> element. If they're trying to do this, what they really want is a 
  // <computed_vector> instead.
  #define t Dont_use_propagation_dimension_t_in_vector_element_CDATA_block___Use_a_computed_vector_instead
  
  // ********** Initialisation code ***************
  x1=(-initDisp);
  x2=(initDisp);
  // **********************************************
  #undef t
  #undef x1
  #undef x2
}

// ********************************************************
//   segment 1 (Filter) function implementations
void pi_pulse()
{
  long _dimensionless_velocity_index_pointer = 0;
  #define v1 _active_dimensionless_velocity[_dimensionless_velocity_index_pointer + 0]
  #define v2 _active_dimensionless_velocity[_dimensionless_velocity_index_pointer + 1]
  
  // ************** Filter code *****************
  // Single Pi-pulse kick
  v1+=k*sz1;
  v2+=k*sz2;
  // **********************************************
  #undef v1
  #undef v2
}

// ********************************************************
//   segment 2 (RK89 adaptive-step integrator) function implementations
inline void evolution_calculate_delta_a(real _step)
{
  // Delta A propagation operator for field dimensionless
  evolution_dimensionless_operators_evaluate_operator0(_step);
}

void evolution(real time_interval, real phi)
{
  real _step = (time_interval)/(real)1000000;
  real _old_step = _step;
  real _min_step = _step;
  real _max_step = _step;
  long _attempted_steps = 0;
  long _unsuccessful_steps = 0;
  
  real _tolerance = real("1e-14");
  
  real _error, _last_norm_error = 1.0;
  real evolution_dimensionless_velocity_error;
  real evolution_dimensionless_position_error;
  
  bool _discard = false;
  bool _break_next = false;
  bool _break = false;
  
  real _t_local = 0.0;
  real _t_break_next = t+time_interval;
  
  if ( (_t_local + _step)*(1.0 + _EPSILON) >= _t_break_next) {
    _break_next = true;
    _step = _t_break_next - _t_local;
  }
  
  evolution_akafield_dimensionless_velocity = (real*) xmds_malloc(sizeof(real) * _dimensionless_velocity_alloc_size);
  evolution_akbfield_dimensionless_velocity = (real*) xmds_malloc(sizeof(real) * _dimensionless_velocity_alloc_size);
  evolution_akcfield_dimensionless_velocity = (real*) xmds_malloc(sizeof(real) * _dimensionless_velocity_alloc_size);
  evolution_akdfield_dimensionless_velocity = (real*) xmds_malloc(sizeof(real) * _dimensionless_velocity_alloc_size);
  evolution_akefield_dimensionless_velocity = (real*) xmds_malloc(sizeof(real) * _dimensionless_velocity_alloc_size);
  evolution_akffield_dimensionless_velocity = (real*) xmds_malloc(sizeof(real) * _dimensionless_velocity_alloc_size);
  evolution_akgfield_dimensionless_velocity = (real*) xmds_malloc(sizeof(real) * _dimensionless_velocity_alloc_size);
  evolution_akhfield_dimensionless_velocity = (real*) xmds_malloc(sizeof(real) * _dimensionless_velocity_alloc_size);
  evolution_akifield_dimensionless_velocity = (real*) xmds_malloc(sizeof(real) * _dimensionless_velocity_alloc_size);
  evolution_akjfield_dimensionless_velocity = (real*) xmds_malloc(sizeof(real) * _dimensionless_velocity_alloc_size);
  evolution_initial_dimensionless_velocity = (real*) xmds_malloc(sizeof(real) * _dimensionless_velocity_alloc_size);
  evolution_akafield_dimensionless_position = (real*) xmds_malloc(sizeof(real) * _dimensionless_position_alloc_size);
  evolution_akbfield_dimensionless_position = (real*) xmds_malloc(sizeof(real) * _dimensionless_position_alloc_size);
  evolution_akcfield_dimensionless_position = (real*) xmds_malloc(sizeof(real) * _dimensionless_position_alloc_size);
  evolution_akdfield_dimensionless_position = (real*) xmds_malloc(sizeof(real) * _dimensionless_position_alloc_size);
  evolution_akefield_dimensionless_position = (real*) xmds_malloc(sizeof(real) * _dimensionless_position_alloc_size);
  evolution_akffield_dimensionless_position = (real*) xmds_malloc(sizeof(real) * _dimensionless_position_alloc_size);
  evolution_akgfield_dimensionless_position = (real*) xmds_malloc(sizeof(real) * _dimensionless_position_alloc_size);
  evolution_akhfield_dimensionless_position = (real*) xmds_malloc(sizeof(real) * _dimensionless_position_alloc_size);
  evolution_akifield_dimensionless_position = (real*) xmds_malloc(sizeof(real) * _dimensionless_position_alloc_size);
  evolution_akjfield_dimensionless_position = (real*) xmds_malloc(sizeof(real) * _dimensionless_position_alloc_size);
  evolution_initial_dimensionless_position = (real*) xmds_malloc(sizeof(real) * _dimensionless_position_alloc_size);
  real* _akafield_dimensionless_velocity = evolution_akafield_dimensionless_velocity;
  real* _akbfield_dimensionless_velocity = evolution_akbfield_dimensionless_velocity;
  real* _akcfield_dimensionless_velocity = evolution_akcfield_dimensionless_velocity;
  real* _akdfield_dimensionless_velocity = evolution_akdfield_dimensionless_velocity;
  real* _akefield_dimensionless_velocity = evolution_akefield_dimensionless_velocity;
  real* _akffield_dimensionless_velocity = evolution_akffield_dimensionless_velocity;
  real* _akgfield_dimensionless_velocity = evolution_akgfield_dimensionless_velocity;
  real* _akhfield_dimensionless_velocity = evolution_akhfield_dimensionless_velocity;
  real* _akifield_dimensionless_velocity = evolution_akifield_dimensionless_velocity;
  real* _akjfield_dimensionless_velocity = evolution_akjfield_dimensionless_velocity;
  real* _initial_dimensionless_velocity = evolution_initial_dimensionless_velocity;
  real* _akafield_dimensionless_position = evolution_akafield_dimensionless_position;
  real* _akbfield_dimensionless_position = evolution_akbfield_dimensionless_position;
  real* _akcfield_dimensionless_position = evolution_akcfield_dimensionless_position;
  real* _akdfield_dimensionless_position = evolution_akdfield_dimensionless_position;
  real* _akefield_dimensionless_position = evolution_akefield_dimensionless_position;
  real* _akffield_dimensionless_position = evolution_akffield_dimensionless_position;
  real* _akgfield_dimensionless_position = evolution_akgfield_dimensionless_position;
  real* _akhfield_dimensionless_position = evolution_akhfield_dimensionless_position;
  real* _akifield_dimensionless_position = evolution_akifield_dimensionless_position;
  real* _akjfield_dimensionless_position = evolution_akjfield_dimensionless_position;
  real* _initial_dimensionless_position = evolution_initial_dimensionless_position;
  
  // Runge Kutta method constants 
  real _a_raw[16];
  real _a[16];
  real _b[16][16];
  real _c[16];
  real _cs[16];
  real _d[16];
  
  for (unsigned long _i0 = 0; _i0 < 16; _i0++) {
    _a_raw[_i0] = _c[_i0] = _d[_i0] = 0.0;
    for (unsigned long _i1 = 0; _i1 < 16; _i1++)
     _b[_i0][_i1] = 0.0;
  }
  
  _a_raw[1]  = real("0.02173913043478260869565217391304347");
  _a_raw[2]  = real("0.09629581047800066670113001679819925");
  _a_raw[3]  = real("0.14444371571700100005169502519729888");
  _a_raw[4]  = real("0.52205882352941176470588235294117647");
  _a_raw[5]  = real("0.22842443612863469578031459099794265");
  _a_raw[6]  = real("0.54360353589933733219171338103002937");
  _a_raw[7]  = real("0.64335664335664335664335664335664335");
  _a_raw[8]  = real("0.48251748251748251748251748251748251");
  _a_raw[9]  = real("0.06818181818181818181818181818181818");
  _a_raw[10] = real("0.25060827250608272506082725060827250");
  _a_raw[11] = real("0.66736715965600568968278165443304378");
  _a_raw[12] = real("0.85507246376811594202898550724637681");
  _a_raw[13] = real("0.89795918367346938775510204081632653");
  _a_raw[14] = real("1.0");
  _a_raw[15] = real("1.0");
  
  _a[0] = 0.0;
  for (unsigned long _i0 = 1; _i0 < 16; _i0++)
    _a[_i0] = _a_raw[_i0] - _a_raw[_i0 - 1];
  
  _b[1][0]   = real("1.0")/real("46.0");
  _b[2][0]   = real("-0.11698050118114486205818241524969622");
  _b[2][1]   = real("0.21327631165914552875931243204789548");
  _b[3][0]   = real("0.03611092892925025001292375629932472");
  _b[3][2]   = real("0.10833278678775075003877126889797416");
  _b[4][0]   = real("1.57329743908138605107331820072051125");
  _b[4][2]   = real("-5.98400943754042002888532938159655553");
  _b[4][3]   = real("4.93277082198844574251789353381722074");
  _b[5][0]   = real("0.05052046351120380909008334360006234");
  _b[5][3]   = real("0.17686653884807108146683657390397612");
  _b[5][4]   = real("0.00103743376935980522339467349390418");
  _b[6][0]   = real("0.10543148021953768958529340893598138");
  _b[6][3]   = real("-0.16042415162569842979496486916719383");
  _b[6][4]   = real("0.11643956912829316045688724281285250");
  _b[6][5]   = real("0.48215663817720491194449759844838932");
  _b[7][0]   = real("0.07148407148407148407148407148407148");
  _b[7][5]   = real("0.32971116090443908023196389566296464");
  _b[7][6]   = real("0.24216141096813279233990867620960722");
  _b[8][0]   = real("0.07162368881118881118881118881118881");
  _b[8][5]   = real("0.32859867301674234161492268975519694");
  _b[8][6]   = real("0.11622213117906185418927311444060725");
  _b[8][7]   = real("-0.03392701048951048951048951048951048");
  _b[9][0]   = real("0.04861540768024729180628870095388582");
  _b[9][5]   = real("0.03998502200331629058445317782406268");
  _b[9][6]   = real("0.10715724786209388876739304914053506");
  _b[9][7]   = real("-0.02177735985419485163815426357369818");
  _b[9][8]   = real("-0.10579849950964443770179884616296721");
  _b[10][0]  = real("-0.02540141041535143673515871979014924");
  _b[10][5]  = real("1.0")/real("30.0");
  _b[10][6]  = real("-0.16404854760069182073503553020238782");
  _b[10][7]  = real("0.03410548898794737788891414566528526");
  _b[10][8]  = real("0.15836825014108792658008718465091487");
  _b[10][9]  = real("0.21425115805975734472868683695127609");
  _b[11][0]  = real("0.00584833331460742801095934302256470");
  _b[11][5]  = real("-0.53954170547283522916525526480339109");
  _b[11][6]  = real("0.20128430845560909506500331018201158");
  _b[11][7]  = real("0.04347222773254789483240207937678906");
  _b[11][8]  = real("-0.00402998571475307250775349983910179");
  _b[11][9]  = real("0.16541535721570612771420482097898952");
  _b[11][10] = real("0.79491862412512344573322086551518180");
  _b[12][0]  = real("-0.39964965968794892497157706711861448");
  _b[12][5]  = real("-3.79096577568393158554742638116249372");
  _b[12][6]  = real("-0.40349325653530103387515807815498044");
  _b[12][7]  = real("-2.82463879530435263378049668286220715");
  _b[12][8]  = real("1.04226892772185985533374283289821416");
  _b[12][9]  = real("1.12510956420436603974237036536924078");
  _b[12][10] = real("3.32746188718986816186934832571938138");
  _b[12][11] = real("2.77897957186355606325818219255783627");
  _b[13][0]  = real("0.39545306350085237157098218205756922");
  _b[13][5]  = real("5.82534730759650564865380791881446903");
  _b[13][6]  = real("-0.36527452339161313311889856846974452");
  _b[13][7]  = real("1.18860324058346533283780076203192232");
  _b[13][8]  = real("0.57970467638357921347110271762687972");
  _b[13][9]  = real("-0.86824862589087693262676988867897834");
  _b[13][10] = real("-5.20227677296454721392873650976792184");
  _b[13][11] = real("-0.79895541420753382543211121058675915");
  _b[13][12] = real("0.14360623206363792632792463778889008");
  _b[14][0]  = real("8.49173149061346398013352206978380938");
  _b[14][5]  = real("86.32213734729036800877634194386790750");
  _b[14][6]  = real("1.02560575501091662034511526187393241");
  _b[14][7]  = real("85.77427969817339941806831550695235092");
  _b[14][8]  = real("-13.98699305104110611795532466113248067");
  _b[14][9]  = real("-20.71537405501426352265946477613161883");
  _b[14][10] = real("-72.16597156619946800281180102605140463");
  _b[14][11] = real("-76.71211139107806345587696023064419687");
  _b[14][12] = real("4.22319427707298828839851258893735507");
  _b[14][13] = real("-1.25649850482823521641825667745565428");
  _b[15][0]  = real("-0.42892119881959353241190195318730008");
  _b[15][5]  = real("-9.16865700950084689999297912545025359");
  _b[15][6]  = real("1.08317616770620939241547721530003920");
  _b[15][7]  = real("-1.23501525358323653198215832293981810");
  _b[15][8]  = real("-1.21438272617593906232943856422371019");
  _b[15][9]  = real("1.37226168507232166621351243731869914");
  _b[15][10] = real("9.15723239697162418155377135344394113");
  _b[15][12] = real("-0.25285618808937955976690569433069974");
  _b[15][13] = real("0.38099910799663987066763679926508552");
  
  _c[0]  = real("0.01490902081978461022483617102382552");
  _c[7]  = real("-0.20408044692054151258349120934134791");
  _c[8]  = real("0.22901438600570447264772469337066476");
  _c[9]  = real("0.12800558251147375669208211573729202");
  _c[10] = real("0.22380626846054143649770066956485937");
  _c[11] = real("0.39553165293700054420552389156421651");
  _c[12] = real("0.05416646758806981196568364538360743");
  _c[13] = real("0.12691439652445903685643385312168037");
  _c[14] = real("-0.00052539244262118876455834655383035");
  _c[15] = real("1.0")/real("31.0");
  
  _cs[0]  = real("0.00653047880643482012034413441159249");
  _cs[7]  = real("-2.31471038197461347517552506241529830");
  _cs[8]  = real("0.43528227238866280799530900822377013");
  _cs[9]  = real("0.14907947287101933118545845390618763");
  _cs[10] = real("0.17905535442235532311850533252768020");
  _cs[11] = real("2.53400872222767706921176214508820825");
  _cs[12] = real("-0.55430437423209112896721332268159015");
  _cs[13] = real("0.56924788787870083224213506297615260");
  _cs[14] = real("-0.03644749690427461198884026816573513");
  _cs[15] = real("1.0")/real("31.0");
  
  _d[0] = 1.0-_b[15][5]/_b[14][5];
  _d[1] = _b[15][0]-_b[14][0]*_b[15][5]/_b[14][5];
  _d[2] = _b[15][5]/_b[14][5];
  _d[3] = _b[15][6]-_b[14][6]*_b[15][5]/_b[14][5];
  _d[4] = _b[15][7]-_b[14][7]*_b[15][5]/_b[14][5];
  _d[5] = _b[15][8]-_b[14][8]*_b[15][5]/_b[14][5];
  _d[6] = _b[15][9]-_b[14][9]*_b[15][5]/_b[14][5];
  _d[7] = _b[15][10]-_b[14][10]*_b[15][5]/_b[14][5];
  _d[8] = _b[15][11]-_b[14][11]*_b[15][5]/_b[14][5];
  _d[9] = _b[15][12]-_b[14][12]*_b[15][5]/_b[14][5];
  _d[10] = _b[15][13]-_b[14][13]*_b[15][5]/_b[14][5];
  
  do {
    do {
      // Step 1
      memcpy(_akafield_dimensionless_velocity, _dimensionless_velocity, sizeof(real) * _dimensionless_velocity_alloc_size);
      memcpy(_akafield_dimensionless_position, _dimensionless_position, sizeof(real) * _dimensionless_position_alloc_size);

      _active_dimensionless_velocity = _akafield_dimensionless_velocity;
      _active_dimensionless_position = _akafield_dimensionless_position;
      
      // a_k=G[a_k, t]
      evolution_calculate_delta_a(_step);
      
      // Step 2
      t += _a[1] * _step;
      
      {
        _MAKE_AUTOVEC_VARIABLE(_akbfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akafield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_dimensionless_velocity);
        #pragma ivdep
        for (long _i0 = 0; _i0 < (1) * _dimensionless_velocity_ncomponents; _i0++) {
          _AUTOVEC(_akbfield_dimensionless_velocity)[_i0] = _AUTOVEC(_dimensionless_velocity)[_i0] + _b[1][0]*_AUTOVEC(_akafield_dimensionless_velocity)[_i0];
        }
      }
      {
        _MAKE_AUTOVEC_VARIABLE(_akbfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akafield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_dimensionless_position);
        #pragma ivdep
        for (long _i0 = 0; _i0 < (1) * _dimensionless_position_ncomponents; _i0++) {
          _AUTOVEC(_akbfield_dimensionless_position)[_i0] = _AUTOVEC(_dimensionless_position)[_i0] + _b[1][0]*_AUTOVEC(_akafield_dimensionless_position)[_i0];
        }
      }
      
      _active_dimensionless_velocity = _akbfield_dimensionless_velocity;
      _active_dimensionless_position = _akbfield_dimensionless_position;
      
      // a_k=G[a_k, t]
      evolution_calculate_delta_a(_step);
      
      // Step 3
      t += _a[2] * _step;
      
      {
        _MAKE_AUTOVEC_VARIABLE(_akbfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akcfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akafield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_dimensionless_velocity);
        #pragma ivdep
        for (long _i0 = 0; _i0 < (1) * _dimensionless_velocity_ncomponents; _i0++) {
          _AUTOVEC(_akcfield_dimensionless_velocity)[_i0] = _AUTOVEC(_dimensionless_velocity)[_i0] + _b[2][0]*_AUTOVEC(_akafield_dimensionless_velocity)[_i0] + _b[2][1]*_AUTOVEC(_akbfield_dimensionless_velocity)[_i0];
        }
      }
      {
        _MAKE_AUTOVEC_VARIABLE(_akbfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akcfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akafield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_dimensionless_position);
        #pragma ivdep
        for (long _i0 = 0; _i0 < (1) * _dimensionless_position_ncomponents; _i0++) {
          _AUTOVEC(_akcfield_dimensionless_position)[_i0] = _AUTOVEC(_dimensionless_position)[_i0] + _b[2][0]*_AUTOVEC(_akafield_dimensionless_position)[_i0] + _b[2][1]*_AUTOVEC(_akbfield_dimensionless_position)[_i0];
        }
      }
      
      _active_dimensionless_velocity = _akcfield_dimensionless_velocity;
      _active_dimensionless_position = _akcfield_dimensionless_position;
      
      // a_k=G[a_k, t]
      evolution_calculate_delta_a(_step);
      
      // Step 4
      t += _a[3] * _step;
      
      {
        _MAKE_AUTOVEC_VARIABLE(_akdfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akbfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akcfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akafield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_dimensionless_velocity);
        #pragma ivdep
        for (long _i0 = 0; _i0 < (1) * _dimensionless_velocity_ncomponents; _i0++) {
          _AUTOVEC(_akdfield_dimensionless_velocity)[_i0] = _AUTOVEC(_dimensionless_velocity)[_i0] + _b[3][0]*_AUTOVEC(_akafield_dimensionless_velocity)[_i0] + _b[3][1]*_AUTOVEC(_akbfield_dimensionless_velocity)[_i0]
              + _b[3][2]*_AUTOVEC(_akcfield_dimensionless_velocity)[_i0];
        }
      }
      {
        _MAKE_AUTOVEC_VARIABLE(_akdfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akbfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akcfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akafield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_dimensionless_position);
        #pragma ivdep
        for (long _i0 = 0; _i0 < (1) * _dimensionless_position_ncomponents; _i0++) {
          _AUTOVEC(_akdfield_dimensionless_position)[_i0] = _AUTOVEC(_dimensionless_position)[_i0] + _b[3][0]*_AUTOVEC(_akafield_dimensionless_position)[_i0] + _b[3][1]*_AUTOVEC(_akbfield_dimensionless_position)[_i0]
              + _b[3][2]*_AUTOVEC(_akcfield_dimensionless_position)[_i0];
        }
      }
      
      _active_dimensionless_velocity = _akdfield_dimensionless_velocity;
      _active_dimensionless_position = _akdfield_dimensionless_position;
      
      // a_k=G[a_k, t]
      evolution_calculate_delta_a(_step);
      
      // Step 5
      t += _a[4] * _step;
      
      {
        _MAKE_AUTOVEC_VARIABLE(_akbfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akcfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akdfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akefield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akafield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_dimensionless_velocity);
        #pragma ivdep
        for (long _i0 = 0; _i0 < (1) * _dimensionless_velocity_ncomponents; _i0++) {
          _AUTOVEC(_akefield_dimensionless_velocity)[_i0] = _AUTOVEC(_dimensionless_velocity)[_i0] + _b[4][0]*_AUTOVEC(_akafield_dimensionless_velocity)[_i0] + _b[4][1]*_AUTOVEC(_akbfield_dimensionless_velocity)[_i0]
              + _b[4][2]*_AUTOVEC(_akcfield_dimensionless_velocity)[_i0] + _b[4][3]*_AUTOVEC(_akdfield_dimensionless_velocity)[_i0];
        }
      }
      {
        _MAKE_AUTOVEC_VARIABLE(_akbfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akcfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akdfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akefield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akafield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_dimensionless_position);
        #pragma ivdep
        for (long _i0 = 0; _i0 < (1) * _dimensionless_position_ncomponents; _i0++) {
          _AUTOVEC(_akefield_dimensionless_position)[_i0] = _AUTOVEC(_dimensionless_position)[_i0] + _b[4][0]*_AUTOVEC(_akafield_dimensionless_position)[_i0] + _b[4][1]*_AUTOVEC(_akbfield_dimensionless_position)[_i0]
              + _b[4][2]*_AUTOVEC(_akcfield_dimensionless_position)[_i0] + _b[4][3]*_AUTOVEC(_akdfield_dimensionless_position)[_i0];
        }
      }
      
      _active_dimensionless_velocity = _akefield_dimensionless_velocity;
      _active_dimensionless_position = _akefield_dimensionless_position;
      
      // a_k=G[a_k, t]
      evolution_calculate_delta_a(_step);
      
      // Step 6
      t += _a[5] * _step;
      
      {
        _MAKE_AUTOVEC_VARIABLE(_akdfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akefield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akifield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akafield_dimensionless_velocity);
        #pragma ivdep
        for (long _i0 = 0; _i0 < (1) * _dimensionless_velocity_ncomponents; _i0++) {
          _AUTOVEC(_akifield_dimensionless_velocity)[_i0] = _AUTOVEC(_dimensionless_velocity)[_i0] + _b[5][0]*_AUTOVEC(_akafield_dimensionless_velocity)[_i0] + _b[5][3]*_AUTOVEC(_akdfield_dimensionless_velocity)[_i0]
              + _b[5][4]*_AUTOVEC(_akefield_dimensionless_velocity)[_i0];
        }
      }
      {
        _MAKE_AUTOVEC_VARIABLE(_akdfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akefield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akifield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akafield_dimensionless_position);
        #pragma ivdep
        for (long _i0 = 0; _i0 < (1) * _dimensionless_position_ncomponents; _i0++) {
          _AUTOVEC(_akifield_dimensionless_position)[_i0] = _AUTOVEC(_dimensionless_position)[_i0] + _b[5][0]*_AUTOVEC(_akafield_dimensionless_position)[_i0] + _b[5][3]*_AUTOVEC(_akdfield_dimensionless_position)[_i0]
              + _b[5][4]*_AUTOVEC(_akefield_dimensionless_position)[_i0];
        }
      }
      
      _active_dimensionless_velocity = _akifield_dimensionless_velocity;
      _active_dimensionless_position = _akifield_dimensionless_position;
      
      // a_k=G[a_k, t]
      evolution_calculate_delta_a(_step);
      
      // Step 7
      t += _a[6] * _step;
      
      {
        _MAKE_AUTOVEC_VARIABLE(_akdfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akifield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akefield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akjfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akafield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_dimensionless_velocity);
        #pragma ivdep
        for (long _i0 = 0; _i0 < (1) * _dimensionless_velocity_ncomponents; _i0++) {
          _AUTOVEC(_akjfield_dimensionless_velocity)[_i0] = _AUTOVEC(_dimensionless_velocity)[_i0] + _b[6][0]*_AUTOVEC(_akafield_dimensionless_velocity)[_i0] + _b[6][3]*_AUTOVEC(_akdfield_dimensionless_velocity)[_i0]
              + _b[6][4]*_AUTOVEC(_akefield_dimensionless_velocity)[_i0] + _b[6][5]*_AUTOVEC(_akifield_dimensionless_velocity)[_i0];
        }
      }
      {
        _MAKE_AUTOVEC_VARIABLE(_akdfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akifield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akefield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akjfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akafield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_dimensionless_position);
        #pragma ivdep
        for (long _i0 = 0; _i0 < (1) * _dimensionless_position_ncomponents; _i0++) {
          _AUTOVEC(_akjfield_dimensionless_position)[_i0] = _AUTOVEC(_dimensionless_position)[_i0] + _b[6][0]*_AUTOVEC(_akafield_dimensionless_position)[_i0] + _b[6][3]*_AUTOVEC(_akdfield_dimensionless_position)[_i0]
              + _b[6][4]*_AUTOVEC(_akefield_dimensionless_position)[_i0] + _b[6][5]*_AUTOVEC(_akifield_dimensionless_position)[_i0];
        }
      }
      
      _active_dimensionless_velocity = _akjfield_dimensionless_velocity;
      _active_dimensionless_position = _akjfield_dimensionless_position;
      
      // a_k=G[a_k, t]
      evolution_calculate_delta_a(_step);
      
      // Step 8
      t += _a[7] * _step;
      
      {
        _MAKE_AUTOVEC_VARIABLE(_akjfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akbfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akafield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akifield_dimensionless_velocity);
        #pragma ivdep
        for (long _i0 = 0; _i0 < (1) * _dimensionless_velocity_ncomponents; _i0++) {
          _AUTOVEC(_akbfield_dimensionless_velocity)[_i0] = _AUTOVEC(_dimensionless_velocity)[_i0] + _b[7][0]*_AUTOVEC(_akafield_dimensionless_velocity)[_i0] + _b[7][5]*_AUTOVEC(_akifield_dimensionless_velocity)[_i0]
              + _b[7][6]*_AUTOVEC(_akjfield_dimensionless_velocity)[_i0];
        }
      }
      {
        _MAKE_AUTOVEC_VARIABLE(_akjfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akbfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akafield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akifield_dimensionless_position);
        #pragma ivdep
        for (long _i0 = 0; _i0 < (1) * _dimensionless_position_ncomponents; _i0++) {
          _AUTOVEC(_akbfield_dimensionless_position)[_i0] = _AUTOVEC(_dimensionless_position)[_i0] + _b[7][0]*_AUTOVEC(_akafield_dimensionless_position)[_i0] + _b[7][5]*_AUTOVEC(_akifield_dimensionless_position)[_i0]
              + _b[7][6]*_AUTOVEC(_akjfield_dimensionless_position)[_i0];
        }
      }
      
      _active_dimensionless_velocity = _akbfield_dimensionless_velocity;
      _active_dimensionless_position = _akbfield_dimensionless_position;
      
      // a_k=G[a_k, t]
      evolution_calculate_delta_a(_step);
      
      // Step 9
      t += _a[8] * _step;
      
      {
        _MAKE_AUTOVEC_VARIABLE(_akbfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akcfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akifield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akjfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akafield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_dimensionless_velocity);
        #pragma ivdep
        for (long _i0 = 0; _i0 < (1) * _dimensionless_velocity_ncomponents; _i0++) {
          _AUTOVEC(_akcfield_dimensionless_velocity)[_i0] = _AUTOVEC(_dimensionless_velocity)[_i0] + _b[8][0]*_AUTOVEC(_akafield_dimensionless_velocity)[_i0] + _b[8][5]*_AUTOVEC(_akifield_dimensionless_velocity)[_i0]
              + _b[8][6]*_AUTOVEC(_akjfield_dimensionless_velocity)[_i0]+ _b[8][7]*_AUTOVEC(_akbfield_dimensionless_velocity)[_i0];
        }
      }
      {
        _MAKE_AUTOVEC_VARIABLE(_akbfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akcfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akifield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akjfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akafield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_dimensionless_position);
        #pragma ivdep
        for (long _i0 = 0; _i0 < (1) * _dimensionless_position_ncomponents; _i0++) {
          _AUTOVEC(_akcfield_dimensionless_position)[_i0] = _AUTOVEC(_dimensionless_position)[_i0] + _b[8][0]*_AUTOVEC(_akafield_dimensionless_position)[_i0] + _b[8][5]*_AUTOVEC(_akifield_dimensionless_position)[_i0]
              + _b[8][6]*_AUTOVEC(_akjfield_dimensionless_position)[_i0]+ _b[8][7]*_AUTOVEC(_akbfield_dimensionless_position)[_i0];
        }
      }
      
      _active_dimensionless_velocity = _akcfield_dimensionless_velocity;
      _active_dimensionless_position = _akcfield_dimensionless_position;
      
      // a_k=G[a_k, t]
      evolution_calculate_delta_a(_step);
      
      // Step 10
      t += _a[9] * _step;
      
      {
        _MAKE_AUTOVEC_VARIABLE(_akbfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akcfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akdfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akifield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akjfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akafield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_dimensionless_velocity);
        #pragma ivdep
        for (long _i0 = 0; _i0 < (1) * _dimensionless_velocity_ncomponents; _i0++) {
          _AUTOVEC(_akdfield_dimensionless_velocity)[_i0] = _AUTOVEC(_dimensionless_velocity)[_i0] + _b[9][0]*_AUTOVEC(_akafield_dimensionless_velocity)[_i0] + _b[9][5]*_AUTOVEC(_akifield_dimensionless_velocity)[_i0]
              + _b[9][6]*_AUTOVEC(_akjfield_dimensionless_velocity)[_i0]+ _b[9][7]*_AUTOVEC(_akbfield_dimensionless_velocity)[_i0]+ _b[9][8]*_AUTOVEC(_akcfield_dimensionless_velocity)[_i0];
        }
      }
      {
        _MAKE_AUTOVEC_VARIABLE(_akbfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akcfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akdfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akifield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akjfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akafield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_dimensionless_position);
        #pragma ivdep
        for (long _i0 = 0; _i0 < (1) * _dimensionless_position_ncomponents; _i0++) {
          _AUTOVEC(_akdfield_dimensionless_position)[_i0] = _AUTOVEC(_dimensionless_position)[_i0] + _b[9][0]*_AUTOVEC(_akafield_dimensionless_position)[_i0] + _b[9][5]*_AUTOVEC(_akifield_dimensionless_position)[_i0]
              + _b[9][6]*_AUTOVEC(_akjfield_dimensionless_position)[_i0]+ _b[9][7]*_AUTOVEC(_akbfield_dimensionless_position)[_i0]+ _b[9][8]*_AUTOVEC(_akcfield_dimensionless_position)[_i0];
        }
      }
      
      _active_dimensionless_velocity = _akdfield_dimensionless_velocity;
      _active_dimensionless_position = _akdfield_dimensionless_position;
      
      // a_k=G[a_k, t]
      evolution_calculate_delta_a(_step);
      
      // Step 11
      t += _a[10] * _step;
      
      {
        _MAKE_AUTOVEC_VARIABLE(_akbfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akcfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akdfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akifield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akefield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akjfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akafield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_dimensionless_velocity);
        #pragma ivdep
        for (long _i0 = 0; _i0 < (1) * _dimensionless_velocity_ncomponents; _i0++) {
          _AUTOVEC(_akefield_dimensionless_velocity)[_i0] = _AUTOVEC(_dimensionless_velocity)[_i0] + _b[10][0]*_AUTOVEC(_akafield_dimensionless_velocity)[_i0] + _b[10][5]*_AUTOVEC(_akifield_dimensionless_velocity)[_i0]
              + _b[10][6]*_AUTOVEC(_akjfield_dimensionless_velocity)[_i0]+ _b[10][7]*_AUTOVEC(_akbfield_dimensionless_velocity)[_i0] + _b[10][8]*_AUTOVEC(_akcfield_dimensionless_velocity)[_i0]
              + _b[10][9]*_AUTOVEC(_akdfield_dimensionless_velocity)[_i0];
        }
      }
      {
        _MAKE_AUTOVEC_VARIABLE(_akbfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akcfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akdfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akifield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akefield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akjfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akafield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_dimensionless_position);
        #pragma ivdep
        for (long _i0 = 0; _i0 < (1) * _dimensionless_position_ncomponents; _i0++) {
          _AUTOVEC(_akefield_dimensionless_position)[_i0] = _AUTOVEC(_dimensionless_position)[_i0] + _b[10][0]*_AUTOVEC(_akafield_dimensionless_position)[_i0] + _b[10][5]*_AUTOVEC(_akifield_dimensionless_position)[_i0]
              + _b[10][6]*_AUTOVEC(_akjfield_dimensionless_position)[_i0]+ _b[10][7]*_AUTOVEC(_akbfield_dimensionless_position)[_i0] + _b[10][8]*_AUTOVEC(_akcfield_dimensionless_position)[_i0]
              + _b[10][9]*_AUTOVEC(_akdfield_dimensionless_position)[_i0];
        }
      }
      
      _active_dimensionless_velocity = _akefield_dimensionless_velocity;
      _active_dimensionless_position = _akefield_dimensionless_position;
      
      // a_k=G[a_k, t]
      evolution_calculate_delta_a(_step);
      
      // Step 12
      t += _a[11] * _step;
      
      {
        _MAKE_AUTOVEC_VARIABLE(_akbfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akcfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akffield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akdfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akifield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akefield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akjfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akafield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_dimensionless_velocity);
        #pragma ivdep
        for (long _i0 = 0; _i0 < (1) * _dimensionless_velocity_ncomponents; _i0++) {
          _AUTOVEC(_akffield_dimensionless_velocity)[_i0] = _AUTOVEC(_dimensionless_velocity)[_i0] + _b[11][0]*_AUTOVEC(_akafield_dimensionless_velocity)[_i0] + _b[11][5]*_AUTOVEC(_akifield_dimensionless_velocity)[_i0]
              + _b[11][6]*_AUTOVEC(_akjfield_dimensionless_velocity)[_i0] + _b[11][7]*_AUTOVEC(_akbfield_dimensionless_velocity)[_i0] + _b[11][8]*_AUTOVEC(_akcfield_dimensionless_velocity)[_i0]
              + _b[11][9]*_AUTOVEC(_akdfield_dimensionless_velocity)[_i0] + _b[11][10]*_AUTOVEC(_akefield_dimensionless_velocity)[_i0];
        }
      }
      {
        _MAKE_AUTOVEC_VARIABLE(_akbfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akcfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akffield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akdfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akifield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akefield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akjfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akafield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_dimensionless_position);
        #pragma ivdep
        for (long _i0 = 0; _i0 < (1) * _dimensionless_position_ncomponents; _i0++) {
          _AUTOVEC(_akffield_dimensionless_position)[_i0] = _AUTOVEC(_dimensionless_position)[_i0] + _b[11][0]*_AUTOVEC(_akafield_dimensionless_position)[_i0] + _b[11][5]*_AUTOVEC(_akifield_dimensionless_position)[_i0]
              + _b[11][6]*_AUTOVEC(_akjfield_dimensionless_position)[_i0] + _b[11][7]*_AUTOVEC(_akbfield_dimensionless_position)[_i0] + _b[11][8]*_AUTOVEC(_akcfield_dimensionless_position)[_i0]
              + _b[11][9]*_AUTOVEC(_akdfield_dimensionless_position)[_i0] + _b[11][10]*_AUTOVEC(_akefield_dimensionless_position)[_i0];
        }
      }
      
      _active_dimensionless_velocity = _akffield_dimensionless_velocity;
      _active_dimensionless_position = _akffield_dimensionless_position;
      
      // a_k=G[a_k, t]
      evolution_calculate_delta_a(_step);
      
      // Step 13
      t += _a[12] * _step;
      
      {
        _MAKE_AUTOVEC_VARIABLE(_akbfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akcfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akffield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akdfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akifield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akefield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akjfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akafield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akgfield_dimensionless_velocity);
        #pragma ivdep
        for (long _i0 = 0; _i0 < (1) * _dimensionless_velocity_ncomponents; _i0++) {
          _AUTOVEC(_akgfield_dimensionless_velocity)[_i0] = _AUTOVEC(_dimensionless_velocity)[_i0] + _b[12][0]*_AUTOVEC(_akafield_dimensionless_velocity)[_i0] + _b[12][5]*_AUTOVEC(_akifield_dimensionless_velocity)[_i0]
              + _b[12][6]*_AUTOVEC(_akjfield_dimensionless_velocity)[_i0]+ _b[12][7]*_AUTOVEC(_akbfield_dimensionless_velocity)[_i0] + _b[12][8]*_AUTOVEC(_akcfield_dimensionless_velocity)[_i0]
              + _b[12][9]*_AUTOVEC(_akdfield_dimensionless_velocity)[_i0] + _b[12][10]*_AUTOVEC(_akefield_dimensionless_velocity)[_i0] + _b[12][11]*_AUTOVEC(_akffield_dimensionless_velocity)[_i0];
        }
      }
      {
        _MAKE_AUTOVEC_VARIABLE(_akbfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akcfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akffield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akdfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akifield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akefield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akjfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akafield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akgfield_dimensionless_position);
        #pragma ivdep
        for (long _i0 = 0; _i0 < (1) * _dimensionless_position_ncomponents; _i0++) {
          _AUTOVEC(_akgfield_dimensionless_position)[_i0] = _AUTOVEC(_dimensionless_position)[_i0] + _b[12][0]*_AUTOVEC(_akafield_dimensionless_position)[_i0] + _b[12][5]*_AUTOVEC(_akifield_dimensionless_position)[_i0]
              + _b[12][6]*_AUTOVEC(_akjfield_dimensionless_position)[_i0]+ _b[12][7]*_AUTOVEC(_akbfield_dimensionless_position)[_i0] + _b[12][8]*_AUTOVEC(_akcfield_dimensionless_position)[_i0]
              + _b[12][9]*_AUTOVEC(_akdfield_dimensionless_position)[_i0] + _b[12][10]*_AUTOVEC(_akefield_dimensionless_position)[_i0] + _b[12][11]*_AUTOVEC(_akffield_dimensionless_position)[_i0];
        }
      }
      
      _active_dimensionless_velocity = _akgfield_dimensionless_velocity;
      _active_dimensionless_position = _akgfield_dimensionless_position;
      
      // a_k=G[a_k, t]
      evolution_calculate_delta_a(_step);
      
      // Step 14
      t += _a[13] * _step;
      
      {
        _MAKE_AUTOVEC_VARIABLE(_akbfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akcfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akffield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akdfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akifield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akefield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akjfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akhfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akafield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akgfield_dimensionless_velocity);
        #pragma ivdep
        for (long _i0 = 0; _i0 < (1) * _dimensionless_velocity_ncomponents; _i0++) {
          _AUTOVEC(_akhfield_dimensionless_velocity)[_i0] = _AUTOVEC(_dimensionless_velocity)[_i0] + _b[13][0]*_AUTOVEC(_akafield_dimensionless_velocity)[_i0] + _b[13][5]*_AUTOVEC(_akifield_dimensionless_velocity)[_i0]
              + _b[13][6]*_AUTOVEC(_akjfield_dimensionless_velocity)[_i0]+ _b[13][7]*_AUTOVEC(_akbfield_dimensionless_velocity)[_i0] + _b[13][8]*_AUTOVEC(_akcfield_dimensionless_velocity)[_i0]
              + _b[13][9]*_AUTOVEC(_akdfield_dimensionless_velocity)[_i0] + _b[13][10]*_AUTOVEC(_akefield_dimensionless_velocity)[_i0] + _b[13][11]*_AUTOVEC(_akffield_dimensionless_velocity)[_i0]
              + _b[13][12]*_AUTOVEC(_akgfield_dimensionless_velocity)[_i0];
        }
      }
      {
        _MAKE_AUTOVEC_VARIABLE(_akbfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akcfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akffield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akdfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akifield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akefield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akjfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akhfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akafield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akgfield_dimensionless_position);
        #pragma ivdep
        for (long _i0 = 0; _i0 < (1) * _dimensionless_position_ncomponents; _i0++) {
          _AUTOVEC(_akhfield_dimensionless_position)[_i0] = _AUTOVEC(_dimensionless_position)[_i0] + _b[13][0]*_AUTOVEC(_akafield_dimensionless_position)[_i0] + _b[13][5]*_AUTOVEC(_akifield_dimensionless_position)[_i0]
              + _b[13][6]*_AUTOVEC(_akjfield_dimensionless_position)[_i0]+ _b[13][7]*_AUTOVEC(_akbfield_dimensionless_position)[_i0] + _b[13][8]*_AUTOVEC(_akcfield_dimensionless_position)[_i0]
              + _b[13][9]*_AUTOVEC(_akdfield_dimensionless_position)[_i0] + _b[13][10]*_AUTOVEC(_akefield_dimensionless_position)[_i0] + _b[13][11]*_AUTOVEC(_akffield_dimensionless_position)[_i0]
              + _b[13][12]*_AUTOVEC(_akgfield_dimensionless_position)[_i0];
        }
      }
      
      _active_dimensionless_velocity = _akhfield_dimensionless_velocity;
      _active_dimensionless_position = _akhfield_dimensionless_position;
      
      // a_k=G[a_k, t]
      evolution_calculate_delta_a(_step);
      
      // Step 15 and 16 combined to reduce memory use 
      {
        _MAKE_AUTOVEC_VARIABLE(_akbfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akcfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akffield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akdfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akifield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akefield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akjfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akhfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akafield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akgfield_dimensionless_velocity);
        #pragma ivdep
        for (long _i0 = 0; _i0 < (1) * _dimensionless_velocity_ncomponents; _i0++) {
          _AUTOVEC(_akifield_dimensionless_velocity)[_i0] = _AUTOVEC(_dimensionless_velocity)[_i0] + _b[14][0]*_AUTOVEC(_akafield_dimensionless_velocity)[_i0] + _b[14][5]*_AUTOVEC(_akifield_dimensionless_velocity)[_i0]
              + _b[14][6]*_AUTOVEC(_akjfield_dimensionless_velocity)[_i0]+ _b[14][7]*_AUTOVEC(_akbfield_dimensionless_velocity)[_i0] + _b[14][8]*_AUTOVEC(_akcfield_dimensionless_velocity)[_i0]
              + _b[14][9]*_AUTOVEC(_akdfield_dimensionless_velocity)[_i0] + _b[14][10]*_AUTOVEC(_akefield_dimensionless_velocity)[_i0] + _b[14][11]*_AUTOVEC(_akffield_dimensionless_velocity)[_i0]
              + _b[14][12]*_AUTOVEC(_akgfield_dimensionless_velocity)[_i0] + _b[14][13]*_AUTOVEC(_akhfield_dimensionless_velocity)[_i0];
        }
      }
      {
        _MAKE_AUTOVEC_VARIABLE(_akbfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akcfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akffield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akdfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akifield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akefield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akjfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akhfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akafield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akgfield_dimensionless_position);
        #pragma ivdep
        for (long _i0 = 0; _i0 < (1) * _dimensionless_position_ncomponents; _i0++) {
          _AUTOVEC(_akifield_dimensionless_position)[_i0] = _AUTOVEC(_dimensionless_position)[_i0] + _b[14][0]*_AUTOVEC(_akafield_dimensionless_position)[_i0] + _b[14][5]*_AUTOVEC(_akifield_dimensionless_position)[_i0]
              + _b[14][6]*_AUTOVEC(_akjfield_dimensionless_position)[_i0]+ _b[14][7]*_AUTOVEC(_akbfield_dimensionless_position)[_i0] + _b[14][8]*_AUTOVEC(_akcfield_dimensionless_position)[_i0]
              + _b[14][9]*_AUTOVEC(_akdfield_dimensionless_position)[_i0] + _b[14][10]*_AUTOVEC(_akefield_dimensionless_position)[_i0] + _b[14][11]*_AUTOVEC(_akffield_dimensionless_position)[_i0]
              + _b[14][12]*_AUTOVEC(_akgfield_dimensionless_position)[_i0] + _b[14][13]*_AUTOVEC(_akhfield_dimensionless_position)[_i0];
        }
      }
      {
        _MAKE_AUTOVEC_VARIABLE(_akbfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akcfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akffield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akdfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akifield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akefield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akjfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akhfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akafield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akgfield_dimensionless_velocity);
        #pragma ivdep
        for (long _i0 = 0; _i0 < (1) * _dimensionless_velocity_ncomponents; _i0++) {
          _AUTOVEC(_akjfield_dimensionless_velocity)[_i0] = _d[0]*_AUTOVEC(_dimensionless_velocity)[_i0]
                + _d[1]*_AUTOVEC(_akafield_dimensionless_velocity)[_i0]
                + _d[2]*_AUTOVEC(_akifield_dimensionless_velocity)[_i0]
                + _d[3]*_AUTOVEC(_akjfield_dimensionless_velocity)[_i0]
                + _d[4]*_AUTOVEC(_akbfield_dimensionless_velocity)[_i0]
                + _d[5]*_AUTOVEC(_akcfield_dimensionless_velocity)[_i0]
                + _d[6]*_AUTOVEC(_akdfield_dimensionless_velocity)[_i0]
                + _d[7]*_AUTOVEC(_akefield_dimensionless_velocity)[_i0]
                + _d[8]*_AUTOVEC(_akffield_dimensionless_velocity)[_i0]
                + _d[9]*_AUTOVEC(_akgfield_dimensionless_velocity)[_i0]
                + _d[10]*_AUTOVEC(_akhfield_dimensionless_velocity)[_i0];
        }
      }
      {
        _MAKE_AUTOVEC_VARIABLE(_akbfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akcfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akffield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akdfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akifield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akefield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akjfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akhfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akafield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akgfield_dimensionless_position);
        #pragma ivdep
        for (long _i0 = 0; _i0 < (1) * _dimensionless_position_ncomponents; _i0++) {
          _AUTOVEC(_akjfield_dimensionless_position)[_i0] = _d[0]*_AUTOVEC(_dimensionless_position)[_i0]
                + _d[1]*_AUTOVEC(_akafield_dimensionless_position)[_i0]
                + _d[2]*_AUTOVEC(_akifield_dimensionless_position)[_i0]
                + _d[3]*_AUTOVEC(_akjfield_dimensionless_position)[_i0]
                + _d[4]*_AUTOVEC(_akbfield_dimensionless_position)[_i0]
                + _d[5]*_AUTOVEC(_akcfield_dimensionless_position)[_i0]
                + _d[6]*_AUTOVEC(_akdfield_dimensionless_position)[_i0]
                + _d[7]*_AUTOVEC(_akefield_dimensionless_position)[_i0]
                + _d[8]*_AUTOVEC(_akffield_dimensionless_position)[_i0]
                + _d[9]*_AUTOVEC(_akgfield_dimensionless_position)[_i0]
                + _d[10]*_AUTOVEC(_akhfield_dimensionless_position)[_i0];
        }
      }
      
      t += _a[14] * _step;
      
      _active_dimensionless_velocity = _akifield_dimensionless_velocity;
      _active_dimensionless_position = _akifield_dimensionless_position;
      
      // a_k=G[a_k, t]
      evolution_calculate_delta_a(_step);
      
      t += _a[15] * _step;
      
      _active_dimensionless_velocity = _akjfield_dimensionless_velocity;
      _active_dimensionless_position = _akjfield_dimensionless_position;
      
      // a_k=G[a_k, t]
      evolution_calculate_delta_a(_step);
      
      // Take full step
      // ai = a
      memcpy(_initial_dimensionless_velocity, _dimensionless_velocity, sizeof(real) * _dimensionless_velocity_alloc_size);
      memcpy(_initial_dimensionless_position, _dimensionless_position, sizeof(real) * _dimensionless_position_alloc_size);
      
      // a = a + etc
      {
        _MAKE_AUTOVEC_VARIABLE(_akbfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akcfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akffield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akdfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akifield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akefield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akjfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akhfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akafield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akgfield_dimensionless_velocity);
        #pragma ivdep
        for (long _i0 = 0; _i0 < (1) * _dimensionless_velocity_ncomponents; _i0++) {
          _AUTOVEC(_dimensionless_velocity)[_i0] += _c[0]*_AUTOVEC(_akafield_dimensionless_velocity)[_i0] + _c[7]*_AUTOVEC(_akbfield_dimensionless_velocity)[_i0] + _c[8]*_AUTOVEC(_akcfield_dimensionless_velocity)[_i0]
              + _c[9]*_AUTOVEC(_akdfield_dimensionless_velocity)[_i0] + _c[10]*_AUTOVEC(_akefield_dimensionless_velocity)[_i0] + _c[11]*_AUTOVEC(_akffield_dimensionless_velocity)[_i0]
              + _c[12]*_AUTOVEC(_akgfield_dimensionless_velocity)[_i0] + _c[13]*_AUTOVEC(_akhfield_dimensionless_velocity)[_i0] + _c[14]*_AUTOVEC(_akifield_dimensionless_velocity)[_i0]
              + _c[15]*_AUTOVEC(_akjfield_dimensionless_velocity)[_i0];
        }
      }
      {
        _MAKE_AUTOVEC_VARIABLE(_akbfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akcfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akffield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akdfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akifield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akefield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akjfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akhfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akafield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akgfield_dimensionless_position);
        #pragma ivdep
        for (long _i0 = 0; _i0 < (1) * _dimensionless_position_ncomponents; _i0++) {
          _AUTOVEC(_dimensionless_position)[_i0] += _c[0]*_AUTOVEC(_akafield_dimensionless_position)[_i0] + _c[7]*_AUTOVEC(_akbfield_dimensionless_position)[_i0] + _c[8]*_AUTOVEC(_akcfield_dimensionless_position)[_i0]
              + _c[9]*_AUTOVEC(_akdfield_dimensionless_position)[_i0] + _c[10]*_AUTOVEC(_akefield_dimensionless_position)[_i0] + _c[11]*_AUTOVEC(_akffield_dimensionless_position)[_i0]
              + _c[12]*_AUTOVEC(_akgfield_dimensionless_position)[_i0] + _c[13]*_AUTOVEC(_akhfield_dimensionless_position)[_i0] + _c[14]*_AUTOVEC(_akifield_dimensionless_position)[_i0]
              + _c[15]*_AUTOVEC(_akjfield_dimensionless_position)[_i0];
        }
      }
      // a* = a + etc
      {
        _MAKE_AUTOVEC_VARIABLE(_akbfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akcfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_initial_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akffield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akdfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akifield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akefield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akjfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akhfield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akafield_dimensionless_velocity);
        _MAKE_AUTOVEC_VARIABLE(_akgfield_dimensionless_velocity);
        #pragma ivdep
        for (long _i0 = 0; _i0 < (1) * _dimensionless_velocity_ncomponents; _i0++) {
          _AUTOVEC(_akafield_dimensionless_velocity)[_i0] = _AUTOVEC(_initial_dimensionless_velocity)[_i0] + _cs[0]*_AUTOVEC(_akafield_dimensionless_velocity)[_i0] + _cs[7]*_AUTOVEC(_akbfield_dimensionless_velocity)[_i0]
              + _cs[8]*_AUTOVEC(_akcfield_dimensionless_velocity)[_i0] + _cs[9]*_AUTOVEC(_akdfield_dimensionless_velocity)[_i0] + _cs[10]*_AUTOVEC(_akefield_dimensionless_velocity)[_i0]
              + _cs[11]*_AUTOVEC(_akffield_dimensionless_velocity)[_i0] + _cs[12]*_AUTOVEC(_akgfield_dimensionless_velocity)[_i0] + _cs[13]*_AUTOVEC(_akhfield_dimensionless_velocity)[_i0]
              + _cs[14]*_AUTOVEC(_akifield_dimensionless_velocity)[_i0] + _cs[15]*_AUTOVEC(_akjfield_dimensionless_velocity)[_i0];
        }
      }
      {
        _MAKE_AUTOVEC_VARIABLE(_akbfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akcfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_initial_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akffield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akdfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akifield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akefield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akjfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akhfield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akafield_dimensionless_position);
        _MAKE_AUTOVEC_VARIABLE(_akgfield_dimensionless_position);
        #pragma ivdep
        for (long _i0 = 0; _i0 < (1) * _dimensionless_position_ncomponents; _i0++) {
          _AUTOVEC(_akafield_dimensionless_position)[_i0] = _AUTOVEC(_initial_dimensionless_position)[_i0] + _cs[0]*_AUTOVEC(_akafield_dimensionless_position)[_i0] + _cs[7]*_AUTOVEC(_akbfield_dimensionless_position)[_i0]
              + _cs[8]*_AUTOVEC(_akcfield_dimensionless_position)[_i0] + _cs[9]*_AUTOVEC(_akdfield_dimensionless_position)[_i0] + _cs[10]*_AUTOVEC(_akefield_dimensionless_position)[_i0]
              + _cs[11]*_AUTOVEC(_akffield_dimensionless_position)[_i0] + _cs[12]*_AUTOVEC(_akgfield_dimensionless_position)[_i0] + _cs[13]*_AUTOVEC(_akhfield_dimensionless_position)[_i0]
              + _cs[14]*_AUTOVEC(_akifield_dimensionless_position)[_i0] + _cs[15]*_AUTOVEC(_akjfield_dimensionless_position)[_i0];
        }
      }
      
      _active_dimensionless_velocity = _dimensionless_velocity;
      _active_dimensionless_position = _dimensionless_position;
      
      _error = 0.0;
      
      evolution_dimensionless_velocity_error = evolution_dimensionless_velocity_timestep_error(_akafield_dimensionless_velocity);
      if (evolution_dimensionless_velocity_error > _error)
        _error = evolution_dimensionless_velocity_error;
      
      evolution_dimensionless_position_error = evolution_dimensionless_position_timestep_error(_akafield_dimensionless_position);
      if (evolution_dimensionless_position_error > _error)
        _error = evolution_dimensionless_position_error;
      
      _attempted_steps++;
      
      if (_error < _tolerance) {
        _t_local += _step;
        if (_step > _max_step)
          _max_step = _step;
        if (!_break_next && _step < _min_step)
          _min_step = _step;
        _discard = false;
      } else {
        t -= _step;
  
        if (evolution_dimensionless_velocity_reset(_initial_dimensionless_velocity) == false) {
  
          _LOG(_WARNING_LOG_LEVEL, "WARNING: NaN present. Integration halted at t = %e.\n"
                             "         Non-finite number in integration vector \"velocity\" in segment 2.\n", t);
          
          goto _SEGMENT2_END;
        }
        if (evolution_dimensionless_position_reset(_initial_dimensionless_position) == false) {
  
          _LOG(_WARNING_LOG_LEVEL, "WARNING: NaN present. Integration halted at t = %e.\n"
                             "         Non-finite number in integration vector \"position\" in segment 2.\n", t);
          
          goto _SEGMENT2_END;
        }
        
        _discard = true;
        _break_next = false;
        _unsuccessful_steps++;
      }
      
      _old_step = _step;
      
      // Resize step
      if (_error < 0.5*_tolerance || _error > _tolerance) {
        const real _safetyFactor = 0.90;
        real _scalingFactor = _safetyFactor * pow(abs(_error/_tolerance), real(-0.7/9.0)) * pow(_last_norm_error, real(0.4/9.0));
        _scalingFactor = MAX(_scalingFactor, 1.0/5.0);
        _scalingFactor = MIN(_scalingFactor, 7.0);
        if (_error > _tolerance && _scalingFactor > 1.0) {
          // If our step failed don't try and increase our step size. That would be silly.
          _scalingFactor = _safetyFactor * pow(abs(_error/_tolerance), real(-1.0/9.0));
        }
        _old_step = _step;
        _last_norm_error = pow(_safetyFactor/_scalingFactor*pow(_last_norm_error, real(0.4/9.0)), real(9.0/0.7));
        _step *= _scalingFactor;
      }
      
    } while (_discard);
    
    if (_break_next) {

      _break = true;
    }
    
    if ( (_t_local + _step)*(1.0 + _EPSILON) > _t_break_next) {
      _break_next = true;
      _LOG(_SAMPLE_LOG_LEVEL, "Current timestep: %e\n", _old_step);
      _step = _t_break_next - _t_local;
    }
  } while (!_break);
  
  _SEGMENT2_END:;
  xmds_free(evolution_akafield_dimensionless_velocity);
  xmds_free(evolution_akbfield_dimensionless_velocity);
  xmds_free(evolution_akcfield_dimensionless_velocity);
  xmds_free(evolution_akdfield_dimensionless_velocity);
  xmds_free(evolution_akefield_dimensionless_velocity);
  xmds_free(evolution_akffield_dimensionless_velocity);
  xmds_free(evolution_akgfield_dimensionless_velocity);
  xmds_free(evolution_akhfield_dimensionless_velocity);
  xmds_free(evolution_akifield_dimensionless_velocity);
  xmds_free(evolution_akjfield_dimensionless_velocity);
  xmds_free(evolution_initial_dimensionless_velocity);
  xmds_free(evolution_akafield_dimensionless_position);
  xmds_free(evolution_akbfield_dimensionless_position);
  xmds_free(evolution_akcfield_dimensionless_position);
  xmds_free(evolution_akdfield_dimensionless_position);
  xmds_free(evolution_akefield_dimensionless_position);
  xmds_free(evolution_akffield_dimensionless_position);
  xmds_free(evolution_akgfield_dimensionless_position);
  xmds_free(evolution_akhfield_dimensionless_position);
  xmds_free(evolution_akifield_dimensionless_position);
  xmds_free(evolution_akjfield_dimensionless_position);
  xmds_free(evolution_initial_dimensionless_position);
  
  _LOG(_SEGMENT_LOG_LEVEL, "Segment 2: minimum timestep: %e maximum timestep: %e\n", _min_step, _max_step);
  _LOG(_SEGMENT_LOG_LEVEL, "  Attempted %li steps, %.2f%% steps failed.\n", _attempted_steps, (100.0*_unsuccessful_steps)/_attempted_steps);
}

real evolution_dimensionless_velocity_timestep_error(real* _checkfield)
{
  real _error = 1e-24;
  real _temp_error = 0.0;
  real _temp_mod = 0.0;
  
  {
    long _dimensionless_velocity_index_pointer = 0;
    #define v1 _active_dimensionless_velocity[_dimensionless_velocity_index_pointer + 0]
    #define v2 _active_dimensionless_velocity[_dimensionless_velocity_index_pointer + 1]
    for (long _i0 = 0; _i0 < (1); _i0++) {
      for (long  _i1 = 0; _i1 < _dimensionless_velocity_ncomponents; _i1++) {
        _temp_error = abs(_dimensionless_velocity[_dimensionless_velocity_index_pointer + _i1] - _checkfield[_dimensionless_velocity_index_pointer + _i1]) / (0.5*abs(_dimensionless_velocity[_dimensionless_velocity_index_pointer + _i1]) + 0.5*abs(_checkfield[_dimensionless_velocity_index_pointer + _i1]));
        
        if (_xmds_isnonfinite(_temp_error)) {
          /* For _temp_error to be NaN, both the absolute value of the higher and lower order solutions
             must BOTH be zero. This therefore implies that their difference is zero, and that there is no error. */
          _temp_error = 0.0;
        }
        
        if (_error < _temp_error) // UNVECTORISABLE
          _error = _temp_error;
      }
    
      _dimensionless_velocity_index_pointer += _dimensionless_velocity_ncomponents;
    }
    #undef v1
    #undef v2
  }
  return _error;
}

bool evolution_dimensionless_velocity_reset(real* _reset_to_dimensionless_velocity)
{
  memcpy(_dimensionless_velocity, _reset_to_dimensionless_velocity, sizeof(real) * _dimensionless_velocity_alloc_size);
  
  /* return false if there's a NaN somewhere in the vector, otherwise return true */
  bool bNoNaNsPresent = true;
  {
    long _dimensionless_velocity_index_pointer = 0;
    #define v1 _active_dimensionless_velocity[_dimensionless_velocity_index_pointer + 0]
    #define v2 _active_dimensionless_velocity[_dimensionless_velocity_index_pointer + 1]
    for (long _i0 = 0; _i0 < (1); _i0++) {
        for (long _i1 = 0; _i1 < _dimensionless_velocity_ncomponents; _i1++) {
          if (_xmds_isnonfinite(_dimensionless_velocity[_dimensionless_velocity_index_pointer + _i1])) bNoNaNsPresent = false;
        }
    
      _dimensionless_velocity_index_pointer += _dimensionless_velocity_ncomponents;
    }
    #undef v1
    #undef v2
  }
  return bNoNaNsPresent;
}

real evolution_dimensionless_position_timestep_error(real* _checkfield)
{
  real _error = real(1e-24);
  real _temp_error = 0.0;
  real _temp_mod = 0.0;

  {
    long _dimensionless_position_index_pointer = 0;
    #define x1 _active_dimensionless_position[_dimensionless_position_index_pointer + 0]
    #define x2 _active_dimensionless_position[_dimensionless_position_index_pointer + 1]
    for (long _i0 = 0; _i0 < (1); _i0++) {
      for (long  _i1 = 0; _i1 < _dimensionless_position_ncomponents; _i1++) {
        _temp_error = abs(_dimensionless_position[_dimensionless_position_index_pointer + _i1] - _checkfield[_dimensionless_position_index_pointer + _i1]) / (0.5*abs(_dimensionless_position[_dimensionless_position_index_pointer + _i1]) + 0.5*abs(_checkfield[_dimensionless_position_index_pointer + _i1]));
        
        if (_xmds_isnonfinite(_temp_error)) {
          /* For _temp_error to be NaN, both the absolute value of the higher and lower order solutions
             must BOTH be zero. This therefore implies that their difference is zero, and that there is no error. */
          _temp_error = 0.0;
        }
        
        if (_error < _temp_error) // UNVECTORISABLE
          _error = _temp_error;
      }
    
      _dimensionless_position_index_pointer += _dimensionless_position_ncomponents;
    }
    #undef x1
    #undef x2
  }
  return _error;
}

bool evolution_dimensionless_position_reset(real* _reset_to_dimensionless_position)
{
  memcpy(_dimensionless_position, _reset_to_dimensionless_position, sizeof(real) * _dimensionless_position_alloc_size);
  
  /* return false if there's a NaN somewhere in the vector, otherwise return true */
  bool bNoNaNsPresent = true;
  {
    long _dimensionless_position_index_pointer = 0;
    #define x1 _active_dimensionless_position[_dimensionless_position_index_pointer + 0]
    #define x2 _active_dimensionless_position[_dimensionless_position_index_pointer + 1]
    for (long _i0 = 0; _i0 < (1); _i0++) {
        for (long _i1 = 0; _i1 < _dimensionless_position_ncomponents; _i1++) {
          if (_xmds_isnonfinite(_dimensionless_position[_dimensionless_position_index_pointer + _i1])) bNoNaNsPresent = false;
        }
    
      _dimensionless_position_index_pointer += _dimensionless_position_ncomponents;
    }
    #undef x1
    #undef x2
  }
  return bNoNaNsPresent;
}

// Delta A propagation operator for field dimensionless
void evolution_dimensionless_operators_evaluate_operator0(real _step)
{
  long _dimensionless_velocity_index_pointer = 0;
  #define v1 _active_dimensionless_velocity[_dimensionless_velocity_index_pointer + 0]
  #define v2 _active_dimensionless_velocity[_dimensionless_velocity_index_pointer + 1]
  long _dimensionless_position_index_pointer = 0;
  #define x1 _active_dimensionless_position[_dimensionless_position_index_pointer + 0]
  #define x2 _active_dimensionless_position[_dimensionless_position_index_pointer + 1]
  real dx2_dt;
  real dv1_dt;
  real dv2_dt;
  real dx1_dt;
  
  #define dt _step
  
  // ************* Propagation code ***************
  dx1_dt = v1;
  dx2_dt = v2;
  dv1_dt = -coulomb/(delta+x2-x1) - trap*(a - 2*q*cos(wrf*t+phi))*x1;
  dv2_dt = coulomb/(delta+x2-x1) - trap*(a - 2*q*cos(wrf*t+phi))*x2;
  // **********************************************
  
  #undef dt
  _active_dimensionless_position[_dimensionless_position_index_pointer + 1] = dx2_dt * _step;
  _active_dimensionless_velocity[_dimensionless_velocity_index_pointer + 0] = dv1_dt * _step;
  _active_dimensionless_velocity[_dimensionless_velocity_index_pointer + 1] = dv2_dt * _step;
  _active_dimensionless_position[_dimensionless_position_index_pointer + 0] = dx1_dt * _step;
  #undef v1
  #undef v2
  #undef x1
  #undef x2
}
