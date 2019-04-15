#ifdef ROBUST
#define IFDEF_ROBUST(...) __VA_ARGS__
#define IFDEF_NROBUST(...)
#else
#define IFDEF_ROBUST(...)
#define IFDEF_NROBUST(...) __VA_ARGS__
#endif


#define lbgfs_code(NUM,floatval_t) static floatval_t lbgfs_evaluate_##NUM##_##floatval_t( \
	const floatval_t *X, \
	const floatval_t *params, \
	floatval_t *g, \
	const int n, \
	const floatval_t step \
	) \
{ \
	floatval_t* batch_x; \
	floatval_t fx = 0.; \
	floatval_t fx_sum = 0.; \
	floatval_t* g_sum; \
	for(int i=0;i<n;i++) \
	{ \
		g[i] = 0.; \
	} \
	IFDEF_ROBUST( \
		batch_x = new floatval_t[DIM]; \
		g_sum = new floatval_t[DIM]; \
		for(int i=0;i<n;i++) \
		{ \
			g_sum[i] = 0.; \
		} \
		for(int i=0;i<SAMPLES;i++) \
		{ \
			for(int j=0;j<n;j++) \
			{ \
				batch_x[j] = X[j] + NOISE * ((floatval_t)rand() / RAND_MAX - 0.5); \
			} \
			fx = FUNCTION##NUM(batch_x, params); \
			DERIVATIVES##NUM(g, batch_x, params, fx, step); \
			for(int j=0;j<n;j++) \
			{ \
				g_sum[j] += g[j]; \
			} \
			fx_sum += fx; \
		} \
		fx = fx_sum / SAMPLES; \
		for(int i=0;i<n;i++) \
		{ \
			g[i] = g_sum[i] / SAMPLES; \
		} \
		delete[] batch_x; \
		delete[] g_sum; \
	) \
	IFDEF_NROBUST( \
		fx = FUNCTION##NUM(X, params); \
		DERIVATIVES##NUM(g, X, params, fx, step); \
	) \
	if(fx < 0.0) \
		cout << "The cost function was negative!" << endl; \
	return fx; \
}

lbgfs_code(1,double)


#define STAGELIST 1,2,3,4,5
#include "preprocessor_trickery.h"

//An example of using this macro
#define M(i, _) lbgfs_code(i,double)
EVAL_PP(REPEAT_PP(2, M, ~)) // 0 1 2 3 4 5 6 7

/*
#define WITH(...) lbgfs_code_(PP_NEXTARG(__VA_ARGS__)) OBSTRUCT(WITH_) () \
   (PP_REMARG(__VA_ARGS__)),__VA_ARGS__

#define WITH_() WITH*/