/*
 *      Limited memory BFGS (L-BFGS).
 *
 * Copyright (c) 1990, Jorge Nocedal
 * Copyright (c) 2007-2010 Naoaki Okazaki
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

/* $Id$ */

/*
This library is a C port of the FORTRAN implementation of Limited-memory
Broyden-Fletcher-Goldfarb-Shanno (L-BFGS) method written by Jorge Nocedal.
The original FORTRAN source code is available at:
http://www.ece.northwestern.edu/~nocedal/lbfgs.html

The L-BFGS algorithm is described in:
    - Jorge Nocedal.
      Updating Quasi-Newton Matrices with Limited Storage.
      <i>Mathematics of Computation</i>, Vol. 35, No. 151, pp. 773--782, 1980.
    - Dong C. Liu and Jorge Nocedal.
      On the limited memory BFGS method for large scale optimization.
      <i>Mathematical Programming</i> B, Vol. 45, No. 3, pp. 503-528, 1989.

The line search algorithms used in this implementation are described in:
    - John E. Dennis and Robert B. Schnabel.
      <i>Numerical Methods for Unconstrained Optimization and Nonlinear
      Equations</i>, Englewood Cliffs, 1983.
    - Jorge J. More and David J. Thuente.
      Line search algorithm with guaranteed sufficient decrease.
      <i>ACM Transactions on Mathematical Software (TOMS)</i>, Vol. 20, No. 3,
      pp. 286-307, 1994.

This library also implements Orthant-Wise Limited-memory Quasi-Newton (OWL-QN)
method presented in:
    - Galen Andrew and Jianfeng Gao.
      Scalable training of L1-regularized log-linear models.
      In <i>Proceedings of the 24th International Conference on Machine
      Learning (ICML 2007)</i>, pp. 33-40, 2007.

I would like to thank the original author, Jorge Nocedal, who has been
distributing the effieicnt and explanatory implementation in an open source
licence.
*/
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <cmath>


#include "lbfgs.h"
#include "arithmetic_ansi.h"


#define min2(a, b)      ((a < b) ? (a) : (b))
#define max2(a, b)      ((b < a) ? (a) : (b))
#define max3(a, b, c)   max2(max2((a), (b)), (c));

using std::cout;
using std::cerr;
using std::endl;

/* Forward function declarations. */

template int lbfgs<double>(int n,double *x,double *ptr_fx,double *lowerbounds,double *upperbounds,double *extparams, double *precomps,lbfgs_evaluate_t<double> proc_evaluate,lbfgs_progress_t<double> proc_progress,lbfgs_wspace_t<double> *wspace);
template int lbfgs<dd_real>(int n,dd_real *x,dd_real *ptr_fx,dd_real *lowerbounds,dd_real *upperbounds,dd_real *extparams, dd_real *precomps,lbfgs_evaluate_t<dd_real> proc_evaluate,lbfgs_progress_t<dd_real> proc_progress,lbfgs_wspace_t<dd_real> *wspace);
//template int lbfgs<qd_real>(int n,qd_real *x,qd_real *ptr_fx,qd_real *lowerbounds,qd_real *upperbounds,qd_real *extparams, qd_real *precomps,lbfgs_evaluate_t<qd_real> proc_evaluate,lbfgs_progress_t<qd_real> proc_progress,lbfgs_wspace_t<qd_real> *wspace);
//template int lbfgs<mp_real>(int n,mp_real *x,mp_real *ptr_fx,mp_real *lowerbounds,mp_real *upperbounds,mp_real *extparams, mp_real *precomps,lbfgs_evaluate_t<mp_real> proc_evaluate,lbfgs_progress_t<mp_real> proc_progress,lbfgs_wspace_t<mp_real> *wspace);

template int lbfgs_init<double>(int n, lbfgs_wspace_t<double> *wspace, lbfgs_parameter_t<double> *param);
template int lbfgs_init<dd_real>(int n, lbfgs_wspace_t<dd_real> *wspace, lbfgs_parameter_t<dd_real> *param);
//template int lbfgs_init<qd_real>(int n, lbfgs_wspace_t<qd_real> *wspace, lbfgs_parameter_t<qd_real> *param);
//template int lbfgs_init<mp_real>(int n, lbfgs_wspace_t<mp_real> *wspace, lbfgs_parameter_t<mp_real> *param);

template int lbfgs_dest<double>(lbfgs_wspace_t<double> *x);
template int lbfgs_dest<dd_real>(lbfgs_wspace_t<dd_real> *x);
//template int lbfgs_dest<qd_real>(lbfgs_wspace_t<qd_real> *x);
//template int lbfgs_dest<mp_real>(lbfgs_wspace_t<mp_real> *x);

template <typename floatval_t>
static int line_search_backtracking(
    int n,
    floatval_t *x,
    floatval_t *extparams,
    floatval_t *precomps,
    floatval_t *lbounds,
    floatval_t *ubounds,
    floatval_t *f,
    floatval_t *g,
    floatval_t *s,
    floatval_t *stp,
    const floatval_t* xp,
    const floatval_t* gp,
    floatval_t *wa,
    callback_data_t<floatval_t> *cd,
    const lbfgs_parameter_t<floatval_t> *param
    );

template <typename floatval_t>
static int line_search_backtracking_owlqn(
    int n,
    floatval_t *x,
    floatval_t *extparams,
    floatval_t *precomps,
    floatval_t *lbounds,
    floatval_t *ubounds,
    floatval_t *f,
    floatval_t *g,
    floatval_t *s,
    floatval_t *stp,
    const floatval_t* xp,
    const floatval_t* gp,
    floatval_t *wp,
    callback_data_t<floatval_t> *cd,
    const lbfgs_parameter_t<floatval_t> *param
    );

template <typename floatval_t>
static int line_search_morethuente(
    int n,
    floatval_t *x,
    floatval_t *extparams,
    floatval_t *precomps,
    floatval_t *lbounds,
    floatval_t *ubounds,
    floatval_t *f,
    floatval_t *g,
    floatval_t *s,
    floatval_t *stp,
    const floatval_t* xp,
    const floatval_t* gp,
    floatval_t *wa,
    callback_data_t<floatval_t> *cd,
    const lbfgs_parameter_t<floatval_t> *param
    );

template <typename floatval_t>
static int update_trial_interval(
    floatval_t *x,
    floatval_t *fx,
    floatval_t *dx,
    floatval_t *y,
    floatval_t *fy,
    floatval_t *dy,
    floatval_t *t,
    floatval_t *ft,
    floatval_t *dt,
    const floatval_t tmin,
    const floatval_t tmax,
    int *brackt,
    const floatval_t EPS
    );

template <typename floatval_t>
static floatval_t owlqn_x1norm(
    const floatval_t* x,
    const int start,
    const int n
    );

template <typename floatval_t>
static void owlqn_pseudo_gradient(
    floatval_t* pg,
    const floatval_t* x,
    const floatval_t* g,
    const int n,
    const floatval_t c,
    const int start,
    const int end, 
    const floatval_t EPS
    );

template <typename floatval_t>
static void owlqn_project(
    floatval_t* d,
    const floatval_t* sign,
    const int start,
    const int end,
    const floatval_t EPS
    );

template <typename floatval_t>
int lbfgs_init(int n, lbfgs_wspace_t<floatval_t> *wspace, lbfgs_parameter_t<floatval_t> *_param)
{
    //cout << "Entered lbfgs initialization." << endl;

    iteration_data_t<floatval_t> *it = NULL;
    lbfgs_parameter_t<floatval_t> defparam;
    lbfgs_parameter_t<floatval_t> param;
    int i, m;

    defparam.m = 12;
    defparam.conv_epsilon = floatval_t(1e-12);
    defparam.eps = get_epsilon<floatval_t>();
    defparam.past = 0;
    defparam.delta = floatval_t(1e-12);
    defparam.max_iterations = 50;
    defparam.linesearch = LBFGS_LINESEARCH_MORETHUENTE;
    defparam.max_linesearch = 50;
    defparam.min_step = get_epsilon<floatval_t>();
    defparam.max_step = floatval_t(1e16);
    defparam.ftol = 1e-4;
    defparam.wolfe = 0.9;
    defparam.gtol = 0.9;
    defparam.xtol = get_epsilon<floatval_t>()*10;
    defparam.orthantwise_c = 0.0;
    defparam.orthantwise_start = 0;
    defparam.orthantwise_end = -1;
    defparam.gstep = 1e-8;

    if(_param == NULL)
    {
        param = defparam;
    }
    else
    {
        param = *_param;
    }

    wspace->param = param;

    m = param.m;

    /* Check the input parameters for errors. */
    if (n <= 0)
    {
        return LBFGSERR_INVALID_N;
    }
    if (param.eps < defparam.eps)
    {
        return LBFGSERR_INVALID_EPSILON;
    }
    if (param.past < 0)
    {
        return LBFGSERR_INVALID_TESTPERIOD;
    }
    if (param.delta < defparam.eps)
    {
        return LBFGSERR_INVALID_DELTA;
    }
    // Actually don't sweat this one, step is only ever a multiplier so the eps here isn't so sensible, we more want do be limited by the minimum floats
    /*
    if (param.min_step < defparam.eps)
    {
        return LBFGSERR_INVALID_MINSTEP;
    }
    */
    if (param.max_step < param.min_step)
    {
        return LBFGSERR_INVALID_MAXSTEP;
    }
    if (param.ftol < defparam.eps)
    {
        return LBFGSERR_INVALID_FTOL;
    }
    if (param.linesearch == LBFGS_LINESEARCH_BACKTRACKING_WOLFE ||
        param.linesearch == LBFGS_LINESEARCH_BACKTRACKING_STRONG_WOLFE)
    {
        if (param.wolfe <= param.ftol || 1. <= param.wolfe)
        {
            return LBFGSERR_INVALID_WOLFE;
        }
    }
    if (param.gtol < defparam.eps)
    {
        return LBFGSERR_INVALID_GTOL;
    }
    if (param.xtol < defparam.eps)
    {
        return LBFGSERR_INVALID_XTOL;
    }
    if (param.max_linesearch <= 0)
    {
        return LBFGSERR_INVALID_MAXLINESEARCH;
    }
    if (param.orthantwise_c < 0.)
    {
        return LBFGSERR_INVALID_ORTHANTWISE;
    }
    if (param.orthantwise_start < 0 || n < param.orthantwise_start)
    {
        return LBFGSERR_INVALID_ORTHANTWISE_START;
    }
    if (param.orthantwise_end < 0)
    {
        param.orthantwise_end = n;
    }
    if (n < param.orthantwise_end)
    {
        return LBFGSERR_INVALID_ORTHANTWISE_END;
    }
    if (param.orthantwise_c != 0.)
    {
        switch (param.linesearch)
        {
        case LBFGS_LINESEARCH_BACKTRACKING:
            wspace->linesearch = line_search_backtracking_owlqn;
            break;
        default:
            /* Only the backtracking method is available. */
            return LBFGSERR_INVALID_LINESEARCH;
        }
    }
    else
    {
        switch (param.linesearch)
        {
        case LBFGS_LINESEARCH_MORETHUENTE:
            wspace->linesearch = line_search_morethuente;
            break;
        case LBFGS_LINESEARCH_BACKTRACKING_ARMIJO:
        case LBFGS_LINESEARCH_BACKTRACKING_WOLFE:
        case LBFGS_LINESEARCH_BACKTRACKING_STRONG_WOLFE:
            wspace->linesearch = line_search_backtracking;
            break;
        default:
            return LBFGSERR_INVALID_LINESEARCH;
        }
    }

    //cout << "Declaring lbfgs variables." << endl;

    wspace->xp = NULL;
    wspace->g  = NULL;
    wspace->gp = NULL;
    wspace->d  = NULL;
    wspace->w  = NULL;
    wspace->pg = NULL;
    wspace->lm = NULL;
    wspace->pf = NULL;

    /* Allocate working space. */
    wspace->xp = new floatval_t[n];
    wspace->g  = new floatval_t[n];
    wspace->gp = new floatval_t[n];
    wspace->d  = new floatval_t[n];
    wspace->w  = new floatval_t[n];
    if (wspace->xp == NULL || wspace->g == NULL || wspace->gp == NULL || wspace->d == NULL || wspace->w == NULL)
    {
        lbfgs_dest(wspace);
        return LBFGSERR_OUTOFMEMORY;
    }

    if (param.orthantwise_c != 0.)
    {
        /* Allocate working space for OW-LQN. */
        wspace->pg = new floatval_t[n];
        if (wspace->pg == NULL)
        {
            lbfgs_dest(wspace);
            return LBFGSERR_OUTOFMEMORY;
        }
    }

    /* Allocate limited memory storage. */
    wspace->lm = new iteration_data_t<floatval_t>[m];
    if (wspace->lm == NULL)
    {
        lbfgs_dest(wspace);
        return LBFGSERR_OUTOFMEMORY;
    }

    /* Initialize the limited memory. */
    for (i = 0;i < m;++i)
    {
        it = &(wspace->lm[i]);

        it->alpha = 0.0;
        it->ys = 0.0;

        it->s = new floatval_t[n];
        it->y = new floatval_t[n];

        if (it->s == NULL || it->y == NULL)
        {
            lbfgs_dest(wspace);
            return LBFGSERR_OUTOFMEMORY;
        }
    }

    /* Allocate an array for storing previous values of the objective function. */
    if (0 < param.past)
    {
        wspace->pf = new floatval_t[param.past];
    }

    return 0;
}

template <typename floatval_t>
int lbfgs_dest(lbfgs_wspace_t<floatval_t> *wspace)
{
    int i;
    const int m = wspace->param.m;
    delete[] wspace->pf;

    /* Free memory blocks used by this function. */
    if (wspace->lm != NULL)
    {
        for (i = 0;i < m;++i)
        {
            delete[] wspace->lm[i].s;
            delete[] wspace->lm[i].y;
        }
        delete[] wspace->lm;
    }
    delete[] wspace->pg;
    delete[] wspace->w;
    delete[] wspace->d;
    delete[] wspace->gp;
    delete[] wspace->g;
    delete[] wspace->xp;

    return 1;
}


/*
 *
 * 
 * 
 */
template <typename floatval_t>
int lbfgs(
    int n,
    floatval_t *x,
    floatval_t *ptr_fx,
    floatval_t *lbounds,
    floatval_t *ubounds,
    floatval_t *extparams,
    floatval_t *precomps,
    lbfgs_evaluate_t<floatval_t> proc_evaluate,
    lbfgs_progress_t<floatval_t> proc_progress,
    lbfgs_wspace_t<floatval_t> *wspace
    )
{
    int ret;
    int i, j, k, ls, end, bound, nLocked;
    floatval_t step;

    floatval_t *xp = wspace->xp;
    floatval_t *g = wspace->g, *gp = wspace->gp, *pg = wspace->pg;
    floatval_t *d = wspace->d, *w = wspace->w, *pf = wspace->pf;
    iteration_data_t<floatval_t> *lm = wspace->lm, *it = NULL;
    floatval_t ys, yy;
    floatval_t xnorm, gnorm, beta;
    floatval_t fx = 0.;
    floatval_t rate = 0.;
    line_search_proc_t<floatval_t> linesearch = wspace->linesearch;

    lbfgs_parameter_t<floatval_t> param = wspace->param;

    const int m = param.m;
    const floatval_t EPS = param.eps;
    const floatval_t GSTEP = param.gstep;
    const floatval_t CONVEPS = param.conv_epsilon;

    if((lbounds != NULL && ubounds == NULL) || (lbounds == NULL && ubounds != NULL))
    {
        return LBFGSERR_INVALID_BOUNDS;
    }

    //cout << "Starting callback allocation." << endl;

    /* Construct a callback data. */
    callback_data_t<floatval_t> cd;
    cd.n = n;
    cd.proc_evaluate = proc_evaluate;
    cd.proc_progress = proc_progress;

    //cout << "Making first evaluation." << endl;

    /* Evaluate the function value and its gradient. */
    fx = cd.proc_evaluate(x, extparams, precomps, g, cd.n, GSTEP);
    if (0. != param.orthantwise_c)
    {
        /* Compute the L1 norm of the variable and add it to the object value. */
        xnorm = owlqn_x1norm(x, param.orthantwise_start, param.orthantwise_end);
        fx += xnorm * param.orthantwise_c;
        owlqn_pseudo_gradient(pg, x, g, n, param.orthantwise_c, param.orthantwise_start, param.orthantwise_end, EPS);
    }


    if (pf != NULL)
    {
        pf[0] = fx;
    }

    /*
        Compute the direction;
        we assume the initial hessian matrix H_0 as the identity matrix.
     */
    if (param.orthantwise_c == 0.)
    {
        vecncpy(d, g, n);
    }
    else
    {
        vecncpy(d, pg, n);
    }

#ifdef VERBOSE
    cout << "Looking for bounds." << endl;
#endif

    nLocked = 0;

    // Look for bounded values.
    if(lbounds != NULL && ubounds != NULL)
    {
        for(int i=0;i<n;i++)
        {
            // TODO: Make sure this is back in.
            if(x[i] < lbounds[i] || ubounds[i] < x[i])
            {
                cout << "Invalid start at: ";
                for (i = 0;i < n;i++)
                {
                    cout << ", x[" << i << "] = " << to_out_string(x[i],25);
                }
                cout << endl;

                cout << "Bounds lower: ";
                for (i = 0;i < n;i++)
                {
                    cout << ", lbounds[" << i << "] = " << to_out_string(lbounds[i],25);
                }
                cout << endl;

                cout << "Bounds upper: ";
                for (i = 0;i < n;i++)
                {
                    cout << ", ubounds[" << i << "] = " << to_out_string(ubounds[i],25);
                }
                cout << endl;


                ret = LBFGSERR_INVALID_START_X;
                goto lbfgs_exit;
            }
            else if(fabs(g[i]) < 0.0)
            {
#ifdef VERBOSE
                cout << "Dimension " << i << " held due to gradient." << endl;
#endif
                d[i] = 0.;
                nLocked++;
            }
            else
            {
                if((g[i] > 0. && x[i] > ubounds[i]) || (g[i] < 0. && lbounds[i] > x[i]))
                {
#ifdef VERBOSE
                    cout << "Dimension " << i << " held due to bounds." << endl;
#endif
                    d[i] = 0.;
                    nLocked++;
                }
            }
        }
    }

#ifdef VERBOSE
    cout << "Completed bounds." << endl;
#endif

    if(nLocked == n)
    {
        ret = LBFGS_ALREADY_MINIMIZED;
        goto lbfgs_exit;
    }


    /*
       Make sure that the initial variables are not a minimum.
     */
    vec2norm(&xnorm, x, n);


    if (param.orthantwise_c == 0.)
    {
        vec2norm(&gnorm, g, n);
    }
    else
    {
        vec2norm(&gnorm, pg, n);
    }

    if (xnorm < 1.0) xnorm = 1.0;

    if (gnorm / xnorm <= param.conv_epsilon)
    {
        ret = LBFGS_ALREADY_MINIMIZED;
        goto lbfgs_exit;
    }



    /* Compute the initial step:
        step = 1.0 / sqrt(vecdot(d, d, n))
     */
    vec2norminv(&step, d, n);

    //cout << "Completed lbfgs initialization." << endl;

    k = 1;
    end = 0;
    for (;;)
    {
#ifdef VERBOSE
		cout << "Looping." << endl;
#endif
        /* Store the current position and gradient vectors. */
        veccpy(xp, x, n);
        veccpy(gp, g, n);

        /* Search for an optimal step. */
        if (param.orthantwise_c == 0.)
        {
            ls = linesearch(n, x, extparams, precomps, lbounds, ubounds, &fx, g, d, &step, xp, gp, w, &cd, &param);
        }
        else
        {
            ls = linesearch(n, x, extparams, precomps, lbounds, ubounds, &fx, g, d, &step, xp, pg, w, &cd, &param);
            owlqn_pseudo_gradient(pg, x, g, n, param.orthantwise_c, param.orthantwise_start, param.orthantwise_end, EPS);
        }

#ifdef VERBOSE
        cout << "After linesearch";
        for (i = 0;i < n;i++)
        {
			cout << ", x[" << i << "] = " << to_out_string(x[i],5);
		}
        cout << endl;
        cout << "fx: " << to_out_string(fx,5) << endl;
#endif

        /* TODO: This has been hacked. */
        if (ls < 0 && ls != LBFGSERR_INCREASEGRADIENT)
        {
            /* Revert to the previous point. */
            veccpy(x, xp, n);
            veccpy(g, gp, n);
            ret = ls;
#ifdef VERBOSE
            cout << "Hit the hacked exit condition." << endl;
            cout << "ls = " << ls << endl;
#endif
            goto lbfgs_exit;
        }
        /* TODO: This is a hack to reset the hessian. */
        if(ls == LBFGSERR_INCREASEGRADIENT)
        {
            for (i = 0;i < m;++i)
            {
                it = &lm[i];
                it->alpha = 0.0;
                it->ys = 0.0;
            }

            end = 0;
            k = 1;
#ifdef VERBOSE
	    	cout << "Reset the Hessian." << endl;
#endif
        }

        /* Compute x and g norms. */
        vec2norm(&xnorm, x, n);
        if (param.orthantwise_c == 0.)
        {
            vec2norm(&gnorm, g, n);
        }
        else
        {
            vec2norm(&gnorm, pg, n);
        }

        /* Report the progress. */
        if (cd.proc_progress)
        {
            if ((ret = cd.proc_progress(x, g, fx, xnorm, gnorm, step, cd.n, k, ls)))
            {
                goto lbfgs_exit;
            }
        }

        /*
            Convergence test.
            The criterion is given by the following formula:
                |g(x)| / \max(1, |x|) < \epsilon
         */
        if (xnorm < 1.0) xnorm = 1.0;

        if (gnorm / xnorm <= param.conv_epsilon)
        {
            /* Convergence. */
            ret = LBFGS_SUCCESS;
            break;
        }

        /*
            Test for stopping criterion.
            The criterion is given by the following formula:
                (f(past_x) - f(x)) / f(x) < \delta
         */
        if (pf != NULL)
        {
            /* We don't test the stopping criterion while k < past. */
            if (param.past <= k)
            {
                /* Compute the relative improvement from the past. */
                rate = (pf[k % param.past] - fx) / fx;

                /* The stopping criterion. */
                if (rate < param.delta)
                {
                    ret = LBFGS_STOP;
                    break;
                }
            }

            /* Store the current value of the objective function. */
            pf[k % param.past] = fx;
        }

        if (param.max_iterations != 0 && param.max_iterations < k+1)
        {
            /* Maximum number of iterations. */
            ret = LBFGSERR_MAXIMUMITERATION;
            break;
        }

        /*
            Update vectors s and y:
                s_{k+1} = x_{k+1} - x_{k} = \step * d_{k}.
                y_{k+1} = g_{k+1} - g_{k}.
         */
        it = &lm[end];
        vecdiff(it->s, x, xp, n);
        vecdiff(it->y, g, gp, n);

        /*
            Compute scalars ys and yy:
                ys = y^t \cdot s = 1 / \rho.
                yy = y^t \cdot y.
            Notice that yy is used for scaling the hessian matrix H_0 (Cholesky factor).
         */
        vecdot(&ys, it->y, it->s, n);
        vecdot(&yy, it->y, it->y, n);
        it->ys = ys;

        if(fabs(ys) < CONVEPS)
        {
            // Sufficient convergence
            ret = LBFGS_STOP;
            break;
        }

        /*
            Recursive formula to compute dir = -(H \cdot g).
                This is described in page 779 of:
                Jorge Nocedal.
                Updating Quasi-Newton Matrices with Limited Storage.
                Mathematics of Computation, Vol. 35, No. 151,
                pp. 773--782, 1980.
         */
        bound = (m <= k) ? m : k;
        ++k;
        end = (end + 1) % m;

        /* Compute the steepest direction. */
        if (param.orthantwise_c == 0.)
        {
            /* Compute the negative of gradients. */
            vecncpy(d, g, n);
        }
        else
        {
            vecncpy(d, pg, n);
        }

        j = end;
        for (i = 0;i < bound;++i)
        {
            j = (j + m - 1) % m;    /* if (--j == -1) j = m-1; */
            it = &lm[j];
            /* \alpha_{j} = \rho_{j} s^{t}_{j} \cdot q_{k+1}. */
            vecdot(&it->alpha, it->s, d, n);

#ifdef VERBOSE
            if(fabs(it->ys) < 0.0)
            {
                cout << "This is a small division 13" << endl;
            }
#endif

            it->alpha /= it->ys;
            /* q_{i} = q_{i+1} - \alpha_{i} y_{i}. */
            vecadd(d, it->y, -it->alpha, n);
        }

#ifdef VERBOSE
        if(fabs(yy) < 0.0)
        {
            cout << "This is a small division 14" << endl;
        }
#endif

        vecscale(d, ys / yy, n);

        for (i = 0;i < bound;++i)
        {
            it = &lm[j];
            /* \beta_{j} = \rho_{j} y^t_{j} \cdot \gamma_{i}. */
            vecdot(&beta, it->y, d, n);

#ifdef VERBOSE
            if(fabs(it->ys) < 0.0)
            {
                cout << "This is a small division 15" << endl;
            }
#endif

            beta /= it->ys;
            /* \gamma_{i+1} = \gamma_{i} + (\alpha_{j} - \beta_{j}) s_{j}. */
            vecadd(d, it->s, it->alpha - beta, n);
            j = (j + 1) % m;        /* if (++j == m) j = 0; */
        }

        nLocked = 0;

        // Look for bounded values.
        if(lbounds != NULL && ubounds != NULL)
        {
            for(int i=0;i<n;i++)
            {
                if(fabs(g[i]) < 0.0)
                {
#ifdef VERBOSE
                    cout << "Dimension " << i << " held due to gradient." << endl;
#endif
                    d[i] = 0.;
                    nLocked++;
                }
                else
                {
                    if((g[i] > 0. && x[i] > ubounds[i]) || (g[i] < 0. && lbounds[i] > x[i]))
                    {
#ifdef VERBOSE
                        cout << "Dimension " << i << " held due to bounds." << endl;
#endif
                        d[i] = 0.;
                        nLocked++;
                    }
                }
            }
        }

        vecdot(&ys, g, d, n);

        if(fabs(ys) < CONVEPS)
        {
            // Sufficient convergence
            ret = LBFGS_STOP;
            break;
        }

        /*
            Constrain the search direction for orthant-wise updates.
         */
        if (param.orthantwise_c != 0.)
        {
            for (i = param.orthantwise_start;i < param.orthantwise_end;++i)
            {
                if (d[i] * pg[i] > 0.0)
                {
                    d[i] = 0.;
                }
            }
        }

        /*
            Now the search direction d is ready. We try step = 1 first.
         */
        step = 1.0;
    }

lbfgs_exit:
    /* Return the final value of the objective function. */
    if (ptr_fx != NULL)
    {
        *ptr_fx = fx;
    }

    // Look for bounded values.
    if(lbounds != NULL && ubounds != NULL)
    {
        bool recomp = false;
        for(int i=0;i<n;i++)
        {
            // TODO: Make sure this is back in.
            if(x[i] < lbounds[i])
            {
                cout << "Final boundary exceeded." << endl;

                x[i] = lbounds[i];
                recomp = true;
            }
            else if(ubounds[i] < x[i])
            {
                cout << "Final boundary exceeded." << endl;

                x[i] = ubounds[i];
                recomp = true;
            }
        }

        if(recomp)
        {
            fx = cd.proc_evaluate(x, extparams, precomps, g, cd.n, GSTEP);
        }
    }

    return ret;
}


template <typename floatval_t>
static int line_search_backtracking(
    int n,
    floatval_t *x,
    floatval_t *extparams,
    floatval_t *precomps,
    floatval_t *lbounds,
    floatval_t *ubounds,
    floatval_t *f,
    floatval_t *g,
    floatval_t *s,
    floatval_t *stp,
    const floatval_t* xp,
    const floatval_t* gp,
    floatval_t *wp,
    callback_data_t<floatval_t> *cd,
    const lbfgs_parameter_t<floatval_t> *param
    )
{
    int count = 0;
    floatval_t width, dg;
    floatval_t finit, dginit = 0., dgtest;
    const floatval_t dec = 0.5, inc = 2.1;
    const floatval_t EPS = param->eps;
    const floatval_t GSTEP = param->gstep;

    /* Check the input parameters for errors. */
    if (*stp < EPS)
    {
        return LBFGSERR_INVALIDPARAMETERS;
    }

    /* Compute the initial gradient in the search direction. */
    vecdot(&dginit, g, s, n);

    /* Make sure that s points to a descent direction. */
    if (EPS < dginit)
    {
        return LBFGSERR_INCREASEGRADIENT;
    }

    /* The initial value of the objective function. */
    finit = *f;
    dgtest = param->ftol * dginit;

    for (;;)
    {
        /* Check for boundary conditions. */
        if(lbounds != NULL && ubounds != NULL)
        {
            for(int i=0;i<n;i++)
            {
                if(fabs(s[i]) > EPS && x[i] + s[i] * (*stp) > ubounds[i])
                {
                    *stp = (ubounds[i] - x[i]) / s[i] - EPS;
                }
                else if(fabs(s[i]) > EPS && x[i] + s[i] * (*stp) < lbounds[i])
                {
                    *stp = (lbounds[i] - x[i]) / s[i] - EPS;
                }
            }
        }

        veccpy(x, xp, n);
        vecadd(x, s, *stp, n);

        /* Evaluate the function and gradient values. */
        *f = cd->proc_evaluate(x, extparams, precomps, g, cd->n, GSTEP);

        ++count;

        if (*f - (finit + *stp * dgtest) > EPS)
        {
            width = dec;
        }
        else
        {
            /* The sufficient decrease condition (Armijo condition). */
            if (fabs(param->linesearch - LBFGS_LINESEARCH_BACKTRACKING_ARMIJO) < EPS)
            {
                /* Exit with the Armijo condition. */
                return count;
	        }

	        /* Check the Wolfe condition. */
	        vecdot(&dg, g, s, n);
	        if (param->wolfe * dginit - dg > EPS)
            {
    		    width = inc;
	        }
            else
            {
		        if(fabs(param->linesearch - LBFGS_LINESEARCH_BACKTRACKING_WOLFE) < EPS)
                {
		            /* Exit with the regular Wolfe condition. */
		            return count;
		        }

		        /* Check the strong Wolfe condition. */
		        if(fabs(param->wolfe * dginit + dg) < EPS)
                {
		            width = dec;
		        }
                else
                {
		            /* Exit with the strong Wolfe condition. */
		            return count;
		        }
            }
        }

        if (*stp < param->min_step)
        {
            /* The step is the minimum value. */
            return LBFGSERR_MINIMUMSTEP;
        }
        if (*stp > param->max_step)
        {
            /* The step is the maximum value. */
            return LBFGSERR_MAXIMUMSTEP;
        }
        if (param->max_linesearch <= count)
        {
            /* Maximum number of iteration. */
            return LBFGSERR_MAXIMUMLINESEARCH;
        }

        (*stp) *= width;
    }
}


template <typename floatval_t>
static int line_search_backtracking_owlqn(
    int n,
    floatval_t *x,
    floatval_t *extparams,
    floatval_t *precomps,
    floatval_t *lbounds,
    floatval_t *ubounds,
    floatval_t *f,
    floatval_t *g,
    floatval_t *s,
    floatval_t *stp,
    const floatval_t* xp,
    const floatval_t* gp,
    floatval_t *wp,
    callback_data_t<floatval_t> *cd,
    const lbfgs_parameter_t<floatval_t> *param
    )
{
    int i, count = 0;
    floatval_t width = 0.5, norm = 0.;
    floatval_t finit = *f, dgtest;
    const floatval_t EPS = param->eps;
    const floatval_t GSTEP = param->gstep;

    /* Check the input parameters for errors. */
    if (*stp < -EPS)
    {
        return LBFGSERR_INVALIDPARAMETERS;
    }

    /* Choose the orthant for the new point. */
    for (i = 0;i < n;++i)
    {
        wp[i] = (fabs(xp[i]) < EPS) ? -gp[i] : xp[i];
    }

    for (;;)
    {
        /* Check for boundary conditions. */
        if(lbounds != NULL && ubounds != NULL)
        {
            for(int i=0;i<n;i++)
            {
                if(fabs(s[i]) > EPS && x[i] + s[i] * (*stp) > ubounds[i])
                {
                    *stp = (ubounds[i] - x[i]) / s[i];
                }
                else if(fabs(s[i]) > EPS && x[i] + s[i] * (*stp) < lbounds[i])
                {
                    *stp = (lbounds[i] - x[i]) / s[i];
                }
            }
        }

        /* Update the current point. */
        veccpy(x, xp, n);
        vecadd(x, s, *stp, n);

        /* The current point is projected onto the orthant. */
        owlqn_project(x, wp, param->orthantwise_start, param->orthantwise_end, EPS);

        /* Evaluate the function and gradient values. */
        *f = cd->proc_evaluate(x, extparams, precomps, g, cd->n, GSTEP);

        /* Compute the L1 norm of the variables and add it to the object value. */
        norm = owlqn_x1norm(x, param->orthantwise_start, param->orthantwise_end);
        *f += norm * param->orthantwise_c;

        ++count;

        dgtest = 0.;
        for (i = 0;i < n;++i)
        {
            dgtest += (x[i] - xp[i]) * gp[i];
        }

        if (finit + param->ftol * dgtest - *f > -EPS)
        {
            /* The sufficient decrease condition. */
            return count;
        }

        if (*stp < param->min_step)
        {
            /* The step is the minimum value. */
            return LBFGSERR_MINIMUMSTEP;
        }
        if (*stp > param->max_step)
        {
            /* The step is the maximum value. */
            return LBFGSERR_MAXIMUMSTEP;
        }
        if (param->max_linesearch <= count)
        {
            /* Maximum number of iteration. */
            return LBFGSERR_MAXIMUMLINESEARCH;
        }

        (*stp) *= width;
    }
}

template <typename floatval_t>
static int line_search_morethuente(
    int n,
    floatval_t *x,
    floatval_t *extparams,
    floatval_t *precomps,
    floatval_t *lbounds,
    floatval_t *ubounds,
    floatval_t *f,
    floatval_t *g,
    floatval_t *s,
    floatval_t *stp,
    const floatval_t* xp,
    const floatval_t* gp,
    floatval_t *wa,
    callback_data_t<floatval_t> *cd,
    const lbfgs_parameter_t<floatval_t> *param
    )
{
    int count = 0;
    int brackt, stage1, uinfo = 0;
    bool bounded;
    floatval_t dg;
    floatval_t stx, fx, dgx;
    floatval_t sty, fy, dgy;
    floatval_t fxm, dgxm, fym, dgym, fm, dgm;
    floatval_t finit, ftest1, dginit, dgtest;
    floatval_t width, prev_width;
    floatval_t stmin, stmax;
    const floatval_t EPS = param->eps;
    const floatval_t GSTEP = param->gstep;

#ifdef VERBOSE
    cout << "Starting linesearch at: " << endl;

    for(int i=0; i<n; i++)
    {
        cout << "x[" << i << "] = " << to_out_string(x[i],10) << endl;
    }

    cout << "Search direction: " << endl;

    for(int i=0; i<n; i++)
    {
        cout << "s[" << i << "] = " << to_out_string(s[i],10) << endl;
    }

    cout << "Gradient: " << endl;

    for(int i=0; i<n; i++)
    {
        cout << "g[" << i << "] = " << to_out_string(g[i],10) << endl;
    }
#endif

    /* Check the input parameters for errors. */
    if (*stp <= 0.0)
    {
#ifdef VERBOSE
        cout << "Exiting with invalid parameters." << endl;
#endif
        return LBFGSERR_INVALIDPARAMETERS;
    }

    /* Compute the initial gradient in the search direction. */
    vecdot(&dginit, g, s, n);

    /* Make sure that s points to a descent direction. 0 < dginit */
    if (0.0 < dginit)
    {
        return LBFGSERR_INCREASEGRADIENT;
    }

    /* Initialize local variables. */
    brackt = 0;
    stage1 = 1;
    finit = *f;
    dgtest = param->ftol * dginit;
    width = param->max_step - param->min_step;
    prev_width = 2.0 * width;

    /*
        The variables stx, fx, dgx contain the values of the step,
        function, and directional derivative at the best step.
        The variables sty, fy, dgy contain the value of the step,
        function, and derivative at the other endpoint of
        the interval of uncertainty.
        The variables stp, f, dg contain the values of the step,
        function, and derivative at the current step.
    */
    stx = sty = 0.;
    fx = fy = finit;
    dgx = dgy = dginit;

    for (;;)
    {
        bounded = false;

        /*
            Set the minimum and maximum steps to correspond to the
            present interval of uncertainty.
         */
        if (brackt)
        {
            stmin = min2(stx, sty);
            stmax = max2(stx, sty);

        }
        else
        {
            stmin = stx;
            stmax = *stp + 4.0 * (*stp - stx);
        }

        /* Clip the step in the range of [stpmin, stpmax]. */
        if (*stp < param->min_step)
        {
            /* We hit the minimum step size so tap out */
            //return count;
            *stp = param->min_step;
        }
        if (*stp > param->max_step)
        {
            *stp = param->max_step;
        }

        /*
            If an unusual termination is to occur then let
            stp be the lowest point obtained so far.
         */
        if ((brackt && ((*stp <= stmin || stmax <= *stp) || param->max_linesearch <= count + 1 || uinfo != 0))
            || (brackt && (stmax - stmin <= param->xtol * stmax)))
        {
#ifdef VERBOSE
        cout << "unusual termination in linesearch. Resetting step." << endl;
#endif     
            *stp = stx;
        }

#ifdef VERBOSE
        cout << "----------------------" << endl;
#endif

        /* Check for boundary conditions. */
        if(lbounds != NULL && ubounds != NULL)
        {
#ifdef VERBOSE
            cout << "Step will be: " << to_out_string((*stp),5) << endl;
#endif
            for(int i=0;i<n;i++)
            {
#ifdef VERBOSE
                cout << "Checking condition for " << i << endl;
                cout << "Check condition was: " << to_out_string((x[i] + s[i] * (*stp)),5) << endl;
                cout << "and: " <<  to_out_string((x[i] + s[i] * (*stp)),5) << endl;
                cout << "step[" << i << "]=" << to_out_string((s[i] * (*stp)),5) << endl;
                cout << "s[" << i << "]=" << to_out_string(s[i],5) << endl;
#endif
                if(fabs(s[i]) > 0.0 && x[i] + s[i] * (*stp) > ubounds[i])
                {
#ifdef VERBOSE
                    cout << "Adjusting step, upper bound." << endl;
#endif
                    *stp = (ubounds[i] - x[i]) / s[i];
                    stmax = *stp;
                    bounded = true;
                }
                else if(fabs(s[i]) > 0.0 && x[i] + s[i] * (*stp) < lbounds[i])
                {
#ifdef VERBOSE
                    cout << "Adjusting step, lower bound." << endl;
#endif
                    *stp = (lbounds[i] - x[i]) / s[i];
                    stmax = *stp;
                    bounded = true;
                }
            }
        }

#ifdef VERBOSE
        cout << "----------------------" << endl;
#endif

        /*
            Compute the current value of x:
                x <- x + (*stp) * s.
         */
        veccpy(x, xp, n);

#ifdef VERBOSE
        cout << "Real step will be: " << endl;
        for (int i = 0;i < n;i++)
        {
			cout << "sx[" << i << "] = " << to_out_string(((*stp)*s[i]),10) << endl;
		}

        cout << "Before step";
        for (int i = 0;i < n;i++)
        {
			cout << ", x[" << i << "] = " << to_out_string(x[i],10);
		}
		cout << endl;
#endif

        vecadd(x, s, *stp, n);

#ifdef VERBOSE
        cout << "After step";
        for (int i = 0;i < n;i++)
        {
			cout << ", x[" << i << "] = " << to_out_string(x[i],10);
		}
		cout << endl;
#endif

        /* Evaluate the function and gradient values. */
        *f = cd->proc_evaluate(x, extparams, g, cd->n, GSTEP);
        vecdot(&dg, g, s, n);

        ftest1 = finit + *stp * dgtest;
        ++count;

        /* Test for errors and convergence. */
        if(bounded && (brackt || stmax < *stp))
        {
#ifdef VERBOSE
            cout << "Linesearch hit a boundary." << endl;
#endif
            /* We have run into a boundary. */
            return count;
        }
        if (brackt && ((*stp <= stmin || stmax <= *stp) || uinfo != 0)) /*(brackt && ((*stp <= stmin || stmax <= *stp) || uinfo != 0))*/ 
        {
            /* Rounding errors prevent further progress. */
#ifdef VERBOSE
            cout << "Returning rounding error, uinfo: " << uinfo << " count is: " << count << endl;
            cout << "Step is: " << to_out_string((*stp), 5) << endl;
            if(*stp <= stmin)
            {
                cout << "Exceeded stmin: " << to_out_string(stmin, 5) << endl;
            }
            if(stmax <= *stp)
            {
                cout << "Exceeded stmax: " << to_out_string(stmax, 5) << endl;
            }

            cout << "stmax - stmin: " << to_out_string((stmax - stmin), 5) << endl;
#endif
            //return count;
            return LBFGSERR_ROUNDING_ERROR;
        }

        // TODO Re-add a fixed version of  ftest1 - *f > -EPS
        if (*stp == param->max_step && *f <= ftest1 && dg <= dgtest)
        {
            /* The step is the maximum value. */
#ifdef VERBOSE
            cout << "Hit the max step." << endl;
            cout << "Step is: " << to_out_string((*stp), 5) << " Max is: " << to_out_string(param->max_step, 5) << endl;

            cout << "ftest1 is: " << to_out_string(ftest1, 5) << " f: " << to_out_string(*f, 5) << endl;
            cout << "*stp * dgtest is: " << to_out_string(*stp * dgtest, 5) << endl;
            cout << "dgtest is: " << to_out_string(dgtest, 5) << " dg: " << to_out_string(dg, 5) << endl;
#endif
            cout << "Exiting with maxstep." << endl;
            return LBFGSERR_MAXIMUMSTEP;
        }
        if (*stp == param->min_step && (ftest1 < *f || dgtest <= dg))
        {
#ifdef VERBOSE
            cout << "Hit the min step." << endl;
            cout << "Step is: " << to_out_string((*stp), 5) << " Min is: " << to_out_string(param->min_step, 5) << endl;
 
            cout << "Condition value is: " << to_out_string (fabs((*stp) - param->min_step), 5) << endl;

            cout << "ftest1 is: " << to_out_string(ftest1, 5) << " f: " << to_out_string(*f, 5) << endl;
            
            cout << "dgtest is: " << to_out_string(dgtest, 5) << " dg: " << to_out_string(dg, 5) << endl;
#endif
            /* The step is the minimum value. */
            return LBFGSERR_MINIMUMSTEP;
        }

        if ((stmax - stmin) <= param->xtol * stmax)
        {
            cout << "Would have done this but not brackt" << endl;
        }

        if (brackt && (stmax - stmin) <= param->xtol * stmax)
        {
            /* Relative width of the interval of uncertainty is at most xtol. */
#ifdef VERBOSE
            cout << "Exiting linesearch with width too small." << endl;
#endif
            return LBFGSERR_WIDTHTOOSMALL;
        }
        if (param->max_linesearch <= count)
        {
            /* Maximum number of iteration. */
#ifdef VERBOSE
            cout << "Exiting linesearch with maximum linesearch." << endl;
#endif
            return LBFGSERR_MAXIMUMLINESEARCH;
        }

        if  (*f <= ftest1 && fabs(dg) <= param->gtol * (-dginit))
        {
            /* The sufficient decrease condition and the directional derivative condition hold. */
            return count;
        }

        /*
            In the first stage we seek a step for which the modified
            function has a nonpositive value and nonnegative derivative.
         */
        if (stage1 && *f <= ftest1 && min2(param->ftol, param->gtol) * dginit <= dg)
        {
            stage1 = 0;
        }

        /*
            A modified function is used to predict the step only if
            we have not obtained a step for which the modified
            function has a nonpositive function value and nonnegative
            derivative, and if a lower function value has been
            obtained but the decrease is not sufficient.
         */
        if (stage1 && ftest1 < *f && *f <= fx)
        {
            cout << "Linesearch stage 1 trial interval." << endl;
            /* Define the modified function and derivative values. */
            fm = *f - *stp * dgtest;
            fxm = fx - stx * dgtest;
            fym = fy - sty * dgtest;
            dgm = dg - dgtest;
            dgxm = dgx - dgtest;
            dgym = dgy - dgtest;

            /*
                Call update_trial_interval() to update the interval of
                uncertainty and to compute the new step.
             */
            uinfo = update_trial_interval(&stx, &fxm, &dgxm, &sty, &fym, &dgym, stp, &fm, &dgm, stmin, stmax, &brackt, EPS);

            /* Reset the function and gradient values for f. */
            fx = fxm + stx * dgtest;
            fy = fym + sty * dgtest;
            dgx = dgxm + dgtest;
            dgy = dgym + dgtest;
        }
        else
        {
            cout << "Linesearch stage 2 trial interval." << endl;
            /*
                Call update_trial_interval() to update the interval of
                uncertainty and to compute the new step.
             */
            uinfo = update_trial_interval(&stx, &fx, &dgx, &sty, &fy, &dgy, stp, f, &dg, stmin, stmax, &brackt, EPS);
        }

        /*
            Force a sufficient decrease in the interval of uncertainty.
         */
        if (brackt)
        {
            if (0.66 * prev_width <= fabs(sty - stx))
            {
                *stp = stx + 0.5 * (sty - stx);
            }
            prev_width = width;
            width = fabs(sty - stx);
        }
    }

    return LBFGSERR_LOGICERROR;
}



/**
 * Define the local variables for computing minimizers.
 */
#define USES_MINIMIZER \
    floatval_t a, d, gamma, theta, p, q, r, s;

/**
 * Find a minimizer of an interpolated cubic function.
 *  @param  cm      The minimizer of the interpolated cubic.
 *  @param  u       The value of one point, u.
 *  @param  fu      The value of f(u).
 *  @param  du      The value of f'(u).
 *  @param  v       The value of another point, v.
 *  @param  fv      The value of f(v).
 *  @param  dv      The value of f'(v).
 */
#define CUBIC_MINIMIZER(cm, u, fu, du, v, fv, dv) \
    d = (v) - (u); \
    theta = ((fu) - (fv)) * 3 / d + (du) + (dv); \
    p = fabs(theta); \
    q = fabs(du); \
    r = fabs(dv); \
    s = max3(p, q, r); \
    /* gamma = s*sqrt((theta/s)**2 - (du/s) * (dv/s)) */ \
    a = theta / s; \
    gamma = s * sqrt(max2(0., a * a - ((du) / s) * ((dv) / s))); \
    if ((v) < (u)) gamma = -gamma; \
    p = gamma - (du) + theta; \
    q = gamma - (du) + gamma + (dv); \
    r = p / q; \
    (cm) = (u) + r * d;

/**
 * Find a minimizer of an interpolated cubic function.
 *  @param  cm      The minimizer of the interpolated cubic.
 *  @param  u       The value of one point, u.
 *  @param  fu      The value of f(u).
 *  @param  du      The value of f'(u).
 *  @param  v       The value of another point, v.
 *  @param  fv      The value of f(v).
 *  @param  dv      The value of f'(v).
 *  @param  xmin    The maximum value.
 *  @param  xmin    The minimum value.
 */
#define CUBIC_MINIMIZER2(cm, u, fu, du, v, fv, dv, xmin, xmax) \
    d = (v) - (u); \
    theta = ((fu) - (fv)) * 3 / d + (du) + (dv); \
    p = fabs(theta); \
    q = fabs(du); \
    r = fabs(dv); \
    s = max3(p, q, r); \
    /* gamma = s*sqrt((theta/s)**2 - (du/s) * (dv/s)) */ \
    a = theta / s; \
    gamma = s * sqrt(max2(0., a * a - ((du) / s) * ((dv) / s))); \
    if ((u) < (v)) gamma = -gamma; \
    p = gamma - (dv) + theta; \
    q = gamma - (dv) + gamma + (du); \
    r = p / q; \
    if (r < 0.0 && fabs(gamma) > 0.0) { \
        (cm) = (v) - r * d; \
    } else if (a < 0.0) { \
        (cm) = (xmax); \
    } else { \
        (cm) = (xmin); \
    }

/**
 * Find a minimizer of an interpolated quadratic function.
 *  @param  qm      The minimizer of the interpolated quadratic.
 *  @param  u       The value of one point, u.
 *  @param  fu      The value of f(u).
 *  @param  du      The value of f'(u).
 *  @param  v       The value of another point, v.
 *  @param  fv      The value of f(v).
 */
#define QUARD_MINIMIZER(qm, u, fu, du, v, fv) \
    a = (v) - (u); \
    (qm) = (u) + (du) / (((fu) - (fv)) / a + (du)) / 2 * a;

/**
 * Find a minimizer of an interpolated quadratic function.
 *  @param  qm      The minimizer of the interpolated quadratic.
 *  @param  u       The value of one point, u.
 *  @param  du      The value of f'(u).
 *  @param  v       The value of another point, v.
 *  @param  dv      The value of f'(v).
 */
#define QUARD_MINIMIZER2(qm, u, du, v, dv) \
    a = (u) - (v); \
    (qm) = (v) + (dv) / ((dv) - (du)) * a;

/**
 * Update a safeguarded trial value and interval for line search.
 *
 *  The parameter x represents the step with the least function value.
 *  The parameter t represents the current step. This function assumes
 *  that the derivative at the point of x in the direction of the step.
 *  If the bracket is set to true, the minimizer has been bracketed in
 *  an interval of uncertainty with endpoints between x and y.
 *
 *  @param  x       The pointer to the value of one endpoint.
 *  @param  fx      The pointer to the value of f(x).
 *  @param  dx      The pointer to the value of f'(x).
 *  @param  y       The pointer to the value of another endpoint.
 *  @param  fy      The pointer to the value of f(y).
 *  @param  dy      The pointer to the value of f'(y).
 *  @param  t       The pointer to the value of the trial value, t.
 *  @param  ft      The pointer to the value of f(t).
 *  @param  dt      The pointer to the value of f'(t).
 *  @param  tmin    The minimum value for the trial value, t.
 *  @param  tmax    The maximum value for the trial value, t.
 *  @param  brackt  The pointer to the predicate if the trial value is
 *                  bracketed.
 *  @retval int     Status value. Zero indicates a normal termination.
 *
 *  @see
 *      Jorge J. More and David J. Thuente. Line search algorithm with
 *      guaranteed sufficient decrease. ACM Transactions on Mathematical
 *      Software (TOMS), Vol 20, No 3, pp. 286-307, 1994.
 */
template <typename floatval_t>
static int update_trial_interval(
    floatval_t *x,
    floatval_t *fx,
    floatval_t *dx,
    floatval_t *y,
    floatval_t *fy,
    floatval_t *dy,
    floatval_t *t,
    floatval_t *ft,
    floatval_t *dt,
    const floatval_t tmin,
    const floatval_t tmax,
    int *brackt,
    const floatval_t EPS
    )
{
    int bound;
    int dsign = fsigndiff(dt, dx);
    floatval_t mc; /* minimizer of an interpolated cubic. */
    floatval_t mq; /* minimizer of an interpolated quadratic. */
    floatval_t newt;   /* new trial value. */
    USES_MINIMIZER;     /* for CUBIC_MINIMIZER and QUARD_MINIMIZER. */

#ifdef VERBOSE
    cout << "fx: " << to_out_string(*fx, 10) << " ft: " << to_out_string(*ft, 10) << endl;
    cout << "x: " << to_out_string(*x, 20) << " t: " << to_out_string(*t, 20) << endl;
    cout << "dx: " << to_out_string(*dx, 10) << " dt: " << to_out_string(*dt, 10) << endl;
#endif

    /* Check the input parameters for errors. */
    if (*brackt)
    {
        if (*t <= min2(*x, *y) || max2(*x, *y) <= *t)
        {
#ifdef VERBOSE
            cout << "LBFGSERR_OUTOFINTERVAL" << endl;
            cout << "x is: " << to_out_string((*x), 5) << " y is: " << to_out_string((*y), 5) << " t is: " << to_out_string((*t), 5) << endl;
#endif
            /* The trival value t is out of the interval. */
            return LBFGSERR_OUTOFINTERVAL;
        }
        if (0. <= *dx * (*t - *x))
        {
#ifdef VERBOSE
            cout << "LBFGSERR_INCREASEGRADIENT" << endl;
            cout << "*dx * (*t - *x): " << to_out_string((*dx * (*t - *x)), 5) << endl;
            cout << "dx is: " << to_out_string((*dx), 5) << endl;
            cout << "t is: " << to_out_string((*t), 5) << " x is: " << to_out_string((*x), 5) << endl;
#endif
            /* The function must decrease from x. */
            return LBFGSERR_INCREASEGRADIENT;
        }
        if (tmax < tmin)
        {
#ifdef VERBOSE
            cout << "LBFGSERR_INCORRECT_TMINMAX" << endl;
            cout << "tmin is: " << to_out_string(tmin, 5) << " tmax is: " << to_out_string(tmax, 5) << endl;
#endif
            /* Incorrect tmin and tmax specified. */
            return LBFGSERR_INCORRECT_TMINMAX;
        }
    }

    /*
        Trial value selection.
     */
    if (*fx < *ft)
    {
        /*
            Case 1: a higher function value.
            The minimum is brackt. If the cubic minimizer is closer
            to x than the quadratic one, the cubic one is taken, else
            the average of the minimizers is taken.
         */
        *brackt = 1;
        bound = 1;

        CUBIC_MINIMIZER(mc, *x, *fx, *dx, *t, *ft, *dt);
        QUARD_MINIMIZER(mq, *x, *fx, *dx, *t, *ft);
        if (fabs(mc - *x) < fabs(mq - *x))
        {
            newt = mc;
        }
        else
        {
            newt = mc + 0.5 * (mq - mc);
        }
#ifdef VERBOSE
        cout << "Case 1 trial interval." << endl;
        cout << "newt: " << to_out_string(newt, 10) << endl;
#endif
    }
    else if (dsign)
    {
        /*
            Case 2: a lower function value and derivatives of
            opposite sign. The minimum is brackt. If the cubic
            minimizer is closer to x than the quadratic (secant) one,
            the cubic one is taken, else the quadratic one is taken.
         */
        *brackt = 1;
        bound = 0;


        CUBIC_MINIMIZER(mc, *x, *fx, *dx, *t, *ft, *dt);
        QUARD_MINIMIZER2(mq, *x, *dx, *t, *dt);
        if (fabs(mc - *t) > fabs(mq - *t))
        {
            newt = mc;
        }
        else
        {
            newt = mq;
        }

#ifdef VERBOSE
        cout << "Case 2 trial interval." << endl;
        cout << "newt: " << to_out_string(newt, 10) << endl;
#endif
    }
    else if (fabs(*dx) >  fabs(*dt))
    {
        /*
            Case 3: a lower function value, derivatives of the
            same sign, and the magnitude of the derivative decreases.
            The cubic minimizer is only used if the cubic tends to
            infinity in the direction of the minimizer or if the minimum
            of the cubic is beyond t. Otherwise the cubic minimizer is
            defined to be either tmin or tmax. The quadratic (secant)
            minimizer is also computed and if the minimum is brackt
            then the the minimizer closest to x is taken, else the one
            farthest away is taken.
         */
        bound = 1;

        CUBIC_MINIMIZER2(mc, *x, *fx, *dx, *t, *ft, *dt, tmin, tmax);
        QUARD_MINIMIZER2(mq, *x, *dx, *t, *dt);
        if (*brackt)
        {
            if (fabs(*t - mc) < fabs(*t - mq))
            {
                newt = mc;
            }
            else
            {
                newt = mq;
            }
        }
        else
        {
            if (fabs(*t - mc) > fabs(*t - mq))
            {
                newt = mc;
            }
            else
            {
                newt = mq;
            }
        }
#ifdef VERBOSE
        cout << "Case 3 trial interval." << endl;
        cout << "newt: " << to_out_string(newt, 10) << endl;
#endif
    }
    else
    {
        /*
            Case 4: a lower function value, derivatives of the
            same sign, and the magnitude of the derivative does
            not decrease. If the minimum is not brackt, the step
            is either tmin or tmax, else the cubic minimizer is taken.
         */
        bound = 0;
        if (*brackt)
        {
            CUBIC_MINIMIZER(newt, *t, *ft, *dt, *y, *fy, *dy);
        }
        else if (*x < *t)
        {
            newt = tmax;
        }
        else
        {
            newt = tmin;
        }
#ifdef VERBOSE
        cout << "Case 4 trial interval." << endl;
#endif
    }

    /*
        Update the interval of uncertainty. This update does not
        depend on the new step or the case analysis above.

        - Case a: if f(x) < f(t),
            x <- x, y <- t.
        - Case b: if f(t) <= f(x) && f'(t)*f'(x) > 0,
            x <- t, y <- y.
        - Case c: if f(t) <= f(x) && f'(t)*f'(x) < 0,
            x <- t, y <- x.
     */
    if (*fx < *ft)
    {
        /* Case a */
        *y = *t;
        *fy = *ft;
        *dy = *dt;
    }
    else
    {
        /* Case c */
        if (dsign)
        {
            *y = *x;
            *fy = *fx;
            *dy = *dx;
        }
        /* Cases b and c */
        *x = *t;
        *fx = *ft;
        *dx = *dt;
    }

    /* Clip the new trial value in [tmin, tmax]. */
    if (tmax < newt) newt = tmax;
    if (newt < tmin) newt = tmin;

    /*
        Redefine the new trial value if it is close to the upper bound
        of the interval.
     */
    if (*brackt && bound)
    {
        mq = *x + 0.66 * (*y - *x);
        if (*x < *y)
        {
            if (mq < newt) newt = mq;
        }
        else
        {
            if (newt < mq) newt = mq;
        }
    }

    /* Return the new trial value. */
    *t = newt;
    return 0;
}




template <typename floatval_t>
static floatval_t owlqn_x1norm(const floatval_t* x, const int start, const int n)
{
    int i;
    floatval_t norm = 0.;

    for (i = start;i < n;++i)
    {
        norm += fabs(x[i]);
    }

    return norm;
}

template <typename floatval_t>
static void owlqn_pseudo_gradient(floatval_t* pg, const floatval_t* x, const floatval_t* g,
    const int n, const floatval_t c, const int start, const int end, const floatval_t EPS)
{
    int i;

    /* Compute the negative of gradients. */
    for (i = 0;i < start;++i)
    {
        pg[i] = g[i];
    }

    /* Compute the psuedo-gradients. */
    for (i = start;i < end;++i)
    {
        if (x[i] < EPS)
        {
            /* Differentiable. */
            pg[i] = g[i] - c;
        }
        else if (EPS < x[i])
        {
            /* Differentiable. */
            pg[i] = g[i] + c;
        }
        else
        {
            if (g[i] + c < -EPS)
            {
                /* Take the right partial derivative. */
                pg[i] = g[i] + c;
            }
            else if (g[i] - c > EPS)
            {
                /* Take the left partial derivative. */
                pg[i] = g[i] - c;
            }
            else
            {
                pg[i] = 0.;
            }
        }
    }

    for (i = end;i < n;++i)
    {
        pg[i] = g[i];
    }
}

template <typename floatval_t>
static void owlqn_project(floatval_t* d, const floatval_t* sign, const int start, const int end, const floatval_t EPS)
{
    int i;
    

    for (i = start;i < end;++i)
    {
        if (d[i] * sign[i] < EPS)
        {
            d[i] = 0.;
        }
    }
}
