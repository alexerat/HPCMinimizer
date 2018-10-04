#pragma once

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <memory.h>
#include "precision.h"

#ifdef  __cplusplus
extern "C" {
#endif/*__cplusplus*/

/**
 * Callback interface to provide objective function evaluations.
 *
 *  The de() function call this function to obtain the values of objective
 *  function and its gradients when needed. A client program must implement
 *  this function to evaluate the values of the objective function and its
 *  gradients, given current values of variables.
 *
 *  @param  instance    The user data sent for de() function by the client.
 *  @param  x           The current values of variables.
 *  @param  params      The additional parameters provided to the function.
 *  @param  n           The number of variables.
 *  @retval floatval_t The value of the objective function for the current
 *                          variables.
 */
typedef floatval_t (*de_evaluate_t)(
    void *instance,
    const floatval_t *x,
    const floatval_t *params,
    const int n
    );

int de(int D, floatval_t *x, floatval_t *ptr_fx, floatval_t* lbound, floatval_t* ubound, floatval_t *extparams,
       de_evaluate_t proc_evaluate, void *instance, int NP, floatval_t* ini_lbound, floatval_t* ini_ubound,
       int strategy, int genmax, floatval_t F, floatval_t CR, int refresh, floatval_t* c, floatval_t* d,
       floatval_t* oldarray, floatval_t* newarray, floatval_t* swaparray, floatval_t* tmp, floatval_t* best,
       floatval_t* bestit, floatval_t* energy);

#ifdef  __cplusplus
}
#endif/*__cplusplus*/
