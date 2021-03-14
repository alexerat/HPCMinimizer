# 1 "test.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "test.c"
# 64 "test.c"
static double lbgfs_evaluate_1_double( const double *X, const double *params, double *g, const int n, const double step ) { double* batch_x; double fx = 0.; double fx_sum = 0.; double* g_sum; for(int i=0;i<n;i++) { g[i] = 0.; } fx = FUNCTION1(X, params); DERIVATIVES1(g, X, params, fx, step); if(fx < 0.0) cout << "The cost function was negative!" << endl; return fx; }



# 1 "preprocessor_trickery.h" 1
# 69 "test.c" 2



static double lbgfs_evaluate_0_double( const double *X, const double *params, double *g, const int n, const double step ) { double* batch_x; double fx = 0.; double fx_sum = 0.; double* g_sum; for(int i=0;i<n;i++) { g[i] = 0.; } fx = FUNCTION0(X, params); DERIVATIVES0(g, X, params, fx, step); if(fx < 0.0) cout << "The cost function was negative!" << endl; return fx; } static double lbgfs_evaluate_1_double( const double *X, const double *params, double *g, const int n, const double step ) { double* batch_x; double fx = 0.; double fx_sum = 0.; double* g_sum; for(int i=0;i<n;i++) { g[i] = 0.; } fx = FUNCTION1(X, params); DERIVATIVES1(g, X, params, fx, step); if(fx < 0.0) cout << "The cost function was negative!" << endl; return fx; }
