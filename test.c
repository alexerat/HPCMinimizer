#ifdef ROBUST
#define IFDEF_ROBUST(...) __VA_ARGS__
#define IFDEF_NROBUST(...)
#else
#define IFDEF_ROBUST(...)
#define IFDEF_NROBUST(...) __VA_ARGS__
#endif


#define lbgfs_code(NUM) template <typename floatval_t> \
static floatval_t lbgfs_evaluate_##NUM( \
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

lbgfs_code(1)


#define STAGELIST 1,2,3,4,5

/*
#define EMPTY()
#define DEFER(id) id EMPTY()
#define OBSTRUCT(id) id DEFER(EMPTY)()
#define PP_NARG(...) \
           PP_NARG_(__VA_ARGS__,PP_RSEQ_N())
#define PP_NARG_(...) \
           PP_ARG_N(__VA_ARGS__)
#define PP_ARG_N( \
              _1, _2, _3, _4, _5, _6, _7, _8, _9,_10, \
             _11,_12,_13,_14,_15,_16,_17,_18,_19,_20, \
             _21,_22,_23,_24,_25,_26,_27,_28,_29,_30, \
             _31,_32,_33,_34,_35,_36,_37,_38,_39,_40, \
             _41,_42,_43,_44,_45,_46,_47,_48,_49,_50, \
             _51,_52,_53,_54,_55,_56,_57,_58,_59,_60, \
             _61,_62,_63,N,...) N
#define PP_RSEQ_N() \
           63,62,61,60,                   \
         59,58,57,56,55,54,53,52,51,50, \
         49,48,47,46,45,44,43,42,41,40, \
         39,38,37,36,35,34,33,32,31,30, \
         29,28,27,26,25,24,23,22,21,20, \
         19,18,17,16,15,14,13,12,11,10, \
         9,8,7,6,5,4,3,2,1,0

#define PP_NEXTARG(x,...) x
#define PP_REMARG(x,...) __VA_ARGS__

#define _MACRO_CONCAT(a,b)  a ## b
#define MACRO_CONCAT(a,b)  _MACRO_CONCAT(a,b)

#define _WITH1(a,b)        a b
#define _WITH2(a,b, bs...) a b ; _WITH1(a, bs)
#define _WITH3(a,b, bs...) a b ; _WITH2(a, bs)
#define _WITH4(a,b, bs...) a b ; _WITH3(a, bs)
#define _WITH5(a,b, bs...) a b ; _WITH4(a, bs)
#define _WITH6(a,b, bs...) a b ; _WITH5(a, bs)
#define _WITH7(a,b, bs...) a b ; _WITH6(a, bs)
#define _WITH8(a,b, bs...) a b ; _WITH7(a, bs)
#define _WITH9(a,b, bs...) a b ; _WITH8(a, bs)
#define _WITH10(a,b, bs...) a b ; _WITH9(a, bs)
#define _WITH11(a,b, bs...) a b ; _WITH10(a, bs)
#define _WITH12(a,b, bs...) a b ; _WITH11(a, bs)
#define _WITH13(a,b, bs...) a b ; _WITH12(a, bs)
#define _WITH14(a,b, bs...) a b ; _WITH13(a, bs)
#define _WITH15(a,b, bs...) a b ; _WITH14(a, bs)
#define _WITH16(a,b, bs...) a b ; _WITH15(a, bs)
#define _WITH17(a,b, bs...) a b ; _WITH16(a, bs)
#define _WITH18(a,b, bs...) a b ; _WITH17(a, bs)
#define _WITH19(a,b, bs...) a b ; _WITH18(a, bs)
#define _WITH20(a,b, bs...) a b ; _WITH19(a, bs)
#define _WITH21(a,b, bs...) a b ; _WITH20(a, bs)
#define _WITH22(a,b, bs...) a b ; _WITH21(a, bs)
#define _WITH23(a,b, bs...) a b ; _WITH22(a, bs)
#define _WITH24(a,b, bs...) a b ; _WITH23(a, bs)
#define _WITH25(a,b, bs...) a b ; _WITH24(a, bs)
#define _WITH26(a,b, bs...) a b ; _WITH25(a, bs)
#define _WITH27(a,b, bs...) a b ; _WITH26(a, bs)
#define _WITH28(a,b, bs...) a b ; _WITH27(a, bs)
#define _WITH29(a,b, bs...) a b ; _WITH28(a, bs)
#define _WITH30(a,b, bs...) a b ; _WITH29(a, bs)
#define _WITH31(a,b, bs...) a b ; _WITH30(a, bs)
#define _WITH32(a,b, bs...) a b ; _WITH31(a, bs)
#define _WITH33(a,b, bs...) a b ; _WITH32(a, bs)
#define _WITH34(a,b, bs...) a b ; _WITH33(a, bs)
#define _WITH35(a,b, bs...) a b ; _WITH34(a, bs)
#define _WITH36(a,b, bs...) a b ; _WITH35(a, bs)
#define _WITH37(a,b, bs...) a b ; _WITH36(a, bs)
#define _WITH38(a,b, bs...) a b ; _WITH37(a, bs)
#define _WITH39(a,b, bs...) a b ; _WITH38(a, bs)
#define _WITH40(a,b, bs...) a b ; _WITH39(a, bs)
#define _WITH41(a,b, bs...) a b ; _WITH40(a, bs)
#define _WITH42(a,b, bs...) a b ; _WITH41(a, bs)
#define _WITH43(a,b, bs...) a b ; _WITH42(a, bs)
#define _WITH44(a,b, bs...) a b ; _WITH43(a, bs)
#define _WITH45(a,b, bs...) a b ; _WITH44(a, bs)
#define _WITH46(a,b, bs...) a b ; _WITH45(a, bs)
#define _WITH47(a,b, bs...) a b ; _WITH46(a, bs)
#define _WITH48(a,b, bs...) a b ; _WITH47(a, bs)
#define _WITH49(a,b, bs...) a b ; _WITH48(a, bs)
#define _WITH50(a,b, bs...) a b ; _WITH49(a, bs)
#define _WITH51(a,b, bs...) a b ; _WITH50(a, bs)
#define _WITH52(a,b, bs...) a b ; _WITH51(a, bs)
#define _WITH53(a,b, bs...) a b ; _WITH52(a, bs)
#define _WITH54(a,b, bs...) a b ; _WITH53(a, bs)
#define _WITH55(a,b, bs...) a b ; _WITH54(a, bs)
#define _WITH56(a,b, bs...) a b ; _WITH55(a, bs)
#define _WITH57(a,b, bs...) a b ; _WITH56(a, bs)
#define _WITH58(a,b, bs...) a b ; _WITH57(a, bs)
#define _WITH59(a,b, bs...) a b ; _WITH58(a, bs)
#define _WITH60(a,b, bs...) a b ; _WITH59(a, bs)
#define _WITH61(a,b, bs...) a b ; _WITH60(a, bs)
#define _WITH62(a,b, bs...) a b ; _WITH61(a, bs)
#define _WITH63(a,b, bs...) a b ; _WITH62(a, bs)
#define _WITH64(a,b, bs...) a b ; _WITH63(a, bs)


#define EMPTY()
#define DEFER(id) id EMPTY()
#define OBSTRUCT(id) id DEFER(EMPTY)()
#define lbgfs_code_(x) lbgfs_code(x) 


#define WITH(prefix, ...) MACRO_CONCAT(_WITH,PP_NARG(__VA_ARGS__))(prefix, __VA_ARGS__)

WITH(x,STAGELIST)
*/

#define EMPTY()
#define DEFER(id) id EMPTY()
#define OBSTRUCT(...) __VA_ARGS__ DEFER(EMPTY)()
#define EXPAND(...) __VA_ARGS__

#define EVAL(...)  EVAL1(EVAL1(EVAL1(__VA_ARGS__)))
#define EVAL1(...) EVAL2(EVAL2(EVAL2(__VA_ARGS__)))
#define EVAL2(...) EVAL3(EVAL3(EVAL3(__VA_ARGS__)))
#define EVAL3(...) EVAL4(EVAL4(EVAL4(__VA_ARGS__)))
#define EVAL4(...) EVAL5(EVAL5(EVAL5(__VA_ARGS__)))
#define EVAL5(...) __VA_ARGS__

#define CAT(a, ...) PRIMITIVE_CAT(a, __VA_ARGS__)
#define PRIMITIVE_CAT(a, ...) a ## __VA_ARGS__

#define INC(x) PRIMITIVE_CAT(INC_, x)
#define INC_0 1
#define INC_1 2
#define INC_2 3
#define INC_3 4
#define INC_4 5
#define INC_5 6
#define INC_6 7
#define INC_7 8
#define INC_8 9
#define INC_9 9

#define DEC(x) PRIMITIVE_CAT(DEC_, x)
#define DEC_0 0
#define DEC_1 0
#define DEC_2 1
#define DEC_3 2
#define DEC_4 3
#define DEC_5 4
#define DEC_6 5
#define DEC_7 6
#define DEC_8 7
#define DEC_9 8

#define CHECK_N(x, n, ...) n
#define CHECK(...) CHECK_N(__VA_ARGS__, 0,)

#define NOT(x) CHECK(PRIMITIVE_CAT(NOT_, x))
#define NOT_0 ~, 1,

#define COMPL(b) PRIMITIVE_CAT(COMPL_, b)
#define COMPL_0 1
#define COMPL_1 0

#define BOOL(x) COMPL(NOT(x))

#define IIF(c) PRIMITIVE_CAT(IIF_, c)
#define IIF_0(t, ...) __VA_ARGS__
#define IIF_1(t, ...) t

#define IF(c) IIF(BOOL(c))

#define EAT(...)
#define EXPAND(...) __VA_ARGS__
#define WHEN(c) IF(c)(EXPAND, EAT)

#define REPEAT(count, macro, ...) \
    WHEN(count) \
    ( \
        OBSTRUCT(REPEAT_INDIRECT) () \
        ( \
            DEC(count), macro, __VA_ARGS__ \
        ) \
        OBSTRUCT(macro) \
        ( \
            DEC(count), __VA_ARGS__ \
        ) \
    )
#define REPEAT_INDIRECT() REPEAT

//An example of using this macro
#define M(i, _) lbgfs_code(i)
EVAL(REPEAT(8, M, ~)) // 0 1 2 3 4 5 6 7

/*
#define WITH(...) lbgfs_code_(PP_NEXTARG(__VA_ARGS__)) OBSTRUCT(WITH_) () \
   (PP_REMARG(__VA_ARGS__)),__VA_ARGS__

#define WITH_() WITH*/