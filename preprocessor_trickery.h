/*https://github.com/pfultz2/Cloak/wiki/C-Preprocessor-tricks,-tips,-and-idioms#deferred-expression*/
#define EMPTY_PP()
#define DEFER_PP(id) id EMPTY_PP()
#define OBSTRUCT_PP(...) __VA_ARGS__ DEFER_PP(EMPTY_PP)()
#define EXPAND_PP(...) __VA_ARGS__

#define EVAL_PP(...)  EVAL_PP1(EVAL_PP1(EVAL_PP1(__VA_ARGS__)))
#define EVAL_PP1(...) EVAL_PP2(EVAL_PP2(EVAL_PP2(__VA_ARGS__)))
#define EVAL_PP2(...) EVAL_PP3(EVAL_PP3(EVAL_PP3(__VA_ARGS__)))
#define EVAL_PP3(...) EVAL_PP4(EVAL_PP4(EVAL_PP4(__VA_ARGS__)))
#define EVAL_PP4(...) EVAL_PP5(EVAL_PP5(EVAL_PP5(__VA_ARGS__)))
#define EVAL_PP5(...) __VA_ARGS__

#define CAT_PP(a, ...) PRIMITIVE_CAT_PP(a, __VA_ARGS__)
#define PRIMITIVE_CAT_PP(a, ...) a ## __VA_ARGS__

#define INC_PP(x) PRIMITIVE_CAT_PP(INC_PP_, x)
#define INC_PP_0 1
#define INC_PP_1 2
#define INC_PP_2 3
#define INC_PP_3 4
#define INC_PP_4 5
#define INC_PP_5 6
#define INC_PP_6 7
#define INC_PP_7 8
#define INC_PP_8 9
#define INC_PP_9 9

#define DEC_PP(x) PRIMITIVE_CAT_PP(DEC_PP_, x)
#define DEC_PP_0 0
#define DEC_PP_1 0
#define DEC_PP_2 1
#define DEC_PP_3 2
#define DEC_PP_4 3
#define DEC_PP_5 4
#define DEC_PP_6 5
#define DEC_PP_7 6
#define DEC_PP_8 7
#define DEC_PP_9 8

#define CHECK_N_PP(x, n, ...) n
#define CHECK_PP(...) CHECK_N_PP(__VA_ARGS__, 0,)

#define NOT_PP(x) CHECK_PP(PRIMITIVE_CAT_PP(NOT_PP_, x))
#define NOT_PP_0 ~, 1,

#define COMPL_PP(b) PRIMITIVE_CAT_PP(COMPL_PP_, b)
#define COMPL_PP_0 1
#define COMPL_PP_1 0

#define BOOL_PP(x) COMPL_PP(NOT_PP(x))

#define IIF_PP(c) PRIMITIVE_CAT_PP(IIF_PP_, c)
#define IIF_PP_0(t, ...) __VA_ARGS__
#define IIF_PP_1(t, ...) t

#define IF_PP(c) IIF_PP(BOOL_PP(c))

#define COMMA_PP() ,
#define COMMA_IF_PP(n) IF_PP(n)(COMMA_PP, EAT_PP)()

#define EAT_PP(...)
#define EXPAND_PP(...) __VA_ARGS__
#define WHEN_PP(c) IF_PP(c)(EXPAND_PP, EAT_PP)

#define REPEAT_PP(count, macro, ...) \
    WHEN_PP(count) \
    ( \
        OBSTRUCT_PP(REPEAT_INDIRECT_PP) () \
        ( \
            DEC_PP(count), macro, __VA_ARGS__ \
        ) \
        OBSTRUCT_PP(macro) \
        ( \
            DEC_PP(count), __VA_ARGS__ \
        ) \
    )
#define REPEAT_INDIRECT_PP() REPEAT_PP


