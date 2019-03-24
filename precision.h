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
inline dd_real get_epsilon<dd_real>() { return std::numeric_limits<dd_real>::epsilon(); }
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
inline float get_conv_epsilon<float>() { return 1e-5; }
template<>
inline double get_conv_epsilon<double>() { return 1e-10; }
template<>
inline dd_real get_conv_epsilon<dd_real>() { return dd_real("1e-16"); }
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
inline float get_delta<float>() { return 1e-5; }
template<>
inline double get_delta<double>() { return 1e-10; }
template<>
inline dd_real get_delta<dd_real>() { return dd_real("1e-16"); }
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
inline float get_gstep<float>() { return 1e-2; }
template<>
inline double get_gstep<double>() { return 1e-4; }
template<>
inline dd_real get_gstep<dd_real>() { return dd_real("1e-8"); }
template<>
inline qd_real get_gstep<qd_real>() { return qd_real("1e-16"); }
template<>
inline mp_real get_gstep<mp_real>() { return mp_real("1e-32"); }

/**
 * 	Minimum step definition for various precisions.
 * 
 */
template<typename floatval_t>
inline floatval_t get_min_step();

template<>
inline float get_min_step<float>() { return 1e-6; }
template<>
inline double get_min_step<double>() { return 1e-14; }
template<>
inline dd_real get_min_step<dd_real>() { return dd_real("1e-28"); }
template<>
inline qd_real get_min_step<qd_real>() { return qd_real("1e-56"); }
template<>
inline mp_real get_min_step<mp_real>() { return mp_real("1e-112"); }

/**
 * 	Maximum step definition for various precisions.
 * 
 */
template<typename floatval_t>
inline floatval_t get_max_step();

template<>
inline float get_max_step<float>() { return 1e7; }
template<>
inline double get_max_step<double>() { return 1e7; }
template<>
inline dd_real get_max_step<dd_real>() { return dd_real(1e7); }
template<>
inline qd_real get_max_step<qd_real>() { return qd_real(1e7); }
template<>
inline mp_real get_max_step<mp_real>() { return mp_real(1e7); }


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
inline std::string to_out_string<dd_real>( dd_real a, const int nDigs) { return a.to_string(nDigs, 0, std::ios_base::scientific); }
template<>
inline std::string to_out_string<qd_real>( qd_real a, const int nDigs) { return a.to_string(nDigs, 0, std::ios_base::scientific); }
template<>
inline std::string to_out_string<mp_real>( mp_real a, const int nDigs) { return a.to_string(nDigs, 0, 0, std::ios_base::scientific); }


/*
typedef dd_real floatval_t;
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
inline static int dd_real::MPI_Datatype(MPI_Datatype* dType) {
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

template <typename floatval_t>
inline floatval_t rnd_uni()
{
    return ((floatval_t)rand()) / RAND_MAX;
}