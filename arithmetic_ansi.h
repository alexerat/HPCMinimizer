/*
 *      ANSI C implementation of vector operations.
 *
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

#include <stdlib.h>
#include <memory.h>

#define fsigndiff(x, y) (*y) > 0. ? ((*x) < EPS) : ((*x) > -EPS)

inline static void* vecalloc(size_t size)
{
    void *memblock = malloc(size);
    if (memblock) {
        memset(memblock, 0, size);
    }
    return memblock;
}

inline static void vecfree(void *memblock)
{
    free(memblock);
}

template <typename floatval_t>
inline static void vecset(floatval_t *x, const floatval_t c, const int n)
{
    int i;

    for (i = 0;i < n;++i) {
        x[i] = c;
    }
}

template <typename floatval_t>
inline static void veccpy(floatval_t *y, const floatval_t *x, const int n)
{
    int i;

    for (i = 0;i < n;++i) {
        y[i] = x[i];
    }
}

template <typename floatval_t>
inline static void vecncpy(floatval_t *y, const floatval_t *x, const int n)
{
    int i;

    for (i = 0;i < n;++i) {
        y[i] = -x[i];
    }
}

template <typename floatval_t>
inline static void vecadd(floatval_t *y, const floatval_t *x, const floatval_t c, const int n)
{
    int i;

    for (i = 0;i < n;++i) {
        y[i] += c * x[i];
    }
}

template <typename floatval_t>
inline static void vecdiff(floatval_t *z, const floatval_t *x, const floatval_t *y, const int n)
{
    int i;

    for (i = 0;i < n;++i) {
        z[i] = x[i] - y[i];
    }
}

template <typename floatval_t>
inline static void vecscale(floatval_t *y, const floatval_t c, const int n)
{
    int i;

    for (i = 0;i < n;++i) {
        y[i] *= c;
    }
}

template <typename floatval_t>
inline static void vecmul(floatval_t *y, const floatval_t *x, const int n)
{
    int i;

    for (i = 0;i < n;++i) {
        y[i] *= x[i];
    }
}

template <typename floatval_t>
inline static void vecdot(floatval_t* s, const floatval_t *x, const floatval_t *y, const int n)
{
    int i;
    *s = 0.;
    for (i = 0;i < n;++i) {
        *s += x[i] * y[i];
    }
}

template <typename floatval_t>
inline static void subvecdot(floatval_t* s, const floatval_t *x, const floatval_t *y, const bool* exclude, const int n)
{
    int i;
    *s = 0.;
    for (i = 0;i < n;++i)
    {
        if(!exclude[i])
            *s += x[i] * y[i];
    }
}

template <typename floatval_t>
inline static void vec2norm(floatval_t* s, const floatval_t *x, const int n)
{
    vecdot(s, x, x, n);
    *s = (floatval_t)sqrt(*s);
}

template <typename floatval_t>
inline static void vec2norminv(floatval_t* s, const floatval_t *x, const int n)
{
    vec2norm(s, x, n);
    *s = (floatval_t)(1.0 / *s);
}
