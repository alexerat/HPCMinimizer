/*
 * xpdeint.h
 * Copyright (C) 2008-2012 Graham Dennis (graham.dennis@anu.edu.au) and Joe Hope. All rights reserved.
 *
*/

#ifndef xpdeint_h
#define xpdeint_h

#ifndef _xmds_malloc
  #define _xmds_malloc(n) _aligned_malloc(n, 16)
#endif

#ifndef xmds_free
  #define xmds_free   _aligned_free
#endif



namespace std {
  inline complex<float> operator*(const complex<float>& a, const double b) { return a*float(b); }
  inline complex<float> operator*(const double b, const complex<float>& a) { return a*float(b); }
  inline complex<float> operator/(const complex<float>& a, const double b) { return a/float(b); }
  inline complex<float> operator/(const double b, const complex<float>& a) { return float(b)/a; }
  inline complex<float> operator+(const complex<float>& a, const double b) { return a + float(b); }
  inline complex<float> operator+(const double b, const complex<float>& a) { return a + float(b); }
  inline complex<float> operator-(const complex<float>& a, const double b) { return a - float(b); }
  inline complex<float> operator-(const double b, const complex<float>& a) { return float(b) - a; }
}



#endif // xpdeint_h

