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

#ifdef USEMP
	#define to_out_string(digits) to_string(digits, 0, 0, std::ios_base::scientific)
#else
    #define to_out_string(digits) to_string(digits, 0, std::ios_base::scientific)
#endif

inline floatval_t rnd_uni()
{
    return ((floatval_t)rand()) / RAND_MAX;
}
