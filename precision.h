#pragma once

#include <complex>
#include <cmath>
#include <float.h>
#ifdef USE_MPI
#include <mpi.h>
#endif
#include <arprec/mp_real.h>
#include <arprec/mp_complex.h>
#include <qd/dd_real.h>
#include <qd/qd_real.h>
#include <sstream>
#include <iomanip>
#include <quadmath.h>

#ifndef NINTELLISENSE
#define __float128 double
#endif

template<typename floatval_t>
inline floatval_t con_fun(const char* str);

template<>
inline float con_fun<float>(const char* str) { return atof(str); }
template<>
inline double con_fun<double>(const char* str) { return atof(str); }
template<>
inline __float128 con_fun<__float128>(const char* str) { return strtoflt128(str, NULL); }
template<>
inline qd_real con_fun<qd_real>(const char* str) { return qd_real(str);  }
template<>
inline mp_real con_fun<mp_real>(const char* str) { return mp_real(str);  }

/**
 * 	Machine epsilon definition for various precisions.
 * 
 */
template<typename floatval_t>
inline floatval_t get_epsilon();

template<>
inline float get_epsilon<float>() { return std::numeric_limits<float>::epsilon(); }
template<>
inline double get_epsilon<double>() { return std::numeric_limits<double>::epsilon(); }
template<>
inline __float128 get_epsilon<__float128>() { return std::numeric_limits<__float128>::epsilon(); }
template<>
inline qd_real get_epsilon<qd_real>() { return std::numeric_limits<qd_real>::epsilon(); }
template<>
inline mp_real get_epsilon<mp_real>() { return static_cast<mp_real>(0.0); }


/**
 * 	CONVEPS definition for various precisions.
 * 
 */
template<typename floatval_t>
inline floatval_t get_conv_epsilon();

template<>
inline float get_conv_epsilon<float>() { return 1e-4; }
template<>
inline double get_conv_epsilon<double>() { return 1e-8; }
template<>
inline __float128 get_conv_epsilon<__float128>() { return con_fun<__float128>("1e-16q"); }
template<>
inline qd_real get_conv_epsilon<qd_real>() { return qd_real("1e-30"); }
template<>
inline mp_real get_conv_epsilon<mp_real>() { return mp_real("1e-60"); }

/**
 * 	DELTA definition for various precisions.
 * 
 */
template<typename floatval_t>
inline floatval_t get_delta();

template<>
inline float get_delta<float>() { return 1e-4; }
template<>
inline double get_delta<double>() { return 1e-8; }
template<>
inline __float128 get_delta<__float128>() { return con_fun<__float128>("1e-16"); }
template<>
inline qd_real get_delta<qd_real>() { return qd_real("1e-30"); }
template<>
inline mp_real get_delta<mp_real>() { return mp_real("1e-60"); }

/**
 * 	Gradient step definition for various precisions.
 * 
 */
template<typename floatval_t>
inline floatval_t get_gstep();

template<>
inline float get_gstep<float>() { return 1e-5; }
template<>
inline double get_gstep<double>() { return 1e-8; }
template<>
inline __float128 get_gstep<__float128>() { return con_fun<__float128>("1e-12"); }
template<>
inline qd_real get_gstep<qd_real>() { return qd_real("1e-24"); }
template<>
inline mp_real get_gstep<mp_real>() { return mp_real("1e-50"); }

/**
 * 	Minimum step definition for various precisions.
 * 
 */
template<typename floatval_t>
inline floatval_t get_min_step();

template<>
inline float get_min_step<float>() { return 1.0e-10; }
template<>
inline double get_min_step<double>() { return 1.0e-20; }
template<>
inline __float128 get_min_step<__float128>() { return con_fun<__float128>("1e-40"); }
template<>
inline qd_real get_min_step<qd_real>() { return qd_real("1.0e-80"); }
template<>
inline mp_real get_min_step<mp_real>() { return mp_real("1.0e-160"); }

/**
 * 	Maximum step definition for various precisions.
 * 
 */
template<typename floatval_t>
inline floatval_t get_max_step();

template<>
inline float get_max_step<float>() { return 1e20; }
template<>
inline double get_max_step<double>() { return 1e20; }
template<>
inline __float128 get_max_step<__float128>() { return con_fun<__float128>("1e20"); }
template<>
inline qd_real get_max_step<qd_real>() { return qd_real(1e20); }
template<>
inline mp_real get_max_step<mp_real>() { return mp_real(1e20); }


/**
 * 	Maximum step definition for various precisions.
 * 
 */
template<typename floatval_t>
inline std::string to_out_string(floatval_t a, const int nDigs);

template<>
inline std::string to_out_string<float>( float a, const int nDigs) { std::ostringstream streamObj; streamObj << std::setprecision(nDigs) << a; return streamObj.str(); }
template<>
inline std::string to_out_string<double>( double a, const int nDigs) { std::ostringstream streamObj; streamObj << std::setprecision(nDigs) << a; return streamObj.str();  }
template<>
inline std::string to_out_string<__float128>( __float128 a, const int nDigs) 
{ 
	std::string retStr;
	int n = quadmath_snprintf (NULL, 0, "%+-#46.*Qe", nDigs, a);
	if (n > -1)
    {
		char *str = (char*)malloc(n + 1);
		if (str)
		{
          quadmath_snprintf (str, n + 1, "%+-#46.*Qe", nDigs, a);
        }
		retStr = std::string(str);
		free (str);
    }
	
	return retStr; 
}
template<>
inline std::string to_out_string<qd_real>( qd_real a, const int nDigs) { return a.to_string(nDigs, 0, std::ios_base::scientific); }
template<>
inline std::string to_out_string<mp_real>( mp_real a, const int nDigs) { return a.to_string(nDigs, 0, 0, std::ios_base::scientific); }


/*
typedef __float128 floatval_t;
typedef std::complex<floatval_t> mycomplex;
#define EPS     floatval_t("1e-31")
#define GSTEP   floatval_t("1e-8")
#define MINSTEP floatval_t("1e-20")
#define MAXSTEP floatval_t("1e20")
#define CONVEPS floatval_t("1e-18")
#define DELTA   floatval_t("1e-18")
#define XTOL    floatval_t("1e-25")
#define TOL     floatval_t("1e-25")
#ifdef USE_MPI
static int floatval_t_MPI_Datatype(MPI_Datatype* dType) {
    int err;
	int blockLengths[1] = {2};
	MPI_Aint blockDisplacements[1] = {static_cast<MPI_Aint>(0)};
	MPI_Datatype blockTypes[1] = {MPI_DOUBLE};
    err = MPI_Type_struct(1, blockLengths, blockDisplacements, blockTypes, dType);
    return err;
}
#endif
*/


/*
typedef qd_real floatval_t;
typedef std::complex<floatval_t> mycomplex;
#define EPS     floatval_t("1e-35")
#define GSTEP   floatval_t("1e-10")
#define MINSTEP floatval_t("1e-25")
#define MAXSTEP floatval_t("4e-1")
#define CONVEPS floatval_t("1e-18")
#define DELTA   floatval_t("1e-18")
#define XTOL    floatval_t("1e-30")
#define TOL     floatval_t("1e-10")
#ifdef USE_MPI
inline static int __float128::MPI_Datatype(MPI_Datatype* dType) {
	int err;
	int blockLengths[1] = {4};
	MPI_Aint blockDisplacements[1] = {static_cast<MPI_Aint>(0)};
	MPI_Datatype blockTypes[1] = {MPI_DOUBLE};
	err = MPI_Type_struct(1, blockLengths, blockDisplacements, blockTypes, dType);
	return err;
}
#endif
*/

/*
typedef mp_real floatval_t;
typedef mp_complex mycomplex;
#define USEMP 1
#define NDIGITS	50
#define EPS     floatval_t("1e-40")
#define MINSTEP floatval_t("1e-30")
#define MAXSTEP floatval_t("1e30")
#define CONVEPS floatval_t("1e-25")
#define DELTA   floatval_t("1e-25")
#define XTOL    floatval_t("1e-25")
*/

// TODO: Add the rest of the function wrappers
inline __float128 acosq(__float128 a) { return acosq(a); };
inline __float128 cos(__float128 a) { return cosq(a); };
inline __float128 sin(__float128 a) { return sinq(a); };
inline __float128 fabs(__float128 a) { return fabsq(a); };
inline int fabs(int a) { return std::fabs(a); };
//inline __float128 abs(__float128 a) { return fabsq(a); };

inline __float128 ceil(__float128 a) { return ceilq(a); };
inline __float128 floor(__float128 a) { return floorq(a); };

inline __float128 pow(__float128 a, __float128 b) { return powq(a, b); };
inline __float128 pow(__float128 a, int b) { return powq(a, b); };

inline __float128 log10(__float128 a) { return log10q(a); };

inline __float128 sqrt(__float128 a) { return sqrtq(a); };

 

inline int to_int(__float128 a) { return rintq(a); };

template <typename floatval_t>
inline floatval_t rnd_uni()
{
    return ((floatval_t)rand()) / RAND_MAX;
}

 
//__float128 rand128() {
	/* = 2^{-31} */
//  static const double m_const = 4.6566128730773926e-10;  
//  double m = m_const;
//  __float128 r = 0.0;
//  double d;

  /* Strategy:  Generate 31 bits at a time, using lrand48
     random number generator.  Shift the bits, and reapeat
     4 times. */

//  for (int i = 0; i < 4; i++, m *= m_const) {
//    d = lrand48() * m;
//    d = std::rand() * m;
//    r += d;
//  }

//  return r;
//} 
