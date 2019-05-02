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
#define _dimensionless_velocity_ncomponents 2
// vector position defines
#define _dimensionless_position_ncomponents 2

// ********************************************************
// GLOBALS
// ********************************************************
//   'Globals' element globals
const real_t a=con_fun<real_t>("0");
const real_t q=con_fun<real_t>("0.1");
const real_t trap=con_fun<real_t>("7864.76"); // (2 pi)^2/beta^2
const real_t coulomb=con_fun<real_t>("8.64309169165991e8"); //e^2/4 pi eps0
const real_t delta=con_fun<real_t>("6241.146965412783");
const real_t wrf=con_fun<real_t>("177.367");
const real_t eta=con_fun<real_t>("0.16");
const real_t k=sqrt(con_fun<real_t>("2"))*eta;
const real_t initDisp=con_fun<real_t>("0.5618549231638847");

// Runge Kutta method constants 
/*
const real_t _a_raw[16] = {real_t("0.0"),real_t("0.02173913043478260869565217391304347"),real_t("0.09629581047800066670113001679819925"),
  real_t("0.14444371571700100005169502519729888"),real_t("0.52205882352941176470588235294117647"),real_t("0.22842443612863469578031459099794265"),
  real_t("0.54360353589933733219171338103002937"),real_t("0.64335664335664335664335664335664335"),real_t("0.48251748251748251748251748251748251"),
  real_t("0.06818181818181818181818181818181818"),real_t("0.25060827250608272506082725060827250"),real_t("0.66736715965600568968278165443304378"),
  real_t("0.85507246376811594202898550724637681"),real_t("0.89795918367346938775510204081632653"),real_t("1.0"),real_t("1.0")}; */

const real_t _a[16] = {
  con_fun<real_t>("0.0"),
  con_fun<real_t>("0.02173913043478260869565217391304347"),
  con_fun<real_t>("0.09629581047800066670113001679819925")-con_fun<real_t>("0.02173913043478260869565217391304347"),
  con_fun<real_t>("0.14444371571700100005169502519729888")-con_fun<real_t>("0.09629581047800066670113001679819925"),
  con_fun<real_t>("0.52205882352941176470588235294117647")-con_fun<real_t>("0.14444371571700100005169502519729888"),
  con_fun<real_t>("0.22842443612863469578031459099794265")-con_fun<real_t>("0.52205882352941176470588235294117647"),
  con_fun<real_t>("0.54360353589933733219171338103002937")-con_fun<real_t>("0.22842443612863469578031459099794265"),
  con_fun<real_t>("0.64335664335664335664335664335664335")-con_fun<real_t>("0.54360353589933733219171338103002937"),
  con_fun<real_t>("0.48251748251748251748251748251748251")-con_fun<real_t>("0.64335664335664335664335664335664335"),
  con_fun<real_t>("0.06818181818181818181818181818181818")-con_fun<real_t>("0.48251748251748251748251748251748251"),
  con_fun<real_t>("0.25060827250608272506082725060827250")-con_fun<real_t>("0.06818181818181818181818181818181818"),
  con_fun<real_t>("0.66736715965600568968278165443304378")-con_fun<real_t>("0.25060827250608272506082725060827250"),
  con_fun<real_t>("0.85507246376811594202898550724637681")-con_fun<real_t>("0.66736715965600568968278165443304378"),
  con_fun<real_t>("0.89795918367346938775510204081632653")-con_fun<real_t>("0.85507246376811594202898550724637681"),
  con_fun<real_t>("1.0")-con_fun<real_t>("0.89795918367346938775510204081632653"),
  con_fun<real_t>("0.0")
};

const real_t _b[16][16] = {
  {
    con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),
    con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),
    con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0")
  }, 
  {
    con_fun<real_t>("1.0")/con_fun<real_t>("46.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),
    con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),
    con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0")
  },
  {
    con_fun<real_t>("-0.11698050118114486205818241524969622"),con_fun<real_t>("0.21327631165914552875931243204789548"),con_fun<real_t>("0.0"),
    con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),
    con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),
    con_fun<real_t>("0.0")
  },
  {
    con_fun<real_t>("0.03611092892925025001292375629932472"),con_fun<real_t>("0.0"),con_fun<real_t>("0.10833278678775075003877126889797416"),
    con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),
    con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),
    con_fun<real_t>("0.0")
  },
  {
    con_fun<real_t>("1.57329743908138605107331820072051125"),con_fun<real_t>("0.0"),con_fun<real_t>("-5.98400943754042002888532938159655553"),
    con_fun<real_t>("4.93277082198844574251789353381722074"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),
    con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),
    con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0")
  },
  {
    con_fun<real_t>("0.05052046351120380909008334360006234"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),
    con_fun<real_t>("0.17686653884807108146683657390397612"),con_fun<real_t>("0.00103743376935980522339467349390418"),con_fun<real_t>("0.0"),
    con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),
    con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0")
  },
  {
    con_fun<real_t>("0.10543148021953768958529340893598138"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),
    con_fun<real_t>("-0.16042415162569842979496486916719383"),con_fun<real_t>("0.11643956912829316045688724281285250"),
    con_fun<real_t>("0.48215663817720491194449759844838932"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),
    con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),
    con_fun<real_t>("0.0"),con_fun<real_t>("0.0")
  },
  {
    con_fun<real_t>("0.07148407148407148407148407148407148"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),
    con_fun<real_t>("0.32971116090443908023196389566296464"),con_fun<real_t>("0.24216141096813279233990867620960722"),con_fun<real_t>("0.0"),
    con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),
    con_fun<real_t>("0.0"),con_fun<real_t>("0.0")
  },
  {
    con_fun<real_t>("0.07162368881118881118881118881118881"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),
    con_fun<real_t>("0.32859867301674234161492268975519694"),con_fun<real_t>("0.11622213117906185418927311444060725"),
    con_fun<real_t>("-0.03392701048951048951048951048951048"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),
    con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0")
  },
  {
    con_fun<real_t>("0.04861540768024729180628870095388582"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),
    con_fun<real_t>("0.03998502200331629058445317782406268"),con_fun<real_t>("0.10715724786209388876739304914053506"),
    con_fun<real_t>("-0.02177735985419485163815426357369818"),con_fun<real_t>("-0.10579849950964443770179884616296721"),con_fun<real_t>("0.0"),
    con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0")
  },
  {
    con_fun<real_t>("-0.02540141041535143673515871979014924"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),
    con_fun<real_t>("0.0"),con_fun<real_t>("1.0")/con_fun<real_t>("30.0"),con_fun<real_t>("-0.16404854760069182073503553020238782"),
    con_fun<real_t>("0.03410548898794737788891414566528526"),con_fun<real_t>("0.15836825014108792658008718465091487"),
    con_fun<real_t>("0.21425115805975734472868683695127609"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),
    con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0")
  },
  {
    con_fun<real_t>("0.00584833331460742801095934302256470"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),
    con_fun<real_t>("-0.53954170547283522916525526480339109"),con_fun<real_t>("0.20128430845560909506500331018201158"),
    con_fun<real_t>("0.04347222773254789483240207937678906"),con_fun<real_t>("-0.00402998571475307250775349983910179"),
    con_fun<real_t>("0.16541535721570612771420482097898952"),con_fun<real_t>("0.79491862412512344573322086551518180"),
    con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0")
  },
  {
    con_fun<real_t>("-0.39964965968794892497157706711861448"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),
    con_fun<real_t>("0.0"),con_fun<real_t>("-3.79096577568393158554742638116249372"),con_fun<real_t>("-0.40349325653530103387515807815498044"),
    con_fun<real_t>("-2.82463879530435263378049668286220715"),con_fun<real_t>("1.04226892772185985533374283289821416"),
    con_fun<real_t>("1.12510956420436603974237036536924078"),con_fun<real_t>("3.32746188718986816186934832571938138"),
    con_fun<real_t>("2.77897957186355606325818219255783627"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0")
  },
  {
    con_fun<real_t>("0.39545306350085237157098218205756922"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),
    con_fun<real_t>("5.82534730759650564865380791881446903"),con_fun<real_t>("-0.36527452339161313311889856846974452"),
    con_fun<real_t>("1.18860324058346533283780076203192232"),con_fun<real_t>("0.57970467638357921347110271762687972"),
    con_fun<real_t>("-0.86824862589087693262676988867897834"),con_fun<real_t>("-5.20227677296454721392873650976792184"),
    con_fun<real_t>("-0.79895541420753382543211121058675915"),con_fun<real_t>("0.14360623206363792632792463778889008"),
    con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0")
  },
  {
    con_fun<real_t>("8.49173149061346398013352206978380938"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),
    con_fun<real_t>("86.32213734729036800877634194386790750"),con_fun<real_t>("1.02560575501091662034511526187393241"),
    con_fun<real_t>("85.77427969817339941806831550695235092"),con_fun<real_t>("-13.98699305104110611795532466113248067"),
    con_fun<real_t>("-20.71537405501426352265946477613161883"),con_fun<real_t>("-72.16597156619946800281180102605140463"),
    con_fun<real_t>("-76.71211139107806345587696023064419687"),con_fun<real_t>("4.22319427707298828839851258893735507"),
    con_fun<real_t>("-1.25649850482823521641825667745565428"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0")
  },
  {
    con_fun<real_t>("-0.42892119881959353241190195318730008"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),
    con_fun<real_t>("0.0"),con_fun<real_t>("-9.16865700950084689999297912545025359"),con_fun<real_t>("1.08317616770620939241547721530003920"),
    con_fun<real_t>("-1.23501525358323653198215832293981810"),con_fun<real_t>("-1.21438272617593906232943856422371019"),
    con_fun<real_t>("1.37226168507232166621351243731869914"),con_fun<real_t>("9.15723239697162418155377135344394113"),
    con_fun<real_t>("0.0"),con_fun<real_t>("-0.25285618808937955976690569433069974"),con_fun<real_t>("0.38099910799663987066763679926508552"),
    con_fun<real_t>("0.0"),con_fun<real_t>("0.0")
  }
};

const real_t _c[16] = {
  con_fun<real_t>("0.01490902081978461022483617102382552"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),
  con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("-0.20408044692054151258349120934134791"),
  con_fun<real_t>("0.22901438600570447264772469337066476"),con_fun<real_t>("0.12800558251147375669208211573729202"),
  con_fun<real_t>("0.22380626846054143649770066956485937"),con_fun<real_t>("0.39553165293700054420552389156421651"),
  con_fun<real_t>("0.05416646758806981196568364538360743"),con_fun<real_t>("0.12691439652445903685643385312168037"),
  con_fun<real_t>("-0.00052539244262118876455834655383035"),con_fun<real_t>("1.0")/con_fun<real_t>("31.0")
};

const real_t _cs[16] = {
  con_fun<real_t>("0.00653047880643482012034413441159249"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),
  con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("-2.31471038197461347517552506241529830"),
  con_fun<real_t>("0.43528227238866280799530900822377013"),con_fun<real_t>("0.14907947287101933118545845390618763"),
  con_fun<real_t>("0.17905535442235532311850533252768020"),con_fun<real_t>("2.53400872222767706921176214508820825"),
  con_fun<real_t>("-0.55430437423209112896721332268159015"),con_fun<real_t>("0.56924788787870083224213506297615260"),
  con_fun<real_t>("-0.03644749690427461198884026816573513"),con_fun<real_t>("1.0")/con_fun<real_t>("31.0")
};

const real_t _d[16] = {
  con_fun<real_t>("1.0")-_b[15][5]/_b[14][5],            _b[15][0]-_b[14][0]*_b[15][5]/_b[14][5],
  _b[15][5]/_b[14][5],                        _b[15][6]-_b[14][6]*_b[15][5]/_b[14][5],
  _b[15][7]-_b[14][7]*_b[15][5]/_b[14][5],    _b[15][8]-_b[14][8]*_b[15][5]/_b[14][5],
  _b[15][9]-_b[14][9]*_b[15][5]/_b[14][5],    _b[15][10]-_b[14][10]*_b[15][5]/_b[14][5],
  _b[15][11]-_b[14][11]*_b[15][5]/_b[14][5],  _b[15][12]-_b[14][12]*_b[15][5]/_b[14][5],
  _b[15][13]-_b[14][13]*_b[15][5]/_b[14][5],  con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),con_fun<real_t>("0.0"),
  con_fun<real_t>("0.0"),con_fun<real_t>("0.0")
};

inline int compare(const void *arr1, const void *arr2)
{
  return 2*(((real_t*)arr1)[0] > ((real_t*)arr2)[0])-1;
}

struct ode_workspace_t {
  /**
    * The workspace memory.
    */
  real_t t;
  
  real_t* velocity = NULL;
  real_t* position = NULL;

  real_t* active_velocity = NULL;
  real_t* active_position = NULL;

  // ********************************************************
  //   segment 2 (RK89 adaptive-step integrator) globals
  real_t* evolution_akafield_dimensionless_velocity;
  real_t* evolution_akbfield_dimensionless_velocity;
  real_t* evolution_akcfield_dimensionless_velocity;
  real_t* evolution_akdfield_dimensionless_velocity;
  real_t* evolution_akefield_dimensionless_velocity;
  real_t* evolution_akffield_dimensionless_velocity;
  real_t* evolution_akgfield_dimensionless_velocity;
  real_t* evolution_akhfield_dimensionless_velocity;
  real_t* evolution_akifield_dimensionless_velocity;
  real_t* evolution_akjfield_dimensionless_velocity;
  real_t* evolution_initial_dimensionless_velocity;
  real_t* evolution_akafield_dimensionless_position;
  real_t* evolution_akbfield_dimensionless_position;
  real_t* evolution_akcfield_dimensionless_position;
  real_t* evolution_akdfield_dimensionless_position;
  real_t* evolution_akefield_dimensionless_position;
  real_t* evolution_akffield_dimensionless_position;
  real_t* evolution_akgfield_dimensionless_position;
  real_t* evolution_akhfield_dimensionless_position;
  real_t* evolution_akifield_dimensionless_position;
  real_t* evolution_akjfield_dimensionless_position;
  real_t* evolution_initial_dimensionless_position;

  real_t phi;
};

// ********************************************************
// FUNCTION PROTOTYPES
// ********************************************************
int ode_init(ode_workspace_t* workspace);
void ode_dest(ode_workspace_t* workspace);
void _dimensionless_velocity_initialise(ode_workspace_t* workspace);
void _dimensionless_position_initialise(ode_workspace_t* workspace);
int ode_run(int* zVec, real_t* tVec, real_t rep_time, real_t phi_in, int dim, ode_workspace_t* workspace, real_t* res);
void pi_pulse(bool breathing, bool neg, ode_workspace_t* workspace);
inline void evolution_calculate_delta_a(real_t _step, ode_workspace_t* workspace);
void evolution(real_t time_interval, ode_workspace_t* workspace);
real_t evolution_dimensionless_velocity_timestep_error(real_t* _checkfield, ode_workspace_t* workspace);
bool evolution_dimensionless_velocity_reset(real_t* _reset_to, ode_workspace_t* workspace);
real_t evolution_dimensionless_position_timestep_error(real_t* _checkfield, ode_workspace_t* workspace);
bool evolution_dimensionless_position_reset(real_t* _reset_to, ode_workspace_t* workspace);
void evolution_dimensionless_operators_evaluate_operator0(real_t _step, ode_workspace_t* workspace);


int ode_init(ode_workspace_t* workspace)
{
  workspace->velocity = (real_t*) xmds_malloc(sizeof(real_t) * _dimensionless_velocity_ncomponents);
  workspace->active_velocity = workspace->velocity;
  
  workspace->position = (real_t*) xmds_malloc(sizeof(real_t) * _dimensionless_position_ncomponents);
  workspace->active_position = workspace->position;

  workspace->evolution_akafield_dimensionless_velocity = (real_t*) xmds_malloc(sizeof(real_t) * _dimensionless_velocity_ncomponents);
  workspace->evolution_akbfield_dimensionless_velocity = (real_t*) xmds_malloc(sizeof(real_t) * _dimensionless_velocity_ncomponents);
  workspace->evolution_akcfield_dimensionless_velocity = (real_t*) xmds_malloc(sizeof(real_t) * _dimensionless_velocity_ncomponents);
  workspace->evolution_akdfield_dimensionless_velocity = (real_t*) xmds_malloc(sizeof(real_t) * _dimensionless_velocity_ncomponents);
  workspace->evolution_akefield_dimensionless_velocity = (real_t*) xmds_malloc(sizeof(real_t) * _dimensionless_velocity_ncomponents);
  workspace->evolution_akffield_dimensionless_velocity = (real_t*) xmds_malloc(sizeof(real_t) * _dimensionless_velocity_ncomponents);
  workspace->evolution_akgfield_dimensionless_velocity = (real_t*) xmds_malloc(sizeof(real_t) * _dimensionless_velocity_ncomponents);
  workspace->evolution_akhfield_dimensionless_velocity = (real_t*) xmds_malloc(sizeof(real_t) * _dimensionless_velocity_ncomponents);
  workspace->evolution_akifield_dimensionless_velocity = (real_t*) xmds_malloc(sizeof(real_t) * _dimensionless_velocity_ncomponents);
  workspace->evolution_akjfield_dimensionless_velocity = (real_t*) xmds_malloc(sizeof(real_t) * _dimensionless_velocity_ncomponents);
  workspace->evolution_initial_dimensionless_velocity = (real_t*) xmds_malloc(sizeof(real_t) * _dimensionless_velocity_ncomponents);
  workspace->evolution_akafield_dimensionless_position = (real_t*) xmds_malloc(sizeof(real_t) * _dimensionless_position_ncomponents);
  workspace->evolution_akbfield_dimensionless_position = (real_t*) xmds_malloc(sizeof(real_t) * _dimensionless_position_ncomponents);
  workspace->evolution_akcfield_dimensionless_position = (real_t*) xmds_malloc(sizeof(real_t) * _dimensionless_position_ncomponents);
  workspace->evolution_akdfield_dimensionless_position = (real_t*) xmds_malloc(sizeof(real_t) * _dimensionless_position_ncomponents);
  workspace->evolution_akefield_dimensionless_position = (real_t*) xmds_malloc(sizeof(real_t) * _dimensionless_position_ncomponents);
  workspace->evolution_akffield_dimensionless_position = (real_t*) xmds_malloc(sizeof(real_t) * _dimensionless_position_ncomponents);
  workspace->evolution_akgfield_dimensionless_position = (real_t*) xmds_malloc(sizeof(real_t) * _dimensionless_position_ncomponents);
  workspace->evolution_akhfield_dimensionless_position = (real_t*) xmds_malloc(sizeof(real_t) * _dimensionless_position_ncomponents);
  workspace->evolution_akifield_dimensionless_position = (real_t*) xmds_malloc(sizeof(real_t) * _dimensionless_position_ncomponents);
  workspace->evolution_akjfield_dimensionless_position = (real_t*) xmds_malloc(sizeof(real_t) * _dimensionless_position_ncomponents);
  workspace->evolution_initial_dimensionless_position = (real_t*) xmds_malloc(sizeof(real_t) * _dimensionless_position_ncomponents);

  // TODO: Check mem.

  return 0;
}

void ode_dest(ode_workspace_t* workspace)
{
  xmds_free(workspace->velocity);
  xmds_free(workspace->position);

  xmds_free(workspace->evolution_akafield_dimensionless_velocity);
  xmds_free(workspace->evolution_akbfield_dimensionless_velocity);
  xmds_free(workspace->evolution_akcfield_dimensionless_velocity);
  xmds_free(workspace->evolution_akdfield_dimensionless_velocity);
  xmds_free(workspace->evolution_akefield_dimensionless_velocity);
  xmds_free(workspace->evolution_akffield_dimensionless_velocity);
  xmds_free(workspace->evolution_akgfield_dimensionless_velocity);
  xmds_free(workspace->evolution_akhfield_dimensionless_velocity);
  xmds_free(workspace->evolution_akifield_dimensionless_velocity);
  xmds_free(workspace->evolution_akjfield_dimensionless_velocity);
  xmds_free(workspace->evolution_initial_dimensionless_velocity);
  xmds_free(workspace->evolution_akafield_dimensionless_position);
  xmds_free(workspace->evolution_akbfield_dimensionless_position);
  xmds_free(workspace->evolution_akcfield_dimensionless_position);
  xmds_free(workspace->evolution_akdfield_dimensionless_position);
  xmds_free(workspace->evolution_akefield_dimensionless_position);
  xmds_free(workspace->evolution_akffield_dimensionless_position);
  xmds_free(workspace->evolution_akgfield_dimensionless_position);
  xmds_free(workspace->evolution_akhfield_dimensionless_position);
  xmds_free(workspace->evolution_akifield_dimensionless_position);
  xmds_free(workspace->evolution_akjfield_dimensionless_position);
  xmds_free(workspace->evolution_initial_dimensionless_position);
}

// ********************************************************
// MAIN ROUTINE
// ********************************************************
int ode_run(int* zVec, real_t* tVec, real_t rep_time, real_t phi, int dim, ode_workspace_t* workspace, real_t* res)
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
    printf("tau[%d][0]=%lf\n",p,to_double(tau[2*p]));
  }
  
  qsort(tau,dim,sizeof(tau)/2,compare);
  
  for(p=0;p<dim;p++)
  {
    printf("tau[%d][0]=%lf, tau[%d][1]=%lf\n",p,to_double(tau[2*p]),p,to_double(tau[2*p+1]));
  }
  // **********************************************
    
  
  // Run-time validation checks
  if (tau[2*1 + 0] <= 0.0)
    _LOG(_ERROR_LOG_LEVEL, "ERROR: The interval for segment 2 is not positive!\n"
                           "Interval = %e\n", to_double(tau[2*1+0]));
  
  /* Code that actually does stuff goes here */
  workspace->t = 0.0;
  
  workspace->active_velocity = workspace->velocity;
  _dimensionless_velocity_initialise(workspace);
  workspace->active_position = workspace->position;
  _dimensionless_position_initialise(workspace);

  workspace->phi = phi;

  for(p=0;p<dim;p++)
  {

    if(p>0)
      evolution((tVec[p]-(((real_t)abs(zVec[p]))/2)*rep_time) - (tVec[p-1]+((real_t)(abs(zVec[p-1]))/2)*rep_time), workspace);

    for(j=0;j<abs(zVec[p]);j++)
    {
      cout << "Pulsing" << endl;
      pi_pulse(false, zVec[p] < 0, workspace);

      if(j < abs(zVec[p]) -1)
        evolution(rep_time, workspace);
    }
  }
  
  // Bing!
  _LOG(_SIMULATION_LOG_LEVEL, "\a");
  
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
void _dimensionless_velocity_initialise(ode_workspace_t* workspace)
{
  workspace->velocity[0]=0.0;
  workspace->velocity[1]=0.0;
}

// initialisation for vector position
void _dimensionless_position_initialise(ode_workspace_t* workspace)
{
  workspace->position[0]=(-initDisp);
  workspace->position[1]=(initDisp);
}

// ********************************************************
//   segment 1 (Filter) function implementations
void pi_pulse(bool breathing, bool neg, ode_workspace_t* workspace)
{
  if(neg)
  {
    workspace->velocity[0]-=k;
    workspace->velocity[1]-=breathing ? -k : k;
  }
  else
  {
    workspace->velocity[0]+=k;
    workspace->velocity[1]+=breathing ? -k : k;
  }
}

// ********************************************************
//   segment 2 (RK89 adaptive-step integrator) function implementations
inline void evolution_calculate_delta_a(real_t _step, ode_workspace_t* workspace)
{
  // Delta A propagation operator for field dimensionless
  evolution_dimensionless_operators_evaluate_operator0(_step, workspace);
}

void evolution(real_t time_interval, ode_workspace_t* workspace)
{
  real_t _step = (time_interval)/(real_t)100000000;
  real_t _old_step = _step;
  real_t _min_step = _step;
  real_t _max_step = _step;
  long _attempted_steps = 0;
  long _unsuccessful_steps = 0;
  
  real_t _tolerance = real_t("1e-25");
  
  real_t _error, _last_norm_error = 1.0;
  real_t evolution_dimensionless_velocity_error;
  real_t evolution_dimensionless_position_error;
  
  bool _discard = false;
  bool _break_next = false;
  bool _break = false;
  
  real_t _t_local = 0.0;
  real_t _t_break_next = time_interval;
  
  if ( (_t_local + _step)*(1.0 + _EPSILON) >= _t_break_next) {
    _break_next = true;
    _step = _t_break_next - _t_local;
  }
  
  real_t* _akafield_dimensionless_velocity = workspace->evolution_akafield_dimensionless_velocity;
  real_t* _akbfield_dimensionless_velocity = workspace->evolution_akbfield_dimensionless_velocity;
  real_t* _akcfield_dimensionless_velocity = workspace->evolution_akcfield_dimensionless_velocity;
  real_t* _akdfield_dimensionless_velocity = workspace->evolution_akdfield_dimensionless_velocity;
  real_t* _akefield_dimensionless_velocity = workspace->evolution_akefield_dimensionless_velocity;
  real_t* _akffield_dimensionless_velocity = workspace->evolution_akffield_dimensionless_velocity;
  real_t* _akgfield_dimensionless_velocity = workspace->evolution_akgfield_dimensionless_velocity;
  real_t* _akhfield_dimensionless_velocity = workspace->evolution_akhfield_dimensionless_velocity;
  real_t* _akifield_dimensionless_velocity = workspace->evolution_akifield_dimensionless_velocity;
  real_t* _akjfield_dimensionless_velocity = workspace->evolution_akjfield_dimensionless_velocity;
  real_t* _initial_dimensionless_velocity = workspace->evolution_initial_dimensionless_velocity;
  real_t* _akafield_dimensionless_position = workspace->evolution_akafield_dimensionless_position;
  real_t* _akbfield_dimensionless_position = workspace->evolution_akbfield_dimensionless_position;
  real_t* _akcfield_dimensionless_position = workspace->evolution_akcfield_dimensionless_position;
  real_t* _akdfield_dimensionless_position = workspace->evolution_akdfield_dimensionless_position;
  real_t* _akefield_dimensionless_position = workspace->evolution_akefield_dimensionless_position;
  real_t* _akffield_dimensionless_position = workspace->evolution_akffield_dimensionless_position;
  real_t* _akgfield_dimensionless_position = workspace->evolution_akgfield_dimensionless_position;
  real_t* _akhfield_dimensionless_position = workspace->evolution_akhfield_dimensionless_position;
  real_t* _akifield_dimensionless_position = workspace->evolution_akifield_dimensionless_position;
  real_t* _akjfield_dimensionless_position = workspace->evolution_akjfield_dimensionless_position;
  real_t* _initial_dimensionless_position = workspace->evolution_initial_dimensionless_position;

  real_t* _dimensionless_velocity = workspace->velocity;
  real_t* _dimensionless_position = workspace->position;
  
  do {
  
    do {
     
      // Step 1
      memcpy(_akafield_dimensionless_velocity, _dimensionless_velocity, sizeof(real_t) * _dimensionless_velocity_ncomponents);
      memcpy(_akafield_dimensionless_position, _dimensionless_position, sizeof(real_t) * _dimensionless_position_ncomponents);

      workspace->active_velocity = _akafield_dimensionless_velocity;
      workspace->active_position = _akafield_dimensionless_position;
      
      // a_k=G[a_k, t]
      evolution_calculate_delta_a(_step, workspace);
      
      // Step 2
      workspace->t += _a[1] * _step;
      
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
      
      workspace->active_velocity = _akbfield_dimensionless_velocity;
      workspace->active_position = _akbfield_dimensionless_position;
      
      // a_k=G[a_k, t]
      evolution_calculate_delta_a(_step, workspace);
      
      // Step 3
      workspace->t += _a[2] * _step;
      
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
      
      workspace->active_velocity = _akcfield_dimensionless_velocity;
      workspace->active_position = _akcfield_dimensionless_position;
      
      // a_k=G[a_k, t]
      evolution_calculate_delta_a(_step, workspace);
      
      // Step 4
      workspace->t += _a[3] * _step;
      
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
      
      workspace->active_velocity = _akdfield_dimensionless_velocity;
      workspace->active_position = _akdfield_dimensionless_position;
      
      // a_k=G[a_k, t]
      evolution_calculate_delta_a(_step, workspace);
      
      // Step 5
      workspace->t += _a[4] * _step;
      
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
      
      workspace->active_velocity = _akefield_dimensionless_velocity;
      workspace->active_position = _akefield_dimensionless_position;
      
      // a_k=G[a_k, t]
      evolution_calculate_delta_a(_step, workspace);
      
      // Step 6
      workspace->t += _a[5] * _step;
      
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
      
      workspace->active_velocity = _akifield_dimensionless_velocity;
      workspace->active_position = _akifield_dimensionless_position;
      
      // a_k=G[a_k, t]
      evolution_calculate_delta_a(_step, workspace);
      
      // Step 7
      workspace->t += _a[6] * _step;
      
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
      
      workspace->active_velocity = _akjfield_dimensionless_velocity;
      workspace->active_position = _akjfield_dimensionless_position;
      
      // a_k=G[a_k, t]
      evolution_calculate_delta_a(_step, workspace);
      
      // Step 8
      workspace->t += _a[7] * _step;
      
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
      
      workspace->active_velocity = _akbfield_dimensionless_velocity;
      workspace->active_position = _akbfield_dimensionless_position;
      
      // a_k=G[a_k, t]
      evolution_calculate_delta_a(_step, workspace);
      
      // Step 9
      workspace->t += _a[8] * _step;
      
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
      
      workspace->active_velocity = _akcfield_dimensionless_velocity;
      workspace->active_position = _akcfield_dimensionless_position;
      
      // a_k=G[a_k, t]
      evolution_calculate_delta_a(_step, workspace);
      
      // Step 10
      workspace->t += _a[9] * _step;
      
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
      
      workspace->active_velocity = _akdfield_dimensionless_velocity;
      workspace->active_position = _akdfield_dimensionless_position;
      
      // a_k=G[a_k, t]
      evolution_calculate_delta_a(_step, workspace);
      
      // Step 11
      workspace->t += _a[10] * _step;
      
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
      
      workspace->active_velocity = _akefield_dimensionless_velocity;
      workspace->active_position = _akefield_dimensionless_position;
      
      // a_k=G[a_k, t]
      evolution_calculate_delta_a(_step, workspace);
      
      // Step 12
      workspace->t += _a[11] * _step;
      
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
      
      workspace->active_velocity = _akffield_dimensionless_velocity;
      workspace->active_position = _akffield_dimensionless_position;
      
      // a_k=G[a_k, t]
      evolution_calculate_delta_a(_step, workspace);
      
      // Step 13
      workspace->t += _a[12] * _step;
      
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
      
      workspace->active_velocity = _akgfield_dimensionless_velocity;
      workspace->active_position = _akgfield_dimensionless_position;
      
      // a_k=G[a_k, t]
      evolution_calculate_delta_a(_step, workspace);
      
      // Step 14
      workspace->t += _a[13] * _step;
      
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
      
      workspace->active_velocity = _akhfield_dimensionless_velocity;
      workspace->active_position = _akhfield_dimensionless_position;
      
      // a_k=G[a_k, t]
      evolution_calculate_delta_a(_step, workspace);
      
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
      
      workspace->t += _a[14] * _step;
      
      workspace->active_velocity = _akifield_dimensionless_velocity;
      workspace->active_position = _akifield_dimensionless_position;
      
      // a_k=G[a_k, t]
      evolution_calculate_delta_a(_step, workspace);
      
      workspace->t += _a[15] * _step;
      
      workspace->active_velocity = _akjfield_dimensionless_velocity;
      workspace->active_position = _akjfield_dimensionless_position;
      
      // a_k=G[a_k, t]
      evolution_calculate_delta_a(_step, workspace);
      
      // Take full step
      // ai = a
      memcpy(_initial_dimensionless_velocity, _dimensionless_velocity, sizeof(real_t) * _dimensionless_velocity_ncomponents);
      memcpy(_initial_dimensionless_position, _dimensionless_position, sizeof(real_t) * _dimensionless_position_ncomponents);
      
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
      
      workspace->active_velocity = _dimensionless_velocity;
      workspace->active_position = _dimensionless_position;
      
      _error = 0.0;
      
      evolution_dimensionless_velocity_error = evolution_dimensionless_velocity_timestep_error(_akafield_dimensionless_velocity,workspace);
      if (evolution_dimensionless_velocity_error > _error)
        _error = evolution_dimensionless_velocity_error;
      
      evolution_dimensionless_position_error = evolution_dimensionless_position_timestep_error(_akafield_dimensionless_position,workspace);
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
        workspace->t -= _step;
  
        if (evolution_dimensionless_velocity_reset(_initial_dimensionless_velocity, workspace) == false) {
  
          _LOG(_WARNING_LOG_LEVEL, "WARNING: NaN present. Integration halted at t = %e.\n"
                             "         Non-finite number in integration vector \"velocity\" in segment 2.\n", to_double(workspace->t));
          
          goto _SEGMENT2_END;
        }
        if (evolution_dimensionless_position_reset(_initial_dimensionless_position, workspace) == false) {
  
          _LOG(_WARNING_LOG_LEVEL, "WARNING: NaN present. Integration halted at t = %e.\n"
                             "         Non-finite number in integration vector \"position\" in segment 2.\n", to_double(workspace->t));
          
          goto _SEGMENT2_END;
        }
        
        _discard = true;
        _break_next = false;
        _unsuccessful_steps++;
      }
      
      _old_step = _step;
      
      // Resize step
      if (_error < 0.5*_tolerance || _error > _tolerance) {
        const real_t _safetyFactor = 0.90;
        real_t _scalingFactor = _safetyFactor * pow(abs(_error/_tolerance), real_t(-0.7/9.0)) * pow(_last_norm_error, real_t(0.4/9.0));
        _scalingFactor = MAX(_scalingFactor, 1.0/5.0);
        _scalingFactor = MIN(_scalingFactor, 7.0);
        if (_error > _tolerance && _scalingFactor > 1.0) {
          // If our step failed don't try and increase our step size. That would be silly.
          _scalingFactor = _safetyFactor * pow(abs(_error/_tolerance), real_t(-1.0/9.0));
        }
        _old_step = _step;
        _last_norm_error = pow(_safetyFactor/_scalingFactor*pow(_last_norm_error, real_t(0.4/9.0)), real_t(9.0/0.7));
        _step *= _scalingFactor;
      }
      
    } while (_discard);
    
    if (_break_next) {
      _break = true;
    }
    
    if ( (_t_local + _step)*(1.0 + _EPSILON) > _t_break_next) {
      _break_next = true;
      _LOG(_SAMPLE_LOG_LEVEL, "Current timestep: %e\n", to_double(_old_step));
      _step = _t_break_next - _t_local;
    }
  } while (!_break);
  
  _SEGMENT2_END:;

  _LOG(_SEGMENT_LOG_LEVEL, "Segment 2: minimum timestep: %e maximum timestep: %e\n", to_double(_min_step), to_double(_max_step));
  _LOG(_SEGMENT_LOG_LEVEL, "  Attempted %li steps, %.2f%% steps failed.\n", _attempted_steps, (100.0*_unsuccessful_steps)/_attempted_steps);

  cout << "Positions: " << endl;
  cout << to_out_string(workspace->position[0],10) << endl;
  cout << to_out_string(workspace->position[1],10) << endl;

  cout << "Velocities: " << endl;
  cout << to_out_string(workspace->velocity[0],10) << endl;
  cout << to_out_string(workspace->velocity[1],10) << endl;
}

real_t evolution_dimensionless_velocity_timestep_error(real_t* _checkfield, ode_workspace_t* workspace)
{
  real_t _error = get_epsilon<real_t>();
  real_t _temp_error = con_fun<real_t>("0.0");
  real_t _temp_mod = con_fun<real_t>("0.0");
 
  for (long  _i1 = 0; _i1 < _dimensionless_velocity_ncomponents; _i1++) {
    _temp_error = abs(workspace->velocity[_i1] - _checkfield[_i1]) / (0.5*abs(workspace->velocity[_i1]) + 0.5*abs(_checkfield[_i1]));
    
    if (_xmds_isnonfinite(_temp_error)) {
      /* For _temp_error to be NaN, both the absolute value of the higher and lower order solutions
          must BOTH be zero. This therefore implies that their difference is zero, and that there is no error. */
      _temp_error = 0.0;
    }
    
    if (_error < _temp_error) // UNVECTORISABLE
      _error = _temp_error;
  }
    
  return _error;
}

bool evolution_dimensionless_velocity_reset(real_t* _reset_to_dimensionless_velocity, ode_workspace_t* workspace)
{
  memcpy(workspace->velocity, _reset_to_dimensionless_velocity, sizeof(real_t) * _dimensionless_velocity_ncomponents);
  
  /* return false if there's a NaN somewhere in the vector, otherwise return true */
  bool bNoNaNsPresent = true;

  for (long _i1 = 0; _i1 < _dimensionless_velocity_ncomponents; _i1++) {
    if (_xmds_isnonfinite(workspace->velocity[_i1])) bNoNaNsPresent = false;
  }

  return bNoNaNsPresent;
}

real_t evolution_dimensionless_position_timestep_error(real_t* _checkfield, ode_workspace_t* workspace)
{
  real_t _error = get_epsilon<real_t>();
  real_t _temp_error = con_fun<real_t>("0.0");
  real_t _temp_mod = con_fun<real_t>("0.0");

  for (long  _i1 = 0; _i1 < _dimensionless_position_ncomponents; _i1++) {
    _temp_error = abs(workspace->position[_i1] - _checkfield[_i1]) / (0.5*abs(workspace->position[_i1]) + 0.5*abs(_checkfield[_i1]));
    
    if (_xmds_isnonfinite(_temp_error)) {
      /* For _temp_error to be NaN, both the absolute value of the higher and lower order solutions
          must BOTH be zero. This therefore implies that their difference is zero, and that there is no error. */
      _temp_error = 0.0;
    }
    
    if (_error < _temp_error) // UNVECTORISABLE
      _error = _temp_error;
  }

  return _error;
}

bool evolution_dimensionless_position_reset(real_t* _reset_to_dimensionless_position, ode_workspace_t* workspace)
{
  memcpy(workspace->position, _reset_to_dimensionless_position, sizeof(real_t) * _dimensionless_position_ncomponents);
  
  /* return false if there's a NaN somewhere in the vector, otherwise return true */
  bool bNoNaNsPresent = true;

  for (long _i1 = 0; _i1 < _dimensionless_position_ncomponents; _i1++) {
    if (_xmds_isnonfinite(workspace->position[_i1])) bNoNaNsPresent = false;
  }

  return bNoNaNsPresent;
}

// Delta A propagation operator for field dimensionless
void evolution_dimensionless_operators_evaluate_operator0(real_t _step, ode_workspace_t* workspace)
{
  #define v1 workspace->active_velocity[0]
  #define v2 workspace->active_velocity[1]
  #define x1 workspace->active_position[0]
  #define x2 workspace->active_position[1]
  #define t workspace->t
  #define phi workspace->phi
  real_t dx2_dt;
  real_t dv1_dt;
  real_t dv2_dt;
  real_t dx1_dt;
  
  // ************* Propagation code ***************
  dx1_dt = v1;
  dx2_dt = v2;
  dv1_dt = -coulomb/(delta+x2-x1) - trap*(a - 2*q*cos(wrf*(t)+phi))*x1;
  dv2_dt = coulomb/(delta+x2-x1) - trap*(a - 2*q*cos(wrf*(t)+phi))*x2;

  //dv1_dt = - trap*(a - 2*q*cos(wrf*t+phi))*x1;
  //dv2_dt = - trap*(a - 2*q*cos(wrf*t+phi))*x2;
  // **********************************************

  x2 = dx2_dt * _step;
  v1 = dv1_dt * _step;
  v2 = dv2_dt * _step;
  x1 = dx1_dt * _step;
  #undef t
  #undef v1
  #undef v2
  #undef x1
  #undef x2
  #undef phi
}
