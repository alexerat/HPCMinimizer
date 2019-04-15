# 1 "localMinima.cpp"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "localMinima.cpp"
# 1 "/usr/include/time.h" 1 3 4
# 27 "/usr/include/time.h" 3 4
# 1 "/usr/include/features.h" 1 3 4
# 367 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 1 3 4
# 410 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 411 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 2 3 4
# 368 "/usr/include/features.h" 2 3 4
# 391 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 1 3 4
# 10 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h" 1 3 4
# 11 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 2 3 4
# 392 "/usr/include/features.h" 2 3 4
# 28 "/usr/include/time.h" 2 3 4


# 29 "/usr/include/time.h" 3 4
extern "C" {







# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 1 3 4
# 216 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 38 "/usr/include/time.h" 2 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/time.h" 1 3 4
# 26 "/usr/include/x86_64-linux-gnu/bits/time.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/bits/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 28 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4


typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;


typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;

typedef signed long int __int64_t;
typedef unsigned long int __uint64_t;







typedef long int __quad_t;
typedef unsigned long int __u_quad_t;
# 121 "/usr/include/x86_64-linux-gnu/bits/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/typesizes.h" 1 3 4
# 122 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4


typedef unsigned long int __dev_t;
typedef unsigned int __uid_t;
typedef unsigned int __gid_t;
typedef unsigned long int __ino_t;
typedef unsigned long int __ino64_t;
typedef unsigned int __mode_t;
typedef unsigned long int __nlink_t;
typedef long int __off_t;
typedef long int __off64_t;
typedef int __pid_t;
typedef struct { int __val[2]; } __fsid_t;
typedef long int __clock_t;
typedef unsigned long int __rlim_t;
typedef unsigned long int __rlim64_t;
typedef unsigned int __id_t;
typedef long int __time_t;
typedef unsigned int __useconds_t;
typedef long int __suseconds_t;

typedef int __daddr_t;
typedef int __key_t;


typedef int __clockid_t;


typedef void * __timer_t;


typedef long int __blksize_t;




typedef long int __blkcnt_t;
typedef long int __blkcnt64_t;


typedef unsigned long int __fsblkcnt_t;
typedef unsigned long int __fsblkcnt64_t;


typedef unsigned long int __fsfilcnt_t;
typedef unsigned long int __fsfilcnt64_t;


typedef long int __fsword_t;

typedef long int __ssize_t;


typedef long int __syscall_slong_t;

typedef unsigned long int __syscall_ulong_t;



typedef __off64_t __loff_t;
typedef __quad_t *__qaddr_t;
typedef char *__caddr_t;


typedef long int __intptr_t;


typedef unsigned int __socklen_t;
# 27 "/usr/include/x86_64-linux-gnu/bits/time.h" 2 3 4



struct timeval
  {
    __time_t tv_sec;
    __suseconds_t tv_usec;
  };
# 88 "/usr/include/x86_64-linux-gnu/bits/time.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/timex.h" 1 3 4
# 25 "/usr/include/x86_64-linux-gnu/bits/timex.h" 3 4
struct timex
{
  unsigned int modes;
  __syscall_slong_t offset;
  __syscall_slong_t freq;
  __syscall_slong_t maxerror;
  __syscall_slong_t esterror;
  int status;
  __syscall_slong_t constant;
  __syscall_slong_t precision;
  __syscall_slong_t tolerance;
  struct timeval time;
  __syscall_slong_t tick;
  __syscall_slong_t ppsfreq;
  __syscall_slong_t jitter;
  int shift;
  __syscall_slong_t stabil;
  __syscall_slong_t jitcnt;
  __syscall_slong_t calcnt;
  __syscall_slong_t errcnt;
  __syscall_slong_t stbcnt;

  int tai;


  int :32; int :32; int :32; int :32;
  int :32; int :32; int :32; int :32;
  int :32; int :32; int :32;
};
# 89 "/usr/include/x86_64-linux-gnu/bits/time.h" 2 3 4

extern "C" {


extern int clock_adjtime (__clockid_t __clock_id, struct timex *__utx) throw ();

}
# 42 "/usr/include/time.h" 2 3 4
# 57 "/usr/include/time.h" 3 4


typedef __clock_t clock_t;



# 73 "/usr/include/time.h" 3 4


typedef __time_t time_t;



# 91 "/usr/include/time.h" 3 4
typedef __clockid_t clockid_t;
# 103 "/usr/include/time.h" 3 4
typedef __timer_t timer_t;
# 120 "/usr/include/time.h" 3 4
struct timespec
  {
    __time_t tv_sec;
    __syscall_slong_t tv_nsec;
  };








struct tm
{
  int tm_sec;
  int tm_min;
  int tm_hour;
  int tm_mday;
  int tm_mon;
  int tm_year;
  int tm_wday;
  int tm_yday;
  int tm_isdst;


  long int tm_gmtoff;
  const char *tm_zone;




};








struct itimerspec
  {
    struct timespec it_interval;
    struct timespec it_value;
  };


struct sigevent;





typedef __pid_t pid_t;
# 186 "/usr/include/time.h" 3 4



extern clock_t clock (void) throw ();


extern time_t time (time_t *__timer) throw ();


extern double difftime (time_t __time1, time_t __time0)
     throw () __attribute__ ((__const__));


extern time_t mktime (struct tm *__tp) throw ();





extern size_t strftime (char *__restrict __s, size_t __maxsize,
   const char *__restrict __format,
   const struct tm *__restrict __tp) throw ();





extern char *strptime (const char *__restrict __s,
         const char *__restrict __fmt, struct tm *__tp)
     throw ();





# 1 "/usr/include/xlocale.h" 1 3 4
# 27 "/usr/include/xlocale.h" 3 4
typedef struct __locale_struct
{

  struct __locale_data *__locales[13];


  const unsigned short int *__ctype_b;
  const int *__ctype_tolower;
  const int *__ctype_toupper;


  const char *__names[13];
} *__locale_t;


typedef __locale_t locale_t;
# 222 "/usr/include/time.h" 2 3 4

extern size_t strftime_l (char *__restrict __s, size_t __maxsize,
     const char *__restrict __format,
     const struct tm *__restrict __tp,
     __locale_t __loc) throw ();



extern char *strptime_l (const char *__restrict __s,
    const char *__restrict __fmt, struct tm *__tp,
    __locale_t __loc) throw ();






extern struct tm *gmtime (const time_t *__timer) throw ();



extern struct tm *localtime (const time_t *__timer) throw ();





extern struct tm *gmtime_r (const time_t *__restrict __timer,
       struct tm *__restrict __tp) throw ();



extern struct tm *localtime_r (const time_t *__restrict __timer,
          struct tm *__restrict __tp) throw ();





extern char *asctime (const struct tm *__tp) throw ();


extern char *ctime (const time_t *__timer) throw ();







extern char *asctime_r (const struct tm *__restrict __tp,
   char *__restrict __buf) throw ();


extern char *ctime_r (const time_t *__restrict __timer,
        char *__restrict __buf) throw ();




extern char *__tzname[2];
extern int __daylight;
extern long int __timezone;




extern char *tzname[2];



extern void tzset (void) throw ();



extern int daylight;
extern long int timezone;





extern int stime (const time_t *__when) throw ();
# 319 "/usr/include/time.h" 3 4
extern time_t timegm (struct tm *__tp) throw ();


extern time_t timelocal (struct tm *__tp) throw ();


extern int dysize (int __year) throw () __attribute__ ((__const__));
# 334 "/usr/include/time.h" 3 4
extern int nanosleep (const struct timespec *__requested_time,
        struct timespec *__remaining);



extern int clock_getres (clockid_t __clock_id, struct timespec *__res) throw ();


extern int clock_gettime (clockid_t __clock_id, struct timespec *__tp) throw ();


extern int clock_settime (clockid_t __clock_id, const struct timespec *__tp)
     throw ();






extern int clock_nanosleep (clockid_t __clock_id, int __flags,
       const struct timespec *__req,
       struct timespec *__rem);


extern int clock_getcpuclockid (pid_t __pid, clockid_t *__clock_id) throw ();




extern int timer_create (clockid_t __clock_id,
    struct sigevent *__restrict __evp,
    timer_t *__restrict __timerid) throw ();


extern int timer_delete (timer_t __timerid) throw ();


extern int timer_settime (timer_t __timerid, int __flags,
     const struct itimerspec *__restrict __value,
     struct itimerspec *__restrict __ovalue) throw ();


extern int timer_gettime (timer_t __timerid, struct itimerspec *__value)
     throw ();


extern int timer_getoverrun (timer_t __timerid) throw ();





extern int timespec_get (struct timespec *__ts, int __base)
     throw () __attribute__ ((__nonnull__ (1)));
# 403 "/usr/include/time.h" 3 4
extern int getdate_err;
# 412 "/usr/include/time.h" 3 4
extern struct tm *getdate (const char *__string);
# 426 "/usr/include/time.h" 3 4
extern int getdate_r (const char *__restrict __string,
        struct tm *__restrict __resbufp);


}
# 2 "localMinima.cpp" 2
# 1 "/usr/include/stdlib.h" 1 3 4
# 32 "/usr/include/stdlib.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 1 3 4
# 33 "/usr/include/stdlib.h" 2 3 4

extern "C" {






# 1 "/usr/include/x86_64-linux-gnu/bits/waitflags.h" 1 3 4
# 50 "/usr/include/x86_64-linux-gnu/bits/waitflags.h" 3 4
typedef enum
{
  P_ALL,
  P_PID,
  P_PGID
} idtype_t;
# 42 "/usr/include/stdlib.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h" 1 3 4
# 64 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h" 3 4
# 1 "/usr/include/endian.h" 1 3 4
# 36 "/usr/include/endian.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/endian.h" 1 3 4
# 37 "/usr/include/endian.h" 2 3 4
# 60 "/usr/include/endian.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 1 3 4
# 28 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 29 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 2 3 4






# 1 "/usr/include/x86_64-linux-gnu/bits/byteswap-16.h" 1 3 4
# 36 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 2 3 4
# 44 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 3 4
static __inline unsigned int
__bswap_32 (unsigned int __bsx)
{
  return __builtin_bswap32 (__bsx);
}
# 108 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 3 4
static __inline __uint64_t
__bswap_64 (__uint64_t __bsx)
{
  return __builtin_bswap64 (__bsx);
}
# 61 "/usr/include/endian.h" 2 3 4
# 65 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h" 2 3 4

union wait
  {
    int w_status;
    struct
      {

 unsigned int __w_termsig:7;
 unsigned int __w_coredump:1;
 unsigned int __w_retcode:8;
 unsigned int:16;







      } __wait_terminated;
    struct
      {

 unsigned int __w_stopval:8;
 unsigned int __w_stopsig:8;
 unsigned int:16;






      } __wait_stopped;
  };
# 43 "/usr/include/stdlib.h" 2 3 4
# 95 "/usr/include/stdlib.h" 3 4


typedef struct
  {
    int quot;
    int rem;
  } div_t;



typedef struct
  {
    long int quot;
    long int rem;
  } ldiv_t;







__extension__ typedef struct
  {
    long long int quot;
    long long int rem;
  } lldiv_t;


# 139 "/usr/include/stdlib.h" 3 4
extern size_t __ctype_get_mb_cur_max (void) throw () ;




extern double atof (const char *__nptr)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern int atoi (const char *__nptr)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern long int atol (const char *__nptr)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;





__extension__ extern long long int atoll (const char *__nptr)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;





extern double strtod (const char *__restrict __nptr,
        char **__restrict __endptr)
     throw () __attribute__ ((__nonnull__ (1)));





extern float strtof (const char *__restrict __nptr,
       char **__restrict __endptr) throw () __attribute__ ((__nonnull__ (1)));

extern long double strtold (const char *__restrict __nptr,
       char **__restrict __endptr)
     throw () __attribute__ ((__nonnull__ (1)));





extern long int strtol (const char *__restrict __nptr,
   char **__restrict __endptr, int __base)
     throw () __attribute__ ((__nonnull__ (1)));

extern unsigned long int strtoul (const char *__restrict __nptr,
      char **__restrict __endptr, int __base)
     throw () __attribute__ ((__nonnull__ (1)));




__extension__
extern long long int strtoq (const char *__restrict __nptr,
        char **__restrict __endptr, int __base)
     throw () __attribute__ ((__nonnull__ (1)));

__extension__
extern unsigned long long int strtouq (const char *__restrict __nptr,
           char **__restrict __endptr, int __base)
     throw () __attribute__ ((__nonnull__ (1)));





__extension__
extern long long int strtoll (const char *__restrict __nptr,
         char **__restrict __endptr, int __base)
     throw () __attribute__ ((__nonnull__ (1)));

__extension__
extern unsigned long long int strtoull (const char *__restrict __nptr,
     char **__restrict __endptr, int __base)
     throw () __attribute__ ((__nonnull__ (1)));

# 239 "/usr/include/stdlib.h" 3 4
extern long int strtol_l (const char *__restrict __nptr,
     char **__restrict __endptr, int __base,
     __locale_t __loc) throw () __attribute__ ((__nonnull__ (1, 4)));

extern unsigned long int strtoul_l (const char *__restrict __nptr,
        char **__restrict __endptr,
        int __base, __locale_t __loc)
     throw () __attribute__ ((__nonnull__ (1, 4)));

__extension__
extern long long int strtoll_l (const char *__restrict __nptr,
    char **__restrict __endptr, int __base,
    __locale_t __loc)
     throw () __attribute__ ((__nonnull__ (1, 4)));

__extension__
extern unsigned long long int strtoull_l (const char *__restrict __nptr,
       char **__restrict __endptr,
       int __base, __locale_t __loc)
     throw () __attribute__ ((__nonnull__ (1, 4)));

extern double strtod_l (const char *__restrict __nptr,
   char **__restrict __endptr, __locale_t __loc)
     throw () __attribute__ ((__nonnull__ (1, 3)));

extern float strtof_l (const char *__restrict __nptr,
         char **__restrict __endptr, __locale_t __loc)
     throw () __attribute__ ((__nonnull__ (1, 3)));

extern long double strtold_l (const char *__restrict __nptr,
         char **__restrict __endptr,
         __locale_t __loc)
     throw () __attribute__ ((__nonnull__ (1, 3)));
# 305 "/usr/include/stdlib.h" 3 4
extern char *l64a (long int __n) throw () ;


extern long int a64l (const char *__s)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;




# 1 "/usr/include/x86_64-linux-gnu/sys/types.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
extern "C" {





typedef __u_char u_char;
typedef __u_short u_short;
typedef __u_int u_int;
typedef __u_long u_long;
typedef __quad_t quad_t;
typedef __u_quad_t u_quad_t;
typedef __fsid_t fsid_t;




typedef __loff_t loff_t;



typedef __ino_t ino_t;






typedef __ino64_t ino64_t;




typedef __dev_t dev_t;




typedef __gid_t gid_t;




typedef __mode_t mode_t;




typedef __nlink_t nlink_t;




typedef __uid_t uid_t;





typedef __off_t off_t;






typedef __off64_t off64_t;
# 104 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
typedef __id_t id_t;




typedef __ssize_t ssize_t;





typedef __daddr_t daddr_t;
typedef __caddr_t caddr_t;





typedef __key_t key_t;
# 136 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
typedef __useconds_t useconds_t;



typedef __suseconds_t suseconds_t;





# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 1 3 4
# 147 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4



typedef unsigned long int ulong;
typedef unsigned short int ushort;
typedef unsigned int uint;
# 194 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
typedef int int8_t __attribute__ ((__mode__ (__QI__)));
typedef int int16_t __attribute__ ((__mode__ (__HI__)));
typedef int int32_t __attribute__ ((__mode__ (__SI__)));
typedef int int64_t __attribute__ ((__mode__ (__DI__)));


typedef unsigned int u_int8_t __attribute__ ((__mode__ (__QI__)));
typedef unsigned int u_int16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int u_int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int u_int64_t __attribute__ ((__mode__ (__DI__)));

typedef int register_t __attribute__ ((__mode__ (__word__)));
# 219 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/sys/select.h" 1 3 4
# 30 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/select.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/select.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 23 "/usr/include/x86_64-linux-gnu/bits/select.h" 2 3 4
# 31 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/sigset.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/sigset.h" 3 4
typedef int __sig_atomic_t;




typedef struct
  {
    unsigned long int __val[(1024 / (8 * sizeof (unsigned long int)))];
  } __sigset_t;
# 34 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4



typedef __sigset_t sigset_t;







# 1 "/usr/include/x86_64-linux-gnu/bits/time.h" 1 3 4
# 46 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4
# 54 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
typedef long int __fd_mask;
# 64 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
typedef struct
  {



    __fd_mask fds_bits[1024 / (8 * (int) sizeof (__fd_mask))];





  } fd_set;






typedef __fd_mask fd_mask;
# 96 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
extern "C" {
# 106 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
extern int select (int __nfds, fd_set *__restrict __readfds,
     fd_set *__restrict __writefds,
     fd_set *__restrict __exceptfds,
     struct timeval *__restrict __timeout);
# 118 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
extern int pselect (int __nfds, fd_set *__restrict __readfds,
      fd_set *__restrict __writefds,
      fd_set *__restrict __exceptfds,
      const struct timespec *__restrict __timeout,
      const __sigset_t *__restrict __sigmask);
# 131 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
}
# 220 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/sys/sysmacros.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/sys/sysmacros.h" 3 4
extern "C" {

__extension__
extern unsigned int gnu_dev_major (unsigned long long int __dev)
     throw () __attribute__ ((__const__));
__extension__
extern unsigned int gnu_dev_minor (unsigned long long int __dev)
     throw () __attribute__ ((__const__));
__extension__
extern unsigned long long int gnu_dev_makedev (unsigned int __major,
            unsigned int __minor)
     throw () __attribute__ ((__const__));
# 58 "/usr/include/x86_64-linux-gnu/sys/sysmacros.h" 3 4
}
# 223 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4





typedef __blksize_t blksize_t;






typedef __blkcnt_t blkcnt_t;



typedef __fsblkcnt_t fsblkcnt_t;



typedef __fsfilcnt_t fsfilcnt_t;
# 262 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
typedef __blkcnt64_t blkcnt64_t;
typedef __fsblkcnt64_t fsblkcnt64_t;
typedef __fsfilcnt64_t fsfilcnt64_t;





# 1 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 1 3 4
# 21 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 2 3 4
# 60 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
typedef unsigned long int pthread_t;


union pthread_attr_t
{
  char __size[56];
  long int __align;
};

typedef union pthread_attr_t pthread_attr_t;





typedef struct __pthread_internal_list
{
  struct __pthread_internal_list *__prev;
  struct __pthread_internal_list *__next;
} __pthread_list_t;
# 90 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
typedef union
{
  struct __pthread_mutex_s
  {
    int __lock;
    unsigned int __count;
    int __owner;

    unsigned int __nusers;



    int __kind;

    short __spins;
    short __elision;
    __pthread_list_t __list;
# 125 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
  } __data;
  char __size[40];
  long int __align;
} pthread_mutex_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_mutexattr_t;




typedef union
{
  struct
  {
    int __lock;
    unsigned int __futex;
    __extension__ unsigned long long int __total_seq;
    __extension__ unsigned long long int __wakeup_seq;
    __extension__ unsigned long long int __woken_seq;
    void *__mutex;
    unsigned int __nwaiters;
    unsigned int __broadcast_seq;
  } __data;
  char __size[48];
  __extension__ long long int __align;
} pthread_cond_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_condattr_t;



typedef unsigned int pthread_key_t;



typedef int pthread_once_t;





typedef union
{

  struct
  {
    int __lock;
    unsigned int __nr_readers;
    unsigned int __readers_wakeup;
    unsigned int __writer_wakeup;
    unsigned int __nr_readers_queued;
    unsigned int __nr_writers_queued;
    int __writer;
    int __shared;
    signed char __rwelision;




    unsigned char __pad1[7];


    unsigned long int __pad2;


    unsigned int __flags;

  } __data;
# 220 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
  char __size[56];
  long int __align;
} pthread_rwlock_t;

typedef union
{
  char __size[8];
  long int __align;
} pthread_rwlockattr_t;





typedef volatile int pthread_spinlock_t;




typedef union
{
  char __size[32];
  long int __align;
} pthread_barrier_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_barrierattr_t;
# 271 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4


}
# 315 "/usr/include/stdlib.h" 2 3 4






extern long int random (void) throw ();


extern void srandom (unsigned int __seed) throw ();





extern char *initstate (unsigned int __seed, char *__statebuf,
   size_t __statelen) throw () __attribute__ ((__nonnull__ (2)));



extern char *setstate (char *__statebuf) throw () __attribute__ ((__nonnull__ (1)));







struct random_data
  {
    int32_t *fptr;
    int32_t *rptr;
    int32_t *state;
    int rand_type;
    int rand_deg;
    int rand_sep;
    int32_t *end_ptr;
  };

extern int random_r (struct random_data *__restrict __buf,
       int32_t *__restrict __result) throw () __attribute__ ((__nonnull__ (1, 2)));

extern int srandom_r (unsigned int __seed, struct random_data *__buf)
     throw () __attribute__ ((__nonnull__ (2)));

extern int initstate_r (unsigned int __seed, char *__restrict __statebuf,
   size_t __statelen,
   struct random_data *__restrict __buf)
     throw () __attribute__ ((__nonnull__ (2, 4)));

extern int setstate_r (char *__restrict __statebuf,
         struct random_data *__restrict __buf)
     throw () __attribute__ ((__nonnull__ (1, 2)));






extern int rand (void) throw ();

extern void srand (unsigned int __seed) throw ();




extern int rand_r (unsigned int *__seed) throw ();







extern double drand48 (void) throw ();
extern double erand48 (unsigned short int __xsubi[3]) throw () __attribute__ ((__nonnull__ (1)));


extern long int lrand48 (void) throw ();
extern long int nrand48 (unsigned short int __xsubi[3])
     throw () __attribute__ ((__nonnull__ (1)));


extern long int mrand48 (void) throw ();
extern long int jrand48 (unsigned short int __xsubi[3])
     throw () __attribute__ ((__nonnull__ (1)));


extern void srand48 (long int __seedval) throw ();
extern unsigned short int *seed48 (unsigned short int __seed16v[3])
     throw () __attribute__ ((__nonnull__ (1)));
extern void lcong48 (unsigned short int __param[7]) throw () __attribute__ ((__nonnull__ (1)));





struct drand48_data
  {
    unsigned short int __x[3];
    unsigned short int __old_x[3];
    unsigned short int __c;
    unsigned short int __init;
    __extension__ unsigned long long int __a;

  };


extern int drand48_r (struct drand48_data *__restrict __buffer,
        double *__restrict __result) throw () __attribute__ ((__nonnull__ (1, 2)));
extern int erand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        double *__restrict __result) throw () __attribute__ ((__nonnull__ (1, 2)));


extern int lrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     throw () __attribute__ ((__nonnull__ (1, 2)));
extern int nrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int mrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     throw () __attribute__ ((__nonnull__ (1, 2)));
extern int jrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int srand48_r (long int __seedval, struct drand48_data *__buffer)
     throw () __attribute__ ((__nonnull__ (2)));

extern int seed48_r (unsigned short int __seed16v[3],
       struct drand48_data *__buffer) throw () __attribute__ ((__nonnull__ (1, 2)));

extern int lcong48_r (unsigned short int __param[7],
        struct drand48_data *__buffer)
     throw () __attribute__ ((__nonnull__ (1, 2)));









extern void *malloc (size_t __size) throw () __attribute__ ((__malloc__)) ;

extern void *calloc (size_t __nmemb, size_t __size)
     throw () __attribute__ ((__malloc__)) ;










extern void *realloc (void *__ptr, size_t __size)
     throw () __attribute__ ((__warn_unused_result__));

extern void free (void *__ptr) throw ();




extern void cfree (void *__ptr) throw ();



# 1 "/usr/include/alloca.h" 1 3 4
# 24 "/usr/include/alloca.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 1 3 4
# 25 "/usr/include/alloca.h" 2 3 4

extern "C" {





extern void *alloca (size_t __size) throw ();





}
# 493 "/usr/include/stdlib.h" 2 3 4





extern void *valloc (size_t __size) throw () __attribute__ ((__malloc__)) ;




extern int posix_memalign (void **__memptr, size_t __alignment, size_t __size)
     throw () __attribute__ ((__nonnull__ (1))) ;




extern void *aligned_alloc (size_t __alignment, size_t __size)
     throw () __attribute__ ((__malloc__)) __attribute__ ((__alloc_size__ (2))) ;




extern void abort (void) throw () __attribute__ ((__noreturn__));



extern int atexit (void (*__func) (void)) throw () __attribute__ ((__nonnull__ (1)));




extern "C++" int at_quick_exit (void (*__func) (void))
     throw () __asm ("at_quick_exit") __attribute__ ((__nonnull__ (1)));









extern int on_exit (void (*__func) (int __status, void *__arg), void *__arg)
     throw () __attribute__ ((__nonnull__ (1)));






extern void exit (int __status) throw () __attribute__ ((__noreturn__));





extern void quick_exit (int __status) throw () __attribute__ ((__noreturn__));







extern void _Exit (int __status) throw () __attribute__ ((__noreturn__));






extern char *getenv (const char *__name) throw () __attribute__ ((__nonnull__ (1))) ;





extern char *secure_getenv (const char *__name)
     throw () __attribute__ ((__nonnull__ (1))) ;






extern int putenv (char *__string) throw () __attribute__ ((__nonnull__ (1)));





extern int setenv (const char *__name, const char *__value, int __replace)
     throw () __attribute__ ((__nonnull__ (2)));


extern int unsetenv (const char *__name) throw () __attribute__ ((__nonnull__ (1)));






extern int clearenv (void) throw ();
# 606 "/usr/include/stdlib.h" 3 4
extern char *mktemp (char *__template) throw () __attribute__ ((__nonnull__ (1)));
# 619 "/usr/include/stdlib.h" 3 4
extern int mkstemp (char *__template) __attribute__ ((__nonnull__ (1))) ;
# 629 "/usr/include/stdlib.h" 3 4
extern int mkstemp64 (char *__template) __attribute__ ((__nonnull__ (1))) ;
# 641 "/usr/include/stdlib.h" 3 4
extern int mkstemps (char *__template, int __suffixlen) __attribute__ ((__nonnull__ (1))) ;
# 651 "/usr/include/stdlib.h" 3 4
extern int mkstemps64 (char *__template, int __suffixlen)
     __attribute__ ((__nonnull__ (1))) ;
# 662 "/usr/include/stdlib.h" 3 4
extern char *mkdtemp (char *__template) throw () __attribute__ ((__nonnull__ (1))) ;
# 673 "/usr/include/stdlib.h" 3 4
extern int mkostemp (char *__template, int __flags) __attribute__ ((__nonnull__ (1))) ;
# 683 "/usr/include/stdlib.h" 3 4
extern int mkostemp64 (char *__template, int __flags) __attribute__ ((__nonnull__ (1))) ;
# 693 "/usr/include/stdlib.h" 3 4
extern int mkostemps (char *__template, int __suffixlen, int __flags)
     __attribute__ ((__nonnull__ (1))) ;
# 705 "/usr/include/stdlib.h" 3 4
extern int mkostemps64 (char *__template, int __suffixlen, int __flags)
     __attribute__ ((__nonnull__ (1))) ;









extern int system (const char *__command) ;






extern char *canonicalize_file_name (const char *__name)
     throw () __attribute__ ((__nonnull__ (1))) ;
# 733 "/usr/include/stdlib.h" 3 4
extern char *realpath (const char *__restrict __name,
         char *__restrict __resolved) throw () ;






typedef int (*__compar_fn_t) (const void *, const void *);


typedef __compar_fn_t comparison_fn_t;



typedef int (*__compar_d_fn_t) (const void *, const void *, void *);





extern void *bsearch (const void *__key, const void *__base,
        size_t __nmemb, size_t __size, __compar_fn_t __compar)
     __attribute__ ((__nonnull__ (1, 2, 5))) ;







extern void qsort (void *__base, size_t __nmemb, size_t __size,
     __compar_fn_t __compar) __attribute__ ((__nonnull__ (1, 4)));

extern void qsort_r (void *__base, size_t __nmemb, size_t __size,
       __compar_d_fn_t __compar, void *__arg)
  __attribute__ ((__nonnull__ (1, 4)));




extern int abs (int __x) throw () __attribute__ ((__const__)) ;
extern long int labs (long int __x) throw () __attribute__ ((__const__)) ;



__extension__ extern long long int llabs (long long int __x)
     throw () __attribute__ ((__const__)) ;







extern div_t div (int __numer, int __denom)
     throw () __attribute__ ((__const__)) ;
extern ldiv_t ldiv (long int __numer, long int __denom)
     throw () __attribute__ ((__const__)) ;




__extension__ extern lldiv_t lldiv (long long int __numer,
        long long int __denom)
     throw () __attribute__ ((__const__)) ;

# 811 "/usr/include/stdlib.h" 3 4
extern char *ecvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) throw () __attribute__ ((__nonnull__ (3, 4))) ;




extern char *fcvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) throw () __attribute__ ((__nonnull__ (3, 4))) ;




extern char *gcvt (double __value, int __ndigit, char *__buf)
     throw () __attribute__ ((__nonnull__ (3))) ;




extern char *qecvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     throw () __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qfcvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     throw () __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qgcvt (long double __value, int __ndigit, char *__buf)
     throw () __attribute__ ((__nonnull__ (3))) ;




extern int ecvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) throw () __attribute__ ((__nonnull__ (3, 4, 5)));
extern int fcvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) throw () __attribute__ ((__nonnull__ (3, 4, 5)));

extern int qecvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     throw () __attribute__ ((__nonnull__ (3, 4, 5)));
extern int qfcvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     throw () __attribute__ ((__nonnull__ (3, 4, 5)));






extern int mblen (const char *__s, size_t __n) throw ();


extern int mbtowc (wchar_t *__restrict __pwc,
     const char *__restrict __s, size_t __n) throw ();


extern int wctomb (char *__s, wchar_t __wchar) throw ();



extern size_t mbstowcs (wchar_t *__restrict __pwcs,
   const char *__restrict __s, size_t __n) throw ();

extern size_t wcstombs (char *__restrict __s,
   const wchar_t *__restrict __pwcs, size_t __n)
     throw ();








extern int rpmatch (const char *__response) throw () __attribute__ ((__nonnull__ (1))) ;
# 898 "/usr/include/stdlib.h" 3 4
extern int getsubopt (char **__restrict __optionp,
        char *const *__restrict __tokens,
        char **__restrict __valuep)
     throw () __attribute__ ((__nonnull__ (1, 2, 3))) ;





extern void setkey (const char *__key) throw () __attribute__ ((__nonnull__ (1)));







extern int posix_openpt (int __oflag) ;







extern int grantpt (int __fd) throw ();



extern int unlockpt (int __fd) throw ();




extern char *ptsname (int __fd) throw () ;






extern int ptsname_r (int __fd, char *__buf, size_t __buflen)
     throw () __attribute__ ((__nonnull__ (2)));


extern int getpt (void);






extern int getloadavg (double __loadavg[], int __nelem)
     throw () __attribute__ ((__nonnull__ (1)));


# 1 "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h" 1 3 4
# 955 "/usr/include/stdlib.h" 2 3 4
# 967 "/usr/include/stdlib.h" 3 4
}
# 3 "localMinima.cpp" 2
# 1 "/usr/include/c++/5/string" 1 3
# 36 "/usr/include/c++/5/string" 3
       
# 37 "/usr/include/c++/5/string" 3

# 1 "/usr/include/x86_64-linux-gnu/c++/5/bits/c++config.h" 1 3
# 194 "/usr/include/x86_64-linux-gnu/c++/5/bits/c++config.h" 3
namespace std
{
  typedef long unsigned int size_t;
  typedef long int ptrdiff_t;




}
# 216 "/usr/include/x86_64-linux-gnu/c++/5/bits/c++config.h" 3
namespace std
{
  inline namespace __cxx11 __attribute__((__abi_tag__ ("cxx11"))) { }
}
namespace __gnu_cxx
{
  inline namespace __cxx11 __attribute__((__abi_tag__ ("cxx11"))) { }
}
# 482 "/usr/include/x86_64-linux-gnu/c++/5/bits/c++config.h" 3
# 1 "/usr/include/x86_64-linux-gnu/c++/5/bits/os_defines.h" 1 3
# 483 "/usr/include/x86_64-linux-gnu/c++/5/bits/c++config.h" 2 3


# 1 "/usr/include/x86_64-linux-gnu/c++/5/bits/cpu_defines.h" 1 3
# 486 "/usr/include/x86_64-linux-gnu/c++/5/bits/c++config.h" 2 3
# 39 "/usr/include/c++/5/string" 2 3
# 1 "/usr/include/c++/5/bits/stringfwd.h" 1 3
# 37 "/usr/include/c++/5/bits/stringfwd.h" 3
       
# 38 "/usr/include/c++/5/bits/stringfwd.h" 3


# 1 "/usr/include/c++/5/bits/memoryfwd.h" 1 3
# 46 "/usr/include/c++/5/bits/memoryfwd.h" 3
       
# 47 "/usr/include/c++/5/bits/memoryfwd.h" 3



namespace std __attribute__ ((__visibility__ ("default")))
{

# 63 "/usr/include/c++/5/bits/memoryfwd.h" 3
  template<typename>
    class allocator;

  template<>
    class allocator<void>;


  template<typename, typename>
    struct uses_allocator;




}
# 41 "/usr/include/c++/5/bits/stringfwd.h" 2 3

namespace std __attribute__ ((__visibility__ ("default")))
{








  template<class _CharT>
    struct char_traits;

  template<> struct char_traits<char>;


  template<> struct char_traits<wchar_t>;
# 67 "/usr/include/c++/5/bits/stringfwd.h" 3
namespace __cxx11 {

  template<typename _CharT, typename _Traits = char_traits<_CharT>,
           typename _Alloc = allocator<_CharT> >
    class basic_string;


  typedef basic_string<char> string;



  typedef basic_string<wchar_t> wstring;
# 90 "/usr/include/c++/5/bits/stringfwd.h" 3
}




}
# 40 "/usr/include/c++/5/string" 2 3
# 1 "/usr/include/c++/5/bits/char_traits.h" 1 3
# 37 "/usr/include/c++/5/bits/char_traits.h" 3
       
# 38 "/usr/include/c++/5/bits/char_traits.h" 3

# 1 "/usr/include/c++/5/bits/stl_algobase.h" 1 3
# 60 "/usr/include/c++/5/bits/stl_algobase.h" 3
# 1 "/usr/include/c++/5/bits/functexcept.h" 1 3
# 40 "/usr/include/c++/5/bits/functexcept.h" 3
# 1 "/usr/include/c++/5/bits/exception_defines.h" 1 3
# 41 "/usr/include/c++/5/bits/functexcept.h" 2 3

namespace std __attribute__ ((__visibility__ ("default")))
{



  void
  __throw_bad_exception(void) __attribute__((__noreturn__));


  void
  __throw_bad_alloc(void) __attribute__((__noreturn__));


  void
  __throw_bad_cast(void) __attribute__((__noreturn__));

  void
  __throw_bad_typeid(void) __attribute__((__noreturn__));


  void
  __throw_logic_error(const char*) __attribute__((__noreturn__));

  void
  __throw_domain_error(const char*) __attribute__((__noreturn__));

  void
  __throw_invalid_argument(const char*) __attribute__((__noreturn__));

  void
  __throw_length_error(const char*) __attribute__((__noreturn__));

  void
  __throw_out_of_range(const char*) __attribute__((__noreturn__));

  void
  __throw_out_of_range_fmt(const char*, ...) __attribute__((__noreturn__))
    __attribute__((__format__(__gnu_printf__, 1, 2)));

  void
  __throw_runtime_error(const char*) __attribute__((__noreturn__));

  void
  __throw_range_error(const char*) __attribute__((__noreturn__));

  void
  __throw_overflow_error(const char*) __attribute__((__noreturn__));

  void
  __throw_underflow_error(const char*) __attribute__((__noreturn__));


  void
  __throw_ios_failure(const char*) __attribute__((__noreturn__));

  void
  __throw_system_error(int) __attribute__((__noreturn__));

  void
  __throw_future_error(int) __attribute__((__noreturn__));


  void
  __throw_bad_function_call() __attribute__((__noreturn__));


}
# 61 "/usr/include/c++/5/bits/stl_algobase.h" 2 3
# 1 "/usr/include/c++/5/bits/cpp_type_traits.h" 1 3
# 35 "/usr/include/c++/5/bits/cpp_type_traits.h" 3
       
# 36 "/usr/include/c++/5/bits/cpp_type_traits.h" 3
# 68 "/usr/include/c++/5/bits/cpp_type_traits.h" 3
namespace __gnu_cxx __attribute__ ((__visibility__ ("default")))
{


  template<typename _Iterator, typename _Container>
    class __normal_iterator;


}

namespace std __attribute__ ((__visibility__ ("default")))
{


  struct __true_type { };
  struct __false_type { };

  template<bool>
    struct __truth_type
    { typedef __false_type __type; };

  template<>
    struct __truth_type<true>
    { typedef __true_type __type; };



  template<class _Sp, class _Tp>
    struct __traitor
    {
      enum { __value = bool(_Sp::__value) || bool(_Tp::__value) };
      typedef typename __truth_type<__value>::__type __type;
    };


  template<typename, typename>
    struct __are_same
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };

  template<typename _Tp>
    struct __are_same<_Tp, _Tp>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };


  template<typename _Tp>
    struct __is_void
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };

  template<>
    struct __is_void<void>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };




  template<typename _Tp>
    struct __is_integer
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };





  template<>
    struct __is_integer<bool>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<signed char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<unsigned char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };


  template<>
    struct __is_integer<wchar_t>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
# 199 "/usr/include/c++/5/bits/cpp_type_traits.h" 3
  template<>
    struct __is_integer<short>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<unsigned short>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<int>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<unsigned int>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<long>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<unsigned long>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<long long>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<unsigned long long>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
# 270 "/usr/include/c++/5/bits/cpp_type_traits.h" 3
template<> struct __is_integer<__int128> { enum { __value = 1 }; typedef __true_type __type; }; template<> struct __is_integer<unsigned __int128> { enum { __value = 1 }; typedef __true_type __type; };
# 287 "/usr/include/c++/5/bits/cpp_type_traits.h" 3
  template<typename _Tp>
    struct __is_floating
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };


  template<>
    struct __is_floating<float>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_floating<double>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_floating<long double>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };




  template<typename _Tp>
    struct __is_pointer
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };

  template<typename _Tp>
    struct __is_pointer<_Tp*>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };




  template<typename _Tp>
    struct __is_normal_iterator
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };

  template<typename _Iterator, typename _Container>
    struct __is_normal_iterator< __gnu_cxx::__normal_iterator<_Iterator,
             _Container> >
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };




  template<typename _Tp>
    struct __is_arithmetic
    : public __traitor<__is_integer<_Tp>, __is_floating<_Tp> >
    { };




  template<typename _Tp>
    struct __is_scalar
    : public __traitor<__is_arithmetic<_Tp>, __is_pointer<_Tp> >
    { };




  template<typename _Tp>
    struct __is_char
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };

  template<>
    struct __is_char<char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };


  template<>
    struct __is_char<wchar_t>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };


  template<typename _Tp>
    struct __is_byte
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };

  template<>
    struct __is_byte<char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_byte<signed char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_byte<unsigned char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };




  template<typename _Tp>
    struct __is_move_iterator
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };
# 443 "/usr/include/c++/5/bits/cpp_type_traits.h" 3

}
# 62 "/usr/include/c++/5/bits/stl_algobase.h" 2 3
# 1 "/usr/include/c++/5/ext/type_traits.h" 1 3
# 32 "/usr/include/c++/5/ext/type_traits.h" 3
       
# 33 "/usr/include/c++/5/ext/type_traits.h" 3




namespace __gnu_cxx __attribute__ ((__visibility__ ("default")))
{



  template<bool, typename>
    struct __enable_if
    { };

  template<typename _Tp>
    struct __enable_if<true, _Tp>
    { typedef _Tp __type; };



  template<bool _Cond, typename _Iftrue, typename _Iffalse>
    struct __conditional_type
    { typedef _Iftrue __type; };

  template<typename _Iftrue, typename _Iffalse>
    struct __conditional_type<false, _Iftrue, _Iffalse>
    { typedef _Iffalse __type; };



  template<typename _Tp>
    struct __add_unsigned
    {
    private:
      typedef __enable_if<std::__is_integer<_Tp>::__value, _Tp> __if_type;

    public:
      typedef typename __if_type::__type __type;
    };

  template<>
    struct __add_unsigned<char>
    { typedef unsigned char __type; };

  template<>
    struct __add_unsigned<signed char>
    { typedef unsigned char __type; };

  template<>
    struct __add_unsigned<short>
    { typedef unsigned short __type; };

  template<>
    struct __add_unsigned<int>
    { typedef unsigned int __type; };

  template<>
    struct __add_unsigned<long>
    { typedef unsigned long __type; };

  template<>
    struct __add_unsigned<long long>
    { typedef unsigned long long __type; };


  template<>
    struct __add_unsigned<bool>;

  template<>
    struct __add_unsigned<wchar_t>;



  template<typename _Tp>
    struct __remove_unsigned
    {
    private:
      typedef __enable_if<std::__is_integer<_Tp>::__value, _Tp> __if_type;

    public:
      typedef typename __if_type::__type __type;
    };

  template<>
    struct __remove_unsigned<char>
    { typedef signed char __type; };

  template<>
    struct __remove_unsigned<unsigned char>
    { typedef signed char __type; };

  template<>
    struct __remove_unsigned<unsigned short>
    { typedef short __type; };

  template<>
    struct __remove_unsigned<unsigned int>
    { typedef int __type; };

  template<>
    struct __remove_unsigned<unsigned long>
    { typedef long __type; };

  template<>
    struct __remove_unsigned<unsigned long long>
    { typedef long long __type; };


  template<>
    struct __remove_unsigned<bool>;

  template<>
    struct __remove_unsigned<wchar_t>;



  template<typename _Type>
    inline bool
    __is_null_pointer(_Type* __ptr)
    { return __ptr == 0; }

  template<typename _Type>
    inline bool
    __is_null_pointer(_Type)
    { return false; }
# 165 "/usr/include/c++/5/ext/type_traits.h" 3
  template<typename _Tp, bool = std::__is_integer<_Tp>::__value>
    struct __promote
    { typedef double __type; };




  template<typename _Tp>
    struct __promote<_Tp, false>
    { };

  template<>
    struct __promote<long double>
    { typedef long double __type; };

  template<>
    struct __promote<double>
    { typedef double __type; };

  template<>
    struct __promote<float>
    { typedef float __type; };

  template<typename _Tp, typename _Up,
           typename _Tp2 = typename __promote<_Tp>::__type,
           typename _Up2 = typename __promote<_Up>::__type>
    struct __promote_2
    {
      typedef __typeof__(_Tp2() + _Up2()) __type;
    };

  template<typename _Tp, typename _Up, typename _Vp,
           typename _Tp2 = typename __promote<_Tp>::__type,
           typename _Up2 = typename __promote<_Up>::__type,
           typename _Vp2 = typename __promote<_Vp>::__type>
    struct __promote_3
    {
      typedef __typeof__(_Tp2() + _Up2() + _Vp2()) __type;
    };

  template<typename _Tp, typename _Up, typename _Vp, typename _Wp,
           typename _Tp2 = typename __promote<_Tp>::__type,
           typename _Up2 = typename __promote<_Up>::__type,
           typename _Vp2 = typename __promote<_Vp>::__type,
           typename _Wp2 = typename __promote<_Wp>::__type>
    struct __promote_4
    {
      typedef __typeof__(_Tp2() + _Up2() + _Vp2() + _Wp2()) __type;
    };


}
# 63 "/usr/include/c++/5/bits/stl_algobase.h" 2 3
# 1 "/usr/include/c++/5/ext/numeric_traits.h" 1 3
# 32 "/usr/include/c++/5/ext/numeric_traits.h" 3
       
# 33 "/usr/include/c++/5/ext/numeric_traits.h" 3




namespace __gnu_cxx __attribute__ ((__visibility__ ("default")))
{

# 54 "/usr/include/c++/5/ext/numeric_traits.h" 3
  template<typename _Value>
    struct __numeric_traits_integer
    {

      static const _Value __min = (((_Value)(-1) < 0) ? (_Value)1 << (sizeof(_Value) * 8 - ((_Value)(-1) < 0)) : (_Value)0);
      static const _Value __max = (((_Value)(-1) < 0) ? (((((_Value)1 << ((sizeof(_Value) * 8 - ((_Value)(-1) < 0)) - 1)) - 1) << 1) + 1) : ~(_Value)0);



      static const bool __is_signed = ((_Value)(-1) < 0);
      static const int __digits = (sizeof(_Value) * 8 - ((_Value)(-1) < 0));
    };

  template<typename _Value>
    const _Value __numeric_traits_integer<_Value>::__min;

  template<typename _Value>
    const _Value __numeric_traits_integer<_Value>::__max;

  template<typename _Value>
    const bool __numeric_traits_integer<_Value>::__is_signed;

  template<typename _Value>
    const int __numeric_traits_integer<_Value>::__digits;
# 99 "/usr/include/c++/5/ext/numeric_traits.h" 3
  template<typename _Value>
    struct __numeric_traits_floating
    {

      static const int __max_digits10 = (2 + (std::__are_same<_Value, float>::__value ? 24 : std::__are_same<_Value, double>::__value ? 53 : 64) * 643L / 2136);


      static const bool __is_signed = true;
      static const int __digits10 = (std::__are_same<_Value, float>::__value ? 6 : std::__are_same<_Value, double>::__value ? 15 : 18);
      static const int __max_exponent10 = (std::__are_same<_Value, float>::__value ? 38 : std::__are_same<_Value, double>::__value ? 308 : 4932);
    };

  template<typename _Value>
    const int __numeric_traits_floating<_Value>::__max_digits10;

  template<typename _Value>
    const bool __numeric_traits_floating<_Value>::__is_signed;

  template<typename _Value>
    const int __numeric_traits_floating<_Value>::__digits10;

  template<typename _Value>
    const int __numeric_traits_floating<_Value>::__max_exponent10;

  template<typename _Value>
    struct __numeric_traits
    : public __conditional_type<std::__is_integer<_Value>::__value,
    __numeric_traits_integer<_Value>,
    __numeric_traits_floating<_Value> >::__type
    { };


}
# 64 "/usr/include/c++/5/bits/stl_algobase.h" 2 3
# 1 "/usr/include/c++/5/bits/stl_pair.h" 1 3
# 59 "/usr/include/c++/5/bits/stl_pair.h" 3
# 1 "/usr/include/c++/5/bits/move.h" 1 3
# 34 "/usr/include/c++/5/bits/move.h" 3
# 1 "/usr/include/c++/5/bits/concept_check.h" 1 3
# 33 "/usr/include/c++/5/bits/concept_check.h" 3
       
# 34 "/usr/include/c++/5/bits/concept_check.h" 3
# 35 "/usr/include/c++/5/bits/move.h" 2 3

namespace std __attribute__ ((__visibility__ ("default")))
{







  template<typename _Tp>
    inline _Tp*
    __addressof(_Tp& __r)
    {
      return reinterpret_cast<_Tp*>
 (&const_cast<char&>(reinterpret_cast<const volatile char&>(__r)));
    }


}
# 159 "/usr/include/c++/5/bits/move.h" 3
namespace std __attribute__ ((__visibility__ ("default")))
{

# 174 "/usr/include/c++/5/bits/move.h" 3
  template<typename _Tp>
    inline void
    swap(_Tp& __a, _Tp& __b)




    {

     

      _Tp __tmp = (__a);
      __a = (__b);
      __b = (__tmp);
    }




  template<typename _Tp, size_t _Nm>
    inline void
    swap(_Tp (&__a)[_Nm], _Tp (&__b)[_Nm])



    {
      for (size_t __n = 0; __n < _Nm; ++__n)
 swap(__a[__n], __b[__n]);
    }



}
# 60 "/usr/include/c++/5/bits/stl_pair.h" 2 3





namespace std __attribute__ ((__visibility__ ("default")))
{

# 95 "/usr/include/c++/5/bits/stl_pair.h" 3
  template<class _T1, class _T2>
    struct pair
    {
      typedef _T1 first_type;
      typedef _T2 second_type;

      _T1 first;
      _T2 second;





      pair()
      : first(), second() { }


      pair(const _T1& __a, const _T2& __b)
      : first(__a), second(__b) { }



      template<class _U1, class _U2>
 pair(const pair<_U1, _U2>& __p)
 : first(__p.first), second(__p.second) { }
# 209 "/usr/include/c++/5/bits/stl_pair.h" 3
    };


  template<class _T1, class _T2>
    inline bool
    operator==(const pair<_T1, _T2>& __x, const pair<_T1, _T2>& __y)
    { return __x.first == __y.first && __x.second == __y.second; }


  template<class _T1, class _T2>
    inline bool
    operator<(const pair<_T1, _T2>& __x, const pair<_T1, _T2>& __y)
    { return __x.first < __y.first
      || (!(__y.first < __x.first) && __x.second < __y.second); }


  template<class _T1, class _T2>
    inline bool
    operator!=(const pair<_T1, _T2>& __x, const pair<_T1, _T2>& __y)
    { return !(__x == __y); }


  template<class _T1, class _T2>
    inline bool
    operator>(const pair<_T1, _T2>& __x, const pair<_T1, _T2>& __y)
    { return __y < __x; }


  template<class _T1, class _T2>
    inline bool
    operator<=(const pair<_T1, _T2>& __x, const pair<_T1, _T2>& __y)
    { return !(__y < __x); }


  template<class _T1, class _T2>
    inline bool
    operator>=(const pair<_T1, _T2>& __x, const pair<_T1, _T2>& __y)
    { return !(__x < __y); }
# 284 "/usr/include/c++/5/bits/stl_pair.h" 3
  template<class _T1, class _T2>
    inline pair<_T1, _T2>
    make_pair(_T1 __x, _T2 __y)
    { return pair<_T1, _T2>(__x, __y); }





}
# 65 "/usr/include/c++/5/bits/stl_algobase.h" 2 3
# 1 "/usr/include/c++/5/bits/stl_iterator_base_types.h" 1 3
# 62 "/usr/include/c++/5/bits/stl_iterator_base_types.h" 3
       
# 63 "/usr/include/c++/5/bits/stl_iterator_base_types.h" 3







namespace std __attribute__ ((__visibility__ ("default")))
{

# 89 "/usr/include/c++/5/bits/stl_iterator_base_types.h" 3
  struct input_iterator_tag { };


  struct output_iterator_tag { };


  struct forward_iterator_tag : public input_iterator_tag { };



  struct bidirectional_iterator_tag : public forward_iterator_tag { };



  struct random_access_iterator_tag : public bidirectional_iterator_tag { };
# 116 "/usr/include/c++/5/bits/stl_iterator_base_types.h" 3
  template<typename _Category, typename _Tp, typename _Distance = ptrdiff_t,
           typename _Pointer = _Tp*, typename _Reference = _Tp&>
    struct iterator
    {

      typedef _Category iterator_category;

      typedef _Tp value_type;

      typedef _Distance difference_type;

      typedef _Pointer pointer;

      typedef _Reference reference;
    };
# 165 "/usr/include/c++/5/bits/stl_iterator_base_types.h" 3
  template<typename _Iterator>
    struct iterator_traits
    {
      typedef typename _Iterator::iterator_category iterator_category;
      typedef typename _Iterator::value_type value_type;
      typedef typename _Iterator::difference_type difference_type;
      typedef typename _Iterator::pointer pointer;
      typedef typename _Iterator::reference reference;
    };



  template<typename _Tp>
    struct iterator_traits<_Tp*>
    {
      typedef random_access_iterator_tag iterator_category;
      typedef _Tp value_type;
      typedef ptrdiff_t difference_type;
      typedef _Tp* pointer;
      typedef _Tp& reference;
    };


  template<typename _Tp>
    struct iterator_traits<const _Tp*>
    {
      typedef random_access_iterator_tag iterator_category;
      typedef _Tp value_type;
      typedef ptrdiff_t difference_type;
      typedef const _Tp* pointer;
      typedef const _Tp& reference;
    };





  template<typename _Iter>
    inline typename iterator_traits<_Iter>::iterator_category
    __iterator_category(const _Iter&)
    { return typename iterator_traits<_Iter>::iterator_category(); }





  template<typename _Iterator, bool _HasBase>
    struct _Iter_base
    {
      typedef _Iterator iterator_type;
      static iterator_type _S_base(_Iterator __it)
      { return __it; }
    };

  template<typename _Iterator>
    struct _Iter_base<_Iterator, true>
    {
      typedef typename _Iterator::iterator_type iterator_type;
      static iterator_type _S_base(_Iterator __it)
      { return __it.base(); }
    };
# 235 "/usr/include/c++/5/bits/stl_iterator_base_types.h" 3

}
# 66 "/usr/include/c++/5/bits/stl_algobase.h" 2 3
# 1 "/usr/include/c++/5/bits/stl_iterator_base_funcs.h" 1 3
# 62 "/usr/include/c++/5/bits/stl_iterator_base_funcs.h" 3
       
# 63 "/usr/include/c++/5/bits/stl_iterator_base_funcs.h" 3


# 1 "/usr/include/c++/5/debug/debug.h" 1 3
# 46 "/usr/include/c++/5/debug/debug.h" 3
namespace std
{
  namespace __debug { }
}




namespace __gnu_debug
{
  using namespace std::__debug;
}
# 66 "/usr/include/c++/5/bits/stl_iterator_base_funcs.h" 2 3

namespace std __attribute__ ((__visibility__ ("default")))
{


  template<typename _InputIterator>
    inline typename iterator_traits<_InputIterator>::difference_type
    __distance(_InputIterator __first, _InputIterator __last,
               input_iterator_tag)
    {

     

      typename iterator_traits<_InputIterator>::difference_type __n = 0;
      while (__first != __last)
 {
   ++__first;
   ++__n;
 }
      return __n;
    }

  template<typename _RandomAccessIterator>
    inline typename iterator_traits<_RandomAccessIterator>::difference_type
    __distance(_RandomAccessIterator __first, _RandomAccessIterator __last,
               random_access_iterator_tag)
    {

     

      return __last - __first;
    }
# 112 "/usr/include/c++/5/bits/stl_iterator_base_funcs.h" 3
  template<typename _InputIterator>
    inline typename iterator_traits<_InputIterator>::difference_type
    distance(_InputIterator __first, _InputIterator __last)
    {

      return std::__distance(__first, __last,
        std::__iterator_category(__first));
    }

  template<typename _InputIterator, typename _Distance>
    inline void
    __advance(_InputIterator& __i, _Distance __n, input_iterator_tag)
    {

     
      ;
      while (__n--)
 ++__i;
    }

  template<typename _BidirectionalIterator, typename _Distance>
    inline void
    __advance(_BidirectionalIterator& __i, _Distance __n,
       bidirectional_iterator_tag)
    {

     

      if (__n > 0)
        while (__n--)
   ++__i;
      else
        while (__n++)
   --__i;
    }

  template<typename _RandomAccessIterator, typename _Distance>
    inline void
    __advance(_RandomAccessIterator& __i, _Distance __n,
              random_access_iterator_tag)
    {

     

      __i += __n;
    }
# 171 "/usr/include/c++/5/bits/stl_iterator_base_funcs.h" 3
  template<typename _InputIterator, typename _Distance>
    inline void
    advance(_InputIterator& __i, _Distance __n)
    {

      typename iterator_traits<_InputIterator>::difference_type __d = __n;
      std::__advance(__i, __d, std::__iterator_category(__i));
    }
# 202 "/usr/include/c++/5/bits/stl_iterator_base_funcs.h" 3

}
# 67 "/usr/include/c++/5/bits/stl_algobase.h" 2 3
# 1 "/usr/include/c++/5/bits/stl_iterator.h" 1 3
# 66 "/usr/include/c++/5/bits/stl_iterator.h" 3
# 1 "/usr/include/c++/5/bits/ptr_traits.h" 1 3
# 67 "/usr/include/c++/5/bits/stl_iterator.h" 2 3

namespace std __attribute__ ((__visibility__ ("default")))
{

# 96 "/usr/include/c++/5/bits/stl_iterator.h" 3
  template<typename _Iterator>
    class reverse_iterator
    : public iterator<typename iterator_traits<_Iterator>::iterator_category,
        typename iterator_traits<_Iterator>::value_type,
        typename iterator_traits<_Iterator>::difference_type,
        typename iterator_traits<_Iterator>::pointer,
                      typename iterator_traits<_Iterator>::reference>
    {
    protected:
      _Iterator current;

      typedef iterator_traits<_Iterator> __traits_type;

    public:
      typedef _Iterator iterator_type;
      typedef typename __traits_type::difference_type difference_type;
      typedef typename __traits_type::pointer pointer;
      typedef typename __traits_type::reference reference;







      reverse_iterator() : current() { }




      explicit
      reverse_iterator(iterator_type __x) : current(__x) { }




      reverse_iterator(const reverse_iterator& __x)
      : current(__x.current) { }





      template<typename _Iter>
        reverse_iterator(const reverse_iterator<_Iter>& __x)
 : current(__x.base()) { }




      iterator_type
      base() const
      { return current; }
# 160 "/usr/include/c++/5/bits/stl_iterator.h" 3
      reference
      operator*() const
      {
 _Iterator __tmp = current;
 return *--__tmp;
      }






      pointer
      operator->() const
      { return &(operator*()); }






      reverse_iterator&
      operator++()
      {
 --current;
 return *this;
      }






      reverse_iterator
      operator++(int)
      {
 reverse_iterator __tmp = *this;
 --current;
 return __tmp;
      }






      reverse_iterator&
      operator--()
      {
 ++current;
 return *this;
      }






      reverse_iterator
      operator--(int)
      {
 reverse_iterator __tmp = *this;
 ++current;
 return __tmp;
      }






      reverse_iterator
      operator+(difference_type __n) const
      { return reverse_iterator(current - __n); }







      reverse_iterator&
      operator+=(difference_type __n)
      {
 current -= __n;
 return *this;
      }






      reverse_iterator
      operator-(difference_type __n) const
      { return reverse_iterator(current + __n); }







      reverse_iterator&
      operator-=(difference_type __n)
      {
 current += __n;
 return *this;
      }






      reference
      operator[](difference_type __n) const
      { return *(*this + __n); }
    };
# 290 "/usr/include/c++/5/bits/stl_iterator.h" 3
  template<typename _Iterator>
    inline bool
    operator==(const reverse_iterator<_Iterator>& __x,
        const reverse_iterator<_Iterator>& __y)
    { return __x.base() == __y.base(); }

  template<typename _Iterator>
    inline bool
    operator<(const reverse_iterator<_Iterator>& __x,
       const reverse_iterator<_Iterator>& __y)
    { return __y.base() < __x.base(); }

  template<typename _Iterator>
    inline bool
    operator!=(const reverse_iterator<_Iterator>& __x,
        const reverse_iterator<_Iterator>& __y)
    { return !(__x == __y); }

  template<typename _Iterator>
    inline bool
    operator>(const reverse_iterator<_Iterator>& __x,
       const reverse_iterator<_Iterator>& __y)
    { return __y < __x; }

  template<typename _Iterator>
    inline bool
    operator<=(const reverse_iterator<_Iterator>& __x,
        const reverse_iterator<_Iterator>& __y)
    { return !(__y < __x); }

  template<typename _Iterator>
    inline bool
    operator>=(const reverse_iterator<_Iterator>& __x,
        const reverse_iterator<_Iterator>& __y)
    { return !(__x < __y); }

  template<typename _Iterator>
    inline typename reverse_iterator<_Iterator>::difference_type
    operator-(const reverse_iterator<_Iterator>& __x,
       const reverse_iterator<_Iterator>& __y)
    { return __y.base() - __x.base(); }

  template<typename _Iterator>
    inline reverse_iterator<_Iterator>
    operator+(typename reverse_iterator<_Iterator>::difference_type __n,
       const reverse_iterator<_Iterator>& __x)
    { return reverse_iterator<_Iterator>(__x.base() - __n); }



  template<typename _IteratorL, typename _IteratorR>
    inline bool
    operator==(const reverse_iterator<_IteratorL>& __x,
        const reverse_iterator<_IteratorR>& __y)
    { return __x.base() == __y.base(); }

  template<typename _IteratorL, typename _IteratorR>
    inline bool
    operator<(const reverse_iterator<_IteratorL>& __x,
       const reverse_iterator<_IteratorR>& __y)
    { return __y.base() < __x.base(); }

  template<typename _IteratorL, typename _IteratorR>
    inline bool
    operator!=(const reverse_iterator<_IteratorL>& __x,
        const reverse_iterator<_IteratorR>& __y)
    { return !(__x == __y); }

  template<typename _IteratorL, typename _IteratorR>
    inline bool
    operator>(const reverse_iterator<_IteratorL>& __x,
       const reverse_iterator<_IteratorR>& __y)
    { return __y < __x; }

  template<typename _IteratorL, typename _IteratorR>
    inline bool
    operator<=(const reverse_iterator<_IteratorL>& __x,
        const reverse_iterator<_IteratorR>& __y)
    { return !(__y < __x); }

  template<typename _IteratorL, typename _IteratorR>
    inline bool
    operator>=(const reverse_iterator<_IteratorL>& __x,
        const reverse_iterator<_IteratorR>& __y)
    { return !(__x < __y); }

  template<typename _IteratorL, typename _IteratorR>







    inline typename reverse_iterator<_IteratorL>::difference_type
    operator-(const reverse_iterator<_IteratorL>& __x,
       const reverse_iterator<_IteratorR>& __y)

    { return __y.base() - __x.base(); }
# 414 "/usr/include/c++/5/bits/stl_iterator.h" 3
  template<typename _Container>
    class back_insert_iterator
    : public iterator<output_iterator_tag, void, void, void, void>
    {
    protected:
      _Container* container;

    public:

      typedef _Container container_type;


      explicit
      back_insert_iterator(_Container& __x) : container(&__x) { }
# 441 "/usr/include/c++/5/bits/stl_iterator.h" 3
      back_insert_iterator&
      operator=(typename _Container::const_reference __value)
      {
 container->push_back(__value);
 return *this;
      }
# 464 "/usr/include/c++/5/bits/stl_iterator.h" 3
      back_insert_iterator&
      operator*()
      { return *this; }


      back_insert_iterator&
      operator++()
      { return *this; }


      back_insert_iterator
      operator++(int)
      { return *this; }
    };
# 490 "/usr/include/c++/5/bits/stl_iterator.h" 3
  template<typename _Container>
    inline back_insert_iterator<_Container>
    back_inserter(_Container& __x)
    { return back_insert_iterator<_Container>(__x); }
# 505 "/usr/include/c++/5/bits/stl_iterator.h" 3
  template<typename _Container>
    class front_insert_iterator
    : public iterator<output_iterator_tag, void, void, void, void>
    {
    protected:
      _Container* container;

    public:

      typedef _Container container_type;


      explicit front_insert_iterator(_Container& __x) : container(&__x) { }
# 531 "/usr/include/c++/5/bits/stl_iterator.h" 3
      front_insert_iterator&
      operator=(typename _Container::const_reference __value)
      {
 container->push_front(__value);
 return *this;
      }
# 554 "/usr/include/c++/5/bits/stl_iterator.h" 3
      front_insert_iterator&
      operator*()
      { return *this; }


      front_insert_iterator&
      operator++()
      { return *this; }


      front_insert_iterator
      operator++(int)
      { return *this; }
    };
# 580 "/usr/include/c++/5/bits/stl_iterator.h" 3
  template<typename _Container>
    inline front_insert_iterator<_Container>
    front_inserter(_Container& __x)
    { return front_insert_iterator<_Container>(__x); }
# 599 "/usr/include/c++/5/bits/stl_iterator.h" 3
  template<typename _Container>
    class insert_iterator
    : public iterator<output_iterator_tag, void, void, void, void>
    {
    protected:
      _Container* container;
      typename _Container::iterator iter;

    public:

      typedef _Container container_type;





      insert_iterator(_Container& __x, typename _Container::iterator __i)
      : container(&__x), iter(__i) {}
# 642 "/usr/include/c++/5/bits/stl_iterator.h" 3
      insert_iterator&
      operator=(typename _Container::const_reference __value)
      {
 iter = container->insert(iter, __value);
 ++iter;
 return *this;
      }
# 668 "/usr/include/c++/5/bits/stl_iterator.h" 3
      insert_iterator&
      operator*()
      { return *this; }


      insert_iterator&
      operator++()
      { return *this; }


      insert_iterator&
      operator++(int)
      { return *this; }
    };
# 694 "/usr/include/c++/5/bits/stl_iterator.h" 3
  template<typename _Container, typename _Iterator>
    inline insert_iterator<_Container>
    inserter(_Container& __x, _Iterator __i)
    {
      return insert_iterator<_Container>(__x,
      typename _Container::iterator(__i));
    }




}

namespace __gnu_cxx __attribute__ ((__visibility__ ("default")))
{

# 718 "/usr/include/c++/5/bits/stl_iterator.h" 3
  using std::iterator_traits;
  using std::iterator;
  template<typename _Iterator, typename _Container>
    class __normal_iterator
    {
    protected:
      _Iterator _M_current;

      typedef iterator_traits<_Iterator> __traits_type;

    public:
      typedef _Iterator iterator_type;
      typedef typename __traits_type::iterator_category iterator_category;
      typedef typename __traits_type::value_type value_type;
      typedef typename __traits_type::difference_type difference_type;
      typedef typename __traits_type::reference reference;
      typedef typename __traits_type::pointer pointer;

      __normal_iterator()
      : _M_current(_Iterator()) { }

      explicit
      __normal_iterator(const _Iterator& __i)
      : _M_current(__i) { }


      template<typename _Iter>
        __normal_iterator(const __normal_iterator<_Iter,
     typename __enable_if<
              (std::__are_same<_Iter, typename _Container::pointer>::__value),
        _Container>::__type>& __i)
        : _M_current(__i.base()) { }


      reference
      operator*() const
      { return *_M_current; }

      pointer
      operator->() const
      { return _M_current; }

      __normal_iterator&
      operator++()
      {
 ++_M_current;
 return *this;
      }

      __normal_iterator
      operator++(int)
      { return __normal_iterator(_M_current++); }


      __normal_iterator&
      operator--()
      {
 --_M_current;
 return *this;
      }

      __normal_iterator
      operator--(int)
      { return __normal_iterator(_M_current--); }


      reference
      operator[](difference_type __n) const
      { return _M_current[__n]; }

      __normal_iterator&
      operator+=(difference_type __n)
      { _M_current += __n; return *this; }

      __normal_iterator
      operator+(difference_type __n) const
      { return __normal_iterator(_M_current + __n); }

      __normal_iterator&
      operator-=(difference_type __n)
      { _M_current -= __n; return *this; }

      __normal_iterator
      operator-(difference_type __n) const
      { return __normal_iterator(_M_current - __n); }

      const _Iterator&
      base() const
      { return _M_current; }
    };
# 818 "/usr/include/c++/5/bits/stl_iterator.h" 3
  template<typename _IteratorL, typename _IteratorR, typename _Container>
    inline bool
    operator==(const __normal_iterator<_IteratorL, _Container>& __lhs,
        const __normal_iterator<_IteratorR, _Container>& __rhs)
   
    { return __lhs.base() == __rhs.base(); }

  template<typename _Iterator, typename _Container>
    inline bool
    operator==(const __normal_iterator<_Iterator, _Container>& __lhs,
        const __normal_iterator<_Iterator, _Container>& __rhs)
   
    { return __lhs.base() == __rhs.base(); }

  template<typename _IteratorL, typename _IteratorR, typename _Container>
    inline bool
    operator!=(const __normal_iterator<_IteratorL, _Container>& __lhs,
        const __normal_iterator<_IteratorR, _Container>& __rhs)
   
    { return __lhs.base() != __rhs.base(); }

  template<typename _Iterator, typename _Container>
    inline bool
    operator!=(const __normal_iterator<_Iterator, _Container>& __lhs,
        const __normal_iterator<_Iterator, _Container>& __rhs)
   
    { return __lhs.base() != __rhs.base(); }


  template<typename _IteratorL, typename _IteratorR, typename _Container>
    inline bool
    operator<(const __normal_iterator<_IteratorL, _Container>& __lhs,
       const __normal_iterator<_IteratorR, _Container>& __rhs)
   
    { return __lhs.base() < __rhs.base(); }

  template<typename _Iterator, typename _Container>
    inline bool
    operator<(const __normal_iterator<_Iterator, _Container>& __lhs,
       const __normal_iterator<_Iterator, _Container>& __rhs)
   
    { return __lhs.base() < __rhs.base(); }

  template<typename _IteratorL, typename _IteratorR, typename _Container>
    inline bool
    operator>(const __normal_iterator<_IteratorL, _Container>& __lhs,
       const __normal_iterator<_IteratorR, _Container>& __rhs)
   
    { return __lhs.base() > __rhs.base(); }

  template<typename _Iterator, typename _Container>
    inline bool
    operator>(const __normal_iterator<_Iterator, _Container>& __lhs,
       const __normal_iterator<_Iterator, _Container>& __rhs)
   
    { return __lhs.base() > __rhs.base(); }

  template<typename _IteratorL, typename _IteratorR, typename _Container>
    inline bool
    operator<=(const __normal_iterator<_IteratorL, _Container>& __lhs,
        const __normal_iterator<_IteratorR, _Container>& __rhs)
   
    { return __lhs.base() <= __rhs.base(); }

  template<typename _Iterator, typename _Container>
    inline bool
    operator<=(const __normal_iterator<_Iterator, _Container>& __lhs,
        const __normal_iterator<_Iterator, _Container>& __rhs)
   
    { return __lhs.base() <= __rhs.base(); }

  template<typename _IteratorL, typename _IteratorR, typename _Container>
    inline bool
    operator>=(const __normal_iterator<_IteratorL, _Container>& __lhs,
        const __normal_iterator<_IteratorR, _Container>& __rhs)
   
    { return __lhs.base() >= __rhs.base(); }

  template<typename _Iterator, typename _Container>
    inline bool
    operator>=(const __normal_iterator<_Iterator, _Container>& __lhs,
        const __normal_iterator<_Iterator, _Container>& __rhs)
   
    { return __lhs.base() >= __rhs.base(); }





  template<typename _IteratorL, typename _IteratorR, typename _Container>







    inline typename __normal_iterator<_IteratorL, _Container>::difference_type
    operator-(const __normal_iterator<_IteratorL, _Container>& __lhs,
       const __normal_iterator<_IteratorR, _Container>& __rhs)

    { return __lhs.base() - __rhs.base(); }

  template<typename _Iterator, typename _Container>
    inline typename __normal_iterator<_Iterator, _Container>::difference_type
    operator-(const __normal_iterator<_Iterator, _Container>& __lhs,
       const __normal_iterator<_Iterator, _Container>& __rhs)
   
    { return __lhs.base() - __rhs.base(); }

  template<typename _Iterator, typename _Container>
    inline __normal_iterator<_Iterator, _Container>
    operator+(typename __normal_iterator<_Iterator, _Container>::difference_type
       __n, const __normal_iterator<_Iterator, _Container>& __i)
   
    { return __normal_iterator<_Iterator, _Container>(__i.base() + __n); }


}
# 68 "/usr/include/c++/5/bits/stl_algobase.h" 2 3



# 1 "/usr/include/c++/5/bits/predefined_ops.h" 1 3
# 33 "/usr/include/c++/5/bits/predefined_ops.h" 3
namespace __gnu_cxx
{
namespace __ops
{
  struct _Iter_less_iter
  {
    template<typename _Iterator1, typename _Iterator2>
     
      bool
      operator()(_Iterator1 __it1, _Iterator2 __it2) const
      { return *__it1 < *__it2; }
  };
 
  inline _Iter_less_iter
  __iter_less_iter()
  { return _Iter_less_iter(); }

  struct _Iter_less_val
  {
    template<typename _Iterator, typename _Value>
      bool
      operator()(_Iterator __it, _Value& __val) const
      { return *__it < __val; }
    };

  inline _Iter_less_val
  __iter_less_val()
  { return _Iter_less_val(); }

  inline _Iter_less_val
  __iter_comp_val(_Iter_less_iter)
  { return _Iter_less_val(); }

  struct _Val_less_iter
  {
    template<typename _Value, typename _Iterator>
      bool
      operator()(_Value& __val, _Iterator __it) const
      { return __val < *__it; }
    };

  inline _Val_less_iter
  __val_less_iter()
  { return _Val_less_iter(); }

  inline _Val_less_iter
  __val_comp_iter(_Iter_less_iter)
  { return _Val_less_iter(); }

  struct _Iter_equal_to_iter
  {
    template<typename _Iterator1, typename _Iterator2>
      bool
      operator()(_Iterator1 __it1, _Iterator2 __it2) const
      { return *__it1 == *__it2; }
    };

  inline _Iter_equal_to_iter
  __iter_equal_to_iter()
  { return _Iter_equal_to_iter(); }

  struct _Iter_equal_to_val
  {
    template<typename _Iterator, typename _Value>
      bool
      operator()(_Iterator __it, _Value& __val) const
      { return *__it == __val; }
    };

  inline _Iter_equal_to_val
  __iter_equal_to_val()
  { return _Iter_equal_to_val(); }

  inline _Iter_equal_to_val
  __iter_comp_val(_Iter_equal_to_iter)
  { return _Iter_equal_to_val(); }

  template<typename _Compare>
    struct _Iter_comp_iter
    {
      _Compare _M_comp;
     
      _Iter_comp_iter(_Compare __comp)
 : _M_comp(__comp)
      { }

      template<typename _Iterator1, typename _Iterator2>
       
        bool
        operator()(_Iterator1 __it1, _Iterator2 __it2)
        { return bool(_M_comp(*__it1, *__it2)); }
    };

  template<typename _Compare>
   
    inline _Iter_comp_iter<_Compare>
    __iter_comp_iter(_Compare __comp)
    { return _Iter_comp_iter<_Compare>(__comp); }

  template<typename _Compare>
    struct _Iter_comp_val
    {
      _Compare _M_comp;

      _Iter_comp_val(_Compare __comp)
 : _M_comp(__comp)
      { }

      template<typename _Iterator, typename _Value>
 bool
 operator()(_Iterator __it, _Value& __val)
 { return bool(_M_comp(*__it, __val)); }
    };

  template<typename _Compare>
   inline _Iter_comp_val<_Compare>
    __iter_comp_val(_Compare __comp)
    { return _Iter_comp_val<_Compare>(__comp); }

  template<typename _Compare>
    inline _Iter_comp_val<_Compare>
    __iter_comp_val(_Iter_comp_iter<_Compare> __comp)
    { return _Iter_comp_val<_Compare>(__comp._M_comp); }

  template<typename _Compare>
    struct _Val_comp_iter
    {
      _Compare _M_comp;

      _Val_comp_iter(_Compare __comp)
 : _M_comp(__comp)
      { }

      template<typename _Value, typename _Iterator>
 bool
 operator()(_Value& __val, _Iterator __it)
 { return bool(_M_comp(__val, *__it)); }
    };

  template<typename _Compare>
    inline _Val_comp_iter<_Compare>
    __val_comp_iter(_Compare __comp)
    { return _Val_comp_iter<_Compare>(__comp); }

  template<typename _Compare>
    inline _Val_comp_iter<_Compare>
    __val_comp_iter(_Iter_comp_iter<_Compare> __comp)
    { return _Val_comp_iter<_Compare>(__comp._M_comp); }

  template<typename _Value>
    struct _Iter_equals_val
    {
      _Value& _M_value;

      _Iter_equals_val(_Value& __value)
 : _M_value(__value)
      { }

      template<typename _Iterator>
 bool
 operator()(_Iterator __it)
 { return *__it == _M_value; }
    };

  template<typename _Value>
    inline _Iter_equals_val<_Value>
    __iter_equals_val(_Value& __val)
    { return _Iter_equals_val<_Value>(__val); }

  template<typename _Iterator1>
    struct _Iter_equals_iter
    {
      typename std::iterator_traits<_Iterator1>::reference _M_ref;

      _Iter_equals_iter(_Iterator1 __it1)
 : _M_ref(*__it1)
      { }

      template<typename _Iterator2>
 bool
 operator()(_Iterator2 __it2)
 { return *__it2 == _M_ref; }
    };

  template<typename _Iterator>
    inline _Iter_equals_iter<_Iterator>
    __iter_comp_iter(_Iter_equal_to_iter, _Iterator __it)
    { return _Iter_equals_iter<_Iterator>(__it); }

  template<typename _Predicate>
    struct _Iter_pred
    {
      _Predicate _M_pred;

      _Iter_pred(_Predicate __pred)
 : _M_pred(__pred)
      { }

      template<typename _Iterator>
 bool
 operator()(_Iterator __it)
 { return bool(_M_pred(*__it)); }
    };

  template<typename _Predicate>
    inline _Iter_pred<_Predicate>
    __pred_iter(_Predicate __pred)
    { return _Iter_pred<_Predicate>(__pred); }

  template<typename _Compare, typename _Value>
    struct _Iter_comp_to_val
    {
      _Compare _M_comp;
      _Value& _M_value;

      _Iter_comp_to_val(_Compare __comp, _Value& __value)
 : _M_comp(__comp), _M_value(__value)
      { }

      template<typename _Iterator>
 bool
 operator()(_Iterator __it)
 { return bool(_M_comp(*__it, _M_value)); }
    };

  template<typename _Compare, typename _Value>
    _Iter_comp_to_val<_Compare, _Value>
    __iter_comp_val(_Compare __comp, _Value &__val)
    { return _Iter_comp_to_val<_Compare, _Value>(__comp, __val); }

  template<typename _Compare, typename _Iterator1>
    struct _Iter_comp_to_iter
    {
      _Compare _M_comp;
      typename std::iterator_traits<_Iterator1>::reference _M_ref;

      _Iter_comp_to_iter(_Compare __comp, _Iterator1 __it1)
 : _M_comp(__comp), _M_ref(*__it1)
      { }

      template<typename _Iterator2>
 bool
 operator()(_Iterator2 __it2)
 { return bool(_M_comp(*__it2, _M_ref)); }
    };

  template<typename _Compare, typename _Iterator>
    inline _Iter_comp_to_iter<_Compare, _Iterator>
    __iter_comp_iter(_Iter_comp_iter<_Compare> __comp, _Iterator __it)
    { return _Iter_comp_to_iter<_Compare, _Iterator>(__comp._M_comp, __it); }

  template<typename _Predicate>
    struct _Iter_negate
    {
      _Predicate _M_pred;

      _Iter_negate(_Predicate __pred)
 : _M_pred(__pred)
      { }

      template<typename _Iterator>
 bool
 operator()(_Iterator __it)
 { return !bool(_M_pred(*__it)); }
    };

  template<typename _Predicate>
    inline _Iter_negate<_Predicate>
    __negate(_Iter_pred<_Predicate> __pred)
    { return _Iter_negate<_Predicate>(__pred._M_pred); }

}
}
# 72 "/usr/include/c++/5/bits/stl_algobase.h" 2 3

namespace std __attribute__ ((__visibility__ ("default")))
{






  template<bool _BoolType>
    struct __iter_swap
    {
      template<typename _ForwardIterator1, typename _ForwardIterator2>
        static void
        iter_swap(_ForwardIterator1 __a, _ForwardIterator2 __b)
        {
          typedef typename iterator_traits<_ForwardIterator1>::value_type
            _ValueType1;
          _ValueType1 __tmp = (*__a);
          *__a = (*__b);
          *__b = (__tmp);
 }
    };

  template<>
    struct __iter_swap<true>
    {
      template<typename _ForwardIterator1, typename _ForwardIterator2>
        static void
        iter_swap(_ForwardIterator1 __a, _ForwardIterator2 __b)
        {
          swap(*__a, *__b);
        }
    };
# 118 "/usr/include/c++/5/bits/stl_algobase.h" 3
  template<typename _ForwardIterator1, typename _ForwardIterator2>
    inline void
    iter_swap(_ForwardIterator1 __a, _ForwardIterator2 __b)
    {

     

     



      typedef typename iterator_traits<_ForwardIterator1>::value_type
 _ValueType1;
      typedef typename iterator_traits<_ForwardIterator2>::value_type
 _ValueType2;

     

     


      typedef typename iterator_traits<_ForwardIterator1>::reference
 _ReferenceType1;
      typedef typename iterator_traits<_ForwardIterator2>::reference
 _ReferenceType2;
      std::__iter_swap<__are_same<_ValueType1, _ValueType2>::__value
 && __are_same<_ValueType1&, _ReferenceType1>::__value
 && __are_same<_ValueType2&, _ReferenceType2>::__value>::
 iter_swap(__a, __b);



    }
# 164 "/usr/include/c++/5/bits/stl_algobase.h" 3
  template<typename _ForwardIterator1, typename _ForwardIterator2>
    _ForwardIterator2
    swap_ranges(_ForwardIterator1 __first1, _ForwardIterator1 __last1,
  _ForwardIterator2 __first2)
    {

     

     

      ;

      for (; __first1 != __last1; ++__first1, ++__first2)
 std::iter_swap(__first1, __first2);
      return __first2;
    }
# 192 "/usr/include/c++/5/bits/stl_algobase.h" 3
  template<typename _Tp>
   
    inline const _Tp&
    min(const _Tp& __a, const _Tp& __b)
    {

     

      if (__b < __a)
 return __b;
      return __a;
    }
# 216 "/usr/include/c++/5/bits/stl_algobase.h" 3
  template<typename _Tp>
   
    inline const _Tp&
    max(const _Tp& __a, const _Tp& __b)
    {

     

      if (__a < __b)
 return __b;
      return __a;
    }
# 240 "/usr/include/c++/5/bits/stl_algobase.h" 3
  template<typename _Tp, typename _Compare>
   
    inline const _Tp&
    min(const _Tp& __a, const _Tp& __b, _Compare __comp)
    {

      if (__comp(__b, __a))
 return __b;
      return __a;
    }
# 262 "/usr/include/c++/5/bits/stl_algobase.h" 3
  template<typename _Tp, typename _Compare>
   
    inline const _Tp&
    max(const _Tp& __a, const _Tp& __b, _Compare __comp)
    {

      if (__comp(__a, __b))
 return __b;
      return __a;
    }



  template<typename _Iterator>
    struct _Niter_base
    : _Iter_base<_Iterator, __is_normal_iterator<_Iterator>::__value>
    { };

  template<typename _Iterator>
    inline typename _Niter_base<_Iterator>::iterator_type
    __niter_base(_Iterator __it)
    { return std::_Niter_base<_Iterator>::_S_base(__it); }


  template<typename _Iterator>
    struct _Miter_base
    : _Iter_base<_Iterator, __is_move_iterator<_Iterator>::__value>
    { };

  template<typename _Iterator>
    inline typename _Miter_base<_Iterator>::iterator_type
    __miter_base(_Iterator __it)
    { return std::_Miter_base<_Iterator>::_S_base(__it); }







  template<bool, bool, typename>
    struct __copy_move
    {
      template<typename _II, typename _OI>
        static _OI
        __copy_m(_II __first, _II __last, _OI __result)
        {
   for (; __first != __last; ++__result, ++__first)
     *__result = *__first;
   return __result;
 }
    };
# 330 "/usr/include/c++/5/bits/stl_algobase.h" 3
  template<>
    struct __copy_move<false, false, random_access_iterator_tag>
    {
      template<typename _II, typename _OI>
        static _OI
        __copy_m(_II __first, _II __last, _OI __result)
        {
   typedef typename iterator_traits<_II>::difference_type _Distance;
   for(_Distance __n = __last - __first; __n > 0; --__n)
     {
       *__result = *__first;
       ++__first;
       ++__result;
     }
   return __result;
 }
    };
# 368 "/usr/include/c++/5/bits/stl_algobase.h" 3
  template<bool _IsMove>
    struct __copy_move<_IsMove, true, random_access_iterator_tag>
    {
      template<typename _Tp>
        static _Tp*
        __copy_m(const _Tp* __first, const _Tp* __last, _Tp* __result)
        {







   const ptrdiff_t _Num = __last - __first;
   if (_Num)
     __builtin_memmove(__result, __first, sizeof(_Tp) * _Num);
   return __result + _Num;
 }
    };

  template<bool _IsMove, typename _II, typename _OI>
    inline _OI
    __copy_move_a(_II __first, _II __last, _OI __result)
    {
      typedef typename iterator_traits<_II>::value_type _ValueTypeI;
      typedef typename iterator_traits<_OI>::value_type _ValueTypeO;
      typedef typename iterator_traits<_II>::iterator_category _Category;
      const bool __simple = (__is_trivial(_ValueTypeI)
                      && __is_pointer<_II>::__value
                      && __is_pointer<_OI>::__value
        && __are_same<_ValueTypeI, _ValueTypeO>::__value);

      return std::__copy_move<_IsMove, __simple,
                       _Category>::__copy_m(__first, __last, __result);
    }



  template<typename _CharT>
    struct char_traits;

  template<typename _CharT, typename _Traits>
    class istreambuf_iterator;

  template<typename _CharT, typename _Traits>
    class ostreambuf_iterator;

  template<bool _IsMove, typename _CharT>
    typename __gnu_cxx::__enable_if<__is_char<_CharT>::__value,
      ostreambuf_iterator<_CharT, char_traits<_CharT> > >::__type
    __copy_move_a2(_CharT*, _CharT*,
     ostreambuf_iterator<_CharT, char_traits<_CharT> >);

  template<bool _IsMove, typename _CharT>
    typename __gnu_cxx::__enable_if<__is_char<_CharT>::__value,
      ostreambuf_iterator<_CharT, char_traits<_CharT> > >::__type
    __copy_move_a2(const _CharT*, const _CharT*,
     ostreambuf_iterator<_CharT, char_traits<_CharT> >);

  template<bool _IsMove, typename _CharT>
    typename __gnu_cxx::__enable_if<__is_char<_CharT>::__value,
        _CharT*>::__type
    __copy_move_a2(istreambuf_iterator<_CharT, char_traits<_CharT> >,
     istreambuf_iterator<_CharT, char_traits<_CharT> >, _CharT*);

  template<bool _IsMove, typename _II, typename _OI>
    inline _OI
    __copy_move_a2(_II __first, _II __last, _OI __result)
    {
      return _OI(std::__copy_move_a<_IsMove>(std::__niter_base(__first),
          std::__niter_base(__last),
          std::__niter_base(__result)));
    }
# 460 "/usr/include/c++/5/bits/stl_algobase.h" 3
  template<typename _II, typename _OI>
    inline _OI
    copy(_II __first, _II __last, _OI __result)
    {

     
     

      ;

      return (std::__copy_move_a2<__is_move_iterator<_II>::__value>
       (std::__miter_base(__first), std::__miter_base(__last),
        __result));
    }
# 512 "/usr/include/c++/5/bits/stl_algobase.h" 3
  template<bool, bool, typename>
    struct __copy_move_backward
    {
      template<typename _BI1, typename _BI2>
        static _BI2
        __copy_move_b(_BI1 __first, _BI1 __last, _BI2 __result)
        {
   while (__first != __last)
     *--__result = *--__last;
   return __result;
 }
    };
# 540 "/usr/include/c++/5/bits/stl_algobase.h" 3
  template<>
    struct __copy_move_backward<false, false, random_access_iterator_tag>
    {
      template<typename _BI1, typename _BI2>
        static _BI2
        __copy_move_b(_BI1 __first, _BI1 __last, _BI2 __result)
        {
   typename iterator_traits<_BI1>::difference_type __n;
   for (__n = __last - __first; __n > 0; --__n)
     *--__result = *--__last;
   return __result;
 }
    };
# 570 "/usr/include/c++/5/bits/stl_algobase.h" 3
  template<bool _IsMove>
    struct __copy_move_backward<_IsMove, true, random_access_iterator_tag>
    {
      template<typename _Tp>
        static _Tp*
        __copy_move_b(const _Tp* __first, const _Tp* __last, _Tp* __result)
        {







   const ptrdiff_t _Num = __last - __first;
   if (_Num)
     __builtin_memmove(__result - _Num, __first, sizeof(_Tp) * _Num);
   return __result - _Num;
 }
    };

  template<bool _IsMove, typename _BI1, typename _BI2>
    inline _BI2
    __copy_move_backward_a(_BI1 __first, _BI1 __last, _BI2 __result)
    {
      typedef typename iterator_traits<_BI1>::value_type _ValueType1;
      typedef typename iterator_traits<_BI2>::value_type _ValueType2;
      typedef typename iterator_traits<_BI1>::iterator_category _Category;
      const bool __simple = (__is_trivial(_ValueType1)
                      && __is_pointer<_BI1>::__value
                      && __is_pointer<_BI2>::__value
        && __are_same<_ValueType1, _ValueType2>::__value);

      return std::__copy_move_backward<_IsMove, __simple,
                                _Category>::__copy_move_b(__first,
         __last,
         __result);
    }

  template<bool _IsMove, typename _BI1, typename _BI2>
    inline _BI2
    __copy_move_backward_a2(_BI1 __first, _BI1 __last, _BI2 __result)
    {
      return _BI2(std::__copy_move_backward_a<_IsMove>
    (std::__niter_base(__first), std::__niter_base(__last),
     std::__niter_base(__result)));
    }
# 636 "/usr/include/c++/5/bits/stl_algobase.h" 3
  template<typename _BI1, typename _BI2>
    inline _BI2
    copy_backward(_BI1 __first, _BI1 __last, _BI2 __result)
    {

     
     
     


      ;

      return (std::__copy_move_backward_a2<__is_move_iterator<_BI1>::__value>
       (std::__miter_base(__first), std::__miter_base(__last),
        __result));
    }
# 694 "/usr/include/c++/5/bits/stl_algobase.h" 3
  template<typename _ForwardIterator, typename _Tp>
    inline typename
    __gnu_cxx::__enable_if<!__is_scalar<_Tp>::__value, void>::__type
    __fill_a(_ForwardIterator __first, _ForwardIterator __last,
       const _Tp& __value)
    {
      for (; __first != __last; ++__first)
 *__first = __value;
    }

  template<typename _ForwardIterator, typename _Tp>
    inline typename
    __gnu_cxx::__enable_if<__is_scalar<_Tp>::__value, void>::__type
    __fill_a(_ForwardIterator __first, _ForwardIterator __last,
      const _Tp& __value)
    {
      const _Tp __tmp = __value;
      for (; __first != __last; ++__first)
 *__first = __tmp;
    }


  template<typename _Tp>
    inline typename
    __gnu_cxx::__enable_if<__is_byte<_Tp>::__value, void>::__type
    __fill_a(_Tp* __first, _Tp* __last, const _Tp& __c)
    {
      const _Tp __tmp = __c;
      if (const size_t __len = __last - __first)
 __builtin_memset(__first, static_cast<unsigned char>(__tmp), __len);
    }
# 738 "/usr/include/c++/5/bits/stl_algobase.h" 3
  template<typename _ForwardIterator, typename _Tp>
    inline void
    fill(_ForwardIterator __first, _ForwardIterator __last, const _Tp& __value)
    {

     

      ;

      std::__fill_a(std::__niter_base(__first), std::__niter_base(__last),
      __value);
    }

  template<typename _OutputIterator, typename _Size, typename _Tp>
    inline typename
    __gnu_cxx::__enable_if<!__is_scalar<_Tp>::__value, _OutputIterator>::__type
    __fill_n_a(_OutputIterator __first, _Size __n, const _Tp& __value)
    {
      for (__decltype(__n + 0) __niter = __n;
    __niter > 0; --__niter, ++__first)
 *__first = __value;
      return __first;
    }

  template<typename _OutputIterator, typename _Size, typename _Tp>
    inline typename
    __gnu_cxx::__enable_if<__is_scalar<_Tp>::__value, _OutputIterator>::__type
    __fill_n_a(_OutputIterator __first, _Size __n, const _Tp& __value)
    {
      const _Tp __tmp = __value;
      for (__decltype(__n + 0) __niter = __n;
    __niter > 0; --__niter, ++__first)
 *__first = __tmp;
      return __first;
    }

  template<typename _Size, typename _Tp>
    inline typename
    __gnu_cxx::__enable_if<__is_byte<_Tp>::__value, _Tp*>::__type
    __fill_n_a(_Tp* __first, _Size __n, const _Tp& __c)
    {
      std::__fill_a(__first, __first + __n, __c);
      return __first + __n;
    }
# 798 "/usr/include/c++/5/bits/stl_algobase.h" 3
  template<typename _OI, typename _Size, typename _Tp>
    inline _OI
    fill_n(_OI __first, _Size __n, const _Tp& __value)
    {

     

      return _OI(std::__fill_n_a(std::__niter_base(__first), __n, __value));
    }

  template<bool _BoolType>
    struct __equal
    {
      template<typename _II1, typename _II2>
        static bool
        equal(_II1 __first1, _II1 __last1, _II2 __first2)
        {
   for (; __first1 != __last1; ++__first1, ++__first2)
     if (!(*__first1 == *__first2))
       return false;
   return true;
 }
    };

  template<>
    struct __equal<true>
    {
      template<typename _Tp>
        static bool
        equal(const _Tp* __first1, const _Tp* __last1, const _Tp* __first2)
        {
   if (const size_t __len = (__last1 - __first1))
     return !__builtin_memcmp(__first1, __first2, sizeof(_Tp) * __len);
   return true;
 }
    };

  template<typename _II1, typename _II2>
    inline bool
    __equal_aux(_II1 __first1, _II1 __last1, _II2 __first2)
    {
      typedef typename iterator_traits<_II1>::value_type _ValueType1;
      typedef typename iterator_traits<_II2>::value_type _ValueType2;
      const bool __simple = ((__is_integer<_ValueType1>::__value
         || __is_pointer<_ValueType1>::__value)
                      && __is_pointer<_II1>::__value
                      && __is_pointer<_II2>::__value
        && __are_same<_ValueType1, _ValueType2>::__value);

      return std::__equal<__simple>::equal(__first1, __last1, __first2);
    }

  template<typename, typename>
    struct __lc_rai
    {
      template<typename _II1, typename _II2>
        static _II1
        __newlast1(_II1, _II1 __last1, _II2, _II2)
        { return __last1; }

      template<typename _II>
        static bool
        __cnd2(_II __first, _II __last)
        { return __first != __last; }
    };

  template<>
    struct __lc_rai<random_access_iterator_tag, random_access_iterator_tag>
    {
      template<typename _RAI1, typename _RAI2>
        static _RAI1
        __newlast1(_RAI1 __first1, _RAI1 __last1,
     _RAI2 __first2, _RAI2 __last2)
        {
   const typename iterator_traits<_RAI1>::difference_type
     __diff1 = __last1 - __first1;
   const typename iterator_traits<_RAI2>::difference_type
     __diff2 = __last2 - __first2;
   return __diff2 < __diff1 ? __first1 + __diff2 : __last1;
 }

      template<typename _RAI>
        static bool
        __cnd2(_RAI, _RAI)
        { return true; }
    };

  template<typename _II1, typename _II2, typename _Compare>
    bool
    __lexicographical_compare_impl(_II1 __first1, _II1 __last1,
       _II2 __first2, _II2 __last2,
       _Compare __comp)
    {
      typedef typename iterator_traits<_II1>::iterator_category _Category1;
      typedef typename iterator_traits<_II2>::iterator_category _Category2;
      typedef std::__lc_rai<_Category1, _Category2> __rai_type;

      __last1 = __rai_type::__newlast1(__first1, __last1, __first2, __last2);
      for (; __first1 != __last1 && __rai_type::__cnd2(__first2, __last2);
    ++__first1, ++__first2)
 {
   if (__comp(__first1, __first2))
     return true;
   if (__comp(__first2, __first1))
     return false;
 }
      return __first1 == __last1 && __first2 != __last2;
    }

  template<bool _BoolType>
    struct __lexicographical_compare
    {
      template<typename _II1, typename _II2>
        static bool __lc(_II1, _II1, _II2, _II2);
    };

  template<bool _BoolType>
    template<typename _II1, typename _II2>
      bool
      __lexicographical_compare<_BoolType>::
      __lc(_II1 __first1, _II1 __last1, _II2 __first2, _II2 __last2)
      {
 return std::__lexicographical_compare_impl(__first1, __last1,
         __first2, __last2,
     __gnu_cxx::__ops::__iter_less_iter());
      }

  template<>
    struct __lexicographical_compare<true>
    {
      template<typename _Tp, typename _Up>
        static bool
        __lc(const _Tp* __first1, const _Tp* __last1,
      const _Up* __first2, const _Up* __last2)
 {
   const size_t __len1 = __last1 - __first1;
   const size_t __len2 = __last2 - __first2;
   if (const size_t __len = std::min(__len1, __len2))
     if (int __result = __builtin_memcmp(__first1, __first2, __len))
       return __result < 0;
   return __len1 < __len2;
 }
    };

  template<typename _II1, typename _II2>
    inline bool
    __lexicographical_compare_aux(_II1 __first1, _II1 __last1,
      _II2 __first2, _II2 __last2)
    {
      typedef typename iterator_traits<_II1>::value_type _ValueType1;
      typedef typename iterator_traits<_II2>::value_type _ValueType2;
      const bool __simple =
 (__is_byte<_ValueType1>::__value && __is_byte<_ValueType2>::__value
  && !__gnu_cxx::__numeric_traits<_ValueType1>::__is_signed
  && !__gnu_cxx::__numeric_traits<_ValueType2>::__is_signed
  && __is_pointer<_II1>::__value
  && __is_pointer<_II2>::__value);

      return std::__lexicographical_compare<__simple>::__lc(__first1, __last1,
           __first2, __last2);
    }

  template<typename _ForwardIterator, typename _Tp, typename _Compare>
    _ForwardIterator
    __lower_bound(_ForwardIterator __first, _ForwardIterator __last,
    const _Tp& __val, _Compare __comp)
    {
      typedef typename iterator_traits<_ForwardIterator>::difference_type
 _DistanceType;

      _DistanceType __len = std::distance(__first, __last);

      while (__len > 0)
 {
   _DistanceType __half = __len >> 1;
   _ForwardIterator __middle = __first;
   std::advance(__middle, __half);
   if (__comp(__middle, __val))
     {
       __first = __middle;
       ++__first;
       __len = __len - __half - 1;
     }
   else
     __len = __half;
 }
      return __first;
    }
# 998 "/usr/include/c++/5/bits/stl_algobase.h" 3
  template<typename _ForwardIterator, typename _Tp>
    inline _ForwardIterator
    lower_bound(_ForwardIterator __first, _ForwardIterator __last,
  const _Tp& __val)
    {

     
     

      ;

      return std::__lower_bound(__first, __last, __val,
    __gnu_cxx::__ops::__iter_less_val());
    }



  inline int
  __lg(int __n)
  { return sizeof(int) * 8 - 1 - __builtin_clz(__n); }

  inline unsigned
  __lg(unsigned __n)
  { return sizeof(int) * 8 - 1 - __builtin_clz(__n); }

  inline long
  __lg(long __n)
  { return sizeof(long) * 8 - 1 - __builtin_clzl(__n); }

  inline unsigned long
  __lg(unsigned long __n)
  { return sizeof(long) * 8 - 1 - __builtin_clzl(__n); }

  inline long long
  __lg(long long __n)
  { return sizeof(long long) * 8 - 1 - __builtin_clzll(__n); }

  inline unsigned long long
  __lg(unsigned long long __n)
  { return sizeof(long long) * 8 - 1 - __builtin_clzll(__n); }




# 1055 "/usr/include/c++/5/bits/stl_algobase.h" 3
  template<typename _II1, typename _II2>
    inline bool
    equal(_II1 __first1, _II1 __last1, _II2 __first2)
    {

     
     
     


      ;

      return std::__equal_aux(std::__niter_base(__first1),
         std::__niter_base(__last1),
         std::__niter_base(__first2));
    }
# 1087 "/usr/include/c++/5/bits/stl_algobase.h" 3
  template<typename _IIter1, typename _IIter2, typename _BinaryPredicate>
    inline bool
    equal(_IIter1 __first1, _IIter1 __last1,
   _IIter2 __first2, _BinaryPredicate __binary_pred)
    {

     
     
      ;

      for (; __first1 != __last1; ++__first1, ++__first2)
 if (!bool(__binary_pred(*__first1, *__first2)))
   return false;
      return true;
    }
# 1215 "/usr/include/c++/5/bits/stl_algobase.h" 3
  template<typename _II1, typename _II2>
    inline bool
    lexicographical_compare(_II1 __first1, _II1 __last1,
       _II2 __first2, _II2 __last2)
    {





     
     
     
     
      ;
      ;

      return std::__lexicographical_compare_aux(std::__niter_base(__first1),
      std::__niter_base(__last1),
      std::__niter_base(__first2),
      std::__niter_base(__last2));
    }
# 1251 "/usr/include/c++/5/bits/stl_algobase.h" 3
  template<typename _II1, typename _II2, typename _Compare>
    inline bool
    lexicographical_compare(_II1 __first1, _II1 __last1,
       _II2 __first2, _II2 __last2, _Compare __comp)
    {

     
     
      ;
      ;

      return std::__lexicographical_compare_impl
 (__first1, __last1, __first2, __last2,
  __gnu_cxx::__ops::__iter_comp_iter(__comp));
    }

  template<typename _InputIterator1, typename _InputIterator2,
    typename _BinaryPredicate>
    pair<_InputIterator1, _InputIterator2>
    __mismatch(_InputIterator1 __first1, _InputIterator1 __last1,
        _InputIterator2 __first2, _BinaryPredicate __binary_pred)
    {
      while (__first1 != __last1 && __binary_pred(__first1, __first2))
        {
   ++__first1;
   ++__first2;
        }
      return pair<_InputIterator1, _InputIterator2>(__first1, __first2);
    }
# 1294 "/usr/include/c++/5/bits/stl_algobase.h" 3
  template<typename _InputIterator1, typename _InputIterator2>
    inline pair<_InputIterator1, _InputIterator2>
    mismatch(_InputIterator1 __first1, _InputIterator1 __last1,
      _InputIterator2 __first2)
    {

     
     
     


      ;

      return std::__mismatch(__first1, __last1, __first2,
        __gnu_cxx::__ops::__iter_equal_to_iter());
    }
# 1327 "/usr/include/c++/5/bits/stl_algobase.h" 3
  template<typename _InputIterator1, typename _InputIterator2,
    typename _BinaryPredicate>
    inline pair<_InputIterator1, _InputIterator2>
    mismatch(_InputIterator1 __first1, _InputIterator1 __last1,
      _InputIterator2 __first2, _BinaryPredicate __binary_pred)
    {

     
     
      ;

      return std::__mismatch(__first1, __last1, __first2,
 __gnu_cxx::__ops::__iter_comp_iter(__binary_pred));
    }
# 1427 "/usr/include/c++/5/bits/stl_algobase.h" 3

}
# 40 "/usr/include/c++/5/bits/char_traits.h" 2 3
# 1 "/usr/include/c++/5/bits/postypes.h" 1 3
# 38 "/usr/include/c++/5/bits/postypes.h" 3
       
# 39 "/usr/include/c++/5/bits/postypes.h" 3

# 1 "/usr/include/c++/5/cwchar" 1 3
# 39 "/usr/include/c++/5/cwchar" 3
       
# 40 "/usr/include/c++/5/cwchar" 3




# 1 "/usr/include/wchar.h" 1 3 4
# 36 "/usr/include/wchar.h" 3 4
# 1 "/usr/include/stdio.h" 1 3 4
# 44 "/usr/include/stdio.h" 3 4
struct _IO_FILE;



typedef struct _IO_FILE FILE;





# 64 "/usr/include/stdio.h" 3 4
typedef struct _IO_FILE __FILE;
# 37 "/usr/include/wchar.h" 2 3 4


# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdarg.h" 1 3 4
# 40 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 40 "/usr/include/wchar.h" 2 3 4

# 1 "/usr/include/x86_64-linux-gnu/bits/wchar.h" 1 3 4
# 42 "/usr/include/wchar.h" 2 3 4
# 51 "/usr/include/wchar.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 1 3 4
# 357 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 52 "/usr/include/wchar.h" 2 3 4
# 82 "/usr/include/wchar.h" 3 4
typedef struct
{
  int __count;
  union
  {

    unsigned int __wch;



    char __wchb[4];
  } __value;
} __mbstate_t;
# 104 "/usr/include/wchar.h" 3 4


typedef __mbstate_t mbstate_t;






# 132 "/usr/include/wchar.h" 3 4
extern "C" {




struct tm;









extern wchar_t *wcscpy (wchar_t *__restrict __dest,
   const wchar_t *__restrict __src)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern wchar_t *wcsncpy (wchar_t *__restrict __dest,
    const wchar_t *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern wchar_t *wcscat (wchar_t *__restrict __dest,
   const wchar_t *__restrict __src)
     throw () __attribute__ ((__nonnull__ (1, 2)));

extern wchar_t *wcsncat (wchar_t *__restrict __dest,
    const wchar_t *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int wcscmp (const wchar_t *__s1, const wchar_t *__s2)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern int wcsncmp (const wchar_t *__s1, const wchar_t *__s2, size_t __n)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));




extern int wcscasecmp (const wchar_t *__s1, const wchar_t *__s2) throw ();


extern int wcsncasecmp (const wchar_t *__s1, const wchar_t *__s2,
   size_t __n) throw ();





extern int wcscasecmp_l (const wchar_t *__s1, const wchar_t *__s2,
    __locale_t __loc) throw ();

extern int wcsncasecmp_l (const wchar_t *__s1, const wchar_t *__s2,
     size_t __n, __locale_t __loc) throw ();





extern int wcscoll (const wchar_t *__s1, const wchar_t *__s2) throw ();



extern size_t wcsxfrm (wchar_t *__restrict __s1,
         const wchar_t *__restrict __s2, size_t __n) throw ();








extern int wcscoll_l (const wchar_t *__s1, const wchar_t *__s2,
        __locale_t __loc) throw ();




extern size_t wcsxfrm_l (wchar_t *__s1, const wchar_t *__s2,
    size_t __n, __locale_t __loc) throw ();


extern wchar_t *wcsdup (const wchar_t *__s) throw () __attribute__ ((__malloc__));





extern "C++" wchar_t *wcschr (wchar_t *__wcs, wchar_t __wc)
     throw () __asm ("wcschr") __attribute__ ((__pure__));
extern "C++" const wchar_t *wcschr (const wchar_t *__wcs, wchar_t __wc)
     throw () __asm ("wcschr") __attribute__ ((__pure__));






extern "C++" wchar_t *wcsrchr (wchar_t *__wcs, wchar_t __wc)
     throw () __asm ("wcsrchr") __attribute__ ((__pure__));
extern "C++" const wchar_t *wcsrchr (const wchar_t *__wcs, wchar_t __wc)
     throw () __asm ("wcsrchr") __attribute__ ((__pure__));









extern wchar_t *wcschrnul (const wchar_t *__s, wchar_t __wc)
     throw () __attribute__ ((__pure__));





extern size_t wcscspn (const wchar_t *__wcs, const wchar_t *__reject)
     throw () __attribute__ ((__pure__));


extern size_t wcsspn (const wchar_t *__wcs, const wchar_t *__accept)
     throw () __attribute__ ((__pure__));


extern "C++" wchar_t *wcspbrk (wchar_t *__wcs, const wchar_t *__accept)
     throw () __asm ("wcspbrk") __attribute__ ((__pure__));
extern "C++" const wchar_t *wcspbrk (const wchar_t *__wcs,
         const wchar_t *__accept)
     throw () __asm ("wcspbrk") __attribute__ ((__pure__));






extern "C++" wchar_t *wcsstr (wchar_t *__haystack, const wchar_t *__needle)
     throw () __asm ("wcsstr") __attribute__ ((__pure__));
extern "C++" const wchar_t *wcsstr (const wchar_t *__haystack,
        const wchar_t *__needle)
     throw () __asm ("wcsstr") __attribute__ ((__pure__));






extern wchar_t *wcstok (wchar_t *__restrict __s,
   const wchar_t *__restrict __delim,
   wchar_t **__restrict __ptr) throw ();


extern size_t wcslen (const wchar_t *__s) throw () __attribute__ ((__pure__));





extern "C++" wchar_t *wcswcs (wchar_t *__haystack, const wchar_t *__needle)
     throw () __asm ("wcswcs") __attribute__ ((__pure__));
extern "C++" const wchar_t *wcswcs (const wchar_t *__haystack,
        const wchar_t *__needle)
     throw () __asm ("wcswcs") __attribute__ ((__pure__));
# 309 "/usr/include/wchar.h" 3 4
extern size_t wcsnlen (const wchar_t *__s, size_t __maxlen)
     throw () __attribute__ ((__pure__));






extern "C++" wchar_t *wmemchr (wchar_t *__s, wchar_t __c, size_t __n)
     throw () __asm ("wmemchr") __attribute__ ((__pure__));
extern "C++" const wchar_t *wmemchr (const wchar_t *__s, wchar_t __c,
         size_t __n)
     throw () __asm ("wmemchr") __attribute__ ((__pure__));






extern int wmemcmp (const wchar_t *__s1, const wchar_t *__s2, size_t __n)
     throw () __attribute__ ((__pure__));


extern wchar_t *wmemcpy (wchar_t *__restrict __s1,
    const wchar_t *__restrict __s2, size_t __n) throw ();



extern wchar_t *wmemmove (wchar_t *__s1, const wchar_t *__s2, size_t __n)
     throw ();


extern wchar_t *wmemset (wchar_t *__s, wchar_t __c, size_t __n) throw ();





extern wchar_t *wmempcpy (wchar_t *__restrict __s1,
     const wchar_t *__restrict __s2, size_t __n)
     throw ();






extern wint_t btowc (int __c) throw ();



extern int wctob (wint_t __c) throw ();



extern int mbsinit (const mbstate_t *__ps) throw () __attribute__ ((__pure__));



extern size_t mbrtowc (wchar_t *__restrict __pwc,
         const char *__restrict __s, size_t __n,
         mbstate_t *__restrict __p) throw ();


extern size_t wcrtomb (char *__restrict __s, wchar_t __wc,
         mbstate_t *__restrict __ps) throw ();


extern size_t __mbrlen (const char *__restrict __s, size_t __n,
   mbstate_t *__restrict __ps) throw ();
extern size_t mbrlen (const char *__restrict __s, size_t __n,
        mbstate_t *__restrict __ps) throw ();

# 408 "/usr/include/wchar.h" 3 4



extern size_t mbsrtowcs (wchar_t *__restrict __dst,
    const char **__restrict __src, size_t __len,
    mbstate_t *__restrict __ps) throw ();



extern size_t wcsrtombs (char *__restrict __dst,
    const wchar_t **__restrict __src, size_t __len,
    mbstate_t *__restrict __ps) throw ();






extern size_t mbsnrtowcs (wchar_t *__restrict __dst,
     const char **__restrict __src, size_t __nmc,
     size_t __len, mbstate_t *__restrict __ps) throw ();



extern size_t wcsnrtombs (char *__restrict __dst,
     const wchar_t **__restrict __src,
     size_t __nwc, size_t __len,
     mbstate_t *__restrict __ps) throw ();






extern int wcwidth (wchar_t __c) throw ();



extern int wcswidth (const wchar_t *__s, size_t __n) throw ();






extern double wcstod (const wchar_t *__restrict __nptr,
        wchar_t **__restrict __endptr) throw ();





extern float wcstof (const wchar_t *__restrict __nptr,
       wchar_t **__restrict __endptr) throw ();
extern long double wcstold (const wchar_t *__restrict __nptr,
       wchar_t **__restrict __endptr) throw ();







extern long int wcstol (const wchar_t *__restrict __nptr,
   wchar_t **__restrict __endptr, int __base) throw ();



extern unsigned long int wcstoul (const wchar_t *__restrict __nptr,
      wchar_t **__restrict __endptr, int __base)
     throw ();






__extension__
extern long long int wcstoll (const wchar_t *__restrict __nptr,
         wchar_t **__restrict __endptr, int __base)
     throw ();



__extension__
extern unsigned long long int wcstoull (const wchar_t *__restrict __nptr,
     wchar_t **__restrict __endptr,
     int __base) throw ();






__extension__
extern long long int wcstoq (const wchar_t *__restrict __nptr,
        wchar_t **__restrict __endptr, int __base)
     throw ();



__extension__
extern unsigned long long int wcstouq (const wchar_t *__restrict __nptr,
           wchar_t **__restrict __endptr,
           int __base) throw ();
# 533 "/usr/include/wchar.h" 3 4
extern long int wcstol_l (const wchar_t *__restrict __nptr,
     wchar_t **__restrict __endptr, int __base,
     __locale_t __loc) throw ();

extern unsigned long int wcstoul_l (const wchar_t *__restrict __nptr,
        wchar_t **__restrict __endptr,
        int __base, __locale_t __loc) throw ();

__extension__
extern long long int wcstoll_l (const wchar_t *__restrict __nptr,
    wchar_t **__restrict __endptr,
    int __base, __locale_t __loc) throw ();

__extension__
extern unsigned long long int wcstoull_l (const wchar_t *__restrict __nptr,
       wchar_t **__restrict __endptr,
       int __base, __locale_t __loc)
     throw ();

extern double wcstod_l (const wchar_t *__restrict __nptr,
   wchar_t **__restrict __endptr, __locale_t __loc)
     throw ();

extern float wcstof_l (const wchar_t *__restrict __nptr,
         wchar_t **__restrict __endptr, __locale_t __loc)
     throw ();

extern long double wcstold_l (const wchar_t *__restrict __nptr,
         wchar_t **__restrict __endptr,
         __locale_t __loc) throw ();






extern wchar_t *wcpcpy (wchar_t *__restrict __dest,
   const wchar_t *__restrict __src) throw ();



extern wchar_t *wcpncpy (wchar_t *__restrict __dest,
    const wchar_t *__restrict __src, size_t __n)
     throw ();






extern __FILE *open_wmemstream (wchar_t **__bufloc, size_t *__sizeloc) throw ();






extern int fwide (__FILE *__fp, int __mode) throw ();






extern int fwprintf (__FILE *__restrict __stream,
       const wchar_t *__restrict __format, ...)
                                                           ;




extern int wprintf (const wchar_t *__restrict __format, ...)
                                                           ;

extern int swprintf (wchar_t *__restrict __s, size_t __n,
       const wchar_t *__restrict __format, ...)
     throw () ;





extern int vfwprintf (__FILE *__restrict __s,
        const wchar_t *__restrict __format,
        __gnuc_va_list __arg)
                                                           ;




extern int vwprintf (const wchar_t *__restrict __format,
       __gnuc_va_list __arg)
                                                           ;


extern int vswprintf (wchar_t *__restrict __s, size_t __n,
        const wchar_t *__restrict __format,
        __gnuc_va_list __arg)
     throw () ;






extern int fwscanf (__FILE *__restrict __stream,
      const wchar_t *__restrict __format, ...)
                                                          ;




extern int wscanf (const wchar_t *__restrict __format, ...)
                                                          ;

extern int swscanf (const wchar_t *__restrict __s,
      const wchar_t *__restrict __format, ...)
     throw () ;
# 683 "/usr/include/wchar.h" 3 4









extern int vfwscanf (__FILE *__restrict __s,
       const wchar_t *__restrict __format,
       __gnuc_va_list __arg)
                                                          ;




extern int vwscanf (const wchar_t *__restrict __format,
      __gnuc_va_list __arg)
                                                          ;

extern int vswscanf (const wchar_t *__restrict __s,
       const wchar_t *__restrict __format,
       __gnuc_va_list __arg)
     throw () ;
# 739 "/usr/include/wchar.h" 3 4









extern wint_t fgetwc (__FILE *__stream);
extern wint_t getwc (__FILE *__stream);





extern wint_t getwchar (void);






extern wint_t fputwc (wchar_t __wc, __FILE *__stream);
extern wint_t putwc (wchar_t __wc, __FILE *__stream);





extern wint_t putwchar (wchar_t __wc);







extern wchar_t *fgetws (wchar_t *__restrict __ws, int __n,
   __FILE *__restrict __stream);





extern int fputws (const wchar_t *__restrict __ws,
     __FILE *__restrict __stream);






extern wint_t ungetwc (wint_t __wc, __FILE *__stream);

# 804 "/usr/include/wchar.h" 3 4
extern wint_t getwc_unlocked (__FILE *__stream);
extern wint_t getwchar_unlocked (void);







extern wint_t fgetwc_unlocked (__FILE *__stream);







extern wint_t fputwc_unlocked (wchar_t __wc, __FILE *__stream);
# 830 "/usr/include/wchar.h" 3 4
extern wint_t putwc_unlocked (wchar_t __wc, __FILE *__stream);
extern wint_t putwchar_unlocked (wchar_t __wc);
# 840 "/usr/include/wchar.h" 3 4
extern wchar_t *fgetws_unlocked (wchar_t *__restrict __ws, int __n,
     __FILE *__restrict __stream);







extern int fputws_unlocked (const wchar_t *__restrict __ws,
       __FILE *__restrict __stream);







extern size_t wcsftime (wchar_t *__restrict __s, size_t __maxsize,
   const wchar_t *__restrict __format,
   const struct tm *__restrict __tp) throw ();







extern size_t wcsftime_l (wchar_t *__restrict __s, size_t __maxsize,
     const wchar_t *__restrict __format,
     const struct tm *__restrict __tp,
     __locale_t __loc) throw ();
# 894 "/usr/include/wchar.h" 3 4
}
# 45 "/usr/include/c++/5/cwchar" 2 3
# 62 "/usr/include/c++/5/cwchar" 3
namespace std
{
  using ::mbstate_t;
}
# 135 "/usr/include/c++/5/cwchar" 3
namespace std __attribute__ ((__visibility__ ("default")))
{


  using ::wint_t;

  using ::btowc;
  using ::fgetwc;
  using ::fgetws;
  using ::fputwc;
  using ::fputws;
  using ::fwide;
  using ::fwprintf;
  using ::fwscanf;
  using ::getwc;
  using ::getwchar;
  using ::mbrlen;
  using ::mbrtowc;
  using ::mbsinit;
  using ::mbsrtowcs;
  using ::putwc;
  using ::putwchar;

  using ::swprintf;

  using ::swscanf;
  using ::ungetwc;
  using ::vfwprintf;

  using ::vfwscanf;


  using ::vswprintf;


  using ::vswscanf;

  using ::vwprintf;

  using ::vwscanf;

  using ::wcrtomb;
  using ::wcscat;
  using ::wcscmp;
  using ::wcscoll;
  using ::wcscpy;
  using ::wcscspn;
  using ::wcsftime;
  using ::wcslen;
  using ::wcsncat;
  using ::wcsncmp;
  using ::wcsncpy;
  using ::wcsrtombs;
  using ::wcsspn;
  using ::wcstod;

  using ::wcstof;

  using ::wcstok;
  using ::wcstol;
  using ::wcstoul;
  using ::wcsxfrm;
  using ::wctob;
  using ::wmemcmp;
  using ::wmemcpy;
  using ::wmemmove;
  using ::wmemset;
  using ::wprintf;
  using ::wscanf;
  using ::wcschr;
  using ::wcspbrk;
  using ::wcsrchr;
  using ::wcsstr;
  using ::wmemchr;
# 232 "/usr/include/c++/5/cwchar" 3

}







namespace __gnu_cxx
{





  using ::wcstold;
# 257 "/usr/include/c++/5/cwchar" 3
  using ::wcstoll;
  using ::wcstoull;

}

namespace std
{
  using ::__gnu_cxx::wcstold;
  using ::__gnu_cxx::wcstoll;
  using ::__gnu_cxx::wcstoull;
}
# 41 "/usr/include/c++/5/bits/postypes.h" 2 3
# 68 "/usr/include/c++/5/bits/postypes.h" 3
namespace std __attribute__ ((__visibility__ ("default")))
{

# 88 "/usr/include/c++/5/bits/postypes.h" 3
  typedef long streamoff;
# 98 "/usr/include/c++/5/bits/postypes.h" 3
  typedef ptrdiff_t streamsize;
# 111 "/usr/include/c++/5/bits/postypes.h" 3
  template<typename _StateT>
    class fpos
    {
    private:
      streamoff _M_off;
      _StateT _M_state;

    public:




      fpos()
      : _M_off(0), _M_state() { }
# 133 "/usr/include/c++/5/bits/postypes.h" 3
      fpos(streamoff __off)
      : _M_off(__off), _M_state() { }


      operator streamoff() const { return _M_off; }


      void
      state(_StateT __st)
      { _M_state = __st; }


      _StateT
      state() const
      { return _M_state; }





      fpos&
      operator+=(streamoff __off)
      {
 _M_off += __off;
 return *this;
      }





      fpos&
      operator-=(streamoff __off)
      {
 _M_off -= __off;
 return *this;
      }







      fpos
      operator+(streamoff __off) const
      {
 fpos __pos(*this);
 __pos += __off;
 return __pos;
      }







      fpos
      operator-(streamoff __off) const
      {
 fpos __pos(*this);
 __pos -= __off;
 return __pos;
      }






      streamoff
      operator-(const fpos& __other) const
      { return _M_off - __other._M_off; }
    };






  template<typename _StateT>
    inline bool
    operator==(const fpos<_StateT>& __lhs, const fpos<_StateT>& __rhs)
    { return streamoff(__lhs) == streamoff(__rhs); }

  template<typename _StateT>
    inline bool
    operator!=(const fpos<_StateT>& __lhs, const fpos<_StateT>& __rhs)
    { return streamoff(__lhs) != streamoff(__rhs); }





  typedef fpos<mbstate_t> streampos;

  typedef fpos<mbstate_t> wstreampos;
# 239 "/usr/include/c++/5/bits/postypes.h" 3

}
# 41 "/usr/include/c++/5/bits/char_traits.h" 2 3
# 1 "/usr/include/c++/5/cwchar" 1 3
# 39 "/usr/include/c++/5/cwchar" 3
       
# 40 "/usr/include/c++/5/cwchar" 3




# 1 "/usr/include/wchar.h" 1 3 4
# 45 "/usr/include/c++/5/cwchar" 2 3
# 42 "/usr/include/c++/5/bits/char_traits.h" 2 3

namespace __gnu_cxx __attribute__ ((__visibility__ ("default")))
{

# 57 "/usr/include/c++/5/bits/char_traits.h" 3
  template<typename _CharT>
    struct _Char_types
    {
      typedef unsigned long int_type;
      typedef std::streampos pos_type;
      typedef std::streamoff off_type;
      typedef std::mbstate_t state_type;
    };
# 82 "/usr/include/c++/5/bits/char_traits.h" 3
  template<typename _CharT>
    struct char_traits
    {
      typedef _CharT char_type;
      typedef typename _Char_types<_CharT>::int_type int_type;
      typedef typename _Char_types<_CharT>::pos_type pos_type;
      typedef typename _Char_types<_CharT>::off_type off_type;
      typedef typename _Char_types<_CharT>::state_type state_type;

      static void
      assign(char_type& __c1, const char_type& __c2)
      { __c1 = __c2; }

      static bool
      eq(const char_type& __c1, const char_type& __c2)
      { return __c1 == __c2; }

      static bool
      lt(const char_type& __c1, const char_type& __c2)
      { return __c1 < __c2; }

      static int
      compare(const char_type* __s1, const char_type* __s2, std::size_t __n);

      static std::size_t
      length(const char_type* __s);

      static const char_type*
      find(const char_type* __s, std::size_t __n, const char_type& __a);

      static char_type*
      move(char_type* __s1, const char_type* __s2, std::size_t __n);

      static char_type*
      copy(char_type* __s1, const char_type* __s2, std::size_t __n);

      static char_type*
      assign(char_type* __s, std::size_t __n, char_type __a);

      static char_type
      to_char_type(const int_type& __c)
      { return static_cast<char_type>(__c); }

      static int_type
      to_int_type(const char_type& __c)
      { return static_cast<int_type>(__c); }

      static bool
      eq_int_type(const int_type& __c1, const int_type& __c2)
      { return __c1 == __c2; }

      static int_type
      eof()
      { return static_cast<int_type>(-1); }

      static int_type
      not_eof(const int_type& __c)
      { return !eq_int_type(__c, eof()) ? __c : to_int_type(char_type()); }
    };

  template<typename _CharT>
    int
    char_traits<_CharT>::
    compare(const char_type* __s1, const char_type* __s2, std::size_t __n)
    {
      for (std::size_t __i = 0; __i < __n; ++__i)
 if (lt(__s1[__i], __s2[__i]))
   return -1;
 else if (lt(__s2[__i], __s1[__i]))
   return 1;
      return 0;
    }

  template<typename _CharT>
    std::size_t
    char_traits<_CharT>::
    length(const char_type* __p)
    {
      std::size_t __i = 0;
      while (!eq(__p[__i], char_type()))
        ++__i;
      return __i;
    }

  template<typename _CharT>
    const typename char_traits<_CharT>::char_type*
    char_traits<_CharT>::
    find(const char_type* __s, std::size_t __n, const char_type& __a)
    {
      for (std::size_t __i = 0; __i < __n; ++__i)
        if (eq(__s[__i], __a))
          return __s + __i;
      return 0;
    }

  template<typename _CharT>
    typename char_traits<_CharT>::char_type*
    char_traits<_CharT>::
    move(char_type* __s1, const char_type* __s2, std::size_t __n)
    {
      return static_cast<_CharT*>(__builtin_memmove(__s1, __s2,
          __n * sizeof(char_type)));
    }

  template<typename _CharT>
    typename char_traits<_CharT>::char_type*
    char_traits<_CharT>::
    copy(char_type* __s1, const char_type* __s2, std::size_t __n)
    {

      std::copy(__s2, __s2 + __n, __s1);
      return __s1;
    }

  template<typename _CharT>
    typename char_traits<_CharT>::char_type*
    char_traits<_CharT>::
    assign(char_type* __s, std::size_t __n, char_type __a)
    {

      std::fill_n(__s, __n, __a);
      return __s;
    }


}

namespace std __attribute__ ((__visibility__ ("default")))
{

# 226 "/usr/include/c++/5/bits/char_traits.h" 3
  template<class _CharT>
    struct char_traits : public __gnu_cxx::char_traits<_CharT>
    { };



  template<>
    struct char_traits<char>
    {
      typedef char char_type;
      typedef int int_type;
      typedef streampos pos_type;
      typedef streamoff off_type;
      typedef mbstate_t state_type;

      static void
      assign(char_type& __c1, const char_type& __c2)
      { __c1 = __c2; }

      static bool
      eq(const char_type& __c1, const char_type& __c2)
      { return __c1 == __c2; }

      static bool
      lt(const char_type& __c1, const char_type& __c2)
      {

 return (static_cast<unsigned char>(__c1)
  < static_cast<unsigned char>(__c2));
      }

      static int
      compare(const char_type* __s1, const char_type* __s2, size_t __n)
      {
 if (__n == 0)
   return 0;
 return __builtin_memcmp(__s1, __s2, __n);
      }

      static size_t
      length(const char_type* __s)
      { return __builtin_strlen(__s); }

      static const char_type*
      find(const char_type* __s, size_t __n, const char_type& __a)
      {
 if (__n == 0)
   return 0;
 return static_cast<const char_type*>(__builtin_memchr(__s, __a, __n));
      }

      static char_type*
      move(char_type* __s1, const char_type* __s2, size_t __n)
      {
 if (__n == 0)
   return __s1;
 return static_cast<char_type*>(__builtin_memmove(__s1, __s2, __n));
      }

      static char_type*
      copy(char_type* __s1, const char_type* __s2, size_t __n)
      {
 if (__n == 0)
   return __s1;
 return static_cast<char_type*>(__builtin_memcpy(__s1, __s2, __n));
      }

      static char_type*
      assign(char_type* __s, size_t __n, char_type __a)
      {
 if (__n == 0)
   return __s;
 return static_cast<char_type*>(__builtin_memset(__s, __a, __n));
      }

      static char_type
      to_char_type(const int_type& __c)
      { return static_cast<char_type>(__c); }



      static int_type
      to_int_type(const char_type& __c)
      { return static_cast<int_type>(static_cast<unsigned char>(__c)); }

      static bool
      eq_int_type(const int_type& __c1, const int_type& __c2)
      { return __c1 == __c2; }

      static int_type
      eof()
      { return static_cast<int_type>(-1); }

      static int_type
      not_eof(const int_type& __c)
      { return (__c == eof()) ? 0 : __c; }
  };




  template<>
    struct char_traits<wchar_t>
    {
      typedef wchar_t char_type;
      typedef wint_t int_type;
      typedef streamoff off_type;
      typedef wstreampos pos_type;
      typedef mbstate_t state_type;

      static void
      assign(char_type& __c1, const char_type& __c2)
      { __c1 = __c2; }

      static bool
      eq(const char_type& __c1, const char_type& __c2)
      { return __c1 == __c2; }

      static bool
      lt(const char_type& __c1, const char_type& __c2)
      { return __c1 < __c2; }

      static int
      compare(const char_type* __s1, const char_type* __s2, size_t __n)
      {
 if (__n == 0)
   return 0;
 return wmemcmp(__s1, __s2, __n);
      }

      static size_t
      length(const char_type* __s)
      { return wcslen(__s); }

      static const char_type*
      find(const char_type* __s, size_t __n, const char_type& __a)
      {
 if (__n == 0)
   return 0;
 return wmemchr(__s, __a, __n);
      }

      static char_type*
      move(char_type* __s1, const char_type* __s2, size_t __n)
      {
 if (__n == 0)
   return __s1;
 return wmemmove(__s1, __s2, __n);
      }

      static char_type*
      copy(char_type* __s1, const char_type* __s2, size_t __n)
      {
 if (__n == 0)
   return __s1;
 return wmemcpy(__s1, __s2, __n);
      }

      static char_type*
      assign(char_type* __s, size_t __n, char_type __a)
      {
 if (__n == 0)
   return __s;
 return wmemset(__s, __a, __n);
      }

      static char_type
      to_char_type(const int_type& __c)
      { return char_type(__c); }

      static int_type
      to_int_type(const char_type& __c)
      { return int_type(__c); }

      static bool
      eq_int_type(const int_type& __c1, const int_type& __c2)
      { return __c1 == __c2; }

      static int_type
      eof()
      { return static_cast<int_type>((0xffffffffu)); }

      static int_type
      not_eof(const int_type& __c)
      { return eq_int_type(__c, eof()) ? 0 : __c; }
  };



}
# 41 "/usr/include/c++/5/string" 2 3
# 1 "/usr/include/c++/5/bits/allocator.h" 1 3
# 46 "/usr/include/c++/5/bits/allocator.h" 3
# 1 "/usr/include/x86_64-linux-gnu/c++/5/bits/c++allocator.h" 1 3
# 33 "/usr/include/x86_64-linux-gnu/c++/5/bits/c++allocator.h" 3
# 1 "/usr/include/c++/5/ext/new_allocator.h" 1 3
# 33 "/usr/include/c++/5/ext/new_allocator.h" 3
# 1 "/usr/include/c++/5/new" 1 3
# 37 "/usr/include/c++/5/new" 3
       
# 38 "/usr/include/c++/5/new" 3


# 1 "/usr/include/c++/5/exception" 1 3
# 33 "/usr/include/c++/5/exception" 3
       
# 34 "/usr/include/c++/5/exception" 3

#pragma GCC visibility push(default)


# 1 "/usr/include/c++/5/bits/atomic_lockfree_defines.h" 1 3
# 33 "/usr/include/c++/5/bits/atomic_lockfree_defines.h" 3
       
# 34 "/usr/include/c++/5/bits/atomic_lockfree_defines.h" 3
# 39 "/usr/include/c++/5/exception" 2 3

extern "C++" {

namespace std
{
# 60 "/usr/include/c++/5/exception" 3
  class exception
  {
  public:
    exception() throw() { }
    virtual ~exception() throw();



    virtual const char* what() const throw();
  };



  class bad_exception : public exception
  {
  public:
    bad_exception() throw() { }



    virtual ~bad_exception() throw();


    virtual const char* what() const throw();
  };


  typedef void (*terminate_handler) ();


  typedef void (*unexpected_handler) ();


  terminate_handler set_terminate(terminate_handler) throw();
# 102 "/usr/include/c++/5/exception" 3
  void terminate() throw() __attribute__ ((__noreturn__));


  unexpected_handler set_unexpected(unexpected_handler) throw();
# 114 "/usr/include/c++/5/exception" 3
  void unexpected() __attribute__ ((__noreturn__));
# 127 "/usr/include/c++/5/exception" 3
  bool uncaught_exception() throw() __attribute__ ((__pure__));


}

namespace __gnu_cxx
{

# 152 "/usr/include/c++/5/exception" 3
  void __verbose_terminate_handler();


}

}

#pragma GCC visibility pop
# 41 "/usr/include/c++/5/new" 2 3

#pragma GCC visibility push(default)

extern "C++" {

namespace std
{






  class bad_alloc : public exception
  {
  public:
    bad_alloc() throw() { }



    virtual ~bad_alloc() throw();


    virtual const char* what() const throw();
  };
# 82 "/usr/include/c++/5/new" 3
  struct nothrow_t { };

  extern const nothrow_t nothrow;



  typedef void (*new_handler)();



  new_handler set_new_handler(new_handler) throw();





}
# 111 "/usr/include/c++/5/new" 3
void* operator new(std::size_t) throw(std::bad_alloc)
  __attribute__((__externally_visible__));
void* operator new[](std::size_t) throw(std::bad_alloc)
  __attribute__((__externally_visible__));
void operator delete(void*) throw()
  __attribute__((__externally_visible__));
void operator delete[](void*) throw()
  __attribute__((__externally_visible__));
void* operator new(std::size_t, const std::nothrow_t&) throw()
  __attribute__((__externally_visible__));
void* operator new[](std::size_t, const std::nothrow_t&) throw()
  __attribute__((__externally_visible__));
void operator delete(void*, const std::nothrow_t&) throw()
  __attribute__((__externally_visible__));
void operator delete[](void*, const std::nothrow_t&) throw()
  __attribute__((__externally_visible__));


inline void* operator new(std::size_t, void* __p) throw()
{ return __p; }
inline void* operator new[](std::size_t, void* __p) throw()
{ return __p; }


inline void operator delete (void*, void*) throw() { }
inline void operator delete[](void*, void*) throw() { }

}

#pragma GCC visibility pop
# 34 "/usr/include/c++/5/ext/new_allocator.h" 2 3






namespace __gnu_cxx __attribute__ ((__visibility__ ("default")))
{


  using std::size_t;
  using std::ptrdiff_t;
# 57 "/usr/include/c++/5/ext/new_allocator.h" 3
  template<typename _Tp>
    class new_allocator
    {
    public:
      typedef size_t size_type;
      typedef ptrdiff_t difference_type;
      typedef _Tp* pointer;
      typedef const _Tp* const_pointer;
      typedef _Tp& reference;
      typedef const _Tp& const_reference;
      typedef _Tp value_type;

      template<typename _Tp1>
        struct rebind
        { typedef new_allocator<_Tp1> other; };







      new_allocator() throw() { }

      new_allocator(const new_allocator&) throw() { }

      template<typename _Tp1>
        new_allocator(const new_allocator<_Tp1>&) throw() { }

      ~new_allocator() throw() { }

      pointer
      address(reference __x) const
      { return std::__addressof(__x); }

      const_pointer
      address(const_reference __x) const
      { return std::__addressof(__x); }



      pointer
      allocate(size_type __n, const void* = 0)
      {
 if (__n > this->max_size())
   std::__throw_bad_alloc();

 return static_cast<_Tp*>(::operator new(__n * sizeof(_Tp)));
      }


      void
      deallocate(pointer __p, size_type)
      { ::operator delete(__p); }

      size_type
      max_size() const throw()
      { return size_t(-1) / sizeof(_Tp); }
# 128 "/usr/include/c++/5/ext/new_allocator.h" 3
      void
      construct(pointer __p, const _Tp& __val)
      { ::new((void *)__p) _Tp(__val); }

      void
      destroy(pointer __p) { __p->~_Tp(); }

    };

  template<typename _Tp>
    inline bool
    operator==(const new_allocator<_Tp>&, const new_allocator<_Tp>&)
    { return true; }

  template<typename _Tp>
    inline bool
    operator!=(const new_allocator<_Tp>&, const new_allocator<_Tp>&)
    { return false; }


}
# 34 "/usr/include/x86_64-linux-gnu/c++/5/bits/c++allocator.h" 2 3
# 47 "/usr/include/c++/5/bits/allocator.h" 2 3





namespace std __attribute__ ((__visibility__ ("default")))
{








  template<>
    class allocator<void>
    {
    public:
      typedef size_t size_type;
      typedef ptrdiff_t difference_type;
      typedef void* pointer;
      typedef const void* const_pointer;
      typedef void value_type;

      template<typename _Tp1>
        struct rebind
        { typedef allocator<_Tp1> other; };






    };
# 91 "/usr/include/c++/5/bits/allocator.h" 3
  template<typename _Tp>
    class allocator: public __gnu_cxx::new_allocator<_Tp>
    {
   public:
      typedef size_t size_type;
      typedef ptrdiff_t difference_type;
      typedef _Tp* pointer;
      typedef const _Tp* const_pointer;
      typedef _Tp& reference;
      typedef const _Tp& const_reference;
      typedef _Tp value_type;

      template<typename _Tp1>
        struct rebind
        { typedef allocator<_Tp1> other; };







      allocator() throw() { }

      allocator(const allocator& __a) throw()
      : __gnu_cxx::new_allocator<_Tp>(__a) { }

      template<typename _Tp1>
        allocator(const allocator<_Tp1>&) throw() { }

      ~allocator() throw() { }


    };

  template<typename _T1, typename _T2>
    inline bool
    operator==(const allocator<_T1>&, const allocator<_T2>&)
    throw()
    { return true; }

  template<typename _Tp>
    inline bool
    operator==(const allocator<_Tp>&, const allocator<_Tp>&)
    throw()
    { return true; }

  template<typename _T1, typename _T2>
    inline bool
    operator!=(const allocator<_T1>&, const allocator<_T2>&)
    throw()
    { return false; }

  template<typename _Tp>
    inline bool
    operator!=(const allocator<_Tp>&, const allocator<_Tp>&)
    throw()
    { return false; }






  extern template class allocator<char>;
  extern template class allocator<wchar_t>;






  template<typename _Alloc, bool = __is_empty(_Alloc)>
    struct __alloc_swap
    { static void _S_do_it(_Alloc&, _Alloc&) { } };

  template<typename _Alloc>
    struct __alloc_swap<_Alloc, false>
    {
      static void
      _S_do_it(_Alloc& __one, _Alloc& __two)
      {

 if (__one != __two)
   swap(__one, __two);
      }
    };


  template<typename _Alloc, bool = __is_empty(_Alloc)>
    struct __alloc_neq
    {
      static bool
      _S_do_it(const _Alloc&, const _Alloc&)
      { return false; }
    };

  template<typename _Alloc>
    struct __alloc_neq<_Alloc, false>
    {
      static bool
      _S_do_it(const _Alloc& __one, const _Alloc& __two)
      { return __one != __two; }
    };
# 226 "/usr/include/c++/5/bits/allocator.h" 3

}
# 42 "/usr/include/c++/5/string" 2 3

# 1 "/usr/include/c++/5/bits/localefwd.h" 1 3
# 37 "/usr/include/c++/5/bits/localefwd.h" 3
       
# 38 "/usr/include/c++/5/bits/localefwd.h" 3


# 1 "/usr/include/x86_64-linux-gnu/c++/5/bits/c++locale.h" 1 3
# 39 "/usr/include/x86_64-linux-gnu/c++/5/bits/c++locale.h" 3
       
# 40 "/usr/include/x86_64-linux-gnu/c++/5/bits/c++locale.h" 3

# 1 "/usr/include/c++/5/clocale" 1 3
# 39 "/usr/include/c++/5/clocale" 3
       
# 40 "/usr/include/c++/5/clocale" 3


# 1 "/usr/include/locale.h" 1 3 4
# 28 "/usr/include/locale.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 1 3 4
# 29 "/usr/include/locale.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/locale.h" 1 3 4
# 30 "/usr/include/locale.h" 2 3 4

extern "C" {
# 50 "/usr/include/locale.h" 3 4



struct lconv
{


  char *decimal_point;
  char *thousands_sep;





  char *grouping;





  char *int_curr_symbol;
  char *currency_symbol;
  char *mon_decimal_point;
  char *mon_thousands_sep;
  char *mon_grouping;
  char *positive_sign;
  char *negative_sign;
  char int_frac_digits;
  char frac_digits;

  char p_cs_precedes;

  char p_sep_by_space;

  char n_cs_precedes;

  char n_sep_by_space;






  char p_sign_posn;
  char n_sign_posn;


  char int_p_cs_precedes;

  char int_p_sep_by_space;

  char int_n_cs_precedes;

  char int_n_sep_by_space;






  char int_p_sign_posn;
  char int_n_sign_posn;
# 120 "/usr/include/locale.h" 3 4
};



extern char *setlocale (int __category, const char *__locale) throw ();


extern struct lconv *localeconv (void) throw ();


# 151 "/usr/include/locale.h" 3 4
extern __locale_t newlocale (int __category_mask, const char *__locale,
        __locale_t __base) throw ();
# 186 "/usr/include/locale.h" 3 4
extern __locale_t duplocale (__locale_t __dataset) throw ();



extern void freelocale (__locale_t __dataset) throw ();






extern __locale_t uselocale (__locale_t __dataset) throw ();







}
# 43 "/usr/include/c++/5/clocale" 2 3
# 51 "/usr/include/c++/5/clocale" 3
namespace std
{
  using ::lconv;
  using ::setlocale;
  using ::localeconv;
}
# 42 "/usr/include/x86_64-linux-gnu/c++/5/bits/c++locale.h" 2 3






namespace __gnu_cxx __attribute__ ((__visibility__ ("default")))
{


  extern "C" __typeof(uselocale) __uselocale;


}


namespace std __attribute__ ((__visibility__ ("default")))
{


  typedef __locale_t __c_locale;





  inline int
  __convert_from_v(const __c_locale& __cloc __attribute__ ((__unused__)),
     char* __out,
     const int __size __attribute__ ((__unused__)),
     const char* __fmt, ...)
  {

    __c_locale __old = __gnu_cxx::__uselocale(__cloc);
# 88 "/usr/include/x86_64-linux-gnu/c++/5/bits/c++locale.h" 3
    __builtin_va_list __args;
    __builtin_va_start(__args, __fmt);


    const int __ret = __builtin_vsnprintf(__out, __size, __fmt, __args);




    __builtin_va_end(__args);


    __gnu_cxx::__uselocale(__old);







    return __ret;
  }


}
# 41 "/usr/include/c++/5/bits/localefwd.h" 2 3
# 1 "/usr/include/c++/5/iosfwd" 1 3
# 36 "/usr/include/c++/5/iosfwd" 3
       
# 37 "/usr/include/c++/5/iosfwd" 3





namespace std __attribute__ ((__visibility__ ("default")))
{

# 74 "/usr/include/c++/5/iosfwd" 3
  class ios_base;

  template<typename _CharT, typename _Traits = char_traits<_CharT> >
    class basic_ios;

  template<typename _CharT, typename _Traits = char_traits<_CharT> >
    class basic_streambuf;

  template<typename _CharT, typename _Traits = char_traits<_CharT> >
    class basic_istream;

  template<typename _CharT, typename _Traits = char_traits<_CharT> >
    class basic_ostream;

  template<typename _CharT, typename _Traits = char_traits<_CharT> >
    class basic_iostream;


namespace __cxx11 {

  template<typename _CharT, typename _Traits = char_traits<_CharT>,
     typename _Alloc = allocator<_CharT> >
    class basic_stringbuf;

  template<typename _CharT, typename _Traits = char_traits<_CharT>,
    typename _Alloc = allocator<_CharT> >
    class basic_istringstream;

  template<typename _CharT, typename _Traits = char_traits<_CharT>,
    typename _Alloc = allocator<_CharT> >
    class basic_ostringstream;

  template<typename _CharT, typename _Traits = char_traits<_CharT>,
    typename _Alloc = allocator<_CharT> >
    class basic_stringstream;

}

  template<typename _CharT, typename _Traits = char_traits<_CharT> >
    class basic_filebuf;

  template<typename _CharT, typename _Traits = char_traits<_CharT> >
    class basic_ifstream;

  template<typename _CharT, typename _Traits = char_traits<_CharT> >
    class basic_ofstream;

  template<typename _CharT, typename _Traits = char_traits<_CharT> >
    class basic_fstream;

  template<typename _CharT, typename _Traits = char_traits<_CharT> >
    class istreambuf_iterator;

  template<typename _CharT, typename _Traits = char_traits<_CharT> >
    class ostreambuf_iterator;



  typedef basic_ios<char> ios;


  typedef basic_streambuf<char> streambuf;


  typedef basic_istream<char> istream;


  typedef basic_ostream<char> ostream;


  typedef basic_iostream<char> iostream;


  typedef basic_stringbuf<char> stringbuf;


  typedef basic_istringstream<char> istringstream;


  typedef basic_ostringstream<char> ostringstream;


  typedef basic_stringstream<char> stringstream;


  typedef basic_filebuf<char> filebuf;


  typedef basic_ifstream<char> ifstream;


  typedef basic_ofstream<char> ofstream;


  typedef basic_fstream<char> fstream;



  typedef basic_ios<wchar_t> wios;


  typedef basic_streambuf<wchar_t> wstreambuf;


  typedef basic_istream<wchar_t> wistream;


  typedef basic_ostream<wchar_t> wostream;


  typedef basic_iostream<wchar_t> wiostream;


  typedef basic_stringbuf<wchar_t> wstringbuf;


  typedef basic_istringstream<wchar_t> wistringstream;


  typedef basic_ostringstream<wchar_t> wostringstream;


  typedef basic_stringstream<wchar_t> wstringstream;


  typedef basic_filebuf<wchar_t> wfilebuf;


  typedef basic_ifstream<wchar_t> wifstream;


  typedef basic_ofstream<wchar_t> wofstream;


  typedef basic_fstream<wchar_t> wfstream;




}
# 42 "/usr/include/c++/5/bits/localefwd.h" 2 3
# 1 "/usr/include/c++/5/cctype" 1 3
# 39 "/usr/include/c++/5/cctype" 3
       
# 40 "/usr/include/c++/5/cctype" 3


# 1 "/usr/include/ctype.h" 1 3 4
# 28 "/usr/include/ctype.h" 3 4
extern "C" {
# 46 "/usr/include/ctype.h" 3 4
enum
{
  _ISupper = ((0) < 8 ? ((1 << (0)) << 8) : ((1 << (0)) >> 8)),
  _ISlower = ((1) < 8 ? ((1 << (1)) << 8) : ((1 << (1)) >> 8)),
  _ISalpha = ((2) < 8 ? ((1 << (2)) << 8) : ((1 << (2)) >> 8)),
  _ISdigit = ((3) < 8 ? ((1 << (3)) << 8) : ((1 << (3)) >> 8)),
  _ISxdigit = ((4) < 8 ? ((1 << (4)) << 8) : ((1 << (4)) >> 8)),
  _ISspace = ((5) < 8 ? ((1 << (5)) << 8) : ((1 << (5)) >> 8)),
  _ISprint = ((6) < 8 ? ((1 << (6)) << 8) : ((1 << (6)) >> 8)),
  _ISgraph = ((7) < 8 ? ((1 << (7)) << 8) : ((1 << (7)) >> 8)),
  _ISblank = ((8) < 8 ? ((1 << (8)) << 8) : ((1 << (8)) >> 8)),
  _IScntrl = ((9) < 8 ? ((1 << (9)) << 8) : ((1 << (9)) >> 8)),
  _ISpunct = ((10) < 8 ? ((1 << (10)) << 8) : ((1 << (10)) >> 8)),
  _ISalnum = ((11) < 8 ? ((1 << (11)) << 8) : ((1 << (11)) >> 8))
};
# 79 "/usr/include/ctype.h" 3 4
extern const unsigned short int **__ctype_b_loc (void)
     throw () __attribute__ ((__const__));
extern const __int32_t **__ctype_tolower_loc (void)
     throw () __attribute__ ((__const__));
extern const __int32_t **__ctype_toupper_loc (void)
     throw () __attribute__ ((__const__));
# 104 "/usr/include/ctype.h" 3 4






extern int isalnum (int) throw ();
extern int isalpha (int) throw ();
extern int iscntrl (int) throw ();
extern int isdigit (int) throw ();
extern int islower (int) throw ();
extern int isgraph (int) throw ();
extern int isprint (int) throw ();
extern int ispunct (int) throw ();
extern int isspace (int) throw ();
extern int isupper (int) throw ();
extern int isxdigit (int) throw ();



extern int tolower (int __c) throw ();


extern int toupper (int __c) throw ();








extern int isblank (int) throw ();






extern int isctype (int __c, int __mask) throw ();






extern int isascii (int __c) throw ();



extern int toascii (int __c) throw ();



extern int _toupper (int) throw ();
extern int _tolower (int) throw ();
# 271 "/usr/include/ctype.h" 3 4
extern int isalnum_l (int, __locale_t) throw ();
extern int isalpha_l (int, __locale_t) throw ();
extern int iscntrl_l (int, __locale_t) throw ();
extern int isdigit_l (int, __locale_t) throw ();
extern int islower_l (int, __locale_t) throw ();
extern int isgraph_l (int, __locale_t) throw ();
extern int isprint_l (int, __locale_t) throw ();
extern int ispunct_l (int, __locale_t) throw ();
extern int isspace_l (int, __locale_t) throw ();
extern int isupper_l (int, __locale_t) throw ();
extern int isxdigit_l (int, __locale_t) throw ();

extern int isblank_l (int, __locale_t) throw ();



extern int __tolower_l (int __c, __locale_t __l) throw ();
extern int tolower_l (int __c, __locale_t __l) throw ();


extern int __toupper_l (int __c, __locale_t __l) throw ();
extern int toupper_l (int __c, __locale_t __l) throw ();
# 347 "/usr/include/ctype.h" 3 4
}
# 43 "/usr/include/c++/5/cctype" 2 3
# 62 "/usr/include/c++/5/cctype" 3
namespace std
{
  using ::isalnum;
  using ::isalpha;
  using ::iscntrl;
  using ::isdigit;
  using ::isgraph;
  using ::islower;
  using ::isprint;
  using ::ispunct;
  using ::isspace;
  using ::isupper;
  using ::isxdigit;
  using ::tolower;
  using ::toupper;
}
# 43 "/usr/include/c++/5/bits/localefwd.h" 2 3

namespace std __attribute__ ((__visibility__ ("default")))
{

# 55 "/usr/include/c++/5/bits/localefwd.h" 3
  class locale;

  template<typename _Facet>
    bool
    has_facet(const locale&) throw();

  template<typename _Facet>
    const _Facet&
    use_facet(const locale&);


  template<typename _CharT>
    bool
    isspace(_CharT, const locale&);

  template<typename _CharT>
    bool
    isprint(_CharT, const locale&);

  template<typename _CharT>
    bool
    iscntrl(_CharT, const locale&);

  template<typename _CharT>
    bool
    isupper(_CharT, const locale&);

  template<typename _CharT>
    bool
    islower(_CharT, const locale&);

  template<typename _CharT>
    bool
    isalpha(_CharT, const locale&);

  template<typename _CharT>
    bool
    isdigit(_CharT, const locale&);

  template<typename _CharT>
    bool
    ispunct(_CharT, const locale&);

  template<typename _CharT>
    bool
    isxdigit(_CharT, const locale&);

  template<typename _CharT>
    bool
    isalnum(_CharT, const locale&);

  template<typename _CharT>
    bool
    isgraph(_CharT, const locale&);







  template<typename _CharT>
    _CharT
    toupper(_CharT, const locale&);

  template<typename _CharT>
    _CharT
    tolower(_CharT, const locale&);


  class ctype_base;
  template<typename _CharT>
    class ctype;
  template<> class ctype<char>;

  template<> class ctype<wchar_t>;

  template<typename _CharT>
    class ctype_byname;


  class codecvt_base;
  template<typename _InternT, typename _ExternT, typename _StateT>
    class codecvt;
  template<> class codecvt<char, char, mbstate_t>;

  template<> class codecvt<wchar_t, char, mbstate_t>;

  template<typename _InternT, typename _ExternT, typename _StateT>
    class codecvt_byname;



  template<typename _CharT, typename _InIter = istreambuf_iterator<_CharT> >
    class num_get;
  template<typename _CharT, typename _OutIter = ostreambuf_iterator<_CharT> >
    class num_put;

namespace __cxx11 {
  template<typename _CharT> class numpunct;
  template<typename _CharT> class numpunct_byname;
}

namespace __cxx11 {

  template<typename _CharT>
    class collate;
  template<typename _CharT>
    class collate_byname;
}


  class time_base;
namespace __cxx11 {
  template<typename _CharT, typename _InIter = istreambuf_iterator<_CharT> >
    class time_get;
  template<typename _CharT, typename _InIter = istreambuf_iterator<_CharT> >
    class time_get_byname;
}
  template<typename _CharT, typename _OutIter = ostreambuf_iterator<_CharT> >
    class time_put;
  template<typename _CharT, typename _OutIter = ostreambuf_iterator<_CharT> >
    class time_put_byname;


  class money_base;
namespace __cxx11 {
  template<typename _CharT, typename _InIter = istreambuf_iterator<_CharT> >
    class money_get;
  template<typename _CharT, typename _OutIter = ostreambuf_iterator<_CharT> >
    class money_put;
}
namespace __cxx11 {
  template<typename _CharT, bool _Intl = false>
    class moneypunct;
  template<typename _CharT, bool _Intl = false>
    class moneypunct_byname;
}


  class messages_base;
namespace __cxx11 {
  template<typename _CharT>
    class messages;
  template<typename _CharT>
    class messages_byname;
}


}
# 44 "/usr/include/c++/5/string" 2 3
# 1 "/usr/include/c++/5/bits/ostream_insert.h" 1 3
# 33 "/usr/include/c++/5/bits/ostream_insert.h" 3
       
# 34 "/usr/include/c++/5/bits/ostream_insert.h" 3


# 1 "/usr/include/c++/5/bits/cxxabi_forced.h" 1 3
# 34 "/usr/include/c++/5/bits/cxxabi_forced.h" 3
       
# 35 "/usr/include/c++/5/bits/cxxabi_forced.h" 3

#pragma GCC visibility push(default)


namespace __cxxabiv1
{







  class __forced_unwind
  {
    virtual ~__forced_unwind() throw();


    virtual void __pure_dummy() = 0;
  };
}


#pragma GCC visibility pop
# 37 "/usr/include/c++/5/bits/ostream_insert.h" 2 3

namespace std __attribute__ ((__visibility__ ("default")))
{


  template<typename _CharT, typename _Traits>
    inline void
    __ostream_write(basic_ostream<_CharT, _Traits>& __out,
      const _CharT* __s, streamsize __n)
    {
      typedef basic_ostream<_CharT, _Traits> __ostream_type;
      typedef typename __ostream_type::ios_base __ios_base;

      const streamsize __put = __out.rdbuf()->sputn(__s, __n);
      if (__put != __n)
 __out.setstate(__ios_base::badbit);
    }

  template<typename _CharT, typename _Traits>
    inline void
    __ostream_fill(basic_ostream<_CharT, _Traits>& __out, streamsize __n)
    {
      typedef basic_ostream<_CharT, _Traits> __ostream_type;
      typedef typename __ostream_type::ios_base __ios_base;

      const _CharT __c = __out.fill();
      for (; __n > 0; --__n)
 {
   const typename _Traits::int_type __put = __out.rdbuf()->sputc(__c);
   if (_Traits::eq_int_type(__put, _Traits::eof()))
     {
       __out.setstate(__ios_base::badbit);
       break;
     }
 }
    }

  template<typename _CharT, typename _Traits>
    basic_ostream<_CharT, _Traits>&
    __ostream_insert(basic_ostream<_CharT, _Traits>& __out,
       const _CharT* __s, streamsize __n)
    {
      typedef basic_ostream<_CharT, _Traits> __ostream_type;
      typedef typename __ostream_type::ios_base __ios_base;

      typename __ostream_type::sentry __cerb(__out);
      if (__cerb)
 {
   try
     {
       const streamsize __w = __out.width();
       if (__w > __n)
  {
    const bool __left = ((__out.flags()
     & __ios_base::adjustfield)
           == __ios_base::left);
    if (!__left)
      __ostream_fill(__out, __w - __n);
    if (__out.good())
      __ostream_write(__out, __s, __n);
    if (__left && __out.good())
      __ostream_fill(__out, __w - __n);
  }
       else
  __ostream_write(__out, __s, __n);
       __out.width(0);
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       __out._M_setstate(__ios_base::badbit);
       throw;
     }
   catch(...)
     { __out._M_setstate(__ios_base::badbit); }
 }
      return __out;
    }




  extern template ostream& __ostream_insert(ostream&, const char*, streamsize);


  extern template wostream& __ostream_insert(wostream&, const wchar_t*,
          streamsize);




}
# 45 "/usr/include/c++/5/string" 2 3



# 1 "/usr/include/c++/5/bits/stl_function.h" 1 3
# 63 "/usr/include/c++/5/bits/stl_function.h" 3
namespace std __attribute__ ((__visibility__ ("default")))
{

# 104 "/usr/include/c++/5/bits/stl_function.h" 3
  template<typename _Arg, typename _Result>
    struct unary_function
    {

      typedef _Arg argument_type;


      typedef _Result result_type;
    };




  template<typename _Arg1, typename _Arg2, typename _Result>
    struct binary_function
    {

      typedef _Arg1 first_argument_type;


      typedef _Arg2 second_argument_type;


      typedef _Result result_type;
    };
# 166 "/usr/include/c++/5/bits/stl_function.h" 3
  template<typename _Tp>
    struct plus : public binary_function<_Tp, _Tp, _Tp>
    {
     
      _Tp
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x + __y; }
    };


  template<typename _Tp>
    struct minus : public binary_function<_Tp, _Tp, _Tp>
    {
     
      _Tp
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x - __y; }
    };


  template<typename _Tp>
    struct multiplies : public binary_function<_Tp, _Tp, _Tp>
    {
     
      _Tp
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x * __y; }
    };


  template<typename _Tp>
    struct divides : public binary_function<_Tp, _Tp, _Tp>
    {
     
      _Tp
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x / __y; }
    };


  template<typename _Tp>
    struct modulus : public binary_function<_Tp, _Tp, _Tp>
    {
     
      _Tp
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x % __y; }
    };


  template<typename _Tp>
    struct negate : public unary_function<_Tp, _Tp>
    {
     
      _Tp
      operator()(const _Tp& __x) const
      { return -__x; }
    };
# 351 "/usr/include/c++/5/bits/stl_function.h" 3
  template<typename _Tp>
    struct equal_to : public binary_function<_Tp, _Tp, bool>
    {
     
      bool
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x == __y; }
    };


  template<typename _Tp>
    struct not_equal_to : public binary_function<_Tp, _Tp, bool>
    {
     
      bool
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x != __y; }
    };


  template<typename _Tp>
    struct greater : public binary_function<_Tp, _Tp, bool>
    {
     
      bool
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x > __y; }
    };


  template<typename _Tp>
    struct less : public binary_function<_Tp, _Tp, bool>
    {
     
      bool
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x < __y; }
    };


  template<typename _Tp>
    struct greater_equal : public binary_function<_Tp, _Tp, bool>
    {
     
      bool
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x >= __y; }
    };


  template<typename _Tp>
    struct less_equal : public binary_function<_Tp, _Tp, bool>
    {
     
      bool
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x <= __y; }
    };
# 524 "/usr/include/c++/5/bits/stl_function.h" 3
  template<typename _Tp>
    struct logical_and : public binary_function<_Tp, _Tp, bool>
    {
     
      bool
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x && __y; }
    };


  template<typename _Tp>
    struct logical_or : public binary_function<_Tp, _Tp, bool>
    {
     
      bool
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x || __y; }
    };


  template<typename _Tp>
    struct logical_not : public unary_function<_Tp, bool>
    {
     
      bool
      operator()(const _Tp& __x) const
      { return !__x; }
    };
# 617 "/usr/include/c++/5/bits/stl_function.h" 3
  template<typename _Tp>
    struct bit_and : public binary_function<_Tp, _Tp, _Tp>
    {
     
      _Tp
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x & __y; }
    };

  template<typename _Tp>
    struct bit_or : public binary_function<_Tp, _Tp, _Tp>
    {
     
      _Tp
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x | __y; }
    };

  template<typename _Tp>
    struct bit_xor : public binary_function<_Tp, _Tp, _Tp>
    {
     
      _Tp
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x ^ __y; }
    };

  template<typename _Tp>
    struct bit_not : public unary_function<_Tp, _Tp>
    {
   
      _Tp
      operator()(const _Tp& __x) const
      { return ~__x; }
    };
# 741 "/usr/include/c++/5/bits/stl_function.h" 3
  template<typename _Predicate>
    class unary_negate
    : public unary_function<typename _Predicate::argument_type, bool>
    {
    protected:
      _Predicate _M_pred;

    public:
     
      explicit
      unary_negate(const _Predicate& __x) : _M_pred(__x) { }

     
      bool
      operator()(const typename _Predicate::argument_type& __x) const
      { return !_M_pred(__x); }
    };


  template<typename _Predicate>
   
    inline unary_negate<_Predicate>
    not1(const _Predicate& __pred)
    { return unary_negate<_Predicate>(__pred); }


  template<typename _Predicate>
    class binary_negate
    : public binary_function<typename _Predicate::first_argument_type,
        typename _Predicate::second_argument_type, bool>
    {
    protected:
      _Predicate _M_pred;

    public:
     
      explicit
      binary_negate(const _Predicate& __x) : _M_pred(__x) { }

     
      bool
      operator()(const typename _Predicate::first_argument_type& __x,
   const typename _Predicate::second_argument_type& __y) const
      { return !_M_pred(__x, __y); }
    };


  template<typename _Predicate>
   
    inline binary_negate<_Predicate>
    not2(const _Predicate& __pred)
    { return binary_negate<_Predicate>(__pred); }
# 818 "/usr/include/c++/5/bits/stl_function.h" 3
  template<typename _Arg, typename _Result>
    class pointer_to_unary_function : public unary_function<_Arg, _Result>
    {
    protected:
      _Result (*_M_ptr)(_Arg);

    public:
      pointer_to_unary_function() { }

      explicit
      pointer_to_unary_function(_Result (*__x)(_Arg))
      : _M_ptr(__x) { }

      _Result
      operator()(_Arg __x) const
      { return _M_ptr(__x); }
    };


  template<typename _Arg, typename _Result>
    inline pointer_to_unary_function<_Arg, _Result>
    ptr_fun(_Result (*__x)(_Arg))
    { return pointer_to_unary_function<_Arg, _Result>(__x); }


  template<typename _Arg1, typename _Arg2, typename _Result>
    class pointer_to_binary_function
    : public binary_function<_Arg1, _Arg2, _Result>
    {
    protected:
      _Result (*_M_ptr)(_Arg1, _Arg2);

    public:
      pointer_to_binary_function() { }

      explicit
      pointer_to_binary_function(_Result (*__x)(_Arg1, _Arg2))
      : _M_ptr(__x) { }

      _Result
      operator()(_Arg1 __x, _Arg2 __y) const
      { return _M_ptr(__x, __y); }
    };


  template<typename _Arg1, typename _Arg2, typename _Result>
    inline pointer_to_binary_function<_Arg1, _Arg2, _Result>
    ptr_fun(_Result (*__x)(_Arg1, _Arg2))
    { return pointer_to_binary_function<_Arg1, _Arg2, _Result>(__x); }


  template<typename _Tp>
    struct _Identity
    : public unary_function<_Tp,_Tp>
    {
      _Tp&
      operator()(_Tp& __x) const
      { return __x; }

      const _Tp&
      operator()(const _Tp& __x) const
      { return __x; }
    };

  template<typename _Pair>
    struct _Select1st
    : public unary_function<_Pair, typename _Pair::first_type>
    {
      typename _Pair::first_type&
      operator()(_Pair& __x) const
      { return __x.first; }

      const typename _Pair::first_type&
      operator()(const _Pair& __x) const
      { return __x.first; }
# 905 "/usr/include/c++/5/bits/stl_function.h" 3
    };

  template<typename _Pair>
    struct _Select2nd
    : public unary_function<_Pair, typename _Pair::second_type>
    {
      typename _Pair::second_type&
      operator()(_Pair& __x) const
      { return __x.second; }

      const typename _Pair::second_type&
      operator()(const _Pair& __x) const
      { return __x.second; }
    };
# 938 "/usr/include/c++/5/bits/stl_function.h" 3
  template<typename _Ret, typename _Tp>
    class mem_fun_t : public unary_function<_Tp*, _Ret>
    {
    public:
      explicit
      mem_fun_t(_Ret (_Tp::*__pf)())
      : _M_f(__pf) { }

      _Ret
      operator()(_Tp* __p) const
      { return (__p->*_M_f)(); }

    private:
      _Ret (_Tp::*_M_f)();
    };



  template<typename _Ret, typename _Tp>
    class const_mem_fun_t : public unary_function<const _Tp*, _Ret>
    {
    public:
      explicit
      const_mem_fun_t(_Ret (_Tp::*__pf)() const)
      : _M_f(__pf) { }

      _Ret
      operator()(const _Tp* __p) const
      { return (__p->*_M_f)(); }

    private:
      _Ret (_Tp::*_M_f)() const;
    };



  template<typename _Ret, typename _Tp>
    class mem_fun_ref_t : public unary_function<_Tp, _Ret>
    {
    public:
      explicit
      mem_fun_ref_t(_Ret (_Tp::*__pf)())
      : _M_f(__pf) { }

      _Ret
      operator()(_Tp& __r) const
      { return (__r.*_M_f)(); }

    private:
      _Ret (_Tp::*_M_f)();
  };



  template<typename _Ret, typename _Tp>
    class const_mem_fun_ref_t : public unary_function<_Tp, _Ret>
    {
    public:
      explicit
      const_mem_fun_ref_t(_Ret (_Tp::*__pf)() const)
      : _M_f(__pf) { }

      _Ret
      operator()(const _Tp& __r) const
      { return (__r.*_M_f)(); }

    private:
      _Ret (_Tp::*_M_f)() const;
    };



  template<typename _Ret, typename _Tp, typename _Arg>
    class mem_fun1_t : public binary_function<_Tp*, _Arg, _Ret>
    {
    public:
      explicit
      mem_fun1_t(_Ret (_Tp::*__pf)(_Arg))
      : _M_f(__pf) { }

      _Ret
      operator()(_Tp* __p, _Arg __x) const
      { return (__p->*_M_f)(__x); }

    private:
      _Ret (_Tp::*_M_f)(_Arg);
    };



  template<typename _Ret, typename _Tp, typename _Arg>
    class const_mem_fun1_t : public binary_function<const _Tp*, _Arg, _Ret>
    {
    public:
      explicit
      const_mem_fun1_t(_Ret (_Tp::*__pf)(_Arg) const)
      : _M_f(__pf) { }

      _Ret
      operator()(const _Tp* __p, _Arg __x) const
      { return (__p->*_M_f)(__x); }

    private:
      _Ret (_Tp::*_M_f)(_Arg) const;
    };



  template<typename _Ret, typename _Tp, typename _Arg>
    class mem_fun1_ref_t : public binary_function<_Tp, _Arg, _Ret>
    {
    public:
      explicit
      mem_fun1_ref_t(_Ret (_Tp::*__pf)(_Arg))
      : _M_f(__pf) { }

      _Ret
      operator()(_Tp& __r, _Arg __x) const
      { return (__r.*_M_f)(__x); }

    private:
      _Ret (_Tp::*_M_f)(_Arg);
    };



  template<typename _Ret, typename _Tp, typename _Arg>
    class const_mem_fun1_ref_t : public binary_function<_Tp, _Arg, _Ret>
    {
    public:
      explicit
      const_mem_fun1_ref_t(_Ret (_Tp::*__pf)(_Arg) const)
      : _M_f(__pf) { }

      _Ret
      operator()(const _Tp& __r, _Arg __x) const
      { return (__r.*_M_f)(__x); }

    private:
      _Ret (_Tp::*_M_f)(_Arg) const;
    };



  template<typename _Ret, typename _Tp>
    inline mem_fun_t<_Ret, _Tp>
    mem_fun(_Ret (_Tp::*__f)())
    { return mem_fun_t<_Ret, _Tp>(__f); }

  template<typename _Ret, typename _Tp>
    inline const_mem_fun_t<_Ret, _Tp>
    mem_fun(_Ret (_Tp::*__f)() const)
    { return const_mem_fun_t<_Ret, _Tp>(__f); }

  template<typename _Ret, typename _Tp>
    inline mem_fun_ref_t<_Ret, _Tp>
    mem_fun_ref(_Ret (_Tp::*__f)())
    { return mem_fun_ref_t<_Ret, _Tp>(__f); }

  template<typename _Ret, typename _Tp>
    inline const_mem_fun_ref_t<_Ret, _Tp>
    mem_fun_ref(_Ret (_Tp::*__f)() const)
    { return const_mem_fun_ref_t<_Ret, _Tp>(__f); }

  template<typename _Ret, typename _Tp, typename _Arg>
    inline mem_fun1_t<_Ret, _Tp, _Arg>
    mem_fun(_Ret (_Tp::*__f)(_Arg))
    { return mem_fun1_t<_Ret, _Tp, _Arg>(__f); }

  template<typename _Ret, typename _Tp, typename _Arg>
    inline const_mem_fun1_t<_Ret, _Tp, _Arg>
    mem_fun(_Ret (_Tp::*__f)(_Arg) const)
    { return const_mem_fun1_t<_Ret, _Tp, _Arg>(__f); }

  template<typename _Ret, typename _Tp, typename _Arg>
    inline mem_fun1_ref_t<_Ret, _Tp, _Arg>
    mem_fun_ref(_Ret (_Tp::*__f)(_Arg))
    { return mem_fun1_ref_t<_Ret, _Tp, _Arg>(__f); }

  template<typename _Ret, typename _Tp, typename _Arg>
    inline const_mem_fun1_ref_t<_Ret, _Tp, _Arg>
    mem_fun_ref(_Ret (_Tp::*__f)(_Arg) const)
    { return const_mem_fun1_ref_t<_Ret, _Tp, _Arg>(__f); }




}


# 1 "/usr/include/c++/5/backward/binders.h" 1 3
# 60 "/usr/include/c++/5/backward/binders.h" 3
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"

namespace std __attribute__ ((__visibility__ ("default")))
{

# 107 "/usr/include/c++/5/backward/binders.h" 3
  template<typename _Operation>
    class binder1st
    : public unary_function<typename _Operation::second_argument_type,
       typename _Operation::result_type>
    {
    protected:
      _Operation op;
      typename _Operation::first_argument_type value;

    public:
      binder1st(const _Operation& __x,
  const typename _Operation::first_argument_type& __y)
      : op(__x), value(__y) { }

      typename _Operation::result_type
      operator()(const typename _Operation::second_argument_type& __x) const
      { return op(value, __x); }



      typename _Operation::result_type
      operator()(typename _Operation::second_argument_type& __x) const
      { return op(value, __x); }
    } ;


  template<typename _Operation, typename _Tp>
    inline binder1st<_Operation>
    bind1st(const _Operation& __fn, const _Tp& __x)
    {
      typedef typename _Operation::first_argument_type _Arg1_type;
      return binder1st<_Operation>(__fn, _Arg1_type(__x));
    }


  template<typename _Operation>
    class binder2nd
    : public unary_function<typename _Operation::first_argument_type,
       typename _Operation::result_type>
    {
    protected:
      _Operation op;
      typename _Operation::second_argument_type value;

    public:
      binder2nd(const _Operation& __x,
  const typename _Operation::second_argument_type& __y)
      : op(__x), value(__y) { }

      typename _Operation::result_type
      operator()(const typename _Operation::first_argument_type& __x) const
      { return op(__x, value); }



      typename _Operation::result_type
      operator()(typename _Operation::first_argument_type& __x) const
      { return op(__x, value); }
    } ;


  template<typename _Operation, typename _Tp>
    inline binder2nd<_Operation>
    bind2nd(const _Operation& __fn, const _Tp& __x)
    {
      typedef typename _Operation::second_argument_type _Arg2_type;
      return binder2nd<_Operation>(__fn, _Arg2_type(__x));
    }



}

#pragma GCC diagnostic pop
# 1129 "/usr/include/c++/5/bits/stl_function.h" 2 3
# 49 "/usr/include/c++/5/string" 2 3


# 1 "/usr/include/c++/5/bits/range_access.h" 1 3
# 33 "/usr/include/c++/5/bits/range_access.h" 3
       
# 34 "/usr/include/c++/5/bits/range_access.h" 3
# 52 "/usr/include/c++/5/string" 2 3
# 1 "/usr/include/c++/5/bits/basic_string.h" 1 3
# 37 "/usr/include/c++/5/bits/basic_string.h" 3
       
# 38 "/usr/include/c++/5/bits/basic_string.h" 3

# 1 "/usr/include/c++/5/ext/atomicity.h" 1 3
# 32 "/usr/include/c++/5/ext/atomicity.h" 3
       
# 33 "/usr/include/c++/5/ext/atomicity.h" 3


# 1 "/usr/include/x86_64-linux-gnu/c++/5/bits/gthr.h" 1 3
# 30 "/usr/include/x86_64-linux-gnu/c++/5/bits/gthr.h" 3
#pragma GCC visibility push(default)
# 148 "/usr/include/x86_64-linux-gnu/c++/5/bits/gthr.h" 3
# 1 "/usr/include/x86_64-linux-gnu/c++/5/bits/gthr-default.h" 1 3
# 35 "/usr/include/x86_64-linux-gnu/c++/5/bits/gthr-default.h" 3
# 1 "/usr/include/pthread.h" 1 3 4
# 23 "/usr/include/pthread.h" 3 4
# 1 "/usr/include/sched.h" 1 3 4
# 28 "/usr/include/sched.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 1 3 4
# 29 "/usr/include/sched.h" 2 3 4
# 43 "/usr/include/sched.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/sched.h" 1 3 4
# 72 "/usr/include/x86_64-linux-gnu/bits/sched.h" 3 4
struct sched_param
  {
    int __sched_priority;
  };

extern "C" {



extern int clone (int (*__fn) (void *__arg), void *__child_stack,
    int __flags, void *__arg, ...) throw ();


extern int unshare (int __flags) throw ();


extern int sched_getcpu (void) throw ();


extern int setns (int __fd, int __nstype) throw ();



}







struct __sched_param
  {
    int __sched_priority;
  };
# 118 "/usr/include/x86_64-linux-gnu/bits/sched.h" 3 4
typedef unsigned long int __cpu_mask;






typedef struct
{
  __cpu_mask __bits[1024 / (8 * sizeof (__cpu_mask))];
} cpu_set_t;
# 201 "/usr/include/x86_64-linux-gnu/bits/sched.h" 3 4
extern "C" {

extern int __sched_cpucount (size_t __setsize, const cpu_set_t *__setp)
  throw ();
extern cpu_set_t *__sched_cpualloc (size_t __count) throw () ;
extern void __sched_cpufree (cpu_set_t *__set) throw ();

}
# 44 "/usr/include/sched.h" 2 3 4




extern "C" {


extern int sched_setparam (__pid_t __pid, const struct sched_param *__param)
     throw ();


extern int sched_getparam (__pid_t __pid, struct sched_param *__param) throw ();


extern int sched_setscheduler (__pid_t __pid, int __policy,
          const struct sched_param *__param) throw ();


extern int sched_getscheduler (__pid_t __pid) throw ();


extern int sched_yield (void) throw ();


extern int sched_get_priority_max (int __algorithm) throw ();


extern int sched_get_priority_min (int __algorithm) throw ();


extern int sched_rr_get_interval (__pid_t __pid, struct timespec *__t) throw ();
# 118 "/usr/include/sched.h" 3 4
extern int sched_setaffinity (__pid_t __pid, size_t __cpusetsize,
         const cpu_set_t *__cpuset) throw ();


extern int sched_getaffinity (__pid_t __pid, size_t __cpusetsize,
         cpu_set_t *__cpuset) throw ();


}
# 24 "/usr/include/pthread.h" 2 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/setjmp.h" 1 3 4
# 26 "/usr/include/x86_64-linux-gnu/bits/setjmp.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/bits/setjmp.h" 2 3 4




typedef long int __jmp_buf[8];
# 28 "/usr/include/pthread.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 29 "/usr/include/pthread.h" 2 3 4



enum
{
  PTHREAD_CREATE_JOINABLE,

  PTHREAD_CREATE_DETACHED

};



enum
{
  PTHREAD_MUTEX_TIMED_NP,
  PTHREAD_MUTEX_RECURSIVE_NP,
  PTHREAD_MUTEX_ERRORCHECK_NP,
  PTHREAD_MUTEX_ADAPTIVE_NP

  ,
  PTHREAD_MUTEX_NORMAL = PTHREAD_MUTEX_TIMED_NP,
  PTHREAD_MUTEX_RECURSIVE = PTHREAD_MUTEX_RECURSIVE_NP,
  PTHREAD_MUTEX_ERRORCHECK = PTHREAD_MUTEX_ERRORCHECK_NP,
  PTHREAD_MUTEX_DEFAULT = PTHREAD_MUTEX_NORMAL



  , PTHREAD_MUTEX_FAST_NP = PTHREAD_MUTEX_TIMED_NP

};




enum
{
  PTHREAD_MUTEX_STALLED,
  PTHREAD_MUTEX_STALLED_NP = PTHREAD_MUTEX_STALLED,
  PTHREAD_MUTEX_ROBUST,
  PTHREAD_MUTEX_ROBUST_NP = PTHREAD_MUTEX_ROBUST
};





enum
{
  PTHREAD_PRIO_NONE,
  PTHREAD_PRIO_INHERIT,
  PTHREAD_PRIO_PROTECT
};
# 114 "/usr/include/pthread.h" 3 4
enum
{
  PTHREAD_RWLOCK_PREFER_READER_NP,
  PTHREAD_RWLOCK_PREFER_WRITER_NP,
  PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP,
  PTHREAD_RWLOCK_DEFAULT_NP = PTHREAD_RWLOCK_PREFER_READER_NP
};
# 155 "/usr/include/pthread.h" 3 4
enum
{
  PTHREAD_INHERIT_SCHED,

  PTHREAD_EXPLICIT_SCHED

};



enum
{
  PTHREAD_SCOPE_SYSTEM,

  PTHREAD_SCOPE_PROCESS

};



enum
{
  PTHREAD_PROCESS_PRIVATE,

  PTHREAD_PROCESS_SHARED

};
# 190 "/usr/include/pthread.h" 3 4
struct _pthread_cleanup_buffer
{
  void (*__routine) (void *);
  void *__arg;
  int __canceltype;
  struct _pthread_cleanup_buffer *__prev;
};


enum
{
  PTHREAD_CANCEL_ENABLE,

  PTHREAD_CANCEL_DISABLE

};
enum
{
  PTHREAD_CANCEL_DEFERRED,

  PTHREAD_CANCEL_ASYNCHRONOUS

};
# 228 "/usr/include/pthread.h" 3 4
extern "C" {




extern int pthread_create (pthread_t *__restrict __newthread,
      const pthread_attr_t *__restrict __attr,
      void *(*__start_routine) (void *),
      void *__restrict __arg) throw () __attribute__ ((__nonnull__ (1, 3)));





extern void pthread_exit (void *__retval) __attribute__ ((__noreturn__));







extern int pthread_join (pthread_t __th, void **__thread_return);




extern int pthread_tryjoin_np (pthread_t __th, void **__thread_return) throw ();







extern int pthread_timedjoin_np (pthread_t __th, void **__thread_return,
     const struct timespec *__abstime);






extern int pthread_detach (pthread_t __th) throw ();



extern pthread_t pthread_self (void) throw () __attribute__ ((__const__));


extern int pthread_equal (pthread_t __thread1, pthread_t __thread2)
  throw () __attribute__ ((__const__));







extern int pthread_attr_init (pthread_attr_t *__attr) throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_attr_destroy (pthread_attr_t *__attr)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_attr_getdetachstate (const pthread_attr_t *__attr,
     int *__detachstate)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setdetachstate (pthread_attr_t *__attr,
     int __detachstate)
     throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_attr_getguardsize (const pthread_attr_t *__attr,
          size_t *__guardsize)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setguardsize (pthread_attr_t *__attr,
          size_t __guardsize)
     throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_attr_getschedparam (const pthread_attr_t *__restrict __attr,
           struct sched_param *__restrict __param)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setschedparam (pthread_attr_t *__restrict __attr,
           const struct sched_param *__restrict
           __param) throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_getschedpolicy (const pthread_attr_t *__restrict
     __attr, int *__restrict __policy)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setschedpolicy (pthread_attr_t *__attr, int __policy)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_attr_getinheritsched (const pthread_attr_t *__restrict
      __attr, int *__restrict __inherit)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setinheritsched (pthread_attr_t *__attr,
      int __inherit)
     throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_attr_getscope (const pthread_attr_t *__restrict __attr,
      int *__restrict __scope)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setscope (pthread_attr_t *__attr, int __scope)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_attr_getstackaddr (const pthread_attr_t *__restrict
          __attr, void **__restrict __stackaddr)
     throw () __attribute__ ((__nonnull__ (1, 2))) __attribute__ ((__deprecated__));





extern int pthread_attr_setstackaddr (pthread_attr_t *__attr,
          void *__stackaddr)
     throw () __attribute__ ((__nonnull__ (1))) __attribute__ ((__deprecated__));


extern int pthread_attr_getstacksize (const pthread_attr_t *__restrict
          __attr, size_t *__restrict __stacksize)
     throw () __attribute__ ((__nonnull__ (1, 2)));




extern int pthread_attr_setstacksize (pthread_attr_t *__attr,
          size_t __stacksize)
     throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_attr_getstack (const pthread_attr_t *__restrict __attr,
      void **__restrict __stackaddr,
      size_t *__restrict __stacksize)
     throw () __attribute__ ((__nonnull__ (1, 2, 3)));




extern int pthread_attr_setstack (pthread_attr_t *__attr, void *__stackaddr,
      size_t __stacksize) throw () __attribute__ ((__nonnull__ (1)));





extern int pthread_attr_setaffinity_np (pthread_attr_t *__attr,
     size_t __cpusetsize,
     const cpu_set_t *__cpuset)
     throw () __attribute__ ((__nonnull__ (1, 3)));



extern int pthread_attr_getaffinity_np (const pthread_attr_t *__attr,
     size_t __cpusetsize,
     cpu_set_t *__cpuset)
     throw () __attribute__ ((__nonnull__ (1, 3)));


extern int pthread_getattr_default_np (pthread_attr_t *__attr)
     throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_setattr_default_np (const pthread_attr_t *__attr)
     throw () __attribute__ ((__nonnull__ (1)));




extern int pthread_getattr_np (pthread_t __th, pthread_attr_t *__attr)
     throw () __attribute__ ((__nonnull__ (2)));







extern int pthread_setschedparam (pthread_t __target_thread, int __policy,
      const struct sched_param *__param)
     throw () __attribute__ ((__nonnull__ (3)));


extern int pthread_getschedparam (pthread_t __target_thread,
      int *__restrict __policy,
      struct sched_param *__restrict __param)
     throw () __attribute__ ((__nonnull__ (2, 3)));


extern int pthread_setschedprio (pthread_t __target_thread, int __prio)
     throw ();




extern int pthread_getname_np (pthread_t __target_thread, char *__buf,
          size_t __buflen)
     throw () __attribute__ ((__nonnull__ (2)));


extern int pthread_setname_np (pthread_t __target_thread, const char *__name)
     throw () __attribute__ ((__nonnull__ (2)));





extern int pthread_getconcurrency (void) throw ();


extern int pthread_setconcurrency (int __level) throw ();







extern int pthread_yield (void) throw ();




extern int pthread_setaffinity_np (pthread_t __th, size_t __cpusetsize,
       const cpu_set_t *__cpuset)
     throw () __attribute__ ((__nonnull__ (3)));


extern int pthread_getaffinity_np (pthread_t __th, size_t __cpusetsize,
       cpu_set_t *__cpuset)
     throw () __attribute__ ((__nonnull__ (3)));
# 494 "/usr/include/pthread.h" 3 4
extern int pthread_once (pthread_once_t *__once_control,
    void (*__init_routine) (void)) __attribute__ ((__nonnull__ (1, 2)));
# 506 "/usr/include/pthread.h" 3 4
extern int pthread_setcancelstate (int __state, int *__oldstate);



extern int pthread_setcanceltype (int __type, int *__oldtype);


extern int pthread_cancel (pthread_t __th);




extern void pthread_testcancel (void);




typedef struct
{
  struct
  {
    __jmp_buf __cancel_jmp_buf;
    int __mask_was_saved;
  } __cancel_jmp_buf[1];
  void *__pad[4];
} __pthread_unwind_buf_t __attribute__ ((__aligned__));
# 540 "/usr/include/pthread.h" 3 4
struct __pthread_cleanup_frame
{
  void (*__cancel_routine) (void *);
  void *__cancel_arg;
  int __do_it;
  int __cancel_type;
};




class __pthread_cleanup_class
{
  void (*__cancel_routine) (void *);
  void *__cancel_arg;
  int __do_it;
  int __cancel_type;

 public:
  __pthread_cleanup_class (void (*__fct) (void *), void *__arg)
    : __cancel_routine (__fct), __cancel_arg (__arg), __do_it (1) { }
  ~__pthread_cleanup_class () { if (__do_it) __cancel_routine (__cancel_arg); }
  void __setdoit (int __newval) { __do_it = __newval; }
  void __defer () { pthread_setcanceltype (PTHREAD_CANCEL_DEFERRED,
        &__cancel_type); }
  void __restore () const { pthread_setcanceltype (__cancel_type, 0); }
};
# 742 "/usr/include/pthread.h" 3 4
struct __jmp_buf_tag;
extern int __sigsetjmp (struct __jmp_buf_tag *__env, int __savemask) throw ();





extern int pthread_mutex_init (pthread_mutex_t *__mutex,
          const pthread_mutexattr_t *__mutexattr)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_mutex_destroy (pthread_mutex_t *__mutex)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_mutex_trylock (pthread_mutex_t *__mutex)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_mutex_lock (pthread_mutex_t *__mutex)
     throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_mutex_timedlock (pthread_mutex_t *__restrict __mutex,
        const struct timespec *__restrict
        __abstime) throw () __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_mutex_unlock (pthread_mutex_t *__mutex)
     throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_mutex_getprioceiling (const pthread_mutex_t *
      __restrict __mutex,
      int *__restrict __prioceiling)
     throw () __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_mutex_setprioceiling (pthread_mutex_t *__restrict __mutex,
      int __prioceiling,
      int *__restrict __old_ceiling)
     throw () __attribute__ ((__nonnull__ (1, 3)));




extern int pthread_mutex_consistent (pthread_mutex_t *__mutex)
     throw () __attribute__ ((__nonnull__ (1)));

extern int pthread_mutex_consistent_np (pthread_mutex_t *__mutex)
     throw () __attribute__ ((__nonnull__ (1)));
# 806 "/usr/include/pthread.h" 3 4
extern int pthread_mutexattr_init (pthread_mutexattr_t *__attr)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_mutexattr_destroy (pthread_mutexattr_t *__attr)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_mutexattr_getpshared (const pthread_mutexattr_t *
      __restrict __attr,
      int *__restrict __pshared)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_mutexattr_setpshared (pthread_mutexattr_t *__attr,
      int __pshared)
     throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_mutexattr_gettype (const pthread_mutexattr_t *__restrict
          __attr, int *__restrict __kind)
     throw () __attribute__ ((__nonnull__ (1, 2)));




extern int pthread_mutexattr_settype (pthread_mutexattr_t *__attr, int __kind)
     throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_mutexattr_getprotocol (const pthread_mutexattr_t *
       __restrict __attr,
       int *__restrict __protocol)
     throw () __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_mutexattr_setprotocol (pthread_mutexattr_t *__attr,
       int __protocol)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_mutexattr_getprioceiling (const pthread_mutexattr_t *
          __restrict __attr,
          int *__restrict __prioceiling)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_mutexattr_setprioceiling (pthread_mutexattr_t *__attr,
          int __prioceiling)
     throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_mutexattr_getrobust (const pthread_mutexattr_t *__attr,
     int *__robustness)
     throw () __attribute__ ((__nonnull__ (1, 2)));

extern int pthread_mutexattr_getrobust_np (const pthread_mutexattr_t *__attr,
        int *__robustness)
     throw () __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_mutexattr_setrobust (pthread_mutexattr_t *__attr,
     int __robustness)
     throw () __attribute__ ((__nonnull__ (1)));

extern int pthread_mutexattr_setrobust_np (pthread_mutexattr_t *__attr,
        int __robustness)
     throw () __attribute__ ((__nonnull__ (1)));
# 888 "/usr/include/pthread.h" 3 4
extern int pthread_rwlock_init (pthread_rwlock_t *__restrict __rwlock,
    const pthread_rwlockattr_t *__restrict
    __attr) throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlock_destroy (pthread_rwlock_t *__rwlock)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlock_rdlock (pthread_rwlock_t *__rwlock)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlock_tryrdlock (pthread_rwlock_t *__rwlock)
  throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_rwlock_timedrdlock (pthread_rwlock_t *__restrict __rwlock,
           const struct timespec *__restrict
           __abstime) throw () __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_rwlock_wrlock (pthread_rwlock_t *__rwlock)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlock_trywrlock (pthread_rwlock_t *__rwlock)
     throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_rwlock_timedwrlock (pthread_rwlock_t *__restrict __rwlock,
           const struct timespec *__restrict
           __abstime) throw () __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_rwlock_unlock (pthread_rwlock_t *__rwlock)
     throw () __attribute__ ((__nonnull__ (1)));





extern int pthread_rwlockattr_init (pthread_rwlockattr_t *__attr)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlockattr_destroy (pthread_rwlockattr_t *__attr)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlockattr_getpshared (const pthread_rwlockattr_t *
       __restrict __attr,
       int *__restrict __pshared)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_rwlockattr_setpshared (pthread_rwlockattr_t *__attr,
       int __pshared)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlockattr_getkind_np (const pthread_rwlockattr_t *
       __restrict __attr,
       int *__restrict __pref)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_rwlockattr_setkind_np (pthread_rwlockattr_t *__attr,
       int __pref) throw () __attribute__ ((__nonnull__ (1)));







extern int pthread_cond_init (pthread_cond_t *__restrict __cond,
         const pthread_condattr_t *__restrict __cond_attr)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_cond_destroy (pthread_cond_t *__cond)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_cond_signal (pthread_cond_t *__cond)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_cond_broadcast (pthread_cond_t *__cond)
     throw () __attribute__ ((__nonnull__ (1)));






extern int pthread_cond_wait (pthread_cond_t *__restrict __cond,
         pthread_mutex_t *__restrict __mutex)
     __attribute__ ((__nonnull__ (1, 2)));
# 1000 "/usr/include/pthread.h" 3 4
extern int pthread_cond_timedwait (pthread_cond_t *__restrict __cond,
       pthread_mutex_t *__restrict __mutex,
       const struct timespec *__restrict __abstime)
     __attribute__ ((__nonnull__ (1, 2, 3)));




extern int pthread_condattr_init (pthread_condattr_t *__attr)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_condattr_destroy (pthread_condattr_t *__attr)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_condattr_getpshared (const pthread_condattr_t *
     __restrict __attr,
     int *__restrict __pshared)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_condattr_setpshared (pthread_condattr_t *__attr,
     int __pshared) throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_condattr_getclock (const pthread_condattr_t *
          __restrict __attr,
          __clockid_t *__restrict __clock_id)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_condattr_setclock (pthread_condattr_t *__attr,
          __clockid_t __clock_id)
     throw () __attribute__ ((__nonnull__ (1)));
# 1044 "/usr/include/pthread.h" 3 4
extern int pthread_spin_init (pthread_spinlock_t *__lock, int __pshared)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_spin_destroy (pthread_spinlock_t *__lock)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_spin_lock (pthread_spinlock_t *__lock)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_spin_trylock (pthread_spinlock_t *__lock)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_spin_unlock (pthread_spinlock_t *__lock)
     throw () __attribute__ ((__nonnull__ (1)));






extern int pthread_barrier_init (pthread_barrier_t *__restrict __barrier,
     const pthread_barrierattr_t *__restrict
     __attr, unsigned int __count)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_barrier_destroy (pthread_barrier_t *__barrier)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_barrier_wait (pthread_barrier_t *__barrier)
     throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_barrierattr_init (pthread_barrierattr_t *__attr)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_barrierattr_destroy (pthread_barrierattr_t *__attr)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_barrierattr_getpshared (const pthread_barrierattr_t *
        __restrict __attr,
        int *__restrict __pshared)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_barrierattr_setpshared (pthread_barrierattr_t *__attr,
        int __pshared)
     throw () __attribute__ ((__nonnull__ (1)));
# 1111 "/usr/include/pthread.h" 3 4
extern int pthread_key_create (pthread_key_t *__key,
          void (*__destr_function) (void *))
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_key_delete (pthread_key_t __key) throw ();


extern void *pthread_getspecific (pthread_key_t __key) throw ();


extern int pthread_setspecific (pthread_key_t __key,
    const void *__pointer) throw () ;




extern int pthread_getcpuclockid (pthread_t __thread_id,
      __clockid_t *__clock_id)
     throw () __attribute__ ((__nonnull__ (2)));
# 1145 "/usr/include/pthread.h" 3 4
extern int pthread_atfork (void (*__prepare) (void),
      void (*__parent) (void),
      void (*__child) (void)) throw ();
# 1159 "/usr/include/pthread.h" 3 4
}
# 36 "/usr/include/x86_64-linux-gnu/c++/5/bits/gthr-default.h" 2 3
# 47 "/usr/include/x86_64-linux-gnu/c++/5/bits/gthr-default.h" 3
typedef pthread_t __gthread_t;
typedef pthread_key_t __gthread_key_t;
typedef pthread_once_t __gthread_once_t;
typedef pthread_mutex_t __gthread_mutex_t;
typedef pthread_mutex_t __gthread_recursive_mutex_t;
typedef pthread_cond_t __gthread_cond_t;
typedef struct timespec __gthread_time_t;
# 101 "/usr/include/x86_64-linux-gnu/c++/5/bits/gthr-default.h" 3
static __typeof(pthread_once) __gthrw_pthread_once __attribute__ ((__weakref__("pthread_once")));
static __typeof(pthread_getspecific) __gthrw_pthread_getspecific __attribute__ ((__weakref__("pthread_getspecific")));
static __typeof(pthread_setspecific) __gthrw_pthread_setspecific __attribute__ ((__weakref__("pthread_setspecific")));

static __typeof(pthread_create) __gthrw_pthread_create __attribute__ ((__weakref__("pthread_create")));
static __typeof(pthread_join) __gthrw_pthread_join __attribute__ ((__weakref__("pthread_join")));
static __typeof(pthread_equal) __gthrw_pthread_equal __attribute__ ((__weakref__("pthread_equal")));
static __typeof(pthread_self) __gthrw_pthread_self __attribute__ ((__weakref__("pthread_self")));
static __typeof(pthread_detach) __gthrw_pthread_detach __attribute__ ((__weakref__("pthread_detach")));

static __typeof(pthread_cancel) __gthrw_pthread_cancel __attribute__ ((__weakref__("pthread_cancel")));

static __typeof(sched_yield) __gthrw_sched_yield __attribute__ ((__weakref__("sched_yield")));

static __typeof(pthread_mutex_lock) __gthrw_pthread_mutex_lock __attribute__ ((__weakref__("pthread_mutex_lock")));
static __typeof(pthread_mutex_trylock) __gthrw_pthread_mutex_trylock __attribute__ ((__weakref__("pthread_mutex_trylock")));

static __typeof(pthread_mutex_timedlock) __gthrw_pthread_mutex_timedlock __attribute__ ((__weakref__("pthread_mutex_timedlock")));

static __typeof(pthread_mutex_unlock) __gthrw_pthread_mutex_unlock __attribute__ ((__weakref__("pthread_mutex_unlock")));
static __typeof(pthread_mutex_init) __gthrw_pthread_mutex_init __attribute__ ((__weakref__("pthread_mutex_init")));
static __typeof(pthread_mutex_destroy) __gthrw_pthread_mutex_destroy __attribute__ ((__weakref__("pthread_mutex_destroy")));

static __typeof(pthread_cond_init) __gthrw_pthread_cond_init __attribute__ ((__weakref__("pthread_cond_init")));
static __typeof(pthread_cond_broadcast) __gthrw_pthread_cond_broadcast __attribute__ ((__weakref__("pthread_cond_broadcast")));
static __typeof(pthread_cond_signal) __gthrw_pthread_cond_signal __attribute__ ((__weakref__("pthread_cond_signal")));
static __typeof(pthread_cond_wait) __gthrw_pthread_cond_wait __attribute__ ((__weakref__("pthread_cond_wait")));
static __typeof(pthread_cond_timedwait) __gthrw_pthread_cond_timedwait __attribute__ ((__weakref__("pthread_cond_timedwait")));
static __typeof(pthread_cond_destroy) __gthrw_pthread_cond_destroy __attribute__ ((__weakref__("pthread_cond_destroy")));

static __typeof(pthread_key_create) __gthrw_pthread_key_create __attribute__ ((__weakref__("pthread_key_create")));
static __typeof(pthread_key_delete) __gthrw_pthread_key_delete __attribute__ ((__weakref__("pthread_key_delete")));
static __typeof(pthread_mutexattr_init) __gthrw_pthread_mutexattr_init __attribute__ ((__weakref__("pthread_mutexattr_init")));
static __typeof(pthread_mutexattr_settype) __gthrw_pthread_mutexattr_settype __attribute__ ((__weakref__("pthread_mutexattr_settype")));
static __typeof(pthread_mutexattr_destroy) __gthrw_pthread_mutexattr_destroy __attribute__ ((__weakref__("pthread_mutexattr_destroy")));
# 236 "/usr/include/x86_64-linux-gnu/c++/5/bits/gthr-default.h" 3
static __typeof(pthread_key_create) __gthrw___pthread_key_create __attribute__ ((__weakref__("__pthread_key_create")));
# 246 "/usr/include/x86_64-linux-gnu/c++/5/bits/gthr-default.h" 3
static inline int
__gthread_active_p (void)
{
  static void *const __gthread_active_ptr
    = __extension__ (void *) &__gthrw___pthread_key_create;
  return __gthread_active_ptr != 0;
}
# 658 "/usr/include/x86_64-linux-gnu/c++/5/bits/gthr-default.h" 3
static inline int
__gthread_create (__gthread_t *__threadid, void *(*__func) (void*),
    void *__args)
{
  return __gthrw_pthread_create (__threadid, __null, __func, __args);
}

static inline int
__gthread_join (__gthread_t __threadid, void **__value_ptr)
{
  return __gthrw_pthread_join (__threadid, __value_ptr);
}

static inline int
__gthread_detach (__gthread_t __threadid)
{
  return __gthrw_pthread_detach (__threadid);
}

static inline int
__gthread_equal (__gthread_t __t1, __gthread_t __t2)
{
  return __gthrw_pthread_equal (__t1, __t2);
}

static inline __gthread_t
__gthread_self (void)
{
  return __gthrw_pthread_self ();
}

static inline int
__gthread_yield (void)
{
  return __gthrw_sched_yield ();
}

static inline int
__gthread_once (__gthread_once_t *__once, void (*__func) (void))
{
  if (__gthread_active_p ())
    return __gthrw_pthread_once (__once, __func);
  else
    return -1;
}

static inline int
__gthread_key_create (__gthread_key_t *__key, void (*__dtor) (void *))
{
  return __gthrw_pthread_key_create (__key, __dtor);
}

static inline int
__gthread_key_delete (__gthread_key_t __key)
{
  return __gthrw_pthread_key_delete (__key);
}

static inline void *
__gthread_getspecific (__gthread_key_t __key)
{
  return __gthrw_pthread_getspecific (__key);
}

static inline int
__gthread_setspecific (__gthread_key_t __key, const void *__ptr)
{
  return __gthrw_pthread_setspecific (__key, __ptr);
}

static inline void
__gthread_mutex_init_function (__gthread_mutex_t *__mutex)
{
  if (__gthread_active_p ())
    __gthrw_pthread_mutex_init (__mutex, __null);
}

static inline int
__gthread_mutex_destroy (__gthread_mutex_t *__mutex)
{
  if (__gthread_active_p ())
    return __gthrw_pthread_mutex_destroy (__mutex);
  else
    return 0;
}

static inline int
__gthread_mutex_lock (__gthread_mutex_t *__mutex)
{
  if (__gthread_active_p ())
    return __gthrw_pthread_mutex_lock (__mutex);
  else
    return 0;
}

static inline int
__gthread_mutex_trylock (__gthread_mutex_t *__mutex)
{
  if (__gthread_active_p ())
    return __gthrw_pthread_mutex_trylock (__mutex);
  else
    return 0;
}


static inline int
__gthread_mutex_timedlock (__gthread_mutex_t *__mutex,
      const __gthread_time_t *__abs_timeout)
{
  if (__gthread_active_p ())
    return __gthrw_pthread_mutex_timedlock (__mutex, __abs_timeout);
  else
    return 0;
}


static inline int
__gthread_mutex_unlock (__gthread_mutex_t *__mutex)
{
  if (__gthread_active_p ())
    return __gthrw_pthread_mutex_unlock (__mutex);
  else
    return 0;
}
# 807 "/usr/include/x86_64-linux-gnu/c++/5/bits/gthr-default.h" 3
static inline int
__gthread_recursive_mutex_lock (__gthread_recursive_mutex_t *__mutex)
{
  return __gthread_mutex_lock (__mutex);
}

static inline int
__gthread_recursive_mutex_trylock (__gthread_recursive_mutex_t *__mutex)
{
  return __gthread_mutex_trylock (__mutex);
}


static inline int
__gthread_recursive_mutex_timedlock (__gthread_recursive_mutex_t *__mutex,
         const __gthread_time_t *__abs_timeout)
{
  return __gthread_mutex_timedlock (__mutex, __abs_timeout);
}


static inline int
__gthread_recursive_mutex_unlock (__gthread_recursive_mutex_t *__mutex)
{
  return __gthread_mutex_unlock (__mutex);
}

static inline int
__gthread_recursive_mutex_destroy (__gthread_recursive_mutex_t *__mutex)
{
  return __gthread_mutex_destroy (__mutex);
}
# 849 "/usr/include/x86_64-linux-gnu/c++/5/bits/gthr-default.h" 3
static inline int
__gthread_cond_broadcast (__gthread_cond_t *__cond)
{
  return __gthrw_pthread_cond_broadcast (__cond);
}

static inline int
__gthread_cond_signal (__gthread_cond_t *__cond)
{
  return __gthrw_pthread_cond_signal (__cond);
}

static inline int
__gthread_cond_wait (__gthread_cond_t *__cond, __gthread_mutex_t *__mutex)
{
  return __gthrw_pthread_cond_wait (__cond, __mutex);
}

static inline int
__gthread_cond_timedwait (__gthread_cond_t *__cond, __gthread_mutex_t *__mutex,
     const __gthread_time_t *__abs_timeout)
{
  return __gthrw_pthread_cond_timedwait (__cond, __mutex, __abs_timeout);
}

static inline int
__gthread_cond_wait_recursive (__gthread_cond_t *__cond,
          __gthread_recursive_mutex_t *__mutex)
{
  return __gthread_cond_wait (__cond, __mutex);
}

static inline int
__gthread_cond_destroy (__gthread_cond_t* __cond)
{
  return __gthrw_pthread_cond_destroy (__cond);
}
# 149 "/usr/include/x86_64-linux-gnu/c++/5/bits/gthr.h" 2 3


#pragma GCC visibility pop
# 36 "/usr/include/c++/5/ext/atomicity.h" 2 3
# 1 "/usr/include/x86_64-linux-gnu/c++/5/bits/atomic_word.h" 1 3
# 32 "/usr/include/x86_64-linux-gnu/c++/5/bits/atomic_word.h" 3
typedef int _Atomic_word;
# 37 "/usr/include/c++/5/ext/atomicity.h" 2 3

namespace __gnu_cxx __attribute__ ((__visibility__ ("default")))
{







  static inline _Atomic_word
  __exchange_and_add(volatile _Atomic_word* __mem, int __val)
  { return __atomic_fetch_add(__mem, __val, 4); }

  static inline void
  __atomic_add(volatile _Atomic_word* __mem, int __val)
  { __atomic_fetch_add(__mem, __val, 4); }
# 64 "/usr/include/c++/5/ext/atomicity.h" 3
  static inline _Atomic_word
  __exchange_and_add_single(_Atomic_word* __mem, int __val)
  {
    _Atomic_word __result = *__mem;
    *__mem += __val;
    return __result;
  }

  static inline void
  __atomic_add_single(_Atomic_word* __mem, int __val)
  { *__mem += __val; }

  static inline _Atomic_word
  __attribute__ ((__unused__))
  __exchange_and_add_dispatch(_Atomic_word* __mem, int __val)
  {

    if (__gthread_active_p())
      return __exchange_and_add(__mem, __val);
    else
      return __exchange_and_add_single(__mem, __val);



  }

  static inline void
  __attribute__ ((__unused__))
  __atomic_add_dispatch(_Atomic_word* __mem, int __val)
  {

    if (__gthread_active_p())
      __atomic_add(__mem, __val);
    else
      __atomic_add_single(__mem, __val);



  }


}
# 40 "/usr/include/c++/5/bits/basic_string.h" 2 3
# 1 "/usr/include/c++/5/ext/alloc_traits.h" 1 3
# 32 "/usr/include/c++/5/ext/alloc_traits.h" 3
       
# 33 "/usr/include/c++/5/ext/alloc_traits.h" 3
# 41 "/usr/include/c++/5/ext/alloc_traits.h" 3
namespace __gnu_cxx __attribute__ ((__visibility__ ("default")))
{

# 94 "/usr/include/c++/5/ext/alloc_traits.h" 3
template<typename _Alloc>
  struct __alloc_traits



  {
    typedef _Alloc allocator_type;
# 172 "/usr/include/c++/5/ext/alloc_traits.h" 3
    typedef typename _Alloc::pointer pointer;
    typedef typename _Alloc::const_pointer const_pointer;
    typedef typename _Alloc::value_type value_type;
    typedef typename _Alloc::reference reference;
    typedef typename _Alloc::const_reference const_reference;
    typedef typename _Alloc::size_type size_type;
    typedef typename _Alloc::difference_type difference_type;

    static pointer
    allocate(_Alloc& __a, size_type __n)
    { return __a.allocate(__n); }

    static void deallocate(_Alloc& __a, pointer __p, size_type __n)
    { __a.deallocate(__p, __n); }

    template<typename _Tp>
      static void construct(_Alloc& __a, pointer __p, const _Tp& __arg)
      { __a.construct(__p, __arg); }

    static void destroy(_Alloc& __a, pointer __p)
    { __a.destroy(__p); }

    static size_type max_size(const _Alloc& __a)
    { return __a.max_size(); }

    static const _Alloc& _S_select_on_copy(const _Alloc& __a) { return __a; }

    static void _S_on_swap(_Alloc& __a, _Alloc& __b)
    {


      std::__alloc_swap<_Alloc>::_S_do_it(__a, __b);
    }

    template<typename _Tp>
      struct rebind
      { typedef typename _Alloc::template rebind<_Tp>::other other; };

  };


}
# 41 "/usr/include/c++/5/bits/basic_string.h" 2 3





namespace std __attribute__ ((__visibility__ ("default")))
{



namespace __cxx11 {
# 70 "/usr/include/c++/5/bits/basic_string.h" 3
  template<typename _CharT, typename _Traits, typename _Alloc>
    class basic_string
    {
      typedef typename __gnu_cxx::__alloc_traits<_Alloc>::template
 rebind<_CharT>::other _Char_alloc_type;
      typedef __gnu_cxx::__alloc_traits<_Char_alloc_type> _Alloc_traits;


    public:
      typedef _Traits traits_type;
      typedef typename _Traits::char_type value_type;
      typedef _Char_alloc_type allocator_type;
      typedef typename _Alloc_traits::size_type size_type;
      typedef typename _Alloc_traits::difference_type difference_type;
      typedef typename _Alloc_traits::reference reference;
      typedef typename _Alloc_traits::const_reference const_reference;
      typedef typename _Alloc_traits::pointer pointer;
      typedef typename _Alloc_traits::const_pointer const_pointer;
      typedef __gnu_cxx::__normal_iterator<pointer, basic_string> iterator;
      typedef __gnu_cxx::__normal_iterator<const_pointer, basic_string>
       const_iterator;
      typedef std::reverse_iterator<const_iterator> const_reverse_iterator;
      typedef std::reverse_iterator<iterator> reverse_iterator;


      static const size_type npos = static_cast<size_type>(-1);

    private:


      typedef iterator __const_iterator;





      struct _Alloc_hider : allocator_type
      {
 _Alloc_hider(pointer __dat, const _Alloc& __a = _Alloc())
 : allocator_type(__a), _M_p(__dat) { }

 pointer _M_p;
      };

      _Alloc_hider _M_dataplus;
      size_type _M_string_length;

      enum { _S_local_capacity = 15 / sizeof(_CharT) };

      union
      {
 _CharT _M_local_buf[_S_local_capacity + 1];
 size_type _M_allocated_capacity;
      };

      void
      _M_data(pointer __p)
      { _M_dataplus._M_p = __p; }

      void
      _M_length(size_type __length)
      { _M_string_length = __length; }

      pointer
      _M_data() const
      { return _M_dataplus._M_p; }

      pointer
      _M_local_data()
      {



 return pointer(_M_local_buf);

      }

      const_pointer
      _M_local_data() const
      {



 return const_pointer(_M_local_buf);

      }

      void
      _M_capacity(size_type __capacity)
      { _M_allocated_capacity = __capacity; }

      void
      _M_set_length(size_type __n)
      {
 _M_length(__n);
 traits_type::assign(_M_data()[__n], _CharT());
      }

      bool
      _M_is_local() const
      { return _M_data() == _M_local_data(); }


      pointer
      _M_create(size_type&, size_type);

      void
      _M_dispose()
      {
 if (!_M_is_local())
   _M_destroy(_M_allocated_capacity);
      }

      void
      _M_destroy(size_type __size) throw()
      { _Alloc_traits::deallocate(_M_get_allocator(), _M_data(), __size + 1); }



      template<typename _InIterator>
        void
        _M_construct_aux(_InIterator __beg, _InIterator __end,
    std::__false_type)
 {
          typedef typename iterator_traits<_InIterator>::iterator_category _Tag;
          _M_construct(__beg, __end, _Tag());
 }



      template<typename _Integer>
        void
        _M_construct_aux(_Integer __beg, _Integer __end, std::__true_type)
 { _M_construct_aux_2(static_cast<size_type>(__beg), __end); }

      void
      _M_construct_aux_2(size_type __req, _CharT __c)
      { _M_construct(__req, __c); }

      template<typename _InIterator>
        void
        _M_construct(_InIterator __beg, _InIterator __end)
 {
   typedef typename std::__is_integer<_InIterator>::__type _Integral;
   _M_construct_aux(__beg, __end, _Integral());
        }


      template<typename _InIterator>
        void
        _M_construct(_InIterator __beg, _InIterator __end,
       std::input_iterator_tag);



      template<typename _FwdIterator>
        void
        _M_construct(_FwdIterator __beg, _FwdIterator __end,
       std::forward_iterator_tag);

      void
      _M_construct(size_type __req, _CharT __c);

      allocator_type&
      _M_get_allocator()
      { return _M_dataplus; }

      const allocator_type&
      _M_get_allocator() const
      { return _M_dataplus; }

    private:
# 257 "/usr/include/c++/5/bits/basic_string.h" 3
      size_type
      _M_check(size_type __pos, const char* __s) const
      {
 if (__pos > this->size())
   __throw_out_of_range_fmt(("%s: __pos (which is %zu) > " "this->size() (which is %zu)")
                                         ,
       __s, __pos, this->size());
 return __pos;
      }

      void
      _M_check_length(size_type __n1, size_type __n2, const char* __s) const
      {
 if (this->max_size() - (this->size() - __n1) < __n2)
   __throw_length_error((__s));
      }



      size_type
      _M_limit(size_type __pos, size_type __off) const
      {
 const bool __testoff = __off < this->size() - __pos;
 return __testoff ? __off : this->size() - __pos;
      }


      bool
      _M_disjunct(const _CharT* __s) const
      {
 return (less<const _CharT*>()(__s, _M_data())
  || less<const _CharT*>()(_M_data() + this->size(), __s));
      }



      static void
      _S_copy(_CharT* __d, const _CharT* __s, size_type __n)
      {
 if (__n == 1)
   traits_type::assign(*__d, *__s);
 else
   traits_type::copy(__d, __s, __n);
      }

      static void
      _S_move(_CharT* __d, const _CharT* __s, size_type __n)
      {
 if (__n == 1)
   traits_type::assign(*__d, *__s);
 else
   traits_type::move(__d, __s, __n);
      }

      static void
      _S_assign(_CharT* __d, size_type __n, _CharT __c)
      {
 if (__n == 1)
   traits_type::assign(*__d, __c);
 else
   traits_type::assign(__d, __n, __c);
      }



      template<class _Iterator>
        static void
        _S_copy_chars(_CharT* __p, _Iterator __k1, _Iterator __k2)
        {
   for (; __k1 != __k2; ++__k1, ++__p)
     traits_type::assign(*__p, *__k1);
 }

      static void
      _S_copy_chars(_CharT* __p, iterator __k1, iterator __k2)
      { _S_copy_chars(__p, __k1.base(), __k2.base()); }

      static void
      _S_copy_chars(_CharT* __p, const_iterator __k1, const_iterator __k2)
     
      { _S_copy_chars(__p, __k1.base(), __k2.base()); }

      static void
      _S_copy_chars(_CharT* __p, _CharT* __k1, _CharT* __k2)
      { _S_copy(__p, __k1, __k2 - __k1); }

      static void
      _S_copy_chars(_CharT* __p, const _CharT* __k1, const _CharT* __k2)
     
      { _S_copy(__p, __k1, __k2 - __k1); }

      static int
      _S_compare(size_type __n1, size_type __n2)
      {
 const difference_type __d = difference_type(__n1 - __n2);

 if (__d > __gnu_cxx::__numeric_traits<int>::__max)
   return __gnu_cxx::__numeric_traits<int>::__max;
 else if (__d < __gnu_cxx::__numeric_traits<int>::__min)
   return __gnu_cxx::__numeric_traits<int>::__min;
 else
   return int(__d);
      }

      void
      _M_assign(const basic_string& __rcs);

      void
      _M_mutate(size_type __pos, size_type __len1, const _CharT* __s,
  size_type __len2);

      void
      _M_erase(size_type __pos, size_type __n);

    public:







      basic_string()



      : _M_dataplus(_M_local_data())
      { _M_set_length(0); }




      explicit
      basic_string(const _Alloc& __a)
      : _M_dataplus(_M_local_data(), __a)
      { _M_set_length(0); }





      basic_string(const basic_string& __str)
      : _M_dataplus(_M_local_data(), __str._M_get_allocator())
      { _M_construct(__str._M_data(), __str._M_data() + __str.length()); }
# 410 "/usr/include/c++/5/bits/basic_string.h" 3
      basic_string(const basic_string& __str, size_type __pos,
     size_type __n = npos)
      : _M_dataplus(_M_local_data())
      {
 const _CharT* __start = __str._M_data()
   + __str._M_check(__pos, "basic_string::basic_string");
 _M_construct(__start, __start + __str._M_limit(__pos, __n));
      }
# 426 "/usr/include/c++/5/bits/basic_string.h" 3
      basic_string(const basic_string& __str, size_type __pos,
     size_type __n, const _Alloc& __a)
      : _M_dataplus(_M_local_data(), __a)
      {
 const _CharT* __start
   = __str._M_data() + __str._M_check(__pos, "string::string");
 _M_construct(__start, __start + __str._M_limit(__pos, __n));
      }
# 444 "/usr/include/c++/5/bits/basic_string.h" 3
      basic_string(const _CharT* __s, size_type __n,
     const _Alloc& __a = _Alloc())
      : _M_dataplus(_M_local_data(), __a)
      { _M_construct(__s, __s + __n); }






      basic_string(const _CharT* __s, const _Alloc& __a = _Alloc())
      : _M_dataplus(_M_local_data(), __a)
      { _M_construct(__s, __s ? __s + traits_type::length(__s) : __s+npos); }







      basic_string(size_type __n, _CharT __c, const _Alloc& __a = _Alloc())
      : _M_dataplus(_M_local_data(), __a)
      { _M_construct(__n, __c); }
# 532 "/usr/include/c++/5/bits/basic_string.h" 3
      template<typename _InputIterator>

        basic_string(_InputIterator __beg, _InputIterator __end,
       const _Alloc& __a = _Alloc())
 : _M_dataplus(_M_local_data(), __a)
 { _M_construct(__beg, __end); }




      ~basic_string()
      { _M_dispose(); }





      basic_string&
      operator=(const basic_string& __str)
      { return this->assign(__str); }





      basic_string&
      operator=(const _CharT* __s)
      { return this->assign(__s); }
# 568 "/usr/include/c++/5/bits/basic_string.h" 3
      basic_string&
      operator=(_CharT __c)
      {
 this->assign(1, __c);
 return *this;
      }
# 610 "/usr/include/c++/5/bits/basic_string.h" 3
      iterator
      begin()
      { return iterator(_M_data()); }





      const_iterator
      begin() const
      { return const_iterator(_M_data()); }





      iterator
      end()
      { return iterator(_M_data() + this->size()); }





      const_iterator
      end() const
      { return const_iterator(_M_data() + this->size()); }






      reverse_iterator
      rbegin()
      { return reverse_iterator(this->end()); }






      const_reverse_iterator
      rbegin() const
      { return const_reverse_iterator(this->end()); }






      reverse_iterator
      rend()
      { return reverse_iterator(this->begin()); }






      const_reverse_iterator
      rend() const
      { return const_reverse_iterator(this->begin()); }
# 710 "/usr/include/c++/5/bits/basic_string.h" 3
    public:



      size_type
      size() const
      { return _M_string_length; }



      size_type
      length() const
      { return _M_string_length; }


      size_type
      max_size() const
      { return (_Alloc_traits::max_size(_M_get_allocator()) - 1) / 2; }
# 739 "/usr/include/c++/5/bits/basic_string.h" 3
      void
      resize(size_type __n, _CharT __c);
# 752 "/usr/include/c++/5/bits/basic_string.h" 3
      void
      resize(size_type __n)
      { this->resize(__n, _CharT()); }
# 777 "/usr/include/c++/5/bits/basic_string.h" 3
      size_type
      capacity() const
      {
 return _M_is_local() ? size_type(_S_local_capacity)
                      : _M_allocated_capacity;
      }
# 801 "/usr/include/c++/5/bits/basic_string.h" 3
      void
      reserve(size_type __res_arg = 0);




      void
      clear()
      { _M_set_length(0); }





      bool
      empty() const
      { return this->size() == 0; }
# 830 "/usr/include/c++/5/bits/basic_string.h" 3
      const_reference
      operator[] (size_type __pos) const
      {
 ;
 return _M_data()[__pos];
      }
# 847 "/usr/include/c++/5/bits/basic_string.h" 3
      reference
      operator[](size_type __pos)
      {


 ;

 ;
 return _M_data()[__pos];
      }
# 868 "/usr/include/c++/5/bits/basic_string.h" 3
      const_reference
      at(size_type __n) const
      {
 if (__n >= this->size())
   __throw_out_of_range_fmt(("basic_string::at: __n " "(which is %zu) >= this->size() " "(which is %zu)")

                            ,
       __n, this->size());
 return _M_data()[__n];
      }
# 889 "/usr/include/c++/5/bits/basic_string.h" 3
      reference
      at(size_type __n)
      {
 if (__n >= size())
   __throw_out_of_range_fmt(("basic_string::at: __n " "(which is %zu) >= this->size() " "(which is %zu)")

                            ,
       __n, this->size());
 return _M_data()[__n];
      }
# 940 "/usr/include/c++/5/bits/basic_string.h" 3
      basic_string&
      operator+=(const basic_string& __str)
      { return this->append(__str); }






      basic_string&
      operator+=(const _CharT* __s)
      { return this->append(__s); }






      basic_string&
      operator+=(_CharT __c)
      {
 this->push_back(__c);
 return *this;
      }
# 981 "/usr/include/c++/5/bits/basic_string.h" 3
      basic_string&
      append(const basic_string& __str)
      { return _M_append(__str._M_data(), __str.size()); }
# 998 "/usr/include/c++/5/bits/basic_string.h" 3
      basic_string&
      append(const basic_string& __str, size_type __pos, size_type __n)
      { return _M_append(__str._M_data()
    + __str._M_check(__pos, "basic_string::append"),
    __str._M_limit(__pos, __n)); }







      basic_string&
      append(const _CharT* __s, size_type __n)
      {
 ;
 _M_check_length(size_type(0), __n, "basic_string::append");
 return _M_append(__s, __n);
      }






      basic_string&
      append(const _CharT* __s)
      {
 ;
 const size_type __n = traits_type::length(__s);
 _M_check_length(size_type(0), __n, "basic_string::append");
 return _M_append(__s, __n);
      }
# 1040 "/usr/include/c++/5/bits/basic_string.h" 3
      basic_string&
      append(size_type __n, _CharT __c)
      { return _M_replace_aux(this->size(), size_type(0), __n, __c); }
# 1067 "/usr/include/c++/5/bits/basic_string.h" 3
      template<class _InputIterator>

        basic_string&
        append(_InputIterator __first, _InputIterator __last)
        { return this->replace(end(), end(), __first, __last); }





      void
      push_back(_CharT __c)
      {
 const size_type __size = this->size();
 if (__size + 1 > this->capacity())
   this->_M_mutate(__size, size_type(0), 0, size_type(1));
 traits_type::assign(this->_M_data()[__size], __c);
 this->_M_set_length(__size + 1);
      }






      basic_string&
      assign(const basic_string& __str)
      {
 this->_M_assign(__str);
 return *this;
      }
# 1130 "/usr/include/c++/5/bits/basic_string.h" 3
      basic_string&
      assign(const basic_string& __str, size_type __pos, size_type __n)
      { return _M_replace(size_type(0), this->size(), __str._M_data()
     + __str._M_check(__pos, "basic_string::assign"),
     __str._M_limit(__pos, __n)); }
# 1146 "/usr/include/c++/5/bits/basic_string.h" 3
      basic_string&
      assign(const _CharT* __s, size_type __n)
      {
 ;
 return _M_replace(size_type(0), this->size(), __s, __n);
      }
# 1162 "/usr/include/c++/5/bits/basic_string.h" 3
      basic_string&
      assign(const _CharT* __s)
      {
 ;
 return _M_replace(size_type(0), this->size(), __s,
     traits_type::length(__s));
      }
# 1179 "/usr/include/c++/5/bits/basic_string.h" 3
      basic_string&
      assign(size_type __n, _CharT __c)
      { return _M_replace_aux(size_type(0), this->size(), __n, __c); }
# 1195 "/usr/include/c++/5/bits/basic_string.h" 3
      template<class _InputIterator>

        basic_string&
        assign(_InputIterator __first, _InputIterator __last)
        { return this->replace(begin(), end(), __first, __last); }
# 1250 "/usr/include/c++/5/bits/basic_string.h" 3
      void
      insert(iterator __p, size_type __n, _CharT __c)
      { this->replace(__p, __p, __n, __c); }
# 1293 "/usr/include/c++/5/bits/basic_string.h" 3
      template<class _InputIterator>
        void
        insert(iterator __p, _InputIterator __beg, _InputIterator __end)
        { this->replace(__p, __p, __beg, __end); }
# 1326 "/usr/include/c++/5/bits/basic_string.h" 3
      basic_string&
      insert(size_type __pos1, const basic_string& __str)
      { return this->replace(__pos1, size_type(0),
        __str._M_data(), __str.size()); }
# 1349 "/usr/include/c++/5/bits/basic_string.h" 3
      basic_string&
      insert(size_type __pos1, const basic_string& __str,
      size_type __pos2, size_type __n)
      { return this->replace(__pos1, size_type(0), __str._M_data()
        + __str._M_check(__pos2, "basic_string::insert"),
        __str._M_limit(__pos2, __n)); }
# 1372 "/usr/include/c++/5/bits/basic_string.h" 3
      basic_string&
      insert(size_type __pos, const _CharT* __s, size_type __n)
      { return this->replace(__pos, size_type(0), __s, __n); }
# 1391 "/usr/include/c++/5/bits/basic_string.h" 3
      basic_string&
      insert(size_type __pos, const _CharT* __s)
      {
 ;
 return this->replace(__pos, size_type(0), __s,
        traits_type::length(__s));
      }
# 1415 "/usr/include/c++/5/bits/basic_string.h" 3
      basic_string&
      insert(size_type __pos, size_type __n, _CharT __c)
      { return _M_replace_aux(_M_check(__pos, "basic_string::insert"),
         size_type(0), __n, __c); }
# 1433 "/usr/include/c++/5/bits/basic_string.h" 3
      iterator
      insert(__const_iterator __p, _CharT __c)
      {
 ;
 const size_type __pos = __p - begin();
 _M_replace_aux(__pos, size_type(0), size_type(1), __c);
 return iterator(_M_data() + __pos);
      }
# 1457 "/usr/include/c++/5/bits/basic_string.h" 3
      basic_string&
      erase(size_type __pos = 0, size_type __n = npos)
      {
 this->_M_erase(_M_check(__pos, "basic_string::erase"),
         _M_limit(__pos, __n));
 return *this;
      }
# 1473 "/usr/include/c++/5/bits/basic_string.h" 3
      iterator
      erase(__const_iterator __position)
      {

                           ;
 const size_type __pos = __position - begin();
 this->_M_erase(__pos, size_type(1));
 return iterator(_M_data() + __pos);
      }
# 1492 "/usr/include/c++/5/bits/basic_string.h" 3
      iterator
      erase(__const_iterator __first, __const_iterator __last)
      {

                        ;
        const size_type __pos = __first - begin();
 this->_M_erase(__pos, __last - __first);
 return iterator(this->_M_data() + __pos);
      }
# 1530 "/usr/include/c++/5/bits/basic_string.h" 3
      basic_string&
      replace(size_type __pos, size_type __n, const basic_string& __str)
      { return this->replace(__pos, __n, __str._M_data(), __str.size()); }
# 1552 "/usr/include/c++/5/bits/basic_string.h" 3
      basic_string&
      replace(size_type __pos1, size_type __n1, const basic_string& __str,
       size_type __pos2, size_type __n2)
      { return this->replace(__pos1, __n1, __str._M_data()
        + __str._M_check(__pos2, "basic_string::replace"),
        __str._M_limit(__pos2, __n2)); }
# 1577 "/usr/include/c++/5/bits/basic_string.h" 3
      basic_string&
      replace(size_type __pos, size_type __n1, const _CharT* __s,
       size_type __n2)
      {
 ;
 return _M_replace(_M_check(__pos, "basic_string::replace"),
     _M_limit(__pos, __n1), __s, __n2);
      }
# 1602 "/usr/include/c++/5/bits/basic_string.h" 3
      basic_string&
      replace(size_type __pos, size_type __n1, const _CharT* __s)
      {
 ;
 return this->replace(__pos, __n1, __s, traits_type::length(__s));
      }
# 1626 "/usr/include/c++/5/bits/basic_string.h" 3
      basic_string&
      replace(size_type __pos, size_type __n1, size_type __n2, _CharT __c)
      { return _M_replace_aux(_M_check(__pos, "basic_string::replace"),
         _M_limit(__pos, __n1), __n2, __c); }
# 1644 "/usr/include/c++/5/bits/basic_string.h" 3
      basic_string&
      replace(__const_iterator __i1, __const_iterator __i2,
       const basic_string& __str)
      { return this->replace(__i1, __i2, __str._M_data(), __str.size()); }
# 1664 "/usr/include/c++/5/bits/basic_string.h" 3
      basic_string&
      replace(__const_iterator __i1, __const_iterator __i2,
       const _CharT* __s, size_type __n)
      {

                      ;
 return this->replace(__i1 - begin(), __i2 - __i1, __s, __n);
      }
# 1686 "/usr/include/c++/5/bits/basic_string.h" 3
      basic_string&
      replace(__const_iterator __i1, __const_iterator __i2, const _CharT* __s)
      {
 ;
 return this->replace(__i1, __i2, __s, traits_type::length(__s));
      }
# 1707 "/usr/include/c++/5/bits/basic_string.h" 3
      basic_string&
      replace(__const_iterator __i1, __const_iterator __i2, size_type __n,
       _CharT __c)
      {

                      ;
 return _M_replace_aux(__i1 - begin(), __i2 - __i1, __n, __c);
      }
# 1745 "/usr/include/c++/5/bits/basic_string.h" 3
      template<class _InputIterator>



        basic_string&

        replace(iterator __i1, iterator __i2,
  _InputIterator __k1, _InputIterator __k2)
        {
  
                        ;
   ;
   typedef typename std::__is_integer<_InputIterator>::__type _Integral;
   return _M_replace_dispatch(__i1, __i2, __k1, __k2, _Integral());
 }




      basic_string&
      replace(__const_iterator __i1, __const_iterator __i2,
       _CharT* __k1, _CharT* __k2)
      {

                      ;
 ;
 return this->replace(__i1 - begin(), __i2 - __i1,
        __k1, __k2 - __k1);
      }

      basic_string&
      replace(__const_iterator __i1, __const_iterator __i2,
       const _CharT* __k1, const _CharT* __k2)
      {

                      ;
 ;
 return this->replace(__i1 - begin(), __i2 - __i1,
        __k1, __k2 - __k1);
      }

      basic_string&
      replace(__const_iterator __i1, __const_iterator __i2,
       iterator __k1, iterator __k2)
      {

                      ;
 ;
 return this->replace(__i1 - begin(), __i2 - __i1,
        __k1.base(), __k2 - __k1);
      }

      basic_string&
      replace(__const_iterator __i1, __const_iterator __i2,
       const_iterator __k1, const_iterator __k2)
      {

                      ;
 ;
 return this->replace(__i1 - begin(), __i2 - __i1,
        __k1.base(), __k2 - __k1);
      }
# 1828 "/usr/include/c++/5/bits/basic_string.h" 3
    private:
      template<class _Integer>
 basic_string&
 _M_replace_dispatch(const_iterator __i1, const_iterator __i2,
       _Integer __n, _Integer __val, __true_type)
        { return _M_replace_aux(__i1 - begin(), __i2 - __i1, __n, __val); }

      template<class _InputIterator>
 basic_string&
 _M_replace_dispatch(const_iterator __i1, const_iterator __i2,
       _InputIterator __k1, _InputIterator __k2,
       __false_type);

      basic_string&
      _M_replace_aux(size_type __pos1, size_type __n1, size_type __n2,
       _CharT __c);

      basic_string&
      _M_replace(size_type __pos, size_type __len1, const _CharT* __s,
   const size_type __len2);

      basic_string&
      _M_append(const _CharT* __s, size_type __n);

    public:
# 1866 "/usr/include/c++/5/bits/basic_string.h" 3
      size_type
      copy(_CharT* __s, size_type __n, size_type __pos = 0) const;
# 1876 "/usr/include/c++/5/bits/basic_string.h" 3
      void
      swap(basic_string& __s) ;
# 1886 "/usr/include/c++/5/bits/basic_string.h" 3
      const _CharT*
      c_str() const
      { return _M_data(); }







      const _CharT*
      data() const
      { return _M_data(); }




      allocator_type
      get_allocator() const
      { return _M_get_allocator(); }
# 1919 "/usr/include/c++/5/bits/basic_string.h" 3
      size_type
      find(const _CharT* __s, size_type __pos, size_type __n) const;
# 1932 "/usr/include/c++/5/bits/basic_string.h" 3
      size_type
      find(const basic_string& __str, size_type __pos = 0) const

      { return this->find(__str.data(), __pos, __str.size()); }
# 1947 "/usr/include/c++/5/bits/basic_string.h" 3
      size_type
      find(const _CharT* __s, size_type __pos = 0) const
      {
 ;
 return this->find(__s, __pos, traits_type::length(__s));
      }
# 1964 "/usr/include/c++/5/bits/basic_string.h" 3
      size_type
      find(_CharT __c, size_type __pos = 0) const ;
# 1977 "/usr/include/c++/5/bits/basic_string.h" 3
      size_type
      rfind(const basic_string& __str, size_type __pos = npos) const

      { return this->rfind(__str.data(), __pos, __str.size()); }
# 1994 "/usr/include/c++/5/bits/basic_string.h" 3
      size_type
      rfind(const _CharT* __s, size_type __pos, size_type __n) const;
# 2007 "/usr/include/c++/5/bits/basic_string.h" 3
      size_type
      rfind(const _CharT* __s, size_type __pos = npos) const
      {
 ;
 return this->rfind(__s, __pos, traits_type::length(__s));
      }
# 2024 "/usr/include/c++/5/bits/basic_string.h" 3
      size_type
      rfind(_CharT __c, size_type __pos = npos) const ;
# 2038 "/usr/include/c++/5/bits/basic_string.h" 3
      size_type
      find_first_of(const basic_string& __str, size_type __pos = 0) const

      { return this->find_first_of(__str.data(), __pos, __str.size()); }
# 2055 "/usr/include/c++/5/bits/basic_string.h" 3
      size_type
      find_first_of(const _CharT* __s, size_type __pos, size_type __n) const;
# 2068 "/usr/include/c++/5/bits/basic_string.h" 3
      size_type
      find_first_of(const _CharT* __s, size_type __pos = 0) const
      {
 ;
 return this->find_first_of(__s, __pos, traits_type::length(__s));
      }
# 2087 "/usr/include/c++/5/bits/basic_string.h" 3
      size_type
      find_first_of(_CharT __c, size_type __pos = 0) const
      { return this->find(__c, __pos); }
# 2102 "/usr/include/c++/5/bits/basic_string.h" 3
      size_type
      find_last_of(const basic_string& __str, size_type __pos = npos) const

      { return this->find_last_of(__str.data(), __pos, __str.size()); }
# 2119 "/usr/include/c++/5/bits/basic_string.h" 3
      size_type
      find_last_of(const _CharT* __s, size_type __pos, size_type __n) const;
# 2132 "/usr/include/c++/5/bits/basic_string.h" 3
      size_type
      find_last_of(const _CharT* __s, size_type __pos = npos) const
      {
 ;
 return this->find_last_of(__s, __pos, traits_type::length(__s));
      }
# 2151 "/usr/include/c++/5/bits/basic_string.h" 3
      size_type
      find_last_of(_CharT __c, size_type __pos = npos) const
      { return this->rfind(__c, __pos); }
# 2165 "/usr/include/c++/5/bits/basic_string.h" 3
      size_type
      find_first_not_of(const basic_string& __str, size_type __pos = 0) const

      { return this->find_first_not_of(__str.data(), __pos, __str.size()); }
# 2182 "/usr/include/c++/5/bits/basic_string.h" 3
      size_type
      find_first_not_of(const _CharT* __s, size_type __pos,
   size_type __n) const;
# 2196 "/usr/include/c++/5/bits/basic_string.h" 3
      size_type
      find_first_not_of(const _CharT* __s, size_type __pos = 0) const
      {
 ;
 return this->find_first_not_of(__s, __pos, traits_type::length(__s));
      }
# 2213 "/usr/include/c++/5/bits/basic_string.h" 3
      size_type
      find_first_not_of(_CharT __c, size_type __pos = 0) const
 ;
# 2228 "/usr/include/c++/5/bits/basic_string.h" 3
      size_type
      find_last_not_of(const basic_string& __str, size_type __pos = npos) const

      { return this->find_last_not_of(__str.data(), __pos, __str.size()); }
# 2245 "/usr/include/c++/5/bits/basic_string.h" 3
      size_type
      find_last_not_of(const _CharT* __s, size_type __pos,
         size_type __n) const;
# 2259 "/usr/include/c++/5/bits/basic_string.h" 3
      size_type
      find_last_not_of(const _CharT* __s, size_type __pos = npos) const
      {
 ;
 return this->find_last_not_of(__s, __pos, traits_type::length(__s));
      }
# 2276 "/usr/include/c++/5/bits/basic_string.h" 3
      size_type
      find_last_not_of(_CharT __c, size_type __pos = npos) const
 ;
# 2292 "/usr/include/c++/5/bits/basic_string.h" 3
      basic_string
      substr(size_type __pos = 0, size_type __n = npos) const
      { return basic_string(*this,
       _M_check(__pos, "basic_string::substr"), __n); }
# 2311 "/usr/include/c++/5/bits/basic_string.h" 3
      int
      compare(const basic_string& __str) const
      {
 const size_type __size = this->size();
 const size_type __osize = __str.size();
 const size_type __len = std::min(__size, __osize);

 int __r = traits_type::compare(_M_data(), __str.data(), __len);
 if (!__r)
   __r = _S_compare(__size, __osize);
 return __r;
      }
# 2343 "/usr/include/c++/5/bits/basic_string.h" 3
      int
      compare(size_type __pos, size_type __n, const basic_string& __str) const;
# 2369 "/usr/include/c++/5/bits/basic_string.h" 3
      int
      compare(size_type __pos1, size_type __n1, const basic_string& __str,
       size_type __pos2, size_type __n2) const;
# 2387 "/usr/include/c++/5/bits/basic_string.h" 3
      int
      compare(const _CharT* __s) const;
# 2411 "/usr/include/c++/5/bits/basic_string.h" 3
      int
      compare(size_type __pos, size_type __n1, const _CharT* __s) const;
# 2438 "/usr/include/c++/5/bits/basic_string.h" 3
      int
      compare(size_type __pos, size_type __n1, const _CharT* __s,
       size_type __n2) const;
  };
}
# 4781 "/usr/include/c++/5/bits/basic_string.h" 3
  template<typename _CharT, typename _Traits, typename _Alloc>
    basic_string<_CharT, _Traits, _Alloc>
    operator+(const basic_string<_CharT, _Traits, _Alloc>& __lhs,
       const basic_string<_CharT, _Traits, _Alloc>& __rhs)
    {
      basic_string<_CharT, _Traits, _Alloc> __str(__lhs);
      __str.append(__rhs);
      return __str;
    }







  template<typename _CharT, typename _Traits, typename _Alloc>
    basic_string<_CharT,_Traits,_Alloc>
    operator+(const _CharT* __lhs,
       const basic_string<_CharT,_Traits,_Alloc>& __rhs);







  template<typename _CharT, typename _Traits, typename _Alloc>
    basic_string<_CharT,_Traits,_Alloc>
    operator+(_CharT __lhs, const basic_string<_CharT,_Traits,_Alloc>& __rhs);







  template<typename _CharT, typename _Traits, typename _Alloc>
    inline basic_string<_CharT, _Traits, _Alloc>
    operator+(const basic_string<_CharT, _Traits, _Alloc>& __lhs,
       const _CharT* __rhs)
    {
      basic_string<_CharT, _Traits, _Alloc> __str(__lhs);
      __str.append(__rhs);
      return __str;
    }







  template<typename _CharT, typename _Traits, typename _Alloc>
    inline basic_string<_CharT, _Traits, _Alloc>
    operator+(const basic_string<_CharT, _Traits, _Alloc>& __lhs, _CharT __rhs)
    {
      typedef basic_string<_CharT, _Traits, _Alloc> __string_type;
      typedef typename __string_type::size_type __size_type;
      __string_type __str(__lhs);
      __str.append(__size_type(1), __rhs);
      return __str;
    }
# 4902 "/usr/include/c++/5/bits/basic_string.h" 3
  template<typename _CharT, typename _Traits, typename _Alloc>
    inline bool
    operator==(const basic_string<_CharT, _Traits, _Alloc>& __lhs,
        const basic_string<_CharT, _Traits, _Alloc>& __rhs)
    { return __lhs.compare(__rhs) == 0; }

  template<typename _CharT>
    inline
    typename __gnu_cxx::__enable_if<__is_char<_CharT>::__value, bool>::__type
    operator==(const basic_string<_CharT>& __lhs,
        const basic_string<_CharT>& __rhs)
    { return (__lhs.size() == __rhs.size()
       && !std::char_traits<_CharT>::compare(__lhs.data(), __rhs.data(),
          __lhs.size())); }







  template<typename _CharT, typename _Traits, typename _Alloc>
    inline bool
    operator==(const _CharT* __lhs,
        const basic_string<_CharT, _Traits, _Alloc>& __rhs)
    { return __rhs.compare(__lhs) == 0; }







  template<typename _CharT, typename _Traits, typename _Alloc>
    inline bool
    operator==(const basic_string<_CharT, _Traits, _Alloc>& __lhs,
        const _CharT* __rhs)
    { return __lhs.compare(__rhs) == 0; }
# 4948 "/usr/include/c++/5/bits/basic_string.h" 3
  template<typename _CharT, typename _Traits, typename _Alloc>
    inline bool
    operator!=(const basic_string<_CharT, _Traits, _Alloc>& __lhs,
        const basic_string<_CharT, _Traits, _Alloc>& __rhs)
    { return !(__lhs == __rhs); }







  template<typename _CharT, typename _Traits, typename _Alloc>
    inline bool
    operator!=(const _CharT* __lhs,
        const basic_string<_CharT, _Traits, _Alloc>& __rhs)
    { return !(__lhs == __rhs); }







  template<typename _CharT, typename _Traits, typename _Alloc>
    inline bool
    operator!=(const basic_string<_CharT, _Traits, _Alloc>& __lhs,
        const _CharT* __rhs)
    { return !(__lhs == __rhs); }
# 4985 "/usr/include/c++/5/bits/basic_string.h" 3
  template<typename _CharT, typename _Traits, typename _Alloc>
    inline bool
    operator<(const basic_string<_CharT, _Traits, _Alloc>& __lhs,
       const basic_string<_CharT, _Traits, _Alloc>& __rhs)
    { return __lhs.compare(__rhs) < 0; }







  template<typename _CharT, typename _Traits, typename _Alloc>
    inline bool
    operator<(const basic_string<_CharT, _Traits, _Alloc>& __lhs,
       const _CharT* __rhs)
    { return __lhs.compare(__rhs) < 0; }







  template<typename _CharT, typename _Traits, typename _Alloc>
    inline bool
    operator<(const _CharT* __lhs,
       const basic_string<_CharT, _Traits, _Alloc>& __rhs)
    { return __rhs.compare(__lhs) > 0; }
# 5022 "/usr/include/c++/5/bits/basic_string.h" 3
  template<typename _CharT, typename _Traits, typename _Alloc>
    inline bool
    operator>(const basic_string<_CharT, _Traits, _Alloc>& __lhs,
       const basic_string<_CharT, _Traits, _Alloc>& __rhs)
    { return __lhs.compare(__rhs) > 0; }







  template<typename _CharT, typename _Traits, typename _Alloc>
    inline bool
    operator>(const basic_string<_CharT, _Traits, _Alloc>& __lhs,
       const _CharT* __rhs)
    { return __lhs.compare(__rhs) > 0; }







  template<typename _CharT, typename _Traits, typename _Alloc>
    inline bool
    operator>(const _CharT* __lhs,
       const basic_string<_CharT, _Traits, _Alloc>& __rhs)
    { return __rhs.compare(__lhs) < 0; }
# 5059 "/usr/include/c++/5/bits/basic_string.h" 3
  template<typename _CharT, typename _Traits, typename _Alloc>
    inline bool
    operator<=(const basic_string<_CharT, _Traits, _Alloc>& __lhs,
        const basic_string<_CharT, _Traits, _Alloc>& __rhs)
    { return __lhs.compare(__rhs) <= 0; }







  template<typename _CharT, typename _Traits, typename _Alloc>
    inline bool
    operator<=(const basic_string<_CharT, _Traits, _Alloc>& __lhs,
        const _CharT* __rhs)
    { return __lhs.compare(__rhs) <= 0; }







  template<typename _CharT, typename _Traits, typename _Alloc>
    inline bool
    operator<=(const _CharT* __lhs,
        const basic_string<_CharT, _Traits, _Alloc>& __rhs)
    { return __rhs.compare(__lhs) >= 0; }
# 5096 "/usr/include/c++/5/bits/basic_string.h" 3
  template<typename _CharT, typename _Traits, typename _Alloc>
    inline bool
    operator>=(const basic_string<_CharT, _Traits, _Alloc>& __lhs,
        const basic_string<_CharT, _Traits, _Alloc>& __rhs)
    { return __lhs.compare(__rhs) >= 0; }







  template<typename _CharT, typename _Traits, typename _Alloc>
    inline bool
    operator>=(const basic_string<_CharT, _Traits, _Alloc>& __lhs,
        const _CharT* __rhs)
    { return __lhs.compare(__rhs) >= 0; }







  template<typename _CharT, typename _Traits, typename _Alloc>
    inline bool
    operator>=(const _CharT* __lhs,
      const basic_string<_CharT, _Traits, _Alloc>& __rhs)
    { return __rhs.compare(__lhs) <= 0; }
# 5133 "/usr/include/c++/5/bits/basic_string.h" 3
  template<typename _CharT, typename _Traits, typename _Alloc>
    inline void
    swap(basic_string<_CharT, _Traits, _Alloc>& __lhs,
  basic_string<_CharT, _Traits, _Alloc>& __rhs)
    { __lhs.swap(__rhs); }
# 5152 "/usr/include/c++/5/bits/basic_string.h" 3
  template<typename _CharT, typename _Traits, typename _Alloc>
    basic_istream<_CharT, _Traits>&
    operator>>(basic_istream<_CharT, _Traits>& __is,
        basic_string<_CharT, _Traits, _Alloc>& __str);

  template<>
    basic_istream<char>&
    operator>>(basic_istream<char>& __is, basic_string<char>& __str);
# 5170 "/usr/include/c++/5/bits/basic_string.h" 3
  template<typename _CharT, typename _Traits, typename _Alloc>
    inline basic_ostream<_CharT, _Traits>&
    operator<<(basic_ostream<_CharT, _Traits>& __os,
        const basic_string<_CharT, _Traits, _Alloc>& __str)
    {


      return __ostream_insert(__os, __str.data(), __str.size());
    }
# 5193 "/usr/include/c++/5/bits/basic_string.h" 3
  template<typename _CharT, typename _Traits, typename _Alloc>
    basic_istream<_CharT, _Traits>&
    getline(basic_istream<_CharT, _Traits>& __is,
     basic_string<_CharT, _Traits, _Alloc>& __str, _CharT __delim);
# 5210 "/usr/include/c++/5/bits/basic_string.h" 3
  template<typename _CharT, typename _Traits, typename _Alloc>
    inline basic_istream<_CharT, _Traits>&
    getline(basic_istream<_CharT, _Traits>& __is,
     basic_string<_CharT, _Traits, _Alloc>& __str)
    { return std::getline(__is, __str, __is.widen('\n')); }
# 5232 "/usr/include/c++/5/bits/basic_string.h" 3
  template<>
    basic_istream<char>&
    getline(basic_istream<char>& __in, basic_string<char>& __str,
     char __delim);


  template<>
    basic_istream<wchar_t>&
    getline(basic_istream<wchar_t>& __in, basic_string<wchar_t>& __str,
     wchar_t __delim);



}
# 53 "/usr/include/c++/5/string" 2 3
# 1 "/usr/include/c++/5/bits/basic_string.tcc" 1 3
# 42 "/usr/include/c++/5/bits/basic_string.tcc" 3
       
# 43 "/usr/include/c++/5/bits/basic_string.tcc" 3



namespace std __attribute__ ((__visibility__ ("default")))
{




  template<typename _CharT, typename _Traits, typename _Alloc>
    const typename basic_string<_CharT, _Traits, _Alloc>::size_type
    basic_string<_CharT, _Traits, _Alloc>::npos;

  template<typename _CharT, typename _Traits, typename _Alloc>
    void
    basic_string<_CharT, _Traits, _Alloc>::
    swap(basic_string& __s)
    {
      if (this == &__s)
 return;




      std::__alloc_swap<allocator_type>::_S_do_it(_M_get_allocator(),
        __s._M_get_allocator());

      if (_M_is_local())
 if (__s._M_is_local())
   {
     if (length() && __s.length())
       {
  _CharT __tmp_data[_S_local_capacity + 1];
  traits_type::copy(__tmp_data, __s._M_local_buf,
      _S_local_capacity + 1);
  traits_type::copy(__s._M_local_buf, _M_local_buf,
      _S_local_capacity + 1);
  traits_type::copy(_M_local_buf, __tmp_data,
      _S_local_capacity + 1);
       }
     else if (__s.length())
       {
  traits_type::copy(_M_local_buf, __s._M_local_buf,
      _S_local_capacity + 1);
  _M_length(__s.length());
  __s._M_set_length(0);
  return;
       }
     else if (length())
       {
  traits_type::copy(__s._M_local_buf, _M_local_buf,
      _S_local_capacity + 1);
  __s._M_length(length());
  _M_set_length(0);
  return;
       }
   }
 else
   {
     const size_type __tmp_capacity = __s._M_allocated_capacity;
     traits_type::copy(__s._M_local_buf, _M_local_buf,
         _S_local_capacity + 1);
     _M_data(__s._M_data());
     __s._M_data(__s._M_local_buf);
     _M_capacity(__tmp_capacity);
   }
      else
 {
   const size_type __tmp_capacity = _M_allocated_capacity;
   if (__s._M_is_local())
     {
       traits_type::copy(_M_local_buf, __s._M_local_buf,
    _S_local_capacity + 1);
       __s._M_data(_M_data());
       _M_data(_M_local_buf);
     }
   else
     {
       pointer __tmp_ptr = _M_data();
       _M_data(__s._M_data());
       __s._M_data(__tmp_ptr);
       _M_capacity(__s._M_allocated_capacity);
     }
   __s._M_capacity(__tmp_capacity);
 }

      const size_type __tmp_length = length();
      _M_length(__s.length());
      __s._M_length(__tmp_length);
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    typename basic_string<_CharT, _Traits, _Alloc>::pointer
    basic_string<_CharT, _Traits, _Alloc>::
    _M_create(size_type& __capacity, size_type __old_capacity)
    {


      if (__capacity > max_size())
 std::__throw_length_error(("basic_string::_M_create"));




      if (__capacity > __old_capacity && __capacity < 2 * __old_capacity)
 {
   __capacity = 2 * __old_capacity;

   if (__capacity > max_size())
     __capacity = max_size();
 }



      return _Alloc_traits::allocate(_M_get_allocator(), __capacity + 1);
    }





  template<typename _CharT, typename _Traits, typename _Alloc>
    template<typename _InIterator>
      void
      basic_string<_CharT, _Traits, _Alloc>::
      _M_construct(_InIterator __beg, _InIterator __end,
     std::input_iterator_tag)
      {
 size_type __len = 0;
 size_type __capacity = size_type(_S_local_capacity);

 while (__beg != __end && __len < __capacity)
   {
     _M_data()[__len++] = *__beg;
     ++__beg;
   }

 try
   {
     while (__beg != __end)
       {
  if (__len == __capacity)
    {

      __capacity = __len + 1;
      pointer __another = _M_create(__capacity, __len);
      this->_S_copy(__another, _M_data(), __len);
      _M_dispose();
      _M_data(__another);
      _M_capacity(__capacity);
    }
  _M_data()[__len++] = *__beg;
  ++__beg;
       }
   }
 catch(...)
   {
     _M_dispose();
     throw;
   }

 _M_set_length(__len);
      }

  template<typename _CharT, typename _Traits, typename _Alloc>
    template<typename _InIterator>
      void
      basic_string<_CharT, _Traits, _Alloc>::
      _M_construct(_InIterator __beg, _InIterator __end,
     std::forward_iterator_tag)
      {

 if (__gnu_cxx::__is_null_pointer(__beg) && __beg != __end)
   std::__throw_logic_error(("basic_string::" "_M_construct null not valid")
                                         );

 size_type __dnew = static_cast<size_type>(std::distance(__beg, __end));

 if (__dnew > size_type(_S_local_capacity))
   {
     _M_data(_M_create(__dnew, size_type(0)));
     _M_capacity(__dnew);
   }


 try
   { this->_S_copy_chars(_M_data(), __beg, __end); }
 catch(...)
   {
     _M_dispose();
     throw;
   }

 _M_set_length(__dnew);
      }

  template<typename _CharT, typename _Traits, typename _Alloc>
    void
    basic_string<_CharT, _Traits, _Alloc>::
    _M_construct(size_type __n, _CharT __c)
    {
      if (__n > size_type(_S_local_capacity))
 {
   _M_data(_M_create(__n, size_type(0)));
   _M_capacity(__n);
 }

      if (__n)
 this->_S_assign(_M_data(), __n, __c);

      _M_set_length(__n);
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    void
    basic_string<_CharT, _Traits, _Alloc>::
    _M_assign(const basic_string& __str)
    {
      if (this != &__str)
 {
   const size_type __rsize = __str.length();
   const size_type __capacity = capacity();

   if (__rsize > __capacity)
     {
       size_type __new_capacity = __rsize;
       pointer __tmp = _M_create(__new_capacity, __capacity);
       _M_dispose();
       _M_data(__tmp);
       _M_capacity(__new_capacity);
     }

   if (__rsize)
     this->_S_copy(_M_data(), __str._M_data(), __rsize);

   _M_set_length(__rsize);
 }
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    void
    basic_string<_CharT, _Traits, _Alloc>::
    reserve(size_type __res)
    {

      if (__res < length())
 __res = length();

      const size_type __capacity = capacity();
      if (__res != __capacity)
 {
   if (__res > __capacity
       || __res > size_type(_S_local_capacity))
     {
       pointer __tmp = _M_create(__res, __capacity);
       this->_S_copy(__tmp, _M_data(), length() + 1);
       _M_dispose();
       _M_data(__tmp);
       _M_capacity(__res);
     }
   else if (!_M_is_local())
     {
       this->_S_copy(_M_local_data(), _M_data(), length() + 1);
       _M_destroy(__capacity);
       _M_data(_M_local_data());
     }
 }
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    void
    basic_string<_CharT, _Traits, _Alloc>::
    _M_mutate(size_type __pos, size_type __len1, const _CharT* __s,
       size_type __len2)
    {
      const size_type __how_much = length() - __pos - __len1;

      size_type __new_capacity = length() + __len2 - __len1;
      pointer __r = _M_create(__new_capacity, capacity());

      if (__pos)
 this->_S_copy(__r, _M_data(), __pos);
      if (__s && __len2)
 this->_S_copy(__r + __pos, __s, __len2);
      if (__how_much)
 this->_S_copy(__r + __pos + __len2,
        _M_data() + __pos + __len1, __how_much);

      _M_dispose();
      _M_data(__r);
      _M_capacity(__new_capacity);
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    void
    basic_string<_CharT, _Traits, _Alloc>::
    _M_erase(size_type __pos, size_type __n)
    {
      const size_type __how_much = length() - __pos - __n;

      if (__how_much && __n)
 this->_S_move(_M_data() + __pos, _M_data() + __pos + __n, __how_much);

      _M_set_length(length() - __n);
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    void
    basic_string<_CharT, _Traits, _Alloc>::
    resize(size_type __n, _CharT __c)
    {
      const size_type __size = this->size();
      if (__size < __n)
 this->append(__n - __size, __c);
      else if (__n < __size)
 this->_M_erase(__n, __size - __n);
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    basic_string<_CharT, _Traits, _Alloc>&
    basic_string<_CharT, _Traits, _Alloc>::
    _M_append(const _CharT* __s, size_type __n)
    {
      const size_type __len = __n + this->size();

      if (__len <= this->capacity())
 {
   if (__n)
     this->_S_copy(this->_M_data() + this->size(), __s, __n);
 }
      else
 this->_M_mutate(this->size(), size_type(0), __s, __n);

      this->_M_set_length(__len);
      return *this;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    template<typename _InputIterator>
      basic_string<_CharT, _Traits, _Alloc>&
      basic_string<_CharT, _Traits, _Alloc>::
      _M_replace_dispatch(const_iterator __i1, const_iterator __i2,
     _InputIterator __k1, _InputIterator __k2,
     std::__false_type)
      {
 const basic_string __s(__k1, __k2);
 const size_type __n1 = __i2 - __i1;
 return _M_replace(__i1 - begin(), __n1, __s._M_data(),
     __s.size());
      }

  template<typename _CharT, typename _Traits, typename _Alloc>
    basic_string<_CharT, _Traits, _Alloc>&
    basic_string<_CharT, _Traits, _Alloc>::
    _M_replace_aux(size_type __pos1, size_type __n1, size_type __n2,
     _CharT __c)
    {
      _M_check_length(__n1, __n2, "basic_string::_M_replace_aux");

      const size_type __old_size = this->size();
      const size_type __new_size = __old_size + __n2 - __n1;

      if (__new_size <= this->capacity())
 {
   _CharT* __p = this->_M_data() + __pos1;

   const size_type __how_much = __old_size - __pos1 - __n1;
   if (__how_much && __n1 != __n2)
     this->_S_move(__p + __n2, __p + __n1, __how_much);
 }
      else
 this->_M_mutate(__pos1, __n1, 0, __n2);

      if (__n2)
 this->_S_assign(this->_M_data() + __pos1, __n2, __c);

      this->_M_set_length(__new_size);
      return *this;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    basic_string<_CharT, _Traits, _Alloc>&
    basic_string<_CharT, _Traits, _Alloc>::
    _M_replace(size_type __pos, size_type __len1, const _CharT* __s,
        const size_type __len2)
    {
      _M_check_length(__len1, __len2, "basic_string::_M_replace");

      const size_type __old_size = this->size();
      const size_type __new_size = __old_size + __len2 - __len1;

      if (__new_size <= this->capacity())
 {
   _CharT* __p = this->_M_data() + __pos;

   const size_type __how_much = __old_size - __pos - __len1;
   if (_M_disjunct(__s))
     {
       if (__how_much && __len1 != __len2)
  this->_S_move(__p + __len2, __p + __len1, __how_much);
       if (__len2)
  this->_S_copy(__p, __s, __len2);
     }
   else
     {

       if (__len2 && __len2 <= __len1)
  this->_S_move(__p, __s, __len2);
       if (__how_much && __len1 != __len2)
  this->_S_move(__p + __len2, __p + __len1, __how_much);
       if (__len2 > __len1)
  {
    if (__s + __len2 <= __p + __len1)
      this->_S_move(__p, __s, __len2);
    else if (__s >= __p + __len1)
      this->_S_copy(__p, __s + __len2 - __len1, __len2);
    else
      {
        const size_type __nleft = (__p + __len1) - __s;
        this->_S_move(__p, __s, __nleft);
        this->_S_copy(__p + __nleft, __p + __len2,
        __len2 - __nleft);
      }
  }
     }
 }
      else
 this->_M_mutate(__pos, __len1, __s, __len2);

      this->_M_set_length(__new_size);
      return *this;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    typename basic_string<_CharT, _Traits, _Alloc>::size_type
    basic_string<_CharT, _Traits, _Alloc>::
    copy(_CharT* __s, size_type __n, size_type __pos) const
    {
      _M_check(__pos, "basic_string::copy");
      __n = _M_limit(__pos, __n);
      ;
      if (__n)
 _S_copy(__s, _M_data() + __pos, __n);

      return __n;
    }
# 1149 "/usr/include/c++/5/bits/basic_string.tcc" 3
  template<typename _CharT, typename _Traits, typename _Alloc>
    basic_string<_CharT, _Traits, _Alloc>
    operator+(const _CharT* __lhs,
       const basic_string<_CharT, _Traits, _Alloc>& __rhs)
    {
      ;
      typedef basic_string<_CharT, _Traits, _Alloc> __string_type;
      typedef typename __string_type::size_type __size_type;
      const __size_type __len = _Traits::length(__lhs);
      __string_type __str;
      __str.reserve(__len + __rhs.size());
      __str.append(__lhs, __len);
      __str.append(__rhs);
      return __str;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    basic_string<_CharT, _Traits, _Alloc>
    operator+(_CharT __lhs, const basic_string<_CharT, _Traits, _Alloc>& __rhs)
    {
      typedef basic_string<_CharT, _Traits, _Alloc> __string_type;
      typedef typename __string_type::size_type __size_type;
      __string_type __str;
      const __size_type __len = __rhs.size();
      __str.reserve(__len + 1);
      __str.append(__size_type(1), __lhs);
      __str.append(__rhs);
      return __str;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    typename basic_string<_CharT, _Traits, _Alloc>::size_type
    basic_string<_CharT, _Traits, _Alloc>::
    find(const _CharT* __s, size_type __pos, size_type __n) const
    {
      ;
      const size_type __size = this->size();
      const _CharT* __data = _M_data();

      if (__n == 0)
 return __pos <= __size ? __pos : npos;

      if (__n <= __size)
 {
   for (; __pos <= __size - __n; ++__pos)
     if (traits_type::eq(__data[__pos], __s[0])
  && traits_type::compare(__data + __pos + 1,
     __s + 1, __n - 1) == 0)
       return __pos;
 }
      return npos;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    typename basic_string<_CharT, _Traits, _Alloc>::size_type
    basic_string<_CharT, _Traits, _Alloc>::
    find(_CharT __c, size_type __pos) const
    {
      size_type __ret = npos;
      const size_type __size = this->size();
      if (__pos < __size)
 {
   const _CharT* __data = _M_data();
   const size_type __n = __size - __pos;
   const _CharT* __p = traits_type::find(__data + __pos, __n, __c);
   if (__p)
     __ret = __p - __data;
 }
      return __ret;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    typename basic_string<_CharT, _Traits, _Alloc>::size_type
    basic_string<_CharT, _Traits, _Alloc>::
    rfind(const _CharT* __s, size_type __pos, size_type __n) const
    {
      ;
      const size_type __size = this->size();
      if (__n <= __size)
 {
   __pos = std::min(size_type(__size - __n), __pos);
   const _CharT* __data = _M_data();
   do
     {
       if (traits_type::compare(__data + __pos, __s, __n) == 0)
  return __pos;
     }
   while (__pos-- > 0);
 }
      return npos;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    typename basic_string<_CharT, _Traits, _Alloc>::size_type
    basic_string<_CharT, _Traits, _Alloc>::
    rfind(_CharT __c, size_type __pos) const
    {
      size_type __size = this->size();
      if (__size)
 {
   if (--__size > __pos)
     __size = __pos;
   for (++__size; __size-- > 0; )
     if (traits_type::eq(_M_data()[__size], __c))
       return __size;
 }
      return npos;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    typename basic_string<_CharT, _Traits, _Alloc>::size_type
    basic_string<_CharT, _Traits, _Alloc>::
    find_first_of(const _CharT* __s, size_type __pos, size_type __n) const
    {
      ;
      for (; __n && __pos < this->size(); ++__pos)
 {
   const _CharT* __p = traits_type::find(__s, __n, _M_data()[__pos]);
   if (__p)
     return __pos;
 }
      return npos;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    typename basic_string<_CharT, _Traits, _Alloc>::size_type
    basic_string<_CharT, _Traits, _Alloc>::
    find_last_of(const _CharT* __s, size_type __pos, size_type __n) const
    {
      ;
      size_type __size = this->size();
      if (__size && __n)
 {
   if (--__size > __pos)
     __size = __pos;
   do
     {
       if (traits_type::find(__s, __n, _M_data()[__size]))
  return __size;
     }
   while (__size-- != 0);
 }
      return npos;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    typename basic_string<_CharT, _Traits, _Alloc>::size_type
    basic_string<_CharT, _Traits, _Alloc>::
    find_first_not_of(const _CharT* __s, size_type __pos, size_type __n) const
    {
      ;
      for (; __pos < this->size(); ++__pos)
 if (!traits_type::find(__s, __n, _M_data()[__pos]))
   return __pos;
      return npos;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    typename basic_string<_CharT, _Traits, _Alloc>::size_type
    basic_string<_CharT, _Traits, _Alloc>::
    find_first_not_of(_CharT __c, size_type __pos) const
    {
      for (; __pos < this->size(); ++__pos)
 if (!traits_type::eq(_M_data()[__pos], __c))
   return __pos;
      return npos;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    typename basic_string<_CharT, _Traits, _Alloc>::size_type
    basic_string<_CharT, _Traits, _Alloc>::
    find_last_not_of(const _CharT* __s, size_type __pos, size_type __n) const
    {
      ;
      size_type __size = this->size();
      if (__size)
 {
   if (--__size > __pos)
     __size = __pos;
   do
     {
       if (!traits_type::find(__s, __n, _M_data()[__size]))
  return __size;
     }
   while (__size--);
 }
      return npos;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    typename basic_string<_CharT, _Traits, _Alloc>::size_type
    basic_string<_CharT, _Traits, _Alloc>::
    find_last_not_of(_CharT __c, size_type __pos) const
    {
      size_type __size = this->size();
      if (__size)
 {
   if (--__size > __pos)
     __size = __pos;
   do
     {
       if (!traits_type::eq(_M_data()[__size], __c))
  return __size;
     }
   while (__size--);
 }
      return npos;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    int
    basic_string<_CharT, _Traits, _Alloc>::
    compare(size_type __pos, size_type __n, const basic_string& __str) const
    {
      _M_check(__pos, "basic_string::compare");
      __n = _M_limit(__pos, __n);
      const size_type __osize = __str.size();
      const size_type __len = std::min(__n, __osize);
      int __r = traits_type::compare(_M_data() + __pos, __str.data(), __len);
      if (!__r)
 __r = _S_compare(__n, __osize);
      return __r;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    int
    basic_string<_CharT, _Traits, _Alloc>::
    compare(size_type __pos1, size_type __n1, const basic_string& __str,
     size_type __pos2, size_type __n2) const
    {
      _M_check(__pos1, "basic_string::compare");
      __str._M_check(__pos2, "basic_string::compare");
      __n1 = _M_limit(__pos1, __n1);
      __n2 = __str._M_limit(__pos2, __n2);
      const size_type __len = std::min(__n1, __n2);
      int __r = traits_type::compare(_M_data() + __pos1,
         __str.data() + __pos2, __len);
      if (!__r)
 __r = _S_compare(__n1, __n2);
      return __r;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    int
    basic_string<_CharT, _Traits, _Alloc>::
    compare(const _CharT* __s) const
    {
      ;
      const size_type __size = this->size();
      const size_type __osize = traits_type::length(__s);
      const size_type __len = std::min(__size, __osize);
      int __r = traits_type::compare(_M_data(), __s, __len);
      if (!__r)
 __r = _S_compare(__size, __osize);
      return __r;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    int
    basic_string <_CharT, _Traits, _Alloc>::
    compare(size_type __pos, size_type __n1, const _CharT* __s) const
    {
      ;
      _M_check(__pos, "basic_string::compare");
      __n1 = _M_limit(__pos, __n1);
      const size_type __osize = traits_type::length(__s);
      const size_type __len = std::min(__n1, __osize);
      int __r = traits_type::compare(_M_data() + __pos, __s, __len);
      if (!__r)
 __r = _S_compare(__n1, __osize);
      return __r;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    int
    basic_string <_CharT, _Traits, _Alloc>::
    compare(size_type __pos, size_type __n1, const _CharT* __s,
     size_type __n2) const
    {
      ;
      _M_check(__pos, "basic_string::compare");
      __n1 = _M_limit(__pos, __n1);
      const size_type __len = std::min(__n1, __n2);
      int __r = traits_type::compare(_M_data() + __pos, __s, __len);
      if (!__r)
 __r = _S_compare(__n1, __n2);
      return __r;
    }


  template<typename _CharT, typename _Traits, typename _Alloc>
    basic_istream<_CharT, _Traits>&
    operator>>(basic_istream<_CharT, _Traits>& __in,
        basic_string<_CharT, _Traits, _Alloc>& __str)
    {
      typedef basic_istream<_CharT, _Traits> __istream_type;
      typedef basic_string<_CharT, _Traits, _Alloc> __string_type;
      typedef typename __istream_type::ios_base __ios_base;
      typedef typename __istream_type::int_type __int_type;
      typedef typename __string_type::size_type __size_type;
      typedef ctype<_CharT> __ctype_type;
      typedef typename __ctype_type::ctype_base __ctype_base;

      __size_type __extracted = 0;
      typename __ios_base::iostate __err = __ios_base::goodbit;
      typename __istream_type::sentry __cerb(__in, false);
      if (__cerb)
 {
   try
     {

       __str.erase();
       _CharT __buf[128];
       __size_type __len = 0;
       const streamsize __w = __in.width();
       const __size_type __n = __w > 0 ? static_cast<__size_type>(__w)
                                : __str.max_size();
       const __ctype_type& __ct = use_facet<__ctype_type>(__in.getloc());
       const __int_type __eof = _Traits::eof();
       __int_type __c = __in.rdbuf()->sgetc();

       while (__extracted < __n
       && !_Traits::eq_int_type(__c, __eof)
       && !__ct.is(__ctype_base::space,
     _Traits::to_char_type(__c)))
  {
    if (__len == sizeof(__buf) / sizeof(_CharT))
      {
        __str.append(__buf, sizeof(__buf) / sizeof(_CharT));
        __len = 0;
      }
    __buf[__len++] = _Traits::to_char_type(__c);
    ++__extracted;
    __c = __in.rdbuf()->snextc();
  }
       __str.append(__buf, __len);

       if (_Traits::eq_int_type(__c, __eof))
  __err |= __ios_base::eofbit;
       __in.width(0);
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       __in._M_setstate(__ios_base::badbit);
       throw;
     }
   catch(...)
     {



       __in._M_setstate(__ios_base::badbit);
     }
 }

      if (!__extracted)
 __err |= __ios_base::failbit;
      if (__err)
 __in.setstate(__err);
      return __in;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    basic_istream<_CharT, _Traits>&
    getline(basic_istream<_CharT, _Traits>& __in,
     basic_string<_CharT, _Traits, _Alloc>& __str, _CharT __delim)
    {
      typedef basic_istream<_CharT, _Traits> __istream_type;
      typedef basic_string<_CharT, _Traits, _Alloc> __string_type;
      typedef typename __istream_type::ios_base __ios_base;
      typedef typename __istream_type::int_type __int_type;
      typedef typename __string_type::size_type __size_type;

      __size_type __extracted = 0;
      const __size_type __n = __str.max_size();
      typename __ios_base::iostate __err = __ios_base::goodbit;
      typename __istream_type::sentry __cerb(__in, true);
      if (__cerb)
 {
   try
     {
       __str.erase();
       const __int_type __idelim = _Traits::to_int_type(__delim);
       const __int_type __eof = _Traits::eof();
       __int_type __c = __in.rdbuf()->sgetc();

       while (__extracted < __n
       && !_Traits::eq_int_type(__c, __eof)
       && !_Traits::eq_int_type(__c, __idelim))
  {
    __str += _Traits::to_char_type(__c);
    ++__extracted;
    __c = __in.rdbuf()->snextc();
  }

       if (_Traits::eq_int_type(__c, __eof))
  __err |= __ios_base::eofbit;
       else if (_Traits::eq_int_type(__c, __idelim))
  {
    ++__extracted;
    __in.rdbuf()->sbumpc();
  }
       else
  __err |= __ios_base::failbit;
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       __in._M_setstate(__ios_base::badbit);
       throw;
     }
   catch(...)
     {



       __in._M_setstate(__ios_base::badbit);
     }
 }
      if (!__extracted)
 __err |= __ios_base::failbit;
      if (__err)
 __in.setstate(__err);
      return __in;
    }




  extern template class basic_string<char>;
  extern template
    basic_istream<char>&
    operator>>(basic_istream<char>&, string&);
  extern template
    basic_ostream<char>&
    operator<<(basic_ostream<char>&, const string&);
  extern template
    basic_istream<char>&
    getline(basic_istream<char>&, string&, char);
  extern template
    basic_istream<char>&
    getline(basic_istream<char>&, string&);


  extern template class basic_string<wchar_t>;
  extern template
    basic_istream<wchar_t>&
    operator>>(basic_istream<wchar_t>&, wstring&);
  extern template
    basic_ostream<wchar_t>&
    operator<<(basic_ostream<wchar_t>&, const wstring&);
  extern template
    basic_istream<wchar_t>&
    getline(basic_istream<wchar_t>&, wstring&, wchar_t);
  extern template
    basic_istream<wchar_t>&
    getline(basic_istream<wchar_t>&, wstring&);




}
# 54 "/usr/include/c++/5/string" 2 3
# 4 "localMinima.cpp" 2
# 1 "/usr/include/c++/5/iostream" 1 3
# 36 "/usr/include/c++/5/iostream" 3
       
# 37 "/usr/include/c++/5/iostream" 3


# 1 "/usr/include/c++/5/ostream" 1 3
# 36 "/usr/include/c++/5/ostream" 3
       
# 37 "/usr/include/c++/5/ostream" 3

# 1 "/usr/include/c++/5/ios" 1 3
# 36 "/usr/include/c++/5/ios" 3
       
# 37 "/usr/include/c++/5/ios" 3





# 1 "/usr/include/c++/5/bits/ios_base.h" 1 3
# 37 "/usr/include/c++/5/bits/ios_base.h" 3
       
# 38 "/usr/include/c++/5/bits/ios_base.h" 3



# 1 "/usr/include/c++/5/bits/locale_classes.h" 1 3
# 37 "/usr/include/c++/5/bits/locale_classes.h" 3
       
# 38 "/usr/include/c++/5/bits/locale_classes.h" 3





namespace std __attribute__ ((__visibility__ ("default")))
{

# 62 "/usr/include/c++/5/bits/locale_classes.h" 3
  class locale
  {
  public:


    typedef int category;


    class facet;
    class id;
    class _Impl;

    friend class facet;
    friend class _Impl;

    template<typename _Facet>
      friend bool
      has_facet(const locale&) throw();

    template<typename _Facet>
      friend const _Facet&
      use_facet(const locale&);

    template<typename _Cache>
      friend struct __use_cache;
# 98 "/usr/include/c++/5/bits/locale_classes.h" 3
    static const category none = 0;
    static const category ctype = 1L << 0;
    static const category numeric = 1L << 1;
    static const category collate = 1L << 2;
    static const category time = 1L << 3;
    static const category monetary = 1L << 4;
    static const category messages = 1L << 5;
    static const category all = (ctype | numeric | collate |
        time | monetary | messages);
# 117 "/usr/include/c++/5/bits/locale_classes.h" 3
    locale() throw();
# 126 "/usr/include/c++/5/bits/locale_classes.h" 3
    locale(const locale& __other) throw();
# 136 "/usr/include/c++/5/bits/locale_classes.h" 3
    explicit
    locale(const char* __s);
# 151 "/usr/include/c++/5/bits/locale_classes.h" 3
    locale(const locale& __base, const char* __s, category __cat);
# 192 "/usr/include/c++/5/bits/locale_classes.h" 3
    locale(const locale& __base, const locale& __add, category __cat);
# 205 "/usr/include/c++/5/bits/locale_classes.h" 3
    template<typename _Facet>
      locale(const locale& __other, _Facet* __f);


    ~locale() throw();
# 219 "/usr/include/c++/5/bits/locale_classes.h" 3
    const locale&
    operator=(const locale& __other) throw();
# 234 "/usr/include/c++/5/bits/locale_classes.h" 3
    template<typename _Facet>
      locale
      combine(const locale& __other) const;






    __attribute ((__abi_tag__ ("cxx11")))
    string
    name() const;
# 254 "/usr/include/c++/5/bits/locale_classes.h" 3
    bool
    operator==(const locale& __other) const throw();







    bool
    operator!=(const locale& __other) const throw()
    { return !(this->operator==(__other)); }
# 282 "/usr/include/c++/5/bits/locale_classes.h" 3
    template<typename _Char, typename _Traits, typename _Alloc>
      bool
      operator()(const basic_string<_Char, _Traits, _Alloc>& __s1,
   const basic_string<_Char, _Traits, _Alloc>& __s2) const;
# 298 "/usr/include/c++/5/bits/locale_classes.h" 3
    static locale
    global(const locale& __loc);




    static const locale&
    classic();

  private:

    _Impl* _M_impl;


    static _Impl* _S_classic;


    static _Impl* _S_global;





    static const char* const* const _S_categories;
# 333 "/usr/include/c++/5/bits/locale_classes.h" 3
    enum { _S_categories_size = 6 + 6 };


    static __gthread_once_t _S_once;


    explicit
    locale(_Impl*) throw();

    static void
    _S_initialize();

    static void
    _S_initialize_once() throw();

    static category
    _S_normalize_category(category);

    void
    _M_coalesce(const locale& __base, const locale& __add, category __cat);


    static const id* const _S_twinned_facets[];

  };
# 371 "/usr/include/c++/5/bits/locale_classes.h" 3
  class locale::facet
  {
  private:
    friend class locale;
    friend class locale::_Impl;

    mutable _Atomic_word _M_refcount;


    static __c_locale _S_c_locale;


    static const char _S_c_name[2];


    static __gthread_once_t _S_once;


    static void
    _S_initialize_once();

  protected:
# 402 "/usr/include/c++/5/bits/locale_classes.h" 3
    explicit
    facet(size_t __refs = 0) throw() : _M_refcount(__refs ? 1 : 0)
    { }


    virtual
    ~facet();

    static void
    _S_create_c_locale(__c_locale& __cloc, const char* __s,
         __c_locale __old = 0);

    static __c_locale
    _S_clone_c_locale(__c_locale& __cloc) throw();

    static void
    _S_destroy_c_locale(__c_locale& __cloc);

    static __c_locale
    _S_lc_ctype_c_locale(__c_locale __cloc, const char* __s);



    static __c_locale
    _S_get_c_locale();

    __attribute__ ((__const__)) static const char*
    _S_get_c_name() throw();

  private:
    void
    _M_add_reference() const throw()
    { __gnu_cxx::__atomic_add_dispatch(&_M_refcount, 1); }

    void
    _M_remove_reference() const throw()
    {

      ;
      if (__gnu_cxx::__exchange_and_add_dispatch(&_M_refcount, -1) == 1)
 {
          ;
   try
     { delete this; }
   catch(...)
     { }
 }
    }

    facet(const facet&);

    facet&
    operator=(const facet&);

    class __shim;

    const facet* _M_sso_shim(const id*) const;
    const facet* _M_cow_shim(const id*) const;
  };
# 474 "/usr/include/c++/5/bits/locale_classes.h" 3
  class locale::id
  {
  private:
    friend class locale;
    friend class locale::_Impl;

    template<typename _Facet>
      friend const _Facet&
      use_facet(const locale&);

    template<typename _Facet>
      friend bool
      has_facet(const locale&) throw();




    mutable size_t _M_index;


    static _Atomic_word _S_refcount;

    void
    operator=(const id&);

    id(const id&);

  public:



    id() { }

    size_t
    _M_id() const throw();
  };



  class locale::_Impl
  {
  public:

    friend class locale;
    friend class locale::facet;

    template<typename _Facet>
      friend bool
      has_facet(const locale&) throw();

    template<typename _Facet>
      friend const _Facet&
      use_facet(const locale&);

    template<typename _Cache>
      friend struct __use_cache;

  private:

    _Atomic_word _M_refcount;
    const facet** _M_facets;
    size_t _M_facets_size;
    const facet** _M_caches;
    char** _M_names;
    static const locale::id* const _S_id_ctype[];
    static const locale::id* const _S_id_numeric[];
    static const locale::id* const _S_id_collate[];
    static const locale::id* const _S_id_time[];
    static const locale::id* const _S_id_monetary[];
    static const locale::id* const _S_id_messages[];
    static const locale::id* const* const _S_facet_categories[];

    void
    _M_add_reference() throw()
    { __gnu_cxx::__atomic_add_dispatch(&_M_refcount, 1); }

    void
    _M_remove_reference() throw()
    {

      ;
      if (__gnu_cxx::__exchange_and_add_dispatch(&_M_refcount, -1) == 1)
 {
          ;
   try
     { delete this; }
   catch(...)
     { }
 }
    }

    _Impl(const _Impl&, size_t);
    _Impl(const char*, size_t);
    _Impl(size_t) throw();

   ~_Impl() throw();

    _Impl(const _Impl&);

    void
    operator=(const _Impl&);

    bool
    _M_check_same_name()
    {
      bool __ret = true;
      if (_M_names[1])

 for (size_t __i = 0; __ret && __i < _S_categories_size - 1; ++__i)
   __ret = __builtin_strcmp(_M_names[__i], _M_names[__i + 1]) == 0;
      return __ret;
    }

    void
    _M_replace_categories(const _Impl*, category);

    void
    _M_replace_category(const _Impl*, const locale::id* const*);

    void
    _M_replace_facet(const _Impl*, const locale::id*);

    void
    _M_install_facet(const locale::id*, const facet*);

    template<typename _Facet>
      void
      _M_init_facet(_Facet* __facet)
      { _M_install_facet(&_Facet::id, __facet); }

    template<typename _Facet>
      void
      _M_init_facet_unchecked(_Facet* __facet)
      {
 __facet->_M_add_reference();
 _M_facets[_Facet::id._M_id()] = __facet;
      }

    void
    _M_install_cache(const facet*, size_t);

    void _M_init_extra(facet**);
    void _M_init_extra(void*, void*, const char*, const char*);
  };
# 632 "/usr/include/c++/5/bits/locale_classes.h" 3
  template<typename _CharT>
    class __cxx11:: collate : public locale::facet
    {
    public:



      typedef _CharT char_type;
      typedef basic_string<_CharT> string_type;


    protected:


      __c_locale _M_c_locale_collate;

    public:

      static locale::id id;
# 659 "/usr/include/c++/5/bits/locale_classes.h" 3
      explicit
      collate(size_t __refs = 0)
      : facet(__refs), _M_c_locale_collate(_S_get_c_locale())
      { }
# 673 "/usr/include/c++/5/bits/locale_classes.h" 3
      explicit
      collate(__c_locale __cloc, size_t __refs = 0)
      : facet(__refs), _M_c_locale_collate(_S_clone_c_locale(__cloc))
      { }
# 690 "/usr/include/c++/5/bits/locale_classes.h" 3
      int
      compare(const _CharT* __lo1, const _CharT* __hi1,
       const _CharT* __lo2, const _CharT* __hi2) const
      { return this->do_compare(__lo1, __hi1, __lo2, __hi2); }
# 709 "/usr/include/c++/5/bits/locale_classes.h" 3
      string_type
      transform(const _CharT* __lo, const _CharT* __hi) const
      { return this->do_transform(__lo, __hi); }
# 723 "/usr/include/c++/5/bits/locale_classes.h" 3
      long
      hash(const _CharT* __lo, const _CharT* __hi) const
      { return this->do_hash(__lo, __hi); }


      int
      _M_compare(const _CharT*, const _CharT*) const throw();

      size_t
      _M_transform(_CharT*, const _CharT*, size_t) const throw();

  protected:

      virtual
      ~collate()
      { _S_destroy_c_locale(_M_c_locale_collate); }
# 752 "/usr/include/c++/5/bits/locale_classes.h" 3
      virtual int
      do_compare(const _CharT* __lo1, const _CharT* __hi1,
   const _CharT* __lo2, const _CharT* __hi2) const;
# 766 "/usr/include/c++/5/bits/locale_classes.h" 3
      virtual string_type
      do_transform(const _CharT* __lo, const _CharT* __hi) const;
# 779 "/usr/include/c++/5/bits/locale_classes.h" 3
      virtual long
      do_hash(const _CharT* __lo, const _CharT* __hi) const;
    };

  template<typename _CharT>
    locale::id collate<_CharT>::id;


  template<>
    int
    collate<char>::_M_compare(const char*, const char*) const throw();

  template<>
    size_t
    collate<char>::_M_transform(char*, const char*, size_t) const throw();


  template<>
    int
    collate<wchar_t>::_M_compare(const wchar_t*, const wchar_t*) const throw();

  template<>
    size_t
    collate<wchar_t>::_M_transform(wchar_t*, const wchar_t*, size_t) const throw();



  template<typename _CharT>
    class __cxx11:: collate_byname : public collate<_CharT>
    {
    public:


      typedef _CharT char_type;
      typedef basic_string<_CharT> string_type;


      explicit
      collate_byname(const char* __s, size_t __refs = 0)
      : collate<_CharT>(__refs)
      {
 if (__builtin_strcmp(__s, "C") != 0
     && __builtin_strcmp(__s, "POSIX") != 0)
   {
     this->_S_destroy_c_locale(this->_M_c_locale_collate);
     this->_S_create_c_locale(this->_M_c_locale_collate, __s);
   }
      }







    protected:
      virtual
      ~collate_byname() { }
    };


}

# 1 "/usr/include/c++/5/bits/locale_classes.tcc" 1 3
# 37 "/usr/include/c++/5/bits/locale_classes.tcc" 3
       
# 38 "/usr/include/c++/5/bits/locale_classes.tcc" 3

namespace std __attribute__ ((__visibility__ ("default")))
{


  template<typename _Facet>
    locale::
    locale(const locale& __other, _Facet* __f)
    {
      _M_impl = new _Impl(*__other._M_impl, 1);

      try
 { _M_impl->_M_install_facet(&_Facet::id, __f); }
      catch(...)
 {
   _M_impl->_M_remove_reference();
   throw;
 }
      delete [] _M_impl->_M_names[0];
      _M_impl->_M_names[0] = 0;
    }

  template<typename _Facet>
    locale
    locale::
    combine(const locale& __other) const
    {
      _Impl* __tmp = new _Impl(*_M_impl, 1);
      try
 {
   __tmp->_M_replace_facet(__other._M_impl, &_Facet::id);
 }
      catch(...)
 {
   __tmp->_M_remove_reference();
   throw;
 }
      return locale(__tmp);
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    bool
    locale::
    operator()(const basic_string<_CharT, _Traits, _Alloc>& __s1,
        const basic_string<_CharT, _Traits, _Alloc>& __s2) const
    {
      typedef std::collate<_CharT> __collate_type;
      const __collate_type& __collate = use_facet<__collate_type>(*this);
      return (__collate.compare(__s1.data(), __s1.data() + __s1.length(),
    __s2.data(), __s2.data() + __s2.length()) < 0);
    }
# 102 "/usr/include/c++/5/bits/locale_classes.tcc" 3
  template<typename _Facet>
    bool
    has_facet(const locale& __loc) throw()
    {
      const size_t __i = _Facet::id._M_id();
      const locale::facet** __facets = __loc._M_impl->_M_facets;
      return (__i < __loc._M_impl->_M_facets_size

       && dynamic_cast<const _Facet*>(__facets[__i]));



    }
# 130 "/usr/include/c++/5/bits/locale_classes.tcc" 3
  template<typename _Facet>
    const _Facet&
    use_facet(const locale& __loc)
    {
      const size_t __i = _Facet::id._M_id();
      const locale::facet** __facets = __loc._M_impl->_M_facets;
      if (__i >= __loc._M_impl->_M_facets_size || !__facets[__i])
        __throw_bad_cast();

      return dynamic_cast<const _Facet&>(*__facets[__i]);



    }



  template<typename _CharT>
    int
    collate<_CharT>::_M_compare(const _CharT*, const _CharT*) const throw ()
    { return 0; }


  template<typename _CharT>
    size_t
    collate<_CharT>::_M_transform(_CharT*, const _CharT*, size_t) const throw ()
    { return 0; }

  template<typename _CharT>
    int
    collate<_CharT>::
    do_compare(const _CharT* __lo1, const _CharT* __hi1,
        const _CharT* __lo2, const _CharT* __hi2) const
    {


      const string_type __one(__lo1, __hi1);
      const string_type __two(__lo2, __hi2);

      const _CharT* __p = __one.c_str();
      const _CharT* __pend = __one.data() + __one.length();
      const _CharT* __q = __two.c_str();
      const _CharT* __qend = __two.data() + __two.length();




      for (;;)
 {
   const int __res = _M_compare(__p, __q);
   if (__res)
     return __res;

   __p += char_traits<_CharT>::length(__p);
   __q += char_traits<_CharT>::length(__q);
   if (__p == __pend && __q == __qend)
     return 0;
   else if (__p == __pend)
     return -1;
   else if (__q == __qend)
     return 1;

   __p++;
   __q++;
 }
    }

  template<typename _CharT>
    typename collate<_CharT>::string_type
    collate<_CharT>::
    do_transform(const _CharT* __lo, const _CharT* __hi) const
    {
      string_type __ret;


      const string_type __str(__lo, __hi);

      const _CharT* __p = __str.c_str();
      const _CharT* __pend = __str.data() + __str.length();

      size_t __len = (__hi - __lo) * 2;

      _CharT* __c = new _CharT[__len];

      try
 {



   for (;;)
     {

       size_t __res = _M_transform(__c, __p, __len);


       if (__res >= __len)
  {
    __len = __res + 1;
    delete [] __c, __c = 0;
    __c = new _CharT[__len];
    __res = _M_transform(__c, __p, __len);
  }

       __ret.append(__c, __res);
       __p += char_traits<_CharT>::length(__p);
       if (__p == __pend)
  break;

       __p++;
       __ret.push_back(_CharT());
     }
 }
      catch(...)
 {
   delete [] __c;
   throw;
 }

      delete [] __c;

      return __ret;
    }

  template<typename _CharT>
    long
    collate<_CharT>::
    do_hash(const _CharT* __lo, const _CharT* __hi) const
    {
      unsigned long __val = 0;
      for (; __lo < __hi; ++__lo)
 __val =
   *__lo + ((__val << 7)
     | (__val >> (__gnu_cxx::__numeric_traits<unsigned long>::
    __digits - 7)));
      return static_cast<long>(__val);
    }




  extern template class collate<char>;
  extern template class collate_byname<char>;

  extern template
    const collate<char>&
    use_facet<collate<char> >(const locale&);

  extern template
    bool
    has_facet<collate<char> >(const locale&);


  extern template class collate<wchar_t>;
  extern template class collate_byname<wchar_t>;

  extern template
    const collate<wchar_t>&
    use_facet<collate<wchar_t> >(const locale&);

  extern template
    bool
    has_facet<collate<wchar_t> >(const locale&);




}
# 843 "/usr/include/c++/5/bits/locale_classes.h" 2 3
# 42 "/usr/include/c++/5/bits/ios_base.h" 2 3


# 1 "/usr/include/c++/5/stdexcept" 1 3
# 36 "/usr/include/c++/5/stdexcept" 3
       
# 37 "/usr/include/c++/5/stdexcept" 3




namespace std __attribute__ ((__visibility__ ("default")))
{





  struct __cow_string
  {
    union {
      const char* _M_p;
      char _M_bytes[sizeof(const char*)];
    };

    __cow_string();
    __cow_string(const std::string&);
    __cow_string(const char*, size_t);
    __cow_string(const __cow_string&) throw();
    __cow_string& operator=(const __cow_string&) throw();
    ~__cow_string();




  };

  typedef basic_string<char> __sso_string;
# 113 "/usr/include/c++/5/stdexcept" 3
  class logic_error : public exception
  {
    __cow_string _M_msg;

  public:

    explicit
    logic_error(const string& __arg);







    logic_error(const logic_error&) throw();
    logic_error& operator=(const logic_error&) throw();


    virtual ~logic_error() throw();



    virtual const char*
    what() const throw();
  };



  class domain_error : public logic_error
  {
  public:
    explicit domain_error(const string& __arg);



    virtual ~domain_error() throw();
  };


  class invalid_argument : public logic_error
  {
  public:
    explicit invalid_argument(const string& __arg);



    virtual ~invalid_argument() throw();
  };



  class length_error : public logic_error
  {
  public:
    explicit length_error(const string& __arg);



    virtual ~length_error() throw();
  };



  class out_of_range : public logic_error
  {
  public:
    explicit out_of_range(const string& __arg);



    virtual ~out_of_range() throw();
  };






  class runtime_error : public exception
  {
    __cow_string _M_msg;

  public:

    explicit
    runtime_error(const string& __arg);







    runtime_error(const runtime_error&) throw();
    runtime_error& operator=(const runtime_error&) throw();


    virtual ~runtime_error() throw();



    virtual const char*
    what() const throw();
  };


  class range_error : public runtime_error
  {
  public:
    explicit range_error(const string& __arg);



    virtual ~range_error() throw();
  };


  class overflow_error : public runtime_error
  {
  public:
    explicit overflow_error(const string& __arg);



    virtual ~overflow_error() throw();
  };


  class underflow_error : public runtime_error
  {
  public:
    explicit underflow_error(const string& __arg);



    virtual ~underflow_error() throw();
  };




}
# 45 "/usr/include/c++/5/bits/ios_base.h" 2 3




namespace std __attribute__ ((__visibility__ ("default")))
{






  enum _Ios_Fmtflags
    {
      _S_boolalpha = 1L << 0,
      _S_dec = 1L << 1,
      _S_fixed = 1L << 2,
      _S_hex = 1L << 3,
      _S_internal = 1L << 4,
      _S_left = 1L << 5,
      _S_oct = 1L << 6,
      _S_right = 1L << 7,
      _S_scientific = 1L << 8,
      _S_showbase = 1L << 9,
      _S_showpoint = 1L << 10,
      _S_showpos = 1L << 11,
      _S_skipws = 1L << 12,
      _S_unitbuf = 1L << 13,
      _S_uppercase = 1L << 14,
      _S_adjustfield = _S_left | _S_right | _S_internal,
      _S_basefield = _S_dec | _S_oct | _S_hex,
      _S_floatfield = _S_scientific | _S_fixed,
      _S_ios_fmtflags_end = 1L << 16,
      _S_ios_fmtflags_max = 0x7fffffff,
      _S_ios_fmtflags_min = ~0x7fffffff
    };

  inline _Ios_Fmtflags
  operator&(_Ios_Fmtflags __a, _Ios_Fmtflags __b)
  { return _Ios_Fmtflags(static_cast<int>(__a) & static_cast<int>(__b)); }

  inline _Ios_Fmtflags
  operator|(_Ios_Fmtflags __a, _Ios_Fmtflags __b)
  { return _Ios_Fmtflags(static_cast<int>(__a) | static_cast<int>(__b)); }

  inline _Ios_Fmtflags
  operator^(_Ios_Fmtflags __a, _Ios_Fmtflags __b)
  { return _Ios_Fmtflags(static_cast<int>(__a) ^ static_cast<int>(__b)); }

  inline _Ios_Fmtflags
  operator~(_Ios_Fmtflags __a)
  { return _Ios_Fmtflags(~static_cast<int>(__a)); }

  inline const _Ios_Fmtflags&
  operator|=(_Ios_Fmtflags& __a, _Ios_Fmtflags __b)
  { return __a = __a | __b; }

  inline const _Ios_Fmtflags&
  operator&=(_Ios_Fmtflags& __a, _Ios_Fmtflags __b)
  { return __a = __a & __b; }

  inline const _Ios_Fmtflags&
  operator^=(_Ios_Fmtflags& __a, _Ios_Fmtflags __b)
  { return __a = __a ^ __b; }


  enum _Ios_Openmode
    {
      _S_app = 1L << 0,
      _S_ate = 1L << 1,
      _S_bin = 1L << 2,
      _S_in = 1L << 3,
      _S_out = 1L << 4,
      _S_trunc = 1L << 5,
      _S_ios_openmode_end = 1L << 16,
      _S_ios_openmode_max = 0x7fffffff,
      _S_ios_openmode_min = ~0x7fffffff
    };

  inline _Ios_Openmode
  operator&(_Ios_Openmode __a, _Ios_Openmode __b)
  { return _Ios_Openmode(static_cast<int>(__a) & static_cast<int>(__b)); }

  inline _Ios_Openmode
  operator|(_Ios_Openmode __a, _Ios_Openmode __b)
  { return _Ios_Openmode(static_cast<int>(__a) | static_cast<int>(__b)); }

  inline _Ios_Openmode
  operator^(_Ios_Openmode __a, _Ios_Openmode __b)
  { return _Ios_Openmode(static_cast<int>(__a) ^ static_cast<int>(__b)); }

  inline _Ios_Openmode
  operator~(_Ios_Openmode __a)
  { return _Ios_Openmode(~static_cast<int>(__a)); }

  inline const _Ios_Openmode&
  operator|=(_Ios_Openmode& __a, _Ios_Openmode __b)
  { return __a = __a | __b; }

  inline const _Ios_Openmode&
  operator&=(_Ios_Openmode& __a, _Ios_Openmode __b)
  { return __a = __a & __b; }

  inline const _Ios_Openmode&
  operator^=(_Ios_Openmode& __a, _Ios_Openmode __b)
  { return __a = __a ^ __b; }


  enum _Ios_Iostate
    {
      _S_goodbit = 0,
      _S_badbit = 1L << 0,
      _S_eofbit = 1L << 1,
      _S_failbit = 1L << 2,
      _S_ios_iostate_end = 1L << 16,
      _S_ios_iostate_max = 0x7fffffff,
      _S_ios_iostate_min = ~0x7fffffff
    };

  inline _Ios_Iostate
  operator&(_Ios_Iostate __a, _Ios_Iostate __b)
  { return _Ios_Iostate(static_cast<int>(__a) & static_cast<int>(__b)); }

  inline _Ios_Iostate
  operator|(_Ios_Iostate __a, _Ios_Iostate __b)
  { return _Ios_Iostate(static_cast<int>(__a) | static_cast<int>(__b)); }

  inline _Ios_Iostate
  operator^(_Ios_Iostate __a, _Ios_Iostate __b)
  { return _Ios_Iostate(static_cast<int>(__a) ^ static_cast<int>(__b)); }

  inline _Ios_Iostate
  operator~(_Ios_Iostate __a)
  { return _Ios_Iostate(~static_cast<int>(__a)); }

  inline const _Ios_Iostate&
  operator|=(_Ios_Iostate& __a, _Ios_Iostate __b)
  { return __a = __a | __b; }

  inline const _Ios_Iostate&
  operator&=(_Ios_Iostate& __a, _Ios_Iostate __b)
  { return __a = __a & __b; }

  inline const _Ios_Iostate&
  operator^=(_Ios_Iostate& __a, _Ios_Iostate __b)
  { return __a = __a ^ __b; }


  enum _Ios_Seekdir
    {
      _S_beg = 0,
      _S_cur = 1,
      _S_end = 2,
      _S_ios_seekdir_end = 1L << 16
    };
# 228 "/usr/include/c++/5/bits/ios_base.h" 3
  class ios_base
  {



    struct system_error : std::runtime_error
    {

      struct error_code
      {
 error_code() { }
      private:
 int _M_value;
 const void* _M_cat;
      } _M_code;
    };


  public:
# 255 "/usr/include/c++/5/bits/ios_base.h" 3
    class __attribute ((__abi_tag__ ("cxx11"))) failure : public system_error
    {
    public:
      explicit
      failure(const string& __str);
# 269 "/usr/include/c++/5/bits/ios_base.h" 3
      virtual
      ~failure() throw();

      virtual const char*
      what() const throw();
    };
# 323 "/usr/include/c++/5/bits/ios_base.h" 3
    typedef _Ios_Fmtflags fmtflags;


    static const fmtflags boolalpha = _S_boolalpha;


    static const fmtflags dec = _S_dec;


    static const fmtflags fixed = _S_fixed;


    static const fmtflags hex = _S_hex;




    static const fmtflags internal = _S_internal;



    static const fmtflags left = _S_left;


    static const fmtflags oct = _S_oct;



    static const fmtflags right = _S_right;


    static const fmtflags scientific = _S_scientific;



    static const fmtflags showbase = _S_showbase;



    static const fmtflags showpoint = _S_showpoint;


    static const fmtflags showpos = _S_showpos;


    static const fmtflags skipws = _S_skipws;


    static const fmtflags unitbuf = _S_unitbuf;



    static const fmtflags uppercase = _S_uppercase;


    static const fmtflags adjustfield = _S_adjustfield;


    static const fmtflags basefield = _S_basefield;


    static const fmtflags floatfield = _S_floatfield;
# 398 "/usr/include/c++/5/bits/ios_base.h" 3
    typedef _Ios_Iostate iostate;



    static const iostate badbit = _S_badbit;


    static const iostate eofbit = _S_eofbit;




    static const iostate failbit = _S_failbit;


    static const iostate goodbit = _S_goodbit;
# 429 "/usr/include/c++/5/bits/ios_base.h" 3
    typedef _Ios_Openmode openmode;


    static const openmode app = _S_app;


    static const openmode ate = _S_ate;




    static const openmode binary = _S_bin;


    static const openmode in = _S_in;


    static const openmode out = _S_out;


    static const openmode trunc = _S_trunc;
# 461 "/usr/include/c++/5/bits/ios_base.h" 3
    typedef _Ios_Seekdir seekdir;


    static const seekdir beg = _S_beg;


    static const seekdir cur = _S_cur;


    static const seekdir end = _S_end;


    typedef int io_state;
    typedef int open_mode;
    typedef int seek_dir;

    typedef std::streampos streampos;
    typedef std::streamoff streamoff;
# 487 "/usr/include/c++/5/bits/ios_base.h" 3
    enum event
    {
      erase_event,
      imbue_event,
      copyfmt_event
    };
# 504 "/usr/include/c++/5/bits/ios_base.h" 3
    typedef void (*event_callback) (event __e, ios_base& __b, int __i);
# 516 "/usr/include/c++/5/bits/ios_base.h" 3
    void
    register_callback(event_callback __fn, int __index);

  protected:
    streamsize _M_precision;
    streamsize _M_width;
    fmtflags _M_flags;
    iostate _M_exception;
    iostate _M_streambuf_state;



    struct _Callback_list
    {

      _Callback_list* _M_next;
      ios_base::event_callback _M_fn;
      int _M_index;
      _Atomic_word _M_refcount;

      _Callback_list(ios_base::event_callback __fn, int __index,
       _Callback_list* __cb)
      : _M_next(__cb), _M_fn(__fn), _M_index(__index), _M_refcount(0) { }

      void
      _M_add_reference() { __gnu_cxx::__atomic_add_dispatch(&_M_refcount, 1); }


      int
      _M_remove_reference()
      {

        ;
        int __res = __gnu_cxx::__exchange_and_add_dispatch(&_M_refcount, -1);
        if (__res == 0)
          {
            ;
          }
        return __res;
      }
    };

     _Callback_list* _M_callbacks;

    void
    _M_call_callbacks(event __ev) throw();

    void
    _M_dispose_callbacks(void) throw();


    struct _Words
    {
      void* _M_pword;
      long _M_iword;
      _Words() : _M_pword(0), _M_iword(0) { }
    };


    _Words _M_word_zero;



    enum { _S_local_word_size = 8 };
    _Words _M_local_word[_S_local_word_size];


    int _M_word_size;
    _Words* _M_word;

    _Words&
    _M_grow_words(int __index, bool __iword);


    locale _M_ios_locale;

    void
    _M_init() throw();

  public:





    class Init
    {
      friend class ios_base;
    public:
      Init();
      ~Init();

    private:
      static _Atomic_word _S_refcount;
      static bool _S_synced_with_stdio;
    };






    fmtflags
    flags() const
    { return _M_flags; }
# 629 "/usr/include/c++/5/bits/ios_base.h" 3
    fmtflags
    flags(fmtflags __fmtfl)
    {
      fmtflags __old = _M_flags;
      _M_flags = __fmtfl;
      return __old;
    }
# 645 "/usr/include/c++/5/bits/ios_base.h" 3
    fmtflags
    setf(fmtflags __fmtfl)
    {
      fmtflags __old = _M_flags;
      _M_flags |= __fmtfl;
      return __old;
    }
# 662 "/usr/include/c++/5/bits/ios_base.h" 3
    fmtflags
    setf(fmtflags __fmtfl, fmtflags __mask)
    {
      fmtflags __old = _M_flags;
      _M_flags &= ~__mask;
      _M_flags |= (__fmtfl & __mask);
      return __old;
    }







    void
    unsetf(fmtflags __mask)
    { _M_flags &= ~__mask; }
# 688 "/usr/include/c++/5/bits/ios_base.h" 3
    streamsize
    precision() const
    { return _M_precision; }






    streamsize
    precision(streamsize __prec)
    {
      streamsize __old = _M_precision;
      _M_precision = __prec;
      return __old;
    }







    streamsize
    width() const
    { return _M_width; }






    streamsize
    width(streamsize __wide)
    {
      streamsize __old = _M_width;
      _M_width = __wide;
      return __old;
    }
# 739 "/usr/include/c++/5/bits/ios_base.h" 3
    static bool
    sync_with_stdio(bool __sync = true);
# 751 "/usr/include/c++/5/bits/ios_base.h" 3
    locale
    imbue(const locale& __loc) throw();
# 762 "/usr/include/c++/5/bits/ios_base.h" 3
    locale
    getloc() const
    { return _M_ios_locale; }
# 773 "/usr/include/c++/5/bits/ios_base.h" 3
    const locale&
    _M_getloc() const
    { return _M_ios_locale; }
# 792 "/usr/include/c++/5/bits/ios_base.h" 3
    static int
    xalloc() throw();
# 808 "/usr/include/c++/5/bits/ios_base.h" 3
    long&
    iword(int __ix)
    {
      _Words& __word = (__ix < _M_word_size)
   ? _M_word[__ix] : _M_grow_words(__ix, true);
      return __word._M_iword;
    }
# 829 "/usr/include/c++/5/bits/ios_base.h" 3
    void*&
    pword(int __ix)
    {
      _Words& __word = (__ix < _M_word_size)
   ? _M_word[__ix] : _M_grow_words(__ix, false);
      return __word._M_pword;
    }
# 846 "/usr/include/c++/5/bits/ios_base.h" 3
    virtual ~ios_base();

  protected:
    ios_base() throw ();




  private:
    ios_base(const ios_base&);

    ios_base&
    operator=(const ios_base&);
# 873 "/usr/include/c++/5/bits/ios_base.h" 3
  };



  inline ios_base&
  boolalpha(ios_base& __base)
  {
    __base.setf(ios_base::boolalpha);
    return __base;
  }


  inline ios_base&
  noboolalpha(ios_base& __base)
  {
    __base.unsetf(ios_base::boolalpha);
    return __base;
  }


  inline ios_base&
  showbase(ios_base& __base)
  {
    __base.setf(ios_base::showbase);
    return __base;
  }


  inline ios_base&
  noshowbase(ios_base& __base)
  {
    __base.unsetf(ios_base::showbase);
    return __base;
  }


  inline ios_base&
  showpoint(ios_base& __base)
  {
    __base.setf(ios_base::showpoint);
    return __base;
  }


  inline ios_base&
  noshowpoint(ios_base& __base)
  {
    __base.unsetf(ios_base::showpoint);
    return __base;
  }


  inline ios_base&
  showpos(ios_base& __base)
  {
    __base.setf(ios_base::showpos);
    return __base;
  }


  inline ios_base&
  noshowpos(ios_base& __base)
  {
    __base.unsetf(ios_base::showpos);
    return __base;
  }


  inline ios_base&
  skipws(ios_base& __base)
  {
    __base.setf(ios_base::skipws);
    return __base;
  }


  inline ios_base&
  noskipws(ios_base& __base)
  {
    __base.unsetf(ios_base::skipws);
    return __base;
  }


  inline ios_base&
  uppercase(ios_base& __base)
  {
    __base.setf(ios_base::uppercase);
    return __base;
  }


  inline ios_base&
  nouppercase(ios_base& __base)
  {
    __base.unsetf(ios_base::uppercase);
    return __base;
  }


  inline ios_base&
  unitbuf(ios_base& __base)
  {
     __base.setf(ios_base::unitbuf);
     return __base;
  }


  inline ios_base&
  nounitbuf(ios_base& __base)
  {
     __base.unsetf(ios_base::unitbuf);
     return __base;
  }



  inline ios_base&
  internal(ios_base& __base)
  {
     __base.setf(ios_base::internal, ios_base::adjustfield);
     return __base;
  }


  inline ios_base&
  left(ios_base& __base)
  {
    __base.setf(ios_base::left, ios_base::adjustfield);
    return __base;
  }


  inline ios_base&
  right(ios_base& __base)
  {
    __base.setf(ios_base::right, ios_base::adjustfield);
    return __base;
  }



  inline ios_base&
  dec(ios_base& __base)
  {
    __base.setf(ios_base::dec, ios_base::basefield);
    return __base;
  }


  inline ios_base&
  hex(ios_base& __base)
  {
    __base.setf(ios_base::hex, ios_base::basefield);
    return __base;
  }


  inline ios_base&
  oct(ios_base& __base)
  {
    __base.setf(ios_base::oct, ios_base::basefield);
    return __base;
  }



  inline ios_base&
  fixed(ios_base& __base)
  {
    __base.setf(ios_base::fixed, ios_base::floatfield);
    return __base;
  }


  inline ios_base&
  scientific(ios_base& __base)
  {
    __base.setf(ios_base::scientific, ios_base::floatfield);
    return __base;
  }
# 1076 "/usr/include/c++/5/bits/ios_base.h" 3

}
# 43 "/usr/include/c++/5/ios" 2 3
# 1 "/usr/include/c++/5/streambuf" 1 3
# 36 "/usr/include/c++/5/streambuf" 3
       
# 37 "/usr/include/c++/5/streambuf" 3
# 45 "/usr/include/c++/5/streambuf" 3
namespace std __attribute__ ((__visibility__ ("default")))
{


  template<typename _CharT, typename _Traits>
    streamsize
    __copy_streambufs_eof(basic_streambuf<_CharT, _Traits>*,
     basic_streambuf<_CharT, _Traits>*, bool&);
# 119 "/usr/include/c++/5/streambuf" 3
  template<typename _CharT, typename _Traits>
    class basic_streambuf
    {
    public:






      typedef _CharT char_type;
      typedef _Traits traits_type;
      typedef typename traits_type::int_type int_type;
      typedef typename traits_type::pos_type pos_type;
      typedef typename traits_type::off_type off_type;




      typedef basic_streambuf<char_type, traits_type> __streambuf_type;


      friend class basic_ios<char_type, traits_type>;
      friend class basic_istream<char_type, traits_type>;
      friend class basic_ostream<char_type, traits_type>;
      friend class istreambuf_iterator<char_type, traits_type>;
      friend class ostreambuf_iterator<char_type, traits_type>;

      friend streamsize
      __copy_streambufs_eof<>(basic_streambuf*, basic_streambuf*, bool&);

      template<bool _IsMove, typename _CharT2>
        friend typename __gnu_cxx::__enable_if<__is_char<_CharT2>::__value,
            _CharT2*>::__type
        __copy_move_a2(istreambuf_iterator<_CharT2>,
         istreambuf_iterator<_CharT2>, _CharT2*);

      template<typename _CharT2>
        friend typename __gnu_cxx::__enable_if<__is_char<_CharT2>::__value,
      istreambuf_iterator<_CharT2> >::__type
        find(istreambuf_iterator<_CharT2>, istreambuf_iterator<_CharT2>,
      const _CharT2&);

      template<typename _CharT2, typename _Traits2>
        friend basic_istream<_CharT2, _Traits2>&
        operator>>(basic_istream<_CharT2, _Traits2>&, _CharT2*);

      template<typename _CharT2, typename _Traits2, typename _Alloc>
        friend basic_istream<_CharT2, _Traits2>&
        operator>>(basic_istream<_CharT2, _Traits2>&,
     basic_string<_CharT2, _Traits2, _Alloc>&);

      template<typename _CharT2, typename _Traits2, typename _Alloc>
        friend basic_istream<_CharT2, _Traits2>&
        getline(basic_istream<_CharT2, _Traits2>&,
  basic_string<_CharT2, _Traits2, _Alloc>&, _CharT2);

    protected:







      char_type* _M_in_beg;
      char_type* _M_in_cur;
      char_type* _M_in_end;
      char_type* _M_out_beg;
      char_type* _M_out_cur;
      char_type* _M_out_end;


      locale _M_buf_locale;

  public:

      virtual
      ~basic_streambuf()
      { }
# 208 "/usr/include/c++/5/streambuf" 3
      locale
      pubimbue(const locale& __loc)
      {
 locale __tmp(this->getloc());
 this->imbue(__loc);
 _M_buf_locale = __loc;
 return __tmp;
      }
# 225 "/usr/include/c++/5/streambuf" 3
      locale
      getloc() const
      { return _M_buf_locale; }
# 238 "/usr/include/c++/5/streambuf" 3
      basic_streambuf*
      pubsetbuf(char_type* __s, streamsize __n)
      { return this->setbuf(__s, __n); }
# 250 "/usr/include/c++/5/streambuf" 3
      pos_type
      pubseekoff(off_type __off, ios_base::seekdir __way,
   ios_base::openmode __mode = ios_base::in | ios_base::out)
      { return this->seekoff(__off, __way, __mode); }
# 262 "/usr/include/c++/5/streambuf" 3
      pos_type
      pubseekpos(pos_type __sp,
   ios_base::openmode __mode = ios_base::in | ios_base::out)
      { return this->seekpos(__sp, __mode); }




      int
      pubsync() { return this->sync(); }
# 283 "/usr/include/c++/5/streambuf" 3
      streamsize
      in_avail()
      {
 const streamsize __ret = this->egptr() - this->gptr();
 return __ret ? __ret : this->showmanyc();
      }
# 297 "/usr/include/c++/5/streambuf" 3
      int_type
      snextc()
      {
 int_type __ret = traits_type::eof();
 if (__builtin_expect(!traits_type::eq_int_type(this->sbumpc(),
             __ret), true))
   __ret = this->sgetc();
 return __ret;
      }
# 315 "/usr/include/c++/5/streambuf" 3
      int_type
      sbumpc()
      {
 int_type __ret;
 if (__builtin_expect(this->gptr() < this->egptr(), true))
   {
     __ret = traits_type::to_int_type(*this->gptr());
     this->gbump(1);
   }
 else
   __ret = this->uflow();
 return __ret;
      }
# 337 "/usr/include/c++/5/streambuf" 3
      int_type
      sgetc()
      {
 int_type __ret;
 if (__builtin_expect(this->gptr() < this->egptr(), true))
   __ret = traits_type::to_int_type(*this->gptr());
 else
   __ret = this->underflow();
 return __ret;
      }
# 356 "/usr/include/c++/5/streambuf" 3
      streamsize
      sgetn(char_type* __s, streamsize __n)
      { return this->xsgetn(__s, __n); }
# 371 "/usr/include/c++/5/streambuf" 3
      int_type
      sputbackc(char_type __c)
      {
 int_type __ret;
 const bool __testpos = this->eback() < this->gptr();
 if (__builtin_expect(!__testpos ||
        !traits_type::eq(__c, this->gptr()[-1]), false))
   __ret = this->pbackfail(traits_type::to_int_type(__c));
 else
   {
     this->gbump(-1);
     __ret = traits_type::to_int_type(*this->gptr());
   }
 return __ret;
      }
# 396 "/usr/include/c++/5/streambuf" 3
      int_type
      sungetc()
      {
 int_type __ret;
 if (__builtin_expect(this->eback() < this->gptr(), true))
   {
     this->gbump(-1);
     __ret = traits_type::to_int_type(*this->gptr());
   }
 else
   __ret = this->pbackfail();
 return __ret;
      }
# 423 "/usr/include/c++/5/streambuf" 3
      int_type
      sputc(char_type __c)
      {
 int_type __ret;
 if (__builtin_expect(this->pptr() < this->epptr(), true))
   {
     *this->pptr() = __c;
     this->pbump(1);
     __ret = traits_type::to_int_type(__c);
   }
 else
   __ret = this->overflow(traits_type::to_int_type(__c));
 return __ret;
      }
# 449 "/usr/include/c++/5/streambuf" 3
      streamsize
      sputn(const char_type* __s, streamsize __n)
      { return this->xsputn(__s, __n); }

    protected:
# 463 "/usr/include/c++/5/streambuf" 3
      basic_streambuf()
      : _M_in_beg(0), _M_in_cur(0), _M_in_end(0),
      _M_out_beg(0), _M_out_cur(0), _M_out_end(0),
      _M_buf_locale(locale())
      { }
# 481 "/usr/include/c++/5/streambuf" 3
      char_type*
      eback() const { return _M_in_beg; }

      char_type*
      gptr() const { return _M_in_cur; }

      char_type*
      egptr() const { return _M_in_end; }
# 497 "/usr/include/c++/5/streambuf" 3
      void
      gbump(int __n) { _M_in_cur += __n; }
# 508 "/usr/include/c++/5/streambuf" 3
      void
      setg(char_type* __gbeg, char_type* __gnext, char_type* __gend)
      {
 _M_in_beg = __gbeg;
 _M_in_cur = __gnext;
 _M_in_end = __gend;
      }
# 528 "/usr/include/c++/5/streambuf" 3
      char_type*
      pbase() const { return _M_out_beg; }

      char_type*
      pptr() const { return _M_out_cur; }

      char_type*
      epptr() const { return _M_out_end; }
# 544 "/usr/include/c++/5/streambuf" 3
      void
      pbump(int __n) { _M_out_cur += __n; }
# 554 "/usr/include/c++/5/streambuf" 3
      void
      setp(char_type* __pbeg, char_type* __pend)
      {
 _M_out_beg = _M_out_cur = __pbeg;
 _M_out_end = __pend;
      }
# 575 "/usr/include/c++/5/streambuf" 3
      virtual void
      imbue(const locale& __loc)
      { }
# 590 "/usr/include/c++/5/streambuf" 3
      virtual basic_streambuf<char_type,_Traits>*
      setbuf(char_type*, streamsize)
      { return this; }
# 601 "/usr/include/c++/5/streambuf" 3
      virtual pos_type
      seekoff(off_type, ios_base::seekdir,
       ios_base::openmode = ios_base::in | ios_base::out)
      { return pos_type(off_type(-1)); }
# 613 "/usr/include/c++/5/streambuf" 3
      virtual pos_type
      seekpos(pos_type,
       ios_base::openmode = ios_base::in | ios_base::out)
      { return pos_type(off_type(-1)); }
# 626 "/usr/include/c++/5/streambuf" 3
      virtual int
      sync() { return 0; }
# 648 "/usr/include/c++/5/streambuf" 3
      virtual streamsize
      showmanyc() { return 0; }
# 664 "/usr/include/c++/5/streambuf" 3
      virtual streamsize
      xsgetn(char_type* __s, streamsize __n);
# 686 "/usr/include/c++/5/streambuf" 3
      virtual int_type
      underflow()
      { return traits_type::eof(); }
# 699 "/usr/include/c++/5/streambuf" 3
      virtual int_type
      uflow()
      {
 int_type __ret = traits_type::eof();
 const bool __testeof = traits_type::eq_int_type(this->underflow(),
       __ret);
 if (!__testeof)
   {
     __ret = traits_type::to_int_type(*this->gptr());
     this->gbump(1);
   }
 return __ret;
      }
# 723 "/usr/include/c++/5/streambuf" 3
      virtual int_type
      pbackfail(int_type __c = traits_type::eof())
      { return traits_type::eof(); }
# 741 "/usr/include/c++/5/streambuf" 3
      virtual streamsize
      xsputn(const char_type* __s, streamsize __n);
# 767 "/usr/include/c++/5/streambuf" 3
      virtual int_type
      overflow(int_type __c = traits_type::eof())
      { return traits_type::eof(); }



    public:
# 782 "/usr/include/c++/5/streambuf" 3
      void
      stossc()
      {
 if (this->gptr() < this->egptr())
   this->gbump(1);
 else
   this->uflow();
      }



      void
      __safe_gbump(streamsize __n) { _M_in_cur += __n; }

      void
      __safe_pbump(streamsize __n) { _M_out_cur += __n; }


    private:



      basic_streambuf(const basic_streambuf&);

      basic_streambuf&
      operator=(const basic_streambuf&);
# 822 "/usr/include/c++/5/streambuf" 3
    };
# 836 "/usr/include/c++/5/streambuf" 3
  template<>
    streamsize
    __copy_streambufs_eof(basic_streambuf<char>* __sbin,
     basic_streambuf<char>* __sbout, bool& __ineof);

  template<>
    streamsize
    __copy_streambufs_eof(basic_streambuf<wchar_t>* __sbin,
     basic_streambuf<wchar_t>* __sbout, bool& __ineof);



}

# 1 "/usr/include/c++/5/bits/streambuf.tcc" 1 3
# 37 "/usr/include/c++/5/bits/streambuf.tcc" 3
       
# 38 "/usr/include/c++/5/bits/streambuf.tcc" 3

namespace std __attribute__ ((__visibility__ ("default")))
{


  template<typename _CharT, typename _Traits>
    streamsize
    basic_streambuf<_CharT, _Traits>::
    xsgetn(char_type* __s, streamsize __n)
    {
      streamsize __ret = 0;
      while (__ret < __n)
 {
   const streamsize __buf_len = this->egptr() - this->gptr();
   if (__buf_len)
     {
       const streamsize __remaining = __n - __ret;
       const streamsize __len = std::min(__buf_len, __remaining);
       traits_type::copy(__s, this->gptr(), __len);
       __ret += __len;
       __s += __len;
       this->__safe_gbump(__len);
     }

   if (__ret < __n)
     {
       const int_type __c = this->uflow();
       if (!traits_type::eq_int_type(__c, traits_type::eof()))
  {
    traits_type::assign(*__s++, traits_type::to_char_type(__c));
    ++__ret;
  }
       else
  break;
     }
 }
      return __ret;
    }

  template<typename _CharT, typename _Traits>
    streamsize
    basic_streambuf<_CharT, _Traits>::
    xsputn(const char_type* __s, streamsize __n)
    {
      streamsize __ret = 0;
      while (__ret < __n)
 {
   const streamsize __buf_len = this->epptr() - this->pptr();
   if (__buf_len)
     {
       const streamsize __remaining = __n - __ret;
       const streamsize __len = std::min(__buf_len, __remaining);
       traits_type::copy(this->pptr(), __s, __len);
       __ret += __len;
       __s += __len;
       this->__safe_pbump(__len);
     }

   if (__ret < __n)
     {
       int_type __c = this->overflow(traits_type::to_int_type(*__s));
       if (!traits_type::eq_int_type(__c, traits_type::eof()))
  {
    ++__ret;
    ++__s;
  }
       else
  break;
     }
 }
      return __ret;
    }




  template<typename _CharT, typename _Traits>
    streamsize
    __copy_streambufs_eof(basic_streambuf<_CharT, _Traits>* __sbin,
     basic_streambuf<_CharT, _Traits>* __sbout,
     bool& __ineof)
    {
      streamsize __ret = 0;
      __ineof = true;
      typename _Traits::int_type __c = __sbin->sgetc();
      while (!_Traits::eq_int_type(__c, _Traits::eof()))
 {
   __c = __sbout->sputc(_Traits::to_char_type(__c));
   if (_Traits::eq_int_type(__c, _Traits::eof()))
     {
       __ineof = false;
       break;
     }
   ++__ret;
   __c = __sbin->snextc();
 }
      return __ret;
    }

  template<typename _CharT, typename _Traits>
    inline streamsize
    __copy_streambufs(basic_streambuf<_CharT, _Traits>* __sbin,
        basic_streambuf<_CharT, _Traits>* __sbout)
    {
      bool __ineof;
      return __copy_streambufs_eof(__sbin, __sbout, __ineof);
    }




  extern template class basic_streambuf<char>;
  extern template
    streamsize
    __copy_streambufs(basic_streambuf<char>*,
        basic_streambuf<char>*);
  extern template
    streamsize
    __copy_streambufs_eof(basic_streambuf<char>*,
     basic_streambuf<char>*, bool&);


  extern template class basic_streambuf<wchar_t>;
  extern template
    streamsize
    __copy_streambufs(basic_streambuf<wchar_t>*,
        basic_streambuf<wchar_t>*);
  extern template
    streamsize
    __copy_streambufs_eof(basic_streambuf<wchar_t>*,
     basic_streambuf<wchar_t>*, bool&);




}
# 851 "/usr/include/c++/5/streambuf" 2 3
# 44 "/usr/include/c++/5/ios" 2 3
# 1 "/usr/include/c++/5/bits/basic_ios.h" 1 3
# 33 "/usr/include/c++/5/bits/basic_ios.h" 3
       
# 34 "/usr/include/c++/5/bits/basic_ios.h" 3



# 1 "/usr/include/c++/5/bits/locale_facets.h" 1 3
# 37 "/usr/include/c++/5/bits/locale_facets.h" 3
       
# 38 "/usr/include/c++/5/bits/locale_facets.h" 3

# 1 "/usr/include/c++/5/cwctype" 1 3
# 39 "/usr/include/c++/5/cwctype" 3
       
# 40 "/usr/include/c++/5/cwctype" 3
# 50 "/usr/include/c++/5/cwctype" 3
# 1 "/usr/include/wctype.h" 1 3 4
# 33 "/usr/include/wctype.h" 3 4
# 1 "/usr/include/wchar.h" 1 3 4
# 34 "/usr/include/wctype.h" 2 3 4
# 49 "/usr/include/wctype.h" 3 4



typedef unsigned long int wctype_t;

# 71 "/usr/include/wctype.h" 3 4
enum
{
  __ISwupper = 0,
  __ISwlower = 1,
  __ISwalpha = 2,
  __ISwdigit = 3,
  __ISwxdigit = 4,
  __ISwspace = 5,
  __ISwprint = 6,
  __ISwgraph = 7,
  __ISwblank = 8,
  __ISwcntrl = 9,
  __ISwpunct = 10,
  __ISwalnum = 11,

  _ISwupper = ((__ISwupper) < 8 ? (int) ((1UL << (__ISwupper)) << 24) : ((__ISwupper) < 16 ? (int) ((1UL << (__ISwupper)) << 8) : ((__ISwupper) < 24 ? (int) ((1UL << (__ISwupper)) >> 8) : (int) ((1UL << (__ISwupper)) >> 24)))),
  _ISwlower = ((__ISwlower) < 8 ? (int) ((1UL << (__ISwlower)) << 24) : ((__ISwlower) < 16 ? (int) ((1UL << (__ISwlower)) << 8) : ((__ISwlower) < 24 ? (int) ((1UL << (__ISwlower)) >> 8) : (int) ((1UL << (__ISwlower)) >> 24)))),
  _ISwalpha = ((__ISwalpha) < 8 ? (int) ((1UL << (__ISwalpha)) << 24) : ((__ISwalpha) < 16 ? (int) ((1UL << (__ISwalpha)) << 8) : ((__ISwalpha) < 24 ? (int) ((1UL << (__ISwalpha)) >> 8) : (int) ((1UL << (__ISwalpha)) >> 24)))),
  _ISwdigit = ((__ISwdigit) < 8 ? (int) ((1UL << (__ISwdigit)) << 24) : ((__ISwdigit) < 16 ? (int) ((1UL << (__ISwdigit)) << 8) : ((__ISwdigit) < 24 ? (int) ((1UL << (__ISwdigit)) >> 8) : (int) ((1UL << (__ISwdigit)) >> 24)))),
  _ISwxdigit = ((__ISwxdigit) < 8 ? (int) ((1UL << (__ISwxdigit)) << 24) : ((__ISwxdigit) < 16 ? (int) ((1UL << (__ISwxdigit)) << 8) : ((__ISwxdigit) < 24 ? (int) ((1UL << (__ISwxdigit)) >> 8) : (int) ((1UL << (__ISwxdigit)) >> 24)))),
  _ISwspace = ((__ISwspace) < 8 ? (int) ((1UL << (__ISwspace)) << 24) : ((__ISwspace) < 16 ? (int) ((1UL << (__ISwspace)) << 8) : ((__ISwspace) < 24 ? (int) ((1UL << (__ISwspace)) >> 8) : (int) ((1UL << (__ISwspace)) >> 24)))),
  _ISwprint = ((__ISwprint) < 8 ? (int) ((1UL << (__ISwprint)) << 24) : ((__ISwprint) < 16 ? (int) ((1UL << (__ISwprint)) << 8) : ((__ISwprint) < 24 ? (int) ((1UL << (__ISwprint)) >> 8) : (int) ((1UL << (__ISwprint)) >> 24)))),
  _ISwgraph = ((__ISwgraph) < 8 ? (int) ((1UL << (__ISwgraph)) << 24) : ((__ISwgraph) < 16 ? (int) ((1UL << (__ISwgraph)) << 8) : ((__ISwgraph) < 24 ? (int) ((1UL << (__ISwgraph)) >> 8) : (int) ((1UL << (__ISwgraph)) >> 24)))),
  _ISwblank = ((__ISwblank) < 8 ? (int) ((1UL << (__ISwblank)) << 24) : ((__ISwblank) < 16 ? (int) ((1UL << (__ISwblank)) << 8) : ((__ISwblank) < 24 ? (int) ((1UL << (__ISwblank)) >> 8) : (int) ((1UL << (__ISwblank)) >> 24)))),
  _ISwcntrl = ((__ISwcntrl) < 8 ? (int) ((1UL << (__ISwcntrl)) << 24) : ((__ISwcntrl) < 16 ? (int) ((1UL << (__ISwcntrl)) << 8) : ((__ISwcntrl) < 24 ? (int) ((1UL << (__ISwcntrl)) >> 8) : (int) ((1UL << (__ISwcntrl)) >> 24)))),
  _ISwpunct = ((__ISwpunct) < 8 ? (int) ((1UL << (__ISwpunct)) << 24) : ((__ISwpunct) < 16 ? (int) ((1UL << (__ISwpunct)) << 8) : ((__ISwpunct) < 24 ? (int) ((1UL << (__ISwpunct)) >> 8) : (int) ((1UL << (__ISwpunct)) >> 24)))),
  _ISwalnum = ((__ISwalnum) < 8 ? (int) ((1UL << (__ISwalnum)) << 24) : ((__ISwalnum) < 16 ? (int) ((1UL << (__ISwalnum)) << 8) : ((__ISwalnum) < 24 ? (int) ((1UL << (__ISwalnum)) >> 8) : (int) ((1UL << (__ISwalnum)) >> 24))))
};



extern "C" {








extern int iswalnum (wint_t __wc) throw ();





extern int iswalpha (wint_t __wc) throw ();


extern int iswcntrl (wint_t __wc) throw ();



extern int iswdigit (wint_t __wc) throw ();



extern int iswgraph (wint_t __wc) throw ();




extern int iswlower (wint_t __wc) throw ();


extern int iswprint (wint_t __wc) throw ();




extern int iswpunct (wint_t __wc) throw ();




extern int iswspace (wint_t __wc) throw ();




extern int iswupper (wint_t __wc) throw ();




extern int iswxdigit (wint_t __wc) throw ();





extern int iswblank (wint_t __wc) throw ();
# 171 "/usr/include/wctype.h" 3 4
extern wctype_t wctype (const char *__property) throw ();



extern int iswctype (wint_t __wc, wctype_t __desc) throw ();










typedef const __int32_t *wctrans_t;







extern wint_t towlower (wint_t __wc) throw ();


extern wint_t towupper (wint_t __wc) throw ();


}
# 213 "/usr/include/wctype.h" 3 4
extern "C" {




extern wctrans_t wctrans (const char *__property) throw ();


extern wint_t towctrans (wint_t __wc, wctrans_t __desc) throw ();








extern int iswalnum_l (wint_t __wc, __locale_t __locale) throw ();





extern int iswalpha_l (wint_t __wc, __locale_t __locale) throw ();


extern int iswcntrl_l (wint_t __wc, __locale_t __locale) throw ();



extern int iswdigit_l (wint_t __wc, __locale_t __locale) throw ();



extern int iswgraph_l (wint_t __wc, __locale_t __locale) throw ();




extern int iswlower_l (wint_t __wc, __locale_t __locale) throw ();


extern int iswprint_l (wint_t __wc, __locale_t __locale) throw ();




extern int iswpunct_l (wint_t __wc, __locale_t __locale) throw ();




extern int iswspace_l (wint_t __wc, __locale_t __locale) throw ();




extern int iswupper_l (wint_t __wc, __locale_t __locale) throw ();




extern int iswxdigit_l (wint_t __wc, __locale_t __locale) throw ();




extern int iswblank_l (wint_t __wc, __locale_t __locale) throw ();



extern wctype_t wctype_l (const char *__property, __locale_t __locale)
     throw ();



extern int iswctype_l (wint_t __wc, wctype_t __desc, __locale_t __locale)
     throw ();







extern wint_t towlower_l (wint_t __wc, __locale_t __locale) throw ();


extern wint_t towupper_l (wint_t __wc, __locale_t __locale) throw ();



extern wctrans_t wctrans_l (const char *__property, __locale_t __locale)
     throw ();


extern wint_t towctrans_l (wint_t __wc, wctrans_t __desc,
      __locale_t __locale) throw ();



}
# 51 "/usr/include/c++/5/cwctype" 2 3
# 80 "/usr/include/c++/5/cwctype" 3
namespace std
{
  using ::wctrans_t;
  using ::wctype_t;
  using ::wint_t;

  using ::iswalnum;
  using ::iswalpha;

  using ::iswblank;

  using ::iswcntrl;
  using ::iswctype;
  using ::iswdigit;
  using ::iswgraph;
  using ::iswlower;
  using ::iswprint;
  using ::iswpunct;
  using ::iswspace;
  using ::iswupper;
  using ::iswxdigit;
  using ::towctrans;
  using ::towlower;
  using ::towupper;
  using ::wctrans;
  using ::wctype;
}
# 40 "/usr/include/c++/5/bits/locale_facets.h" 2 3
# 1 "/usr/include/c++/5/cctype" 1 3
# 39 "/usr/include/c++/5/cctype" 3
       
# 40 "/usr/include/c++/5/cctype" 3
# 41 "/usr/include/c++/5/bits/locale_facets.h" 2 3
# 1 "/usr/include/x86_64-linux-gnu/c++/5/bits/ctype_base.h" 1 3
# 36 "/usr/include/x86_64-linux-gnu/c++/5/bits/ctype_base.h" 3
namespace std __attribute__ ((__visibility__ ("default")))
{



  struct ctype_base
  {

    typedef const int* __to_type;



    typedef unsigned short mask;
    static const mask upper = _ISupper;
    static const mask lower = _ISlower;
    static const mask alpha = _ISalpha;
    static const mask digit = _ISdigit;
    static const mask xdigit = _ISxdigit;
    static const mask space = _ISspace;
    static const mask print = _ISprint;
    static const mask graph = _ISalpha | _ISdigit | _ISpunct;
    static const mask cntrl = _IScntrl;
    static const mask punct = _ISpunct;
    static const mask alnum = _ISalpha | _ISdigit;



  };


}
# 42 "/usr/include/c++/5/bits/locale_facets.h" 2 3






# 1 "/usr/include/c++/5/bits/streambuf_iterator.h" 1 3
# 33 "/usr/include/c++/5/bits/streambuf_iterator.h" 3
       
# 34 "/usr/include/c++/5/bits/streambuf_iterator.h" 3




namespace std __attribute__ ((__visibility__ ("default")))
{

# 49 "/usr/include/c++/5/bits/streambuf_iterator.h" 3
  template<typename _CharT, typename _Traits>
    class istreambuf_iterator
    : public iterator<input_iterator_tag, _CharT, typename _Traits::off_type,
                      _CharT*,




        _CharT&>

    {
    public:



      typedef _CharT char_type;
      typedef _Traits traits_type;
      typedef typename _Traits::int_type int_type;
      typedef basic_streambuf<_CharT, _Traits> streambuf_type;
      typedef basic_istream<_CharT, _Traits> istream_type;


      template<typename _CharT2>
 friend typename __gnu_cxx::__enable_if<__is_char<_CharT2>::__value,
                      ostreambuf_iterator<_CharT2> >::__type
 copy(istreambuf_iterator<_CharT2>, istreambuf_iterator<_CharT2>,
      ostreambuf_iterator<_CharT2>);

      template<bool _IsMove, typename _CharT2>
 friend typename __gnu_cxx::__enable_if<__is_char<_CharT2>::__value,
            _CharT2*>::__type
 __copy_move_a2(istreambuf_iterator<_CharT2>,
         istreambuf_iterator<_CharT2>, _CharT2*);

      template<typename _CharT2>
 friend typename __gnu_cxx::__enable_if<__is_char<_CharT2>::__value,
               istreambuf_iterator<_CharT2> >::__type
 find(istreambuf_iterator<_CharT2>, istreambuf_iterator<_CharT2>,
      const _CharT2&);

    private:







      mutable streambuf_type* _M_sbuf;
      mutable int_type _M_c;

    public:

      istreambuf_iterator() throw()
      : _M_sbuf(0), _M_c(traits_type::eof()) { }
# 112 "/usr/include/c++/5/bits/streambuf_iterator.h" 3
      istreambuf_iterator(istream_type& __s) throw()
      : _M_sbuf(__s.rdbuf()), _M_c(traits_type::eof()) { }


      istreambuf_iterator(streambuf_type* __s) throw()
      : _M_sbuf(__s), _M_c(traits_type::eof()) { }




      char_type
      operator*() const
      {







 return traits_type::to_char_type(_M_get());
      }


      istreambuf_iterator&
      operator++()
      {


                        ;
 if (_M_sbuf)
   {
     _M_sbuf->sbumpc();
     _M_c = traits_type::eof();
   }
 return *this;
      }


      istreambuf_iterator
      operator++(int)
      {


                        ;

 istreambuf_iterator __old = *this;
 if (_M_sbuf)
   {
     __old._M_c = _M_sbuf->sbumpc();
     _M_c = traits_type::eof();
   }
 return __old;
      }





      bool
      equal(const istreambuf_iterator& __b) const
      { return _M_at_eof() == __b._M_at_eof(); }

    private:
      int_type
      _M_get() const
      {
 const int_type __eof = traits_type::eof();
 int_type __ret = __eof;
 if (_M_sbuf)
   {
     if (!traits_type::eq_int_type(_M_c, __eof))
       __ret = _M_c;
     else if (!traits_type::eq_int_type((__ret = _M_sbuf->sgetc()),
            __eof))
       _M_c = __ret;
     else
       _M_sbuf = 0;
   }
 return __ret;
      }

      bool
      _M_at_eof() const
      {
 const int_type __eof = traits_type::eof();
 return traits_type::eq_int_type(_M_get(), __eof);
      }
    };

  template<typename _CharT, typename _Traits>
    inline bool
    operator==(const istreambuf_iterator<_CharT, _Traits>& __a,
        const istreambuf_iterator<_CharT, _Traits>& __b)
    { return __a.equal(__b); }

  template<typename _CharT, typename _Traits>
    inline bool
    operator!=(const istreambuf_iterator<_CharT, _Traits>& __a,
        const istreambuf_iterator<_CharT, _Traits>& __b)
    { return !__a.equal(__b); }


  template<typename _CharT, typename _Traits>
    class ostreambuf_iterator
    : public iterator<output_iterator_tag, void, void, void, void>
    {
    public:



      typedef _CharT char_type;
      typedef _Traits traits_type;
      typedef basic_streambuf<_CharT, _Traits> streambuf_type;
      typedef basic_ostream<_CharT, _Traits> ostream_type;


      template<typename _CharT2>
 friend typename __gnu_cxx::__enable_if<__is_char<_CharT2>::__value,
                      ostreambuf_iterator<_CharT2> >::__type
 copy(istreambuf_iterator<_CharT2>, istreambuf_iterator<_CharT2>,
      ostreambuf_iterator<_CharT2>);

    private:
      streambuf_type* _M_sbuf;
      bool _M_failed;

    public:

      ostreambuf_iterator(ostream_type& __s) throw()
      : _M_sbuf(__s.rdbuf()), _M_failed(!_M_sbuf) { }


      ostreambuf_iterator(streambuf_type* __s) throw()
      : _M_sbuf(__s), _M_failed(!_M_sbuf) { }


      ostreambuf_iterator&
      operator=(_CharT __c)
      {
 if (!_M_failed &&
     _Traits::eq_int_type(_M_sbuf->sputc(__c), _Traits::eof()))
   _M_failed = true;
 return *this;
      }


      ostreambuf_iterator&
      operator*()
      { return *this; }


      ostreambuf_iterator&
      operator++(int)
      { return *this; }


      ostreambuf_iterator&
      operator++()
      { return *this; }


      bool
      failed() const throw()
      { return _M_failed; }

      ostreambuf_iterator&
      _M_put(const _CharT* __ws, streamsize __len)
      {
 if (__builtin_expect(!_M_failed, true)
     && __builtin_expect(this->_M_sbuf->sputn(__ws, __len) != __len,
    false))
   _M_failed = true;
 return *this;
      }
    };


  template<typename _CharT>
    typename __gnu_cxx::__enable_if<__is_char<_CharT>::__value,
                           ostreambuf_iterator<_CharT> >::__type
    copy(istreambuf_iterator<_CharT> __first,
  istreambuf_iterator<_CharT> __last,
  ostreambuf_iterator<_CharT> __result)
    {
      if (__first._M_sbuf && !__last._M_sbuf && !__result._M_failed)
 {
   bool __ineof;
   __copy_streambufs_eof(__first._M_sbuf, __result._M_sbuf, __ineof);
   if (!__ineof)
     __result._M_failed = true;
 }
      return __result;
    }

  template<bool _IsMove, typename _CharT>
    typename __gnu_cxx::__enable_if<__is_char<_CharT>::__value,
            ostreambuf_iterator<_CharT> >::__type
    __copy_move_a2(_CharT* __first, _CharT* __last,
     ostreambuf_iterator<_CharT> __result)
    {
      const streamsize __num = __last - __first;
      if (__num > 0)
 __result._M_put(__first, __num);
      return __result;
    }

  template<bool _IsMove, typename _CharT>
    typename __gnu_cxx::__enable_if<__is_char<_CharT>::__value,
        ostreambuf_iterator<_CharT> >::__type
    __copy_move_a2(const _CharT* __first, const _CharT* __last,
     ostreambuf_iterator<_CharT> __result)
    {
      const streamsize __num = __last - __first;
      if (__num > 0)
 __result._M_put(__first, __num);
      return __result;
    }

  template<bool _IsMove, typename _CharT>
    typename __gnu_cxx::__enable_if<__is_char<_CharT>::__value,
            _CharT*>::__type
    __copy_move_a2(istreambuf_iterator<_CharT> __first,
     istreambuf_iterator<_CharT> __last, _CharT* __result)
    {
      typedef istreambuf_iterator<_CharT> __is_iterator_type;
      typedef typename __is_iterator_type::traits_type traits_type;
      typedef typename __is_iterator_type::streambuf_type streambuf_type;
      typedef typename traits_type::int_type int_type;

      if (__first._M_sbuf && !__last._M_sbuf)
 {
   streambuf_type* __sb = __first._M_sbuf;
   int_type __c = __sb->sgetc();
   while (!traits_type::eq_int_type(__c, traits_type::eof()))
     {
       const streamsize __n = __sb->egptr() - __sb->gptr();
       if (__n > 1)
  {
    traits_type::copy(__result, __sb->gptr(), __n);
    __sb->__safe_gbump(__n);
    __result += __n;
    __c = __sb->underflow();
  }
       else
  {
    *__result++ = traits_type::to_char_type(__c);
    __c = __sb->snextc();
  }
     }
 }
      return __result;
    }

  template<typename _CharT>
    typename __gnu_cxx::__enable_if<__is_char<_CharT>::__value,
          istreambuf_iterator<_CharT> >::__type
    find(istreambuf_iterator<_CharT> __first,
  istreambuf_iterator<_CharT> __last, const _CharT& __val)
    {
      typedef istreambuf_iterator<_CharT> __is_iterator_type;
      typedef typename __is_iterator_type::traits_type traits_type;
      typedef typename __is_iterator_type::streambuf_type streambuf_type;
      typedef typename traits_type::int_type int_type;

      if (__first._M_sbuf && !__last._M_sbuf)
 {
   const int_type __ival = traits_type::to_int_type(__val);
   streambuf_type* __sb = __first._M_sbuf;
   int_type __c = __sb->sgetc();
   while (!traits_type::eq_int_type(__c, traits_type::eof())
   && !traits_type::eq_int_type(__c, __ival))
     {
       streamsize __n = __sb->egptr() - __sb->gptr();
       if (__n > 1)
  {
    const _CharT* __p = traits_type::find(__sb->gptr(),
       __n, __val);
    if (__p)
      __n = __p - __sb->gptr();
    __sb->__safe_gbump(__n);
    __c = __sb->sgetc();
  }
       else
  __c = __sb->snextc();
     }

   if (!traits_type::eq_int_type(__c, traits_type::eof()))
     __first._M_c = __c;
   else
     __first._M_sbuf = 0;
 }
      return __first;
    }




}
# 49 "/usr/include/c++/5/bits/locale_facets.h" 2 3

namespace std __attribute__ ((__visibility__ ("default")))
{

# 71 "/usr/include/c++/5/bits/locale_facets.h" 3
  template<typename _Tp>
    void
    __convert_to_v(const char*, _Tp&, ios_base::iostate&,
     const __c_locale&) throw();


  template<>
    void
    __convert_to_v(const char*, float&, ios_base::iostate&,
     const __c_locale&) throw();

  template<>
    void
    __convert_to_v(const char*, double&, ios_base::iostate&,
     const __c_locale&) throw();

  template<>
    void
    __convert_to_v(const char*, long double&, ios_base::iostate&,
     const __c_locale&) throw();



  template<typename _CharT, typename _Traits>
    struct __pad
    {
      static void
      _S_pad(ios_base& __io, _CharT __fill, _CharT* __news,
      const _CharT* __olds, streamsize __newlen, streamsize __oldlen);
    };






  template<typename _CharT>
    _CharT*
    __add_grouping(_CharT* __s, _CharT __sep,
     const char* __gbeg, size_t __gsize,
     const _CharT* __first, const _CharT* __last);




  template<typename _CharT>
    inline
    ostreambuf_iterator<_CharT>
    __write(ostreambuf_iterator<_CharT> __s, const _CharT* __ws, int __len)
    {
      __s._M_put(__ws, __len);
      return __s;
    }


  template<typename _CharT, typename _OutIter>
    inline
    _OutIter
    __write(_OutIter __s, const _CharT* __ws, int __len)
    {
      for (int __j = 0; __j < __len; __j++, ++__s)
 *__s = __ws[__j];
      return __s;
    }
# 149 "/usr/include/c++/5/bits/locale_facets.h" 3
  template<typename _CharT>
    class __ctype_abstract_base : public locale::facet, public ctype_base
    {
    public:


      typedef _CharT char_type;
# 168 "/usr/include/c++/5/bits/locale_facets.h" 3
      bool
      is(mask __m, char_type __c) const
      { return this->do_is(__m, __c); }
# 185 "/usr/include/c++/5/bits/locale_facets.h" 3
      const char_type*
      is(const char_type *__lo, const char_type *__hi, mask *__vec) const
      { return this->do_is(__lo, __hi, __vec); }
# 201 "/usr/include/c++/5/bits/locale_facets.h" 3
      const char_type*
      scan_is(mask __m, const char_type* __lo, const char_type* __hi) const
      { return this->do_scan_is(__m, __lo, __hi); }
# 217 "/usr/include/c++/5/bits/locale_facets.h" 3
      const char_type*
      scan_not(mask __m, const char_type* __lo, const char_type* __hi) const
      { return this->do_scan_not(__m, __lo, __hi); }
# 231 "/usr/include/c++/5/bits/locale_facets.h" 3
      char_type
      toupper(char_type __c) const
      { return this->do_toupper(__c); }
# 246 "/usr/include/c++/5/bits/locale_facets.h" 3
      const char_type*
      toupper(char_type *__lo, const char_type* __hi) const
      { return this->do_toupper(__lo, __hi); }
# 260 "/usr/include/c++/5/bits/locale_facets.h" 3
      char_type
      tolower(char_type __c) const
      { return this->do_tolower(__c); }
# 275 "/usr/include/c++/5/bits/locale_facets.h" 3
      const char_type*
      tolower(char_type* __lo, const char_type* __hi) const
      { return this->do_tolower(__lo, __hi); }
# 292 "/usr/include/c++/5/bits/locale_facets.h" 3
      char_type
      widen(char __c) const
      { return this->do_widen(__c); }
# 311 "/usr/include/c++/5/bits/locale_facets.h" 3
      const char*
      widen(const char* __lo, const char* __hi, char_type* __to) const
      { return this->do_widen(__lo, __hi, __to); }
# 330 "/usr/include/c++/5/bits/locale_facets.h" 3
      char
      narrow(char_type __c, char __dfault) const
      { return this->do_narrow(__c, __dfault); }
# 352 "/usr/include/c++/5/bits/locale_facets.h" 3
      const char_type*
      narrow(const char_type* __lo, const char_type* __hi,
       char __dfault, char* __to) const
      { return this->do_narrow(__lo, __hi, __dfault, __to); }

    protected:
      explicit
      __ctype_abstract_base(size_t __refs = 0): facet(__refs) { }

      virtual
      ~__ctype_abstract_base() { }
# 377 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual bool
      do_is(mask __m, char_type __c) const = 0;
# 396 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual const char_type*
      do_is(const char_type* __lo, const char_type* __hi,
     mask* __vec) const = 0;
# 415 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual const char_type*
      do_scan_is(mask __m, const char_type* __lo,
   const char_type* __hi) const = 0;
# 434 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual const char_type*
      do_scan_not(mask __m, const char_type* __lo,
    const char_type* __hi) const = 0;
# 452 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual char_type
      do_toupper(char_type __c) const = 0;
# 469 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual const char_type*
      do_toupper(char_type* __lo, const char_type* __hi) const = 0;
# 485 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual char_type
      do_tolower(char_type __c) const = 0;
# 502 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual const char_type*
      do_tolower(char_type* __lo, const char_type* __hi) const = 0;
# 521 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual char_type
      do_widen(char __c) const = 0;
# 542 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual const char*
      do_widen(const char* __lo, const char* __hi, char_type* __to) const = 0;
# 563 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual char
      do_narrow(char_type __c, char __dfault) const = 0;
# 588 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual const char_type*
      do_narrow(const char_type* __lo, const char_type* __hi,
  char __dfault, char* __to) const = 0;
    };
# 611 "/usr/include/c++/5/bits/locale_facets.h" 3
  template<typename _CharT>
    class ctype : public __ctype_abstract_base<_CharT>
    {
    public:

      typedef _CharT char_type;
      typedef typename __ctype_abstract_base<_CharT>::mask mask;


      static locale::id id;

      explicit
      ctype(size_t __refs = 0) : __ctype_abstract_base<_CharT>(__refs) { }

   protected:
      virtual
      ~ctype();

      virtual bool
      do_is(mask __m, char_type __c) const;

      virtual const char_type*
      do_is(const char_type* __lo, const char_type* __hi, mask* __vec) const;

      virtual const char_type*
      do_scan_is(mask __m, const char_type* __lo, const char_type* __hi) const;

      virtual const char_type*
      do_scan_not(mask __m, const char_type* __lo,
    const char_type* __hi) const;

      virtual char_type
      do_toupper(char_type __c) const;

      virtual const char_type*
      do_toupper(char_type* __lo, const char_type* __hi) const;

      virtual char_type
      do_tolower(char_type __c) const;

      virtual const char_type*
      do_tolower(char_type* __lo, const char_type* __hi) const;

      virtual char_type
      do_widen(char __c) const;

      virtual const char*
      do_widen(const char* __lo, const char* __hi, char_type* __dest) const;

      virtual char
      do_narrow(char_type, char __dfault) const;

      virtual const char_type*
      do_narrow(const char_type* __lo, const char_type* __hi,
  char __dfault, char* __to) const;
    };

  template<typename _CharT>
    locale::id ctype<_CharT>::id;
# 680 "/usr/include/c++/5/bits/locale_facets.h" 3
  template<>
    class ctype<char> : public locale::facet, public ctype_base
    {
    public:


      typedef char char_type;

    protected:

      __c_locale _M_c_locale_ctype;
      bool _M_del;
      __to_type _M_toupper;
      __to_type _M_tolower;
      const mask* _M_table;
      mutable char _M_widen_ok;
      mutable char _M_widen[1 + static_cast<unsigned char>(-1)];
      mutable char _M_narrow[1 + static_cast<unsigned char>(-1)];
      mutable char _M_narrow_ok;


    public:

      static locale::id id;

      static const size_t table_size = 1 + static_cast<unsigned char>(-1);
# 717 "/usr/include/c++/5/bits/locale_facets.h" 3
      explicit
      ctype(const mask* __table = 0, bool __del = false, size_t __refs = 0);
# 730 "/usr/include/c++/5/bits/locale_facets.h" 3
      explicit
      ctype(__c_locale __cloc, const mask* __table = 0, bool __del = false,
     size_t __refs = 0);
# 743 "/usr/include/c++/5/bits/locale_facets.h" 3
      inline bool
      is(mask __m, char __c) const;
# 758 "/usr/include/c++/5/bits/locale_facets.h" 3
      inline const char*
      is(const char* __lo, const char* __hi, mask* __vec) const;
# 772 "/usr/include/c++/5/bits/locale_facets.h" 3
      inline const char*
      scan_is(mask __m, const char* __lo, const char* __hi) const;
# 786 "/usr/include/c++/5/bits/locale_facets.h" 3
      inline const char*
      scan_not(mask __m, const char* __lo, const char* __hi) const;
# 801 "/usr/include/c++/5/bits/locale_facets.h" 3
      char_type
      toupper(char_type __c) const
      { return this->do_toupper(__c); }
# 818 "/usr/include/c++/5/bits/locale_facets.h" 3
      const char_type*
      toupper(char_type *__lo, const char_type* __hi) const
      { return this->do_toupper(__lo, __hi); }
# 834 "/usr/include/c++/5/bits/locale_facets.h" 3
      char_type
      tolower(char_type __c) const
      { return this->do_tolower(__c); }
# 851 "/usr/include/c++/5/bits/locale_facets.h" 3
      const char_type*
      tolower(char_type* __lo, const char_type* __hi) const
      { return this->do_tolower(__lo, __hi); }
# 871 "/usr/include/c++/5/bits/locale_facets.h" 3
      char_type
      widen(char __c) const
      {
 if (_M_widen_ok)
   return _M_widen[static_cast<unsigned char>(__c)];
 this->_M_widen_init();
 return this->do_widen(__c);
      }
# 898 "/usr/include/c++/5/bits/locale_facets.h" 3
      const char*
      widen(const char* __lo, const char* __hi, char_type* __to) const
      {
 if (_M_widen_ok == 1)
   {
     __builtin_memcpy(__to, __lo, __hi - __lo);
     return __hi;
   }
 if (!_M_widen_ok)
   _M_widen_init();
 return this->do_widen(__lo, __hi, __to);
      }
# 929 "/usr/include/c++/5/bits/locale_facets.h" 3
      char
      narrow(char_type __c, char __dfault) const
      {
 if (_M_narrow[static_cast<unsigned char>(__c)])
   return _M_narrow[static_cast<unsigned char>(__c)];
 const char __t = do_narrow(__c, __dfault);
 if (__t != __dfault)
   _M_narrow[static_cast<unsigned char>(__c)] = __t;
 return __t;
      }
# 962 "/usr/include/c++/5/bits/locale_facets.h" 3
      const char_type*
      narrow(const char_type* __lo, const char_type* __hi,
      char __dfault, char* __to) const
      {
 if (__builtin_expect(_M_narrow_ok == 1, true))
   {
     __builtin_memcpy(__to, __lo, __hi - __lo);
     return __hi;
   }
 if (!_M_narrow_ok)
   _M_narrow_init();
 return this->do_narrow(__lo, __hi, __dfault, __to);
      }





      const mask*
      table() const throw()
      { return _M_table; }


      static const mask*
      classic_table() throw();
    protected:







      virtual
      ~ctype();
# 1011 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual char_type
      do_toupper(char_type __c) const;
# 1028 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual const char_type*
      do_toupper(char_type* __lo, const char_type* __hi) const;
# 1044 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual char_type
      do_tolower(char_type __c) const;
# 1061 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual const char_type*
      do_tolower(char_type* __lo, const char_type* __hi) const;
# 1081 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual char_type
      do_widen(char __c) const
      { return __c; }
# 1104 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual const char*
      do_widen(const char* __lo, const char* __hi, char_type* __to) const
      {
 __builtin_memcpy(__to, __lo, __hi - __lo);
 return __hi;
      }
# 1130 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual char
      do_narrow(char_type __c, char __dfault) const
      { return __c; }
# 1156 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual const char_type*
      do_narrow(const char_type* __lo, const char_type* __hi,
  char __dfault, char* __to) const
      {
 __builtin_memcpy(__to, __lo, __hi - __lo);
 return __hi;
      }

    private:
      void _M_narrow_init() const;
      void _M_widen_init() const;
    };
# 1181 "/usr/include/c++/5/bits/locale_facets.h" 3
  template<>
    class ctype<wchar_t> : public __ctype_abstract_base<wchar_t>
    {
    public:


      typedef wchar_t char_type;
      typedef wctype_t __wmask_type;

    protected:
      __c_locale _M_c_locale_ctype;


      bool _M_narrow_ok;
      char _M_narrow[128];
      wint_t _M_widen[1 + static_cast<unsigned char>(-1)];


      mask _M_bit[16];
      __wmask_type _M_wmask[16];

    public:


      static locale::id id;
# 1214 "/usr/include/c++/5/bits/locale_facets.h" 3
      explicit
      ctype(size_t __refs = 0);
# 1225 "/usr/include/c++/5/bits/locale_facets.h" 3
      explicit
      ctype(__c_locale __cloc, size_t __refs = 0);

    protected:
      __wmask_type
      _M_convert_to_wmask(const mask __m) const throw();


      virtual
      ~ctype();
# 1249 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual bool
      do_is(mask __m, char_type __c) const;
# 1268 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual const char_type*
      do_is(const char_type* __lo, const char_type* __hi, mask* __vec) const;
# 1286 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual const char_type*
      do_scan_is(mask __m, const char_type* __lo, const char_type* __hi) const;
# 1304 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual const char_type*
      do_scan_not(mask __m, const char_type* __lo,
    const char_type* __hi) const;
# 1321 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual char_type
      do_toupper(char_type __c) const;
# 1338 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual const char_type*
      do_toupper(char_type* __lo, const char_type* __hi) const;
# 1354 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual char_type
      do_tolower(char_type __c) const;
# 1371 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual const char_type*
      do_tolower(char_type* __lo, const char_type* __hi) const;
# 1391 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual char_type
      do_widen(char __c) const;
# 1413 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual const char*
      do_widen(const char* __lo, const char* __hi, char_type* __to) const;
# 1436 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual char
      do_narrow(char_type __c, char __dfault) const;
# 1462 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual const char_type*
      do_narrow(const char_type* __lo, const char_type* __hi,
  char __dfault, char* __to) const;


      void
      _M_initialize_ctype() throw();
    };



  template<typename _CharT>
    class ctype_byname : public ctype<_CharT>
    {
    public:
      typedef typename ctype<_CharT>::mask mask;

      explicit
      ctype_byname(const char* __s, size_t __refs = 0);







    protected:
      virtual
      ~ctype_byname() { };
    };


  template<>
    class ctype_byname<char> : public ctype<char>
    {
    public:
      explicit
      ctype_byname(const char* __s, size_t __refs = 0);






    protected:
      virtual
      ~ctype_byname();
    };


  template<>
    class ctype_byname<wchar_t> : public ctype<wchar_t>
    {
    public:
      explicit
      ctype_byname(const char* __s, size_t __refs = 0);






    protected:
      virtual
      ~ctype_byname();
    };



}


# 1 "/usr/include/x86_64-linux-gnu/c++/5/bits/ctype_inline.h" 1 3
# 37 "/usr/include/x86_64-linux-gnu/c++/5/bits/ctype_inline.h" 3
namespace std __attribute__ ((__visibility__ ("default")))
{


  bool
  ctype<char>::
  is(mask __m, char __c) const
  { return _M_table[static_cast<unsigned char>(__c)] & __m; }

  const char*
  ctype<char>::
  is(const char* __low, const char* __high, mask* __vec) const
  {
    while (__low < __high)
      *__vec++ = _M_table[static_cast<unsigned char>(*__low++)];
    return __high;
  }

  const char*
  ctype<char>::
  scan_is(mask __m, const char* __low, const char* __high) const
  {
    while (__low < __high
    && !(_M_table[static_cast<unsigned char>(*__low)] & __m))
      ++__low;
    return __low;
  }

  const char*
  ctype<char>::
  scan_not(mask __m, const char* __low, const char* __high) const
  {
    while (__low < __high
    && (_M_table[static_cast<unsigned char>(*__low)] & __m) != 0)
      ++__low;
    return __low;
  }


}
# 1535 "/usr/include/c++/5/bits/locale_facets.h" 2 3

namespace std __attribute__ ((__visibility__ ("default")))
{



  class __num_base
  {
  public:


    enum
      {
 _S_ominus,
 _S_oplus,
 _S_ox,
 _S_oX,
 _S_odigits,
 _S_odigits_end = _S_odigits + 16,
 _S_oudigits = _S_odigits_end,
 _S_oudigits_end = _S_oudigits + 16,
 _S_oe = _S_odigits + 14,
 _S_oE = _S_oudigits + 14,
 _S_oend = _S_oudigits_end
      };






    static const char* _S_atoms_out;



    static const char* _S_atoms_in;

    enum
    {
      _S_iminus,
      _S_iplus,
      _S_ix,
      _S_iX,
      _S_izero,
      _S_ie = _S_izero + 14,
      _S_iE = _S_izero + 20,
      _S_iend = 26
    };



    static void
    _S_format_float(const ios_base& __io, char* __fptr, char __mod) throw();
  };

  template<typename _CharT>
    struct __numpunct_cache : public locale::facet
    {
      const char* _M_grouping;
      size_t _M_grouping_size;
      bool _M_use_grouping;
      const _CharT* _M_truename;
      size_t _M_truename_size;
      const _CharT* _M_falsename;
      size_t _M_falsename_size;
      _CharT _M_decimal_point;
      _CharT _M_thousands_sep;





      _CharT _M_atoms_out[__num_base::_S_oend];





      _CharT _M_atoms_in[__num_base::_S_iend];

      bool _M_allocated;

      __numpunct_cache(size_t __refs = 0)
      : facet(__refs), _M_grouping(0), _M_grouping_size(0),
 _M_use_grouping(false),
 _M_truename(0), _M_truename_size(0), _M_falsename(0),
 _M_falsename_size(0), _M_decimal_point(_CharT()),
 _M_thousands_sep(_CharT()), _M_allocated(false)
 { }

      ~__numpunct_cache();

      void
      _M_cache(const locale& __loc);

    private:
      __numpunct_cache&
      operator=(const __numpunct_cache&);

      explicit
      __numpunct_cache(const __numpunct_cache&);
    };

  template<typename _CharT>
    __numpunct_cache<_CharT>::~__numpunct_cache()
    {
      if (_M_allocated)
 {
   delete [] _M_grouping;
   delete [] _M_truename;
   delete [] _M_falsename;
 }
    }

namespace __cxx11 {
# 1665 "/usr/include/c++/5/bits/locale_facets.h" 3
  template<typename _CharT>
    class numpunct : public locale::facet
    {
    public:



      typedef _CharT char_type;
      typedef basic_string<_CharT> string_type;

      typedef __numpunct_cache<_CharT> __cache_type;

    protected:
      __cache_type* _M_data;

    public:

      static locale::id id;






      explicit
      numpunct(size_t __refs = 0)
      : facet(__refs), _M_data(0)
      { _M_initialize_numpunct(); }
# 1703 "/usr/include/c++/5/bits/locale_facets.h" 3
      explicit
      numpunct(__cache_type* __cache, size_t __refs = 0)
      : facet(__refs), _M_data(__cache)
      { _M_initialize_numpunct(); }
# 1717 "/usr/include/c++/5/bits/locale_facets.h" 3
      explicit
      numpunct(__c_locale __cloc, size_t __refs = 0)
      : facet(__refs), _M_data(0)
      { _M_initialize_numpunct(__cloc); }
# 1731 "/usr/include/c++/5/bits/locale_facets.h" 3
      char_type
      decimal_point() const
      { return this->do_decimal_point(); }
# 1744 "/usr/include/c++/5/bits/locale_facets.h" 3
      char_type
      thousands_sep() const
      { return this->do_thousands_sep(); }
# 1775 "/usr/include/c++/5/bits/locale_facets.h" 3
      string
      grouping() const
      { return this->do_grouping(); }
# 1788 "/usr/include/c++/5/bits/locale_facets.h" 3
      string_type
      truename() const
      { return this->do_truename(); }
# 1801 "/usr/include/c++/5/bits/locale_facets.h" 3
      string_type
      falsename() const
      { return this->do_falsename(); }

    protected:

      virtual
      ~numpunct();
# 1818 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual char_type
      do_decimal_point() const
      { return _M_data->_M_decimal_point; }
# 1830 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual char_type
      do_thousands_sep() const
      { return _M_data->_M_thousands_sep; }
# 1843 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual string
      do_grouping() const
      { return _M_data->_M_grouping; }
# 1856 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual string_type
      do_truename() const
      { return _M_data->_M_truename; }
# 1869 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual string_type
      do_falsename() const
      { return _M_data->_M_falsename; }


      void
      _M_initialize_numpunct(__c_locale __cloc = 0);
    };

  template<typename _CharT>
    locale::id numpunct<_CharT>::id;

  template<>
    numpunct<char>::~numpunct();

  template<>
    void
    numpunct<char>::_M_initialize_numpunct(__c_locale __cloc);


  template<>
    numpunct<wchar_t>::~numpunct();

  template<>
    void
    numpunct<wchar_t>::_M_initialize_numpunct(__c_locale __cloc);



  template<typename _CharT>
    class numpunct_byname : public numpunct<_CharT>
    {
    public:
      typedef _CharT char_type;
      typedef basic_string<_CharT> string_type;

      explicit
      numpunct_byname(const char* __s, size_t __refs = 0)
      : numpunct<_CharT>(__refs)
      {
 if (__builtin_strcmp(__s, "C") != 0
     && __builtin_strcmp(__s, "POSIX") != 0)
   {
     __c_locale __tmp;
     this->_S_create_c_locale(__tmp, __s);
     this->_M_initialize_numpunct(__tmp);
     this->_S_destroy_c_locale(__tmp);
   }
      }







    protected:
      virtual
      ~numpunct_byname() { }
    };

}


# 1947 "/usr/include/c++/5/bits/locale_facets.h" 3
  template<typename _CharT, typename _InIter>
    class num_get : public locale::facet
    {
    public:



      typedef _CharT char_type;
      typedef _InIter iter_type;



      static locale::id id;
# 1968 "/usr/include/c++/5/bits/locale_facets.h" 3
      explicit
      num_get(size_t __refs = 0) : facet(__refs) { }
# 1994 "/usr/include/c++/5/bits/locale_facets.h" 3
      iter_type
      get(iter_type __in, iter_type __end, ios_base& __io,
   ios_base::iostate& __err, bool& __v) const
      { return this->do_get(__in, __end, __io, __err, __v); }
# 2031 "/usr/include/c++/5/bits/locale_facets.h" 3
      iter_type
      get(iter_type __in, iter_type __end, ios_base& __io,
   ios_base::iostate& __err, long& __v) const
      { return this->do_get(__in, __end, __io, __err, __v); }

      iter_type
      get(iter_type __in, iter_type __end, ios_base& __io,
   ios_base::iostate& __err, unsigned short& __v) const
      { return this->do_get(__in, __end, __io, __err, __v); }

      iter_type
      get(iter_type __in, iter_type __end, ios_base& __io,
   ios_base::iostate& __err, unsigned int& __v) const
      { return this->do_get(__in, __end, __io, __err, __v); }

      iter_type
      get(iter_type __in, iter_type __end, ios_base& __io,
   ios_base::iostate& __err, unsigned long& __v) const
      { return this->do_get(__in, __end, __io, __err, __v); }


      iter_type
      get(iter_type __in, iter_type __end, ios_base& __io,
   ios_base::iostate& __err, long long& __v) const
      { return this->do_get(__in, __end, __io, __err, __v); }

      iter_type
      get(iter_type __in, iter_type __end, ios_base& __io,
   ios_base::iostate& __err, unsigned long long& __v) const
      { return this->do_get(__in, __end, __io, __err, __v); }
# 2091 "/usr/include/c++/5/bits/locale_facets.h" 3
      iter_type
      get(iter_type __in, iter_type __end, ios_base& __io,
   ios_base::iostate& __err, float& __v) const
      { return this->do_get(__in, __end, __io, __err, __v); }

      iter_type
      get(iter_type __in, iter_type __end, ios_base& __io,
   ios_base::iostate& __err, double& __v) const
      { return this->do_get(__in, __end, __io, __err, __v); }

      iter_type
      get(iter_type __in, iter_type __end, ios_base& __io,
   ios_base::iostate& __err, long double& __v) const
      { return this->do_get(__in, __end, __io, __err, __v); }
# 2134 "/usr/include/c++/5/bits/locale_facets.h" 3
      iter_type
      get(iter_type __in, iter_type __end, ios_base& __io,
   ios_base::iostate& __err, void*& __v) const
      { return this->do_get(__in, __end, __io, __err, __v); }

    protected:

      virtual ~num_get() { }

      __attribute ((__abi_tag__ ("cxx11")))
      iter_type
      _M_extract_float(iter_type, iter_type, ios_base&, ios_base::iostate&,
         string&) const;

      template<typename _ValueT>
 __attribute ((__abi_tag__ ("cxx11")))
 iter_type
 _M_extract_int(iter_type, iter_type, ios_base&, ios_base::iostate&,
         _ValueT&) const;

      template<typename _CharT2>
      typename __gnu_cxx::__enable_if<__is_char<_CharT2>::__value, int>::__type
 _M_find(const _CharT2*, size_t __len, _CharT2 __c) const
 {
   int __ret = -1;
   if (__len <= 10)
     {
       if (__c >= _CharT2('0') && __c < _CharT2(_CharT2('0') + __len))
  __ret = __c - _CharT2('0');
     }
   else
     {
       if (__c >= _CharT2('0') && __c <= _CharT2('9'))
  __ret = __c - _CharT2('0');
       else if (__c >= _CharT2('a') && __c <= _CharT2('f'))
  __ret = 10 + (__c - _CharT2('a'));
       else if (__c >= _CharT2('A') && __c <= _CharT2('F'))
  __ret = 10 + (__c - _CharT2('A'));
     }
   return __ret;
 }

      template<typename _CharT2>
      typename __gnu_cxx::__enable_if<!__is_char<_CharT2>::__value,
          int>::__type
 _M_find(const _CharT2* __zero, size_t __len, _CharT2 __c) const
 {
   int __ret = -1;
   const char_type* __q = char_traits<_CharT2>::find(__zero, __len, __c);
   if (__q)
     {
       __ret = __q - __zero;
       if (__ret > 15)
  __ret -= 6;
     }
   return __ret;
 }
# 2207 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual iter_type
      do_get(iter_type, iter_type, ios_base&, ios_base::iostate&, bool&) const;

      virtual iter_type
      do_get(iter_type __beg, iter_type __end, ios_base& __io,
      ios_base::iostate& __err, long& __v) const
      { return _M_extract_int(__beg, __end, __io, __err, __v); }

      virtual iter_type
      do_get(iter_type __beg, iter_type __end, ios_base& __io,
      ios_base::iostate& __err, unsigned short& __v) const
      { return _M_extract_int(__beg, __end, __io, __err, __v); }

      virtual iter_type
      do_get(iter_type __beg, iter_type __end, ios_base& __io,
      ios_base::iostate& __err, unsigned int& __v) const
      { return _M_extract_int(__beg, __end, __io, __err, __v); }

      virtual iter_type
      do_get(iter_type __beg, iter_type __end, ios_base& __io,
      ios_base::iostate& __err, unsigned long& __v) const
      { return _M_extract_int(__beg, __end, __io, __err, __v); }


      virtual iter_type
      do_get(iter_type __beg, iter_type __end, ios_base& __io,
      ios_base::iostate& __err, long long& __v) const
      { return _M_extract_int(__beg, __end, __io, __err, __v); }

      virtual iter_type
      do_get(iter_type __beg, iter_type __end, ios_base& __io,
      ios_base::iostate& __err, unsigned long long& __v) const
      { return _M_extract_int(__beg, __end, __io, __err, __v); }


      virtual iter_type
      do_get(iter_type, iter_type, ios_base&, ios_base::iostate&, float&) const;

      virtual iter_type
      do_get(iter_type, iter_type, ios_base&, ios_base::iostate&,
      double&) const;







      virtual iter_type
      do_get(iter_type, iter_type, ios_base&, ios_base::iostate&,
      long double&) const;


      virtual iter_type
      do_get(iter_type, iter_type, ios_base&, ios_base::iostate&, void*&) const;
# 2270 "/usr/include/c++/5/bits/locale_facets.h" 3
    };

  template<typename _CharT, typename _InIter>
    locale::id num_get<_CharT, _InIter>::id;
# 2288 "/usr/include/c++/5/bits/locale_facets.h" 3
  template<typename _CharT, typename _OutIter>
    class num_put : public locale::facet
    {
    public:



      typedef _CharT char_type;
      typedef _OutIter iter_type;



      static locale::id id;
# 2309 "/usr/include/c++/5/bits/locale_facets.h" 3
      explicit
      num_put(size_t __refs = 0) : facet(__refs) { }
# 2327 "/usr/include/c++/5/bits/locale_facets.h" 3
      iter_type
      put(iter_type __s, ios_base& __io, char_type __fill, bool __v) const
      { return this->do_put(__s, __io, __fill, __v); }
# 2369 "/usr/include/c++/5/bits/locale_facets.h" 3
      iter_type
      put(iter_type __s, ios_base& __io, char_type __fill, long __v) const
      { return this->do_put(__s, __io, __fill, __v); }

      iter_type
      put(iter_type __s, ios_base& __io, char_type __fill,
   unsigned long __v) const
      { return this->do_put(__s, __io, __fill, __v); }


      iter_type
      put(iter_type __s, ios_base& __io, char_type __fill, long long __v) const
      { return this->do_put(__s, __io, __fill, __v); }

      iter_type
      put(iter_type __s, ios_base& __io, char_type __fill,
   unsigned long long __v) const
      { return this->do_put(__s, __io, __fill, __v); }
# 2432 "/usr/include/c++/5/bits/locale_facets.h" 3
      iter_type
      put(iter_type __s, ios_base& __io, char_type __fill, double __v) const
      { return this->do_put(__s, __io, __fill, __v); }

      iter_type
      put(iter_type __s, ios_base& __io, char_type __fill,
   long double __v) const
      { return this->do_put(__s, __io, __fill, __v); }
# 2457 "/usr/include/c++/5/bits/locale_facets.h" 3
      iter_type
      put(iter_type __s, ios_base& __io, char_type __fill,
   const void* __v) const
      { return this->do_put(__s, __io, __fill, __v); }

    protected:
      template<typename _ValueT>
 iter_type
 _M_insert_float(iter_type, ios_base& __io, char_type __fill,
   char __mod, _ValueT __v) const;

      void
      _M_group_float(const char* __grouping, size_t __grouping_size,
       char_type __sep, const char_type* __p, char_type* __new,
       char_type* __cs, int& __len) const;

      template<typename _ValueT>
 iter_type
 _M_insert_int(iter_type, ios_base& __io, char_type __fill,
        _ValueT __v) const;

      void
      _M_group_int(const char* __grouping, size_t __grouping_size,
     char_type __sep, ios_base& __io, char_type* __new,
     char_type* __cs, int& __len) const;

      void
      _M_pad(char_type __fill, streamsize __w, ios_base& __io,
      char_type* __new, const char_type* __cs, int& __len) const;


      virtual
      ~num_put() { };
# 2505 "/usr/include/c++/5/bits/locale_facets.h" 3
      virtual iter_type
      do_put(iter_type __s, ios_base& __io, char_type __fill, bool __v) const;

      virtual iter_type
      do_put(iter_type __s, ios_base& __io, char_type __fill, long __v) const
      { return _M_insert_int(__s, __io, __fill, __v); }

      virtual iter_type
      do_put(iter_type __s, ios_base& __io, char_type __fill,
      unsigned long __v) const
      { return _M_insert_int(__s, __io, __fill, __v); }


      virtual iter_type
      do_put(iter_type __s, ios_base& __io, char_type __fill,
      long long __v) const
      { return _M_insert_int(__s, __io, __fill, __v); }

      virtual iter_type
      do_put(iter_type __s, ios_base& __io, char_type __fill,
      unsigned long long __v) const
      { return _M_insert_int(__s, __io, __fill, __v); }


      virtual iter_type
      do_put(iter_type, ios_base&, char_type, double) const;






      virtual iter_type
      do_put(iter_type, ios_base&, char_type, long double) const;


      virtual iter_type
      do_put(iter_type, ios_base&, char_type, const void*) const;







    };

  template <typename _CharT, typename _OutIter>
    locale::id num_put<_CharT, _OutIter>::id;









  template<typename _CharT>
    inline bool
    isspace(_CharT __c, const locale& __loc)
    { return use_facet<ctype<_CharT> >(__loc).is(ctype_base::space, __c); }


  template<typename _CharT>
    inline bool
    isprint(_CharT __c, const locale& __loc)
    { return use_facet<ctype<_CharT> >(__loc).is(ctype_base::print, __c); }


  template<typename _CharT>
    inline bool
    iscntrl(_CharT __c, const locale& __loc)
    { return use_facet<ctype<_CharT> >(__loc).is(ctype_base::cntrl, __c); }


  template<typename _CharT>
    inline bool
    isupper(_CharT __c, const locale& __loc)
    { return use_facet<ctype<_CharT> >(__loc).is(ctype_base::upper, __c); }


  template<typename _CharT>
    inline bool
    islower(_CharT __c, const locale& __loc)
    { return use_facet<ctype<_CharT> >(__loc).is(ctype_base::lower, __c); }


  template<typename _CharT>
    inline bool
    isalpha(_CharT __c, const locale& __loc)
    { return use_facet<ctype<_CharT> >(__loc).is(ctype_base::alpha, __c); }


  template<typename _CharT>
    inline bool
    isdigit(_CharT __c, const locale& __loc)
    { return use_facet<ctype<_CharT> >(__loc).is(ctype_base::digit, __c); }


  template<typename _CharT>
    inline bool
    ispunct(_CharT __c, const locale& __loc)
    { return use_facet<ctype<_CharT> >(__loc).is(ctype_base::punct, __c); }


  template<typename _CharT>
    inline bool
    isxdigit(_CharT __c, const locale& __loc)
    { return use_facet<ctype<_CharT> >(__loc).is(ctype_base::xdigit, __c); }


  template<typename _CharT>
    inline bool
    isalnum(_CharT __c, const locale& __loc)
    { return use_facet<ctype<_CharT> >(__loc).is(ctype_base::alnum, __c); }


  template<typename _CharT>
    inline bool
    isgraph(_CharT __c, const locale& __loc)
    { return use_facet<ctype<_CharT> >(__loc).is(ctype_base::graph, __c); }
# 2637 "/usr/include/c++/5/bits/locale_facets.h" 3
  template<typename _CharT>
    inline _CharT
    toupper(_CharT __c, const locale& __loc)
    { return use_facet<ctype<_CharT> >(__loc).toupper(__c); }


  template<typename _CharT>
    inline _CharT
    tolower(_CharT __c, const locale& __loc)
    { return use_facet<ctype<_CharT> >(__loc).tolower(__c); }


}

# 1 "/usr/include/c++/5/bits/locale_facets.tcc" 1 3
# 33 "/usr/include/c++/5/bits/locale_facets.tcc" 3
       
# 34 "/usr/include/c++/5/bits/locale_facets.tcc" 3

namespace std __attribute__ ((__visibility__ ("default")))
{




  template<typename _Facet>
    struct __use_cache
    {
      const _Facet*
      operator() (const locale& __loc) const;
    };


  template<typename _CharT>
    struct __use_cache<__numpunct_cache<_CharT> >
    {
      const __numpunct_cache<_CharT>*
      operator() (const locale& __loc) const
      {
 const size_t __i = numpunct<_CharT>::id._M_id();
 const locale::facet** __caches = __loc._M_impl->_M_caches;
 if (!__caches[__i])
   {
     __numpunct_cache<_CharT>* __tmp = 0;
     try
       {
  __tmp = new __numpunct_cache<_CharT>;
  __tmp->_M_cache(__loc);
       }
     catch(...)
       {
  delete __tmp;
  throw;
       }
     __loc._M_impl->_M_install_cache(__tmp, __i);
   }
 return static_cast<const __numpunct_cache<_CharT>*>(__caches[__i]);
      }
    };

  template<typename _CharT>
    void
    __numpunct_cache<_CharT>::_M_cache(const locale& __loc)
    {
      const numpunct<_CharT>& __np = use_facet<numpunct<_CharT> >(__loc);

      char* __grouping = 0;
      _CharT* __truename = 0;
      _CharT* __falsename = 0;
      try
 {
   const string& __g = __np.grouping();
   _M_grouping_size = __g.size();
   __grouping = new char[_M_grouping_size];
   __g.copy(__grouping, _M_grouping_size);
   _M_use_grouping = (_M_grouping_size
        && static_cast<signed char>(__grouping[0]) > 0
        && (__grouping[0]
     != __gnu_cxx::__numeric_traits<char>::__max));

   const basic_string<_CharT>& __tn = __np.truename();
   _M_truename_size = __tn.size();
   __truename = new _CharT[_M_truename_size];
   __tn.copy(__truename, _M_truename_size);

   const basic_string<_CharT>& __fn = __np.falsename();
   _M_falsename_size = __fn.size();
   __falsename = new _CharT[_M_falsename_size];
   __fn.copy(__falsename, _M_falsename_size);

   _M_decimal_point = __np.decimal_point();
   _M_thousands_sep = __np.thousands_sep();

   const ctype<_CharT>& __ct = use_facet<ctype<_CharT> >(__loc);
   __ct.widen(__num_base::_S_atoms_out,
       __num_base::_S_atoms_out
       + __num_base::_S_oend, _M_atoms_out);
   __ct.widen(__num_base::_S_atoms_in,
       __num_base::_S_atoms_in
       + __num_base::_S_iend, _M_atoms_in);

   _M_grouping = __grouping;
   _M_truename = __truename;
   _M_falsename = __falsename;
   _M_allocated = true;
 }
      catch(...)
 {
   delete [] __grouping;
   delete [] __truename;
   delete [] __falsename;
   throw;
 }
    }
# 139 "/usr/include/c++/5/bits/locale_facets.tcc" 3
  __attribute__ ((__pure__)) bool
  __verify_grouping(const char* __grouping, size_t __grouping_size,
      const string& __grouping_tmp) throw ();



  template<typename _CharT, typename _InIter>
    __attribute ((__abi_tag__ ("cxx11")))
    _InIter
    num_get<_CharT, _InIter>::
    _M_extract_float(_InIter __beg, _InIter __end, ios_base& __io,
       ios_base::iostate& __err, string& __xtrc) const
    {
      typedef char_traits<_CharT> __traits_type;
      typedef __numpunct_cache<_CharT> __cache_type;
      __use_cache<__cache_type> __uc;
      const locale& __loc = __io._M_getloc();
      const __cache_type* __lc = __uc(__loc);
      const _CharT* __lit = __lc->_M_atoms_in;
      char_type __c = char_type();


      bool __testeof = __beg == __end;


      if (!__testeof)
 {
   __c = *__beg;
   const bool __plus = __c == __lit[__num_base::_S_iplus];
   if ((__plus || __c == __lit[__num_base::_S_iminus])
       && !(__lc->_M_use_grouping && __c == __lc->_M_thousands_sep)
       && !(__c == __lc->_M_decimal_point))
     {
       __xtrc += __plus ? '+' : '-';
       if (++__beg != __end)
  __c = *__beg;
       else
  __testeof = true;
     }
 }


      bool __found_mantissa = false;
      int __sep_pos = 0;
      while (!__testeof)
 {
   if ((__lc->_M_use_grouping && __c == __lc->_M_thousands_sep)
       || __c == __lc->_M_decimal_point)
     break;
   else if (__c == __lit[__num_base::_S_izero])
     {
       if (!__found_mantissa)
  {
    __xtrc += '0';
    __found_mantissa = true;
  }
       ++__sep_pos;

       if (++__beg != __end)
  __c = *__beg;
       else
  __testeof = true;
     }
   else
     break;
 }


      bool __found_dec = false;
      bool __found_sci = false;
      string __found_grouping;
      if (__lc->_M_use_grouping)
 __found_grouping.reserve(32);
      const char_type* __lit_zero = __lit + __num_base::_S_izero;

      if (!__lc->_M_allocated)

 while (!__testeof)
   {
     const int __digit = _M_find(__lit_zero, 10, __c);
     if (__digit != -1)
       {
  __xtrc += '0' + __digit;
  __found_mantissa = true;
       }
     else if (__c == __lc->_M_decimal_point
       && !__found_dec && !__found_sci)
       {
  __xtrc += '.';
  __found_dec = true;
       }
     else if ((__c == __lit[__num_base::_S_ie]
        || __c == __lit[__num_base::_S_iE])
       && !__found_sci && __found_mantissa)
       {

  __xtrc += 'e';
  __found_sci = true;


  if (++__beg != __end)
    {
      __c = *__beg;
      const bool __plus = __c == __lit[__num_base::_S_iplus];
      if (__plus || __c == __lit[__num_base::_S_iminus])
        __xtrc += __plus ? '+' : '-';
      else
        continue;
    }
  else
    {
      __testeof = true;
      break;
    }
       }
     else
       break;

     if (++__beg != __end)
       __c = *__beg;
     else
       __testeof = true;
   }
      else
 while (!__testeof)
   {


     if (__lc->_M_use_grouping && __c == __lc->_M_thousands_sep)
       {
  if (!__found_dec && !__found_sci)
    {


      if (__sep_pos)
        {
   __found_grouping += static_cast<char>(__sep_pos);
   __sep_pos = 0;
        }
      else
        {


   __xtrc.clear();
   break;
        }
    }
  else
    break;
       }
     else if (__c == __lc->_M_decimal_point)
       {
  if (!__found_dec && !__found_sci)
    {



      if (__found_grouping.size())
        __found_grouping += static_cast<char>(__sep_pos);
      __xtrc += '.';
      __found_dec = true;
    }
  else
    break;
       }
     else
       {
  const char_type* __q =
    __traits_type::find(__lit_zero, 10, __c);
  if (__q)
    {
      __xtrc += '0' + (__q - __lit_zero);
      __found_mantissa = true;
      ++__sep_pos;
    }
  else if ((__c == __lit[__num_base::_S_ie]
     || __c == __lit[__num_base::_S_iE])
    && !__found_sci && __found_mantissa)
    {

      if (__found_grouping.size() && !__found_dec)
        __found_grouping += static_cast<char>(__sep_pos);
      __xtrc += 'e';
      __found_sci = true;


      if (++__beg != __end)
        {
   __c = *__beg;
   const bool __plus = __c == __lit[__num_base::_S_iplus];
   if ((__plus || __c == __lit[__num_base::_S_iminus])
       && !(__lc->_M_use_grouping
     && __c == __lc->_M_thousands_sep)
       && !(__c == __lc->_M_decimal_point))
        __xtrc += __plus ? '+' : '-';
   else
     continue;
        }
      else
        {
   __testeof = true;
   break;
        }
    }
  else
    break;
       }

     if (++__beg != __end)
       __c = *__beg;
     else
       __testeof = true;
   }



      if (__found_grouping.size())
        {

   if (!__found_dec && !__found_sci)
     __found_grouping += static_cast<char>(__sep_pos);

          if (!std::__verify_grouping(__lc->_M_grouping,
          __lc->_M_grouping_size,
          __found_grouping))
     __err = ios_base::failbit;
        }

      return __beg;
    }

  template<typename _CharT, typename _InIter>
    template<typename _ValueT>
      __attribute ((__abi_tag__ ("cxx11")))
      _InIter
      num_get<_CharT, _InIter>::
      _M_extract_int(_InIter __beg, _InIter __end, ios_base& __io,
       ios_base::iostate& __err, _ValueT& __v) const
      {
        typedef char_traits<_CharT> __traits_type;
 using __gnu_cxx::__add_unsigned;
 typedef typename __add_unsigned<_ValueT>::__type __unsigned_type;
 typedef __numpunct_cache<_CharT> __cache_type;
 __use_cache<__cache_type> __uc;
 const locale& __loc = __io._M_getloc();
 const __cache_type* __lc = __uc(__loc);
 const _CharT* __lit = __lc->_M_atoms_in;
 char_type __c = char_type();


 const ios_base::fmtflags __basefield = __io.flags()
                                        & ios_base::basefield;
 const bool __oct = __basefield == ios_base::oct;
 int __base = __oct ? 8 : (__basefield == ios_base::hex ? 16 : 10);


 bool __testeof = __beg == __end;


 bool __negative = false;
 if (!__testeof)
   {
     __c = *__beg;
     __negative = __c == __lit[__num_base::_S_iminus];
     if ((__negative || __c == __lit[__num_base::_S_iplus])
  && !(__lc->_M_use_grouping && __c == __lc->_M_thousands_sep)
  && !(__c == __lc->_M_decimal_point))
       {
  if (++__beg != __end)
    __c = *__beg;
  else
    __testeof = true;
       }
   }



 bool __found_zero = false;
 int __sep_pos = 0;
 while (!__testeof)
   {
     if ((__lc->_M_use_grouping && __c == __lc->_M_thousands_sep)
  || __c == __lc->_M_decimal_point)
       break;
     else if (__c == __lit[__num_base::_S_izero]
       && (!__found_zero || __base == 10))
       {
  __found_zero = true;
  ++__sep_pos;
  if (__basefield == 0)
    __base = 8;
  if (__base == 8)
    __sep_pos = 0;
       }
     else if (__found_zero
       && (__c == __lit[__num_base::_S_ix]
    || __c == __lit[__num_base::_S_iX]))
       {
  if (__basefield == 0)
    __base = 16;
  if (__base == 16)
    {
      __found_zero = false;
      __sep_pos = 0;
    }
  else
    break;
       }
     else
       break;

     if (++__beg != __end)
       {
  __c = *__beg;
  if (!__found_zero)
    break;
       }
     else
       __testeof = true;
   }



 const size_t __len = (__base == 16 ? __num_base::_S_iend
         - __num_base::_S_izero : __base);


 string __found_grouping;
 if (__lc->_M_use_grouping)
   __found_grouping.reserve(32);
 bool __testfail = false;
 bool __testoverflow = false;
 const __unsigned_type __max =
   (__negative && __gnu_cxx::__numeric_traits<_ValueT>::__is_signed)
   ? -__gnu_cxx::__numeric_traits<_ValueT>::__min
   : __gnu_cxx::__numeric_traits<_ValueT>::__max;
 const __unsigned_type __smax = __max / __base;
 __unsigned_type __result = 0;
 int __digit = 0;
 const char_type* __lit_zero = __lit + __num_base::_S_izero;

 if (!__lc->_M_allocated)

   while (!__testeof)
     {
       __digit = _M_find(__lit_zero, __len, __c);
       if (__digit == -1)
  break;

       if (__result > __smax)
  __testoverflow = true;
       else
  {
    __result *= __base;
    __testoverflow |= __result > __max - __digit;
    __result += __digit;
    ++__sep_pos;
  }

       if (++__beg != __end)
  __c = *__beg;
       else
  __testeof = true;
     }
 else
   while (!__testeof)
     {


       if (__lc->_M_use_grouping && __c == __lc->_M_thousands_sep)
  {


    if (__sep_pos)
      {
        __found_grouping += static_cast<char>(__sep_pos);
        __sep_pos = 0;
      }
    else
      {
        __testfail = true;
        break;
      }
  }
       else if (__c == __lc->_M_decimal_point)
  break;
       else
  {
    const char_type* __q =
      __traits_type::find(__lit_zero, __len, __c);
    if (!__q)
      break;

    __digit = __q - __lit_zero;
    if (__digit > 15)
      __digit -= 6;
    if (__result > __smax)
      __testoverflow = true;
    else
      {
        __result *= __base;
        __testoverflow |= __result > __max - __digit;
        __result += __digit;
        ++__sep_pos;
      }
  }

       if (++__beg != __end)
  __c = *__beg;
       else
  __testeof = true;
     }



 if (__found_grouping.size())
   {

     __found_grouping += static_cast<char>(__sep_pos);

     if (!std::__verify_grouping(__lc->_M_grouping,
     __lc->_M_grouping_size,
     __found_grouping))
       __err = ios_base::failbit;
   }



 if ((!__sep_pos && !__found_zero && !__found_grouping.size())
     || __testfail)
   {
     __v = 0;
     __err = ios_base::failbit;
   }
 else if (__testoverflow)
   {
     if (__negative
  && __gnu_cxx::__numeric_traits<_ValueT>::__is_signed)
       __v = __gnu_cxx::__numeric_traits<_ValueT>::__min;
     else
       __v = __gnu_cxx::__numeric_traits<_ValueT>::__max;
     __err = ios_base::failbit;
   }
 else
   __v = __negative ? -__result : __result;

 if (__testeof)
   __err |= ios_base::eofbit;
 return __beg;
      }



  template<typename _CharT, typename _InIter>
    _InIter
    num_get<_CharT, _InIter>::
    do_get(iter_type __beg, iter_type __end, ios_base& __io,
           ios_base::iostate& __err, bool& __v) const
    {
      if (!(__io.flags() & ios_base::boolalpha))
        {



   long __l = -1;
          __beg = _M_extract_int(__beg, __end, __io, __err, __l);
   if (__l == 0 || __l == 1)
     __v = bool(__l);
   else
     {


       __v = true;
       __err = ios_base::failbit;
       if (__beg == __end)
  __err |= ios_base::eofbit;
     }
        }
      else
        {

   typedef __numpunct_cache<_CharT> __cache_type;
   __use_cache<__cache_type> __uc;
   const locale& __loc = __io._M_getloc();
   const __cache_type* __lc = __uc(__loc);

   bool __testf = true;
   bool __testt = true;
   bool __donef = __lc->_M_falsename_size == 0;
   bool __donet = __lc->_M_truename_size == 0;
   bool __testeof = false;
   size_t __n = 0;
   while (!__donef || !__donet)
     {
       if (__beg == __end)
  {
    __testeof = true;
    break;
  }

       const char_type __c = *__beg;

       if (!__donef)
  __testf = __c == __lc->_M_falsename[__n];

       if (!__testf && __donet)
  break;

       if (!__donet)
  __testt = __c == __lc->_M_truename[__n];

       if (!__testt && __donef)
  break;

       if (!__testt && !__testf)
  break;

       ++__n;
       ++__beg;

       __donef = !__testf || __n >= __lc->_M_falsename_size;
       __donet = !__testt || __n >= __lc->_M_truename_size;
     }
   if (__testf && __n == __lc->_M_falsename_size && __n)
     {
       __v = false;
       if (__testt && __n == __lc->_M_truename_size)
  __err = ios_base::failbit;
       else
  __err = __testeof ? ios_base::eofbit : ios_base::goodbit;
     }
   else if (__testt && __n == __lc->_M_truename_size && __n)
     {
       __v = true;
       __err = __testeof ? ios_base::eofbit : ios_base::goodbit;
     }
   else
     {


       __v = false;
       __err = ios_base::failbit;
       if (__testeof)
  __err |= ios_base::eofbit;
     }
 }
      return __beg;
    }

  template<typename _CharT, typename _InIter>
    _InIter
    num_get<_CharT, _InIter>::
    do_get(iter_type __beg, iter_type __end, ios_base& __io,
    ios_base::iostate& __err, float& __v) const
    {
      string __xtrc;
      __xtrc.reserve(32);
      __beg = _M_extract_float(__beg, __end, __io, __err, __xtrc);
      std::__convert_to_v(__xtrc.c_str(), __v, __err, _S_get_c_locale());
      if (__beg == __end)
 __err |= ios_base::eofbit;
      return __beg;
    }

  template<typename _CharT, typename _InIter>
    _InIter
    num_get<_CharT, _InIter>::
    do_get(iter_type __beg, iter_type __end, ios_base& __io,
           ios_base::iostate& __err, double& __v) const
    {
      string __xtrc;
      __xtrc.reserve(32);
      __beg = _M_extract_float(__beg, __end, __io, __err, __xtrc);
      std::__convert_to_v(__xtrc.c_str(), __v, __err, _S_get_c_locale());
      if (__beg == __end)
 __err |= ios_base::eofbit;
      return __beg;
    }
# 735 "/usr/include/c++/5/bits/locale_facets.tcc" 3
  template<typename _CharT, typename _InIter>
    _InIter
    num_get<_CharT, _InIter>::
    do_get(iter_type __beg, iter_type __end, ios_base& __io,
           ios_base::iostate& __err, long double& __v) const
    {
      string __xtrc;
      __xtrc.reserve(32);
      __beg = _M_extract_float(__beg, __end, __io, __err, __xtrc);
      std::__convert_to_v(__xtrc.c_str(), __v, __err, _S_get_c_locale());
      if (__beg == __end)
 __err |= ios_base::eofbit;
      return __beg;
    }

  template<typename _CharT, typename _InIter>
    _InIter
    num_get<_CharT, _InIter>::
    do_get(iter_type __beg, iter_type __end, ios_base& __io,
           ios_base::iostate& __err, void*& __v) const
    {

      typedef ios_base::fmtflags fmtflags;
      const fmtflags __fmt = __io.flags();
      __io.flags((__fmt & ~ios_base::basefield) | ios_base::hex);

      typedef __gnu_cxx::__conditional_type<(sizeof(void*)
          <= sizeof(unsigned long)),
 unsigned long, unsigned long long>::__type _UIntPtrType;

      _UIntPtrType __ul;
      __beg = _M_extract_int(__beg, __end, __io, __err, __ul);


      __io.flags(__fmt);

      __v = reinterpret_cast<void*>(__ul);
      return __beg;
    }



  template<typename _CharT, typename _OutIter>
    void
    num_put<_CharT, _OutIter>::
    _M_pad(_CharT __fill, streamsize __w, ios_base& __io,
    _CharT* __new, const _CharT* __cs, int& __len) const
    {


      __pad<_CharT, char_traits<_CharT> >::_S_pad(__io, __fill, __new,
        __cs, __w, __len);
      __len = static_cast<int>(__w);
    }



  template<typename _CharT, typename _ValueT>
    int
    __int_to_char(_CharT* __bufend, _ValueT __v, const _CharT* __lit,
    ios_base::fmtflags __flags, bool __dec)
    {
      _CharT* __buf = __bufend;
      if (__builtin_expect(__dec, true))
 {

   do
     {
       *--__buf = __lit[(__v % 10) + __num_base::_S_odigits];
       __v /= 10;
     }
   while (__v != 0);
 }
      else if ((__flags & ios_base::basefield) == ios_base::oct)
 {

   do
     {
       *--__buf = __lit[(__v & 0x7) + __num_base::_S_odigits];
       __v >>= 3;
     }
   while (__v != 0);
 }
      else
 {

   const bool __uppercase = __flags & ios_base::uppercase;
   const int __case_offset = __uppercase ? __num_base::_S_oudigits
                                         : __num_base::_S_odigits;
   do
     {
       *--__buf = __lit[(__v & 0xf) + __case_offset];
       __v >>= 4;
     }
   while (__v != 0);
 }
      return __bufend - __buf;
    }



  template<typename _CharT, typename _OutIter>
    void
    num_put<_CharT, _OutIter>::
    _M_group_int(const char* __grouping, size_t __grouping_size, _CharT __sep,
   ios_base&, _CharT* __new, _CharT* __cs, int& __len) const
    {
      _CharT* __p = std::__add_grouping(__new, __sep, __grouping,
     __grouping_size, __cs, __cs + __len);
      __len = __p - __new;
    }

  template<typename _CharT, typename _OutIter>
    template<typename _ValueT>
      _OutIter
      num_put<_CharT, _OutIter>::
      _M_insert_int(_OutIter __s, ios_base& __io, _CharT __fill,
      _ValueT __v) const
      {
 using __gnu_cxx::__add_unsigned;
 typedef typename __add_unsigned<_ValueT>::__type __unsigned_type;
 typedef __numpunct_cache<_CharT> __cache_type;
 __use_cache<__cache_type> __uc;
 const locale& __loc = __io._M_getloc();
 const __cache_type* __lc = __uc(__loc);
 const _CharT* __lit = __lc->_M_atoms_out;
 const ios_base::fmtflags __flags = __io.flags();


 const int __ilen = 5 * sizeof(_ValueT);
 _CharT* __cs = static_cast<_CharT*>(__builtin_alloca(sizeof(_CharT)
            * __ilen));



 const ios_base::fmtflags __basefield = __flags & ios_base::basefield;
 const bool __dec = (__basefield != ios_base::oct
       && __basefield != ios_base::hex);
 const __unsigned_type __u = ((__v > 0 || !__dec)
         ? __unsigned_type(__v)
         : -__unsigned_type(__v));
  int __len = __int_to_char(__cs + __ilen, __u, __lit, __flags, __dec);
 __cs += __ilen - __len;


 if (__lc->_M_use_grouping)
   {


     _CharT* __cs2 = static_cast<_CharT*>(__builtin_alloca(sizeof(_CharT)
          * (__len + 1)
          * 2));
     _M_group_int(__lc->_M_grouping, __lc->_M_grouping_size,
    __lc->_M_thousands_sep, __io, __cs2 + 2, __cs, __len);
     __cs = __cs2 + 2;
   }


 if (__builtin_expect(__dec, true))
   {

     if (__v >= 0)
       {
  if (bool(__flags & ios_base::showpos)
      && __gnu_cxx::__numeric_traits<_ValueT>::__is_signed)
    *--__cs = __lit[__num_base::_S_oplus], ++__len;
       }
     else
       *--__cs = __lit[__num_base::_S_ominus], ++__len;
   }
 else if (bool(__flags & ios_base::showbase) && __v)
   {
     if (__basefield == ios_base::oct)
       *--__cs = __lit[__num_base::_S_odigits], ++__len;
     else
       {

  const bool __uppercase = __flags & ios_base::uppercase;
  *--__cs = __lit[__num_base::_S_ox + __uppercase];

  *--__cs = __lit[__num_base::_S_odigits];
  __len += 2;
       }
   }


 const streamsize __w = __io.width();
 if (__w > static_cast<streamsize>(__len))
   {
     _CharT* __cs3 = static_cast<_CharT*>(__builtin_alloca(sizeof(_CharT)
          * __w));
     _M_pad(__fill, __w, __io, __cs3, __cs, __len);
     __cs = __cs3;
   }
 __io.width(0);



 return std::__write(__s, __cs, __len);
      }

  template<typename _CharT, typename _OutIter>
    void
    num_put<_CharT, _OutIter>::
    _M_group_float(const char* __grouping, size_t __grouping_size,
     _CharT __sep, const _CharT* __p, _CharT* __new,
     _CharT* __cs, int& __len) const
    {



      const int __declen = __p ? __p - __cs : __len;
      _CharT* __p2 = std::__add_grouping(__new, __sep, __grouping,
      __grouping_size,
      __cs, __cs + __declen);


      int __newlen = __p2 - __new;
      if (__p)
 {
   char_traits<_CharT>::copy(__p2, __p, __len - __declen);
   __newlen += __len - __declen;
 }
      __len = __newlen;
    }
# 971 "/usr/include/c++/5/bits/locale_facets.tcc" 3
  template<typename _CharT, typename _OutIter>
    template<typename _ValueT>
      _OutIter
      num_put<_CharT, _OutIter>::
      _M_insert_float(_OutIter __s, ios_base& __io, _CharT __fill, char __mod,
         _ValueT __v) const
      {
 typedef __numpunct_cache<_CharT> __cache_type;
 __use_cache<__cache_type> __uc;
 const locale& __loc = __io._M_getloc();
 const __cache_type* __lc = __uc(__loc);


 const streamsize __prec = __io.precision() < 0 ? 6 : __io.precision();

 const int __max_digits =
   __gnu_cxx::__numeric_traits<_ValueT>::__digits10;


 int __len;

 char __fbuf[16];
 __num_base::_S_format_float(__io, __fbuf, __mod);



 const bool __use_prec =
   (__io.flags() & ios_base::floatfield) != ios_base::floatfield;



 int __cs_size = __max_digits * 3;
 char* __cs = static_cast<char*>(__builtin_alloca(__cs_size));
 if (__use_prec)
   __len = std::__convert_from_v(_S_get_c_locale(), __cs, __cs_size,
     __fbuf, __prec, __v);
 else
   __len = std::__convert_from_v(_S_get_c_locale(), __cs, __cs_size,
     __fbuf, __v);


 if (__len >= __cs_size)
   {
     __cs_size = __len + 1;
     __cs = static_cast<char*>(__builtin_alloca(__cs_size));
     if (__use_prec)
       __len = std::__convert_from_v(_S_get_c_locale(), __cs, __cs_size,
         __fbuf, __prec, __v);
     else
       __len = std::__convert_from_v(_S_get_c_locale(), __cs, __cs_size,
         __fbuf, __v);
   }
# 1044 "/usr/include/c++/5/bits/locale_facets.tcc" 3
 const ctype<_CharT>& __ctype = use_facet<ctype<_CharT> >(__loc);

 _CharT* __ws = static_cast<_CharT*>(__builtin_alloca(sizeof(_CharT)
            * __len));
 __ctype.widen(__cs, __cs + __len, __ws);


 _CharT* __wp = 0;
 const char* __p = char_traits<char>::find(__cs, __len, '.');
 if (__p)
   {
     __wp = __ws + (__p - __cs);
     *__wp = __lc->_M_decimal_point;
   }




 if (__lc->_M_use_grouping
     && (__wp || __len < 3 || (__cs[1] <= '9' && __cs[2] <= '9'
          && __cs[1] >= '0' && __cs[2] >= '0')))
   {


     _CharT* __ws2 = static_cast<_CharT*>(__builtin_alloca(sizeof(_CharT)
          * __len * 2));

     streamsize __off = 0;
     if (__cs[0] == '-' || __cs[0] == '+')
       {
  __off = 1;
  __ws2[0] = __ws[0];
  __len -= 1;
       }

     _M_group_float(__lc->_M_grouping, __lc->_M_grouping_size,
      __lc->_M_thousands_sep, __wp, __ws2 + __off,
      __ws + __off, __len);
     __len += __off;

     __ws = __ws2;
   }


 const streamsize __w = __io.width();
 if (__w > static_cast<streamsize>(__len))
   {
     _CharT* __ws3 = static_cast<_CharT*>(__builtin_alloca(sizeof(_CharT)
          * __w));
     _M_pad(__fill, __w, __io, __ws3, __ws, __len);
     __ws = __ws3;
   }
 __io.width(0);



 return std::__write(__s, __ws, __len);
      }

  template<typename _CharT, typename _OutIter>
    _OutIter
    num_put<_CharT, _OutIter>::
    do_put(iter_type __s, ios_base& __io, char_type __fill, bool __v) const
    {
      const ios_base::fmtflags __flags = __io.flags();
      if ((__flags & ios_base::boolalpha) == 0)
        {
          const long __l = __v;
          __s = _M_insert_int(__s, __io, __fill, __l);
        }
      else
        {
   typedef __numpunct_cache<_CharT> __cache_type;
   __use_cache<__cache_type> __uc;
   const locale& __loc = __io._M_getloc();
   const __cache_type* __lc = __uc(__loc);

   const _CharT* __name = __v ? __lc->_M_truename
                              : __lc->_M_falsename;
   int __len = __v ? __lc->_M_truename_size
                   : __lc->_M_falsename_size;

   const streamsize __w = __io.width();
   if (__w > static_cast<streamsize>(__len))
     {
       const streamsize __plen = __w - __len;
       _CharT* __ps
  = static_cast<_CharT*>(__builtin_alloca(sizeof(_CharT)
       * __plen));

       char_traits<_CharT>::assign(__ps, __plen, __fill);
       __io.width(0);

       if ((__flags & ios_base::adjustfield) == ios_base::left)
  {
    __s = std::__write(__s, __name, __len);
    __s = std::__write(__s, __ps, __plen);
  }
       else
  {
    __s = std::__write(__s, __ps, __plen);
    __s = std::__write(__s, __name, __len);
  }
       return __s;
     }
   __io.width(0);
   __s = std::__write(__s, __name, __len);
 }
      return __s;
    }

  template<typename _CharT, typename _OutIter>
    _OutIter
    num_put<_CharT, _OutIter>::
    do_put(iter_type __s, ios_base& __io, char_type __fill, double __v) const
    { return _M_insert_float(__s, __io, __fill, char(), __v); }
# 1169 "/usr/include/c++/5/bits/locale_facets.tcc" 3
  template<typename _CharT, typename _OutIter>
    _OutIter
    num_put<_CharT, _OutIter>::
    do_put(iter_type __s, ios_base& __io, char_type __fill,
    long double __v) const
    { return _M_insert_float(__s, __io, __fill, 'L', __v); }

  template<typename _CharT, typename _OutIter>
    _OutIter
    num_put<_CharT, _OutIter>::
    do_put(iter_type __s, ios_base& __io, char_type __fill,
           const void* __v) const
    {
      const ios_base::fmtflags __flags = __io.flags();
      const ios_base::fmtflags __fmt = ~(ios_base::basefield
      | ios_base::uppercase);
      __io.flags((__flags & __fmt) | (ios_base::hex | ios_base::showbase));

      typedef __gnu_cxx::__conditional_type<(sizeof(const void*)
          <= sizeof(unsigned long)),
 unsigned long, unsigned long long>::__type _UIntPtrType;

      __s = _M_insert_int(__s, __io, __fill,
     reinterpret_cast<_UIntPtrType>(__v));
      __io.flags(__flags);
      return __s;
    }


# 1206 "/usr/include/c++/5/bits/locale_facets.tcc" 3
  template<typename _CharT, typename _Traits>
    void
    __pad<_CharT, _Traits>::_S_pad(ios_base& __io, _CharT __fill,
       _CharT* __news, const _CharT* __olds,
       streamsize __newlen, streamsize __oldlen)
    {
      const size_t __plen = static_cast<size_t>(__newlen - __oldlen);
      const ios_base::fmtflags __adjust = __io.flags() & ios_base::adjustfield;


      if (__adjust == ios_base::left)
 {
   _Traits::copy(__news, __olds, __oldlen);
   _Traits::assign(__news + __oldlen, __plen, __fill);
   return;
 }

      size_t __mod = 0;
      if (__adjust == ios_base::internal)
 {



          const locale& __loc = __io._M_getloc();
   const ctype<_CharT>& __ctype = use_facet<ctype<_CharT> >(__loc);

   if (__ctype.widen('-') == __olds[0]
       || __ctype.widen('+') == __olds[0])
     {
       __news[0] = __olds[0];
       __mod = 1;
       ++__news;
     }
   else if (__ctype.widen('0') == __olds[0]
     && __oldlen > 1
     && (__ctype.widen('x') == __olds[1]
         || __ctype.widen('X') == __olds[1]))
     {
       __news[0] = __olds[0];
       __news[1] = __olds[1];
       __mod = 2;
       __news += 2;
     }

 }
      _Traits::assign(__news, __plen, __fill);
      _Traits::copy(__news + __plen, __olds + __mod, __oldlen - __mod);
    }

  template<typename _CharT>
    _CharT*
    __add_grouping(_CharT* __s, _CharT __sep,
     const char* __gbeg, size_t __gsize,
     const _CharT* __first, const _CharT* __last)
    {
      size_t __idx = 0;
      size_t __ctr = 0;

      while (__last - __first > __gbeg[__idx]
      && static_cast<signed char>(__gbeg[__idx]) > 0
      && __gbeg[__idx] != __gnu_cxx::__numeric_traits<char>::__max)
 {
   __last -= __gbeg[__idx];
   __idx < __gsize - 1 ? ++__idx : ++__ctr;
 }

      while (__first != __last)
 *__s++ = *__first++;

      while (__ctr--)
 {
   *__s++ = __sep;
   for (char __i = __gbeg[__idx]; __i > 0; --__i)
     *__s++ = *__first++;
 }

      while (__idx--)
 {
   *__s++ = __sep;
   for (char __i = __gbeg[__idx]; __i > 0; --__i)
     *__s++ = *__first++;
 }

      return __s;
    }




  extern template class __cxx11:: numpunct<char>;
  extern template class __cxx11:: numpunct_byname<char>;
  extern template class num_get<char>;
  extern template class num_put<char>;
  extern template class ctype_byname<char>;

  extern template
    const ctype<char>&
    use_facet<ctype<char> >(const locale&);

  extern template
    const numpunct<char>&
    use_facet<numpunct<char> >(const locale&);

  extern template
    const num_put<char>&
    use_facet<num_put<char> >(const locale&);

  extern template
    const num_get<char>&
    use_facet<num_get<char> >(const locale&);

  extern template
    bool
    has_facet<ctype<char> >(const locale&);

  extern template
    bool
    has_facet<numpunct<char> >(const locale&);

  extern template
    bool
    has_facet<num_put<char> >(const locale&);

  extern template
    bool
    has_facet<num_get<char> >(const locale&);


  extern template class __cxx11:: numpunct<wchar_t>;
  extern template class __cxx11:: numpunct_byname<wchar_t>;
  extern template class num_get<wchar_t>;
  extern template class num_put<wchar_t>;
  extern template class ctype_byname<wchar_t>;

  extern template
    const ctype<wchar_t>&
    use_facet<ctype<wchar_t> >(const locale&);

  extern template
    const numpunct<wchar_t>&
    use_facet<numpunct<wchar_t> >(const locale&);

  extern template
    const num_put<wchar_t>&
    use_facet<num_put<wchar_t> >(const locale&);

  extern template
    const num_get<wchar_t>&
    use_facet<num_get<wchar_t> >(const locale&);

 extern template
    bool
    has_facet<ctype<wchar_t> >(const locale&);

  extern template
    bool
    has_facet<numpunct<wchar_t> >(const locale&);

  extern template
    bool
    has_facet<num_put<wchar_t> >(const locale&);

  extern template
    bool
    has_facet<num_get<wchar_t> >(const locale&);




}
# 2652 "/usr/include/c++/5/bits/locale_facets.h" 2 3
# 38 "/usr/include/c++/5/bits/basic_ios.h" 2 3



namespace std __attribute__ ((__visibility__ ("default")))
{


  template<typename _Facet>
    inline const _Facet&
    __check_facet(const _Facet* __f)
    {
      if (!__f)
 __throw_bad_cast();
      return *__f;
    }
# 66 "/usr/include/c++/5/bits/basic_ios.h" 3
  template<typename _CharT, typename _Traits>
    class basic_ios : public ios_base
    {
    public:






      typedef _CharT char_type;
      typedef typename _Traits::int_type int_type;
      typedef typename _Traits::pos_type pos_type;
      typedef typename _Traits::off_type off_type;
      typedef _Traits traits_type;






      typedef ctype<_CharT> __ctype_type;
      typedef num_put<_CharT, ostreambuf_iterator<_CharT, _Traits> >
           __num_put_type;
      typedef num_get<_CharT, istreambuf_iterator<_CharT, _Traits> >
           __num_get_type;



    protected:
      basic_ostream<_CharT, _Traits>* _M_tie;
      mutable char_type _M_fill;
      mutable bool _M_fill_init;
      basic_streambuf<_CharT, _Traits>* _M_streambuf;


      const __ctype_type* _M_ctype;

      const __num_put_type* _M_num_put;

      const __num_get_type* _M_num_get;

    public:
# 120 "/usr/include/c++/5/bits/basic_ios.h" 3
      operator void*() const
      { return this->fail() ? 0 : const_cast<basic_ios*>(this); }


      bool
      operator!() const
      { return this->fail(); }
# 136 "/usr/include/c++/5/bits/basic_ios.h" 3
      iostate
      rdstate() const
      { return _M_streambuf_state; }
# 147 "/usr/include/c++/5/bits/basic_ios.h" 3
      void
      clear(iostate __state = goodbit);







      void
      setstate(iostate __state)
      { this->clear(this->rdstate() | __state); }




      void
      _M_setstate(iostate __state)
      {


 _M_streambuf_state |= __state;
 if (this->exceptions() & __state)
   throw;
      }







      bool
      good() const
      { return this->rdstate() == 0; }







      bool
      eof() const
      { return (this->rdstate() & eofbit) != 0; }
# 200 "/usr/include/c++/5/bits/basic_ios.h" 3
      bool
      fail() const
      { return (this->rdstate() & (badbit | failbit)) != 0; }







      bool
      bad() const
      { return (this->rdstate() & badbit) != 0; }
# 221 "/usr/include/c++/5/bits/basic_ios.h" 3
      iostate
      exceptions() const
      { return _M_exception; }
# 256 "/usr/include/c++/5/bits/basic_ios.h" 3
      void
      exceptions(iostate __except)
      {
        _M_exception = __except;
        this->clear(_M_streambuf_state);
      }







      explicit
      basic_ios(basic_streambuf<_CharT, _Traits>* __sb)
      : ios_base(), _M_tie(0), _M_fill(), _M_fill_init(false), _M_streambuf(0),
 _M_ctype(0), _M_num_put(0), _M_num_get(0)
      { this->init(__sb); }







      virtual
      ~basic_ios() { }
# 294 "/usr/include/c++/5/bits/basic_ios.h" 3
      basic_ostream<_CharT, _Traits>*
      tie() const
      { return _M_tie; }
# 306 "/usr/include/c++/5/bits/basic_ios.h" 3
      basic_ostream<_CharT, _Traits>*
      tie(basic_ostream<_CharT, _Traits>* __tiestr)
      {
        basic_ostream<_CharT, _Traits>* __old = _M_tie;
        _M_tie = __tiestr;
        return __old;
      }







      basic_streambuf<_CharT, _Traits>*
      rdbuf() const
      { return _M_streambuf; }
# 346 "/usr/include/c++/5/bits/basic_ios.h" 3
      basic_streambuf<_CharT, _Traits>*
      rdbuf(basic_streambuf<_CharT, _Traits>* __sb);
# 360 "/usr/include/c++/5/bits/basic_ios.h" 3
      basic_ios&
      copyfmt(const basic_ios& __rhs);







      char_type
      fill() const
      {
 if (!_M_fill_init)
   {
     _M_fill = this->widen(' ');
     _M_fill_init = true;
   }
 return _M_fill;
      }
# 389 "/usr/include/c++/5/bits/basic_ios.h" 3
      char_type
      fill(char_type __ch)
      {
 char_type __old = this->fill();
 _M_fill = __ch;
 return __old;
      }
# 409 "/usr/include/c++/5/bits/basic_ios.h" 3
      locale
      imbue(const locale& __loc);
# 429 "/usr/include/c++/5/bits/basic_ios.h" 3
      char
      narrow(char_type __c, char __dfault) const
      { return __check_facet(_M_ctype).narrow(__c, __dfault); }
# 448 "/usr/include/c++/5/bits/basic_ios.h" 3
      char_type
      widen(char __c) const
      { return __check_facet(_M_ctype).widen(__c); }

    protected:







      basic_ios()
      : ios_base(), _M_tie(0), _M_fill(char_type()), _M_fill_init(false),
 _M_streambuf(0), _M_ctype(0), _M_num_put(0), _M_num_get(0)
      { }







      void
      init(basic_streambuf<_CharT, _Traits>* __sb);
# 509 "/usr/include/c++/5/bits/basic_ios.h" 3
      void
      _M_cache_locale(const locale& __loc);
    };


}

# 1 "/usr/include/c++/5/bits/basic_ios.tcc" 1 3
# 33 "/usr/include/c++/5/bits/basic_ios.tcc" 3
       
# 34 "/usr/include/c++/5/bits/basic_ios.tcc" 3

namespace std __attribute__ ((__visibility__ ("default")))
{


  template<typename _CharT, typename _Traits>
    void
    basic_ios<_CharT, _Traits>::clear(iostate __state)
    {
      if (this->rdbuf())
 _M_streambuf_state = __state;
      else
   _M_streambuf_state = __state | badbit;
      if (this->exceptions() & this->rdstate())
 __throw_ios_failure(("basic_ios::clear"));
    }

  template<typename _CharT, typename _Traits>
    basic_streambuf<_CharT, _Traits>*
    basic_ios<_CharT, _Traits>::rdbuf(basic_streambuf<_CharT, _Traits>* __sb)
    {
      basic_streambuf<_CharT, _Traits>* __old = _M_streambuf;
      _M_streambuf = __sb;
      this->clear();
      return __old;
    }

  template<typename _CharT, typename _Traits>
    basic_ios<_CharT, _Traits>&
    basic_ios<_CharT, _Traits>::copyfmt(const basic_ios& __rhs)
    {


      if (this != &__rhs)
 {




   _Words* __words = (__rhs._M_word_size <= _S_local_word_size) ?
                      _M_local_word : new _Words[__rhs._M_word_size];


   _Callback_list* __cb = __rhs._M_callbacks;
   if (__cb)
     __cb->_M_add_reference();
   _M_call_callbacks(erase_event);
   if (_M_word != _M_local_word)
     {
       delete [] _M_word;
       _M_word = 0;
     }
   _M_dispose_callbacks();


   _M_callbacks = __cb;
   for (int __i = 0; __i < __rhs._M_word_size; ++__i)
     __words[__i] = __rhs._M_word[__i];
   _M_word = __words;
   _M_word_size = __rhs._M_word_size;

   this->flags(__rhs.flags());
   this->width(__rhs.width());
   this->precision(__rhs.precision());
   this->tie(__rhs.tie());
   this->fill(__rhs.fill());
   _M_ios_locale = __rhs.getloc();
   _M_cache_locale(_M_ios_locale);

   _M_call_callbacks(copyfmt_event);


   this->exceptions(__rhs.exceptions());
 }
      return *this;
    }


  template<typename _CharT, typename _Traits>
    locale
    basic_ios<_CharT, _Traits>::imbue(const locale& __loc)
    {
      locale __old(this->getloc());
      ios_base::imbue(__loc);
      _M_cache_locale(__loc);
      if (this->rdbuf() != 0)
 this->rdbuf()->pubimbue(__loc);
      return __old;
    }

  template<typename _CharT, typename _Traits>
    void
    basic_ios<_CharT, _Traits>::init(basic_streambuf<_CharT, _Traits>* __sb)
    {

      ios_base::_M_init();


      _M_cache_locale(_M_ios_locale);
# 146 "/usr/include/c++/5/bits/basic_ios.tcc" 3
      _M_fill = _CharT();
      _M_fill_init = false;

      _M_tie = 0;
      _M_exception = goodbit;
      _M_streambuf = __sb;
      _M_streambuf_state = __sb ? goodbit : badbit;
    }

  template<typename _CharT, typename _Traits>
    void
    basic_ios<_CharT, _Traits>::_M_cache_locale(const locale& __loc)
    {
      if (__builtin_expect(has_facet<__ctype_type>(__loc), true))
 _M_ctype = &use_facet<__ctype_type>(__loc);
      else
 _M_ctype = 0;

      if (__builtin_expect(has_facet<__num_put_type>(__loc), true))
 _M_num_put = &use_facet<__num_put_type>(__loc);
      else
 _M_num_put = 0;

      if (__builtin_expect(has_facet<__num_get_type>(__loc), true))
 _M_num_get = &use_facet<__num_get_type>(__loc);
      else
 _M_num_get = 0;
    }




  extern template class basic_ios<char>;


  extern template class basic_ios<wchar_t>;




}
# 517 "/usr/include/c++/5/bits/basic_ios.h" 2 3
# 45 "/usr/include/c++/5/ios" 2 3
# 39 "/usr/include/c++/5/ostream" 2 3


namespace std __attribute__ ((__visibility__ ("default")))
{

# 57 "/usr/include/c++/5/ostream" 3
  template<typename _CharT, typename _Traits>
    class basic_ostream : virtual public basic_ios<_CharT, _Traits>
    {
    public:

      typedef _CharT char_type;
      typedef typename _Traits::int_type int_type;
      typedef typename _Traits::pos_type pos_type;
      typedef typename _Traits::off_type off_type;
      typedef _Traits traits_type;


      typedef basic_streambuf<_CharT, _Traits> __streambuf_type;
      typedef basic_ios<_CharT, _Traits> __ios_type;
      typedef basic_ostream<_CharT, _Traits> __ostream_type;
      typedef num_put<_CharT, ostreambuf_iterator<_CharT, _Traits> >
             __num_put_type;
      typedef ctype<_CharT> __ctype_type;
# 83 "/usr/include/c++/5/ostream" 3
      explicit
      basic_ostream(__streambuf_type* __sb)
      { this->init(__sb); }






      virtual
      ~basic_ostream() { }


      class sentry;
      friend class sentry;
# 107 "/usr/include/c++/5/ostream" 3
      __ostream_type&
      operator<<(__ostream_type& (*__pf)(__ostream_type&))
      {



 return __pf(*this);
      }

      __ostream_type&
      operator<<(__ios_type& (*__pf)(__ios_type&))
      {



 __pf(*this);
 return *this;
      }

      __ostream_type&
      operator<<(ios_base& (*__pf) (ios_base&))
      {



 __pf(*this);
 return *this;
      }
# 165 "/usr/include/c++/5/ostream" 3
      __ostream_type&
      operator<<(long __n)
      { return _M_insert(__n); }

      __ostream_type&
      operator<<(unsigned long __n)
      { return _M_insert(__n); }

      __ostream_type&
      operator<<(bool __n)
      { return _M_insert(__n); }

      __ostream_type&
      operator<<(short __n);

      __ostream_type&
      operator<<(unsigned short __n)
      {


 return _M_insert(static_cast<unsigned long>(__n));
      }

      __ostream_type&
      operator<<(int __n);

      __ostream_type&
      operator<<(unsigned int __n)
      {


 return _M_insert(static_cast<unsigned long>(__n));
      }


      __ostream_type&
      operator<<(long long __n)
      { return _M_insert(__n); }

      __ostream_type&
      operator<<(unsigned long long __n)
      { return _M_insert(__n); }
# 219 "/usr/include/c++/5/ostream" 3
      __ostream_type&
      operator<<(double __f)
      { return _M_insert(__f); }

      __ostream_type&
      operator<<(float __f)
      {


 return _M_insert(static_cast<double>(__f));
      }

      __ostream_type&
      operator<<(long double __f)
      { return _M_insert(__f); }
# 244 "/usr/include/c++/5/ostream" 3
      __ostream_type&
      operator<<(const void* __p)
      { return _M_insert(__p); }
# 269 "/usr/include/c++/5/ostream" 3
      __ostream_type&
      operator<<(__streambuf_type* __sb);
# 302 "/usr/include/c++/5/ostream" 3
      __ostream_type&
      put(char_type __c);






      void
      _M_write(const char_type* __s, streamsize __n)
      {
 const streamsize __put = this->rdbuf()->sputn(__s, __n);
 if (__put != __n)
   this->setstate(ios_base::badbit);
      }
# 334 "/usr/include/c++/5/ostream" 3
      __ostream_type&
      write(const char_type* __s, streamsize __n);
# 347 "/usr/include/c++/5/ostream" 3
      __ostream_type&
      flush();
# 357 "/usr/include/c++/5/ostream" 3
      pos_type
      tellp();
# 368 "/usr/include/c++/5/ostream" 3
      __ostream_type&
      seekp(pos_type);
# 380 "/usr/include/c++/5/ostream" 3
       __ostream_type&
      seekp(off_type, ios_base::seekdir);

    protected:
      basic_ostream()
      { this->init(0); }
# 413 "/usr/include/c++/5/ostream" 3
      template<typename _ValueT>
 __ostream_type&
 _M_insert(_ValueT __v);
    };
# 425 "/usr/include/c++/5/ostream" 3
  template <typename _CharT, typename _Traits>
    class basic_ostream<_CharT, _Traits>::sentry
    {

      bool _M_ok;
      basic_ostream<_CharT, _Traits>& _M_os;

    public:
# 444 "/usr/include/c++/5/ostream" 3
      explicit
      sentry(basic_ostream<_CharT, _Traits>& __os);
# 454 "/usr/include/c++/5/ostream" 3
      ~sentry()
      {

 if (bool(_M_os.flags() & ios_base::unitbuf) && !uncaught_exception())
   {

     if (_M_os.rdbuf() && _M_os.rdbuf()->pubsync() == -1)
       _M_os.setstate(ios_base::badbit);
   }
      }
# 475 "/usr/include/c++/5/ostream" 3
      operator bool() const
      { return _M_ok; }
    };
# 495 "/usr/include/c++/5/ostream" 3
  template<typename _CharT, typename _Traits>
    inline basic_ostream<_CharT, _Traits>&
    operator<<(basic_ostream<_CharT, _Traits>& __out, _CharT __c)
    { return __ostream_insert(__out, &__c, 1); }

  template<typename _CharT, typename _Traits>
    inline basic_ostream<_CharT, _Traits>&
    operator<<(basic_ostream<_CharT, _Traits>& __out, char __c)
    { return (__out << __out.widen(__c)); }


  template <class _Traits>
    inline basic_ostream<char, _Traits>&
    operator<<(basic_ostream<char, _Traits>& __out, char __c)
    { return __ostream_insert(__out, &__c, 1); }


  template<class _Traits>
    inline basic_ostream<char, _Traits>&
    operator<<(basic_ostream<char, _Traits>& __out, signed char __c)
    { return (__out << static_cast<char>(__c)); }

  template<class _Traits>
    inline basic_ostream<char, _Traits>&
    operator<<(basic_ostream<char, _Traits>& __out, unsigned char __c)
    { return (__out << static_cast<char>(__c)); }
# 537 "/usr/include/c++/5/ostream" 3
  template<typename _CharT, typename _Traits>
    inline basic_ostream<_CharT, _Traits>&
    operator<<(basic_ostream<_CharT, _Traits>& __out, const _CharT* __s)
    {
      if (!__s)
 __out.setstate(ios_base::badbit);
      else
 __ostream_insert(__out, __s,
    static_cast<streamsize>(_Traits::length(__s)));
      return __out;
    }

  template<typename _CharT, typename _Traits>
    basic_ostream<_CharT, _Traits> &
    operator<<(basic_ostream<_CharT, _Traits>& __out, const char* __s);


  template<class _Traits>
    inline basic_ostream<char, _Traits>&
    operator<<(basic_ostream<char, _Traits>& __out, const char* __s)
    {
      if (!__s)
 __out.setstate(ios_base::badbit);
      else
 __ostream_insert(__out, __s,
    static_cast<streamsize>(_Traits::length(__s)));
      return __out;
    }


  template<class _Traits>
    inline basic_ostream<char, _Traits>&
    operator<<(basic_ostream<char, _Traits>& __out, const signed char* __s)
    { return (__out << reinterpret_cast<const char*>(__s)); }

  template<class _Traits>
    inline basic_ostream<char, _Traits> &
    operator<<(basic_ostream<char, _Traits>& __out, const unsigned char* __s)
    { return (__out << reinterpret_cast<const char*>(__s)); }
# 588 "/usr/include/c++/5/ostream" 3
  template<typename _CharT, typename _Traits>
    inline basic_ostream<_CharT, _Traits>&
    endl(basic_ostream<_CharT, _Traits>& __os)
    { return flush(__os.put(__os.widen('\n'))); }
# 600 "/usr/include/c++/5/ostream" 3
  template<typename _CharT, typename _Traits>
    inline basic_ostream<_CharT, _Traits>&
    ends(basic_ostream<_CharT, _Traits>& __os)
    { return __os.put(_CharT()); }






  template<typename _CharT, typename _Traits>
    inline basic_ostream<_CharT, _Traits>&
    flush(basic_ostream<_CharT, _Traits>& __os)
    { return __os.flush(); }
# 635 "/usr/include/c++/5/ostream" 3

}

# 1 "/usr/include/c++/5/bits/ostream.tcc" 1 3
# 37 "/usr/include/c++/5/bits/ostream.tcc" 3
       
# 38 "/usr/include/c++/5/bits/ostream.tcc" 3



namespace std __attribute__ ((__visibility__ ("default")))
{


  template<typename _CharT, typename _Traits>
    basic_ostream<_CharT, _Traits>::sentry::
    sentry(basic_ostream<_CharT, _Traits>& __os)
    : _M_ok(false), _M_os(__os)
    {

      if (__os.tie() && __os.good())
 __os.tie()->flush();

      if (__os.good())
 _M_ok = true;
      else
 __os.setstate(ios_base::failbit);
    }

  template<typename _CharT, typename _Traits>
    template<typename _ValueT>
      basic_ostream<_CharT, _Traits>&
      basic_ostream<_CharT, _Traits>::
      _M_insert(_ValueT __v)
      {
 sentry __cerb(*this);
 if (__cerb)
   {
     ios_base::iostate __err = ios_base::goodbit;
     try
       {
  const __num_put_type& __np = __check_facet(this->_M_num_put);
  if (__np.put(*this, *this, this->fill(), __v).failed())
    __err |= ios_base::badbit;
       }
     catch(__cxxabiv1::__forced_unwind&)
       {
  this->_M_setstate(ios_base::badbit);
  throw;
       }
     catch(...)
       { this->_M_setstate(ios_base::badbit); }
     if (__err)
       this->setstate(__err);
   }
 return *this;
      }

  template<typename _CharT, typename _Traits>
    basic_ostream<_CharT, _Traits>&
    basic_ostream<_CharT, _Traits>::
    operator<<(short __n)
    {


      const ios_base::fmtflags __fmt = this->flags() & ios_base::basefield;
      if (__fmt == ios_base::oct || __fmt == ios_base::hex)
 return _M_insert(static_cast<long>(static_cast<unsigned short>(__n)));
      else
 return _M_insert(static_cast<long>(__n));
    }

  template<typename _CharT, typename _Traits>
    basic_ostream<_CharT, _Traits>&
    basic_ostream<_CharT, _Traits>::
    operator<<(int __n)
    {


      const ios_base::fmtflags __fmt = this->flags() & ios_base::basefield;
      if (__fmt == ios_base::oct || __fmt == ios_base::hex)
 return _M_insert(static_cast<long>(static_cast<unsigned int>(__n)));
      else
 return _M_insert(static_cast<long>(__n));
    }

  template<typename _CharT, typename _Traits>
    basic_ostream<_CharT, _Traits>&
    basic_ostream<_CharT, _Traits>::
    operator<<(__streambuf_type* __sbin)
    {
      ios_base::iostate __err = ios_base::goodbit;
      sentry __cerb(*this);
      if (__cerb && __sbin)
 {
   try
     {
       if (!__copy_streambufs(__sbin, this->rdbuf()))
  __err |= ios_base::failbit;
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::failbit); }
 }
      else if (!__sbin)
 __err |= ios_base::badbit;
      if (__err)
 this->setstate(__err);
      return *this;
    }

  template<typename _CharT, typename _Traits>
    basic_ostream<_CharT, _Traits>&
    basic_ostream<_CharT, _Traits>::
    put(char_type __c)
    {






      sentry __cerb(*this);
      if (__cerb)
 {
   ios_base::iostate __err = ios_base::goodbit;
   try
     {
       const int_type __put = this->rdbuf()->sputc(__c);
       if (traits_type::eq_int_type(__put, traits_type::eof()))
  __err |= ios_base::badbit;
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::badbit); }
   if (__err)
     this->setstate(__err);
 }
      return *this;
    }

  template<typename _CharT, typename _Traits>
    basic_ostream<_CharT, _Traits>&
    basic_ostream<_CharT, _Traits>::
    write(const _CharT* __s, streamsize __n)
    {







      sentry __cerb(*this);
      if (__cerb)
 {
   try
     { _M_write(__s, __n); }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::badbit); }
 }
      return *this;
    }

  template<typename _CharT, typename _Traits>
    basic_ostream<_CharT, _Traits>&
    basic_ostream<_CharT, _Traits>::
    flush()
    {



      ios_base::iostate __err = ios_base::goodbit;
      try
 {
   if (this->rdbuf() && this->rdbuf()->pubsync() == -1)
     __err |= ios_base::badbit;
 }
      catch(__cxxabiv1::__forced_unwind&)
 {
   this->_M_setstate(ios_base::badbit);
   throw;
 }
      catch(...)
 { this->_M_setstate(ios_base::badbit); }
      if (__err)
 this->setstate(__err);
      return *this;
    }

  template<typename _CharT, typename _Traits>
    typename basic_ostream<_CharT, _Traits>::pos_type
    basic_ostream<_CharT, _Traits>::
    tellp()
    {
      pos_type __ret = pos_type(-1);
      try
 {
   if (!this->fail())
     __ret = this->rdbuf()->pubseekoff(0, ios_base::cur, ios_base::out);
 }
      catch(__cxxabiv1::__forced_unwind&)
 {
   this->_M_setstate(ios_base::badbit);
   throw;
 }
      catch(...)
 { this->_M_setstate(ios_base::badbit); }
      return __ret;
    }

  template<typename _CharT, typename _Traits>
    basic_ostream<_CharT, _Traits>&
    basic_ostream<_CharT, _Traits>::
    seekp(pos_type __pos)
    {
      ios_base::iostate __err = ios_base::goodbit;
      try
 {
   if (!this->fail())
     {


       const pos_type __p = this->rdbuf()->pubseekpos(__pos,
            ios_base::out);


       if (__p == pos_type(off_type(-1)))
  __err |= ios_base::failbit;
     }
 }
      catch(__cxxabiv1::__forced_unwind&)
 {
   this->_M_setstate(ios_base::badbit);
   throw;
 }
      catch(...)
 { this->_M_setstate(ios_base::badbit); }
      if (__err)
 this->setstate(__err);
      return *this;
    }

  template<typename _CharT, typename _Traits>
    basic_ostream<_CharT, _Traits>&
    basic_ostream<_CharT, _Traits>::
    seekp(off_type __off, ios_base::seekdir __dir)
    {
      ios_base::iostate __err = ios_base::goodbit;
      try
 {
   if (!this->fail())
     {


       const pos_type __p = this->rdbuf()->pubseekoff(__off, __dir,
            ios_base::out);


       if (__p == pos_type(off_type(-1)))
  __err |= ios_base::failbit;
     }
 }
      catch(__cxxabiv1::__forced_unwind&)
 {
   this->_M_setstate(ios_base::badbit);
   throw;
 }
      catch(...)
 { this->_M_setstate(ios_base::badbit); }
      if (__err)
 this->setstate(__err);
      return *this;
    }

  template<typename _CharT, typename _Traits>
    basic_ostream<_CharT, _Traits>&
    operator<<(basic_ostream<_CharT, _Traits>& __out, const char* __s)
    {
      if (!__s)
 __out.setstate(ios_base::badbit);
      else
 {


   const size_t __clen = char_traits<char>::length(__s);
   try
     {
       struct __ptr_guard
       {
  _CharT *__p;
  __ptr_guard (_CharT *__ip): __p(__ip) { }
  ~__ptr_guard() { delete[] __p; }
  _CharT* __get() { return __p; }
       } __pg (new _CharT[__clen]);

       _CharT *__ws = __pg.__get();
       for (size_t __i = 0; __i < __clen; ++__i)
  __ws[__i] = __out.widen(__s[__i]);
       __ostream_insert(__out, __ws, __clen);
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       __out._M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { __out._M_setstate(ios_base::badbit); }
 }
      return __out;
    }




  extern template class basic_ostream<char>;
  extern template ostream& endl(ostream&);
  extern template ostream& ends(ostream&);
  extern template ostream& flush(ostream&);
  extern template ostream& operator<<(ostream&, char);
  extern template ostream& operator<<(ostream&, unsigned char);
  extern template ostream& operator<<(ostream&, signed char);
  extern template ostream& operator<<(ostream&, const char*);
  extern template ostream& operator<<(ostream&, const unsigned char*);
  extern template ostream& operator<<(ostream&, const signed char*);

  extern template ostream& ostream::_M_insert(long);
  extern template ostream& ostream::_M_insert(unsigned long);
  extern template ostream& ostream::_M_insert(bool);

  extern template ostream& ostream::_M_insert(long long);
  extern template ostream& ostream::_M_insert(unsigned long long);

  extern template ostream& ostream::_M_insert(double);
  extern template ostream& ostream::_M_insert(long double);
  extern template ostream& ostream::_M_insert(const void*);


  extern template class basic_ostream<wchar_t>;
  extern template wostream& endl(wostream&);
  extern template wostream& ends(wostream&);
  extern template wostream& flush(wostream&);
  extern template wostream& operator<<(wostream&, wchar_t);
  extern template wostream& operator<<(wostream&, char);
  extern template wostream& operator<<(wostream&, const wchar_t*);
  extern template wostream& operator<<(wostream&, const char*);

  extern template wostream& wostream::_M_insert(long);
  extern template wostream& wostream::_M_insert(unsigned long);
  extern template wostream& wostream::_M_insert(bool);

  extern template wostream& wostream::_M_insert(long long);
  extern template wostream& wostream::_M_insert(unsigned long long);

  extern template wostream& wostream::_M_insert(double);
  extern template wostream& wostream::_M_insert(long double);
  extern template wostream& wostream::_M_insert(const void*);




}
# 639 "/usr/include/c++/5/ostream" 2 3
# 40 "/usr/include/c++/5/iostream" 2 3
# 1 "/usr/include/c++/5/istream" 1 3
# 36 "/usr/include/c++/5/istream" 3
       
# 37 "/usr/include/c++/5/istream" 3




namespace std __attribute__ ((__visibility__ ("default")))
{

# 57 "/usr/include/c++/5/istream" 3
  template<typename _CharT, typename _Traits>
    class basic_istream : virtual public basic_ios<_CharT, _Traits>
    {
    public:

      typedef _CharT char_type;
      typedef typename _Traits::int_type int_type;
      typedef typename _Traits::pos_type pos_type;
      typedef typename _Traits::off_type off_type;
      typedef _Traits traits_type;


      typedef basic_streambuf<_CharT, _Traits> __streambuf_type;
      typedef basic_ios<_CharT, _Traits> __ios_type;
      typedef basic_istream<_CharT, _Traits> __istream_type;
      typedef num_get<_CharT, istreambuf_iterator<_CharT, _Traits> >
        __num_get_type;
      typedef ctype<_CharT> __ctype_type;

    protected:





      streamsize _M_gcount;

    public:







      explicit
      basic_istream(__streambuf_type* __sb)
      : _M_gcount(streamsize(0))
      { this->init(__sb); }






      virtual
      ~basic_istream()
      { _M_gcount = streamsize(0); }


      class sentry;
      friend class sentry;
# 119 "/usr/include/c++/5/istream" 3
      __istream_type&
      operator>>(__istream_type& (*__pf)(__istream_type&))
      { return __pf(*this); }

      __istream_type&
      operator>>(__ios_type& (*__pf)(__ios_type&))
      {
 __pf(*this);
 return *this;
      }

      __istream_type&
      operator>>(ios_base& (*__pf)(ios_base&))
      {
 __pf(*this);
 return *this;
      }
# 167 "/usr/include/c++/5/istream" 3
      __istream_type&
      operator>>(bool& __n)
      { return _M_extract(__n); }

      __istream_type&
      operator>>(short& __n);

      __istream_type&
      operator>>(unsigned short& __n)
      { return _M_extract(__n); }

      __istream_type&
      operator>>(int& __n);

      __istream_type&
      operator>>(unsigned int& __n)
      { return _M_extract(__n); }

      __istream_type&
      operator>>(long& __n)
      { return _M_extract(__n); }

      __istream_type&
      operator>>(unsigned long& __n)
      { return _M_extract(__n); }


      __istream_type&
      operator>>(long long& __n)
      { return _M_extract(__n); }

      __istream_type&
      operator>>(unsigned long long& __n)
      { return _M_extract(__n); }
# 213 "/usr/include/c++/5/istream" 3
      __istream_type&
      operator>>(float& __f)
      { return _M_extract(__f); }

      __istream_type&
      operator>>(double& __f)
      { return _M_extract(__f); }

      __istream_type&
      operator>>(long double& __f)
      { return _M_extract(__f); }
# 234 "/usr/include/c++/5/istream" 3
      __istream_type&
      operator>>(void*& __p)
      { return _M_extract(__p); }
# 258 "/usr/include/c++/5/istream" 3
      __istream_type&
      operator>>(__streambuf_type* __sb);
# 268 "/usr/include/c++/5/istream" 3
      streamsize
      gcount() const
      { return _M_gcount; }
# 301 "/usr/include/c++/5/istream" 3
      int_type
      get();
# 315 "/usr/include/c++/5/istream" 3
      __istream_type&
      get(char_type& __c);
# 342 "/usr/include/c++/5/istream" 3
      __istream_type&
      get(char_type* __s, streamsize __n, char_type __delim);
# 353 "/usr/include/c++/5/istream" 3
      __istream_type&
      get(char_type* __s, streamsize __n)
      { return this->get(__s, __n, this->widen('\n')); }
# 376 "/usr/include/c++/5/istream" 3
      __istream_type&
      get(__streambuf_type& __sb, char_type __delim);
# 386 "/usr/include/c++/5/istream" 3
      __istream_type&
      get(__streambuf_type& __sb)
      { return this->get(__sb, this->widen('\n')); }
# 415 "/usr/include/c++/5/istream" 3
      __istream_type&
      getline(char_type* __s, streamsize __n, char_type __delim);
# 426 "/usr/include/c++/5/istream" 3
      __istream_type&
      getline(char_type* __s, streamsize __n)
      { return this->getline(__s, __n, this->widen('\n')); }
# 450 "/usr/include/c++/5/istream" 3
      __istream_type&
      ignore(streamsize __n, int_type __delim);

      __istream_type&
      ignore(streamsize __n);

      __istream_type&
      ignore();
# 467 "/usr/include/c++/5/istream" 3
      int_type
      peek();
# 485 "/usr/include/c++/5/istream" 3
      __istream_type&
      read(char_type* __s, streamsize __n);
# 504 "/usr/include/c++/5/istream" 3
      streamsize
      readsome(char_type* __s, streamsize __n);
# 521 "/usr/include/c++/5/istream" 3
      __istream_type&
      putback(char_type __c);
# 537 "/usr/include/c++/5/istream" 3
      __istream_type&
      unget();
# 555 "/usr/include/c++/5/istream" 3
      int
      sync();
# 570 "/usr/include/c++/5/istream" 3
      pos_type
      tellg();
# 585 "/usr/include/c++/5/istream" 3
      __istream_type&
      seekg(pos_type);
# 601 "/usr/include/c++/5/istream" 3
      __istream_type&
      seekg(off_type, ios_base::seekdir);


    protected:
      basic_istream()
      : _M_gcount(streamsize(0))
      { this->init(0); }
# 639 "/usr/include/c++/5/istream" 3
      template<typename _ValueT>
 __istream_type&
 _M_extract(_ValueT& __v);
    };


  template<>
    basic_istream<char>&
    basic_istream<char>::
    getline(char_type* __s, streamsize __n, char_type __delim);

  template<>
    basic_istream<char>&
    basic_istream<char>::
    ignore(streamsize __n);

  template<>
    basic_istream<char>&
    basic_istream<char>::
    ignore(streamsize __n, int_type __delim);


  template<>
    basic_istream<wchar_t>&
    basic_istream<wchar_t>::
    getline(char_type* __s, streamsize __n, char_type __delim);

  template<>
    basic_istream<wchar_t>&
    basic_istream<wchar_t>::
    ignore(streamsize __n);

  template<>
    basic_istream<wchar_t>&
    basic_istream<wchar_t>::
    ignore(streamsize __n, int_type __delim);
# 685 "/usr/include/c++/5/istream" 3
  template<typename _CharT, typename _Traits>
    class basic_istream<_CharT, _Traits>::sentry
    {

      bool _M_ok;

    public:

      typedef _Traits traits_type;
      typedef basic_streambuf<_CharT, _Traits> __streambuf_type;
      typedef basic_istream<_CharT, _Traits> __istream_type;
      typedef typename __istream_type::__ctype_type __ctype_type;
      typedef typename _Traits::int_type __int_type;
# 721 "/usr/include/c++/5/istream" 3
      explicit
      sentry(basic_istream<_CharT, _Traits>& __is, bool __noskipws = false);
# 734 "/usr/include/c++/5/istream" 3
      operator bool() const
      { return _M_ok; }
    };
# 750 "/usr/include/c++/5/istream" 3
  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    operator>>(basic_istream<_CharT, _Traits>& __in, _CharT& __c);

  template<class _Traits>
    inline basic_istream<char, _Traits>&
    operator>>(basic_istream<char, _Traits>& __in, unsigned char& __c)
    { return (__in >> reinterpret_cast<char&>(__c)); }

  template<class _Traits>
    inline basic_istream<char, _Traits>&
    operator>>(basic_istream<char, _Traits>& __in, signed char& __c)
    { return (__in >> reinterpret_cast<char&>(__c)); }
# 792 "/usr/include/c++/5/istream" 3
  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    operator>>(basic_istream<_CharT, _Traits>& __in, _CharT* __s);


  template<>
    basic_istream<char>&
    operator>>(basic_istream<char>& __in, char* __s);

  template<class _Traits>
    inline basic_istream<char, _Traits>&
    operator>>(basic_istream<char, _Traits>& __in, unsigned char* __s)
    { return (__in >> reinterpret_cast<char*>(__s)); }

  template<class _Traits>
    inline basic_istream<char, _Traits>&
    operator>>(basic_istream<char, _Traits>& __in, signed char* __s)
    { return (__in >> reinterpret_cast<char*>(__s)); }
# 823 "/usr/include/c++/5/istream" 3
  template<typename _CharT, typename _Traits>
    class basic_iostream
    : public basic_istream<_CharT, _Traits>,
      public basic_ostream<_CharT, _Traits>
    {
    public:



      typedef _CharT char_type;
      typedef typename _Traits::int_type int_type;
      typedef typename _Traits::pos_type pos_type;
      typedef typename _Traits::off_type off_type;
      typedef _Traits traits_type;


      typedef basic_istream<_CharT, _Traits> __istream_type;
      typedef basic_ostream<_CharT, _Traits> __ostream_type;







      explicit
      basic_iostream(basic_streambuf<_CharT, _Traits>* __sb)
      : __istream_type(__sb), __ostream_type(__sb) { }




      virtual
      ~basic_iostream() { }

    protected:
      basic_iostream()
      : __istream_type(), __ostream_type() { }
# 884 "/usr/include/c++/5/istream" 3
    };
# 906 "/usr/include/c++/5/istream" 3
  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    ws(basic_istream<_CharT, _Traits>& __is);
# 931 "/usr/include/c++/5/istream" 3

}

# 1 "/usr/include/c++/5/bits/istream.tcc" 1 3
# 37 "/usr/include/c++/5/bits/istream.tcc" 3
       
# 38 "/usr/include/c++/5/bits/istream.tcc" 3



namespace std __attribute__ ((__visibility__ ("default")))
{


  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>::sentry::
    sentry(basic_istream<_CharT, _Traits>& __in, bool __noskip) : _M_ok(false)
    {
      ios_base::iostate __err = ios_base::goodbit;
      if (__in.good())
 {
   if (__in.tie())
     __in.tie()->flush();
   if (!__noskip && bool(__in.flags() & ios_base::skipws))
     {
       const __int_type __eof = traits_type::eof();
       __streambuf_type* __sb = __in.rdbuf();
       __int_type __c = __sb->sgetc();

       const __ctype_type& __ct = __check_facet(__in._M_ctype);
       while (!traits_type::eq_int_type(__c, __eof)
       && __ct.is(ctype_base::space,
    traits_type::to_char_type(__c)))
  __c = __sb->snextc();




       if (traits_type::eq_int_type(__c, __eof))
  __err |= ios_base::eofbit;
     }
 }

      if (__in.good() && __err == ios_base::goodbit)
 _M_ok = true;
      else
 {
   __err |= ios_base::failbit;
   __in.setstate(__err);
 }
    }

  template<typename _CharT, typename _Traits>
    template<typename _ValueT>
      basic_istream<_CharT, _Traits>&
      basic_istream<_CharT, _Traits>::
      _M_extract(_ValueT& __v)
      {
 sentry __cerb(*this, false);
 if (__cerb)
   {
     ios_base::iostate __err = ios_base::goodbit;
     try
       {
  const __num_get_type& __ng = __check_facet(this->_M_num_get);
  __ng.get(*this, 0, *this, __err, __v);
       }
     catch(__cxxabiv1::__forced_unwind&)
       {
  this->_M_setstate(ios_base::badbit);
  throw;
       }
     catch(...)
       { this->_M_setstate(ios_base::badbit); }
     if (__err)
       this->setstate(__err);
   }
 return *this;
      }

  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    basic_istream<_CharT, _Traits>::
    operator>>(short& __n)
    {


      sentry __cerb(*this, false);
      if (__cerb)
 {
   ios_base::iostate __err = ios_base::goodbit;
   try
     {
       long __l;
       const __num_get_type& __ng = __check_facet(this->_M_num_get);
       __ng.get(*this, 0, *this, __err, __l);



       if (__l < __gnu_cxx::__numeric_traits<short>::__min)
  {
    __err |= ios_base::failbit;
    __n = __gnu_cxx::__numeric_traits<short>::__min;
  }
       else if (__l > __gnu_cxx::__numeric_traits<short>::__max)
  {
    __err |= ios_base::failbit;
    __n = __gnu_cxx::__numeric_traits<short>::__max;
  }
       else
  __n = short(__l);
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::badbit); }
   if (__err)
     this->setstate(__err);
 }
      return *this;
    }

  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    basic_istream<_CharT, _Traits>::
    operator>>(int& __n)
    {


      sentry __cerb(*this, false);
      if (__cerb)
 {
   ios_base::iostate __err = ios_base::goodbit;
   try
     {
       long __l;
       const __num_get_type& __ng = __check_facet(this->_M_num_get);
       __ng.get(*this, 0, *this, __err, __l);



       if (__l < __gnu_cxx::__numeric_traits<int>::__min)
  {
    __err |= ios_base::failbit;
    __n = __gnu_cxx::__numeric_traits<int>::__min;
  }
       else if (__l > __gnu_cxx::__numeric_traits<int>::__max)
  {
    __err |= ios_base::failbit;
    __n = __gnu_cxx::__numeric_traits<int>::__max;
  }
       else
  __n = int(__l);
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::badbit); }
   if (__err)
     this->setstate(__err);
 }
      return *this;
    }

  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    basic_istream<_CharT, _Traits>::
    operator>>(__streambuf_type* __sbout)
    {
      ios_base::iostate __err = ios_base::goodbit;
      sentry __cerb(*this, false);
      if (__cerb && __sbout)
 {
   try
     {
       bool __ineof;
       if (!__copy_streambufs_eof(this->rdbuf(), __sbout, __ineof))
  __err |= ios_base::failbit;
       if (__ineof)
  __err |= ios_base::eofbit;
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::failbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::failbit); }
 }
      else if (!__sbout)
 __err |= ios_base::failbit;
      if (__err)
 this->setstate(__err);
      return *this;
    }

  template<typename _CharT, typename _Traits>
    typename basic_istream<_CharT, _Traits>::int_type
    basic_istream<_CharT, _Traits>::
    get(void)
    {
      const int_type __eof = traits_type::eof();
      int_type __c = __eof;
      _M_gcount = 0;
      ios_base::iostate __err = ios_base::goodbit;
      sentry __cerb(*this, true);
      if (__cerb)
 {
   try
     {
       __c = this->rdbuf()->sbumpc();

       if (!traits_type::eq_int_type(__c, __eof))
  _M_gcount = 1;
       else
  __err |= ios_base::eofbit;
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::badbit); }
 }
      if (!_M_gcount)
 __err |= ios_base::failbit;
      if (__err)
 this->setstate(__err);
      return __c;
    }

  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    basic_istream<_CharT, _Traits>::
    get(char_type& __c)
    {
      _M_gcount = 0;
      ios_base::iostate __err = ios_base::goodbit;
      sentry __cerb(*this, true);
      if (__cerb)
 {
   try
     {
       const int_type __cb = this->rdbuf()->sbumpc();

       if (!traits_type::eq_int_type(__cb, traits_type::eof()))
  {
    _M_gcount = 1;
    __c = traits_type::to_char_type(__cb);
  }
       else
  __err |= ios_base::eofbit;
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::badbit); }
 }
      if (!_M_gcount)
 __err |= ios_base::failbit;
      if (__err)
 this->setstate(__err);
      return *this;
    }

  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    basic_istream<_CharT, _Traits>::
    get(char_type* __s, streamsize __n, char_type __delim)
    {
      _M_gcount = 0;
      ios_base::iostate __err = ios_base::goodbit;
      sentry __cerb(*this, true);
      if (__cerb)
 {
   try
     {
       const int_type __idelim = traits_type::to_int_type(__delim);
       const int_type __eof = traits_type::eof();
       __streambuf_type* __sb = this->rdbuf();
       int_type __c = __sb->sgetc();

       while (_M_gcount + 1 < __n
       && !traits_type::eq_int_type(__c, __eof)
       && !traits_type::eq_int_type(__c, __idelim))
  {
    *__s++ = traits_type::to_char_type(__c);
    ++_M_gcount;
    __c = __sb->snextc();
  }
       if (traits_type::eq_int_type(__c, __eof))
  __err |= ios_base::eofbit;
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::badbit); }
 }


      if (__n > 0)
 *__s = char_type();
      if (!_M_gcount)
 __err |= ios_base::failbit;
      if (__err)
 this->setstate(__err);
      return *this;
    }

  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    basic_istream<_CharT, _Traits>::
    get(__streambuf_type& __sb, char_type __delim)
    {
      _M_gcount = 0;
      ios_base::iostate __err = ios_base::goodbit;
      sentry __cerb(*this, true);
      if (__cerb)
 {
   try
     {
       const int_type __idelim = traits_type::to_int_type(__delim);
       const int_type __eof = traits_type::eof();
       __streambuf_type* __this_sb = this->rdbuf();
       int_type __c = __this_sb->sgetc();
       char_type __c2 = traits_type::to_char_type(__c);

       while (!traits_type::eq_int_type(__c, __eof)
       && !traits_type::eq_int_type(__c, __idelim)
       && !traits_type::eq_int_type(__sb.sputc(__c2), __eof))
  {
    ++_M_gcount;
    __c = __this_sb->snextc();
    __c2 = traits_type::to_char_type(__c);
  }
       if (traits_type::eq_int_type(__c, __eof))
  __err |= ios_base::eofbit;
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::badbit); }
 }
      if (!_M_gcount)
 __err |= ios_base::failbit;
      if (__err)
 this->setstate(__err);
      return *this;
    }

  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    basic_istream<_CharT, _Traits>::
    getline(char_type* __s, streamsize __n, char_type __delim)
    {
      _M_gcount = 0;
      ios_base::iostate __err = ios_base::goodbit;
      sentry __cerb(*this, true);
      if (__cerb)
        {
          try
            {
              const int_type __idelim = traits_type::to_int_type(__delim);
              const int_type __eof = traits_type::eof();
              __streambuf_type* __sb = this->rdbuf();
              int_type __c = __sb->sgetc();

              while (_M_gcount + 1 < __n
                     && !traits_type::eq_int_type(__c, __eof)
                     && !traits_type::eq_int_type(__c, __idelim))
                {
                  *__s++ = traits_type::to_char_type(__c);
                  __c = __sb->snextc();
                  ++_M_gcount;
                }
              if (traits_type::eq_int_type(__c, __eof))
                __err |= ios_base::eofbit;
              else
                {
                  if (traits_type::eq_int_type(__c, __idelim))
                    {
                      __sb->sbumpc();
                      ++_M_gcount;
                    }
                  else
                    __err |= ios_base::failbit;
                }
            }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
          catch(...)
            { this->_M_setstate(ios_base::badbit); }
        }


      if (__n > 0)
 *__s = char_type();
      if (!_M_gcount)
        __err |= ios_base::failbit;
      if (__err)
        this->setstate(__err);
      return *this;
    }




  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    basic_istream<_CharT, _Traits>::
    ignore(void)
    {
      _M_gcount = 0;
      sentry __cerb(*this, true);
      if (__cerb)
 {
   ios_base::iostate __err = ios_base::goodbit;
   try
     {
       const int_type __eof = traits_type::eof();
       __streambuf_type* __sb = this->rdbuf();

       if (traits_type::eq_int_type(__sb->sbumpc(), __eof))
  __err |= ios_base::eofbit;
       else
  _M_gcount = 1;
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::badbit); }
   if (__err)
     this->setstate(__err);
 }
      return *this;
    }

  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    basic_istream<_CharT, _Traits>::
    ignore(streamsize __n)
    {
      _M_gcount = 0;
      sentry __cerb(*this, true);
      if (__cerb && __n > 0)
        {
          ios_base::iostate __err = ios_base::goodbit;
          try
            {
              const int_type __eof = traits_type::eof();
              __streambuf_type* __sb = this->rdbuf();
              int_type __c = __sb->sgetc();
# 513 "/usr/include/c++/5/bits/istream.tcc" 3
       bool __large_ignore = false;
       while (true)
  {
    while (_M_gcount < __n
    && !traits_type::eq_int_type(__c, __eof))
      {
        ++_M_gcount;
        __c = __sb->snextc();
      }
    if (__n == __gnu_cxx::__numeric_traits<streamsize>::__max
        && !traits_type::eq_int_type(__c, __eof))
      {
        _M_gcount =
   __gnu_cxx::__numeric_traits<streamsize>::__min;
        __large_ignore = true;
      }
    else
      break;
  }

       if (__large_ignore)
  _M_gcount = __gnu_cxx::__numeric_traits<streamsize>::__max;

       if (traits_type::eq_int_type(__c, __eof))
                __err |= ios_base::eofbit;
            }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
          catch(...)
            { this->_M_setstate(ios_base::badbit); }
          if (__err)
            this->setstate(__err);
        }
      return *this;
    }

  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    basic_istream<_CharT, _Traits>::
    ignore(streamsize __n, int_type __delim)
    {
      _M_gcount = 0;
      sentry __cerb(*this, true);
      if (__cerb && __n > 0)
        {
          ios_base::iostate __err = ios_base::goodbit;
          try
            {
              const int_type __eof = traits_type::eof();
              __streambuf_type* __sb = this->rdbuf();
              int_type __c = __sb->sgetc();


       bool __large_ignore = false;
       while (true)
  {
    while (_M_gcount < __n
    && !traits_type::eq_int_type(__c, __eof)
    && !traits_type::eq_int_type(__c, __delim))
      {
        ++_M_gcount;
        __c = __sb->snextc();
      }
    if (__n == __gnu_cxx::__numeric_traits<streamsize>::__max
        && !traits_type::eq_int_type(__c, __eof)
        && !traits_type::eq_int_type(__c, __delim))
      {
        _M_gcount =
   __gnu_cxx::__numeric_traits<streamsize>::__min;
        __large_ignore = true;
      }
    else
      break;
  }

       if (__large_ignore)
  _M_gcount = __gnu_cxx::__numeric_traits<streamsize>::__max;

              if (traits_type::eq_int_type(__c, __eof))
                __err |= ios_base::eofbit;
       else if (traits_type::eq_int_type(__c, __delim))
  {
    if (_M_gcount
        < __gnu_cxx::__numeric_traits<streamsize>::__max)
      ++_M_gcount;
    __sb->sbumpc();
  }
            }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
          catch(...)
            { this->_M_setstate(ios_base::badbit); }
          if (__err)
            this->setstate(__err);
        }
      return *this;
    }

  template<typename _CharT, typename _Traits>
    typename basic_istream<_CharT, _Traits>::int_type
    basic_istream<_CharT, _Traits>::
    peek(void)
    {
      int_type __c = traits_type::eof();
      _M_gcount = 0;
      sentry __cerb(*this, true);
      if (__cerb)
 {
   ios_base::iostate __err = ios_base::goodbit;
   try
     {
       __c = this->rdbuf()->sgetc();
       if (traits_type::eq_int_type(__c, traits_type::eof()))
  __err |= ios_base::eofbit;
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::badbit); }
   if (__err)
     this->setstate(__err);
 }
      return __c;
    }

  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    basic_istream<_CharT, _Traits>::
    read(char_type* __s, streamsize __n)
    {
      _M_gcount = 0;
      sentry __cerb(*this, true);
      if (__cerb)
 {
   ios_base::iostate __err = ios_base::goodbit;
   try
     {
       _M_gcount = this->rdbuf()->sgetn(__s, __n);
       if (_M_gcount != __n)
  __err |= (ios_base::eofbit | ios_base::failbit);
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::badbit); }
   if (__err)
     this->setstate(__err);
 }
      return *this;
    }

  template<typename _CharT, typename _Traits>
    streamsize
    basic_istream<_CharT, _Traits>::
    readsome(char_type* __s, streamsize __n)
    {
      _M_gcount = 0;
      sentry __cerb(*this, true);
      if (__cerb)
 {
   ios_base::iostate __err = ios_base::goodbit;
   try
     {

       const streamsize __num = this->rdbuf()->in_avail();
       if (__num > 0)
  _M_gcount = this->rdbuf()->sgetn(__s, std::min(__num, __n));
       else if (__num == -1)
  __err |= ios_base::eofbit;
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::badbit); }
   if (__err)
     this->setstate(__err);
 }
      return _M_gcount;
    }

  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    basic_istream<_CharT, _Traits>::
    putback(char_type __c)
    {


      _M_gcount = 0;

      this->clear(this->rdstate() & ~ios_base::eofbit);
      sentry __cerb(*this, true);
      if (__cerb)
 {
   ios_base::iostate __err = ios_base::goodbit;
   try
     {
       const int_type __eof = traits_type::eof();
       __streambuf_type* __sb = this->rdbuf();
       if (!__sb
    || traits_type::eq_int_type(__sb->sputbackc(__c), __eof))
  __err |= ios_base::badbit;
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::badbit); }
   if (__err)
     this->setstate(__err);
 }
      return *this;
    }

  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    basic_istream<_CharT, _Traits>::
    unget(void)
    {


      _M_gcount = 0;

      this->clear(this->rdstate() & ~ios_base::eofbit);
      sentry __cerb(*this, true);
      if (__cerb)
 {
   ios_base::iostate __err = ios_base::goodbit;
   try
     {
       const int_type __eof = traits_type::eof();
       __streambuf_type* __sb = this->rdbuf();
       if (!__sb
    || traits_type::eq_int_type(__sb->sungetc(), __eof))
  __err |= ios_base::badbit;
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::badbit); }
   if (__err)
     this->setstate(__err);
 }
      return *this;
    }

  template<typename _CharT, typename _Traits>
    int
    basic_istream<_CharT, _Traits>::
    sync(void)
    {


      int __ret = -1;
      sentry __cerb(*this, true);
      if (__cerb)
 {
   ios_base::iostate __err = ios_base::goodbit;
   try
     {
       __streambuf_type* __sb = this->rdbuf();
       if (__sb)
  {
    if (__sb->pubsync() == -1)
      __err |= ios_base::badbit;
    else
      __ret = 0;
  }
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::badbit); }
   if (__err)
     this->setstate(__err);
 }
      return __ret;
    }

  template<typename _CharT, typename _Traits>
    typename basic_istream<_CharT, _Traits>::pos_type
    basic_istream<_CharT, _Traits>::
    tellg(void)
    {


      pos_type __ret = pos_type(-1);
      sentry __cerb(*this, true);
      if (__cerb)
 {
   try
     {
       if (!this->fail())
  __ret = this->rdbuf()->pubseekoff(0, ios_base::cur,
        ios_base::in);
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::badbit); }
 }
      return __ret;
    }

  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    basic_istream<_CharT, _Traits>::
    seekg(pos_type __pos)
    {



      this->clear(this->rdstate() & ~ios_base::eofbit);
      sentry __cerb(*this, true);
      if (__cerb)
 {
   ios_base::iostate __err = ios_base::goodbit;
   try
     {
       if (!this->fail())
  {

    const pos_type __p = this->rdbuf()->pubseekpos(__pos,
         ios_base::in);


    if (__p == pos_type(off_type(-1)))
      __err |= ios_base::failbit;
  }
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::badbit); }
   if (__err)
     this->setstate(__err);
 }
      return *this;
    }

  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    basic_istream<_CharT, _Traits>::
    seekg(off_type __off, ios_base::seekdir __dir)
    {



      this->clear(this->rdstate() & ~ios_base::eofbit);
      sentry __cerb(*this, true);
      if (__cerb)
 {
   ios_base::iostate __err = ios_base::goodbit;
   try
     {
       if (!this->fail())
  {

    const pos_type __p = this->rdbuf()->pubseekoff(__off, __dir,
         ios_base::in);


    if (__p == pos_type(off_type(-1)))
      __err |= ios_base::failbit;
  }
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::badbit); }
   if (__err)
     this->setstate(__err);
 }
      return *this;
    }


  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    operator>>(basic_istream<_CharT, _Traits>& __in, _CharT& __c)
    {
      typedef basic_istream<_CharT, _Traits> __istream_type;
      typedef typename __istream_type::int_type __int_type;

      typename __istream_type::sentry __cerb(__in, false);
      if (__cerb)
 {
   ios_base::iostate __err = ios_base::goodbit;
   try
     {
       const __int_type __cb = __in.rdbuf()->sbumpc();
       if (!_Traits::eq_int_type(__cb, _Traits::eof()))
  __c = _Traits::to_char_type(__cb);
       else
  __err |= (ios_base::eofbit | ios_base::failbit);
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       __in._M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { __in._M_setstate(ios_base::badbit); }
   if (__err)
     __in.setstate(__err);
 }
      return __in;
    }

  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    operator>>(basic_istream<_CharT, _Traits>& __in, _CharT* __s)
    {
      typedef basic_istream<_CharT, _Traits> __istream_type;
      typedef basic_streambuf<_CharT, _Traits> __streambuf_type;
      typedef typename _Traits::int_type int_type;
      typedef _CharT char_type;
      typedef ctype<_CharT> __ctype_type;

      streamsize __extracted = 0;
      ios_base::iostate __err = ios_base::goodbit;
      typename __istream_type::sentry __cerb(__in, false);
      if (__cerb)
 {
   try
     {

       streamsize __num = __in.width();
       if (__num <= 0)
  __num = __gnu_cxx::__numeric_traits<streamsize>::__max;

       const __ctype_type& __ct = use_facet<__ctype_type>(__in.getloc());

       const int_type __eof = _Traits::eof();
       __streambuf_type* __sb = __in.rdbuf();
       int_type __c = __sb->sgetc();

       while (__extracted < __num - 1
       && !_Traits::eq_int_type(__c, __eof)
       && !__ct.is(ctype_base::space,
     _Traits::to_char_type(__c)))
  {
    *__s++ = _Traits::to_char_type(__c);
    ++__extracted;
    __c = __sb->snextc();
  }
       if (_Traits::eq_int_type(__c, __eof))
  __err |= ios_base::eofbit;



       *__s = char_type();
       __in.width(0);
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       __in._M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { __in._M_setstate(ios_base::badbit); }
 }
      if (!__extracted)
 __err |= ios_base::failbit;
      if (__err)
 __in.setstate(__err);
      return __in;
    }


  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    ws(basic_istream<_CharT, _Traits>& __in)
    {
      typedef basic_istream<_CharT, _Traits> __istream_type;
      typedef basic_streambuf<_CharT, _Traits> __streambuf_type;
      typedef typename __istream_type::int_type __int_type;
      typedef ctype<_CharT> __ctype_type;

      const __ctype_type& __ct = use_facet<__ctype_type>(__in.getloc());
      const __int_type __eof = _Traits::eof();
      __streambuf_type* __sb = __in.rdbuf();
      __int_type __c = __sb->sgetc();

      while (!_Traits::eq_int_type(__c, __eof)
      && __ct.is(ctype_base::space, _Traits::to_char_type(__c)))
 __c = __sb->snextc();

       if (_Traits::eq_int_type(__c, __eof))
  __in.setstate(ios_base::eofbit);
      return __in;
    }




  extern template class basic_istream<char>;
  extern template istream& ws(istream&);
  extern template istream& operator>>(istream&, char&);
  extern template istream& operator>>(istream&, char*);
  extern template istream& operator>>(istream&, unsigned char&);
  extern template istream& operator>>(istream&, signed char&);
  extern template istream& operator>>(istream&, unsigned char*);
  extern template istream& operator>>(istream&, signed char*);

  extern template istream& istream::_M_extract(unsigned short&);
  extern template istream& istream::_M_extract(unsigned int&);
  extern template istream& istream::_M_extract(long&);
  extern template istream& istream::_M_extract(unsigned long&);
  extern template istream& istream::_M_extract(bool&);

  extern template istream& istream::_M_extract(long long&);
  extern template istream& istream::_M_extract(unsigned long long&);

  extern template istream& istream::_M_extract(float&);
  extern template istream& istream::_M_extract(double&);
  extern template istream& istream::_M_extract(long double&);
  extern template istream& istream::_M_extract(void*&);

  extern template class basic_iostream<char>;


  extern template class basic_istream<wchar_t>;
  extern template wistream& ws(wistream&);
  extern template wistream& operator>>(wistream&, wchar_t&);
  extern template wistream& operator>>(wistream&, wchar_t*);

  extern template wistream& wistream::_M_extract(unsigned short&);
  extern template wistream& wistream::_M_extract(unsigned int&);
  extern template wistream& wistream::_M_extract(long&);
  extern template wistream& wistream::_M_extract(unsigned long&);
  extern template wistream& wistream::_M_extract(bool&);

  extern template wistream& wistream::_M_extract(long long&);
  extern template wistream& wistream::_M_extract(unsigned long long&);

  extern template wistream& wistream::_M_extract(float&);
  extern template wistream& wistream::_M_extract(double&);
  extern template wistream& wistream::_M_extract(long double&);
  extern template wistream& wistream::_M_extract(void*&);

  extern template class basic_iostream<wchar_t>;




}
# 935 "/usr/include/c++/5/istream" 2 3
# 41 "/usr/include/c++/5/iostream" 2 3

namespace std __attribute__ ((__visibility__ ("default")))
{

# 60 "/usr/include/c++/5/iostream" 3
  extern istream cin;
  extern ostream cout;
  extern ostream cerr;
  extern ostream clog;


  extern wistream wcin;
  extern wostream wcout;
  extern wostream wcerr;
  extern wostream wclog;




  static ios_base::Init __ioinit;


}
# 5 "localMinima.cpp" 2
# 1 "/usr/include/c++/5/fstream" 1 3
# 36 "/usr/include/c++/5/fstream" 3
       
# 37 "/usr/include/c++/5/fstream" 3



# 1 "/usr/include/c++/5/bits/codecvt.h" 1 3
# 39 "/usr/include/c++/5/bits/codecvt.h" 3
       
# 40 "/usr/include/c++/5/bits/codecvt.h" 3

namespace std __attribute__ ((__visibility__ ("default")))
{



  class codecvt_base
  {
  public:
    enum result
    {
      ok,
      partial,
      error,
      noconv
    };
  };
# 67 "/usr/include/c++/5/bits/codecvt.h" 3
  template<typename _InternT, typename _ExternT, typename _StateT>
    class __codecvt_abstract_base
    : public locale::facet, public codecvt_base
    {
    public:

      typedef codecvt_base::result result;
      typedef _InternT intern_type;
      typedef _ExternT extern_type;
      typedef _StateT state_type;
# 115 "/usr/include/c++/5/bits/codecvt.h" 3
      result
      out(state_type& __state, const intern_type* __from,
   const intern_type* __from_end, const intern_type*& __from_next,
   extern_type* __to, extern_type* __to_end,
   extern_type*& __to_next) const
      {
 return this->do_out(__state, __from, __from_end, __from_next,
       __to, __to_end, __to_next);
      }
# 154 "/usr/include/c++/5/bits/codecvt.h" 3
      result
      unshift(state_type& __state, extern_type* __to, extern_type* __to_end,
       extern_type*& __to_next) const
      { return this->do_unshift(__state, __to,__to_end,__to_next); }
# 195 "/usr/include/c++/5/bits/codecvt.h" 3
      result
      in(state_type& __state, const extern_type* __from,
  const extern_type* __from_end, const extern_type*& __from_next,
  intern_type* __to, intern_type* __to_end,
  intern_type*& __to_next) const
      {
 return this->do_in(__state, __from, __from_end, __from_next,
      __to, __to_end, __to_next);
      }

      int
      encoding() const throw()
      { return this->do_encoding(); }

      bool
      always_noconv() const throw()
      { return this->do_always_noconv(); }

      int
      length(state_type& __state, const extern_type* __from,
      const extern_type* __end, size_t __max) const
      { return this->do_length(__state, __from, __end, __max); }

      int
      max_length() const throw()
      { return this->do_max_length(); }

    protected:
      explicit
      __codecvt_abstract_base(size_t __refs = 0) : locale::facet(__refs) { }

      virtual
      ~__codecvt_abstract_base() { }
# 236 "/usr/include/c++/5/bits/codecvt.h" 3
      virtual result
      do_out(state_type& __state, const intern_type* __from,
      const intern_type* __from_end, const intern_type*& __from_next,
      extern_type* __to, extern_type* __to_end,
      extern_type*& __to_next) const = 0;

      virtual result
      do_unshift(state_type& __state, extern_type* __to,
   extern_type* __to_end, extern_type*& __to_next) const = 0;

      virtual result
      do_in(state_type& __state, const extern_type* __from,
     const extern_type* __from_end, const extern_type*& __from_next,
     intern_type* __to, intern_type* __to_end,
     intern_type*& __to_next) const = 0;

      virtual int
      do_encoding() const throw() = 0;

      virtual bool
      do_always_noconv() const throw() = 0;

      virtual int
      do_length(state_type&, const extern_type* __from,
  const extern_type* __end, size_t __max) const = 0;

      virtual int
      do_max_length() const throw() = 0;
    };
# 273 "/usr/include/c++/5/bits/codecvt.h" 3
   template<typename _InternT, typename _ExternT, typename _StateT>
    class codecvt
    : public __codecvt_abstract_base<_InternT, _ExternT, _StateT>
    {
    public:

      typedef codecvt_base::result result;
      typedef _InternT intern_type;
      typedef _ExternT extern_type;
      typedef _StateT state_type;

    protected:
      __c_locale _M_c_locale_codecvt;

    public:
      static locale::id id;

      explicit
      codecvt(size_t __refs = 0)
      : __codecvt_abstract_base<_InternT, _ExternT, _StateT> (__refs),
 _M_c_locale_codecvt(0)
      { }

      explicit
      codecvt(__c_locale __cloc, size_t __refs = 0);

    protected:
      virtual
      ~codecvt() { }

      virtual result
      do_out(state_type& __state, const intern_type* __from,
      const intern_type* __from_end, const intern_type*& __from_next,
      extern_type* __to, extern_type* __to_end,
      extern_type*& __to_next) const;

      virtual result
      do_unshift(state_type& __state, extern_type* __to,
   extern_type* __to_end, extern_type*& __to_next) const;

      virtual result
      do_in(state_type& __state, const extern_type* __from,
     const extern_type* __from_end, const extern_type*& __from_next,
     intern_type* __to, intern_type* __to_end,
     intern_type*& __to_next) const;

      virtual int
      do_encoding() const throw();

      virtual bool
      do_always_noconv() const throw();

      virtual int
      do_length(state_type&, const extern_type* __from,
  const extern_type* __end, size_t __max) const;

      virtual int
      do_max_length() const throw();
    };

  template<typename _InternT, typename _ExternT, typename _StateT>
    locale::id codecvt<_InternT, _ExternT, _StateT>::id;


  template<>
    class codecvt<char, char, mbstate_t>
    : public __codecvt_abstract_base<char, char, mbstate_t>
    {
      friend class messages<char>;

    public:

      typedef char intern_type;
      typedef char extern_type;
      typedef mbstate_t state_type;

    protected:
      __c_locale _M_c_locale_codecvt;

    public:
      static locale::id id;

      explicit
      codecvt(size_t __refs = 0);

      explicit
      codecvt(__c_locale __cloc, size_t __refs = 0);

    protected:
      virtual
      ~codecvt();

      virtual result
      do_out(state_type& __state, const intern_type* __from,
      const intern_type* __from_end, const intern_type*& __from_next,
      extern_type* __to, extern_type* __to_end,
      extern_type*& __to_next) const;

      virtual result
      do_unshift(state_type& __state, extern_type* __to,
   extern_type* __to_end, extern_type*& __to_next) const;

      virtual result
      do_in(state_type& __state, const extern_type* __from,
     const extern_type* __from_end, const extern_type*& __from_next,
     intern_type* __to, intern_type* __to_end,
     intern_type*& __to_next) const;

      virtual int
      do_encoding() const throw();

      virtual bool
      do_always_noconv() const throw();

      virtual int
      do_length(state_type&, const extern_type* __from,
  const extern_type* __end, size_t __max) const;

      virtual int
      do_max_length() const throw();
  };






  template<>
    class codecvt<wchar_t, char, mbstate_t>
    : public __codecvt_abstract_base<wchar_t, char, mbstate_t>
    {
      friend class messages<wchar_t>;

    public:

      typedef wchar_t intern_type;
      typedef char extern_type;
      typedef mbstate_t state_type;

    protected:
      __c_locale _M_c_locale_codecvt;

    public:
      static locale::id id;

      explicit
      codecvt(size_t __refs = 0);

      explicit
      codecvt(__c_locale __cloc, size_t __refs = 0);

    protected:
      virtual
      ~codecvt();

      virtual result
      do_out(state_type& __state, const intern_type* __from,
      const intern_type* __from_end, const intern_type*& __from_next,
      extern_type* __to, extern_type* __to_end,
      extern_type*& __to_next) const;

      virtual result
      do_unshift(state_type& __state,
   extern_type* __to, extern_type* __to_end,
   extern_type*& __to_next) const;

      virtual result
      do_in(state_type& __state,
      const extern_type* __from, const extern_type* __from_end,
      const extern_type*& __from_next,
      intern_type* __to, intern_type* __to_end,
      intern_type*& __to_next) const;

      virtual
      int do_encoding() const throw();

      virtual
      bool do_always_noconv() const throw();

      virtual
      int do_length(state_type&, const extern_type* __from,
      const extern_type* __end, size_t __max) const;

      virtual int
      do_max_length() const throw();
    };
# 581 "/usr/include/c++/5/bits/codecvt.h" 3
  template<typename _InternT, typename _ExternT, typename _StateT>
    class codecvt_byname : public codecvt<_InternT, _ExternT, _StateT>
    {
    public:
      explicit
      codecvt_byname(const char* __s, size_t __refs = 0)
      : codecvt<_InternT, _ExternT, _StateT>(__refs)
      {
 if (__builtin_strcmp(__s, "C") != 0
     && __builtin_strcmp(__s, "POSIX") != 0)
   {
     this->_S_destroy_c_locale(this->_M_c_locale_codecvt);
     this->_S_create_c_locale(this->_M_c_locale_codecvt, __s);
   }
      }







    protected:
      virtual
      ~codecvt_byname() { }
    };
# 649 "/usr/include/c++/5/bits/codecvt.h" 3
  extern template class codecvt_byname<char, char, mbstate_t>;

  extern template
    const codecvt<char, char, mbstate_t>&
    use_facet<codecvt<char, char, mbstate_t> >(const locale&);

  extern template
    bool
    has_facet<codecvt<char, char, mbstate_t> >(const locale&);


  extern template class codecvt_byname<wchar_t, char, mbstate_t>;

  extern template
    const codecvt<wchar_t, char, mbstate_t>&
    use_facet<codecvt<wchar_t, char, mbstate_t> >(const locale&);

  extern template
    bool
    has_facet<codecvt<wchar_t, char, mbstate_t> >(const locale&);
# 678 "/usr/include/c++/5/bits/codecvt.h" 3

}
# 41 "/usr/include/c++/5/fstream" 2 3
# 1 "/usr/include/c++/5/cstdio" 1 3
# 39 "/usr/include/c++/5/cstdio" 3
       
# 40 "/usr/include/c++/5/cstdio" 3


# 1 "/usr/include/stdio.h" 1 3 4
# 29 "/usr/include/stdio.h" 3 4
extern "C" {



# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 1 3 4
# 34 "/usr/include/stdio.h" 2 3 4
# 74 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/libio.h" 1 3 4
# 31 "/usr/include/libio.h" 3 4
# 1 "/usr/include/_G_config.h" 1 3 4
# 15 "/usr/include/_G_config.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 1 3 4
# 16 "/usr/include/_G_config.h" 2 3 4




# 1 "/usr/include/wchar.h" 1 3 4
# 21 "/usr/include/_G_config.h" 2 3 4
typedef struct
{
  __off_t __pos;
  __mbstate_t __state;
} _G_fpos_t;
typedef struct
{
  __off64_t __pos;
  __mbstate_t __state;
} _G_fpos64_t;
# 32 "/usr/include/libio.h" 2 3 4
# 49 "/usr/include/libio.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdarg.h" 1 3 4
# 50 "/usr/include/libio.h" 2 3 4
# 144 "/usr/include/libio.h" 3 4
struct _IO_jump_t; struct _IO_FILE;





typedef void _IO_lock_t;





struct _IO_marker {
  struct _IO_marker *_next;
  struct _IO_FILE *_sbuf;



  int _pos;
# 173 "/usr/include/libio.h" 3 4
};


enum __codecvt_result
{
  __codecvt_ok,
  __codecvt_partial,
  __codecvt_error,
  __codecvt_noconv
};
# 241 "/usr/include/libio.h" 3 4
struct _IO_FILE {
  int _flags;




  char* _IO_read_ptr;
  char* _IO_read_end;
  char* _IO_read_base;
  char* _IO_write_base;
  char* _IO_write_ptr;
  char* _IO_write_end;
  char* _IO_buf_base;
  char* _IO_buf_end;

  char *_IO_save_base;
  char *_IO_backup_base;
  char *_IO_save_end;

  struct _IO_marker *_markers;

  struct _IO_FILE *_chain;

  int _fileno;



  int _flags2;

  __off_t _old_offset;



  unsigned short _cur_column;
  signed char _vtable_offset;
  char _shortbuf[1];



  _IO_lock_t *_lock;
# 289 "/usr/include/libio.h" 3 4
  __off64_t _offset;







  void *__pad1;
  void *__pad2;
  void *__pad3;
  void *__pad4;

  size_t __pad5;
  int _mode;

  char _unused2[15 * sizeof (int) - 4 * sizeof (void *) - sizeof (size_t)];

};





struct _IO_FILE_plus;

extern struct _IO_FILE_plus _IO_2_1_stdin_;
extern struct _IO_FILE_plus _IO_2_1_stdout_;
extern struct _IO_FILE_plus _IO_2_1_stderr_;
# 333 "/usr/include/libio.h" 3 4
typedef __ssize_t __io_read_fn (void *__cookie, char *__buf, size_t __nbytes);







typedef __ssize_t __io_write_fn (void *__cookie, const char *__buf,
     size_t __n);







typedef int __io_seek_fn (void *__cookie, __off64_t *__pos, int __w);


typedef int __io_close_fn (void *__cookie);




typedef __io_read_fn cookie_read_function_t;
typedef __io_write_fn cookie_write_function_t;
typedef __io_seek_fn cookie_seek_function_t;
typedef __io_close_fn cookie_close_function_t;


typedef struct
{
  __io_read_fn *read;
  __io_write_fn *write;
  __io_seek_fn *seek;
  __io_close_fn *close;
} _IO_cookie_io_functions_t;
typedef _IO_cookie_io_functions_t cookie_io_functions_t;

struct _IO_cookie_file;


extern void _IO_cookie_init (struct _IO_cookie_file *__cfile, int __read_write,
        void *__cookie, _IO_cookie_io_functions_t __fns);




extern "C" {


extern int __underflow (_IO_FILE *);
extern int __uflow (_IO_FILE *);
extern int __overflow (_IO_FILE *, int);
# 429 "/usr/include/libio.h" 3 4
extern int _IO_getc (_IO_FILE *__fp);
extern int _IO_putc (int __c, _IO_FILE *__fp);
extern int _IO_feof (_IO_FILE *__fp) throw ();
extern int _IO_ferror (_IO_FILE *__fp) throw ();

extern int _IO_peekc_locked (_IO_FILE *__fp);





extern void _IO_flockfile (_IO_FILE *) throw ();
extern void _IO_funlockfile (_IO_FILE *) throw ();
extern int _IO_ftrylockfile (_IO_FILE *) throw ();
# 459 "/usr/include/libio.h" 3 4
extern int _IO_vfscanf (_IO_FILE * __restrict, const char * __restrict,
   __gnuc_va_list, int *__restrict);
extern int _IO_vfprintf (_IO_FILE *__restrict, const char *__restrict,
    __gnuc_va_list);
extern __ssize_t _IO_padn (_IO_FILE *, int, __ssize_t);
extern size_t _IO_sgetn (_IO_FILE *, void *, size_t);

extern __off64_t _IO_seekoff (_IO_FILE *, __off64_t, int, int);
extern __off64_t _IO_seekpos (_IO_FILE *, __off64_t, int);

extern void _IO_free_backup_area (_IO_FILE *) throw ();
# 521 "/usr/include/libio.h" 3 4
}
# 75 "/usr/include/stdio.h" 2 3 4




typedef __gnuc_va_list va_list;
# 108 "/usr/include/stdio.h" 3 4


typedef _G_fpos_t fpos_t;





typedef _G_fpos64_t fpos64_t;
# 164 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/stdio_lim.h" 1 3 4
# 165 "/usr/include/stdio.h" 2 3 4



extern struct _IO_FILE *stdin;
extern struct _IO_FILE *stdout;
extern struct _IO_FILE *stderr;







extern int remove (const char *__filename) throw ();

extern int rename (const char *__old, const char *__new) throw ();




extern int renameat (int __oldfd, const char *__old, int __newfd,
       const char *__new) throw ();








extern FILE *tmpfile (void) ;
# 205 "/usr/include/stdio.h" 3 4
extern FILE *tmpfile64 (void) ;



extern char *tmpnam (char *__s) throw () ;





extern char *tmpnam_r (char *__s) throw () ;
# 227 "/usr/include/stdio.h" 3 4
extern char *tempnam (const char *__dir, const char *__pfx)
     throw () __attribute__ ((__malloc__)) ;








extern int fclose (FILE *__stream);




extern int fflush (FILE *__stream);

# 252 "/usr/include/stdio.h" 3 4
extern int fflush_unlocked (FILE *__stream);
# 262 "/usr/include/stdio.h" 3 4
extern int fcloseall (void);









extern FILE *fopen (const char *__restrict __filename,
      const char *__restrict __modes) ;




extern FILE *freopen (const char *__restrict __filename,
        const char *__restrict __modes,
        FILE *__restrict __stream) ;
# 295 "/usr/include/stdio.h" 3 4


extern FILE *fopen64 (const char *__restrict __filename,
        const char *__restrict __modes) ;
extern FILE *freopen64 (const char *__restrict __filename,
   const char *__restrict __modes,
   FILE *__restrict __stream) ;




extern FILE *fdopen (int __fd, const char *__modes) throw () ;





extern FILE *fopencookie (void *__restrict __magic_cookie,
     const char *__restrict __modes,
     _IO_cookie_io_functions_t __io_funcs) throw () ;




extern FILE *fmemopen (void *__s, size_t __len, const char *__modes)
  throw () ;




extern FILE *open_memstream (char **__bufloc, size_t *__sizeloc) throw () ;






extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) throw ();



extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
      int __modes, size_t __n) throw ();





extern void setbuffer (FILE *__restrict __stream, char *__restrict __buf,
         size_t __size) throw ();


extern void setlinebuf (FILE *__stream) throw ();








extern int fprintf (FILE *__restrict __stream,
      const char *__restrict __format, ...);




extern int printf (const char *__restrict __format, ...);

extern int sprintf (char *__restrict __s,
      const char *__restrict __format, ...) throw ();





extern int vfprintf (FILE *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg);




extern int vprintf (const char *__restrict __format, __gnuc_va_list __arg);

extern int vsprintf (char *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg) throw ();





extern int snprintf (char *__restrict __s, size_t __maxlen,
       const char *__restrict __format, ...)
     throw () __attribute__ ((__format__ (__printf__, 3, 4)));

extern int vsnprintf (char *__restrict __s, size_t __maxlen,
        const char *__restrict __format, __gnuc_va_list __arg)
     throw () __attribute__ ((__format__ (__printf__, 3, 0)));






extern int vasprintf (char **__restrict __ptr, const char *__restrict __f,
        __gnuc_va_list __arg)
     throw () __attribute__ ((__format__ (__printf__, 2, 0))) ;
extern int __asprintf (char **__restrict __ptr,
         const char *__restrict __fmt, ...)
     throw () __attribute__ ((__format__ (__printf__, 2, 3))) ;
extern int asprintf (char **__restrict __ptr,
       const char *__restrict __fmt, ...)
     throw () __attribute__ ((__format__ (__printf__, 2, 3))) ;




extern int vdprintf (int __fd, const char *__restrict __fmt,
       __gnuc_va_list __arg)
     __attribute__ ((__format__ (__printf__, 2, 0)));
extern int dprintf (int __fd, const char *__restrict __fmt, ...)
     __attribute__ ((__format__ (__printf__, 2, 3)));








extern int fscanf (FILE *__restrict __stream,
     const char *__restrict __format, ...) ;




extern int scanf (const char *__restrict __format, ...) ;

extern int sscanf (const char *__restrict __s,
     const char *__restrict __format, ...) throw ();
# 463 "/usr/include/stdio.h" 3 4








extern int vfscanf (FILE *__restrict __s, const char *__restrict __format,
      __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 2, 0))) ;





extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 1, 0))) ;


extern int vsscanf (const char *__restrict __s,
      const char *__restrict __format, __gnuc_va_list __arg)
     throw () __attribute__ ((__format__ (__scanf__, 2, 0)));
# 522 "/usr/include/stdio.h" 3 4









extern int fgetc (FILE *__stream);
extern int getc (FILE *__stream);





extern int getchar (void);

# 550 "/usr/include/stdio.h" 3 4
extern int getc_unlocked (FILE *__stream);
extern int getchar_unlocked (void);
# 561 "/usr/include/stdio.h" 3 4
extern int fgetc_unlocked (FILE *__stream);











extern int fputc (int __c, FILE *__stream);
extern int putc (int __c, FILE *__stream);





extern int putchar (int __c);

# 594 "/usr/include/stdio.h" 3 4
extern int fputc_unlocked (int __c, FILE *__stream);







extern int putc_unlocked (int __c, FILE *__stream);
extern int putchar_unlocked (int __c);






extern int getw (FILE *__stream);


extern int putw (int __w, FILE *__stream);








extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
     ;
# 638 "/usr/include/stdio.h" 3 4
extern char *gets (char *__s) __attribute__ ((__deprecated__));


# 649 "/usr/include/stdio.h" 3 4
extern char *fgets_unlocked (char *__restrict __s, int __n,
        FILE *__restrict __stream) ;
# 665 "/usr/include/stdio.h" 3 4
extern __ssize_t __getdelim (char **__restrict __lineptr,
          size_t *__restrict __n, int __delimiter,
          FILE *__restrict __stream) ;
extern __ssize_t getdelim (char **__restrict __lineptr,
        size_t *__restrict __n, int __delimiter,
        FILE *__restrict __stream) ;







extern __ssize_t getline (char **__restrict __lineptr,
       size_t *__restrict __n,
       FILE *__restrict __stream) ;








extern int fputs (const char *__restrict __s, FILE *__restrict __stream);





extern int puts (const char *__s);






extern int ungetc (int __c, FILE *__stream);






extern size_t fread (void *__restrict __ptr, size_t __size,
       size_t __n, FILE *__restrict __stream) ;




extern size_t fwrite (const void *__restrict __ptr, size_t __size,
        size_t __n, FILE *__restrict __s);

# 726 "/usr/include/stdio.h" 3 4
extern int fputs_unlocked (const char *__restrict __s,
      FILE *__restrict __stream);
# 737 "/usr/include/stdio.h" 3 4
extern size_t fread_unlocked (void *__restrict __ptr, size_t __size,
         size_t __n, FILE *__restrict __stream) ;
extern size_t fwrite_unlocked (const void *__restrict __ptr, size_t __size,
          size_t __n, FILE *__restrict __stream);








extern int fseek (FILE *__stream, long int __off, int __whence);




extern long int ftell (FILE *__stream) ;




extern void rewind (FILE *__stream);

# 773 "/usr/include/stdio.h" 3 4
extern int fseeko (FILE *__stream, __off_t __off, int __whence);




extern __off_t ftello (FILE *__stream) ;
# 792 "/usr/include/stdio.h" 3 4






extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos);




extern int fsetpos (FILE *__stream, const fpos_t *__pos);
# 815 "/usr/include/stdio.h" 3 4



extern int fseeko64 (FILE *__stream, __off64_t __off, int __whence);
extern __off64_t ftello64 (FILE *__stream) ;
extern int fgetpos64 (FILE *__restrict __stream, fpos64_t *__restrict __pos);
extern int fsetpos64 (FILE *__stream, const fpos64_t *__pos);




extern void clearerr (FILE *__stream) throw ();

extern int feof (FILE *__stream) throw () ;

extern int ferror (FILE *__stream) throw () ;




extern void clearerr_unlocked (FILE *__stream) throw ();
extern int feof_unlocked (FILE *__stream) throw () ;
extern int ferror_unlocked (FILE *__stream) throw () ;








extern void perror (const char *__s);






# 1 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h" 1 3 4
# 26 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h" 3 4
extern int sys_nerr;
extern const char *const sys_errlist[];


extern int _sys_nerr;
extern const char *const _sys_errlist[];
# 854 "/usr/include/stdio.h" 2 3 4




extern int fileno (FILE *__stream) throw () ;




extern int fileno_unlocked (FILE *__stream) throw () ;
# 872 "/usr/include/stdio.h" 3 4
extern FILE *popen (const char *__command, const char *__modes) ;





extern int pclose (FILE *__stream);





extern char *ctermid (char *__s) throw ();





extern char *cuserid (char *__s);




struct obstack;


extern int obstack_printf (struct obstack *__restrict __obstack,
      const char *__restrict __format, ...)
     throw () __attribute__ ((__format__ (__printf__, 2, 3)));
extern int obstack_vprintf (struct obstack *__restrict __obstack,
       const char *__restrict __format,
       __gnuc_va_list __args)
     throw () __attribute__ ((__format__ (__printf__, 2, 0)));







extern void flockfile (FILE *__stream) throw ();



extern int ftrylockfile (FILE *__stream) throw () ;


extern void funlockfile (FILE *__stream) throw ();
# 942 "/usr/include/stdio.h" 3 4
}
# 43 "/usr/include/c++/5/cstdio" 2 3
# 96 "/usr/include/c++/5/cstdio" 3
namespace std
{
  using ::FILE;
  using ::fpos_t;

  using ::clearerr;
  using ::fclose;
  using ::feof;
  using ::ferror;
  using ::fflush;
  using ::fgetc;
  using ::fgetpos;
  using ::fgets;
  using ::fopen;
  using ::fprintf;
  using ::fputc;
  using ::fputs;
  using ::fread;
  using ::freopen;
  using ::fscanf;
  using ::fseek;
  using ::fsetpos;
  using ::ftell;
  using ::fwrite;
  using ::getc;
  using ::getchar;


  using ::gets;

  using ::perror;
  using ::printf;
  using ::putc;
  using ::putchar;
  using ::puts;
  using ::remove;
  using ::rename;
  using ::rewind;
  using ::scanf;
  using ::setbuf;
  using ::setvbuf;
  using ::sprintf;
  using ::sscanf;
  using ::tmpfile;

  using ::tmpnam;

  using ::ungetc;
  using ::vfprintf;
  using ::vprintf;
  using ::vsprintf;
}
# 157 "/usr/include/c++/5/cstdio" 3
namespace __gnu_cxx
{
# 175 "/usr/include/c++/5/cstdio" 3
  using ::snprintf;
  using ::vfscanf;
  using ::vscanf;
  using ::vsnprintf;
  using ::vsscanf;

}

namespace std
{
  using ::__gnu_cxx::snprintf;
  using ::__gnu_cxx::vfscanf;
  using ::__gnu_cxx::vscanf;
  using ::__gnu_cxx::vsnprintf;
  using ::__gnu_cxx::vsscanf;
}
# 42 "/usr/include/c++/5/fstream" 2 3
# 1 "/usr/include/x86_64-linux-gnu/c++/5/bits/basic_file.h" 1 3
# 37 "/usr/include/x86_64-linux-gnu/c++/5/bits/basic_file.h" 3
       
# 38 "/usr/include/x86_64-linux-gnu/c++/5/bits/basic_file.h" 3


# 1 "/usr/include/x86_64-linux-gnu/c++/5/bits/c++io.h" 1 3
# 35 "/usr/include/x86_64-linux-gnu/c++/5/bits/c++io.h" 3
# 1 "/usr/include/c++/5/cstdio" 1 3
# 39 "/usr/include/c++/5/cstdio" 3
       
# 40 "/usr/include/c++/5/cstdio" 3
# 36 "/usr/include/x86_64-linux-gnu/c++/5/bits/c++io.h" 2 3


namespace std __attribute__ ((__visibility__ ("default")))
{


  typedef __gthread_mutex_t __c_lock;


  typedef FILE __c_file;


}
# 41 "/usr/include/x86_64-linux-gnu/c++/5/bits/basic_file.h" 2 3



namespace std __attribute__ ((__visibility__ ("default")))
{



  template<typename _CharT>
    class __basic_file;


  template<>
    class __basic_file<char>
    {

      __c_file* _M_cfile;


      bool _M_cfile_created;

    public:
      __basic_file(__c_lock* __lock = 0) throw ();
# 84 "/usr/include/x86_64-linux-gnu/c++/5/bits/basic_file.h" 3
      __basic_file*
      open(const char* __name, ios_base::openmode __mode, int __prot = 0664);

      __basic_file*
      sys_open(__c_file* __file, ios_base::openmode);

      __basic_file*
      sys_open(int __fd, ios_base::openmode __mode) throw ();

      __basic_file*
      close();

      __attribute__ ((__pure__)) bool
      is_open() const throw ();

      __attribute__ ((__pure__)) int
      fd() throw ();

      __attribute__ ((__pure__)) __c_file*
      file() throw ();

      ~__basic_file();

      streamsize
      xsputn(const char* __s, streamsize __n);

      streamsize
      xsputn_2(const char* __s1, streamsize __n1,
        const char* __s2, streamsize __n2);

      streamsize
      xsgetn(char* __s, streamsize __n);

      streamoff
      seekoff(streamoff __off, ios_base::seekdir __way) throw ();

      int
      sync();

      streamsize
      showmanyc();
    };


}
# 43 "/usr/include/c++/5/fstream" 2 3




namespace std __attribute__ ((__visibility__ ("default")))
{

# 71 "/usr/include/c++/5/fstream" 3
  template<typename _CharT, typename _Traits>
    class basic_filebuf : public basic_streambuf<_CharT, _Traits>
    {
# 88 "/usr/include/c++/5/fstream" 3
    public:

      typedef _CharT char_type;
      typedef _Traits traits_type;
      typedef typename traits_type::int_type int_type;
      typedef typename traits_type::pos_type pos_type;
      typedef typename traits_type::off_type off_type;

      typedef basic_streambuf<char_type, traits_type> __streambuf_type;
      typedef basic_filebuf<char_type, traits_type> __filebuf_type;
      typedef __basic_file<char> __file_type;
      typedef typename traits_type::state_type __state_type;
      typedef codecvt<char_type, char, __state_type> __codecvt_type;

      friend class ios_base;

    protected:


      __c_lock _M_lock;


      __file_type _M_file;


      ios_base::openmode _M_mode;


      __state_type _M_state_beg;




      __state_type _M_state_cur;



      __state_type _M_state_last;


      char_type* _M_buf;






      size_t _M_buf_size;


      bool _M_buf_allocated;
# 147 "/usr/include/c++/5/fstream" 3
      bool _M_reading;
      bool _M_writing;







      char_type _M_pback;
      char_type* _M_pback_cur_save;
      char_type* _M_pback_end_save;
      bool _M_pback_init;



      const __codecvt_type* _M_codecvt;






      char* _M_ext_buf;




      streamsize _M_ext_buf_size;






      const char* _M_ext_next;
      char* _M_ext_end;






      void
      _M_create_pback()
      {
 if (!_M_pback_init)
   {
     _M_pback_cur_save = this->gptr();
     _M_pback_end_save = this->egptr();
     this->setg(&_M_pback, &_M_pback, &_M_pback + 1);
     _M_pback_init = true;
   }
      }






      void
      _M_destroy_pback() throw()
      {
 if (_M_pback_init)
   {

     _M_pback_cur_save += this->gptr() != this->eback();
     this->setg(_M_buf, _M_pback_cur_save, _M_pback_end_save);
     _M_pback_init = false;
   }
      }

    public:







      basic_filebuf();
# 237 "/usr/include/c++/5/fstream" 3
      virtual
      ~basic_filebuf()
      { this->close(); }
# 251 "/usr/include/c++/5/fstream" 3
      bool
      is_open() const throw()
      { return _M_file.is_open(); }
# 296 "/usr/include/c++/5/fstream" 3
      __filebuf_type*
      open(const char* __s, ios_base::openmode __mode);
# 323 "/usr/include/c++/5/fstream" 3
      __filebuf_type*
      close();

    protected:
      void
      _M_allocate_internal_buffer();

      void
      _M_destroy_internal_buffer() throw();


      virtual streamsize
      showmanyc();






      virtual int_type
      underflow();

      virtual int_type
      pbackfail(int_type __c = _Traits::eof());
# 355 "/usr/include/c++/5/fstream" 3
      virtual int_type
      overflow(int_type __c = _Traits::eof());



      bool
      _M_convert_to_external(char_type*, streamsize);
# 375 "/usr/include/c++/5/fstream" 3
      virtual __streambuf_type*
      setbuf(char_type* __s, streamsize __n);

      virtual pos_type
      seekoff(off_type __off, ios_base::seekdir __way,
       ios_base::openmode __mode = ios_base::in | ios_base::out);

      virtual pos_type
      seekpos(pos_type __pos,
       ios_base::openmode __mode = ios_base::in | ios_base::out);


      pos_type
      _M_seek(off_type __off, ios_base::seekdir __way, __state_type __state);

      int
      _M_get_ext_pos(__state_type &__state);

      virtual int
      sync();

      virtual void
      imbue(const locale& __loc);

      virtual streamsize
      xsgetn(char_type* __s, streamsize __n);

      virtual streamsize
      xsputn(const char_type* __s, streamsize __n);


      bool
      _M_terminate_output();
# 421 "/usr/include/c++/5/fstream" 3
      void
      _M_set_buffer(streamsize __off)
      {
 const bool __testin = _M_mode & ios_base::in;
 const bool __testout = (_M_mode & ios_base::out
    || _M_mode & ios_base::app);

 if (__testin && __off > 0)
   this->setg(_M_buf, _M_buf, _M_buf + __off);
 else
   this->setg(_M_buf, _M_buf, _M_buf);

 if (__testout && __off == 0 && _M_buf_size > 1 )
   this->setp(_M_buf, _M_buf + _M_buf_size - 1);
 else
   this->setp(0, 0);
      }
    };
# 454 "/usr/include/c++/5/fstream" 3
  template<typename _CharT, typename _Traits>
    class basic_ifstream : public basic_istream<_CharT, _Traits>
    {
    public:

      typedef _CharT char_type;
      typedef _Traits traits_type;
      typedef typename traits_type::int_type int_type;
      typedef typename traits_type::pos_type pos_type;
      typedef typename traits_type::off_type off_type;


      typedef basic_filebuf<char_type, traits_type> __filebuf_type;
      typedef basic_istream<char_type, traits_type> __istream_type;

    private:
      __filebuf_type _M_filebuf;

    public:
# 481 "/usr/include/c++/5/fstream" 3
      basic_ifstream() : __istream_type(), _M_filebuf()
      { this->init(&_M_filebuf); }
# 494 "/usr/include/c++/5/fstream" 3
      explicit
      basic_ifstream(const char* __s, ios_base::openmode __mode = ios_base::in)
      : __istream_type(), _M_filebuf()
      {
 this->init(&_M_filebuf);
 this->open(__s, __mode);
      }
# 533 "/usr/include/c++/5/fstream" 3
      ~basic_ifstream()
      { }
# 565 "/usr/include/c++/5/fstream" 3
      __filebuf_type*
      rdbuf() const
      { return const_cast<__filebuf_type*>(&_M_filebuf); }





      bool
      is_open()
      { return _M_filebuf.is_open(); }



      bool
      is_open() const
      { return _M_filebuf.is_open(); }
# 594 "/usr/include/c++/5/fstream" 3
      void
      open(const char* __s, ios_base::openmode __mode = ios_base::in)
      {
 if (!_M_filebuf.open(__s, __mode | ios_base::in))
   this->setstate(ios_base::failbit);
 else


   this->clear();
      }
# 632 "/usr/include/c++/5/fstream" 3
      void
      close()
      {
 if (!_M_filebuf.close())
   this->setstate(ios_base::failbit);
      }
    };
# 655 "/usr/include/c++/5/fstream" 3
  template<typename _CharT, typename _Traits>
    class basic_ofstream : public basic_ostream<_CharT,_Traits>
    {
    public:

      typedef _CharT char_type;
      typedef _Traits traits_type;
      typedef typename traits_type::int_type int_type;
      typedef typename traits_type::pos_type pos_type;
      typedef typename traits_type::off_type off_type;


      typedef basic_filebuf<char_type, traits_type> __filebuf_type;
      typedef basic_ostream<char_type, traits_type> __ostream_type;

    private:
      __filebuf_type _M_filebuf;

    public:
# 682 "/usr/include/c++/5/fstream" 3
      basic_ofstream(): __ostream_type(), _M_filebuf()
      { this->init(&_M_filebuf); }
# 696 "/usr/include/c++/5/fstream" 3
      explicit
      basic_ofstream(const char* __s,
       ios_base::openmode __mode = ios_base::out|ios_base::trunc)
      : __ostream_type(), _M_filebuf()
      {
 this->init(&_M_filebuf);
 this->open(__s, __mode);
      }
# 737 "/usr/include/c++/5/fstream" 3
      ~basic_ofstream()
      { }
# 769 "/usr/include/c++/5/fstream" 3
      __filebuf_type*
      rdbuf() const
      { return const_cast<__filebuf_type*>(&_M_filebuf); }





      bool
      is_open()
      { return _M_filebuf.is_open(); }



      bool
      is_open() const
      { return _M_filebuf.is_open(); }
# 798 "/usr/include/c++/5/fstream" 3
      void
      open(const char* __s,
    ios_base::openmode __mode = ios_base::out | ios_base::trunc)
      {
 if (!_M_filebuf.open(__s, __mode | ios_base::out))
   this->setstate(ios_base::failbit);
 else


   this->clear();
      }
# 838 "/usr/include/c++/5/fstream" 3
      void
      close()
      {
 if (!_M_filebuf.close())
   this->setstate(ios_base::failbit);
      }
    };
# 861 "/usr/include/c++/5/fstream" 3
  template<typename _CharT, typename _Traits>
    class basic_fstream : public basic_iostream<_CharT, _Traits>
    {
    public:

      typedef _CharT char_type;
      typedef _Traits traits_type;
      typedef typename traits_type::int_type int_type;
      typedef typename traits_type::pos_type pos_type;
      typedef typename traits_type::off_type off_type;


      typedef basic_filebuf<char_type, traits_type> __filebuf_type;
      typedef basic_ios<char_type, traits_type> __ios_type;
      typedef basic_iostream<char_type, traits_type> __iostream_type;

    private:
      __filebuf_type _M_filebuf;

    public:
# 889 "/usr/include/c++/5/fstream" 3
      basic_fstream()
      : __iostream_type(), _M_filebuf()
      { this->init(&_M_filebuf); }
# 901 "/usr/include/c++/5/fstream" 3
      explicit
      basic_fstream(const char* __s,
      ios_base::openmode __mode = ios_base::in | ios_base::out)
      : __iostream_type(0), _M_filebuf()
      {
 this->init(&_M_filebuf);
 this->open(__s, __mode);
      }
# 939 "/usr/include/c++/5/fstream" 3
      ~basic_fstream()
      { }
# 971 "/usr/include/c++/5/fstream" 3
      __filebuf_type*
      rdbuf() const
      { return const_cast<__filebuf_type*>(&_M_filebuf); }





      bool
      is_open()
      { return _M_filebuf.is_open(); }



      bool
      is_open() const
      { return _M_filebuf.is_open(); }
# 1000 "/usr/include/c++/5/fstream" 3
      void
      open(const char* __s,
    ios_base::openmode __mode = ios_base::in | ios_base::out)
      {
 if (!_M_filebuf.open(__s, __mode))
   this->setstate(ios_base::failbit);
 else


   this->clear();
      }
# 1040 "/usr/include/c++/5/fstream" 3
      void
      close()
      {
 if (!_M_filebuf.close())
   this->setstate(ios_base::failbit);
      }
    };
# 1078 "/usr/include/c++/5/fstream" 3

}

# 1 "/usr/include/c++/5/bits/fstream.tcc" 1 3
# 37 "/usr/include/c++/5/bits/fstream.tcc" 3
       
# 38 "/usr/include/c++/5/bits/fstream.tcc" 3




namespace std __attribute__ ((__visibility__ ("default")))
{


  template<typename _CharT, typename _Traits>
    void
    basic_filebuf<_CharT, _Traits>::
    _M_allocate_internal_buffer()
    {


      if (!_M_buf_allocated && !_M_buf)
 {
   _M_buf = new char_type[_M_buf_size];
   _M_buf_allocated = true;
 }
    }

  template<typename _CharT, typename _Traits>
    void
    basic_filebuf<_CharT, _Traits>::
    _M_destroy_internal_buffer() throw()
    {
      if (_M_buf_allocated)
 {
   delete [] _M_buf;
   _M_buf = 0;
   _M_buf_allocated = false;
 }
      delete [] _M_ext_buf;
      _M_ext_buf = 0;
      _M_ext_buf_size = 0;
      _M_ext_next = 0;
      _M_ext_end = 0;
    }

  template<typename _CharT, typename _Traits>
    basic_filebuf<_CharT, _Traits>::
    basic_filebuf() : __streambuf_type(), _M_lock(), _M_file(&_M_lock),
    _M_mode(ios_base::openmode(0)), _M_state_beg(), _M_state_cur(),
    _M_state_last(), _M_buf(0), _M_buf_size(8192),
    _M_buf_allocated(false), _M_reading(false), _M_writing(false), _M_pback(),
    _M_pback_cur_save(0), _M_pback_end_save(0), _M_pback_init(false),
    _M_codecvt(0), _M_ext_buf(0), _M_ext_buf_size(0), _M_ext_next(0),
    _M_ext_end(0)
    {
      if (has_facet<__codecvt_type>(this->_M_buf_locale))
 _M_codecvt = &use_facet<__codecvt_type>(this->_M_buf_locale);
    }
# 176 "/usr/include/c++/5/bits/fstream.tcc" 3
  template<typename _CharT, typename _Traits>
    typename basic_filebuf<_CharT, _Traits>::__filebuf_type*
    basic_filebuf<_CharT, _Traits>::
    open(const char* __s, ios_base::openmode __mode)
    {
      __filebuf_type *__ret = 0;
      if (!this->is_open())
 {
   _M_file.open(__s, __mode);
   if (this->is_open())
     {
       _M_allocate_internal_buffer();
       _M_mode = __mode;


       _M_reading = false;
       _M_writing = false;
       _M_set_buffer(-1);


       _M_state_last = _M_state_cur = _M_state_beg;


       if ((__mode & ios_base::ate)
    && this->seekoff(0, ios_base::end, __mode)
    == pos_type(off_type(-1)))
  this->close();
       else
  __ret = this;
     }
 }
      return __ret;
    }

  template<typename _CharT, typename _Traits>
    typename basic_filebuf<_CharT, _Traits>::__filebuf_type*
    basic_filebuf<_CharT, _Traits>::
    close()
    {
      if (!this->is_open())
 return 0;

      bool __testfail = false;
      {

 struct __close_sentry
 {
   basic_filebuf *__fb;
   __close_sentry (basic_filebuf *__fbi): __fb(__fbi) { }
   ~__close_sentry ()
   {
     __fb->_M_mode = ios_base::openmode(0);
     __fb->_M_pback_init = false;
     __fb->_M_destroy_internal_buffer();
     __fb->_M_reading = false;
     __fb->_M_writing = false;
     __fb->_M_set_buffer(-1);
     __fb->_M_state_last = __fb->_M_state_cur = __fb->_M_state_beg;
   }
 } __cs (this);

 try
   {
     if (!_M_terminate_output())
       __testfail = true;
   }
 catch(__cxxabiv1::__forced_unwind&)
   {
     _M_file.close();
     throw;
   }
 catch(...)
   { __testfail = true; }
      }

      if (!_M_file.close())
 __testfail = true;

      if (__testfail)
 return 0;
      else
 return this;
    }

  template<typename _CharT, typename _Traits>
    streamsize
    basic_filebuf<_CharT, _Traits>::
    showmanyc()
    {
      streamsize __ret = -1;
      const bool __testin = _M_mode & ios_base::in;
      if (__testin && this->is_open())
 {


   __ret = this->egptr() - this->gptr();







   if (__check_facet(_M_codecvt).encoding() >= 0)

     __ret += _M_file.showmanyc() / _M_codecvt->max_length();
 }
      return __ret;
    }

  template<typename _CharT, typename _Traits>
    typename basic_filebuf<_CharT, _Traits>::int_type
    basic_filebuf<_CharT, _Traits>::
    underflow()
    {
      int_type __ret = traits_type::eof();
      const bool __testin = _M_mode & ios_base::in;
      if (__testin)
 {
   if (_M_writing)
     {
       if (overflow() == traits_type::eof())
  return __ret;
       _M_set_buffer(-1);
       _M_writing = false;
     }



   _M_destroy_pback();

   if (this->gptr() < this->egptr())
     return traits_type::to_int_type(*this->gptr());


   const size_t __buflen = _M_buf_size > 1 ? _M_buf_size - 1 : 1;


   bool __got_eof = false;

   streamsize __ilen = 0;
   codecvt_base::result __r = codecvt_base::ok;
   if (__check_facet(_M_codecvt).always_noconv())
     {
       __ilen = _M_file.xsgetn(reinterpret_cast<char*>(this->eback()),
          __buflen);
       if (__ilen == 0)
  __got_eof = true;
     }
   else
     {


       const int __enc = _M_codecvt->encoding();
       streamsize __blen;
       streamsize __rlen;
       if (__enc > 0)
  __blen = __rlen = __buflen * __enc;
       else
  {
    __blen = __buflen + _M_codecvt->max_length() - 1;
    __rlen = __buflen;
  }
       const streamsize __remainder = _M_ext_end - _M_ext_next;
       __rlen = __rlen > __remainder ? __rlen - __remainder : 0;



       if (_M_reading && this->egptr() == this->eback() && __remainder)
  __rlen = 0;



       if (_M_ext_buf_size < __blen)
  {
    char* __buf = new char[__blen];
    if (__remainder)
      __builtin_memcpy(__buf, _M_ext_next, __remainder);

    delete [] _M_ext_buf;
    _M_ext_buf = __buf;
    _M_ext_buf_size = __blen;
  }
       else if (__remainder)
  __builtin_memmove(_M_ext_buf, _M_ext_next, __remainder);

       _M_ext_next = _M_ext_buf;
       _M_ext_end = _M_ext_buf + __remainder;
       _M_state_last = _M_state_cur;

       do
  {
    if (__rlen > 0)
      {



        if (_M_ext_end - _M_ext_buf + __rlen > _M_ext_buf_size)
   {
     __throw_ios_failure(("basic_filebuf::underflow " "codecvt::max_length() " "is not valid")

                          );
   }
        streamsize __elen = _M_file.xsgetn(_M_ext_end, __rlen);
        if (__elen == 0)
   __got_eof = true;
        else if (__elen == -1)
   break;
        _M_ext_end += __elen;
      }

    char_type* __iend = this->eback();
    if (_M_ext_next < _M_ext_end)
      __r = _M_codecvt->in(_M_state_cur, _M_ext_next,
      _M_ext_end, _M_ext_next,
      this->eback(),
      this->eback() + __buflen, __iend);
    if (__r == codecvt_base::noconv)
      {
        size_t __avail = _M_ext_end - _M_ext_buf;
        __ilen = std::min(__avail, __buflen);
        traits_type::copy(this->eback(),
     reinterpret_cast<char_type*>
     (_M_ext_buf), __ilen);
        _M_ext_next = _M_ext_buf + __ilen;
      }
    else
      __ilen = __iend - this->eback();




    if (__r == codecvt_base::error)
      break;

    __rlen = 1;
  }
       while (__ilen == 0 && !__got_eof);
     }

   if (__ilen > 0)
     {
       _M_set_buffer(__ilen);
       _M_reading = true;
       __ret = traits_type::to_int_type(*this->gptr());
     }
   else if (__got_eof)
     {



       _M_set_buffer(-1);
       _M_reading = false;


       if (__r == codecvt_base::partial)
  __throw_ios_failure(("basic_filebuf::underflow " "incomplete character in file")
                                       );
     }
   else if (__r == codecvt_base::error)
     __throw_ios_failure(("basic_filebuf::underflow " "invalid byte sequence in file")
                                    );
   else
     __throw_ios_failure(("basic_filebuf::underflow " "error reading the file")
                             );
 }
      return __ret;
    }

  template<typename _CharT, typename _Traits>
    typename basic_filebuf<_CharT, _Traits>::int_type
    basic_filebuf<_CharT, _Traits>::
    pbackfail(int_type __i)
    {
      int_type __ret = traits_type::eof();
      const bool __testin = _M_mode & ios_base::in;
      if (__testin)
 {
   if (_M_writing)
     {
       if (overflow() == traits_type::eof())
  return __ret;
       _M_set_buffer(-1);
       _M_writing = false;
     }


   const bool __testpb = _M_pback_init;
   const bool __testeof = traits_type::eq_int_type(__i, __ret);
   int_type __tmp;
   if (this->eback() < this->gptr())
     {
       this->gbump(-1);
       __tmp = traits_type::to_int_type(*this->gptr());
     }
   else if (this->seekoff(-1, ios_base::cur) != pos_type(off_type(-1)))
     {
       __tmp = this->underflow();
       if (traits_type::eq_int_type(__tmp, __ret))
  return __ret;
     }
   else
     {





       return __ret;
     }



   if (!__testeof && traits_type::eq_int_type(__i, __tmp))
     __ret = __i;
   else if (__testeof)
     __ret = traits_type::not_eof(__i);
   else if (!__testpb)
     {
       _M_create_pback();
       _M_reading = true;
       *this->gptr() = traits_type::to_char_type(__i);
       __ret = __i;
     }
 }
      return __ret;
    }

  template<typename _CharT, typename _Traits>
    typename basic_filebuf<_CharT, _Traits>::int_type
    basic_filebuf<_CharT, _Traits>::
    overflow(int_type __c)
    {
      int_type __ret = traits_type::eof();
      const bool __testeof = traits_type::eq_int_type(__c, __ret);
      const bool __testout = (_M_mode & ios_base::out
         || _M_mode & ios_base::app);
      if (__testout)
 {
          if (_M_reading)
            {
              _M_destroy_pback();
              const int __gptr_off = _M_get_ext_pos(_M_state_last);
              if (_M_seek(__gptr_off, ios_base::cur, _M_state_last)
                  == pos_type(off_type(-1)))
                return __ret;
            }
   if (this->pbase() < this->pptr())
     {

       if (!__testeof)
  {
    *this->pptr() = traits_type::to_char_type(__c);
    this->pbump(1);
  }



       if (_M_convert_to_external(this->pbase(),
      this->pptr() - this->pbase()))
  {
    _M_set_buffer(0);
    __ret = traits_type::not_eof(__c);
  }
     }
   else if (_M_buf_size > 1)
     {



       _M_set_buffer(0);
       _M_writing = true;
       if (!__testeof)
  {
    *this->pptr() = traits_type::to_char_type(__c);
    this->pbump(1);
  }
       __ret = traits_type::not_eof(__c);
     }
   else
     {

       char_type __conv = traits_type::to_char_type(__c);
       if (__testeof || _M_convert_to_external(&__conv, 1))
  {
    _M_writing = true;
    __ret = traits_type::not_eof(__c);
  }
     }
 }
      return __ret;
    }

  template<typename _CharT, typename _Traits>
    bool
    basic_filebuf<_CharT, _Traits>::
    _M_convert_to_external(_CharT* __ibuf, streamsize __ilen)
    {

      streamsize __elen;
      streamsize __plen;
      if (__check_facet(_M_codecvt).always_noconv())
 {
   __elen = _M_file.xsputn(reinterpret_cast<char*>(__ibuf), __ilen);
   __plen = __ilen;
 }
      else
 {


   streamsize __blen = __ilen * _M_codecvt->max_length();
   char* __buf = static_cast<char*>(__builtin_alloca(__blen));

   char* __bend;
   const char_type* __iend;
   codecvt_base::result __r;
   __r = _M_codecvt->out(_M_state_cur, __ibuf, __ibuf + __ilen,
    __iend, __buf, __buf + __blen, __bend);

   if (__r == codecvt_base::ok || __r == codecvt_base::partial)
     __blen = __bend - __buf;
   else if (__r == codecvt_base::noconv)
     {

       __buf = reinterpret_cast<char*>(__ibuf);
       __blen = __ilen;
     }
   else
     __throw_ios_failure(("basic_filebuf::_M_convert_to_external " "conversion error")
                           );

   __elen = _M_file.xsputn(__buf, __blen);
   __plen = __blen;


   if (__r == codecvt_base::partial && __elen == __plen)
     {
       const char_type* __iresume = __iend;
       streamsize __rlen = this->pptr() - __iend;
       __r = _M_codecvt->out(_M_state_cur, __iresume,
        __iresume + __rlen, __iend, __buf,
        __buf + __blen, __bend);
       if (__r != codecvt_base::error)
  {
    __rlen = __bend - __buf;
    __elen = _M_file.xsputn(__buf, __rlen);
    __plen = __rlen;
  }
       else
  __throw_ios_failure(("basic_filebuf::_M_convert_to_external " "conversion error")
                        );
     }
 }
      return __elen == __plen;
    }

  template<typename _CharT, typename _Traits>
    streamsize
    basic_filebuf<_CharT, _Traits>::
    xsgetn(_CharT* __s, streamsize __n)
    {

      streamsize __ret = 0;
      if (_M_pback_init)
 {
   if (__n > 0 && this->gptr() == this->eback())
     {
       *__s++ = *this->gptr();
       this->gbump(1);
       __ret = 1;
       --__n;
     }
   _M_destroy_pback();
 }
      else if (_M_writing)
 {
    if (overflow() == traits_type::eof())
      return __ret;
    _M_set_buffer(-1);
    _M_writing = false;
  }




      const bool __testin = _M_mode & ios_base::in;
      const streamsize __buflen = _M_buf_size > 1 ? _M_buf_size - 1 : 1;

      if (__n > __buflen && __check_facet(_M_codecvt).always_noconv()
     && __testin)
   {

     const streamsize __avail = this->egptr() - this->gptr();
     if (__avail != 0)
       {
        traits_type::copy(__s, this->gptr(), __avail);
         __s += __avail;
        this->setg(this->eback(), this->gptr() + __avail,
     this->egptr());
        __ret += __avail;
        __n -= __avail;
       }



     streamsize __len;
     for (;;)
       {
         __len = _M_file.xsgetn(reinterpret_cast<char*>(__s),
           __n);
         if (__len == -1)
    __throw_ios_failure(("basic_filebuf::xsgetn " "error reading the file")
                                );
         if (__len == 0)
    break;

         __n -= __len;
         __ret += __len;
         if (__n == 0)
    break;

         __s += __len;
       }

     if (__n == 0)
       {
         _M_set_buffer(0);
         _M_reading = true;
       }
     else if (__len == 0)
       {



         _M_set_buffer(-1);
         _M_reading = false;
       }
   }
      else
   __ret += __streambuf_type::xsgetn(__s, __n);

      return __ret;
    }

  template<typename _CharT, typename _Traits>
    streamsize
    basic_filebuf<_CharT, _Traits>::
    xsputn(const _CharT* __s, streamsize __n)
    {
      streamsize __ret = 0;



      const bool __testout = (_M_mode & ios_base::out
         || _M_mode & ios_base::app);
      if (__check_facet(_M_codecvt).always_noconv()
     && __testout && !_M_reading)
 {

   const streamsize __chunk = 1ul << 10;
   streamsize __bufavail = this->epptr() - this->pptr();


   if (!_M_writing && _M_buf_size > 1)
     __bufavail = _M_buf_size - 1;

   const streamsize __limit = std::min(__chunk, __bufavail);
   if (__n >= __limit)
     {
       const streamsize __buffill = this->pptr() - this->pbase();
       const char* __buf = reinterpret_cast<const char*>(this->pbase());
       __ret = _M_file.xsputn_2(__buf, __buffill,
           reinterpret_cast<const char*>(__s),
           __n);
       if (__ret == __buffill + __n)
  {
    _M_set_buffer(0);
    _M_writing = true;
  }
       if (__ret > __buffill)
  __ret -= __buffill;
       else
  __ret = 0;
     }
   else
     __ret = __streambuf_type::xsputn(__s, __n);
 }
       else
  __ret = __streambuf_type::xsputn(__s, __n);
       return __ret;
    }

  template<typename _CharT, typename _Traits>
    typename basic_filebuf<_CharT, _Traits>::__streambuf_type*
    basic_filebuf<_CharT, _Traits>::
    setbuf(char_type* __s, streamsize __n)
    {
      if (!this->is_open())
 {
   if (__s == 0 && __n == 0)
     _M_buf_size = 1;
   else if (__s && __n > 0)
     {
# 787 "/usr/include/c++/5/bits/fstream.tcc" 3
       _M_buf = __s;
       _M_buf_size = __n;
     }
 }
      return this;
    }




  template<typename _CharT, typename _Traits>
    typename basic_filebuf<_CharT, _Traits>::pos_type
    basic_filebuf<_CharT, _Traits>::
    seekoff(off_type __off, ios_base::seekdir __way, ios_base::openmode)
    {
      int __width = 0;
      if (_M_codecvt)
 __width = _M_codecvt->encoding();
      if (__width < 0)
 __width = 0;

      pos_type __ret = pos_type(off_type(-1));
      const bool __testfail = __off != 0 && __width <= 0;
      if (this->is_open() && !__testfail)
 {




   bool __no_movement = __way == ios_base::cur && __off == 0
     && (!_M_writing || _M_codecvt->always_noconv());


   if (!__no_movement)
     _M_destroy_pback();






   __state_type __state = _M_state_beg;
   off_type __computed_off = __off * __width;
   if (_M_reading && __way == ios_base::cur)
     {
       __state = _M_state_last;
       __computed_off += _M_get_ext_pos(__state);
     }
   if (!__no_movement)
     __ret = _M_seek(__computed_off, __way, __state);
   else
     {
       if (_M_writing)
  __computed_off = this->pptr() - this->pbase();

        off_type __file_off = _M_file.seekoff(0, ios_base::cur);
        if (__file_off != off_type(-1))
  {
    __ret = __file_off + __computed_off;
    __ret.state(__state);
  }
     }
 }
      return __ret;
    }





  template<typename _CharT, typename _Traits>
    typename basic_filebuf<_CharT, _Traits>::pos_type
    basic_filebuf<_CharT, _Traits>::
    seekpos(pos_type __pos, ios_base::openmode)
    {
      pos_type __ret = pos_type(off_type(-1));
      if (this->is_open())
 {

   _M_destroy_pback();
   __ret = _M_seek(off_type(__pos), ios_base::beg, __pos.state());
 }
      return __ret;
    }

  template<typename _CharT, typename _Traits>
    typename basic_filebuf<_CharT, _Traits>::pos_type
    basic_filebuf<_CharT, _Traits>::
    _M_seek(off_type __off, ios_base::seekdir __way, __state_type __state)
    {
      pos_type __ret = pos_type(off_type(-1));
      if (_M_terminate_output())
 {
   off_type __file_off = _M_file.seekoff(__off, __way);
   if (__file_off != off_type(-1))
     {
       _M_reading = false;
       _M_writing = false;
       _M_ext_next = _M_ext_end = _M_ext_buf;
       _M_set_buffer(-1);
       _M_state_cur = __state;
       __ret = __file_off;
       __ret.state(_M_state_cur);
     }
 }
      return __ret;
    }




  template<typename _CharT, typename _Traits>
    int basic_filebuf<_CharT, _Traits>::
    _M_get_ext_pos(__state_type& __state)
    {
      if (_M_codecvt->always_noconv())
        return this->gptr() - this->egptr();
      else
        {



          const int __gptr_off =
            _M_codecvt->length(__state, _M_ext_buf, _M_ext_next,
                               this->gptr() - this->eback());
          return _M_ext_buf + __gptr_off - _M_ext_end;
        }
    }

  template<typename _CharT, typename _Traits>
    bool
    basic_filebuf<_CharT, _Traits>::
    _M_terminate_output()
    {

      bool __testvalid = true;
      if (this->pbase() < this->pptr())
 {
   const int_type __tmp = this->overflow();
   if (traits_type::eq_int_type(__tmp, traits_type::eof()))
     __testvalid = false;
 }


      if (_M_writing && !__check_facet(_M_codecvt).always_noconv()
   && __testvalid)
 {



   const size_t __blen = 128;
   char __buf[__blen];
   codecvt_base::result __r;
   streamsize __ilen = 0;

   do
     {
       char* __next;
       __r = _M_codecvt->unshift(_M_state_cur, __buf,
     __buf + __blen, __next);
       if (__r == codecvt_base::error)
  __testvalid = false;
       else if (__r == codecvt_base::ok ||
         __r == codecvt_base::partial)
  {
    __ilen = __next - __buf;
    if (__ilen > 0)
      {
        const streamsize __elen = _M_file.xsputn(__buf, __ilen);
        if (__elen != __ilen)
   __testvalid = false;
      }
  }
     }
   while (__r == codecvt_base::partial && __ilen > 0 && __testvalid);

   if (__testvalid)
     {




       const int_type __tmp = this->overflow();
       if (traits_type::eq_int_type(__tmp, traits_type::eof()))
  __testvalid = false;
     }
 }
      return __testvalid;
    }

  template<typename _CharT, typename _Traits>
    int
    basic_filebuf<_CharT, _Traits>::
    sync()
    {


      int __ret = 0;
      if (this->pbase() < this->pptr())
 {
   const int_type __tmp = this->overflow();
   if (traits_type::eq_int_type(__tmp, traits_type::eof()))
     __ret = -1;
 }
      return __ret;
    }

  template<typename _CharT, typename _Traits>
    void
    basic_filebuf<_CharT, _Traits>::
    imbue(const locale& __loc)
    {
      bool __testvalid = true;

      const __codecvt_type* _M_codecvt_tmp = 0;
      if (__builtin_expect(has_facet<__codecvt_type>(__loc), true))
 _M_codecvt_tmp = &use_facet<__codecvt_type>(__loc);

      if (this->is_open())
 {

   if ((_M_reading || _M_writing)
       && __check_facet(_M_codecvt).encoding() == -1)
     __testvalid = false;
   else
     {
       if (_M_reading)
  {
    if (__check_facet(_M_codecvt).always_noconv())
      {
        if (_M_codecvt_tmp
     && !__check_facet(_M_codecvt_tmp).always_noconv())
   __testvalid = this->seekoff(0, ios_base::cur, _M_mode)
                 != pos_type(off_type(-1));
      }
    else
      {

        _M_ext_next = _M_ext_buf
   + _M_codecvt->length(_M_state_last, _M_ext_buf,
          _M_ext_next,
          this->gptr() - this->eback());
        const streamsize __remainder = _M_ext_end - _M_ext_next;
        if (__remainder)
   __builtin_memmove(_M_ext_buf, _M_ext_next, __remainder);

        _M_ext_next = _M_ext_buf;
        _M_ext_end = _M_ext_buf + __remainder;
        _M_set_buffer(-1);
        _M_state_last = _M_state_cur = _M_state_beg;
      }
  }
       else if (_M_writing && (__testvalid = _M_terminate_output()))
  _M_set_buffer(-1);
     }
 }

      if (__testvalid)
 _M_codecvt = _M_codecvt_tmp;
      else
 _M_codecvt = 0;
    }




  extern template class basic_filebuf<char>;
  extern template class basic_ifstream<char>;
  extern template class basic_ofstream<char>;
  extern template class basic_fstream<char>;


  extern template class basic_filebuf<wchar_t>;
  extern template class basic_ifstream<wchar_t>;
  extern template class basic_ofstream<wchar_t>;
  extern template class basic_fstream<wchar_t>;




}
# 1082 "/usr/include/c++/5/fstream" 2 3
# 6 "localMinima.cpp" 2
# 1 "/usr/include/c++/5/iomanip" 1 3
# 36 "/usr/include/c++/5/iomanip" 3
       
# 37 "/usr/include/c++/5/iomanip" 3
# 49 "/usr/include/c++/5/iomanip" 3
namespace std __attribute__ ((__visibility__ ("default")))
{





  struct _Resetiosflags { ios_base::fmtflags _M_mask; };
# 65 "/usr/include/c++/5/iomanip" 3
  inline _Resetiosflags
  resetiosflags(ios_base::fmtflags __mask)
  { return { __mask }; }

  template<typename _CharT, typename _Traits>
    inline basic_istream<_CharT, _Traits>&
    operator>>(basic_istream<_CharT, _Traits>& __is, _Resetiosflags __f)
    {
      __is.setf(ios_base::fmtflags(0), __f._M_mask);
      return __is;
    }

  template<typename _CharT, typename _Traits>
    inline basic_ostream<_CharT, _Traits>&
    operator<<(basic_ostream<_CharT, _Traits>& __os, _Resetiosflags __f)
    {
      __os.setf(ios_base::fmtflags(0), __f._M_mask);
      return __os;
    }


  struct _Setiosflags { ios_base::fmtflags _M_mask; };
# 95 "/usr/include/c++/5/iomanip" 3
  inline _Setiosflags
  setiosflags(ios_base::fmtflags __mask)
  { return { __mask }; }

  template<typename _CharT, typename _Traits>
    inline basic_istream<_CharT, _Traits>&
    operator>>(basic_istream<_CharT, _Traits>& __is, _Setiosflags __f)
    {
      __is.setf(__f._M_mask);
      return __is;
    }

  template<typename _CharT, typename _Traits>
    inline basic_ostream<_CharT, _Traits>&
    operator<<(basic_ostream<_CharT, _Traits>& __os, _Setiosflags __f)
    {
      __os.setf(__f._M_mask);
      return __os;
    }


  struct _Setbase { int _M_base; };
# 126 "/usr/include/c++/5/iomanip" 3
  inline _Setbase
  setbase(int __base)
  { return { __base }; }

  template<typename _CharT, typename _Traits>
    inline basic_istream<_CharT, _Traits>&
    operator>>(basic_istream<_CharT, _Traits>& __is, _Setbase __f)
    {
      __is.setf(__f._M_base == 8 ? ios_base::oct :
  __f._M_base == 10 ? ios_base::dec :
  __f._M_base == 16 ? ios_base::hex :
  ios_base::fmtflags(0), ios_base::basefield);
      return __is;
    }

  template<typename _CharT, typename _Traits>
    inline basic_ostream<_CharT, _Traits>&
    operator<<(basic_ostream<_CharT, _Traits>& __os, _Setbase __f)
    {
      __os.setf(__f._M_base == 8 ? ios_base::oct :
  __f._M_base == 10 ? ios_base::dec :
  __f._M_base == 16 ? ios_base::hex :
  ios_base::fmtflags(0), ios_base::basefield);
      return __os;
    }


  template<typename _CharT>
    struct _Setfill { _CharT _M_c; };
# 163 "/usr/include/c++/5/iomanip" 3
  template<typename _CharT>
    inline _Setfill<_CharT>
    setfill(_CharT __c)
    { return { __c }; }

  template<typename _CharT, typename _Traits>
    inline basic_istream<_CharT, _Traits>&
    operator>>(basic_istream<_CharT, _Traits>& __is, _Setfill<_CharT> __f)
    {
      __is.fill(__f._M_c);
      return __is;
    }

  template<typename _CharT, typename _Traits>
    inline basic_ostream<_CharT, _Traits>&
    operator<<(basic_ostream<_CharT, _Traits>& __os, _Setfill<_CharT> __f)
    {
      __os.fill(__f._M_c);
      return __os;
    }


  struct _Setprecision { int _M_n; };
# 194 "/usr/include/c++/5/iomanip" 3
  inline _Setprecision
  setprecision(int __n)
  { return { __n }; }

  template<typename _CharT, typename _Traits>
    inline basic_istream<_CharT, _Traits>&
    operator>>(basic_istream<_CharT, _Traits>& __is, _Setprecision __f)
    {
      __is.precision(__f._M_n);
      return __is;
    }

  template<typename _CharT, typename _Traits>
    inline basic_ostream<_CharT, _Traits>&
    operator<<(basic_ostream<_CharT, _Traits>& __os, _Setprecision __f)
    {
      __os.precision(__f._M_n);
      return __os;
    }


  struct _Setw { int _M_n; };
# 224 "/usr/include/c++/5/iomanip" 3
  inline _Setw
  setw(int __n)
  { return { __n }; }

  template<typename _CharT, typename _Traits>
    inline basic_istream<_CharT, _Traits>&
    operator>>(basic_istream<_CharT, _Traits>& __is, _Setw __f)
    {
      __is.width(__f._M_n);
      return __is;
    }

  template<typename _CharT, typename _Traits>
    inline basic_ostream<_CharT, _Traits>&
    operator<<(basic_ostream<_CharT, _Traits>& __os, _Setw __f)
    {
      __os.width(__f._M_n);
      return __os;
    }
# 496 "/usr/include/c++/5/iomanip" 3
  extern template ostream& operator<<(ostream&, _Setfill<char>);
  extern template ostream& operator<<(ostream&, _Setiosflags);
  extern template ostream& operator<<(ostream&, _Resetiosflags);
  extern template ostream& operator<<(ostream&, _Setbase);
  extern template ostream& operator<<(ostream&, _Setprecision);
  extern template ostream& operator<<(ostream&, _Setw);
  extern template istream& operator>>(istream&, _Setfill<char>);
  extern template istream& operator>>(istream&, _Setiosflags);
  extern template istream& operator>>(istream&, _Resetiosflags);
  extern template istream& operator>>(istream&, _Setbase);
  extern template istream& operator>>(istream&, _Setprecision);
  extern template istream& operator>>(istream&, _Setw);


  extern template wostream& operator<<(wostream&, _Setfill<wchar_t>);
  extern template wostream& operator<<(wostream&, _Setiosflags);
  extern template wostream& operator<<(wostream&, _Resetiosflags);
  extern template wostream& operator<<(wostream&, _Setbase);
  extern template wostream& operator<<(wostream&, _Setprecision);
  extern template wostream& operator<<(wostream&, _Setw);
  extern template wistream& operator>>(wistream&, _Setfill<wchar_t>);
  extern template wistream& operator>>(wistream&, _Setiosflags);
  extern template wistream& operator>>(wistream&, _Resetiosflags);
  extern template wistream& operator>>(wistream&, _Setbase);
  extern template wistream& operator>>(wistream&, _Setprecision);
  extern template wistream& operator>>(wistream&, _Setw);




}
# 7 "localMinima.cpp" 2


# 1 "/usr/include/x86_64-linux-gnu/sys/sysinfo.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/sys/sysinfo.h" 3 4
# 1 "/usr/include/linux/kernel.h" 1 3 4



# 1 "/usr/include/linux/sysinfo.h" 1 3 4



# 1 "/usr/include/linux/types.h" 1 3 4



# 1 "/usr/include/x86_64-linux-gnu/asm/types.h" 1 3 4



# 1 "/usr/include/asm-generic/types.h" 1 3 4





# 1 "/usr/include/asm-generic/int-ll64.h" 1 3 4
# 11 "/usr/include/asm-generic/int-ll64.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/asm/bitsperlong.h" 1 3 4
# 10 "/usr/include/x86_64-linux-gnu/asm/bitsperlong.h" 3 4
# 1 "/usr/include/asm-generic/bitsperlong.h" 1 3 4
# 11 "/usr/include/x86_64-linux-gnu/asm/bitsperlong.h" 2 3 4
# 12 "/usr/include/asm-generic/int-ll64.h" 2 3 4







typedef __signed__ char __s8;
typedef unsigned char __u8;

typedef __signed__ short __s16;
typedef unsigned short __u16;

typedef __signed__ int __s32;
typedef unsigned int __u32;


__extension__ typedef __signed__ long long __s64;
__extension__ typedef unsigned long long __u64;
# 7 "/usr/include/asm-generic/types.h" 2 3 4
# 5 "/usr/include/x86_64-linux-gnu/asm/types.h" 2 3 4
# 5 "/usr/include/linux/types.h" 2 3 4



# 1 "/usr/include/linux/posix_types.h" 1 3 4



# 1 "/usr/include/linux/stddef.h" 1 3 4
# 5 "/usr/include/linux/posix_types.h" 2 3 4
# 24 "/usr/include/linux/posix_types.h" 3 4
typedef struct {
 unsigned long fds_bits[1024 / (8 * sizeof(long))];
} __kernel_fd_set;


typedef void (*__kernel_sighandler_t)(int);


typedef int __kernel_key_t;
typedef int __kernel_mqd_t;

# 1 "/usr/include/x86_64-linux-gnu/asm/posix_types.h" 1 3 4





# 1 "/usr/include/x86_64-linux-gnu/asm/posix_types_64.h" 1 3 4
# 10 "/usr/include/x86_64-linux-gnu/asm/posix_types_64.h" 3 4
typedef unsigned short __kernel_old_uid_t;
typedef unsigned short __kernel_old_gid_t;


typedef unsigned long __kernel_old_dev_t;


# 1 "/usr/include/asm-generic/posix_types.h" 1 3 4
# 14 "/usr/include/asm-generic/posix_types.h" 3 4
typedef long __kernel_long_t;
typedef unsigned long __kernel_ulong_t;



typedef __kernel_ulong_t __kernel_ino_t;



typedef unsigned int __kernel_mode_t;



typedef int __kernel_pid_t;



typedef int __kernel_ipc_pid_t;



typedef unsigned int __kernel_uid_t;
typedef unsigned int __kernel_gid_t;



typedef __kernel_long_t __kernel_suseconds_t;



typedef int __kernel_daddr_t;



typedef unsigned int __kernel_uid32_t;
typedef unsigned int __kernel_gid32_t;
# 71 "/usr/include/asm-generic/posix_types.h" 3 4
typedef __kernel_ulong_t __kernel_size_t;
typedef __kernel_long_t __kernel_ssize_t;
typedef __kernel_long_t __kernel_ptrdiff_t;




typedef struct {
 int val[2];
} __kernel_fsid_t;





typedef __kernel_long_t __kernel_off_t;
typedef long long __kernel_loff_t;
typedef __kernel_long_t __kernel_time_t;
typedef __kernel_long_t __kernel_clock_t;
typedef int __kernel_timer_t;
typedef int __kernel_clockid_t;
typedef char * __kernel_caddr_t;
typedef unsigned short __kernel_uid16_t;
typedef unsigned short __kernel_gid16_t;
# 18 "/usr/include/x86_64-linux-gnu/asm/posix_types_64.h" 2 3 4
# 7 "/usr/include/x86_64-linux-gnu/asm/posix_types.h" 2 3 4
# 36 "/usr/include/linux/posix_types.h" 2 3 4
# 9 "/usr/include/linux/types.h" 2 3 4
# 27 "/usr/include/linux/types.h" 3 4
typedef __u16 __le16;
typedef __u16 __be16;
typedef __u32 __le32;
typedef __u32 __be32;
typedef __u64 __le64;
typedef __u64 __be64;

typedef __u16 __sum16;
typedef __u32 __wsum;
# 5 "/usr/include/linux/sysinfo.h" 2 3 4


struct sysinfo {
 __kernel_long_t uptime;
 __kernel_ulong_t loads[3];
 __kernel_ulong_t totalram;
 __kernel_ulong_t freeram;
 __kernel_ulong_t sharedram;
 __kernel_ulong_t bufferram;
 __kernel_ulong_t totalswap;
 __kernel_ulong_t freeswap;
 __u16 procs;
 __u16 pad;
 __kernel_ulong_t totalhigh;
 __kernel_ulong_t freehigh;
 __u32 mem_unit;
 char _f[20-2*sizeof(__kernel_ulong_t)-sizeof(__u32)];
};
# 5 "/usr/include/linux/kernel.h" 2 3 4
# 25 "/usr/include/x86_64-linux-gnu/sys/sysinfo.h" 2 3 4

extern "C" {


extern int sysinfo (struct sysinfo *__info) throw ();



extern int get_nprocs_conf (void) throw ();


extern int get_nprocs (void) throw ();



extern long int get_phys_pages (void) throw ();


extern long int get_avphys_pages (void) throw ();

}
# 10 "localMinima.cpp" 2




# 1 "function.h" 1





# 1 "precision.h" 1
       

# 1 "/usr/include/c++/5/complex" 1 3
# 39 "/usr/include/c++/5/complex" 3
       
# 40 "/usr/include/c++/5/complex" 3




# 1 "/usr/include/c++/5/cmath" 1 3
# 39 "/usr/include/c++/5/cmath" 3
       
# 40 "/usr/include/c++/5/cmath" 3




# 1 "/usr/include/math.h" 1 3 4
# 28 "/usr/include/math.h" 3 4
extern "C" {


# 1 "/usr/include/x86_64-linux-gnu/bits/math-vector.h" 1 3 4
# 25 "/usr/include/x86_64-linux-gnu/bits/math-vector.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/libm-simd-decl-stubs.h" 1 3 4
# 26 "/usr/include/x86_64-linux-gnu/bits/math-vector.h" 2 3 4
# 32 "/usr/include/math.h" 2 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/huge_val.h" 1 3 4
# 36 "/usr/include/math.h" 2 3 4

# 1 "/usr/include/x86_64-linux-gnu/bits/huge_valf.h" 1 3 4
# 38 "/usr/include/math.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/huge_vall.h" 1 3 4
# 39 "/usr/include/math.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/inf.h" 1 3 4
# 42 "/usr/include/math.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/nan.h" 1 3 4
# 45 "/usr/include/math.h" 2 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/mathdef.h" 1 3 4
# 28 "/usr/include/x86_64-linux-gnu/bits/mathdef.h" 3 4
typedef float float_t;
typedef double double_t;
# 49 "/usr/include/math.h" 2 3 4
# 83 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 1 3 4
# 52 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4


extern double acos (double __x) throw (); extern double __acos (double __x) throw ();

extern double asin (double __x) throw (); extern double __asin (double __x) throw ();

extern double atan (double __x) throw (); extern double __atan (double __x) throw ();

extern double atan2 (double __y, double __x) throw (); extern double __atan2 (double __y, double __x) throw ();


 extern double cos (double __x) throw (); extern double __cos (double __x) throw ();

 extern double sin (double __x) throw (); extern double __sin (double __x) throw ();

extern double tan (double __x) throw (); extern double __tan (double __x) throw ();




extern double cosh (double __x) throw (); extern double __cosh (double __x) throw ();

extern double sinh (double __x) throw (); extern double __sinh (double __x) throw ();

extern double tanh (double __x) throw (); extern double __tanh (double __x) throw ();




 extern void sincos (double __x, double *__sinx, double *__cosx) throw (); extern void __sincos (double __x, double *__sinx, double *__cosx) throw ()
                                                        ;





extern double acosh (double __x) throw (); extern double __acosh (double __x) throw ();

extern double asinh (double __x) throw (); extern double __asinh (double __x) throw ();

extern double atanh (double __x) throw (); extern double __atanh (double __x) throw ();







 extern double exp (double __x) throw (); extern double __exp (double __x) throw ();


extern double frexp (double __x, int *__exponent) throw (); extern double __frexp (double __x, int *__exponent) throw ();


extern double ldexp (double __x, int __exponent) throw (); extern double __ldexp (double __x, int __exponent) throw ();


 extern double log (double __x) throw (); extern double __log (double __x) throw ();


extern double log10 (double __x) throw (); extern double __log10 (double __x) throw ();


extern double modf (double __x, double *__iptr) throw (); extern double __modf (double __x, double *__iptr) throw () __attribute__ ((__nonnull__ (2)));




extern double exp10 (double __x) throw (); extern double __exp10 (double __x) throw ();

extern double pow10 (double __x) throw (); extern double __pow10 (double __x) throw ();





extern double expm1 (double __x) throw (); extern double __expm1 (double __x) throw ();


extern double log1p (double __x) throw (); extern double __log1p (double __x) throw ();


extern double logb (double __x) throw (); extern double __logb (double __x) throw ();






extern double exp2 (double __x) throw (); extern double __exp2 (double __x) throw ();


extern double log2 (double __x) throw (); extern double __log2 (double __x) throw ();








 extern double pow (double __x, double __y) throw (); extern double __pow (double __x, double __y) throw ();


extern double sqrt (double __x) throw (); extern double __sqrt (double __x) throw ();





extern double hypot (double __x, double __y) throw (); extern double __hypot (double __x, double __y) throw ();






extern double cbrt (double __x) throw (); extern double __cbrt (double __x) throw ();








extern double ceil (double __x) throw () __attribute__ ((__const__)); extern double __ceil (double __x) throw () __attribute__ ((__const__));


extern double fabs (double __x) throw () __attribute__ ((__const__)); extern double __fabs (double __x) throw () __attribute__ ((__const__));


extern double floor (double __x) throw () __attribute__ ((__const__)); extern double __floor (double __x) throw () __attribute__ ((__const__));


extern double fmod (double __x, double __y) throw (); extern double __fmod (double __x, double __y) throw ();




extern int __isinf (double __value) throw () __attribute__ ((__const__));


extern int __finite (double __value) throw () __attribute__ ((__const__));








extern int isinf (double __value) throw () __attribute__ ((__const__));



extern int finite (double __value) throw () __attribute__ ((__const__));


extern double drem (double __x, double __y) throw (); extern double __drem (double __x, double __y) throw ();



extern double significand (double __x) throw (); extern double __significand (double __x) throw ();





extern double copysign (double __x, double __y) throw () __attribute__ ((__const__)); extern double __copysign (double __x, double __y) throw () __attribute__ ((__const__));






extern double nan (const char *__tagb) throw () __attribute__ ((__const__)); extern double __nan (const char *__tagb) throw () __attribute__ ((__const__));





extern int __isnan (double __value) throw () __attribute__ ((__const__));






extern int isnan (double __value) throw () __attribute__ ((__const__));





extern double j0 (double) throw (); extern double __j0 (double) throw ();
extern double j1 (double) throw (); extern double __j1 (double) throw ();
extern double jn (int, double) throw (); extern double __jn (int, double) throw ();
extern double y0 (double) throw (); extern double __y0 (double) throw ();
extern double y1 (double) throw (); extern double __y1 (double) throw ();
extern double yn (int, double) throw (); extern double __yn (int, double) throw ();






extern double erf (double) throw (); extern double __erf (double) throw ();
extern double erfc (double) throw (); extern double __erfc (double) throw ();
extern double lgamma (double) throw (); extern double __lgamma (double) throw ();






extern double tgamma (double) throw (); extern double __tgamma (double) throw ();





extern double gamma (double) throw (); extern double __gamma (double) throw ();






extern double lgamma_r (double, int *__signgamp) throw (); extern double __lgamma_r (double, int *__signgamp) throw ();







extern double rint (double __x) throw (); extern double __rint (double __x) throw ();


extern double nextafter (double __x, double __y) throw () __attribute__ ((__const__)); extern double __nextafter (double __x, double __y) throw () __attribute__ ((__const__));

extern double nexttoward (double __x, long double __y) throw () __attribute__ ((__const__)); extern double __nexttoward (double __x, long double __y) throw () __attribute__ ((__const__));



extern double remainder (double __x, double __y) throw (); extern double __remainder (double __x, double __y) throw ();



extern double scalbn (double __x, int __n) throw (); extern double __scalbn (double __x, int __n) throw ();



extern int ilogb (double __x) throw (); extern int __ilogb (double __x) throw ();




extern double scalbln (double __x, long int __n) throw (); extern double __scalbln (double __x, long int __n) throw ();



extern double nearbyint (double __x) throw (); extern double __nearbyint (double __x) throw ();



extern double round (double __x) throw () __attribute__ ((__const__)); extern double __round (double __x) throw () __attribute__ ((__const__));



extern double trunc (double __x) throw () __attribute__ ((__const__)); extern double __trunc (double __x) throw () __attribute__ ((__const__));




extern double remquo (double __x, double __y, int *__quo) throw (); extern double __remquo (double __x, double __y, int *__quo) throw ();






extern long int lrint (double __x) throw (); extern long int __lrint (double __x) throw ();
__extension__
extern long long int llrint (double __x) throw (); extern long long int __llrint (double __x) throw ();



extern long int lround (double __x) throw (); extern long int __lround (double __x) throw ();
__extension__
extern long long int llround (double __x) throw (); extern long long int __llround (double __x) throw ();



extern double fdim (double __x, double __y) throw (); extern double __fdim (double __x, double __y) throw ();


extern double fmax (double __x, double __y) throw () __attribute__ ((__const__)); extern double __fmax (double __x, double __y) throw () __attribute__ ((__const__));


extern double fmin (double __x, double __y) throw () __attribute__ ((__const__)); extern double __fmin (double __x, double __y) throw () __attribute__ ((__const__));



extern int __fpclassify (double __value) throw ()
     __attribute__ ((__const__));


extern int __signbit (double __value) throw ()
     __attribute__ ((__const__));



extern double fma (double __x, double __y, double __z) throw (); extern double __fma (double __x, double __y, double __z) throw ();








extern int __issignaling (double __value) throw ()
     __attribute__ ((__const__));






extern double scalb (double __x, double __n) throw (); extern double __scalb (double __x, double __n) throw ();
# 84 "/usr/include/math.h" 2 3 4
# 104 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 1 3 4
# 52 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4


extern float acosf (float __x) throw (); extern float __acosf (float __x) throw ();

extern float asinf (float __x) throw (); extern float __asinf (float __x) throw ();

extern float atanf (float __x) throw (); extern float __atanf (float __x) throw ();

extern float atan2f (float __y, float __x) throw (); extern float __atan2f (float __y, float __x) throw ();


 extern float cosf (float __x) throw (); extern float __cosf (float __x) throw ();

 extern float sinf (float __x) throw (); extern float __sinf (float __x) throw ();

extern float tanf (float __x) throw (); extern float __tanf (float __x) throw ();




extern float coshf (float __x) throw (); extern float __coshf (float __x) throw ();

extern float sinhf (float __x) throw (); extern float __sinhf (float __x) throw ();

extern float tanhf (float __x) throw (); extern float __tanhf (float __x) throw ();




 extern void sincosf (float __x, float *__sinx, float *__cosx) throw (); extern void __sincosf (float __x, float *__sinx, float *__cosx) throw ()
                                                        ;





extern float acoshf (float __x) throw (); extern float __acoshf (float __x) throw ();

extern float asinhf (float __x) throw (); extern float __asinhf (float __x) throw ();

extern float atanhf (float __x) throw (); extern float __atanhf (float __x) throw ();







 extern float expf (float __x) throw (); extern float __expf (float __x) throw ();


extern float frexpf (float __x, int *__exponent) throw (); extern float __frexpf (float __x, int *__exponent) throw ();


extern float ldexpf (float __x, int __exponent) throw (); extern float __ldexpf (float __x, int __exponent) throw ();


 extern float logf (float __x) throw (); extern float __logf (float __x) throw ();


extern float log10f (float __x) throw (); extern float __log10f (float __x) throw ();


extern float modff (float __x, float *__iptr) throw (); extern float __modff (float __x, float *__iptr) throw () __attribute__ ((__nonnull__ (2)));




extern float exp10f (float __x) throw (); extern float __exp10f (float __x) throw ();

extern float pow10f (float __x) throw (); extern float __pow10f (float __x) throw ();





extern float expm1f (float __x) throw (); extern float __expm1f (float __x) throw ();


extern float log1pf (float __x) throw (); extern float __log1pf (float __x) throw ();


extern float logbf (float __x) throw (); extern float __logbf (float __x) throw ();






extern float exp2f (float __x) throw (); extern float __exp2f (float __x) throw ();


extern float log2f (float __x) throw (); extern float __log2f (float __x) throw ();








 extern float powf (float __x, float __y) throw (); extern float __powf (float __x, float __y) throw ();


extern float sqrtf (float __x) throw (); extern float __sqrtf (float __x) throw ();





extern float hypotf (float __x, float __y) throw (); extern float __hypotf (float __x, float __y) throw ();






extern float cbrtf (float __x) throw (); extern float __cbrtf (float __x) throw ();








extern float ceilf (float __x) throw () __attribute__ ((__const__)); extern float __ceilf (float __x) throw () __attribute__ ((__const__));


extern float fabsf (float __x) throw () __attribute__ ((__const__)); extern float __fabsf (float __x) throw () __attribute__ ((__const__));


extern float floorf (float __x) throw () __attribute__ ((__const__)); extern float __floorf (float __x) throw () __attribute__ ((__const__));


extern float fmodf (float __x, float __y) throw (); extern float __fmodf (float __x, float __y) throw ();




extern int __isinff (float __value) throw () __attribute__ ((__const__));


extern int __finitef (float __value) throw () __attribute__ ((__const__));








extern int isinff (float __value) throw () __attribute__ ((__const__));



extern int finitef (float __value) throw () __attribute__ ((__const__));


extern float dremf (float __x, float __y) throw (); extern float __dremf (float __x, float __y) throw ();



extern float significandf (float __x) throw (); extern float __significandf (float __x) throw ();





extern float copysignf (float __x, float __y) throw () __attribute__ ((__const__)); extern float __copysignf (float __x, float __y) throw () __attribute__ ((__const__));






extern float nanf (const char *__tagb) throw () __attribute__ ((__const__)); extern float __nanf (const char *__tagb) throw () __attribute__ ((__const__));





extern int __isnanf (float __value) throw () __attribute__ ((__const__));






extern int isnanf (float __value) throw () __attribute__ ((__const__));





extern float j0f (float) throw (); extern float __j0f (float) throw ();
extern float j1f (float) throw (); extern float __j1f (float) throw ();
extern float jnf (int, float) throw (); extern float __jnf (int, float) throw ();
extern float y0f (float) throw (); extern float __y0f (float) throw ();
extern float y1f (float) throw (); extern float __y1f (float) throw ();
extern float ynf (int, float) throw (); extern float __ynf (int, float) throw ();






extern float erff (float) throw (); extern float __erff (float) throw ();
extern float erfcf (float) throw (); extern float __erfcf (float) throw ();
extern float lgammaf (float) throw (); extern float __lgammaf (float) throw ();






extern float tgammaf (float) throw (); extern float __tgammaf (float) throw ();





extern float gammaf (float) throw (); extern float __gammaf (float) throw ();






extern float lgammaf_r (float, int *__signgamp) throw (); extern float __lgammaf_r (float, int *__signgamp) throw ();







extern float rintf (float __x) throw (); extern float __rintf (float __x) throw ();


extern float nextafterf (float __x, float __y) throw () __attribute__ ((__const__)); extern float __nextafterf (float __x, float __y) throw () __attribute__ ((__const__));

extern float nexttowardf (float __x, long double __y) throw () __attribute__ ((__const__)); extern float __nexttowardf (float __x, long double __y) throw () __attribute__ ((__const__));



extern float remainderf (float __x, float __y) throw (); extern float __remainderf (float __x, float __y) throw ();



extern float scalbnf (float __x, int __n) throw (); extern float __scalbnf (float __x, int __n) throw ();



extern int ilogbf (float __x) throw (); extern int __ilogbf (float __x) throw ();




extern float scalblnf (float __x, long int __n) throw (); extern float __scalblnf (float __x, long int __n) throw ();



extern float nearbyintf (float __x) throw (); extern float __nearbyintf (float __x) throw ();



extern float roundf (float __x) throw () __attribute__ ((__const__)); extern float __roundf (float __x) throw () __attribute__ ((__const__));



extern float truncf (float __x) throw () __attribute__ ((__const__)); extern float __truncf (float __x) throw () __attribute__ ((__const__));




extern float remquof (float __x, float __y, int *__quo) throw (); extern float __remquof (float __x, float __y, int *__quo) throw ();






extern long int lrintf (float __x) throw (); extern long int __lrintf (float __x) throw ();
__extension__
extern long long int llrintf (float __x) throw (); extern long long int __llrintf (float __x) throw ();



extern long int lroundf (float __x) throw (); extern long int __lroundf (float __x) throw ();
__extension__
extern long long int llroundf (float __x) throw (); extern long long int __llroundf (float __x) throw ();



extern float fdimf (float __x, float __y) throw (); extern float __fdimf (float __x, float __y) throw ();


extern float fmaxf (float __x, float __y) throw () __attribute__ ((__const__)); extern float __fmaxf (float __x, float __y) throw () __attribute__ ((__const__));


extern float fminf (float __x, float __y) throw () __attribute__ ((__const__)); extern float __fminf (float __x, float __y) throw () __attribute__ ((__const__));



extern int __fpclassifyf (float __value) throw ()
     __attribute__ ((__const__));


extern int __signbitf (float __value) throw ()
     __attribute__ ((__const__));



extern float fmaf (float __x, float __y, float __z) throw (); extern float __fmaf (float __x, float __y, float __z) throw ();








extern int __issignalingf (float __value) throw ()
     __attribute__ ((__const__));






extern float scalbf (float __x, float __n) throw (); extern float __scalbf (float __x, float __n) throw ();
# 105 "/usr/include/math.h" 2 3 4
# 151 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 1 3 4
# 52 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4


extern long double acosl (long double __x) throw (); extern long double __acosl (long double __x) throw ();

extern long double asinl (long double __x) throw (); extern long double __asinl (long double __x) throw ();

extern long double atanl (long double __x) throw (); extern long double __atanl (long double __x) throw ();

extern long double atan2l (long double __y, long double __x) throw (); extern long double __atan2l (long double __y, long double __x) throw ();


 extern long double cosl (long double __x) throw (); extern long double __cosl (long double __x) throw ();

 extern long double sinl (long double __x) throw (); extern long double __sinl (long double __x) throw ();

extern long double tanl (long double __x) throw (); extern long double __tanl (long double __x) throw ();




extern long double coshl (long double __x) throw (); extern long double __coshl (long double __x) throw ();

extern long double sinhl (long double __x) throw (); extern long double __sinhl (long double __x) throw ();

extern long double tanhl (long double __x) throw (); extern long double __tanhl (long double __x) throw ();




 extern void sincosl (long double __x, long double *__sinx, long double *__cosx) throw (); extern void __sincosl (long double __x, long double *__sinx, long double *__cosx) throw ()
                                                        ;





extern long double acoshl (long double __x) throw (); extern long double __acoshl (long double __x) throw ();

extern long double asinhl (long double __x) throw (); extern long double __asinhl (long double __x) throw ();

extern long double atanhl (long double __x) throw (); extern long double __atanhl (long double __x) throw ();







 extern long double expl (long double __x) throw (); extern long double __expl (long double __x) throw ();


extern long double frexpl (long double __x, int *__exponent) throw (); extern long double __frexpl (long double __x, int *__exponent) throw ();


extern long double ldexpl (long double __x, int __exponent) throw (); extern long double __ldexpl (long double __x, int __exponent) throw ();


 extern long double logl (long double __x) throw (); extern long double __logl (long double __x) throw ();


extern long double log10l (long double __x) throw (); extern long double __log10l (long double __x) throw ();


extern long double modfl (long double __x, long double *__iptr) throw (); extern long double __modfl (long double __x, long double *__iptr) throw () __attribute__ ((__nonnull__ (2)));




extern long double exp10l (long double __x) throw (); extern long double __exp10l (long double __x) throw ();

extern long double pow10l (long double __x) throw (); extern long double __pow10l (long double __x) throw ();





extern long double expm1l (long double __x) throw (); extern long double __expm1l (long double __x) throw ();


extern long double log1pl (long double __x) throw (); extern long double __log1pl (long double __x) throw ();


extern long double logbl (long double __x) throw (); extern long double __logbl (long double __x) throw ();






extern long double exp2l (long double __x) throw (); extern long double __exp2l (long double __x) throw ();


extern long double log2l (long double __x) throw (); extern long double __log2l (long double __x) throw ();








 extern long double powl (long double __x, long double __y) throw (); extern long double __powl (long double __x, long double __y) throw ();


extern long double sqrtl (long double __x) throw (); extern long double __sqrtl (long double __x) throw ();





extern long double hypotl (long double __x, long double __y) throw (); extern long double __hypotl (long double __x, long double __y) throw ();






extern long double cbrtl (long double __x) throw (); extern long double __cbrtl (long double __x) throw ();








extern long double ceill (long double __x) throw () __attribute__ ((__const__)); extern long double __ceill (long double __x) throw () __attribute__ ((__const__));


extern long double fabsl (long double __x) throw () __attribute__ ((__const__)); extern long double __fabsl (long double __x) throw () __attribute__ ((__const__));


extern long double floorl (long double __x) throw () __attribute__ ((__const__)); extern long double __floorl (long double __x) throw () __attribute__ ((__const__));


extern long double fmodl (long double __x, long double __y) throw (); extern long double __fmodl (long double __x, long double __y) throw ();




extern int __isinfl (long double __value) throw () __attribute__ ((__const__));


extern int __finitel (long double __value) throw () __attribute__ ((__const__));








extern int isinfl (long double __value) throw () __attribute__ ((__const__));



extern int finitel (long double __value) throw () __attribute__ ((__const__));


extern long double dreml (long double __x, long double __y) throw (); extern long double __dreml (long double __x, long double __y) throw ();



extern long double significandl (long double __x) throw (); extern long double __significandl (long double __x) throw ();





extern long double copysignl (long double __x, long double __y) throw () __attribute__ ((__const__)); extern long double __copysignl (long double __x, long double __y) throw () __attribute__ ((__const__));






extern long double nanl (const char *__tagb) throw () __attribute__ ((__const__)); extern long double __nanl (const char *__tagb) throw () __attribute__ ((__const__));





extern int __isnanl (long double __value) throw () __attribute__ ((__const__));






extern int isnanl (long double __value) throw () __attribute__ ((__const__));





extern long double j0l (long double) throw (); extern long double __j0l (long double) throw ();
extern long double j1l (long double) throw (); extern long double __j1l (long double) throw ();
extern long double jnl (int, long double) throw (); extern long double __jnl (int, long double) throw ();
extern long double y0l (long double) throw (); extern long double __y0l (long double) throw ();
extern long double y1l (long double) throw (); extern long double __y1l (long double) throw ();
extern long double ynl (int, long double) throw (); extern long double __ynl (int, long double) throw ();






extern long double erfl (long double) throw (); extern long double __erfl (long double) throw ();
extern long double erfcl (long double) throw (); extern long double __erfcl (long double) throw ();
extern long double lgammal (long double) throw (); extern long double __lgammal (long double) throw ();






extern long double tgammal (long double) throw (); extern long double __tgammal (long double) throw ();





extern long double gammal (long double) throw (); extern long double __gammal (long double) throw ();






extern long double lgammal_r (long double, int *__signgamp) throw (); extern long double __lgammal_r (long double, int *__signgamp) throw ();







extern long double rintl (long double __x) throw (); extern long double __rintl (long double __x) throw ();


extern long double nextafterl (long double __x, long double __y) throw () __attribute__ ((__const__)); extern long double __nextafterl (long double __x, long double __y) throw () __attribute__ ((__const__));

extern long double nexttowardl (long double __x, long double __y) throw () __attribute__ ((__const__)); extern long double __nexttowardl (long double __x, long double __y) throw () __attribute__ ((__const__));



extern long double remainderl (long double __x, long double __y) throw (); extern long double __remainderl (long double __x, long double __y) throw ();



extern long double scalbnl (long double __x, int __n) throw (); extern long double __scalbnl (long double __x, int __n) throw ();



extern int ilogbl (long double __x) throw (); extern int __ilogbl (long double __x) throw ();




extern long double scalblnl (long double __x, long int __n) throw (); extern long double __scalblnl (long double __x, long int __n) throw ();



extern long double nearbyintl (long double __x) throw (); extern long double __nearbyintl (long double __x) throw ();



extern long double roundl (long double __x) throw () __attribute__ ((__const__)); extern long double __roundl (long double __x) throw () __attribute__ ((__const__));



extern long double truncl (long double __x) throw () __attribute__ ((__const__)); extern long double __truncl (long double __x) throw () __attribute__ ((__const__));




extern long double remquol (long double __x, long double __y, int *__quo) throw (); extern long double __remquol (long double __x, long double __y, int *__quo) throw ();






extern long int lrintl (long double __x) throw (); extern long int __lrintl (long double __x) throw ();
__extension__
extern long long int llrintl (long double __x) throw (); extern long long int __llrintl (long double __x) throw ();



extern long int lroundl (long double __x) throw (); extern long int __lroundl (long double __x) throw ();
__extension__
extern long long int llroundl (long double __x) throw (); extern long long int __llroundl (long double __x) throw ();



extern long double fdiml (long double __x, long double __y) throw (); extern long double __fdiml (long double __x, long double __y) throw ();


extern long double fmaxl (long double __x, long double __y) throw () __attribute__ ((__const__)); extern long double __fmaxl (long double __x, long double __y) throw () __attribute__ ((__const__));


extern long double fminl (long double __x, long double __y) throw () __attribute__ ((__const__)); extern long double __fminl (long double __x, long double __y) throw () __attribute__ ((__const__));



extern int __fpclassifyl (long double __value) throw ()
     __attribute__ ((__const__));


extern int __signbitl (long double __value) throw ()
     __attribute__ ((__const__));



extern long double fmal (long double __x, long double __y, long double __z) throw (); extern long double __fmal (long double __x, long double __y, long double __z) throw ();








extern int __issignalingl (long double __value) throw ()
     __attribute__ ((__const__));






extern long double scalbl (long double __x, long double __n) throw (); extern long double __scalbl (long double __x, long double __n) throw ();
# 152 "/usr/include/math.h" 2 3 4
# 168 "/usr/include/math.h" 3 4
extern int signgam;
# 209 "/usr/include/math.h" 3 4
enum
  {
    FP_NAN =

      0,
    FP_INFINITE =

      1,
    FP_ZERO =

      2,
    FP_SUBNORMAL =

      3,
    FP_NORMAL =

      4
  };
# 347 "/usr/include/math.h" 3 4
typedef enum
{
  _IEEE_ = -1,
  _SVID_,
  _XOPEN_,
  _POSIX_,
  _ISOC_
} _LIB_VERSION_TYPE;




extern _LIB_VERSION_TYPE _LIB_VERSION;
# 370 "/usr/include/math.h" 3 4
struct __exception



  {
    int type;
    char *name;
    double arg1;
    double arg2;
    double retval;
  };


extern int matherr (struct __exception *__exc) throw ();
# 534 "/usr/include/math.h" 3 4
}
# 45 "/usr/include/c++/5/cmath" 2 3
# 75 "/usr/include/c++/5/cmath" 3
namespace std __attribute__ ((__visibility__ ("default")))
{



  inline double
  abs(double __x)
  { return __builtin_fabs(__x); }



  inline float
  abs(float __x)
  { return __builtin_fabsf(__x); }

  inline long double
  abs(long double __x)
  { return __builtin_fabsl(__x); }


  template<typename _Tp>
    inline
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    abs(_Tp __x)
    { return __builtin_fabs(__x); }

  using ::acos;


  inline float
  acos(float __x)
  { return __builtin_acosf(__x); }

  inline long double
  acos(long double __x)
  { return __builtin_acosl(__x); }


  template<typename _Tp>
    inline
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    acos(_Tp __x)
    { return __builtin_acos(__x); }

  using ::asin;


  inline float
  asin(float __x)
  { return __builtin_asinf(__x); }

  inline long double
  asin(long double __x)
  { return __builtin_asinl(__x); }


  template<typename _Tp>
    inline
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    asin(_Tp __x)
    { return __builtin_asin(__x); }

  using ::atan;


  inline float
  atan(float __x)
  { return __builtin_atanf(__x); }

  inline long double
  atan(long double __x)
  { return __builtin_atanl(__x); }


  template<typename _Tp>
    inline
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    atan(_Tp __x)
    { return __builtin_atan(__x); }

  using ::atan2;


  inline float
  atan2(float __y, float __x)
  { return __builtin_atan2f(__y, __x); }

  inline long double
  atan2(long double __y, long double __x)
  { return __builtin_atan2l(__y, __x); }


  template<typename _Tp, typename _Up>
    inline
    typename __gnu_cxx::__promote_2<_Tp, _Up>::__type
    atan2(_Tp __y, _Up __x)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return atan2(__type(__y), __type(__x));
    }

  using ::ceil;


  inline float
  ceil(float __x)
  { return __builtin_ceilf(__x); }

  inline long double
  ceil(long double __x)
  { return __builtin_ceill(__x); }


  template<typename _Tp>
    inline
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    ceil(_Tp __x)
    { return __builtin_ceil(__x); }

  using ::cos;


  inline float
  cos(float __x)
  { return __builtin_cosf(__x); }

  inline long double
  cos(long double __x)
  { return __builtin_cosl(__x); }


  template<typename _Tp>
    inline
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    cos(_Tp __x)
    { return __builtin_cos(__x); }

  using ::cosh;


  inline float
  cosh(float __x)
  { return __builtin_coshf(__x); }

  inline long double
  cosh(long double __x)
  { return __builtin_coshl(__x); }


  template<typename _Tp>
    inline
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    cosh(_Tp __x)
    { return __builtin_cosh(__x); }

  using ::exp;


  inline float
  exp(float __x)
  { return __builtin_expf(__x); }

  inline long double
  exp(long double __x)
  { return __builtin_expl(__x); }


  template<typename _Tp>
    inline
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    exp(_Tp __x)
    { return __builtin_exp(__x); }

  using ::fabs;


  inline float
  fabs(float __x)
  { return __builtin_fabsf(__x); }

  inline long double
  fabs(long double __x)
  { return __builtin_fabsl(__x); }


  template<typename _Tp>
    inline
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    fabs(_Tp __x)
    { return __builtin_fabs(__x); }

  using ::floor;


  inline float
  floor(float __x)
  { return __builtin_floorf(__x); }

  inline long double
  floor(long double __x)
  { return __builtin_floorl(__x); }


  template<typename _Tp>
    inline
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    floor(_Tp __x)
    { return __builtin_floor(__x); }

  using ::fmod;


  inline float
  fmod(float __x, float __y)
  { return __builtin_fmodf(__x, __y); }

  inline long double
  fmod(long double __x, long double __y)
  { return __builtin_fmodl(__x, __y); }


  template<typename _Tp, typename _Up>
    inline
    typename __gnu_cxx::__promote_2<_Tp, _Up>::__type
    fmod(_Tp __x, _Up __y)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return fmod(__type(__x), __type(__y));
    }

  using ::frexp;


  inline float
  frexp(float __x, int* __exp)
  { return __builtin_frexpf(__x, __exp); }

  inline long double
  frexp(long double __x, int* __exp)
  { return __builtin_frexpl(__x, __exp); }


  template<typename _Tp>
    inline
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    frexp(_Tp __x, int* __exp)
    { return __builtin_frexp(__x, __exp); }

  using ::ldexp;


  inline float
  ldexp(float __x, int __exp)
  { return __builtin_ldexpf(__x, __exp); }

  inline long double
  ldexp(long double __x, int __exp)
  { return __builtin_ldexpl(__x, __exp); }


  template<typename _Tp>
    inline
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    ldexp(_Tp __x, int __exp)
    { return __builtin_ldexp(__x, __exp); }

  using ::log;


  inline float
  log(float __x)
  { return __builtin_logf(__x); }

  inline long double
  log(long double __x)
  { return __builtin_logl(__x); }


  template<typename _Tp>
    inline
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    log(_Tp __x)
    { return __builtin_log(__x); }

  using ::log10;


  inline float
  log10(float __x)
  { return __builtin_log10f(__x); }

  inline long double
  log10(long double __x)
  { return __builtin_log10l(__x); }


  template<typename _Tp>
    inline
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    log10(_Tp __x)
    { return __builtin_log10(__x); }

  using ::modf;


  inline float
  modf(float __x, float* __iptr)
  { return __builtin_modff(__x, __iptr); }

  inline long double
  modf(long double __x, long double* __iptr)
  { return __builtin_modfl(__x, __iptr); }


  using ::pow;


  inline float
  pow(float __x, float __y)
  { return __builtin_powf(__x, __y); }

  inline long double
  pow(long double __x, long double __y)
  { return __builtin_powl(__x, __y); }




  inline double
  pow(double __x, int __i)
  { return __builtin_powi(__x, __i); }

  inline float
  pow(float __x, int __n)
  { return __builtin_powif(__x, __n); }

  inline long double
  pow(long double __x, int __n)
  { return __builtin_powil(__x, __n); }



  template<typename _Tp, typename _Up>
    inline
    typename __gnu_cxx::__promote_2<_Tp, _Up>::__type
    pow(_Tp __x, _Up __y)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return pow(__type(__x), __type(__y));
    }

  using ::sin;


  inline float
  sin(float __x)
  { return __builtin_sinf(__x); }

  inline long double
  sin(long double __x)
  { return __builtin_sinl(__x); }


  template<typename _Tp>
    inline
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    sin(_Tp __x)
    { return __builtin_sin(__x); }

  using ::sinh;


  inline float
  sinh(float __x)
  { return __builtin_sinhf(__x); }

  inline long double
  sinh(long double __x)
  { return __builtin_sinhl(__x); }


  template<typename _Tp>
    inline
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    sinh(_Tp __x)
    { return __builtin_sinh(__x); }

  using ::sqrt;


  inline float
  sqrt(float __x)
  { return __builtin_sqrtf(__x); }

  inline long double
  sqrt(long double __x)
  { return __builtin_sqrtl(__x); }


  template<typename _Tp>
    inline
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    sqrt(_Tp __x)
    { return __builtin_sqrt(__x); }

  using ::tan;


  inline float
  tan(float __x)
  { return __builtin_tanf(__x); }

  inline long double
  tan(long double __x)
  { return __builtin_tanl(__x); }


  template<typename _Tp>
    inline
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    tan(_Tp __x)
    { return __builtin_tan(__x); }

  using ::tanh;


  inline float
  tanh(float __x)
  { return __builtin_tanhf(__x); }

  inline long double
  tanh(long double __x)
  { return __builtin_tanhl(__x); }


  template<typename _Tp>
    inline
    typename __gnu_cxx::__enable_if<__is_integer<_Tp>::__value,
                                    double>::__type
    tanh(_Tp __x)
    { return __builtin_tanh(__x); }


}
# 555 "/usr/include/c++/5/cmath" 3
namespace std __attribute__ ((__visibility__ ("default")))
{

# 831 "/usr/include/c++/5/cmath" 3
  template<typename _Tp>
    inline typename __gnu_cxx::__enable_if<__is_arithmetic<_Tp>::__value,
        int>::__type
    fpclassify(_Tp __f)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      return __builtin_fpclassify(0, 1, 4,
      3, 2, __type(__f));
    }

  template<typename _Tp>
    inline typename __gnu_cxx::__enable_if<__is_arithmetic<_Tp>::__value,
        int>::__type
    isfinite(_Tp __f)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      return __builtin_isfinite(__type(__f));
    }

  template<typename _Tp>
    inline typename __gnu_cxx::__enable_if<__is_arithmetic<_Tp>::__value,
        int>::__type
    isinf(_Tp __f)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      return __builtin_isinf(__type(__f));
    }

  template<typename _Tp>
    inline typename __gnu_cxx::__enable_if<__is_arithmetic<_Tp>::__value,
        int>::__type
    isnan(_Tp __f)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      return __builtin_isnan(__type(__f));
    }

  template<typename _Tp>
    inline typename __gnu_cxx::__enable_if<__is_arithmetic<_Tp>::__value,
        int>::__type
    isnormal(_Tp __f)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      return __builtin_isnormal(__type(__f));
    }

  template<typename _Tp>
    inline typename __gnu_cxx::__enable_if<__is_arithmetic<_Tp>::__value,
        int>::__type
    signbit(_Tp __f)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      return sizeof(__type) == sizeof(float)
 ? __builtin_signbitf(__type(__f))
 : sizeof(__type) == sizeof(double)
 ? __builtin_signbit(__type(__f))
 : __builtin_signbitl(__type(__f));
    }

  template<typename _Tp>
    inline typename __gnu_cxx::__enable_if<__is_arithmetic<_Tp>::__value,
        int>::__type
    isgreater(_Tp __f1, _Tp __f2)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      return __builtin_isgreater(__type(__f1), __type(__f2));
    }

  template<typename _Tp>
    inline typename __gnu_cxx::__enable_if<__is_arithmetic<_Tp>::__value,
        int>::__type
    isgreaterequal(_Tp __f1, _Tp __f2)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      return __builtin_isgreaterequal(__type(__f1), __type(__f2));
    }

  template<typename _Tp>
    inline typename __gnu_cxx::__enable_if<__is_arithmetic<_Tp>::__value,
        int>::__type
    isless(_Tp __f1, _Tp __f2)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      return __builtin_isless(__type(__f1), __type(__f2));
    }

  template<typename _Tp>
    inline typename __gnu_cxx::__enable_if<__is_arithmetic<_Tp>::__value,
        int>::__type
    islessequal(_Tp __f1, _Tp __f2)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      return __builtin_islessequal(__type(__f1), __type(__f2));
    }

  template<typename _Tp>
    inline typename __gnu_cxx::__enable_if<__is_arithmetic<_Tp>::__value,
        int>::__type
    islessgreater(_Tp __f1, _Tp __f2)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      return __builtin_islessgreater(__type(__f1), __type(__f2));
    }

  template<typename _Tp>
    inline typename __gnu_cxx::__enable_if<__is_arithmetic<_Tp>::__value,
        int>::__type
    isunordered(_Tp __f1, _Tp __f2)
    {
      typedef typename __gnu_cxx::__promote<_Tp>::__type __type;
      return __builtin_isunordered(__type(__f1), __type(__f2));
    }




}
# 45 "/usr/include/c++/5/complex" 2 3
# 1 "/usr/include/c++/5/sstream" 1 3
# 36 "/usr/include/c++/5/sstream" 3
       
# 37 "/usr/include/c++/5/sstream" 3




namespace std __attribute__ ((__visibility__ ("default")))
{

namespace __cxx11 {
# 64 "/usr/include/c++/5/sstream" 3
  template<typename _CharT, typename _Traits, typename _Alloc>
    class basic_stringbuf : public basic_streambuf<_CharT, _Traits>
    {
      struct __xfer_bufptrs;
    public:

      typedef _CharT char_type;
      typedef _Traits traits_type;


      typedef _Alloc allocator_type;
      typedef typename traits_type::int_type int_type;
      typedef typename traits_type::pos_type pos_type;
      typedef typename traits_type::off_type off_type;

      typedef basic_streambuf<char_type, traits_type> __streambuf_type;
      typedef basic_string<char_type, _Traits, _Alloc> __string_type;
      typedef typename __string_type::size_type __size_type;

    protected:

      ios_base::openmode _M_mode;


      __string_type _M_string;

    public:
# 99 "/usr/include/c++/5/sstream" 3
      explicit
      basic_stringbuf(ios_base::openmode __mode = ios_base::in | ios_base::out)
      : __streambuf_type(), _M_mode(__mode), _M_string()
      { }
# 112 "/usr/include/c++/5/sstream" 3
      explicit
      basic_stringbuf(const __string_type& __str,
        ios_base::openmode __mode = ios_base::in | ios_base::out)
      : __streambuf_type(), _M_mode(), _M_string(__str.data(), __str.size())
      { _M_stringbuf_init(__mode); }
# 165 "/usr/include/c++/5/sstream" 3
      __string_type
      str() const
      {
 __string_type __ret;
 if (this->pptr())
   {

     if (this->pptr() > this->egptr())
       __ret = __string_type(this->pbase(), this->pptr());
     else
        __ret = __string_type(this->pbase(), this->egptr());
   }
 else
   __ret = _M_string;
 return __ret;
      }
# 189 "/usr/include/c++/5/sstream" 3
      void
      str(const __string_type& __s)
      {


 _M_string.assign(__s.data(), __s.size());
 _M_stringbuf_init(_M_mode);
      }

    protected:

      void
      _M_stringbuf_init(ios_base::openmode __mode)
      {
 _M_mode = __mode;
 __size_type __len = 0;
 if (_M_mode & (ios_base::ate | ios_base::app))
   __len = _M_string.size();
 _M_sync(const_cast<char_type*>(_M_string.data()), 0, __len);
      }

      virtual streamsize
      showmanyc()
      {
 streamsize __ret = -1;
 if (_M_mode & ios_base::in)
   {
     _M_update_egptr();
     __ret = this->egptr() - this->gptr();
   }
 return __ret;
      }

      virtual int_type
      underflow();

      virtual int_type
      pbackfail(int_type __c = traits_type::eof());

      virtual int_type
      overflow(int_type __c = traits_type::eof());
# 242 "/usr/include/c++/5/sstream" 3
      virtual __streambuf_type*
      setbuf(char_type* __s, streamsize __n)
      {
 if (__s && __n >= 0)
   {






     _M_string.clear();


     _M_sync(__s, __n, 0);
   }
 return this;
      }

      virtual pos_type
      seekoff(off_type __off, ios_base::seekdir __way,
       ios_base::openmode __mode = ios_base::in | ios_base::out);

      virtual pos_type
      seekpos(pos_type __sp,
       ios_base::openmode __mode = ios_base::in | ios_base::out);




      void
      _M_sync(char_type* __base, __size_type __i, __size_type __o);



      void
      _M_update_egptr()
      {
 const bool __testin = _M_mode & ios_base::in;
 if (this->pptr() && this->pptr() > this->egptr())
   {
     if (__testin)
       this->setg(this->eback(), this->gptr(), this->pptr());
     else
       this->setg(this->pptr(), this->pptr(), this->pptr());
   }
      }



      void
      _M_pbump(char_type* __pbeg, char_type* __pend, off_type __off);

    private:
# 348 "/usr/include/c++/5/sstream" 3
    };
# 366 "/usr/include/c++/5/sstream" 3
  template<typename _CharT, typename _Traits, typename _Alloc>
    class basic_istringstream : public basic_istream<_CharT, _Traits>
    {
    public:

      typedef _CharT char_type;
      typedef _Traits traits_type;


      typedef _Alloc allocator_type;
      typedef typename traits_type::int_type int_type;
      typedef typename traits_type::pos_type pos_type;
      typedef typename traits_type::off_type off_type;


      typedef basic_string<_CharT, _Traits, _Alloc> __string_type;
      typedef basic_stringbuf<_CharT, _Traits, _Alloc> __stringbuf_type;
      typedef basic_istream<char_type, traits_type> __istream_type;

    private:
      __stringbuf_type _M_stringbuf;

    public:
# 402 "/usr/include/c++/5/sstream" 3
      explicit
      basic_istringstream(ios_base::openmode __mode = ios_base::in)
      : __istream_type(), _M_stringbuf(__mode | ios_base::in)
      { this->init(&_M_stringbuf); }
# 420 "/usr/include/c++/5/sstream" 3
      explicit
      basic_istringstream(const __string_type& __str,
     ios_base::openmode __mode = ios_base::in)
      : __istream_type(), _M_stringbuf(__str, __mode | ios_base::in)
      { this->init(&_M_stringbuf); }







      ~basic_istringstream()
      { }
# 471 "/usr/include/c++/5/sstream" 3
      __stringbuf_type*
      rdbuf() const
      { return const_cast<__stringbuf_type*>(&_M_stringbuf); }





      __string_type
      str() const
      { return _M_stringbuf.str(); }







      void
      str(const __string_type& __s)
      { _M_stringbuf.str(__s); }
    };
# 510 "/usr/include/c++/5/sstream" 3
  template <typename _CharT, typename _Traits, typename _Alloc>
    class basic_ostringstream : public basic_ostream<_CharT, _Traits>
    {
    public:

      typedef _CharT char_type;
      typedef _Traits traits_type;


      typedef _Alloc allocator_type;
      typedef typename traits_type::int_type int_type;
      typedef typename traits_type::pos_type pos_type;
      typedef typename traits_type::off_type off_type;


      typedef basic_string<_CharT, _Traits, _Alloc> __string_type;
      typedef basic_stringbuf<_CharT, _Traits, _Alloc> __stringbuf_type;
      typedef basic_ostream<char_type, traits_type> __ostream_type;

    private:
      __stringbuf_type _M_stringbuf;

    public:
# 546 "/usr/include/c++/5/sstream" 3
      explicit
      basic_ostringstream(ios_base::openmode __mode = ios_base::out)
      : __ostream_type(), _M_stringbuf(__mode | ios_base::out)
      { this->init(&_M_stringbuf); }
# 564 "/usr/include/c++/5/sstream" 3
      explicit
      basic_ostringstream(const __string_type& __str,
     ios_base::openmode __mode = ios_base::out)
      : __ostream_type(), _M_stringbuf(__str, __mode | ios_base::out)
      { this->init(&_M_stringbuf); }







      ~basic_ostringstream()
      { }
# 615 "/usr/include/c++/5/sstream" 3
      __stringbuf_type*
      rdbuf() const
      { return const_cast<__stringbuf_type*>(&_M_stringbuf); }





      __string_type
      str() const
      { return _M_stringbuf.str(); }







      void
      str(const __string_type& __s)
      { _M_stringbuf.str(__s); }
    };
# 654 "/usr/include/c++/5/sstream" 3
  template <typename _CharT, typename _Traits, typename _Alloc>
    class basic_stringstream : public basic_iostream<_CharT, _Traits>
    {
    public:

      typedef _CharT char_type;
      typedef _Traits traits_type;


      typedef _Alloc allocator_type;
      typedef typename traits_type::int_type int_type;
      typedef typename traits_type::pos_type pos_type;
      typedef typename traits_type::off_type off_type;


      typedef basic_string<_CharT, _Traits, _Alloc> __string_type;
      typedef basic_stringbuf<_CharT, _Traits, _Alloc> __stringbuf_type;
      typedef basic_iostream<char_type, traits_type> __iostream_type;

    private:
      __stringbuf_type _M_stringbuf;

    public:
# 689 "/usr/include/c++/5/sstream" 3
      explicit
      basic_stringstream(ios_base::openmode __m = ios_base::out | ios_base::in)
      : __iostream_type(), _M_stringbuf(__m)
      { this->init(&_M_stringbuf); }
# 705 "/usr/include/c++/5/sstream" 3
      explicit
      basic_stringstream(const __string_type& __str,
    ios_base::openmode __m = ios_base::out | ios_base::in)
      : __iostream_type(), _M_stringbuf(__str, __m)
      { this->init(&_M_stringbuf); }







      ~basic_stringstream()
      { }
# 756 "/usr/include/c++/5/sstream" 3
      __stringbuf_type*
      rdbuf() const
      { return const_cast<__stringbuf_type*>(&_M_stringbuf); }





      __string_type
      str() const
      { return _M_stringbuf.str(); }







      void
      str(const __string_type& __s)
      { _M_stringbuf.str(__s); }
    };
# 809 "/usr/include/c++/5/sstream" 3
}

}

# 1 "/usr/include/c++/5/bits/sstream.tcc" 1 3
# 37 "/usr/include/c++/5/bits/sstream.tcc" 3
       
# 38 "/usr/include/c++/5/bits/sstream.tcc" 3

namespace std __attribute__ ((__visibility__ ("default")))
{


  template <class _CharT, class _Traits, class _Alloc>
    typename basic_stringbuf<_CharT, _Traits, _Alloc>::int_type
    basic_stringbuf<_CharT, _Traits, _Alloc>::
    pbackfail(int_type __c)
    {
      int_type __ret = traits_type::eof();
      if (this->eback() < this->gptr())
 {


   const bool __testeof = traits_type::eq_int_type(__c, __ret);
   if (!__testeof)
     {
       const bool __testeq = traits_type::eq(traits_type::
          to_char_type(__c),
          this->gptr()[-1]);
       const bool __testout = this->_M_mode & ios_base::out;
       if (__testeq || __testout)
  {
    this->gbump(-1);
    if (!__testeq)
      *this->gptr() = traits_type::to_char_type(__c);
    __ret = __c;
  }
     }
   else
     {
       this->gbump(-1);
       __ret = traits_type::not_eof(__c);
     }
 }
      return __ret;
    }

  template <class _CharT, class _Traits, class _Alloc>
    typename basic_stringbuf<_CharT, _Traits, _Alloc>::int_type
    basic_stringbuf<_CharT, _Traits, _Alloc>::
    overflow(int_type __c)
    {
      const bool __testout = this->_M_mode & ios_base::out;
      if (__builtin_expect(!__testout, false))
 return traits_type::eof();

      const bool __testeof = traits_type::eq_int_type(__c, traits_type::eof());
      if (__builtin_expect(__testeof, false))
 return traits_type::not_eof(__c);

      const __size_type __capacity = _M_string.capacity();
      const __size_type __max_size = _M_string.max_size();
      const bool __testput = this->pptr() < this->epptr();
      if (__builtin_expect(!__testput && __capacity == __max_size, false))
 return traits_type::eof();



      const char_type __conv = traits_type::to_char_type(__c);
      if (!__testput)
 {
# 110 "/usr/include/c++/5/bits/sstream.tcc" 3
   const __size_type __opt_len = std::max(__size_type(2 * __capacity),
       __size_type(512));
   const __size_type __len = std::min(__opt_len, __max_size);
   __string_type __tmp;
   __tmp.reserve(__len);
   if (this->pbase())
     __tmp.assign(this->pbase(), this->epptr() - this->pbase());
   __tmp.push_back(__conv);
   _M_string.swap(__tmp);
   _M_sync(const_cast<char_type*>(_M_string.data()),
    this->gptr() - this->eback(), this->pptr() - this->pbase());
 }
      else
 *this->pptr() = __conv;
      this->pbump(1);
      return __c;
    }

  template <class _CharT, class _Traits, class _Alloc>
    typename basic_stringbuf<_CharT, _Traits, _Alloc>::int_type
    basic_stringbuf<_CharT, _Traits, _Alloc>::
    underflow()
    {
      int_type __ret = traits_type::eof();
      const bool __testin = this->_M_mode & ios_base::in;
      if (__testin)
 {

   _M_update_egptr();

   if (this->gptr() < this->egptr())
     __ret = traits_type::to_int_type(*this->gptr());
 }
      return __ret;
    }

  template <class _CharT, class _Traits, class _Alloc>
    typename basic_stringbuf<_CharT, _Traits, _Alloc>::pos_type
    basic_stringbuf<_CharT, _Traits, _Alloc>::
    seekoff(off_type __off, ios_base::seekdir __way, ios_base::openmode __mode)
    {
      pos_type __ret = pos_type(off_type(-1));
      bool __testin = (ios_base::in & this->_M_mode & __mode) != 0;
      bool __testout = (ios_base::out & this->_M_mode & __mode) != 0;
      const bool __testboth = __testin && __testout && __way != ios_base::cur;
      __testin &= !(__mode & ios_base::out);
      __testout &= !(__mode & ios_base::in);



      const char_type* __beg = __testin ? this->eback() : this->pbase();
      if ((__beg || !__off) && (__testin || __testout || __testboth))
 {
   _M_update_egptr();

   off_type __newoffi = __off;
   off_type __newoffo = __newoffi;
   if (__way == ios_base::cur)
     {
       __newoffi += this->gptr() - __beg;
       __newoffo += this->pptr() - __beg;
     }
   else if (__way == ios_base::end)
     __newoffo = __newoffi += this->egptr() - __beg;

   if ((__testin || __testboth)
       && __newoffi >= 0
       && this->egptr() - __beg >= __newoffi)
     {
       this->setg(this->eback(), this->eback() + __newoffi,
    this->egptr());
       __ret = pos_type(__newoffi);
     }
   if ((__testout || __testboth)
       && __newoffo >= 0
       && this->egptr() - __beg >= __newoffo)
     {
       _M_pbump(this->pbase(), this->epptr(), __newoffo);
       __ret = pos_type(__newoffo);
     }
 }
      return __ret;
    }

  template <class _CharT, class _Traits, class _Alloc>
    typename basic_stringbuf<_CharT, _Traits, _Alloc>::pos_type
    basic_stringbuf<_CharT, _Traits, _Alloc>::
    seekpos(pos_type __sp, ios_base::openmode __mode)
    {
      pos_type __ret = pos_type(off_type(-1));
      const bool __testin = (ios_base::in & this->_M_mode & __mode) != 0;
      const bool __testout = (ios_base::out & this->_M_mode & __mode) != 0;

      const char_type* __beg = __testin ? this->eback() : this->pbase();
      if ((__beg || !off_type(__sp)) && (__testin || __testout))
 {
   _M_update_egptr();

   const off_type __pos(__sp);
   const bool __testpos = (0 <= __pos
      && __pos <= this->egptr() - __beg);
   if (__testpos)
     {
       if (__testin)
  this->setg(this->eback(), this->eback() + __pos,
      this->egptr());
       if (__testout)
  _M_pbump(this->pbase(), this->epptr(), __pos);
       __ret = __sp;
     }
 }
      return __ret;
    }

  template <class _CharT, class _Traits, class _Alloc>
    void
    basic_stringbuf<_CharT, _Traits, _Alloc>::
    _M_sync(char_type* __base, __size_type __i, __size_type __o)
    {
      const bool __testin = _M_mode & ios_base::in;
      const bool __testout = _M_mode & ios_base::out;
      char_type* __endg = __base + _M_string.size();
      char_type* __endp = __base + _M_string.capacity();

      if (__base != _M_string.data())
 {

   __endg += __i;
   __i = 0;
   __endp = __endg;
 }

      if (__testin)
 this->setg(__base, __base + __i, __endg);
      if (__testout)
 {
   _M_pbump(__base, __endp, __o);



   if (!__testin)
     this->setg(__endg, __endg, __endg);
 }
    }

  template <class _CharT, class _Traits, class _Alloc>
    void
    basic_stringbuf<_CharT, _Traits, _Alloc>::
    _M_pbump(char_type* __pbeg, char_type* __pend, off_type __off)
    {
      this->setp(__pbeg, __pend);
      while (__off > __gnu_cxx::__numeric_traits<int>::__max)
 {
   this->pbump(__gnu_cxx::__numeric_traits<int>::__max);
   __off -= __gnu_cxx::__numeric_traits<int>::__max;
 }
      this->pbump(__off);
    }




  extern template class basic_stringbuf<char>;
  extern template class basic_istringstream<char>;
  extern template class basic_ostringstream<char>;
  extern template class basic_stringstream<char>;


  extern template class basic_stringbuf<wchar_t>;
  extern template class basic_istringstream<wchar_t>;
  extern template class basic_ostringstream<wchar_t>;
  extern template class basic_stringstream<wchar_t>;




}
# 814 "/usr/include/c++/5/sstream" 2 3
# 46 "/usr/include/c++/5/complex" 2 3




namespace std __attribute__ ((__visibility__ ("default")))
{

# 63 "/usr/include/c++/5/complex" 3
  template<typename _Tp> class complex;
  template<> class complex<float>;
  template<> class complex<double>;
  template<> class complex<long double>;


  template<typename _Tp> _Tp abs(const complex<_Tp>&);

  template<typename _Tp> _Tp arg(const complex<_Tp>&);

  template<typename _Tp> _Tp norm(const complex<_Tp>&);


  template<typename _Tp> complex<_Tp> conj(const complex<_Tp>&);

  template<typename _Tp> complex<_Tp> polar(const _Tp&, const _Tp& = 0);



  template<typename _Tp> complex<_Tp> cos(const complex<_Tp>&);

  template<typename _Tp> complex<_Tp> cosh(const complex<_Tp>&);

  template<typename _Tp> complex<_Tp> exp(const complex<_Tp>&);

  template<typename _Tp> complex<_Tp> log(const complex<_Tp>&);

  template<typename _Tp> complex<_Tp> log10(const complex<_Tp>&);

  template<typename _Tp> complex<_Tp> pow(const complex<_Tp>&, int);

  template<typename _Tp> complex<_Tp> pow(const complex<_Tp>&, const _Tp&);

  template<typename _Tp> complex<_Tp> pow(const complex<_Tp>&,
                                          const complex<_Tp>&);

  template<typename _Tp> complex<_Tp> pow(const _Tp&, const complex<_Tp>&);

  template<typename _Tp> complex<_Tp> sin(const complex<_Tp>&);

  template<typename _Tp> complex<_Tp> sinh(const complex<_Tp>&);

  template<typename _Tp> complex<_Tp> sqrt(const complex<_Tp>&);

  template<typename _Tp> complex<_Tp> tan(const complex<_Tp>&);

  template<typename _Tp> complex<_Tp> tanh(const complex<_Tp>&);
# 121 "/usr/include/c++/5/complex" 3
  template<typename _Tp>
    struct complex
    {

      typedef _Tp value_type;



      complex(const _Tp& __r = _Tp(), const _Tp& __i = _Tp())
      : _M_real(__r), _M_imag(__i) { }







      template<typename _Up>
        complex(const complex<_Up>& __z)
 : _M_real(__z.real()), _M_imag(__z.imag()) { }
# 154 "/usr/include/c++/5/complex" 3
      _Tp&
      real() { return _M_real; }


      const _Tp&
      real() const { return _M_real; }


      _Tp&
      imag() { return _M_imag; }


      const _Tp&
      imag() const { return _M_imag; }




      void
      real(_Tp __val) { _M_real = __val; }

      void
      imag(_Tp __val) { _M_imag = __val; }


      complex<_Tp>& operator=(const _Tp&);



      complex<_Tp>&
      operator+=(const _Tp& __t)
      {
 _M_real += __t;
 return *this;
      }



      complex<_Tp>&
      operator-=(const _Tp& __t)
      {
 _M_real -= __t;
 return *this;
      }


      complex<_Tp>& operator*=(const _Tp&);

      complex<_Tp>& operator/=(const _Tp&);







      template<typename _Up>
        complex<_Tp>& operator=(const complex<_Up>&);

      template<typename _Up>
        complex<_Tp>& operator+=(const complex<_Up>&);

      template<typename _Up>
        complex<_Tp>& operator-=(const complex<_Up>&);

      template<typename _Up>
        complex<_Tp>& operator*=(const complex<_Up>&);

      template<typename _Up>
        complex<_Tp>& operator/=(const complex<_Up>&);

      complex __rep() const
      { return *this; }

    private:
      _Tp _M_real;
      _Tp _M_imag;
    };

  template<typename _Tp>
    complex<_Tp>&
    complex<_Tp>::operator=(const _Tp& __t)
    {
     _M_real = __t;
     _M_imag = _Tp();
     return *this;
    }


  template<typename _Tp>
    complex<_Tp>&
    complex<_Tp>::operator*=(const _Tp& __t)
    {
      _M_real *= __t;
      _M_imag *= __t;
      return *this;
    }


  template<typename _Tp>
    complex<_Tp>&
    complex<_Tp>::operator/=(const _Tp& __t)
    {
      _M_real /= __t;
      _M_imag /= __t;
      return *this;
    }

  template<typename _Tp>
    template<typename _Up>
    complex<_Tp>&
    complex<_Tp>::operator=(const complex<_Up>& __z)
    {
      _M_real = __z.real();
      _M_imag = __z.imag();
      return *this;
    }


  template<typename _Tp>
    template<typename _Up>
    complex<_Tp>&
    complex<_Tp>::operator+=(const complex<_Up>& __z)
    {
      _M_real += __z.real();
      _M_imag += __z.imag();
      return *this;
    }


  template<typename _Tp>
    template<typename _Up>
    complex<_Tp>&
    complex<_Tp>::operator-=(const complex<_Up>& __z)
    {
      _M_real -= __z.real();
      _M_imag -= __z.imag();
      return *this;
    }



  template<typename _Tp>
    template<typename _Up>
    complex<_Tp>&
    complex<_Tp>::operator*=(const complex<_Up>& __z)
    {
      const _Tp __r = _M_real * __z.real() - _M_imag * __z.imag();
      _M_imag = _M_real * __z.imag() + _M_imag * __z.real();
      _M_real = __r;
      return *this;
    }



  template<typename _Tp>
    template<typename _Up>
    complex<_Tp>&
    complex<_Tp>::operator/=(const complex<_Up>& __z)
    {
      const _Tp __r = _M_real * __z.real() + _M_imag * __z.imag();
      const _Tp __n = std::norm(__z);
      _M_imag = (_M_imag * __z.real() - _M_real * __z.imag()) / __n;
      _M_real = __r / __n;
      return *this;
    }




  template<typename _Tp>
    inline complex<_Tp>
    operator+(const complex<_Tp>& __x, const complex<_Tp>& __y)
    {
      complex<_Tp> __r = __x;
      __r += __y;
      return __r;
    }

  template<typename _Tp>
    inline complex<_Tp>
    operator+(const complex<_Tp>& __x, const _Tp& __y)
    {
      complex<_Tp> __r = __x;
      __r += __y;
      return __r;
    }

  template<typename _Tp>
    inline complex<_Tp>
    operator+(const _Tp& __x, const complex<_Tp>& __y)
    {
      complex<_Tp> __r = __y;
      __r += __x;
      return __r;
    }




  template<typename _Tp>
    inline complex<_Tp>
    operator-(const complex<_Tp>& __x, const complex<_Tp>& __y)
    {
      complex<_Tp> __r = __x;
      __r -= __y;
      return __r;
    }

  template<typename _Tp>
    inline complex<_Tp>
    operator-(const complex<_Tp>& __x, const _Tp& __y)
    {
      complex<_Tp> __r = __x;
      __r -= __y;
      return __r;
    }

  template<typename _Tp>
    inline complex<_Tp>
    operator-(const _Tp& __x, const complex<_Tp>& __y)
    {
      complex<_Tp> __r(__x, -__y.imag());
      __r -= __y.real();
      return __r;
    }




  template<typename _Tp>
    inline complex<_Tp>
    operator*(const complex<_Tp>& __x, const complex<_Tp>& __y)
    {
      complex<_Tp> __r = __x;
      __r *= __y;
      return __r;
    }

  template<typename _Tp>
    inline complex<_Tp>
    operator*(const complex<_Tp>& __x, const _Tp& __y)
    {
      complex<_Tp> __r = __x;
      __r *= __y;
      return __r;
    }

  template<typename _Tp>
    inline complex<_Tp>
    operator*(const _Tp& __x, const complex<_Tp>& __y)
    {
      complex<_Tp> __r = __y;
      __r *= __x;
      return __r;
    }




  template<typename _Tp>
    inline complex<_Tp>
    operator/(const complex<_Tp>& __x, const complex<_Tp>& __y)
    {
      complex<_Tp> __r = __x;
      __r /= __y;
      return __r;
    }

  template<typename _Tp>
    inline complex<_Tp>
    operator/(const complex<_Tp>& __x, const _Tp& __y)
    {
      complex<_Tp> __r = __x;
      __r /= __y;
      return __r;
    }

  template<typename _Tp>
    inline complex<_Tp>
    operator/(const _Tp& __x, const complex<_Tp>& __y)
    {
      complex<_Tp> __r = __x;
      __r /= __y;
      return __r;
    }



  template<typename _Tp>
    inline complex<_Tp>
    operator+(const complex<_Tp>& __x)
    { return __x; }


  template<typename _Tp>
    inline complex<_Tp>
    operator-(const complex<_Tp>& __x)
    { return complex<_Tp>(-__x.real(), -__x.imag()); }



  template<typename _Tp>
    inline bool
    operator==(const complex<_Tp>& __x, const complex<_Tp>& __y)
    { return __x.real() == __y.real() && __x.imag() == __y.imag(); }

  template<typename _Tp>
    inline bool
    operator==(const complex<_Tp>& __x, const _Tp& __y)
    { return __x.real() == __y && __x.imag() == _Tp(); }

  template<typename _Tp>
    inline bool
    operator==(const _Tp& __x, const complex<_Tp>& __y)
    { return __x == __y.real() && _Tp() == __y.imag(); }




  template<typename _Tp>
    inline bool
    operator!=(const complex<_Tp>& __x, const complex<_Tp>& __y)
    { return __x.real() != __y.real() || __x.imag() != __y.imag(); }

  template<typename _Tp>
    inline bool
    operator!=(const complex<_Tp>& __x, const _Tp& __y)
    { return __x.real() != __y || __x.imag() != _Tp(); }

  template<typename _Tp>
    inline bool
    operator!=(const _Tp& __x, const complex<_Tp>& __y)
    { return __x != __y.real() || _Tp() != __y.imag(); }



  template<typename _Tp, typename _CharT, class _Traits>
    basic_istream<_CharT, _Traits>&
    operator>>(basic_istream<_CharT, _Traits>& __is, complex<_Tp>& __x)
    {
      _Tp __re_x, __im_x;
      _CharT __ch;
      __is >> __ch;
      if (__ch == '(')
 {
   __is >> __re_x >> __ch;
   if (__ch == ',')
     {
       __is >> __im_x >> __ch;
       if (__ch == ')')
  __x = complex<_Tp>(__re_x, __im_x);
       else
  __is.setstate(ios_base::failbit);
     }
   else if (__ch == ')')
     __x = __re_x;
   else
     __is.setstate(ios_base::failbit);
 }
      else
 {
   __is.putback(__ch);
   __is >> __re_x;
   __x = __re_x;
 }
      return __is;
    }


  template<typename _Tp, typename _CharT, class _Traits>
    basic_ostream<_CharT, _Traits>&
    operator<<(basic_ostream<_CharT, _Traits>& __os, const complex<_Tp>& __x)
    {
      basic_ostringstream<_CharT, _Traits> __s;
      __s.flags(__os.flags());
      __s.imbue(__os.getloc());
      __s.precision(__os.precision());
      __s << '(' << __x.real() << ',' << __x.imag() << ')';
      return __os << __s.str();
    }
# 548 "/usr/include/c++/5/complex" 3
  template<typename _Tp>
    inline _Tp&
    real(complex<_Tp>& __z)
    { return __z.real(); }

  template<typename _Tp>
    inline const _Tp&
    real(const complex<_Tp>& __z)
    { return __z.real(); }

  template<typename _Tp>
    inline _Tp&
    imag(complex<_Tp>& __z)
    { return __z.imag(); }

  template<typename _Tp>
    inline const _Tp&
    imag(const complex<_Tp>& __z)
    { return __z.imag(); }



  template<typename _Tp>
    inline _Tp
    __complex_abs(const complex<_Tp>& __z)
    {
      _Tp __x = __z.real();
      _Tp __y = __z.imag();
      const _Tp __s = std::max(abs(__x), abs(__y));
      if (__s == _Tp())
        return __s;
      __x /= __s;
      __y /= __s;
      return __s * sqrt(__x * __x + __y * __y);
    }


  inline float
  __complex_abs(__complex__ float __z) { return __builtin_cabsf(__z); }

  inline double
  __complex_abs(__complex__ double __z) { return __builtin_cabs(__z); }

  inline long double
  __complex_abs(const __complex__ long double& __z)
  { return __builtin_cabsl(__z); }

  template<typename _Tp>
    inline _Tp
    abs(const complex<_Tp>& __z) { return __complex_abs(__z.__rep()); }
# 606 "/usr/include/c++/5/complex" 3
  template<typename _Tp>
    inline _Tp
    __complex_arg(const complex<_Tp>& __z)
    { return atan2(__z.imag(), __z.real()); }


  inline float
  __complex_arg(__complex__ float __z) { return __builtin_cargf(__z); }

  inline double
  __complex_arg(__complex__ double __z) { return __builtin_carg(__z); }

  inline long double
  __complex_arg(const __complex__ long double& __z)
  { return __builtin_cargl(__z); }

  template<typename _Tp>
    inline _Tp
    arg(const complex<_Tp>& __z) { return __complex_arg(__z.__rep()); }
# 636 "/usr/include/c++/5/complex" 3
  template<bool>
    struct _Norm_helper
    {
      template<typename _Tp>
        static inline _Tp _S_do_it(const complex<_Tp>& __z)
        {
          const _Tp __x = __z.real();
          const _Tp __y = __z.imag();
          return __x * __x + __y * __y;
        }
    };

  template<>
    struct _Norm_helper<true>
    {
      template<typename _Tp>
        static inline _Tp _S_do_it(const complex<_Tp>& __z)
        {
          _Tp __res = std::abs(__z);
          return __res * __res;
        }
    };

  template<typename _Tp>
    inline _Tp
    norm(const complex<_Tp>& __z)
    {
      return _Norm_helper<__is_floating<_Tp>::__value
 && !0>::_S_do_it(__z);
    }

  template<typename _Tp>
    inline complex<_Tp>
    polar(const _Tp& __rho, const _Tp& __theta)
    { return complex<_Tp>(__rho * cos(__theta), __rho * sin(__theta)); }

  template<typename _Tp>
    inline complex<_Tp>
    conj(const complex<_Tp>& __z)
    { return complex<_Tp>(__z.real(), -__z.imag()); }




  template<typename _Tp>
    inline complex<_Tp>
    __complex_cos(const complex<_Tp>& __z)
    {
      const _Tp __x = __z.real();
      const _Tp __y = __z.imag();
      return complex<_Tp>(cos(__x) * cosh(__y), -sin(__x) * sinh(__y));
    }


  inline __complex__ float
  __complex_cos(__complex__ float __z) { return __builtin_ccosf(__z); }

  inline __complex__ double
  __complex_cos(__complex__ double __z) { return __builtin_ccos(__z); }

  inline __complex__ long double
  __complex_cos(const __complex__ long double& __z)
  { return __builtin_ccosl(__z); }

  template<typename _Tp>
    inline complex<_Tp>
    cos(const complex<_Tp>& __z) { return __complex_cos(__z.__rep()); }







  template<typename _Tp>
    inline complex<_Tp>
    __complex_cosh(const complex<_Tp>& __z)
    {
      const _Tp __x = __z.real();
      const _Tp __y = __z.imag();
      return complex<_Tp>(cosh(__x) * cos(__y), sinh(__x) * sin(__y));
    }


  inline __complex__ float
  __complex_cosh(__complex__ float __z) { return __builtin_ccoshf(__z); }

  inline __complex__ double
  __complex_cosh(__complex__ double __z) { return __builtin_ccosh(__z); }

  inline __complex__ long double
  __complex_cosh(const __complex__ long double& __z)
  { return __builtin_ccoshl(__z); }

  template<typename _Tp>
    inline complex<_Tp>
    cosh(const complex<_Tp>& __z) { return __complex_cosh(__z.__rep()); }







  template<typename _Tp>
    inline complex<_Tp>
    __complex_exp(const complex<_Tp>& __z)
    { return std::polar<_Tp>(exp(__z.real()), __z.imag()); }


  inline __complex__ float
  __complex_exp(__complex__ float __z) { return __builtin_cexpf(__z); }

  inline __complex__ double
  __complex_exp(__complex__ double __z) { return __builtin_cexp(__z); }

  inline __complex__ long double
  __complex_exp(const __complex__ long double& __z)
  { return __builtin_cexpl(__z); }

  template<typename _Tp>
    inline complex<_Tp>
    exp(const complex<_Tp>& __z) { return __complex_exp(__z.__rep()); }
# 767 "/usr/include/c++/5/complex" 3
  template<typename _Tp>
    inline complex<_Tp>
    __complex_log(const complex<_Tp>& __z)
    { return complex<_Tp>(log(std::abs(__z)), std::arg(__z)); }


  inline __complex__ float
  __complex_log(__complex__ float __z) { return __builtin_clogf(__z); }

  inline __complex__ double
  __complex_log(__complex__ double __z) { return __builtin_clog(__z); }

  inline __complex__ long double
  __complex_log(const __complex__ long double& __z)
  { return __builtin_clogl(__z); }

  template<typename _Tp>
    inline complex<_Tp>
    log(const complex<_Tp>& __z) { return __complex_log(__z.__rep()); }






  template<typename _Tp>
    inline complex<_Tp>
    log10(const complex<_Tp>& __z)
    { return std::log(__z) / log(_Tp(10.0)); }


  template<typename _Tp>
    inline complex<_Tp>
    __complex_sin(const complex<_Tp>& __z)
    {
      const _Tp __x = __z.real();
      const _Tp __y = __z.imag();
      return complex<_Tp>(sin(__x) * cosh(__y), cos(__x) * sinh(__y));
    }


  inline __complex__ float
  __complex_sin(__complex__ float __z) { return __builtin_csinf(__z); }

  inline __complex__ double
  __complex_sin(__complex__ double __z) { return __builtin_csin(__z); }

  inline __complex__ long double
  __complex_sin(const __complex__ long double& __z)
  { return __builtin_csinl(__z); }

  template<typename _Tp>
    inline complex<_Tp>
    sin(const complex<_Tp>& __z) { return __complex_sin(__z.__rep()); }







  template<typename _Tp>
    inline complex<_Tp>
    __complex_sinh(const complex<_Tp>& __z)
    {
      const _Tp __x = __z.real();
      const _Tp __y = __z.imag();
      return complex<_Tp>(sinh(__x) * cos(__y), cosh(__x) * sin(__y));
    }


  inline __complex__ float
  __complex_sinh(__complex__ float __z) { return __builtin_csinhf(__z); }

  inline __complex__ double
  __complex_sinh(__complex__ double __z) { return __builtin_csinh(__z); }

  inline __complex__ long double
  __complex_sinh(const __complex__ long double& __z)
  { return __builtin_csinhl(__z); }

  template<typename _Tp>
    inline complex<_Tp>
    sinh(const complex<_Tp>& __z) { return __complex_sinh(__z.__rep()); }
# 859 "/usr/include/c++/5/complex" 3
  template<typename _Tp>
    complex<_Tp>
    __complex_sqrt(const complex<_Tp>& __z)
    {
      _Tp __x = __z.real();
      _Tp __y = __z.imag();

      if (__x == _Tp())
        {
          _Tp __t = sqrt(abs(__y) / 2);
          return complex<_Tp>(__t, __y < _Tp() ? -__t : __t);
        }
      else
        {
          _Tp __t = sqrt(2 * (std::abs(__z) + abs(__x)));
          _Tp __u = __t / 2;
          return __x > _Tp()
            ? complex<_Tp>(__u, __y / __t)
            : complex<_Tp>(abs(__y) / __t, __y < _Tp() ? -__u : __u);
        }
    }


  inline __complex__ float
  __complex_sqrt(__complex__ float __z) { return __builtin_csqrtf(__z); }

  inline __complex__ double
  __complex_sqrt(__complex__ double __z) { return __builtin_csqrt(__z); }

  inline __complex__ long double
  __complex_sqrt(const __complex__ long double& __z)
  { return __builtin_csqrtl(__z); }

  template<typename _Tp>
    inline complex<_Tp>
    sqrt(const complex<_Tp>& __z) { return __complex_sqrt(__z.__rep()); }
# 903 "/usr/include/c++/5/complex" 3
  template<typename _Tp>
    inline complex<_Tp>
    __complex_tan(const complex<_Tp>& __z)
    { return std::sin(__z) / std::cos(__z); }


  inline __complex__ float
  __complex_tan(__complex__ float __z) { return __builtin_ctanf(__z); }

  inline __complex__ double
  __complex_tan(__complex__ double __z) { return __builtin_ctan(__z); }

  inline __complex__ long double
  __complex_tan(const __complex__ long double& __z)
  { return __builtin_ctanl(__z); }

  template<typename _Tp>
    inline complex<_Tp>
    tan(const complex<_Tp>& __z) { return __complex_tan(__z.__rep()); }
# 931 "/usr/include/c++/5/complex" 3
  template<typename _Tp>
    inline complex<_Tp>
    __complex_tanh(const complex<_Tp>& __z)
    { return std::sinh(__z) / std::cosh(__z); }


  inline __complex__ float
  __complex_tanh(__complex__ float __z) { return __builtin_ctanhf(__z); }

  inline __complex__ double
  __complex_tanh(__complex__ double __z) { return __builtin_ctanh(__z); }

  inline __complex__ long double
  __complex_tanh(const __complex__ long double& __z)
  { return __builtin_ctanhl(__z); }

  template<typename _Tp>
    inline complex<_Tp>
    tanh(const complex<_Tp>& __z) { return __complex_tanh(__z.__rep()); }
# 960 "/usr/include/c++/5/complex" 3
  template<typename _Tp>
    complex<_Tp>
    __complex_pow_unsigned(complex<_Tp> __x, unsigned __n)
    {
      complex<_Tp> __y = __n % 2 ? __x : complex<_Tp>(1);

      while (__n >>= 1)
        {
          __x *= __x;
          if (__n % 2)
            __y *= __x;
        }

      return __y;
    }







  template<typename _Tp>
    inline complex<_Tp>
    pow(const complex<_Tp>& __z, int __n)
    {
      return __n < 0
 ? complex<_Tp>(1) / std::__complex_pow_unsigned(__z, -(unsigned)__n)
        : std::__complex_pow_unsigned(__z, __n);
    }

  template<typename _Tp>
    complex<_Tp>
    pow(const complex<_Tp>& __x, const _Tp& __y)
    {




      if (__x.imag() == _Tp() && __x.real() > _Tp())
        return pow(__x.real(), __y);

      complex<_Tp> __t = std::log(__x);
      return std::polar<_Tp>(exp(__y * __t.real()), __y * __t.imag());
    }

  template<typename _Tp>
    inline complex<_Tp>
    __complex_pow(const complex<_Tp>& __x, const complex<_Tp>& __y)
    { return __x == _Tp() ? _Tp() : std::exp(__y * std::log(__x)); }


  inline __complex__ float
  __complex_pow(__complex__ float __x, __complex__ float __y)
  { return __builtin_cpowf(__x, __y); }

  inline __complex__ double
  __complex_pow(__complex__ double __x, __complex__ double __y)
  { return __builtin_cpow(__x, __y); }

  inline __complex__ long double
  __complex_pow(const __complex__ long double& __x,
  const __complex__ long double& __y)
  { return __builtin_cpowl(__x, __y); }

  template<typename _Tp>
    inline complex<_Tp>
    pow(const complex<_Tp>& __x, const complex<_Tp>& __y)
    { return __complex_pow(__x.__rep(), __y.__rep()); }







  template<typename _Tp>
    inline complex<_Tp>
    pow(const _Tp& __x, const complex<_Tp>& __y)
    {
      return __x > _Tp() ? std::polar<_Tp>(pow(__x, __y.real()),
        __y.imag() * log(__x))
                  : std::pow(complex<_Tp>(__x), __y);
    }



  template<>
    struct complex<float>
    {
      typedef float value_type;
      typedef __complex__ float _ComplexT;

      complex(_ComplexT __z) : _M_value(__z) { }

      complex(float __r = 0.0f, float __i = 0.0f)



      {
 __real__ _M_value = __r;
 __imag__ _M_value = __i;
      }


      explicit complex(const complex<double>&);
      explicit complex(const complex<long double>&);
# 1079 "/usr/include/c++/5/complex" 3
      float&
      real() { return __real__ _M_value; }

      const float&
      real() const { return __real__ _M_value; }

      float&
      imag() { return __imag__ _M_value; }

      const float&
      imag() const { return __imag__ _M_value; }




      void
      real(float __val) { __real__ _M_value = __val; }

      void
      imag(float __val) { __imag__ _M_value = __val; }

      complex&
      operator=(float __f)
      {
 _M_value = __f;
 return *this;
      }

      complex&
      operator+=(float __f)
      {
 _M_value += __f;
 return *this;
      }

      complex&
      operator-=(float __f)
      {
 _M_value -= __f;
 return *this;
      }

      complex&
      operator*=(float __f)
      {
 _M_value *= __f;
 return *this;
      }

      complex&
      operator/=(float __f)
      {
 _M_value /= __f;
 return *this;
      }





      template<typename _Tp>
        complex&
        operator=(const complex<_Tp>& __z)
 {
   __real__ _M_value = __z.real();
   __imag__ _M_value = __z.imag();
   return *this;
 }

      template<typename _Tp>
        complex&
        operator+=(const complex<_Tp>& __z)
 {
   __real__ _M_value += __z.real();
   __imag__ _M_value += __z.imag();
   return *this;
 }

      template<class _Tp>
        complex&
        operator-=(const complex<_Tp>& __z)
 {
   __real__ _M_value -= __z.real();
   __imag__ _M_value -= __z.imag();
   return *this;
 }

      template<class _Tp>
        complex&
        operator*=(const complex<_Tp>& __z)
 {
   _ComplexT __t;
   __real__ __t = __z.real();
   __imag__ __t = __z.imag();
   _M_value *= __t;
   return *this;
 }

      template<class _Tp>
        complex&
        operator/=(const complex<_Tp>& __z)
 {
   _ComplexT __t;
   __real__ __t = __z.real();
   __imag__ __t = __z.imag();
   _M_value /= __t;
   return *this;
 }

      _ComplexT __rep() const { return _M_value; }

    private:
      _ComplexT _M_value;
    };



  template<>
    struct complex<double>
    {
      typedef double value_type;
      typedef __complex__ double _ComplexT;

      complex(_ComplexT __z) : _M_value(__z) { }

      complex(double __r = 0.0, double __i = 0.0)



      {
 __real__ _M_value = __r;
 __imag__ _M_value = __i;
      }


      complex(const complex<float>& __z)
      : _M_value(__z.__rep()) { }

      explicit complex(const complex<long double>&);
# 1230 "/usr/include/c++/5/complex" 3
      double&
      real() { return __real__ _M_value; }

      const double&
      real() const { return __real__ _M_value; }

      double&
      imag() { return __imag__ _M_value; }

      const double&
      imag() const { return __imag__ _M_value; }




      void
      real(double __val) { __real__ _M_value = __val; }

      void
      imag(double __val) { __imag__ _M_value = __val; }

      complex&
      operator=(double __d)
      {
 _M_value = __d;
 return *this;
      }

      complex&
      operator+=(double __d)
      {
 _M_value += __d;
 return *this;
      }

      complex&
      operator-=(double __d)
      {
 _M_value -= __d;
 return *this;
      }

      complex&
      operator*=(double __d)
      {
 _M_value *= __d;
 return *this;
      }

      complex&
      operator/=(double __d)
      {
 _M_value /= __d;
 return *this;
      }




      template<typename _Tp>
        complex&
        operator=(const complex<_Tp>& __z)
 {
   __real__ _M_value = __z.real();
   __imag__ _M_value = __z.imag();
   return *this;
 }

      template<typename _Tp>
        complex&
        operator+=(const complex<_Tp>& __z)
 {
   __real__ _M_value += __z.real();
   __imag__ _M_value += __z.imag();
   return *this;
 }

      template<typename _Tp>
        complex&
        operator-=(const complex<_Tp>& __z)
 {
   __real__ _M_value -= __z.real();
   __imag__ _M_value -= __z.imag();
   return *this;
 }

      template<typename _Tp>
        complex&
        operator*=(const complex<_Tp>& __z)
 {
   _ComplexT __t;
   __real__ __t = __z.real();
   __imag__ __t = __z.imag();
   _M_value *= __t;
   return *this;
 }

      template<typename _Tp>
        complex&
        operator/=(const complex<_Tp>& __z)
 {
   _ComplexT __t;
   __real__ __t = __z.real();
   __imag__ __t = __z.imag();
   _M_value /= __t;
   return *this;
 }

      _ComplexT __rep() const { return _M_value; }

    private:
      _ComplexT _M_value;
    };



  template<>
    struct complex<long double>
    {
      typedef long double value_type;
      typedef __complex__ long double _ComplexT;

      complex(_ComplexT __z) : _M_value(__z) { }

      complex(long double __r = 0.0L,
     long double __i = 0.0L)



      {
 __real__ _M_value = __r;
 __imag__ _M_value = __i;
      }


      complex(const complex<float>& __z)
      : _M_value(__z.__rep()) { }

      complex(const complex<double>& __z)
      : _M_value(__z.__rep()) { }
# 1382 "/usr/include/c++/5/complex" 3
      long double&
      real() { return __real__ _M_value; }

      const long double&
      real() const { return __real__ _M_value; }

      long double&
      imag() { return __imag__ _M_value; }

      const long double&
      imag() const { return __imag__ _M_value; }




      void
      real(long double __val) { __real__ _M_value = __val; }

      void
      imag(long double __val) { __imag__ _M_value = __val; }

      complex&
      operator=(long double __r)
      {
 _M_value = __r;
 return *this;
      }

      complex&
      operator+=(long double __r)
      {
 _M_value += __r;
 return *this;
      }

      complex&
      operator-=(long double __r)
      {
 _M_value -= __r;
 return *this;
      }

      complex&
      operator*=(long double __r)
      {
 _M_value *= __r;
 return *this;
      }

      complex&
      operator/=(long double __r)
      {
 _M_value /= __r;
 return *this;
      }




      template<typename _Tp>
        complex&
        operator=(const complex<_Tp>& __z)
 {
   __real__ _M_value = __z.real();
   __imag__ _M_value = __z.imag();
   return *this;
 }

      template<typename _Tp>
        complex&
 operator+=(const complex<_Tp>& __z)
 {
   __real__ _M_value += __z.real();
   __imag__ _M_value += __z.imag();
   return *this;
 }

      template<typename _Tp>
        complex&
 operator-=(const complex<_Tp>& __z)
 {
   __real__ _M_value -= __z.real();
   __imag__ _M_value -= __z.imag();
   return *this;
 }

      template<typename _Tp>
        complex&
 operator*=(const complex<_Tp>& __z)
 {
   _ComplexT __t;
   __real__ __t = __z.real();
   __imag__ __t = __z.imag();
   _M_value *= __t;
   return *this;
 }

      template<typename _Tp>
        complex&
 operator/=(const complex<_Tp>& __z)
 {
   _ComplexT __t;
   __real__ __t = __z.real();
   __imag__ __t = __z.imag();
   _M_value /= __t;
   return *this;
 }

      _ComplexT __rep() const { return _M_value; }

    private:
      _ComplexT _M_value;
    };



  inline
  complex<float>::complex(const complex<double>& __z)
  : _M_value(__z.__rep()) { }

  inline
  complex<float>::complex(const complex<long double>& __z)
  : _M_value(__z.__rep()) { }

  inline
  complex<double>::complex(const complex<long double>& __z)
  : _M_value(__z.__rep()) { }





  extern template istream& operator>>(istream&, complex<float>&);
  extern template ostream& operator<<(ostream&, const complex<float>&);
  extern template istream& operator>>(istream&, complex<double>&);
  extern template ostream& operator<<(ostream&, const complex<double>&);
  extern template istream& operator>>(istream&, complex<long double>&);
  extern template ostream& operator<<(ostream&, const complex<long double>&);


  extern template wistream& operator>>(wistream&, complex<float>&);
  extern template wostream& operator<<(wostream&, const complex<float>&);
  extern template wistream& operator>>(wistream&, complex<double>&);
  extern template wostream& operator<<(wostream&, const complex<double>&);
  extern template wistream& operator>>(wistream&, complex<long double>&);
  extern template wostream& operator<<(wostream&, const complex<long double>&);






}

namespace __gnu_cxx __attribute__ ((__visibility__ ("default")))
{



  template<typename _Tp, typename _Up>
    struct __promote_2<std::complex<_Tp>, _Up>
    {
    public:
      typedef std::complex<typename __promote_2<_Tp, _Up>::__type> __type;
    };

  template<typename _Tp, typename _Up>
    struct __promote_2<_Tp, std::complex<_Up> >
    {
    public:
      typedef std::complex<typename __promote_2<_Tp, _Up>::__type> __type;
    };

  template<typename _Tp, typename _Up>
    struct __promote_2<std::complex<_Tp>, std::complex<_Up> >
    {
    public:
      typedef std::complex<typename __promote_2<_Tp, _Up>::__type> __type;
    };


}
# 4 "precision.h" 2
# 1 "/usr/include/c++/5/cmath" 1 3
# 39 "/usr/include/c++/5/cmath" 3
       
# 40 "/usr/include/c++/5/cmath" 3
# 5 "precision.h" 2
# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/float.h" 1 3 4
# 6 "precision.h" 2



# 1 "arprec/include/arprec/mp_real.h" 1
# 17 "arprec/include/arprec/mp_real.h"
# 1 "arprec/include/arprec/arprec_config.h" 1
# 18 "arprec/include/arprec/mp_real.h" 2
# 27 "arprec/include/arprec/mp_real.h"
# 1 "arprec/include/arprec/mp.h" 1
# 14 "arprec/include/arprec/mp.h"
# 1 "/usr/include/c++/5/cmath" 1 3
# 39 "/usr/include/c++/5/cmath" 3
       
# 40 "/usr/include/c++/5/cmath" 3
# 15 "arprec/include/arprec/mp.h" 2
# 1 "/usr/include/c++/5/cstdlib" 1 3
# 39 "/usr/include/c++/5/cstdlib" 3
       
# 40 "/usr/include/c++/5/cstdlib" 3
# 114 "/usr/include/c++/5/cstdlib" 3
namespace std __attribute__ ((__visibility__ ("default")))
{


  using ::div_t;
  using ::ldiv_t;

  using ::abort;
  using ::abs;
  using ::atexit;





  using ::atof;
  using ::atoi;
  using ::atol;
  using ::bsearch;
  using ::calloc;
  using ::div;
  using ::exit;
  using ::free;
  using ::getenv;
  using ::labs;
  using ::ldiv;
  using ::malloc;

  using ::mblen;
  using ::mbstowcs;
  using ::mbtowc;

  using ::qsort;





  using ::rand;
  using ::realloc;
  using ::srand;
  using ::strtod;
  using ::strtol;
  using ::strtoul;
  using ::system;

  using ::wcstombs;
  using ::wctomb;



  inline long
  abs(long __i) { return __builtin_labs(__i); }

  inline ldiv_t
  div(long __i, long __j) { return ldiv(__i, __j); }



  inline long long
  abs(long long __x) { return __builtin_llabs (__x); }



  inline __int128
  abs(__int128 __x) { return __x >= 0 ? __x : -__x; }
# 195 "/usr/include/c++/5/cstdlib" 3

}
# 209 "/usr/include/c++/5/cstdlib" 3
namespace __gnu_cxx __attribute__ ((__visibility__ ("default")))
{



  using ::lldiv_t;





  using ::_Exit;



  using ::llabs;

  inline lldiv_t
  div(long long __n, long long __d)
  { lldiv_t __q; __q.quot = __n / __d; __q.rem = __n % __d; return __q; }

  using ::lldiv;
# 241 "/usr/include/c++/5/cstdlib" 3
  using ::atoll;
  using ::strtoll;
  using ::strtoull;

  using ::strtof;
  using ::strtold;


}

namespace std
{

  using ::__gnu_cxx::lldiv_t;

  using ::__gnu_cxx::_Exit;

  using ::__gnu_cxx::llabs;
  using ::__gnu_cxx::div;
  using ::__gnu_cxx::lldiv;

  using ::__gnu_cxx::atoll;
  using ::__gnu_cxx::strtof;
  using ::__gnu_cxx::strtoll;
  using ::__gnu_cxx::strtoull;
  using ::__gnu_cxx::strtold;
}
# 16 "arprec/include/arprec/mp.h" 2
# 1 "/usr/include/c++/5/algorithm" 1 3
# 58 "/usr/include/c++/5/algorithm" 3
       
# 59 "/usr/include/c++/5/algorithm" 3

# 1 "/usr/include/c++/5/utility" 1 3
# 58 "/usr/include/c++/5/utility" 3
       
# 59 "/usr/include/c++/5/utility" 3
# 69 "/usr/include/c++/5/utility" 3
# 1 "/usr/include/c++/5/bits/stl_relops.h" 1 3
# 67 "/usr/include/c++/5/bits/stl_relops.h" 3
namespace std __attribute__ ((__visibility__ ("default")))
{
  namespace rel_ops
  {
 
# 85 "/usr/include/c++/5/bits/stl_relops.h" 3
    template <class _Tp>
      inline bool
      operator!=(const _Tp& __x, const _Tp& __y)
      { return !(__x == __y); }
# 98 "/usr/include/c++/5/bits/stl_relops.h" 3
    template <class _Tp>
      inline bool
      operator>(const _Tp& __x, const _Tp& __y)
      { return __y < __x; }
# 111 "/usr/include/c++/5/bits/stl_relops.h" 3
    template <class _Tp>
      inline bool
      operator<=(const _Tp& __x, const _Tp& __y)
      { return !(__y < __x); }
# 124 "/usr/include/c++/5/bits/stl_relops.h" 3
    template <class _Tp>
      inline bool
      operator>=(const _Tp& __x, const _Tp& __y)
      { return !(__x < __y); }

 
  }

}
# 70 "/usr/include/c++/5/utility" 2 3
# 61 "/usr/include/c++/5/algorithm" 2 3

# 1 "/usr/include/c++/5/bits/stl_algo.h" 1 3
# 59 "/usr/include/c++/5/bits/stl_algo.h" 3
# 1 "/usr/include/c++/5/cstdlib" 1 3
# 39 "/usr/include/c++/5/cstdlib" 3
       
# 40 "/usr/include/c++/5/cstdlib" 3
# 60 "/usr/include/c++/5/bits/stl_algo.h" 2 3
# 1 "/usr/include/c++/5/bits/algorithmfwd.h" 1 3
# 33 "/usr/include/c++/5/bits/algorithmfwd.h" 3
       
# 34 "/usr/include/c++/5/bits/algorithmfwd.h" 3
# 42 "/usr/include/c++/5/bits/algorithmfwd.h" 3
namespace std __attribute__ ((__visibility__ ("default")))
{

# 203 "/usr/include/c++/5/bits/algorithmfwd.h" 3
  template<typename _FIter, typename _Tp>
    bool
    binary_search(_FIter, _FIter, const _Tp&);

  template<typename _FIter, typename _Tp, typename _Compare>
    bool
    binary_search(_FIter, _FIter, const _Tp&, _Compare);

  template<typename _IIter, typename _OIter>
    _OIter
    copy(_IIter, _IIter, _OIter);

  template<typename _BIter1, typename _BIter2>
    _BIter2
    copy_backward(_BIter1, _BIter1, _BIter2);
# 232 "/usr/include/c++/5/bits/algorithmfwd.h" 3
  template<typename _FIter, typename _Tp>
    pair<_FIter, _FIter>
    equal_range(_FIter, _FIter, const _Tp&);

  template<typename _FIter, typename _Tp, typename _Compare>
    pair<_FIter, _FIter>
    equal_range(_FIter, _FIter, const _Tp&, _Compare);

  template<typename _FIter, typename _Tp>
    void
    fill(_FIter, _FIter, const _Tp&);

  template<typename _OIter, typename _Size, typename _Tp>
    _OIter
    fill_n(_OIter, _Size, const _Tp&);



  template<typename _FIter1, typename _FIter2>
    _FIter1
    find_end(_FIter1, _FIter1, _FIter2, _FIter2);

  template<typename _FIter1, typename _FIter2, typename _BinaryPredicate>
    _FIter1
    find_end(_FIter1, _FIter1, _FIter2, _FIter2, _BinaryPredicate);
# 271 "/usr/include/c++/5/bits/algorithmfwd.h" 3
  template<typename _IIter1, typename _IIter2>
    bool
    includes(_IIter1, _IIter1, _IIter2, _IIter2);

  template<typename _IIter1, typename _IIter2, typename _Compare>
    bool
    includes(_IIter1, _IIter1, _IIter2, _IIter2, _Compare);

  template<typename _BIter>
    void
    inplace_merge(_BIter, _BIter, _BIter);

  template<typename _BIter, typename _Compare>
    void
    inplace_merge(_BIter, _BIter, _BIter, _Compare);
# 334 "/usr/include/c++/5/bits/algorithmfwd.h" 3
  template<typename _FIter1, typename _FIter2>
    void
    iter_swap(_FIter1, _FIter2);

  template<typename _FIter, typename _Tp>
    _FIter
    lower_bound(_FIter, _FIter, const _Tp&);

  template<typename _FIter, typename _Tp, typename _Compare>
    _FIter
    lower_bound(_FIter, _FIter, const _Tp&, _Compare);

  template<typename _RAIter>
    void
    make_heap(_RAIter, _RAIter);

  template<typename _RAIter, typename _Compare>
    void
    make_heap(_RAIter, _RAIter, _Compare);

  template<typename _Tp>
   
    const _Tp&
    max(const _Tp&, const _Tp&);

  template<typename _Tp, typename _Compare>
   
    const _Tp&
    max(const _Tp&, const _Tp&, _Compare);




  template<typename _Tp>
   
    const _Tp&
    min(const _Tp&, const _Tp&);

  template<typename _Tp, typename _Compare>
   
    const _Tp&
    min(const _Tp&, const _Tp&, _Compare);
# 433 "/usr/include/c++/5/bits/algorithmfwd.h" 3
  template<typename _BIter>
    bool
    next_permutation(_BIter, _BIter);

  template<typename _BIter, typename _Compare>
    bool
    next_permutation(_BIter, _BIter, _Compare);
# 450 "/usr/include/c++/5/bits/algorithmfwd.h" 3
  template<typename _IIter, typename _RAIter>
    _RAIter
    partial_sort_copy(_IIter, _IIter, _RAIter, _RAIter);

  template<typename _IIter, typename _RAIter, typename _Compare>
    _RAIter
    partial_sort_copy(_IIter, _IIter, _RAIter, _RAIter, _Compare);
# 471 "/usr/include/c++/5/bits/algorithmfwd.h" 3
  template<typename _RAIter>
    void
    pop_heap(_RAIter, _RAIter);

  template<typename _RAIter, typename _Compare>
    void
    pop_heap(_RAIter, _RAIter, _Compare);

  template<typename _BIter>
    bool
    prev_permutation(_BIter, _BIter);

  template<typename _BIter, typename _Compare>
    bool
    prev_permutation(_BIter, _BIter, _Compare);

  template<typename _RAIter>
    void
    push_heap(_RAIter, _RAIter);

  template<typename _RAIter, typename _Compare>
    void
    push_heap(_RAIter, _RAIter, _Compare);



  template<typename _FIter, typename _Tp>
    _FIter
    remove(_FIter, _FIter, const _Tp&);

  template<typename _FIter, typename _Predicate>
    _FIter
    remove_if(_FIter, _FIter, _Predicate);

  template<typename _IIter, typename _OIter, typename _Tp>
    _OIter
    remove_copy(_IIter, _IIter, _OIter, const _Tp&);

  template<typename _IIter, typename _OIter, typename _Predicate>
    _OIter
    remove_copy_if(_IIter, _IIter, _OIter, _Predicate);



  template<typename _IIter, typename _OIter, typename _Tp>
    _OIter
    replace_copy(_IIter, _IIter, _OIter, const _Tp&, const _Tp&);

  template<typename _Iter, typename _OIter, typename _Predicate, typename _Tp>
    _OIter
    replace_copy_if(_Iter, _Iter, _OIter, _Predicate, const _Tp&);



  template<typename _BIter>
    void
    reverse(_BIter, _BIter);

  template<typename _BIter, typename _OIter>
    _OIter
    reverse_copy(_BIter, _BIter, _OIter);

  inline namespace _V2
  {
    template<typename _FIter>
      _FIter
      rotate(_FIter, _FIter, _FIter);
  }

  template<typename _FIter, typename _OIter>
    _OIter
    rotate_copy(_FIter, _FIter, _FIter, _OIter);
# 557 "/usr/include/c++/5/bits/algorithmfwd.h" 3
  template<typename _RAIter>
    void
    sort_heap(_RAIter, _RAIter);

  template<typename _RAIter, typename _Compare>
    void
    sort_heap(_RAIter, _RAIter, _Compare);

  template<typename _BIter, typename _Predicate>
    _BIter
    stable_partition(_BIter, _BIter, _Predicate);

  template<typename _Tp>
    void
    swap(_Tp&, _Tp&)




    ;

  template<typename _Tp, size_t _Nm>
    void
    swap(_Tp (&__a)[_Nm], _Tp (&__b)[_Nm])



    ;

  template<typename _FIter1, typename _FIter2>
    _FIter2
    swap_ranges(_FIter1, _FIter1, _FIter2);



  template<typename _FIter>
    _FIter
    unique(_FIter, _FIter);

  template<typename _FIter, typename _BinaryPredicate>
    _FIter
    unique(_FIter, _FIter, _BinaryPredicate);



  template<typename _FIter, typename _Tp>
    _FIter
    upper_bound(_FIter, _FIter, const _Tp&);

  template<typename _FIter, typename _Tp, typename _Compare>
    _FIter
    upper_bound(_FIter, _FIter, const _Tp&, _Compare);





  template<typename _FIter>
    _FIter
    adjacent_find(_FIter, _FIter);

  template<typename _FIter, typename _BinaryPredicate>
    _FIter
    adjacent_find(_FIter, _FIter, _BinaryPredicate);

  template<typename _IIter, typename _Tp>
    typename iterator_traits<_IIter>::difference_type
    count(_IIter, _IIter, const _Tp&);

  template<typename _IIter, typename _Predicate>
    typename iterator_traits<_IIter>::difference_type
    count_if(_IIter, _IIter, _Predicate);

  template<typename _IIter1, typename _IIter2>
    bool
    equal(_IIter1, _IIter1, _IIter2);

  template<typename _IIter1, typename _IIter2, typename _BinaryPredicate>
    bool
    equal(_IIter1, _IIter1, _IIter2, _BinaryPredicate);

  template<typename _IIter, typename _Tp>
    _IIter
    find(_IIter, _IIter, const _Tp&);

  template<typename _FIter1, typename _FIter2>
    _FIter1
    find_first_of(_FIter1, _FIter1, _FIter2, _FIter2);

  template<typename _FIter1, typename _FIter2, typename _BinaryPredicate>
    _FIter1
    find_first_of(_FIter1, _FIter1, _FIter2, _FIter2, _BinaryPredicate);

  template<typename _IIter, typename _Predicate>
    _IIter
    find_if(_IIter, _IIter, _Predicate);

  template<typename _IIter, typename _Funct>
    _Funct
    for_each(_IIter, _IIter, _Funct);

  template<typename _FIter, typename _Generator>
    void
    generate(_FIter, _FIter, _Generator);

  template<typename _OIter, typename _Size, typename _Generator>
    _OIter
    generate_n(_OIter, _Size, _Generator);

  template<typename _IIter1, typename _IIter2>
    bool
    lexicographical_compare(_IIter1, _IIter1, _IIter2, _IIter2);

  template<typename _IIter1, typename _IIter2, typename _Compare>
    bool
    lexicographical_compare(_IIter1, _IIter1, _IIter2, _IIter2, _Compare);

  template<typename _FIter>
   
    _FIter
    max_element(_FIter, _FIter);

  template<typename _FIter, typename _Compare>
   
    _FIter
    max_element(_FIter, _FIter, _Compare);

  template<typename _IIter1, typename _IIter2, typename _OIter>
    _OIter
    merge(_IIter1, _IIter1, _IIter2, _IIter2, _OIter);

  template<typename _IIter1, typename _IIter2, typename _OIter,
    typename _Compare>
    _OIter
    merge(_IIter1, _IIter1, _IIter2, _IIter2, _OIter, _Compare);

  template<typename _FIter>
   
    _FIter
    min_element(_FIter, _FIter);

  template<typename _FIter, typename _Compare>
   
    _FIter
    min_element(_FIter, _FIter, _Compare);

  template<typename _IIter1, typename _IIter2>
    pair<_IIter1, _IIter2>
    mismatch(_IIter1, _IIter1, _IIter2);

  template<typename _IIter1, typename _IIter2, typename _BinaryPredicate>
    pair<_IIter1, _IIter2>
    mismatch(_IIter1, _IIter1, _IIter2, _BinaryPredicate);

  template<typename _RAIter>
    void
    nth_element(_RAIter, _RAIter, _RAIter);

  template<typename _RAIter, typename _Compare>
    void
    nth_element(_RAIter, _RAIter, _RAIter, _Compare);

  template<typename _RAIter>
    void
    partial_sort(_RAIter, _RAIter, _RAIter);

  template<typename _RAIter, typename _Compare>
    void
    partial_sort(_RAIter, _RAIter, _RAIter, _Compare);

  template<typename _BIter, typename _Predicate>
    _BIter
    partition(_BIter, _BIter, _Predicate);

  template<typename _RAIter>
    void
    random_shuffle(_RAIter, _RAIter);

  template<typename _RAIter, typename _Generator>
    void
    random_shuffle(_RAIter, _RAIter,



     _Generator&);


  template<typename _FIter, typename _Tp>
    void
    replace(_FIter, _FIter, const _Tp&, const _Tp&);

  template<typename _FIter, typename _Predicate, typename _Tp>
    void
    replace_if(_FIter, _FIter, _Predicate, const _Tp&);

  template<typename _FIter1, typename _FIter2>
    _FIter1
    search(_FIter1, _FIter1, _FIter2, _FIter2);

  template<typename _FIter1, typename _FIter2, typename _BinaryPredicate>
    _FIter1
    search(_FIter1, _FIter1, _FIter2, _FIter2, _BinaryPredicate);

  template<typename _FIter, typename _Size, typename _Tp>
    _FIter
    search_n(_FIter, _FIter, _Size, const _Tp&);

  template<typename _FIter, typename _Size, typename _Tp,
    typename _BinaryPredicate>
    _FIter
    search_n(_FIter, _FIter, _Size, const _Tp&, _BinaryPredicate);

  template<typename _IIter1, typename _IIter2, typename _OIter>
    _OIter
    set_difference(_IIter1, _IIter1, _IIter2, _IIter2, _OIter);

  template<typename _IIter1, typename _IIter2, typename _OIter,
    typename _Compare>
    _OIter
    set_difference(_IIter1, _IIter1, _IIter2, _IIter2, _OIter, _Compare);

  template<typename _IIter1, typename _IIter2, typename _OIter>
    _OIter
    set_intersection(_IIter1, _IIter1, _IIter2, _IIter2, _OIter);

  template<typename _IIter1, typename _IIter2, typename _OIter,
    typename _Compare>
    _OIter
    set_intersection(_IIter1, _IIter1, _IIter2, _IIter2, _OIter, _Compare);

  template<typename _IIter1, typename _IIter2, typename _OIter>
    _OIter
    set_symmetric_difference(_IIter1, _IIter1, _IIter2, _IIter2, _OIter);

  template<typename _IIter1, typename _IIter2, typename _OIter,
    typename _Compare>
    _OIter
    set_symmetric_difference(_IIter1, _IIter1, _IIter2, _IIter2,
        _OIter, _Compare);

  template<typename _IIter1, typename _IIter2, typename _OIter>
    _OIter
    set_union(_IIter1, _IIter1, _IIter2, _IIter2, _OIter);

  template<typename _IIter1, typename _IIter2, typename _OIter,
    typename _Compare>
    _OIter
    set_union(_IIter1, _IIter1, _IIter2, _IIter2, _OIter, _Compare);

  template<typename _RAIter>
    void
    sort(_RAIter, _RAIter);

  template<typename _RAIter, typename _Compare>
    void
    sort(_RAIter, _RAIter, _Compare);

  template<typename _RAIter>
    void
    stable_sort(_RAIter, _RAIter);

  template<typename _RAIter, typename _Compare>
    void
    stable_sort(_RAIter, _RAIter, _Compare);

  template<typename _IIter, typename _OIter, typename _UnaryOperation>
    _OIter
    transform(_IIter, _IIter, _OIter, _UnaryOperation);

  template<typename _IIter1, typename _IIter2, typename _OIter,
    typename _BinaryOperation>
    _OIter
    transform(_IIter1, _IIter1, _IIter2, _OIter, _BinaryOperation);

  template<typename _IIter, typename _OIter>
    _OIter
    unique_copy(_IIter, _IIter, _OIter);

  template<typename _IIter, typename _OIter, typename _BinaryPredicate>
    _OIter
    unique_copy(_IIter, _IIter, _OIter, _BinaryPredicate);


}
# 61 "/usr/include/c++/5/bits/stl_algo.h" 2 3
# 1 "/usr/include/c++/5/bits/stl_heap.h" 1 3
# 62 "/usr/include/c++/5/bits/stl_heap.h" 3
namespace std __attribute__ ((__visibility__ ("default")))
{







  template<typename _RandomAccessIterator, typename _Distance,
    typename _Compare>
    _Distance
    __is_heap_until(_RandomAccessIterator __first, _Distance __n,
      _Compare __comp)
    {
      _Distance __parent = 0;
      for (_Distance __child = 1; __child < __n; ++__child)
 {
   if (__comp(__first + __parent, __first + __child))
     return __child;
   if ((__child & 1) == 0)
     ++__parent;
 }
      return __n;
    }



  template<typename _RandomAccessIterator, typename _Distance>
    inline bool
    __is_heap(_RandomAccessIterator __first, _Distance __n)
    {
      return std::__is_heap_until(__first, __n,
   __gnu_cxx::__ops::__iter_less_iter()) == __n;
    }

  template<typename _RandomAccessIterator, typename _Compare,
    typename _Distance>
    inline bool
    __is_heap(_RandomAccessIterator __first, _Compare __comp, _Distance __n)
    {
      return std::__is_heap_until(__first, __n,
 __gnu_cxx::__ops::__iter_comp_iter(__comp)) == __n;
    }

  template<typename _RandomAccessIterator>
    inline bool
    __is_heap(_RandomAccessIterator __first, _RandomAccessIterator __last)
    { return std::__is_heap(__first, std::distance(__first, __last)); }

  template<typename _RandomAccessIterator, typename _Compare>
    inline bool
    __is_heap(_RandomAccessIterator __first, _RandomAccessIterator __last,
       _Compare __comp)
    { return std::__is_heap(__first, __comp, std::distance(__first, __last)); }




  template<typename _RandomAccessIterator, typename _Distance, typename _Tp,
    typename _Compare>
    void
    __push_heap(_RandomAccessIterator __first,
  _Distance __holeIndex, _Distance __topIndex, _Tp __value,
  _Compare __comp)
    {
      _Distance __parent = (__holeIndex - 1) / 2;
      while (__holeIndex > __topIndex && __comp(__first + __parent, __value))
 {
   *(__first + __holeIndex) = (*(__first + __parent));
   __holeIndex = __parent;
   __parent = (__holeIndex - 1) / 2;
 }
      *(__first + __holeIndex) = (__value);
    }
# 148 "/usr/include/c++/5/bits/stl_heap.h" 3
  template<typename _RandomAccessIterator>
    inline void
    push_heap(_RandomAccessIterator __first, _RandomAccessIterator __last)
    {
      typedef typename iterator_traits<_RandomAccessIterator>::value_type
   _ValueType;
      typedef typename iterator_traits<_RandomAccessIterator>::difference_type
   _DistanceType;


     

     
      ;
      ;

      _ValueType __value = (*(__last - 1));
      std::__push_heap(__first, _DistanceType((__last - __first) - 1),
         _DistanceType(0), (__value),
         __gnu_cxx::__ops::__iter_less_val());
    }
# 182 "/usr/include/c++/5/bits/stl_heap.h" 3
  template<typename _RandomAccessIterator, typename _Compare>
    inline void
    push_heap(_RandomAccessIterator __first, _RandomAccessIterator __last,
       _Compare __comp)
    {
      typedef typename iterator_traits<_RandomAccessIterator>::value_type
   _ValueType;
      typedef typename iterator_traits<_RandomAccessIterator>::difference_type
   _DistanceType;


     

      ;
      ;

      _ValueType __value = (*(__last - 1));
      std::__push_heap(__first, _DistanceType((__last - __first) - 1),
         _DistanceType(0), (__value),
         __gnu_cxx::__ops::__iter_comp_val(__comp));
    }

  template<typename _RandomAccessIterator, typename _Distance,
    typename _Tp, typename _Compare>
    void
    __adjust_heap(_RandomAccessIterator __first, _Distance __holeIndex,
    _Distance __len, _Tp __value, _Compare __comp)
    {
      const _Distance __topIndex = __holeIndex;
      _Distance __secondChild = __holeIndex;
      while (__secondChild < (__len - 1) / 2)
 {
   __secondChild = 2 * (__secondChild + 1);
   if (__comp(__first + __secondChild,
       __first + (__secondChild - 1)))
     __secondChild--;
   *(__first + __holeIndex) = (*(__first + __secondChild));
   __holeIndex = __secondChild;
 }
      if ((__len & 1) == 0 && __secondChild == (__len - 2) / 2)
 {
   __secondChild = 2 * (__secondChild + 1);
   *(__first + __holeIndex) = (*(__first + (__secondChild - 1)))
                                  ;
   __holeIndex = __secondChild - 1;
 }
      std::__push_heap(__first, __holeIndex, __topIndex,
         (__value),
         __gnu_cxx::__ops::__iter_comp_val(__comp));
    }

  template<typename _RandomAccessIterator, typename _Compare>
    inline void
    __pop_heap(_RandomAccessIterator __first, _RandomAccessIterator __last,
        _RandomAccessIterator __result, _Compare __comp)
    {
      typedef typename iterator_traits<_RandomAccessIterator>::value_type
 _ValueType;
      typedef typename iterator_traits<_RandomAccessIterator>::difference_type
 _DistanceType;

      _ValueType __value = (*__result);
      *__result = (*__first);
      std::__adjust_heap(__first, _DistanceType(0),
    _DistanceType(__last - __first),
    (__value), __comp);
    }
# 261 "/usr/include/c++/5/bits/stl_heap.h" 3
  template<typename _RandomAccessIterator>
    inline void
    pop_heap(_RandomAccessIterator __first, _RandomAccessIterator __last)
    {
      typedef typename iterator_traits<_RandomAccessIterator>::value_type
 _ValueType;


     

     
      ;
      ;
      ;

      if (__last - __first > 1)
 {
   --__last;
   std::__pop_heap(__first, __last, __last,
     __gnu_cxx::__ops::__iter_less_iter());
 }
    }
# 295 "/usr/include/c++/5/bits/stl_heap.h" 3
  template<typename _RandomAccessIterator, typename _Compare>
    inline void
    pop_heap(_RandomAccessIterator __first,
      _RandomAccessIterator __last, _Compare __comp)
    {

     

      ;
      ;
      ;

      if (__last - __first > 1)
 {
   --__last;
   std::__pop_heap(__first, __last, __last,
     __gnu_cxx::__ops::__iter_comp_iter(__comp));
 }
    }

  template<typename _RandomAccessIterator, typename _Compare>
    void
    __make_heap(_RandomAccessIterator __first, _RandomAccessIterator __last,
  _Compare __comp)
    {
      typedef typename iterator_traits<_RandomAccessIterator>::value_type
   _ValueType;
      typedef typename iterator_traits<_RandomAccessIterator>::difference_type
   _DistanceType;

      if (__last - __first < 2)
 return;

      const _DistanceType __len = __last - __first;
      _DistanceType __parent = (__len - 2) / 2;
      while (true)
 {
   _ValueType __value = (*(__first + __parent));
   std::__adjust_heap(__first, __parent, __len, (__value),
        __comp);
   if (__parent == 0)
     return;
   __parent--;
 }
    }
# 349 "/usr/include/c++/5/bits/stl_heap.h" 3
  template<typename _RandomAccessIterator>
    inline void
    make_heap(_RandomAccessIterator __first, _RandomAccessIterator __last)
    {

     

     

      ;

      std::__make_heap(__first, __last,
         __gnu_cxx::__ops::__iter_less_iter());
    }
# 374 "/usr/include/c++/5/bits/stl_heap.h" 3
  template<typename _RandomAccessIterator, typename _Compare>
    inline void
    make_heap(_RandomAccessIterator __first, _RandomAccessIterator __last,
       _Compare __comp)
    {

     

      ;

      std::__make_heap(__first, __last,
         __gnu_cxx::__ops::__iter_comp_iter(__comp));
    }

  template<typename _RandomAccessIterator, typename _Compare>
    void
    __sort_heap(_RandomAccessIterator __first, _RandomAccessIterator __last,
  _Compare __comp)
    {
      while (__last - __first > 1)
 {
   --__last;
   std::__pop_heap(__first, __last, __last, __comp);
 }
    }
# 408 "/usr/include/c++/5/bits/stl_heap.h" 3
  template<typename _RandomAccessIterator>
    inline void
    sort_heap(_RandomAccessIterator __first, _RandomAccessIterator __last)
    {

     

     

      ;
      ;

      std::__sort_heap(__first, __last,
         __gnu_cxx::__ops::__iter_less_iter());
    }
# 434 "/usr/include/c++/5/bits/stl_heap.h" 3
  template<typename _RandomAccessIterator, typename _Compare>
    inline void
    sort_heap(_RandomAccessIterator __first, _RandomAccessIterator __last,
       _Compare __comp)
    {

     

      ;
      ;

      std::__sort_heap(__first, __last,
         __gnu_cxx::__ops::__iter_comp_iter(__comp));
    }
# 529 "/usr/include/c++/5/bits/stl_heap.h" 3

}
# 62 "/usr/include/c++/5/bits/stl_algo.h" 2 3
# 1 "/usr/include/c++/5/bits/stl_tempbuf.h" 1 3
# 60 "/usr/include/c++/5/bits/stl_tempbuf.h" 3
# 1 "/usr/include/c++/5/bits/stl_construct.h" 1 3
# 63 "/usr/include/c++/5/bits/stl_construct.h" 3
namespace std __attribute__ ((__visibility__ ("default")))
{

# 77 "/usr/include/c++/5/bits/stl_construct.h" 3
  template<typename _T1, typename _T2>
    inline void
    _Construct(_T1* __p, const _T2& __value)
    {


      ::new(static_cast<void*>(__p)) _T1(__value);
    }





  template<typename _Tp>
    inline void
    _Destroy(_Tp* __pointer)
    { __pointer->~_Tp(); }

  template<bool>
    struct _Destroy_aux
    {
      template<typename _ForwardIterator>
        static void
        __destroy(_ForwardIterator __first, _ForwardIterator __last)
 {
   for (; __first != __last; ++__first)
     std::_Destroy(std::__addressof(*__first));
 }
    };

  template<>
    struct _Destroy_aux<true>
    {
      template<typename _ForwardIterator>
        static void
        __destroy(_ForwardIterator, _ForwardIterator) { }
    };






  template<typename _ForwardIterator>
    inline void
    _Destroy(_ForwardIterator __first, _ForwardIterator __last)
    {
      typedef typename iterator_traits<_ForwardIterator>::value_type
                       _Value_type;
      std::_Destroy_aux<__has_trivial_destructor(_Value_type)>::
 __destroy(__first, __last);
    }







  template<typename _ForwardIterator, typename _Allocator>
    void
    _Destroy(_ForwardIterator __first, _ForwardIterator __last,
      _Allocator& __alloc)
    {
      typedef __gnu_cxx::__alloc_traits<_Allocator> __traits;
      for (; __first != __last; ++__first)
 __traits::destroy(__alloc, std::__addressof(*__first));
    }

  template<typename _ForwardIterator, typename _Tp>
    inline void
    _Destroy(_ForwardIterator __first, _ForwardIterator __last,
      allocator<_Tp>&)
    {
      _Destroy(__first, __last);
    }


}
# 61 "/usr/include/c++/5/bits/stl_tempbuf.h" 2 3

namespace std __attribute__ ((__visibility__ ("default")))
{

# 83 "/usr/include/c++/5/bits/stl_tempbuf.h" 3
  template<typename _Tp>
    pair<_Tp*, ptrdiff_t>
    get_temporary_buffer(ptrdiff_t __len)
    {
      const ptrdiff_t __max =
 __gnu_cxx::__numeric_traits<ptrdiff_t>::__max / sizeof(_Tp);
      if (__len > __max)
 __len = __max;

      while (__len > 0)
 {
   _Tp* __tmp = static_cast<_Tp*>(::operator new(__len * sizeof(_Tp),
       std::nothrow));
   if (__tmp != 0)
     return std::pair<_Tp*, ptrdiff_t>(__tmp, __len);
   __len /= 2;
 }
      return std::pair<_Tp*, ptrdiff_t>(static_cast<_Tp*>(0), 0);
    }
# 110 "/usr/include/c++/5/bits/stl_tempbuf.h" 3
  template<typename _Tp>
    inline void
    return_temporary_buffer(_Tp* __p)
    { ::operator delete(__p, std::nothrow); }







  template<typename _ForwardIterator, typename _Tp>
    class _Temporary_buffer
    {

     

    public:
      typedef _Tp value_type;
      typedef value_type* pointer;
      typedef pointer iterator;
      typedef ptrdiff_t size_type;

    protected:
      size_type _M_original_len;
      size_type _M_len;
      pointer _M_buffer;

    public:

      size_type
      size() const
      { return _M_len; }


      size_type
      requested_size() const
      { return _M_original_len; }


      iterator
      begin()
      { return _M_buffer; }


      iterator
      end()
      { return _M_buffer + _M_len; }





      _Temporary_buffer(_ForwardIterator __first, _ForwardIterator __last);

      ~_Temporary_buffer()
      {
 std::_Destroy(_M_buffer, _M_buffer + _M_len);
 std::return_temporary_buffer(_M_buffer);
      }

    private:

      _Temporary_buffer(const _Temporary_buffer&);

      void
      operator=(const _Temporary_buffer&);
    };


  template<bool>
    struct __uninitialized_construct_buf_dispatch
    {
      template<typename _Pointer, typename _ForwardIterator>
        static void
        __ucr(_Pointer __first, _Pointer __last,
       _ForwardIterator __seed)
        {
   if(__first == __last)
     return;

   _Pointer __cur = __first;
   try
     {
       std::_Construct(std::__addressof(*__first),
         (*__seed));
       _Pointer __prev = __cur;
       ++__cur;
       for(; __cur != __last; ++__cur, ++__prev)
  std::_Construct(std::__addressof(*__cur),
    (*__prev));
       *__seed = (*__prev);
     }
   catch(...)
     {
       std::_Destroy(__first, __cur);
       throw;
     }
 }
    };

  template<>
    struct __uninitialized_construct_buf_dispatch<true>
    {
      template<typename _Pointer, typename _ForwardIterator>
        static void
        __ucr(_Pointer, _Pointer, _ForwardIterator) { }
    };
# 229 "/usr/include/c++/5/bits/stl_tempbuf.h" 3
  template<typename _Pointer, typename _ForwardIterator>
    inline void
    __uninitialized_construct_buf(_Pointer __first, _Pointer __last,
      _ForwardIterator __seed)
    {
      typedef typename std::iterator_traits<_Pointer>::value_type
 _ValueType;

      std::__uninitialized_construct_buf_dispatch<
        __has_trivial_constructor(_ValueType)>::
   __ucr(__first, __last, __seed);
    }

  template<typename _ForwardIterator, typename _Tp>
    _Temporary_buffer<_ForwardIterator, _Tp>::
    _Temporary_buffer(_ForwardIterator __first, _ForwardIterator __last)
    : _M_original_len(std::distance(__first, __last)),
      _M_len(0), _M_buffer(0)
    {
      try
 {
   std::pair<pointer, size_type> __p(std::get_temporary_buffer<
         value_type>(_M_original_len));
   _M_buffer = __p.first;
   _M_len = __p.second;
   if (_M_buffer)
     std::__uninitialized_construct_buf(_M_buffer, _M_buffer + _M_len,
            __first);
 }
      catch(...)
 {
   std::return_temporary_buffer(_M_buffer);
   _M_buffer = 0;
   _M_len = 0;
   throw;
 }
    }


}
# 63 "/usr/include/c++/5/bits/stl_algo.h" 2 3
# 71 "/usr/include/c++/5/bits/stl_algo.h" 3
namespace std __attribute__ ((__visibility__ ("default")))
{



  template<typename _Iterator, typename _Compare>
    void
    __move_median_to_first(_Iterator __result,_Iterator __a, _Iterator __b,
      _Iterator __c, _Compare __comp)
    {
      if (__comp(__a, __b))
 {
   if (__comp(__b, __c))
     std::iter_swap(__result, __b);
   else if (__comp(__a, __c))
     std::iter_swap(__result, __c);
   else
     std::iter_swap(__result, __a);
 }
      else if (__comp(__a, __c))
 std::iter_swap(__result, __a);
      else if (__comp(__b, __c))
 std::iter_swap(__result, __c);
      else
 std::iter_swap(__result, __b);
    }


  template<typename _InputIterator, typename _Predicate>
    inline _InputIterator
    __find_if(_InputIterator __first, _InputIterator __last,
       _Predicate __pred, input_iterator_tag)
    {
      while (__first != __last && !__pred(__first))
 ++__first;
      return __first;
    }


  template<typename _RandomAccessIterator, typename _Predicate>
    _RandomAccessIterator
    __find_if(_RandomAccessIterator __first, _RandomAccessIterator __last,
       _Predicate __pred, random_access_iterator_tag)
    {
      typename iterator_traits<_RandomAccessIterator>::difference_type
 __trip_count = (__last - __first) >> 2;

      for (; __trip_count > 0; --__trip_count)
 {
   if (__pred(__first))
     return __first;
   ++__first;

   if (__pred(__first))
     return __first;
   ++__first;

   if (__pred(__first))
     return __first;
   ++__first;

   if (__pred(__first))
     return __first;
   ++__first;
 }

      switch (__last - __first)
 {
 case 3:
   if (__pred(__first))
     return __first;
   ++__first;
 case 2:
   if (__pred(__first))
     return __first;
   ++__first;
 case 1:
   if (__pred(__first))
     return __first;
   ++__first;
 case 0:
 default:
   return __last;
 }
    }

  template<typename _Iterator, typename _Predicate>
    inline _Iterator
    __find_if(_Iterator __first, _Iterator __last, _Predicate __pred)
    {
      return __find_if(__first, __last, __pred,
         std::__iterator_category(__first));
    }


  template<typename _InputIterator, typename _Predicate>
    inline _InputIterator
    __find_if_not(_InputIterator __first, _InputIterator __last,
    _Predicate __pred)
    {
      return std::__find_if(__first, __last,
       __gnu_cxx::__ops::__negate(__pred),
       std::__iterator_category(__first));
    }




  template<typename _InputIterator, typename _Predicate, typename _Distance>
    _InputIterator
    __find_if_not_n(_InputIterator __first, _Distance& __len, _Predicate __pred)
    {
      for (; __len; --__len, ++__first)
 if (!__pred(__first))
   break;
      return __first;
    }
# 202 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _ForwardIterator1, typename _ForwardIterator2,
    typename _BinaryPredicate>
    _ForwardIterator1
    __search(_ForwardIterator1 __first1, _ForwardIterator1 __last1,
      _ForwardIterator2 __first2, _ForwardIterator2 __last2,
      _BinaryPredicate __predicate)
    {

      if (__first1 == __last1 || __first2 == __last2)
 return __first1;


      _ForwardIterator2 __p1(__first2);
      if (++__p1 == __last2)
 return std::__find_if(__first1, __last1,
  __gnu_cxx::__ops::__iter_comp_iter(__predicate, __first2));


      _ForwardIterator2 __p;
      _ForwardIterator1 __current = __first1;

      for (;;)
 {
   __first1 =
     std::__find_if(__first1, __last1,
  __gnu_cxx::__ops::__iter_comp_iter(__predicate, __first2));

   if (__first1 == __last1)
     return __last1;

   __p = __p1;
   __current = __first1;
   if (++__current == __last1)
     return __last1;

   while (__predicate(__current, __p))
     {
       if (++__p == __last2)
  return __first1;
       if (++__current == __last1)
  return __last1;
     }
   ++__first1;
 }
      return __first1;
    }






  template<typename _ForwardIterator, typename _Integer,
    typename _UnaryPredicate>
    _ForwardIterator
    __search_n_aux(_ForwardIterator __first, _ForwardIterator __last,
     _Integer __count, _UnaryPredicate __unary_pred,
     std::forward_iterator_tag)
    {
      __first = std::__find_if(__first, __last, __unary_pred);
      while (__first != __last)
 {
   typename iterator_traits<_ForwardIterator>::difference_type
     __n = __count;
   _ForwardIterator __i = __first;
   ++__i;
   while (__i != __last && __n != 1 && __unary_pred(__i))
     {
       ++__i;
       --__n;
     }
   if (__n == 1)
     return __first;
   if (__i == __last)
     return __last;
   __first = std::__find_if(++__i, __last, __unary_pred);
 }
      return __last;
    }





  template<typename _RandomAccessIter, typename _Integer,
    typename _UnaryPredicate>
    _RandomAccessIter
    __search_n_aux(_RandomAccessIter __first, _RandomAccessIter __last,
     _Integer __count, _UnaryPredicate __unary_pred,
     std::random_access_iterator_tag)
    {
      typedef typename std::iterator_traits<_RandomAccessIter>::difference_type
 _DistanceType;

      _DistanceType __tailSize = __last - __first;
      _DistanceType __remainder = __count;

      while (__remainder <= __tailSize)
 {
   __first += __remainder;
   __tailSize -= __remainder;


   _RandomAccessIter __backTrack = __first;
   while (__unary_pred(--__backTrack))
     {
       if (--__remainder == 0)
         return (__first - __count);
     }
   __remainder = __count + 1 - (__first - __backTrack);
 }
      return __last;
    }

  template<typename _ForwardIterator, typename _Integer,
           typename _UnaryPredicate>
    _ForwardIterator
    __search_n(_ForwardIterator __first, _ForwardIterator __last,
        _Integer __count,
        _UnaryPredicate __unary_pred)
    {
      if (__count <= 0)
 return __first;

      if (__count == 1)
 return std::__find_if(__first, __last, __unary_pred);

      return std::__search_n_aux(__first, __last, __count, __unary_pred,
     std::__iterator_category(__first));
    }


  template<typename _ForwardIterator1, typename _ForwardIterator2,
    typename _BinaryPredicate>
    _ForwardIterator1
    __find_end(_ForwardIterator1 __first1, _ForwardIterator1 __last1,
        _ForwardIterator2 __first2, _ForwardIterator2 __last2,
        forward_iterator_tag, forward_iterator_tag,
        _BinaryPredicate __comp)
    {
      if (__first2 == __last2)
 return __last1;

      _ForwardIterator1 __result = __last1;
      while (1)
 {
   _ForwardIterator1 __new_result
     = std::__search(__first1, __last1, __first2, __last2, __comp);
   if (__new_result == __last1)
     return __result;
   else
     {
       __result = __new_result;
       __first1 = __new_result;
       ++__first1;
     }
 }
    }


  template<typename _BidirectionalIterator1, typename _BidirectionalIterator2,
    typename _BinaryPredicate>
    _BidirectionalIterator1
    __find_end(_BidirectionalIterator1 __first1,
        _BidirectionalIterator1 __last1,
        _BidirectionalIterator2 __first2,
        _BidirectionalIterator2 __last2,
        bidirectional_iterator_tag, bidirectional_iterator_tag,
        _BinaryPredicate __comp)
    {

     

     


      typedef reverse_iterator<_BidirectionalIterator1> _RevIterator1;
      typedef reverse_iterator<_BidirectionalIterator2> _RevIterator2;

      _RevIterator1 __rlast1(__first1);
      _RevIterator2 __rlast2(__first2);
      _RevIterator1 __rresult = std::__search(_RevIterator1(__last1), __rlast1,
           _RevIterator2(__last2), __rlast2,
           __comp);

      if (__rresult == __rlast1)
 return __last1;
      else
 {
   _BidirectionalIterator1 __result = __rresult.base();
   std::advance(__result, -std::distance(__first2, __last2));
   return __result;
 }
    }
# 423 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _ForwardIterator1, typename _ForwardIterator2>
    inline _ForwardIterator1
    find_end(_ForwardIterator1 __first1, _ForwardIterator1 __last1,
      _ForwardIterator2 __first2, _ForwardIterator2 __last2)
    {

     
     
     


      ;
      ;

      return std::__find_end(__first1, __last1, __first2, __last2,
        std::__iterator_category(__first1),
        std::__iterator_category(__first2),
        __gnu_cxx::__ops::__iter_equal_to_iter());
    }
# 471 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _ForwardIterator1, typename _ForwardIterator2,
    typename _BinaryPredicate>
    inline _ForwardIterator1
    find_end(_ForwardIterator1 __first1, _ForwardIterator1 __last1,
      _ForwardIterator2 __first2, _ForwardIterator2 __last2,
      _BinaryPredicate __comp)
    {

     
     
     


      ;
      ;

      return std::__find_end(__first1, __last1, __first2, __last2,
        std::__iterator_category(__first1),
        std::__iterator_category(__first2),
        __gnu_cxx::__ops::__iter_comp_iter(__comp));
    }
# 636 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _InputIterator, typename _OutputIterator,
    typename _Predicate>
    _OutputIterator
    __remove_copy_if(_InputIterator __first, _InputIterator __last,
       _OutputIterator __result, _Predicate __pred)
    {
      for (; __first != __last; ++__first)
 if (!__pred(__first))
   {
     *__result = *__first;
     ++__result;
   }
      return __result;
    }
# 665 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _InputIterator, typename _OutputIterator, typename _Tp>
    inline _OutputIterator
    remove_copy(_InputIterator __first, _InputIterator __last,
  _OutputIterator __result, const _Tp& __value)
    {

     
     

     

      ;

      return std::__remove_copy_if(__first, __last, __result,
 __gnu_cxx::__ops::__iter_equals_val(__value));
    }
# 697 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _InputIterator, typename _OutputIterator,
    typename _Predicate>
    inline _OutputIterator
    remove_copy_if(_InputIterator __first, _InputIterator __last,
     _OutputIterator __result, _Predicate __pred)
    {

     
     

     

      ;

      return std::__remove_copy_if(__first, __last, __result,
       __gnu_cxx::__ops::__pred_iter(__pred));
    }
# 855 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _ForwardIterator, typename _Predicate>
    _ForwardIterator
    __remove_if(_ForwardIterator __first, _ForwardIterator __last,
  _Predicate __pred)
    {
      __first = std::__find_if(__first, __last, __pred);
      if (__first == __last)
        return __first;
      _ForwardIterator __result = __first;
      ++__first;
      for (; __first != __last; ++__first)
        if (!__pred(__first))
          {
            *__result = (*__first);
            ++__result;
          }
      return __result;
    }
# 891 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _ForwardIterator, typename _Tp>
    inline _ForwardIterator
    remove(_ForwardIterator __first, _ForwardIterator __last,
    const _Tp& __value)
    {

     

     

      ;

      return std::__remove_if(__first, __last,
  __gnu_cxx::__ops::__iter_equals_val(__value));
    }
# 924 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _ForwardIterator, typename _Predicate>
    inline _ForwardIterator
    remove_if(_ForwardIterator __first, _ForwardIterator __last,
       _Predicate __pred)
    {

     

     

      ;

      return std::__remove_if(__first, __last,
         __gnu_cxx::__ops::__pred_iter(__pred));
    }

  template<typename _ForwardIterator, typename _BinaryPredicate>
    _ForwardIterator
    __adjacent_find(_ForwardIterator __first, _ForwardIterator __last,
      _BinaryPredicate __binary_pred)
    {
      if (__first == __last)
 return __last;
      _ForwardIterator __next = __first;
      while (++__next != __last)
 {
   if (__binary_pred(__first, __next))
     return __first;
   __first = __next;
 }
      return __last;
    }

  template<typename _ForwardIterator, typename _BinaryPredicate>
    _ForwardIterator
    __unique(_ForwardIterator __first, _ForwardIterator __last,
      _BinaryPredicate __binary_pred)
    {

      __first = std::__adjacent_find(__first, __last, __binary_pred);
      if (__first == __last)
 return __last;


      _ForwardIterator __dest = __first;
      ++__first;
      while (++__first != __last)
 if (!__binary_pred(__dest, __first))
   *++__dest = (*__first);
      return ++__dest;
    }
# 990 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _ForwardIterator>
    inline _ForwardIterator
    unique(_ForwardIterator __first, _ForwardIterator __last)
    {

     

     

      ;

      return std::__unique(__first, __last,
      __gnu_cxx::__ops::__iter_equal_to_iter());
    }
# 1020 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _ForwardIterator, typename _BinaryPredicate>
    inline _ForwardIterator
    unique(_ForwardIterator __first, _ForwardIterator __last,
           _BinaryPredicate __binary_pred)
    {

     

     


      ;

      return std::__unique(__first, __last,
      __gnu_cxx::__ops::__iter_comp_iter(__binary_pred));
    }







  template<typename _ForwardIterator, typename _OutputIterator,
    typename _BinaryPredicate>
    _OutputIterator
    __unique_copy(_ForwardIterator __first, _ForwardIterator __last,
    _OutputIterator __result, _BinaryPredicate __binary_pred,
    forward_iterator_tag, output_iterator_tag)
    {

     



      _ForwardIterator __next = __first;
      *__result = *__first;
      while (++__next != __last)
 if (!__binary_pred(__first, __next))
   {
     __first = __next;
     *++__result = *__first;
   }
      return ++__result;
    }







  template<typename _InputIterator, typename _OutputIterator,
    typename _BinaryPredicate>
    _OutputIterator
    __unique_copy(_InputIterator __first, _InputIterator __last,
    _OutputIterator __result, _BinaryPredicate __binary_pred,
    input_iterator_tag, output_iterator_tag)
    {

     



      typename iterator_traits<_InputIterator>::value_type __value = *__first;
      __decltype(__gnu_cxx::__ops::__iter_comp_val(__binary_pred))
 __rebound_pred
 = __gnu_cxx::__ops::__iter_comp_val(__binary_pred);
      *__result = __value;
      while (++__first != __last)
 if (!__rebound_pred(__first, __value))
   {
     __value = *__first;
     *++__result = __value;
   }
      return ++__result;
    }







  template<typename _InputIterator, typename _ForwardIterator,
    typename _BinaryPredicate>
    _ForwardIterator
    __unique_copy(_InputIterator __first, _InputIterator __last,
    _ForwardIterator __result, _BinaryPredicate __binary_pred,
    input_iterator_tag, forward_iterator_tag)
    {

     


      *__result = *__first;
      while (++__first != __last)
 if (!__binary_pred(__result, __first))
   *++__result = *__first;
      return ++__result;
    }






  template<typename _BidirectionalIterator>
    void
    __reverse(_BidirectionalIterator __first, _BidirectionalIterator __last,
       bidirectional_iterator_tag)
    {
      while (true)
 if (__first == __last || __first == --__last)
   return;
 else
   {
     std::iter_swap(__first, __last);
     ++__first;
   }
    }






  template<typename _RandomAccessIterator>
    void
    __reverse(_RandomAccessIterator __first, _RandomAccessIterator __last,
       random_access_iterator_tag)
    {
      if (__first == __last)
 return;
      --__last;
      while (__first < __last)
 {
   std::iter_swap(__first, __last);
   ++__first;
   --__last;
 }
    }
# 1175 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _BidirectionalIterator>
    inline void
    reverse(_BidirectionalIterator __first, _BidirectionalIterator __last)
    {

     

      ;
      std::__reverse(__first, __last, std::__iterator_category(__first));
    }
# 1202 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _BidirectionalIterator, typename _OutputIterator>
    _OutputIterator
    reverse_copy(_BidirectionalIterator __first, _BidirectionalIterator __last,
   _OutputIterator __result)
    {

     

     

      ;

      while (__first != __last)
 {
   --__last;
   *__result = *__last;
   ++__result;
 }
      return __result;
    }





  template<typename _EuclideanRingElement>
    _EuclideanRingElement
    __gcd(_EuclideanRingElement __m, _EuclideanRingElement __n)
    {
      while (__n != 0)
 {
   _EuclideanRingElement __t = __m % __n;
   __m = __n;
   __n = __t;
 }
      return __m;
    }

  inline namespace _V2
  {


  template<typename _ForwardIterator>
    _ForwardIterator
    __rotate(_ForwardIterator __first,
      _ForwardIterator __middle,
      _ForwardIterator __last,
      forward_iterator_tag)
    {
      if (__first == __middle)
 return __last;
      else if (__last == __middle)
 return __first;

      _ForwardIterator __first2 = __middle;
      do
 {
   std::iter_swap(__first, __first2);
   ++__first;
   ++__first2;
   if (__first == __middle)
     __middle = __first2;
 }
      while (__first2 != __last);

      _ForwardIterator __ret = __first;

      __first2 = __middle;

      while (__first2 != __last)
 {
   std::iter_swap(__first, __first2);
   ++__first;
   ++__first2;
   if (__first == __middle)
     __middle = __first2;
   else if (__first2 == __last)
     __first2 = __middle;
 }
      return __ret;
    }


  template<typename _BidirectionalIterator>
    _BidirectionalIterator
    __rotate(_BidirectionalIterator __first,
      _BidirectionalIterator __middle,
      _BidirectionalIterator __last,
       bidirectional_iterator_tag)
    {

     


      if (__first == __middle)
 return __last;
      else if (__last == __middle)
 return __first;

      std::__reverse(__first, __middle, bidirectional_iterator_tag());
      std::__reverse(__middle, __last, bidirectional_iterator_tag());

      while (__first != __middle && __middle != __last)
 {
   std::iter_swap(__first, --__last);
   ++__first;
 }

      if (__first == __middle)
 {
   std::__reverse(__middle, __last, bidirectional_iterator_tag());
   return __last;
 }
      else
 {
   std::__reverse(__first, __middle, bidirectional_iterator_tag());
   return __first;
 }
    }


  template<typename _RandomAccessIterator>
    _RandomAccessIterator
    __rotate(_RandomAccessIterator __first,
      _RandomAccessIterator __middle,
      _RandomAccessIterator __last,
      random_access_iterator_tag)
    {

     


      if (__first == __middle)
 return __last;
      else if (__last == __middle)
 return __first;

      typedef typename iterator_traits<_RandomAccessIterator>::difference_type
 _Distance;
      typedef typename iterator_traits<_RandomAccessIterator>::value_type
 _ValueType;

      _Distance __n = __last - __first;
      _Distance __k = __middle - __first;

      if (__k == __n - __k)
 {
   std::swap_ranges(__first, __middle, __middle);
   return __middle;
 }

      _RandomAccessIterator __p = __first;
      _RandomAccessIterator __ret = __first + (__last - __middle);

      for (;;)
 {
   if (__k < __n - __k)
     {
       if (__is_pod(_ValueType) && __k == 1)
  {
    _ValueType __t = (*__p);
    std::copy(__p + 1, __p + __n, __p);
    *(__p + __n - 1) = (__t);
    return __ret;
  }
       _RandomAccessIterator __q = __p + __k;
       for (_Distance __i = 0; __i < __n - __k; ++ __i)
  {
    std::iter_swap(__p, __q);
    ++__p;
    ++__q;
  }
       __n %= __k;
       if (__n == 0)
  return __ret;
       std::swap(__n, __k);
       __k = __n - __k;
     }
   else
     {
       __k = __n - __k;
       if (__is_pod(_ValueType) && __k == 1)
  {
    _ValueType __t = (*(__p + __n - 1));
    std::copy_backward(__p, __p + __n - 1, __p + __n);
    *__p = (__t);
    return __ret;
  }
       _RandomAccessIterator __q = __p + __n;
       __p = __q - __k;
       for (_Distance __i = 0; __i < __n - __k; ++ __i)
  {
    --__p;
    --__q;
    std::iter_swap(__p, __q);
  }
       __n %= __k;
       if (__n == 0)
  return __ret;
       std::swap(__n, __k);
     }
 }
    }
# 1429 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _ForwardIterator>
    inline _ForwardIterator
    rotate(_ForwardIterator __first, _ForwardIterator __middle,
    _ForwardIterator __last)
    {

     

      ;
      ;

      return std::__rotate(__first, __middle, __last,
      std::__iterator_category(__first));
    }

  }
# 1466 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _ForwardIterator, typename _OutputIterator>
    inline _OutputIterator
    rotate_copy(_ForwardIterator __first, _ForwardIterator __middle,
                _ForwardIterator __last, _OutputIterator __result)
    {

     
     

      ;
      ;

      return std::copy(__first, __middle,
                       std::copy(__middle, __last, __result));
    }


  template<typename _ForwardIterator, typename _Predicate>
    _ForwardIterator
    __partition(_ForwardIterator __first, _ForwardIterator __last,
  _Predicate __pred, forward_iterator_tag)
    {
      if (__first == __last)
 return __first;

      while (__pred(*__first))
 if (++__first == __last)
   return __first;

      _ForwardIterator __next = __first;

      while (++__next != __last)
 if (__pred(*__next))
   {
     std::iter_swap(__first, __next);
     ++__first;
   }

      return __first;
    }


  template<typename _BidirectionalIterator, typename _Predicate>
    _BidirectionalIterator
    __partition(_BidirectionalIterator __first, _BidirectionalIterator __last,
  _Predicate __pred, bidirectional_iterator_tag)
    {
      while (true)
 {
   while (true)
     if (__first == __last)
       return __first;
     else if (__pred(*__first))
       ++__first;
     else
       break;
   --__last;
   while (true)
     if (__first == __last)
       return __first;
     else if (!bool(__pred(*__last)))
       --__last;
     else
       break;
   std::iter_swap(__first, __last);
   ++__first;
 }
    }
# 1543 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _ForwardIterator, typename _Pointer, typename _Predicate,
    typename _Distance>
    _ForwardIterator
    __stable_partition_adaptive(_ForwardIterator __first,
    _ForwardIterator __last,
    _Predicate __pred, _Distance __len,
    _Pointer __buffer,
    _Distance __buffer_size)
    {
      if (__len == 1)
 return __first;

      if (__len <= __buffer_size)
 {
   _ForwardIterator __result1 = __first;
   _Pointer __result2 = __buffer;




   *__result2 = (*__first);
   ++__result2;
   ++__first;
   for (; __first != __last; ++__first)
     if (__pred(__first))
       {
  *__result1 = (*__first);
  ++__result1;
       }
     else
       {
  *__result2 = (*__first);
  ++__result2;
       }

   std::copy(__buffer, __result2, __result1);
   return __result1;
 }

      _ForwardIterator __middle = __first;
      std::advance(__middle, __len / 2);
      _ForwardIterator __left_split =
 std::__stable_partition_adaptive(__first, __middle, __pred,
      __len / 2, __buffer,
      __buffer_size);



      _Distance __right_len = __len - __len / 2;
      _ForwardIterator __right_split =
 std::__find_if_not_n(__middle, __right_len, __pred);

      if (__right_len)
 __right_split =
   std::__stable_partition_adaptive(__right_split, __last, __pred,
        __right_len,
        __buffer, __buffer_size);

      std::rotate(__left_split, __middle, __right_split);
      std::advance(__left_split, std::distance(__middle, __right_split));
      return __left_split;
    }

  template<typename _ForwardIterator, typename _Predicate>
    _ForwardIterator
    __stable_partition(_ForwardIterator __first, _ForwardIterator __last,
         _Predicate __pred)
    {
      __first = std::__find_if_not(__first, __last, __pred);

      if (__first == __last)
 return __first;

      typedef typename iterator_traits<_ForwardIterator>::value_type
 _ValueType;
      typedef typename iterator_traits<_ForwardIterator>::difference_type
 _DistanceType;

      _Temporary_buffer<_ForwardIterator, _ValueType> __buf(__first, __last);
      return
 std::__stable_partition_adaptive(__first, __last, __pred,
      _DistanceType(__buf.requested_size()),
      __buf.begin(),
      _DistanceType(__buf.size()));
    }
# 1646 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _ForwardIterator, typename _Predicate>
    inline _ForwardIterator
    stable_partition(_ForwardIterator __first, _ForwardIterator __last,
       _Predicate __pred)
    {

     

     

      ;

      return std::__stable_partition(__first, __last,
         __gnu_cxx::__ops::__pred_iter(__pred));
    }


  template<typename _RandomAccessIterator, typename _Compare>
    void
    __heap_select(_RandomAccessIterator __first,
    _RandomAccessIterator __middle,
    _RandomAccessIterator __last, _Compare __comp)
    {
      std::__make_heap(__first, __middle, __comp);
      for (_RandomAccessIterator __i = __middle; __i < __last; ++__i)
 if (__comp(__i, __first))
   std::__pop_heap(__first, __middle, __i, __comp);
    }



  template<typename _InputIterator, typename _RandomAccessIterator,
    typename _Compare>
    _RandomAccessIterator
    __partial_sort_copy(_InputIterator __first, _InputIterator __last,
   _RandomAccessIterator __result_first,
   _RandomAccessIterator __result_last,
   _Compare __comp)
    {
      typedef typename iterator_traits<_InputIterator>::value_type
 _InputValueType;
      typedef iterator_traits<_RandomAccessIterator> _RItTraits;
      typedef typename _RItTraits::difference_type _DistanceType;

      if (__result_first == __result_last)
 return __result_last;
      _RandomAccessIterator __result_real_last = __result_first;
      while (__first != __last && __result_real_last != __result_last)
 {
   *__result_real_last = *__first;
   ++__result_real_last;
   ++__first;
 }

      std::__make_heap(__result_first, __result_real_last, __comp);
      while (__first != __last)
 {
   if (__comp(__first, __result_first))
     std::__adjust_heap(__result_first, _DistanceType(0),
          _DistanceType(__result_real_last
          - __result_first),
          _InputValueType(*__first), __comp);
   ++__first;
 }
      std::__sort_heap(__result_first, __result_real_last, __comp);
      return __result_real_last;
    }
# 1732 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _InputIterator, typename _RandomAccessIterator>
    inline _RandomAccessIterator
    partial_sort_copy(_InputIterator __first, _InputIterator __last,
        _RandomAccessIterator __result_first,
        _RandomAccessIterator __result_last)
    {
      typedef typename iterator_traits<_InputIterator>::value_type
 _InputValueType;
      typedef typename iterator_traits<_RandomAccessIterator>::value_type
 _OutputValueType;
      typedef typename iterator_traits<_RandomAccessIterator>::difference_type
 _DistanceType;


     
     

     

     
      ;
      ;

      return std::__partial_sort_copy(__first, __last,
          __result_first, __result_last,
          __gnu_cxx::__ops::__iter_less_iter());
    }
# 1780 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _InputIterator, typename _RandomAccessIterator,
    typename _Compare>
    inline _RandomAccessIterator
    partial_sort_copy(_InputIterator __first, _InputIterator __last,
        _RandomAccessIterator __result_first,
        _RandomAccessIterator __result_last,
        _Compare __comp)
    {
      typedef typename iterator_traits<_InputIterator>::value_type
 _InputValueType;
      typedef typename iterator_traits<_RandomAccessIterator>::value_type
 _OutputValueType;
      typedef typename iterator_traits<_RandomAccessIterator>::difference_type
 _DistanceType;


     
     

     

     

     

      ;
      ;

      return std::__partial_sort_copy(__first, __last,
          __result_first, __result_last,
    __gnu_cxx::__ops::__iter_comp_iter(__comp));
    }


  template<typename _RandomAccessIterator, typename _Compare>
    void
    __unguarded_linear_insert(_RandomAccessIterator __last,
         _Compare __comp)
    {
      typename iterator_traits<_RandomAccessIterator>::value_type
 __val = (*__last);
      _RandomAccessIterator __next = __last;
      --__next;
      while (__comp(__val, __next))
 {
   *__last = (*__next);
   __last = __next;
   --__next;
 }
      *__last = (__val);
    }


  template<typename _RandomAccessIterator, typename _Compare>
    void
    __insertion_sort(_RandomAccessIterator __first,
       _RandomAccessIterator __last, _Compare __comp)
    {
      if (__first == __last) return;

      for (_RandomAccessIterator __i = __first + 1; __i != __last; ++__i)
 {
   if (__comp(__i, __first))
     {
       typename iterator_traits<_RandomAccessIterator>::value_type
  __val = (*__i);
       std::copy_backward(__first, __i, __i + 1);
       *__first = (__val);
     }
   else
     std::__unguarded_linear_insert(__i,
    __gnu_cxx::__ops::__val_comp_iter(__comp));
 }
    }


  template<typename _RandomAccessIterator, typename _Compare>
    inline void
    __unguarded_insertion_sort(_RandomAccessIterator __first,
          _RandomAccessIterator __last, _Compare __comp)
    {
      for (_RandomAccessIterator __i = __first; __i != __last; ++__i)
 std::__unguarded_linear_insert(__i,
    __gnu_cxx::__ops::__val_comp_iter(__comp));
    }





  enum { _S_threshold = 16 };


  template<typename _RandomAccessIterator, typename _Compare>
    void
    __final_insertion_sort(_RandomAccessIterator __first,
      _RandomAccessIterator __last, _Compare __comp)
    {
      if (__last - __first > int(_S_threshold))
 {
   std::__insertion_sort(__first, __first + int(_S_threshold), __comp);
   std::__unguarded_insertion_sort(__first + int(_S_threshold), __last,
       __comp);
 }
      else
 std::__insertion_sort(__first, __last, __comp);
    }


  template<typename _RandomAccessIterator, typename _Compare>
    _RandomAccessIterator
    __unguarded_partition(_RandomAccessIterator __first,
     _RandomAccessIterator __last,
     _RandomAccessIterator __pivot, _Compare __comp)
    {
      while (true)
 {
   while (__comp(__first, __pivot))
     ++__first;
   --__last;
   while (__comp(__pivot, __last))
     --__last;
   if (!(__first < __last))
     return __first;
   std::iter_swap(__first, __last);
   ++__first;
 }
    }


  template<typename _RandomAccessIterator, typename _Compare>
    inline _RandomAccessIterator
    __unguarded_partition_pivot(_RandomAccessIterator __first,
    _RandomAccessIterator __last, _Compare __comp)
    {
      _RandomAccessIterator __mid = __first + (__last - __first) / 2;
      std::__move_median_to_first(__first, __first + 1, __mid, __last - 1,
      __comp);
      return std::__unguarded_partition(__first + 1, __last, __first, __comp);
    }

  template<typename _RandomAccessIterator, typename _Compare>
    inline void
    __partial_sort(_RandomAccessIterator __first,
     _RandomAccessIterator __middle,
     _RandomAccessIterator __last,
     _Compare __comp)
    {
      std::__heap_select(__first, __middle, __last, __comp);
      std::__sort_heap(__first, __middle, __comp);
    }


  template<typename _RandomAccessIterator, typename _Size, typename _Compare>
    void
    __introsort_loop(_RandomAccessIterator __first,
       _RandomAccessIterator __last,
       _Size __depth_limit, _Compare __comp)
    {
      while (__last - __first > int(_S_threshold))
 {
   if (__depth_limit == 0)
     {
       std::__partial_sort(__first, __last, __last, __comp);
       return;
     }
   --__depth_limit;
   _RandomAccessIterator __cut =
     std::__unguarded_partition_pivot(__first, __last, __comp);
   std::__introsort_loop(__cut, __last, __depth_limit, __comp);
   __last = __cut;
 }
    }



  template<typename _RandomAccessIterator, typename _Compare>
    inline void
    __sort(_RandomAccessIterator __first, _RandomAccessIterator __last,
    _Compare __comp)
    {
      if (__first != __last)
 {
   std::__introsort_loop(__first, __last,
    std::__lg(__last - __first) * 2,
    __comp);
   std::__final_insertion_sort(__first, __last, __comp);
 }
    }

  template<typename _RandomAccessIterator, typename _Size, typename _Compare>
    void
    __introselect(_RandomAccessIterator __first, _RandomAccessIterator __nth,
    _RandomAccessIterator __last, _Size __depth_limit,
    _Compare __comp)
    {
      while (__last - __first > 3)
 {
   if (__depth_limit == 0)
     {
       std::__heap_select(__first, __nth + 1, __last, __comp);

       std::iter_swap(__first, __nth);
       return;
     }
   --__depth_limit;
   _RandomAccessIterator __cut =
     std::__unguarded_partition_pivot(__first, __last, __comp);
   if (__cut <= __nth)
     __first = __cut;
   else
     __last = __cut;
 }
      std::__insertion_sort(__first, __last, __comp);
    }
# 2016 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _ForwardIterator, typename _Tp, typename _Compare>
    inline _ForwardIterator
    lower_bound(_ForwardIterator __first, _ForwardIterator __last,
  const _Tp& __val, _Compare __comp)
    {
      typedef typename iterator_traits<_ForwardIterator>::value_type
 _ValueType;


     
     

     
                    ;

      return std::__lower_bound(__first, __last, __val,
    __gnu_cxx::__ops::__iter_comp_val(__comp));
    }

  template<typename _ForwardIterator, typename _Tp, typename _Compare>
    _ForwardIterator
    __upper_bound(_ForwardIterator __first, _ForwardIterator __last,
    const _Tp& __val, _Compare __comp)
    {
      typedef typename iterator_traits<_ForwardIterator>::difference_type
 _DistanceType;

      _DistanceType __len = std::distance(__first, __last);

      while (__len > 0)
 {
   _DistanceType __half = __len >> 1;
   _ForwardIterator __middle = __first;
   std::advance(__middle, __half);
   if (__comp(__val, __middle))
     __len = __half;
   else
     {
       __first = __middle;
       ++__first;
       __len = __len - __half - 1;
     }
 }
      return __first;
    }
# 2073 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _ForwardIterator, typename _Tp>
    inline _ForwardIterator
    upper_bound(_ForwardIterator __first, _ForwardIterator __last,
  const _Tp& __val)
    {
      typedef typename iterator_traits<_ForwardIterator>::value_type
 _ValueType;


     
     
      ;

      return std::__upper_bound(__first, __last, __val,
    __gnu_cxx::__ops::__val_less_iter());
    }
# 2105 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _ForwardIterator, typename _Tp, typename _Compare>
    inline _ForwardIterator
    upper_bound(_ForwardIterator __first, _ForwardIterator __last,
  const _Tp& __val, _Compare __comp)
    {
      typedef typename iterator_traits<_ForwardIterator>::value_type
 _ValueType;


     
     

     
                    ;

      return std::__upper_bound(__first, __last, __val,
    __gnu_cxx::__ops::__val_comp_iter(__comp));
    }

  template<typename _ForwardIterator, typename _Tp,
    typename _CompareItTp, typename _CompareTpIt>
    pair<_ForwardIterator, _ForwardIterator>
    __equal_range(_ForwardIterator __first, _ForwardIterator __last,
    const _Tp& __val,
    _CompareItTp __comp_it_val, _CompareTpIt __comp_val_it)
    {
      typedef typename iterator_traits<_ForwardIterator>::difference_type
 _DistanceType;

      _DistanceType __len = std::distance(__first, __last);

      while (__len > 0)
 {
   _DistanceType __half = __len >> 1;
   _ForwardIterator __middle = __first;
   std::advance(__middle, __half);
   if (__comp_it_val(__middle, __val))
     {
       __first = __middle;
       ++__first;
       __len = __len - __half - 1;
     }
   else if (__comp_val_it(__val, __middle))
     __len = __half;
   else
     {
       _ForwardIterator __left
  = std::__lower_bound(__first, __middle, __val, __comp_it_val);
       std::advance(__first, __len);
       _ForwardIterator __right
  = std::__upper_bound(++__middle, __first, __val, __comp_val_it);
       return pair<_ForwardIterator, _ForwardIterator>(__left, __right);
     }
 }
      return pair<_ForwardIterator, _ForwardIterator>(__first, __first);
    }
# 2179 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _ForwardIterator, typename _Tp>
    inline pair<_ForwardIterator, _ForwardIterator>
    equal_range(_ForwardIterator __first, _ForwardIterator __last,
  const _Tp& __val)
    {
      typedef typename iterator_traits<_ForwardIterator>::value_type
 _ValueType;


     
     
     
      ;
      ;

      return std::__equal_range(__first, __last, __val,
    __gnu_cxx::__ops::__iter_less_val(),
    __gnu_cxx::__ops::__val_less_iter());
    }
# 2216 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _ForwardIterator, typename _Tp, typename _Compare>
    inline pair<_ForwardIterator, _ForwardIterator>
    equal_range(_ForwardIterator __first, _ForwardIterator __last,
  const _Tp& __val, _Compare __comp)
    {
      typedef typename iterator_traits<_ForwardIterator>::value_type
 _ValueType;


     
     

     

     
                    ;
     
                    ;

      return std::__equal_range(__first, __last, __val,
    __gnu_cxx::__ops::__iter_comp_val(__comp),
    __gnu_cxx::__ops::__val_comp_iter(__comp));
    }
# 2252 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _ForwardIterator, typename _Tp>
    bool
    binary_search(_ForwardIterator __first, _ForwardIterator __last,
                  const _Tp& __val)
    {
      typedef typename iterator_traits<_ForwardIterator>::value_type
 _ValueType;


     
     
      ;
      ;

      _ForwardIterator __i
 = std::__lower_bound(__first, __last, __val,
        __gnu_cxx::__ops::__iter_less_val());
      return __i != __last && !(__val < *__i);
    }
# 2287 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _ForwardIterator, typename _Tp, typename _Compare>
    bool
    binary_search(_ForwardIterator __first, _ForwardIterator __last,
                  const _Tp& __val, _Compare __comp)
    {
      typedef typename iterator_traits<_ForwardIterator>::value_type
 _ValueType;


     
     

     
                    ;
     
                    ;

      _ForwardIterator __i
 = std::__lower_bound(__first, __last, __val,
        __gnu_cxx::__ops::__iter_comp_val(__comp));
      return __i != __last && !bool(__comp(__val, *__i));
    }




  template<typename _InputIterator1, typename _InputIterator2,
    typename _OutputIterator, typename _Compare>
    void
    __move_merge_adaptive(_InputIterator1 __first1, _InputIterator1 __last1,
     _InputIterator2 __first2, _InputIterator2 __last2,
     _OutputIterator __result, _Compare __comp)
    {
      while (__first1 != __last1 && __first2 != __last2)
 {
   if (__comp(__first2, __first1))
     {
       *__result = (*__first2);
       ++__first2;
     }
   else
     {
       *__result = (*__first1);
       ++__first1;
     }
   ++__result;
 }
      if (__first1 != __last1)
 std::copy(__first1, __last1, __result);
    }


  template<typename _BidirectionalIterator1, typename _BidirectionalIterator2,
    typename _BidirectionalIterator3, typename _Compare>
    void
    __move_merge_adaptive_backward(_BidirectionalIterator1 __first1,
       _BidirectionalIterator1 __last1,
       _BidirectionalIterator2 __first2,
       _BidirectionalIterator2 __last2,
       _BidirectionalIterator3 __result,
       _Compare __comp)
    {
      if (__first1 == __last1)
 {
   std::copy_backward(__first2, __last2, __result);
   return;
 }
      else if (__first2 == __last2)
 return;

      --__last1;
      --__last2;
      while (true)
 {
   if (__comp(__last2, __last1))
     {
       *--__result = (*__last1);
       if (__first1 == __last1)
  {
    std::copy_backward(__first2, ++__last2, __result);
    return;
  }
       --__last1;
     }
   else
     {
       *--__result = (*__last2);
       if (__first2 == __last2)
  return;
       --__last2;
     }
 }
    }


  template<typename _BidirectionalIterator1, typename _BidirectionalIterator2,
    typename _Distance>
    _BidirectionalIterator1
    __rotate_adaptive(_BidirectionalIterator1 __first,
        _BidirectionalIterator1 __middle,
        _BidirectionalIterator1 __last,
        _Distance __len1, _Distance __len2,
        _BidirectionalIterator2 __buffer,
        _Distance __buffer_size)
    {
      _BidirectionalIterator2 __buffer_end;
      if (__len1 > __len2 && __len2 <= __buffer_size)
 {
   if (__len2)
     {
       __buffer_end = std::copy(__middle, __last, __buffer);
       std::copy_backward(__first, __middle, __last);
       return std::copy(__buffer, __buffer_end, __first);
     }
   else
     return __first;
 }
      else if (__len1 <= __buffer_size)
 {
   if (__len1)
     {
       __buffer_end = std::copy(__first, __middle, __buffer);
       std::copy(__middle, __last, __first);
       return std::copy_backward(__buffer, __buffer_end, __last);
     }
   else
     return __last;
 }
      else
 {
   std::rotate(__first, __middle, __last);
   std::advance(__first, std::distance(__middle, __last));
   return __first;
 }
    }


  template<typename _BidirectionalIterator, typename _Distance,
    typename _Pointer, typename _Compare>
    void
    __merge_adaptive(_BidirectionalIterator __first,
                     _BidirectionalIterator __middle,
       _BidirectionalIterator __last,
       _Distance __len1, _Distance __len2,
       _Pointer __buffer, _Distance __buffer_size,
       _Compare __comp)
    {
      if (__len1 <= __len2 && __len1 <= __buffer_size)
 {
   _Pointer __buffer_end = std::copy(__first, __middle, __buffer);
   std::__move_merge_adaptive(__buffer, __buffer_end, __middle, __last,
         __first, __comp);
 }
      else if (__len2 <= __buffer_size)
 {
   _Pointer __buffer_end = std::copy(__middle, __last, __buffer);
   std::__move_merge_adaptive_backward(__first, __middle, __buffer,
           __buffer_end, __last, __comp);
 }
      else
 {
   _BidirectionalIterator __first_cut = __first;
   _BidirectionalIterator __second_cut = __middle;
   _Distance __len11 = 0;
   _Distance __len22 = 0;
   if (__len1 > __len2)
     {
       __len11 = __len1 / 2;
       std::advance(__first_cut, __len11);
       __second_cut
  = std::__lower_bound(__middle, __last, *__first_cut,
         __gnu_cxx::__ops::__iter_comp_val(__comp));
       __len22 = std::distance(__middle, __second_cut);
     }
   else
     {
       __len22 = __len2 / 2;
       std::advance(__second_cut, __len22);
       __first_cut
  = std::__upper_bound(__first, __middle, *__second_cut,
         __gnu_cxx::__ops::__val_comp_iter(__comp));
       __len11 = std::distance(__first, __first_cut);
     }

   _BidirectionalIterator __new_middle
     = std::__rotate_adaptive(__first_cut, __middle, __second_cut,
         __len1 - __len11, __len22, __buffer,
         __buffer_size);
   std::__merge_adaptive(__first, __first_cut, __new_middle, __len11,
    __len22, __buffer, __buffer_size, __comp);
   std::__merge_adaptive(__new_middle, __second_cut, __last,
    __len1 - __len11,
    __len2 - __len22, __buffer,
    __buffer_size, __comp);
 }
    }


  template<typename _BidirectionalIterator, typename _Distance,
    typename _Compare>
    void
    __merge_without_buffer(_BidirectionalIterator __first,
                           _BidirectionalIterator __middle,
      _BidirectionalIterator __last,
      _Distance __len1, _Distance __len2,
      _Compare __comp)
    {
      if (__len1 == 0 || __len2 == 0)
 return;

      if (__len1 + __len2 == 2)
 {
   if (__comp(__middle, __first))
     std::iter_swap(__first, __middle);
   return;
 }

      _BidirectionalIterator __first_cut = __first;
      _BidirectionalIterator __second_cut = __middle;
      _Distance __len11 = 0;
      _Distance __len22 = 0;
      if (__len1 > __len2)
 {
   __len11 = __len1 / 2;
   std::advance(__first_cut, __len11);
   __second_cut
     = std::__lower_bound(__middle, __last, *__first_cut,
     __gnu_cxx::__ops::__iter_comp_val(__comp));
   __len22 = std::distance(__middle, __second_cut);
 }
      else
 {
   __len22 = __len2 / 2;
   std::advance(__second_cut, __len22);
   __first_cut
     = std::__upper_bound(__first, __middle, *__second_cut,
     __gnu_cxx::__ops::__val_comp_iter(__comp));
   __len11 = std::distance(__first, __first_cut);
 }

      std::rotate(__first_cut, __middle, __second_cut);
      _BidirectionalIterator __new_middle = __first_cut;
      std::advance(__new_middle, std::distance(__middle, __second_cut));
      std::__merge_without_buffer(__first, __first_cut, __new_middle,
      __len11, __len22, __comp);
      std::__merge_without_buffer(__new_middle, __second_cut, __last,
      __len1 - __len11, __len2 - __len22, __comp);
    }

  template<typename _BidirectionalIterator, typename _Compare>
    void
    __inplace_merge(_BidirectionalIterator __first,
      _BidirectionalIterator __middle,
      _BidirectionalIterator __last,
      _Compare __comp)
    {
      typedef typename iterator_traits<_BidirectionalIterator>::value_type
          _ValueType;
      typedef typename iterator_traits<_BidirectionalIterator>::difference_type
          _DistanceType;

      if (__first == __middle || __middle == __last)
 return;

      const _DistanceType __len1 = std::distance(__first, __middle);
      const _DistanceType __len2 = std::distance(__middle, __last);

      typedef _Temporary_buffer<_BidirectionalIterator, _ValueType> _TmpBuf;
      _TmpBuf __buf(__first, __last);

      if (__buf.begin() == 0)
 std::__merge_without_buffer
   (__first, __middle, __last, __len1, __len2, __comp);
      else
 std::__merge_adaptive
   (__first, __middle, __last, __len1, __len2, __buf.begin(),
    _DistanceType(__buf.size()), __comp);
    }
# 2584 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _BidirectionalIterator>
    inline void
    inplace_merge(_BidirectionalIterator __first,
    _BidirectionalIterator __middle,
    _BidirectionalIterator __last)
    {

     

     

      ;
      ;

      std::__inplace_merge(__first, __middle, __last,
      __gnu_cxx::__ops::__iter_less_iter());
    }
# 2624 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _BidirectionalIterator, typename _Compare>
    inline void
    inplace_merge(_BidirectionalIterator __first,
    _BidirectionalIterator __middle,
    _BidirectionalIterator __last,
    _Compare __comp)
    {

     

     


      ;
      ;

      std::__inplace_merge(__first, __middle, __last,
      __gnu_cxx::__ops::__iter_comp_iter(__comp));
    }



  template<typename _InputIterator, typename _OutputIterator,
    typename _Compare>
    _OutputIterator
    __move_merge(_InputIterator __first1, _InputIterator __last1,
   _InputIterator __first2, _InputIterator __last2,
   _OutputIterator __result, _Compare __comp)
    {
      while (__first1 != __last1 && __first2 != __last2)
 {
   if (__comp(__first2, __first1))
     {
       *__result = (*__first2);
       ++__first2;
     }
   else
     {
       *__result = (*__first1);
       ++__first1;
     }
   ++__result;
 }
      return std::copy(__first2, __last2, std::copy(__first1, __last1, __result))

                  ;
    }

  template<typename _RandomAccessIterator1, typename _RandomAccessIterator2,
    typename _Distance, typename _Compare>
    void
    __merge_sort_loop(_RandomAccessIterator1 __first,
        _RandomAccessIterator1 __last,
        _RandomAccessIterator2 __result, _Distance __step_size,
        _Compare __comp)
    {
      const _Distance __two_step = 2 * __step_size;

      while (__last - __first >= __two_step)
 {
   __result = std::__move_merge(__first, __first + __step_size,
           __first + __step_size,
           __first + __two_step,
           __result, __comp);
   __first += __two_step;
 }
      __step_size = std::min(_Distance(__last - __first), __step_size);

      std::__move_merge(__first, __first + __step_size,
   __first + __step_size, __last, __result, __comp);
    }

  template<typename _RandomAccessIterator, typename _Distance,
    typename _Compare>
    void
    __chunk_insertion_sort(_RandomAccessIterator __first,
      _RandomAccessIterator __last,
      _Distance __chunk_size, _Compare __comp)
    {
      while (__last - __first >= __chunk_size)
 {
   std::__insertion_sort(__first, __first + __chunk_size, __comp);
   __first += __chunk_size;
 }
      std::__insertion_sort(__first, __last, __comp);
    }

  enum { _S_chunk_size = 7 };

  template<typename _RandomAccessIterator, typename _Pointer, typename _Compare>
    void
    __merge_sort_with_buffer(_RandomAccessIterator __first,
        _RandomAccessIterator __last,
                             _Pointer __buffer, _Compare __comp)
    {
      typedef typename iterator_traits<_RandomAccessIterator>::difference_type
 _Distance;

      const _Distance __len = __last - __first;
      const _Pointer __buffer_last = __buffer + __len;

      _Distance __step_size = _S_chunk_size;
      std::__chunk_insertion_sort(__first, __last, __step_size, __comp);

      while (__step_size < __len)
 {
   std::__merge_sort_loop(__first, __last, __buffer,
     __step_size, __comp);
   __step_size *= 2;
   std::__merge_sort_loop(__buffer, __buffer_last, __first,
     __step_size, __comp);
   __step_size *= 2;
 }
    }

  template<typename _RandomAccessIterator, typename _Pointer,
    typename _Distance, typename _Compare>
    void
    __stable_sort_adaptive(_RandomAccessIterator __first,
      _RandomAccessIterator __last,
                           _Pointer __buffer, _Distance __buffer_size,
                           _Compare __comp)
    {
      const _Distance __len = (__last - __first + 1) / 2;
      const _RandomAccessIterator __middle = __first + __len;
      if (__len > __buffer_size)
 {
   std::__stable_sort_adaptive(__first, __middle, __buffer,
          __buffer_size, __comp);
   std::__stable_sort_adaptive(__middle, __last, __buffer,
          __buffer_size, __comp);
 }
      else
 {
   std::__merge_sort_with_buffer(__first, __middle, __buffer, __comp);
   std::__merge_sort_with_buffer(__middle, __last, __buffer, __comp);
 }
      std::__merge_adaptive(__first, __middle, __last,
       _Distance(__middle - __first),
       _Distance(__last - __middle),
       __buffer, __buffer_size,
       __comp);
    }


  template<typename _RandomAccessIterator, typename _Compare>
    void
    __inplace_stable_sort(_RandomAccessIterator __first,
     _RandomAccessIterator __last, _Compare __comp)
    {
      if (__last - __first < 15)
 {
   std::__insertion_sort(__first, __last, __comp);
   return;
 }
      _RandomAccessIterator __middle = __first + (__last - __first) / 2;
      std::__inplace_stable_sort(__first, __middle, __comp);
      std::__inplace_stable_sort(__middle, __last, __comp);
      std::__merge_without_buffer(__first, __middle, __last,
      __middle - __first,
      __last - __middle,
      __comp);
    }
# 2795 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _InputIterator1, typename _InputIterator2,
    typename _Compare>
    bool
    __includes(_InputIterator1 __first1, _InputIterator1 __last1,
        _InputIterator2 __first2, _InputIterator2 __last2,
        _Compare __comp)
    {
      while (__first1 != __last1 && __first2 != __last2)
 if (__comp(__first2, __first1))
   return false;
 else if (__comp(__first1, __first2))
   ++__first1;
 else
   ++__first1, ++__first2;

      return __first2 == __last2;
    }
# 2831 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _InputIterator1, typename _InputIterator2>
    inline bool
    includes(_InputIterator1 __first1, _InputIterator1 __last1,
      _InputIterator2 __first2, _InputIterator2 __last2)
    {

     
     
     


     


      ;
      ;

      return std::__includes(__first1, __last1, __first2, __last2,
        __gnu_cxx::__ops::__iter_less_iter());
    }
# 2873 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _InputIterator1, typename _InputIterator2,
    typename _Compare>
    inline bool
    includes(_InputIterator1 __first1, _InputIterator1 __last1,
      _InputIterator2 __first2, _InputIterator2 __last2,
      _Compare __comp)
    {

     
     
     


     


      ;
      ;

      return std::__includes(__first1, __last1, __first2, __last2,
        __gnu_cxx::__ops::__iter_comp_iter(__comp));
    }
# 2906 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _BidirectionalIterator, typename _Compare>
    bool
    __next_permutation(_BidirectionalIterator __first,
         _BidirectionalIterator __last, _Compare __comp)
    {
      if (__first == __last)
 return false;
      _BidirectionalIterator __i = __first;
      ++__i;
      if (__i == __last)
 return false;
      __i = __last;
      --__i;

      for(;;)
 {
   _BidirectionalIterator __ii = __i;
   --__i;
   if (__comp(__i, __ii))
     {
       _BidirectionalIterator __j = __last;
       while (!__comp(__i, --__j))
  {}
       std::iter_swap(__i, __j);
       std::__reverse(__ii, __last,
        std::__iterator_category(__first));
       return true;
     }
   if (__i == __first)
     {
       std::__reverse(__first, __last,
        std::__iterator_category(__first));
       return false;
     }
 }
    }
# 2955 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _BidirectionalIterator>
    inline bool
    next_permutation(_BidirectionalIterator __first,
       _BidirectionalIterator __last)
    {

     

     

      ;

      return std::__next_permutation
 (__first, __last, __gnu_cxx::__ops::__iter_less_iter());
    }
# 2986 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _BidirectionalIterator, typename _Compare>
    inline bool
    next_permutation(_BidirectionalIterator __first,
       _BidirectionalIterator __last, _Compare __comp)
    {

     

     


      ;

      return std::__next_permutation
 (__first, __last, __gnu_cxx::__ops::__iter_comp_iter(__comp));
    }

  template<typename _BidirectionalIterator, typename _Compare>
    bool
    __prev_permutation(_BidirectionalIterator __first,
         _BidirectionalIterator __last, _Compare __comp)
    {
      if (__first == __last)
 return false;
      _BidirectionalIterator __i = __first;
      ++__i;
      if (__i == __last)
 return false;
      __i = __last;
      --__i;

      for(;;)
 {
   _BidirectionalIterator __ii = __i;
   --__i;
   if (__comp(__ii, __i))
     {
       _BidirectionalIterator __j = __last;
       while (!__comp(--__j, __i))
  {}
       std::iter_swap(__i, __j);
       std::__reverse(__ii, __last,
        std::__iterator_category(__first));
       return true;
     }
   if (__i == __first)
     {
       std::__reverse(__first, __last,
        std::__iterator_category(__first));
       return false;
     }
 }
    }
# 3053 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _BidirectionalIterator>
    inline bool
    prev_permutation(_BidirectionalIterator __first,
       _BidirectionalIterator __last)
    {

     

     

      ;

      return std::__prev_permutation(__first, __last,
         __gnu_cxx::__ops::__iter_less_iter());
    }
# 3084 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _BidirectionalIterator, typename _Compare>
    inline bool
    prev_permutation(_BidirectionalIterator __first,
       _BidirectionalIterator __last, _Compare __comp)
    {

     

     


      ;

      return std::__prev_permutation(__first, __last,
    __gnu_cxx::__ops::__iter_comp_iter(__comp));
    }




  template<typename _InputIterator, typename _OutputIterator,
    typename _Predicate, typename _Tp>
    _OutputIterator
    __replace_copy_if(_InputIterator __first, _InputIterator __last,
        _OutputIterator __result,
        _Predicate __pred, const _Tp& __new_value)
    {
      for (; __first != __last; ++__first, ++__result)
 if (__pred(__first))
   *__result = __new_value;
 else
   *__result = *__first;
      return __result;
    }
# 3133 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _InputIterator, typename _OutputIterator, typename _Tp>
    inline _OutputIterator
    replace_copy(_InputIterator __first, _InputIterator __last,
   _OutputIterator __result,
   const _Tp& __old_value, const _Tp& __new_value)
    {

     
     

     

      ;

      return std::__replace_copy_if(__first, __last, __result,
   __gnu_cxx::__ops::__iter_equals_val(__old_value),
           __new_value);
    }
# 3167 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _InputIterator, typename _OutputIterator,
    typename _Predicate, typename _Tp>
    inline _OutputIterator
    replace_copy_if(_InputIterator __first, _InputIterator __last,
      _OutputIterator __result,
      _Predicate __pred, const _Tp& __new_value)
    {

     
     

     

      ;

      return std::__replace_copy_if(__first, __last, __result,
    __gnu_cxx::__ops::__pred_iter(__pred),
           __new_value);
    }

  template<typename _InputIterator, typename _Predicate>
    typename iterator_traits<_InputIterator>::difference_type
    __count_if(_InputIterator __first, _InputIterator __last, _Predicate __pred)
    {
      typename iterator_traits<_InputIterator>::difference_type __n = 0;
      for (; __first != __last; ++__first)
 if (__pred(__first))
   ++__n;
      return __n;
    }
# 3743 "/usr/include/c++/5/bits/stl_algo.h" 3



# 3759 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _InputIterator, typename _Function>
    _Function
    for_each(_InputIterator __first, _InputIterator __last, _Function __f)
    {

     
      ;
      for (; __first != __last; ++__first)
 __f(*__first);
      return (__f);
    }
# 3780 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _InputIterator, typename _Tp>
    inline _InputIterator
    find(_InputIterator __first, _InputIterator __last,
  const _Tp& __val)
    {

     
     

      ;
      return std::__find_if(__first, __last,
       __gnu_cxx::__ops::__iter_equals_val(__val));
    }
# 3804 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _InputIterator, typename _Predicate>
    inline _InputIterator
    find_if(_InputIterator __first, _InputIterator __last,
     _Predicate __pred)
    {

     
     

      ;

      return std::__find_if(__first, __last,
       __gnu_cxx::__ops::__pred_iter(__pred));
    }
# 3835 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _InputIterator, typename _ForwardIterator>
    _InputIterator
    find_first_of(_InputIterator __first1, _InputIterator __last1,
    _ForwardIterator __first2, _ForwardIterator __last2)
    {

     
     
     


      ;
      ;

      for (; __first1 != __last1; ++__first1)
 for (_ForwardIterator __iter = __first2; __iter != __last2; ++__iter)
   if (*__first1 == *__iter)
     return __first1;
      return __last1;
    }
# 3875 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _InputIterator, typename _ForwardIterator,
    typename _BinaryPredicate>
    _InputIterator
    find_first_of(_InputIterator __first1, _InputIterator __last1,
    _ForwardIterator __first2, _ForwardIterator __last2,
    _BinaryPredicate __comp)
    {

     
     
     


      ;
      ;

      for (; __first1 != __last1; ++__first1)
 for (_ForwardIterator __iter = __first2; __iter != __last2; ++__iter)
   if (__comp(*__first1, *__iter))
     return __first1;
      return __last1;
    }
# 3907 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _ForwardIterator>
    inline _ForwardIterator
    adjacent_find(_ForwardIterator __first, _ForwardIterator __last)
    {

     
     

      ;

      return std::__adjacent_find(__first, __last,
      __gnu_cxx::__ops::__iter_equal_to_iter());
    }
# 3932 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _ForwardIterator, typename _BinaryPredicate>
    inline _ForwardIterator
    adjacent_find(_ForwardIterator __first, _ForwardIterator __last,
    _BinaryPredicate __binary_pred)
    {

     
     


      ;

      return std::__adjacent_find(__first, __last,
   __gnu_cxx::__ops::__iter_comp_iter(__binary_pred));
    }
# 3957 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _InputIterator, typename _Tp>
    inline typename iterator_traits<_InputIterator>::difference_type
    count(_InputIterator __first, _InputIterator __last, const _Tp& __value)
    {

     
     

      ;

      return std::__count_if(__first, __last,
        __gnu_cxx::__ops::__iter_equals_val(__value));
    }
# 3980 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _InputIterator, typename _Predicate>
    inline typename iterator_traits<_InputIterator>::difference_type
    count_if(_InputIterator __first, _InputIterator __last, _Predicate __pred)
    {

     
     

      ;

      return std::__count_if(__first, __last,
        __gnu_cxx::__ops::__pred_iter(__pred));
    }
# 4020 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _ForwardIterator1, typename _ForwardIterator2>
    inline _ForwardIterator1
    search(_ForwardIterator1 __first1, _ForwardIterator1 __last1,
    _ForwardIterator2 __first2, _ForwardIterator2 __last2)
    {

     
     
     


      ;
      ;

      return std::__search(__first1, __last1, __first2, __last2,
      __gnu_cxx::__ops::__iter_equal_to_iter());
    }
# 4059 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _ForwardIterator1, typename _ForwardIterator2,
    typename _BinaryPredicate>
    inline _ForwardIterator1
    search(_ForwardIterator1 __first1, _ForwardIterator1 __last1,
    _ForwardIterator2 __first2, _ForwardIterator2 __last2,
    _BinaryPredicate __predicate)
    {

     
     
     


      ;
      ;

      return std::__search(__first1, __last1, __first2, __last2,
      __gnu_cxx::__ops::__iter_comp_iter(__predicate));
    }
# 4094 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _ForwardIterator, typename _Integer, typename _Tp>
    inline _ForwardIterator
    search_n(_ForwardIterator __first, _ForwardIterator __last,
      _Integer __count, const _Tp& __val)
    {

     
     

      ;

      return std::__search_n(__first, __last, __count,
        __gnu_cxx::__ops::__iter_equals_val(__val));
    }
# 4127 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _ForwardIterator, typename _Integer, typename _Tp,
           typename _BinaryPredicate>
    inline _ForwardIterator
    search_n(_ForwardIterator __first, _ForwardIterator __last,
      _Integer __count, const _Tp& __val,
      _BinaryPredicate __binary_pred)
    {

     
     

      ;

      return std::__search_n(__first, __last, __count,
  __gnu_cxx::__ops::__iter_comp_val(__binary_pred, __val));
    }
# 4161 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _InputIterator, typename _OutputIterator,
    typename _UnaryOperation>
    _OutputIterator
    transform(_InputIterator __first, _InputIterator __last,
       _OutputIterator __result, _UnaryOperation __unary_op)
    {

     
     


      ;

      for (; __first != __last; ++__first, ++__result)
 *__result = __unary_op(*__first);
      return __result;
    }
# 4198 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _InputIterator1, typename _InputIterator2,
    typename _OutputIterator, typename _BinaryOperation>
    _OutputIterator
    transform(_InputIterator1 __first1, _InputIterator1 __last1,
       _InputIterator2 __first2, _OutputIterator __result,
       _BinaryOperation __binary_op)
    {

     
     
     


      ;

      for (; __first1 != __last1; ++__first1, ++__first2, ++__result)
 *__result = __binary_op(*__first1, *__first2);
      return __result;
    }
# 4231 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _ForwardIterator, typename _Tp>
    void
    replace(_ForwardIterator __first, _ForwardIterator __last,
     const _Tp& __old_value, const _Tp& __new_value)
    {

     

     

     

      ;

      for (; __first != __last; ++__first)
 if (*__first == __old_value)
   *__first = __new_value;
    }
# 4263 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _ForwardIterator, typename _Predicate, typename _Tp>
    void
    replace_if(_ForwardIterator __first, _ForwardIterator __last,
        _Predicate __pred, const _Tp& __new_value)
    {

     

     

     

      ;

      for (; __first != __last; ++__first)
 if (__pred(*__first))
   *__first = __new_value;
    }
# 4295 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _ForwardIterator, typename _Generator>
    void
    generate(_ForwardIterator __first, _ForwardIterator __last,
      _Generator __gen)
    {

     
     

      ;

      for (; __first != __last; ++__first)
 *__first = __gen();
    }
# 4326 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _OutputIterator, typename _Size, typename _Generator>
    _OutputIterator
    generate_n(_OutputIterator __first, _Size __n, _Generator __gen)
    {

     



      for (__decltype(__n + 0) __niter = __n;
    __niter > 0; --__niter, ++__first)
 *__first = __gen();
      return __first;
    }
# 4362 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _InputIterator, typename _OutputIterator>
    inline _OutputIterator
    unique_copy(_InputIterator __first, _InputIterator __last,
  _OutputIterator __result)
    {

     
     

     

      ;

      if (__first == __last)
 return __result;
      return std::__unique_copy(__first, __last, __result,
    __gnu_cxx::__ops::__iter_equal_to_iter(),
    std::__iterator_category(__first),
    std::__iterator_category(__result));
    }
# 4402 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _InputIterator, typename _OutputIterator,
    typename _BinaryPredicate>
    inline _OutputIterator
    unique_copy(_InputIterator __first, _InputIterator __last,
  _OutputIterator __result,
  _BinaryPredicate __binary_pred)
    {

     
     

      ;

      if (__first == __last)
 return __result;
      return std::__unique_copy(__first, __last, __result,
   __gnu_cxx::__ops::__iter_comp_iter(__binary_pred),
    std::__iterator_category(__first),
    std::__iterator_category(__result));
    }
# 4434 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _RandomAccessIterator>
    inline void
    random_shuffle(_RandomAccessIterator __first, _RandomAccessIterator __last)
    {

     

      ;

      if (__first != __last)
 for (_RandomAccessIterator __i = __first + 1; __i != __last; ++__i)
   {

     _RandomAccessIterator __j = __first
     + std::rand() % ((__i - __first) + 1);
     if (__i != __j)
       std::iter_swap(__i, __j);
   }
    }
# 4468 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _RandomAccessIterator, typename _RandomNumberGenerator>
    void
    random_shuffle(_RandomAccessIterator __first, _RandomAccessIterator __last,



     _RandomNumberGenerator& __rand)

    {

     

      ;

      if (__first == __last)
 return;
      for (_RandomAccessIterator __i = __first + 1; __i != __last; ++__i)
 {
   _RandomAccessIterator __j = __first + __rand((__i - __first) + 1);
   if (__i != __j)
     std::iter_swap(__i, __j);
 }
    }
# 4508 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _ForwardIterator, typename _Predicate>
    inline _ForwardIterator
    partition(_ForwardIterator __first, _ForwardIterator __last,
       _Predicate __pred)
    {

     

     

      ;

      return std::__partition(__first, __last, __pred,
         std::__iterator_category(__first));
    }
# 4541 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _RandomAccessIterator>
    inline void
    partial_sort(_RandomAccessIterator __first,
   _RandomAccessIterator __middle,
   _RandomAccessIterator __last)
    {

     

     

      ;
      ;

      std::__partial_sort(__first, __middle, __last,
     __gnu_cxx::__ops::__iter_less_iter());
    }
# 4578 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _RandomAccessIterator, typename _Compare>
    inline void
    partial_sort(_RandomAccessIterator __first,
   _RandomAccessIterator __middle,
   _RandomAccessIterator __last,
   _Compare __comp)
    {

     

     


      ;
      ;

      std::__partial_sort(__first, __middle, __last,
     __gnu_cxx::__ops::__iter_comp_iter(__comp));
    }
# 4613 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _RandomAccessIterator>
    inline void
    nth_element(_RandomAccessIterator __first, _RandomAccessIterator __nth,
  _RandomAccessIterator __last)
    {

     

     

      ;
      ;

      if (__first == __last || __nth == __last)
 return;

      std::__introselect(__first, __nth, __last,
    std::__lg(__last - __first) * 2,
    __gnu_cxx::__ops::__iter_less_iter());
    }
# 4651 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _RandomAccessIterator, typename _Compare>
    inline void
    nth_element(_RandomAccessIterator __first, _RandomAccessIterator __nth,
  _RandomAccessIterator __last, _Compare __comp)
    {

     

     


      ;
      ;

      if (__first == __last || __nth == __last)
 return;

      std::__introselect(__first, __nth, __last,
    std::__lg(__last - __first) * 2,
    __gnu_cxx::__ops::__iter_comp_iter(__comp));
    }
# 4687 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _RandomAccessIterator>
    inline void
    sort(_RandomAccessIterator __first, _RandomAccessIterator __last)
    {

     

     

      ;

      std::__sort(__first, __last, __gnu_cxx::__ops::__iter_less_iter());
    }
# 4716 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _RandomAccessIterator, typename _Compare>
    inline void
    sort(_RandomAccessIterator __first, _RandomAccessIterator __last,
  _Compare __comp)
    {

     

     


      ;

      std::__sort(__first, __last, __gnu_cxx::__ops::__iter_comp_iter(__comp));
    }

  template<typename _InputIterator1, typename _InputIterator2,
    typename _OutputIterator, typename _Compare>
    _OutputIterator
    __merge(_InputIterator1 __first1, _InputIterator1 __last1,
     _InputIterator2 __first2, _InputIterator2 __last2,
     _OutputIterator __result, _Compare __comp)
    {
      while (__first1 != __last1 && __first2 != __last2)
 {
   if (__comp(__first2, __first1))
     {
       *__result = *__first2;
       ++__first2;
     }
   else
     {
       *__result = *__first1;
       ++__first1;
     }
   ++__result;
 }
      return std::copy(__first2, __last2,
         std::copy(__first1, __last1, __result));
    }
# 4776 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _InputIterator1, typename _InputIterator2,
    typename _OutputIterator>
    inline _OutputIterator
    merge(_InputIterator1 __first1, _InputIterator1 __last1,
   _InputIterator2 __first2, _InputIterator2 __last2,
   _OutputIterator __result)
    {

     
     
     

     

     


      ;
      ;

      return std::__merge(__first1, __last1,
         __first2, __last2, __result,
         __gnu_cxx::__ops::__iter_less_iter());
    }
# 4824 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _InputIterator1, typename _InputIterator2,
    typename _OutputIterator, typename _Compare>
    inline _OutputIterator
    merge(_InputIterator1 __first1, _InputIterator1 __last1,
   _InputIterator2 __first2, _InputIterator2 __last2,
   _OutputIterator __result, _Compare __comp)
    {

     
     
     

     

     


      ;
      ;

      return std::__merge(__first1, __last1,
    __first2, __last2, __result,
    __gnu_cxx::__ops::__iter_comp_iter(__comp));
    }

  template<typename _RandomAccessIterator, typename _Compare>
    inline void
    __stable_sort(_RandomAccessIterator __first, _RandomAccessIterator __last,
    _Compare __comp)
    {
      typedef typename iterator_traits<_RandomAccessIterator>::value_type
 _ValueType;
      typedef typename iterator_traits<_RandomAccessIterator>::difference_type
 _DistanceType;

      typedef _Temporary_buffer<_RandomAccessIterator, _ValueType> _TmpBuf;
      _TmpBuf __buf(__first, __last);

      if (__buf.begin() == 0)
 std::__inplace_stable_sort(__first, __last, __comp);
      else
 std::__stable_sort_adaptive(__first, __last, __buf.begin(),
        _DistanceType(__buf.size()), __comp);
    }
# 4886 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _RandomAccessIterator>
    inline void
    stable_sort(_RandomAccessIterator __first, _RandomAccessIterator __last)
    {

     

     

      ;

      std::__stable_sort(__first, __last,
        __gnu_cxx::__ops::__iter_less_iter());
    }
# 4919 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _RandomAccessIterator, typename _Compare>
    inline void
    stable_sort(_RandomAccessIterator __first, _RandomAccessIterator __last,
  _Compare __comp)
    {

     

     


      ;

      std::__stable_sort(__first, __last,
        __gnu_cxx::__ops::__iter_comp_iter(__comp));
    }

  template<typename _InputIterator1, typename _InputIterator2,
    typename _OutputIterator,
    typename _Compare>
    _OutputIterator
    __set_union(_InputIterator1 __first1, _InputIterator1 __last1,
  _InputIterator2 __first2, _InputIterator2 __last2,
  _OutputIterator __result, _Compare __comp)
    {
      while (__first1 != __last1 && __first2 != __last2)
 {
   if (__comp(__first1, __first2))
     {
       *__result = *__first1;
       ++__first1;
     }
   else if (__comp(__first2, __first1))
     {
       *__result = *__first2;
       ++__first2;
     }
   else
     {
       *__result = *__first1;
       ++__first1;
       ++__first2;
     }
   ++__result;
 }
      return std::copy(__first2, __last2,
         std::copy(__first1, __last1, __result));
    }
# 4986 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _InputIterator1, typename _InputIterator2,
    typename _OutputIterator>
    inline _OutputIterator
    set_union(_InputIterator1 __first1, _InputIterator1 __last1,
       _InputIterator2 __first2, _InputIterator2 __last2,
       _OutputIterator __result)
    {

     
     
     

     

     


     


      ;
      ;

      return std::__set_union(__first1, __last1,
    __first2, __last2, __result,
    __gnu_cxx::__ops::__iter_less_iter());
    }
# 5033 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _InputIterator1, typename _InputIterator2,
    typename _OutputIterator, typename _Compare>
    inline _OutputIterator
    set_union(_InputIterator1 __first1, _InputIterator1 __last1,
       _InputIterator2 __first2, _InputIterator2 __last2,
       _OutputIterator __result, _Compare __comp)
    {

     
     
     

     

     


     


      ;
      ;

      return std::__set_union(__first1, __last1,
    __first2, __last2, __result,
    __gnu_cxx::__ops::__iter_comp_iter(__comp));
    }

  template<typename _InputIterator1, typename _InputIterator2,
    typename _OutputIterator,
    typename _Compare>
    _OutputIterator
    __set_intersection(_InputIterator1 __first1, _InputIterator1 __last1,
         _InputIterator2 __first2, _InputIterator2 __last2,
         _OutputIterator __result, _Compare __comp)
    {
      while (__first1 != __last1 && __first2 != __last2)
 if (__comp(__first1, __first2))
   ++__first1;
 else if (__comp(__first2, __first1))
   ++__first2;
 else
   {
     *__result = *__first1;
     ++__first1;
     ++__first2;
     ++__result;
   }
      return __result;
    }
# 5101 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _InputIterator1, typename _InputIterator2,
    typename _OutputIterator>
    inline _OutputIterator
    set_intersection(_InputIterator1 __first1, _InputIterator1 __last1,
       _InputIterator2 __first2, _InputIterator2 __last2,
       _OutputIterator __result)
    {

     
     
     

     


     


      ;
      ;

      return std::__set_intersection(__first1, __last1,
         __first2, __last2, __result,
         __gnu_cxx::__ops::__iter_less_iter());
    }
# 5147 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _InputIterator1, typename _InputIterator2,
    typename _OutputIterator, typename _Compare>
    inline _OutputIterator
    set_intersection(_InputIterator1 __first1, _InputIterator1 __last1,
       _InputIterator2 __first2, _InputIterator2 __last2,
       _OutputIterator __result, _Compare __comp)
    {

     
     
     

     


     


      ;
      ;

      return std::__set_intersection(__first1, __last1,
    __first2, __last2, __result,
    __gnu_cxx::__ops::__iter_comp_iter(__comp));
    }

  template<typename _InputIterator1, typename _InputIterator2,
    typename _OutputIterator,
    typename _Compare>
    _OutputIterator
    __set_difference(_InputIterator1 __first1, _InputIterator1 __last1,
       _InputIterator2 __first2, _InputIterator2 __last2,
       _OutputIterator __result, _Compare __comp)
    {
      while (__first1 != __last1 && __first2 != __last2)
 if (__comp(__first1, __first2))
   {
     *__result = *__first1;
     ++__first1;
     ++__result;
   }
 else if (__comp(__first2, __first1))
   ++__first2;
 else
   {
     ++__first1;
     ++__first2;
   }
      return std::copy(__first1, __last1, __result);
    }
# 5217 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _InputIterator1, typename _InputIterator2,
    typename _OutputIterator>
    inline _OutputIterator
    set_difference(_InputIterator1 __first1, _InputIterator1 __last1,
     _InputIterator2 __first2, _InputIterator2 __last2,
     _OutputIterator __result)
    {

     
     
     

     


     


      ;
      ;

      return std::__set_difference(__first1, __last1,
       __first2, __last2, __result,
       __gnu_cxx::__ops::__iter_less_iter());
    }
# 5265 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _InputIterator1, typename _InputIterator2,
    typename _OutputIterator, typename _Compare>
    inline _OutputIterator
    set_difference(_InputIterator1 __first1, _InputIterator1 __last1,
     _InputIterator2 __first2, _InputIterator2 __last2,
     _OutputIterator __result, _Compare __comp)
    {

     
     
     

     


     


      ;
      ;

      return std::__set_difference(__first1, __last1,
       __first2, __last2, __result,
       __gnu_cxx::__ops::__iter_comp_iter(__comp));
    }

  template<typename _InputIterator1, typename _InputIterator2,
    typename _OutputIterator,
    typename _Compare>
    _OutputIterator
    __set_symmetric_difference(_InputIterator1 __first1,
          _InputIterator1 __last1,
          _InputIterator2 __first2,
          _InputIterator2 __last2,
          _OutputIterator __result,
          _Compare __comp)
    {
      while (__first1 != __last1 && __first2 != __last2)
 if (__comp(__first1, __first2))
   {
     *__result = *__first1;
     ++__first1;
     ++__result;
   }
 else if (__comp(__first2, __first1))
   {
     *__result = *__first2;
     ++__first2;
     ++__result;
   }
 else
   {
     ++__first1;
     ++__first2;
   }
      return std::copy(__first2, __last2,
         std::copy(__first1, __last1, __result));
    }
# 5341 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _InputIterator1, typename _InputIterator2,
    typename _OutputIterator>
    inline _OutputIterator
    set_symmetric_difference(_InputIterator1 __first1, _InputIterator1 __last1,
        _InputIterator2 __first2, _InputIterator2 __last2,
        _OutputIterator __result)
    {

     
     
     

     

     


     


      ;
      ;

      return std::__set_symmetric_difference(__first1, __last1,
     __first2, __last2, __result,
     __gnu_cxx::__ops::__iter_less_iter());
    }
# 5389 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _InputIterator1, typename _InputIterator2,
    typename _OutputIterator, typename _Compare>
    inline _OutputIterator
    set_symmetric_difference(_InputIterator1 __first1, _InputIterator1 __last1,
        _InputIterator2 __first2, _InputIterator2 __last2,
        _OutputIterator __result,
        _Compare __comp)
    {

     
     
     

     

     


     


      ;
      ;

      return std::__set_symmetric_difference(__first1, __last1,
    __first2, __last2, __result,
    __gnu_cxx::__ops::__iter_comp_iter(__comp));
    }

  template<typename _ForwardIterator, typename _Compare>
   
    _ForwardIterator
    __min_element(_ForwardIterator __first, _ForwardIterator __last,
    _Compare __comp)
    {
      if (__first == __last)
 return __first;
      _ForwardIterator __result = __first;
      while (++__first != __last)
 if (__comp(__first, __result))
   __result = __first;
      return __result;
    }
# 5440 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _ForwardIterator>
   
    _ForwardIterator
    inline min_element(_ForwardIterator __first, _ForwardIterator __last)
    {

     
     

      ;

      return std::__min_element(__first, __last,
    __gnu_cxx::__ops::__iter_less_iter());
    }
# 5464 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _ForwardIterator, typename _Compare>
   
    inline _ForwardIterator
    min_element(_ForwardIterator __first, _ForwardIterator __last,
  _Compare __comp)
    {

     
     


      ;

      return std::__min_element(__first, __last,
    __gnu_cxx::__ops::__iter_comp_iter(__comp));
    }

  template<typename _ForwardIterator, typename _Compare>
   
    _ForwardIterator
    __max_element(_ForwardIterator __first, _ForwardIterator __last,
    _Compare __comp)
    {
      if (__first == __last) return __first;
      _ForwardIterator __result = __first;
      while (++__first != __last)
 if (__comp(__result, __first))
   __result = __first;
      return __result;
    }
# 5502 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _ForwardIterator>
   
    inline _ForwardIterator
    max_element(_ForwardIterator __first, _ForwardIterator __last)
    {

     
     

      ;

      return std::__max_element(__first, __last,
    __gnu_cxx::__ops::__iter_less_iter());
    }
# 5526 "/usr/include/c++/5/bits/stl_algo.h" 3
  template<typename _ForwardIterator, typename _Compare>
   
    inline _ForwardIterator
    max_element(_ForwardIterator __first, _ForwardIterator __last,
  _Compare __comp)
    {

     
     


      ;

      return std::__max_element(__first, __last,
    __gnu_cxx::__ops::__iter_comp_iter(__comp));
    }


}
# 63 "/usr/include/c++/5/algorithm" 2 3
# 17 "arprec/include/arprec/mp.h" 2
# 51 "arprec/include/arprec/mp.h"

# 51 "arprec/include/arprec/mp.h"
struct mp_real;

struct mp {





  static void mp_init(int new_digits, const char *filename = 
# 59 "arprec/include/arprec/mp.h" 3 4
                                                            __null
# 59 "arprec/include/arprec/mp.h"
                                                                , bool compute_consts = true);

  static void mp_finalize();

  static void mp_read_constants(const char *filename);
  static void mp_write_constants(const char *filename);

  static void mpsetoutputprec(int num_digits);
  static int mpgetoutputprec() {return n_output_digits;}
  static void mpsetprec(int num_digits);
  static int mpgetprec();
  static void mpsetprecwords(int num_words);
  static int mpgetprecwords() {return prec_words;}

  static int n_digits;
  static int n_mantissa;
  static int n_words;
  static int n_output_digits;

  static int fmpwds5;

  static int debug_level;
  static int debug_words;
  static int error_no;



  enum rounding_mode {
    round_to_zero = 0,
    round_to_nearest = 1,
    round_to_infinity = 2
  };


  static enum rounding_mode round_dir;


  static int MPKER[79+1];



  static double *mpuu1;
  static double *mpuu2;
  static double *mpuu3;



  static unsigned int old_cw;


  static int prec_words;



  static const double mpbbx;
  static const double mpbdx;
  static const double mprdx;
  static const double mpbx2;
  static const double mprbx;
  static const double mprx2;
  static const double mprxx;



  static const int mpnbt;



  static const int mpnpr;




  static const int mpmcrx;



  static const int mpnrow;



  static const int mpnsp1;



  static const int mpnsp2;

  static const double digits_per_word;


  static void mpabrt();

  static const double _d_nan;
};
# 28 "arprec/include/arprec/mp_real.h" 2
# 1 "arprec/include/arprec/mp_real_temp.h" 1
# 14 "arprec/include/arprec/mp_real_temp.h"
# 1 "/usr/include/c++/5/cstddef" 1 3
# 42 "/usr/include/c++/5/cstddef" 3
       
# 43 "/usr/include/c++/5/cstddef" 3


# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 1 3 4
# 149 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 3 4

# 149 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 3 4
typedef long int ptrdiff_t;
# 46 "/usr/include/c++/5/cstddef" 2 3
# 15 "arprec/include/arprec/mp_real_temp.h" 2


# 16 "arprec/include/arprec/mp_real_temp.h"
class mp_real_temp
{
 protected:
 public:
  double *mpr;
  mp_real_temp(int s = mp::n_words) {
    mpr = new double[s];
    mpr[0] = s;
  }
  mp_real_temp(double *dp) { mpr = dp; }
  mp_real_temp(const double *dp) { mpr = const_cast<double *>(dp); }
  mp_real_temp(const mp_real_temp& other) { mpr = other.mpr; }



};
# 29 "arprec/include/arprec/mp_real.h" 2
# 38 "arprec/include/arprec/mp_real.h"
struct mp_real: public mp {
  double *mpr;
  bool alloc;

  static mp_real _pi;
  static mp_real _log2;
  static mp_real _log10;
  static mp_real _eps;


  static void mplconv(int iq, int n, int nsq, double *a,
        double *b, double *c);
  static void mpfftrc(int is, int m, int n, int nsq, double *x, double *y);
  static void mpfft1(int is, int m, int m1, int m2,
       double *x, double *y);
  static void mpfft1_radix_two(int is, int m, int n1, int n2,
       double *x, double *y);
  static void mpfft3(int is, int l, int ns, int m, int n,
       double *x, double *y);
  static void mpfft3_radix2(int is, int l, int ns, int m, int n,
       double *x, double *y);
  static void mpfft2(int is, int ns, int m, int n, double *x, double *y,
       double* &out);
  static void mpfftcr(int is, int m, int n, int nsq,
        double *x, double *y);
  static void mpoutx_help(const mp_real& a, char *b, int n, int prec_words);

  bool construct(const std::string &expn_str,
                 const std::string &digit_str1, const std::string &digit_str2);


  static void zero(mp_real &a) { a.mpr[1] = a.mpr[2] = 0.; }
  static void mpadd(const mp_real &a, const mp_real &b, mp_real& c, int prec_words);
  static void mpeq(const mp_real& a, mp_real& b, int prec_words);
  static void mpdiv(const mp_real& a, const mp_real& b, mp_real& c, int prec_words);
  static void mpdivd(const mp_real& a, double b, int n, mp_real& c, int prec_words);
  static void mpmul(const mp_real& a, const mp_real&b, mp_real& c, int prec_words);
  static void mpmuld(const mp_real& a, double b, int n, mp_real& c, int prec_words);
  static void mpmulacc(const mp_real &a, const mp_real &b, mp_real &c);
  static void mpnorm(double d[], mp_real &a, int prec_words);
  static void mpnpwr(const mp_real& a, int n, mp_real& b, int prec_words);
  static void mpdexc(const char a[], int l, mp_real& b);
  static void mpinpc(const char a[], int n, mp_real& b);
  static void mpinpcExit();
  static void mpout(const mp_real& a, int la, char* cs, int& l, int prec_words);
  static void mpoutc(const mp_real& a, char* b, int& n, int prec_words);
  static void mproun(mp_real &a);
  static void mpsub(const mp_real &a, const mp_real &b, mp_real& c, int prec_words);
  static int mpcpr(const mp_real& a, const mp_real& b);
  static void mpexp(const mp_real& a, const mp_real& al2, mp_real& b, int prec_words);
  static void mplog(const mp_real& a, const mp_real& al2, mp_real& b,
      int prec_words, int nit = 3);
  static void mpnint(const mp_real& a, mp_real &b, int prec_words);
  static void mpcssh(const mp_real& a, const mp_real& al2, mp_real& x,
       mp_real& y);
  static void mpcssn(const mp_real& a, const mp_real& pi, mp_real &x,
       mp_real &y, int prec_words);
  static void mppi(mp_real& pi);
  static void mpang(const mp_real& x, const mp_real& y,
        const mp_real& pi, mp_real& a);
  static void mpsqrt(const mp_real& a, mp_real& b, int prec_words);


  static void mppix(mp_real& pi);
  static void mpmulx(const mp_real& a, const mp_real& b, mp_real& c, int prec_words);
  static void mpdivx(const mp_real& a, const mp_real& b, mp_real& c, int prec_words);
  static void mpsqx(const mp_real& a, mp_real& b, int prec_words);
  static void mpsqrtx(const mp_real& a, mp_real& b, int prec_words);
  static void mpexpx(const mp_real& a, const mp_real& pi,
       const mp_real& al2, mp_real& b);
  static void mplogx(const mp_real& a, const mp_real& pi, const mp_real& al2,
       mp_real& b, int prec_words);
  static void mpagmx(mp_real &a, mp_real& b, int prec_words);
  static void mpnpwx(const mp_real& a, int n, mp_real& b, int prec_words);
  static void mpcshx(const mp_real& a, const mp_real& pi,
       const mp_real& al2, mp_real& x, mp_real& y);
  static void mpinix(int n);
  static void mpoutx(const mp_real& a, int la, char *b, int& n, int prec_words);


  static void mprand(mp_real& a);
  static void mpinfr(const mp_real& a, mp_real& b, mp_real& c,
       int prec_words, int want_fraction=1);
  static void mpdmc(double a, int n, mp_real& b, int prec_words);
  static void mpmdc(const mp_real& a, double& d, int& n, int prec_words);
  static void mpsort(int n, mp_real *a, int *ip);
  static void mpangx(const mp_real& x, const mp_real& y,
       const mp_real& pi, mp_real& a);
  static void mpcssx(const mp_real& a, const mp_real& pi,
       mp_real& x, mp_real& y);
  static void mpnrt(const mp_real& a, int n, mp_real& b, int prec_words);
  static void mpnrtx(const mp_real& a, int n, mp_real& b);
  static void mpdotd(int n, int isa, const mp_real a[],
                     int isb, const double db[], mp_real& c);

  int to_digits(char *digits, int &expn, int n) const;
  bool write(std::ostream &s, int precision = mp::n_output_digits,
      int width = 0, int expn_width = 0,
      std::ios_base::fmtflags fmt = static_cast<std::ios_base::fmtflags>(0),
      int n_cols = 0, bool showpos = false, bool uppercase = false,
      char fill = ' ') const;
  bool read(std::istream &s);
  bool read(const std::string &s);
  std::string to_string(int precision = mp::n_output_digits,
      int width = 0, int expn_width = 0,
      std::ios_base::fmtflags fmt = static_cast<std::ios_base::fmtflags>(0),
      bool showpos = false, bool uppercase = false, char fill = ' ') const;


  void write_binary(std::ostream &out);
  void read_binary(std::istream &in);


  double& operator[](int index) { return mpr[index]; }


  double operator[](int index) const { return mpr[index]; }


  mp_real& operator=(const int&);
  mp_real& operator=(const double&);
  mp_real& operator=(const mp_real&);
  mp_real& operator=(const mp_real_temp&);
  mp_real& operator=(const char*);
  mp_real& operator+=(const mp_real&);
  mp_real& operator-=(const mp_real&);
  mp_real& operator*=(const mp_real&);
  mp_real& operator*=(double);
  mp_real& operator/=(const mp_real&);
  mp_real& operator/=(double);
# 177 "arprec/include/arprec/mp_real.h"
  ~mp_real() { if(mpr && alloc) delete [] mpr; }


  void allocate(unsigned int sz);
  void reallocate(unsigned int sz);


  mp_real();
  mp_real(double a, int sz = n_words);

  mp_real(const mp_real& x);
  mp_real(const mp_real_temp& x);
  mp_real(const char *s, unsigned int sz = n_words);
  mp_real(const std::string &s, unsigned int sz = n_words);






  explicit mp_real(const double *a);
  explicit mp_real(double *a);





  static mp_real *alloc_array(int n);
  static void free_array(mp_real *m);

  mp_real_temp toTempAndDestroy() {
    mp_real_temp ret(this->mpr); mpr = 0; return ret;
  }


  static void print_mpreal(const char* str, const mp_real& mpr,
      std::ostream &os = std::cerr);
  void print_short(const char *name) const;

};

template <class Ch, class Tr>
std::basic_ostream<Ch, Tr>& operator<<(std::basic_ostream<Ch, Tr>& s, const mp_real& a) {
  bool showpos = (s.flags() & std::ios_base::showpos) != 0;
  bool uppercase = (s.flags() & std::ios_base::uppercase) != 0;
  std::ios_base::fmtflags fmt = s.flags();

  a.write(s, s.precision(), s.width(), 0, fmt, 0, showpos, uppercase, s.fill());
  return s;
}

template <class Ch, class Tr>
std::basic_istream<Ch, Tr>& operator>>(std::basic_istream<Ch, Tr>& s, mp_real& a) {
  a.read(s);
  return s;
}

std::string to_string(mp_real &x, int precision = mp::n_output_digits,
    int width = 0, int expn_width = 0,
    std::ios_base::fmtflags fmt = static_cast<std::ios_base::fmtflags>(0),
    bool showpos = false, bool uppercase = false, char fill = ' ');

 double dble(const mp_real& a);






 mp_real_temp operator-(const mp_real &a, const mp_real &b);
 mp_real_temp operator+(const mp_real &a, const mp_real &b);
 mp_real_temp operator*(const mp_real &a, const mp_real &b);
 mp_real_temp operator*(const mp_real &a, const double b);
 mp_real_temp operator*(const double b, const mp_real& a);
 mp_real_temp operator/(const mp_real &a, const mp_real &b);
 mp_real_temp operator/(const mp_real &a, const double b);
 mp_real_temp operator/(const double b, const mp_real &a);

 mp_real_temp operator-(const mp_real &a);

 bool operator>(const mp_real& a, const mp_real& b);
 bool operator>=(const mp_real& a, const mp_real& b);
 bool operator<(const mp_real& a, const mp_real& b);
 bool operator<=(const mp_real& a, const mp_real& b);
 bool operator==(const mp_real& a, const mp_real& b);
 bool operator!=(const mp_real& a, const mp_real& b);

 bool operator>(double a, const mp_real& b);
 bool operator>=(double a, const mp_real& b);
 bool operator<(double a, const mp_real& b);
 bool operator<=(double a, const mp_real& b);
 bool operator==(double a, const mp_real& b);
 bool operator!=(double a, const mp_real& b);

 bool operator>(const mp_real& a, double b);
 bool operator>=(const mp_real& a, double b);
 bool operator<(const mp_real& a, double b);
 bool operator<=(const mp_real& a, double b);
 bool operator==(const mp_real& a, double b);
 bool operator!=(const mp_real& a, double b);

 mp_real_temp pow(const mp_real& a, int n);
 mp_real_temp pow(const mp_real& a, const mp_real& b);
 mp_real_temp pow(const mp_real& a, double b);
 mp_real_temp abs(const mp_real& a);
 mp_real_temp sqrt(const mp_real& a);
 mp_real_temp aint(const mp_real& a);
 mp_real_temp anint(const mp_real& a);
 mp_real_temp exp(const mp_real& a);
 mp_real_temp log(const mp_real& a);
 mp_real_temp log10(const mp_real& a);
 mp_real_temp sin(const mp_real& a);
 mp_real_temp cos(const mp_real& a);
 mp_real_temp tan(const mp_real& a);
 mp_real_temp sinh(const mp_real& a);
 mp_real_temp cosh(const mp_real& a);
 mp_real_temp tanh(const mp_real& a);
 mp_real_temp atan(const mp_real& a);
 mp_real_temp atan2(const mp_real& y, const mp_real& x);
 mp_real_temp asin(const mp_real& a);
 mp_real_temp acos(const mp_real& a);
 mp_real_temp sqr(const mp_real& a);
 mp_real_temp fmod(const mp_real& a, const mp_real& b);
 mp_real_temp mp_rand();

 void mpcsshf(const mp_real& a, mp_real& cosh, mp_real& sinh);
 void mpcssnf(const mp_real& a, mp_real& cosine, mp_real& sine);

 mp_real erfc(const mp_real& arg);
 mp_real_temp erf(const mp_real& arg);
 mp_real_temp bessel(const mp_real& t);
 mp_real_temp besselexp(const mp_real& t);
 mp_real_temp gamma(const mp_real& t);

double mp_two_prod_positive(double a, double b, double &err);
double mp_two_prod(double a, double b, double &err);

template <class T>
inline T sign(T a, T b) { return (b>=0 ? std::abs(a) : -std::abs(a)); }


# 1 "arprec/include/arprec/mp_inline.h" 1
# 14 "arprec/include/arprec/mp_inline.h"
# 1 "/usr/include/c++/5/cstring" 1 3
# 39 "/usr/include/c++/5/cstring" 3
       
# 40 "/usr/include/c++/5/cstring" 3


# 1 "/usr/include/string.h" 1 3 4
# 27 "/usr/include/string.h" 3 4

# 27 "/usr/include/string.h" 3 4
extern "C" {




# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 1 3 4
# 33 "/usr/include/string.h" 2 3 4









extern void *memcpy (void *__restrict __dest, const void *__restrict __src,
       size_t __n) throw () __attribute__ ((__nonnull__ (1, 2)));


extern void *memmove (void *__dest, const void *__src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));






extern void *memccpy (void *__restrict __dest, const void *__restrict __src,
        int __c, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));





extern void *memset (void *__s, int __c, size_t __n) throw () __attribute__ ((__nonnull__ (1)));


extern int memcmp (const void *__s1, const void *__s2, size_t __n)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));



extern "C++"
{
extern void *memchr (void *__s, int __c, size_t __n)
      throw () __asm ("memchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern const void *memchr (const void *__s, int __c, size_t __n)
      throw () __asm ("memchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 90 "/usr/include/string.h" 3 4
}










extern "C++" void *rawmemchr (void *__s, int __c)
     throw () __asm ("rawmemchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern "C++" const void *rawmemchr (const void *__s, int __c)
     throw () __asm ("rawmemchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));







extern "C++" void *memrchr (void *__s, int __c, size_t __n)
      throw () __asm ("memrchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern "C++" const void *memrchr (const void *__s, int __c, size_t __n)
      throw () __asm ("memrchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));









extern char *strcpy (char *__restrict __dest, const char *__restrict __src)
     throw () __attribute__ ((__nonnull__ (1, 2)));

extern char *strncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern char *strcat (char *__restrict __dest, const char *__restrict __src)
     throw () __attribute__ ((__nonnull__ (1, 2)));

extern char *strncat (char *__restrict __dest, const char *__restrict __src,
        size_t __n) throw () __attribute__ ((__nonnull__ (1, 2)));


extern int strcmp (const char *__s1, const char *__s2)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern int strncmp (const char *__s1, const char *__s2, size_t __n)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcoll (const char *__s1, const char *__s2)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern size_t strxfrm (char *__restrict __dest,
         const char *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (2)));

# 162 "/usr/include/string.h" 3 4
extern int strcoll_l (const char *__s1, const char *__s2, __locale_t __l)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));

extern size_t strxfrm_l (char *__dest, const char *__src, size_t __n,
    __locale_t __l) throw () __attribute__ ((__nonnull__ (2, 4)));




extern char *strdup (const char *__s)
     throw () __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));






extern char *strndup (const char *__string, size_t __n)
     throw () __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));
# 206 "/usr/include/string.h" 3 4



extern "C++"
{
extern char *strchr (char *__s, int __c)
     throw () __asm ("strchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern const char *strchr (const char *__s, int __c)
     throw () __asm ("strchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 229 "/usr/include/string.h" 3 4
}






extern "C++"
{
extern char *strrchr (char *__s, int __c)
     throw () __asm ("strrchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern const char *strrchr (const char *__s, int __c)
     throw () __asm ("strrchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 256 "/usr/include/string.h" 3 4
}










extern "C++" char *strchrnul (char *__s, int __c)
     throw () __asm ("strchrnul") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern "C++" const char *strchrnul (const char *__s, int __c)
     throw () __asm ("strchrnul") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));









extern size_t strcspn (const char *__s, const char *__reject)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern size_t strspn (const char *__s, const char *__accept)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern "C++"
{
extern char *strpbrk (char *__s, const char *__accept)
     throw () __asm ("strpbrk") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern const char *strpbrk (const char *__s, const char *__accept)
     throw () __asm ("strpbrk") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 308 "/usr/include/string.h" 3 4
}






extern "C++"
{
extern char *strstr (char *__haystack, const char *__needle)
     throw () __asm ("strstr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern const char *strstr (const char *__haystack, const char *__needle)
     throw () __asm ("strstr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 335 "/usr/include/string.h" 3 4
}







extern char *strtok (char *__restrict __s, const char *__restrict __delim)
     throw () __attribute__ ((__nonnull__ (2)));




extern char *__strtok_r (char *__restrict __s,
    const char *__restrict __delim,
    char **__restrict __save_ptr)
     throw () __attribute__ ((__nonnull__ (2, 3)));

extern char *strtok_r (char *__restrict __s, const char *__restrict __delim,
         char **__restrict __save_ptr)
     throw () __attribute__ ((__nonnull__ (2, 3)));





extern "C++" char *strcasestr (char *__haystack, const char *__needle)
     throw () __asm ("strcasestr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern "C++" const char *strcasestr (const char *__haystack,
         const char *__needle)
     throw () __asm ("strcasestr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 377 "/usr/include/string.h" 3 4
extern void *memmem (const void *__haystack, size_t __haystacklen,
       const void *__needle, size_t __needlelen)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 3)));



extern void *__mempcpy (void *__restrict __dest,
   const void *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));
extern void *mempcpy (void *__restrict __dest,
        const void *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));





extern size_t strlen (const char *__s)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));





extern size_t strnlen (const char *__string, size_t __maxlen)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));





extern char *strerror (int __errnum) throw ();

# 433 "/usr/include/string.h" 3 4
extern char *strerror_r (int __errnum, char *__buf, size_t __buflen)
     throw () __attribute__ ((__nonnull__ (2))) ;





extern char *strerror_l (int __errnum, __locale_t __l) throw ();





extern void __bzero (void *__s, size_t __n) throw () __attribute__ ((__nonnull__ (1)));



extern void bcopy (const void *__src, void *__dest, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern void bzero (void *__s, size_t __n) throw () __attribute__ ((__nonnull__ (1)));


extern int bcmp (const void *__s1, const void *__s2, size_t __n)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));



extern "C++"
{
extern char *index (char *__s, int __c)
     throw () __asm ("index") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern const char *index (const char *__s, int __c)
     throw () __asm ("index") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 482 "/usr/include/string.h" 3 4
}







extern "C++"
{
extern char *rindex (char *__s, int __c)
     throw () __asm ("rindex") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern const char *rindex (const char *__s, int __c)
     throw () __asm ("rindex") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 510 "/usr/include/string.h" 3 4
}







extern int ffs (int __i) throw () __attribute__ ((__const__));




extern int ffsl (long int __l) throw () __attribute__ ((__const__));
__extension__ extern int ffsll (long long int __ll)
     throw () __attribute__ ((__const__));



extern int strcasecmp (const char *__s1, const char *__s2)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strncasecmp (const char *__s1, const char *__s2, size_t __n)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));





extern int strcasecmp_l (const char *__s1, const char *__s2,
    __locale_t __loc)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));

extern int strncasecmp_l (const char *__s1, const char *__s2,
     size_t __n, __locale_t __loc)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 4)));





extern char *strsep (char **__restrict __stringp,
       const char *__restrict __delim)
     throw () __attribute__ ((__nonnull__ (1, 2)));




extern char *strsignal (int __sig) throw ();


extern char *__stpcpy (char *__restrict __dest, const char *__restrict __src)
     throw () __attribute__ ((__nonnull__ (1, 2)));
extern char *stpcpy (char *__restrict __dest, const char *__restrict __src)
     throw () __attribute__ ((__nonnull__ (1, 2)));



extern char *__stpncpy (char *__restrict __dest,
   const char *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));
extern char *stpncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));




extern int strverscmp (const char *__s1, const char *__s2)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern char *strfry (char *__string) throw () __attribute__ ((__nonnull__ (1)));


extern void *memfrob (void *__s, size_t __n) throw () __attribute__ ((__nonnull__ (1)));







extern "C++" char *basename (char *__filename)
     throw () __asm ("basename") __attribute__ ((__nonnull__ (1)));
extern "C++" const char *basename (const char *__filename)
     throw () __asm ("basename") __attribute__ ((__nonnull__ (1)));
# 658 "/usr/include/string.h" 3 4
}
# 43 "/usr/include/c++/5/cstring" 2 3
# 71 "/usr/include/c++/5/cstring" 3
namespace std __attribute__ ((__visibility__ ("default")))
{


  using ::memchr;
  using ::memcmp;
  using ::memcpy;
  using ::memmove;
  using ::memset;
  using ::strcat;
  using ::strcmp;
  using ::strcoll;
  using ::strcpy;
  using ::strcspn;
  using ::strerror;
  using ::strlen;
  using ::strncat;
  using ::strncmp;
  using ::strncpy;
  using ::strspn;
  using ::strtok;
  using ::strxfrm;
  using ::strchr;
  using ::strpbrk;
  using ::strrchr;
  using ::strstr;
# 120 "/usr/include/c++/5/cstring" 3

}
# 15 "arprec/include/arprec/mp_inline.h" 2

# 1 "arprec/include/arprec/double_inline.h" 1
# 21 "arprec/include/arprec/double_inline.h"

# 21 "arprec/include/arprec/double_inline.h"
inline double nint(double d) {
  if (d == floor(d))
    return d;
  return floor(d + 0.5);
}

inline double aint(double a) { return a>0 ? floor(a): ceil(a); }
inline double anint(double a) { return a>0 ? ceil(a-0.5) : floor(a+0.5); }

inline void sincosh(double t, double &sinh_t, double &cosh_t) {
  sinh_t = sinh(t);
  cosh_t = cosh(t);
}

inline double sqr(double t) {
  return t * t;
}
# 17 "arprec/include/arprec/mp_inline.h" 2


inline mp_real_temp operator+(const mp_real &a, const mp_real &b) {
  mp_real c;
  mp_real::mpadd(a, b, c, mp::prec_words);
  return c.toTempAndDestroy();
}


inline mp_real_temp operator-(const mp_real &a, const mp_real &b) {
  mp_real c;
  mp_real::mpsub(a, b, c, mp::prec_words);
  return c.toTempAndDestroy();
}


inline mp_real_temp operator*(const mp_real &a, const mp_real &b) {
  mp_real c;
  mp_real::mpmulx(a, b, c, mp::prec_words);
  return c.toTempAndDestroy();
}


inline mp_real_temp operator*(const mp_real &a, const double b) {
  mp_real c;
  mp_real::mpmuld(a, b, 0, c, mp::prec_words);
  return c.toTempAndDestroy();
}


inline mp_real_temp operator*(const double b, const mp_real &a) {
  mp_real c;
  mp_real::mpmuld(a, b, 0, c, mp::prec_words);
  return c.toTempAndDestroy();
}



inline mp_real_temp operator/(const mp_real &a, const mp_real &b) {
  mp_real c;
  mp_real::mpdivx(a, b, c, mp::prec_words);
  return c.toTempAndDestroy();
}


inline mp_real_temp operator/(const mp_real &a, const double b) {
  mp_real c;
  mp_real::mpdivd(a, b, 0, c, mp::prec_words);
  return c.toTempAndDestroy();
}


inline mp_real_temp operator/(const double b, const mp_real &a) {
  return mp_real(b, 8) / a;
}

inline mp_real& mp_real::operator=(const int& ib) {
  if(ib == 0) { zero(*this); return *this; }
  mpdmc(ib, 0, *this, mp::prec_words);
  return *this;
}

inline mp_real& mp_real::operator=(const double& db) {
  int prec_words = mp::prec_words;
  if(db == 0.0) { zero(*this); return *this; }
  mpdmc(db, 0, *this, prec_words);
  return *this;
}

inline mp_real& mp_real::operator=(const mp_real& jb) {
  if(&jb != this)
    mpeq(jb, *this, mp::prec_words);
  return *this;
}

inline mp_real& mp_real::operator=(const char *a) {
  mp_real::mpdexc(a, static_cast<unsigned int>(strlen(a)), *this);
  return *this;
}

inline mp_real& mp_real::operator+=(const mp_real &b) {

  mp_real::mpadd(*this, b, *this, mp::prec_words);
  return *this;
}

inline mp_real& mp_real::operator*=(const mp_real &b) {

  mp_real::mpmulx(*this, b, *this, mp::prec_words);
  return *this;
}

inline mp_real& mp_real::operator*=(double b) {

  mp_real::mpmuld(*this, b, 0, *this, mp::prec_words);
  return *this;
}

inline mp_real& mp_real::operator-=(const mp_real &b) {

  mp_real::mpsub(*this, b, *this, mp::prec_words);
  return *this;
}

inline mp_real& mp_real::operator/=(const mp_real &b) {

  mp_real::mpdivx(*this, b, *this, mp::prec_words);
  return *this;
}

inline mp_real& mp_real::operator/=(double b) {

  mp_real::mpdivd(*this, b, 0, *this, mp::prec_words);
  return *this;
}

inline bool operator>(const mp_real& a, const mp_real& b) {
  return mp_real::mpcpr(a, b) == 1;
}

inline bool operator>=(const mp_real& a, const mp_real& b) {
  return mp_real::mpcpr(a, b) >= 0;
}

inline bool operator<(const mp_real& a, const mp_real& b) {
  return mp_real::mpcpr(a, b) < 0;
}

inline bool operator<=(const mp_real& a, const mp_real& b) {
  return mp_real::mpcpr(a, b) <= 0;
}

inline bool operator==(const mp_real& a, const mp_real& b) {
  return mp_real::mpcpr(a, b) == 0;
}

inline bool operator!=(const mp_real& a, const mp_real& b) {
  return mp_real::mpcpr(a, b) != 0;
}


inline mp_real_temp operator-(const mp_real &a) {
  mp_real b(a);
  b[1] = -b[1];
  return b.toTempAndDestroy();
}

inline mp_real_temp abs(const mp_real& a) {
  mp_real ret;
  mp_real::mpeq(a, ret, mp::prec_words);
  ret[1] = fabs(ret[1]);
  return ret.toTempAndDestroy();
}







inline mp_real_temp operator+(const mp_real &a, int b) {
  return a + mp_real(double(b), 8);
}

inline mp_real_temp operator+(int b, const mp_real &a) {
  return a + mp_real(double(b), 8);
}

inline mp_real operator+=(mp_real &a, int b) {
  return a += mp_real(double(b), 8);
}

inline mp_real_temp operator-(int b, const mp_real &a) {
  return mp_real(double(b), 8) - a;
}

inline mp_real_temp operator-(const mp_real &a, int b) {
  return a - mp_real(double(b), 8);
}

inline mp_real operator-=(mp_real &a, int b) {
  return a -= mp_real(double(b), 8);
}

inline mp_real_temp operator*(const mp_real &a, int b) {
  return a * double(b);
}

inline mp_real operator*=(mp_real &a, int b) {
  return a *= double(b);
}

inline mp_real_temp operator*(int b, const mp_real &a) {
  return a * double(b);
}

inline mp_real_temp operator/(const mp_real &a, int b) {
  return a / double(b);
}

inline mp_real operator/=(mp_real &a, int b) {
  return a /= double(b);
}

inline mp_real_temp operator/(int b, const mp_real &a) {
  return mp_real(b, 8) / a;
}

inline bool operator>(int b, const mp_real &a) {
  return mp_real(double(b)) > a;
}

inline bool operator>(const mp_real &a, int b) {
  return a > mp_real(double(b));
}

inline bool operator<(int b, const mp_real &a) {
  return mp_real(double(b)) < a;
}

inline bool operator<(const mp_real &a, int b) {
  return a < mp_real(double(b));
}

inline bool operator<=(int b, const mp_real &a) {
  return mp_real(double(b)) <= a;
}

inline bool operator<=(const mp_real &a, int b) {
  return a <= mp_real(double(b));
}

inline bool operator>=(int b, const mp_real &a) {
  return mp_real(double(b)) >= a;
}

inline bool operator>=(const mp_real &a, int b) {
  return a >= mp_real(double(b));
}

inline bool operator==(int b, const mp_real &a) {
  return mp_real(double(b)) == a;
}

inline bool operator==(const mp_real &a, int b) {
  return a == mp_real(double(b));
}

inline bool operator!=(int b, const mp_real &a) {
  return mp_real(double(b)) != a;
}

inline bool operator!=(const mp_real &a, int b) {
  return a != mp_real(double(b));
}





inline mp_real_temp operator+(const mp_real &a, double b) {
  return a + mp_real(b, 8);
}

inline mp_real_temp operator+(double b, const mp_real &a) {
  return a + mp_real(b, 8);
}

inline mp_real operator+=(mp_real &a, double b) {
  return a += mp_real(double(b), 8);
}

inline mp_real_temp operator-(double b, const mp_real &a) {
  return mp_real(b, 8) - a;
}

inline mp_real_temp operator-(const mp_real &a, double b) {
  return a - mp_real(b, 8);
}

inline mp_real operator-=(mp_real &a, double b) {
  return a -= mp_real(b, 8);
}

inline bool operator>(double b, const mp_real &a) {
  return mp_real(b) > a;
}

inline bool operator>(const mp_real &a, double b) {
  return a > mp_real(b);
}

inline bool operator<(double b, const mp_real &a) {
  return mp_real(b) < a;
}

inline bool operator<(const mp_real &a, double b) {
  return a < mp_real(b);
}

inline bool operator<=(double b, const mp_real &a) {
  return mp_real(b) <= a;
}

inline bool operator<=(const mp_real &a, double b) {
  return a <= mp_real(b);
}

inline bool operator>=(double b, const mp_real &a) {
  return mp_real(b) >= a;
}

inline bool operator>=(const mp_real &a, double b) {
  return a >= mp_real(b);
}

inline bool operator==(double b, const mp_real &a) {
  return mp_real(b) == a;
}

inline bool operator==(const mp_real &a, double b) {
  return a == mp_real(b);
}

inline bool operator!=(double b, const mp_real &a) {
  return mp_real(b) != a;
}

inline bool operator!=(const mp_real &a, double b) {
  return a != mp_real(b);
}

inline void mp_real::reallocate(unsigned int sz) {
  if (mpr && alloc)
    delete [] mpr;
  allocate(sz);
}

inline mp_real::mp_real() {
  if (prec_words > 0)
    allocate(static_cast<unsigned int>(prec_words + 5));
  else
    allocate(0U);
}

inline mp_real::mp_real(const mp_real &x) {
  unsigned int sz = static_cast<unsigned int>(x[0]);
  allocate(sz);
  std::memcpy(mpr, x.mpr, sizeof(double) * sz);
}

inline mp_real::mp_real(double a, int sz) {
  allocate(sz);
  if (sz) mpdmc(a, 0, *this, prec_words);
}

inline mp_real::mp_real(const mp_real_temp& x) {
  alloc = true;
  mpr = x.mpr;
}

inline mp_real::mp_real(const double *a) {
  alloc = false;
  mpr = const_cast<double *>(a);
}

inline mp_real::mp_real(double *a) {
  alloc = false;
  mpr = a;
}
# 319 "arprec/include/arprec/mp_real.h" 2
# 10 "precision.h" 2
# 1 "arprec/include/arprec/mp_complex.h" 1
# 15 "arprec/include/arprec/mp_complex.h"
# 1 "arprec/include/arprec/mp_complex_temp.h" 1
# 14 "arprec/include/arprec/mp_complex_temp.h"
class mp_complex_temp: public mp
{
 protected:
 public:
  mp_real_temp real, imag;
  mp_complex_temp(int s = n_words): real(s), imag(s) {}
  mp_complex_temp(const mp_real_temp& a, const mp_real_temp& b)
    : real(a), imag(b) {}
  mp_complex_temp(double *r, double *i): real(r), imag(i) {}
  mp_complex_temp(const double *r, const double *i): real(r), imag(i) {}
};
# 16 "arprec/include/arprec/mp_complex.h" 2

struct mp_complex : mp {
  mp_real real, imag;

  mp_complex():real(), imag() {}
  mp_complex(const mp_real& a, const mp_real& b):real(a), imag(b) {}
  mp_complex(const mp_real& a) : real(a) { mp_real::zero(imag); }
  mp_complex(const mp_complex& x) : real(x.real), imag(x.imag) {}
  mp_complex(double dpr, double dpi = 0.0, int s = n_words)
            : real(dpr, s), imag(dpi, s) {}
  mp_complex(double *r, double *i) : real(r), imag(i) {}
  mp_complex(const double *r, const double *i) : real(r), imag(i) {}
  mp_complex(const mp_complex_temp& x) : real(x.real), imag(x.imag) {}

  mp_complex_temp toTempAndDestroy() {
    return mp_complex_temp(real.toTempAndDestroy(), imag.toTempAndDestroy());
  }

  static void zero(mp_complex& a) {
    mp_real::zero(a.real);
    mp_real::zero(a.imag);
  }

  static void mpcmuld(const mp_complex& a, double db, int n,
        mp_complex& b, int prec_words);
  static void mpcadd(const mp_complex& a, const mp_complex& b, mp_complex& c,
       int prec_words);
  static void mpcsub(const mp_complex& a, const mp_complex& b, mp_complex& c,
       int prec_words);
  static void mpcmul(const mp_complex& a, const mp_complex& b, mp_complex& c,
       int prec_words);
  static void mpcmulx(const mp_complex& a, const mp_complex& b, mp_complex& c,
        int prec_words);
  static void mpcdiv(const mp_complex& a, const mp_complex& b,
       mp_complex& c, int prec_words);
  static void mpcdivx(const mp_complex& a, const mp_complex& b,
        mp_complex& c, int prec_words);
  static void mpceq(const mp_complex& a, mp_complex& b, int prec_words);
  static void mpcsqx(const mp_complex& a, mp_complex& c, int prec_words);
  static void mpcagx(mp_complex& a, mp_complex& b);
  static void mpcsqrtx(const mp_complex& a, mp_complex& b);
  static void mpcpwx(const mp_complex& a, int n, mp_complex& b);
  static void mpcpwr(const mp_complex& a, int n, mp_complex& b);
  static void mpcsqrt(const mp_complex &a, mp_complex& b);


  mp_complex &operator+=(const mp_complex &x);
  mp_complex &operator-=(const mp_complex &x);
  mp_complex &operator*=(const mp_complex &x);
  mp_complex &operator/=(const mp_complex &x);

  mp_complex &operator+=(const mp_real &x);
  mp_complex &operator-=(const mp_real &x);
  mp_complex &operator*=(const mp_real &x);
  mp_complex &operator/=(const mp_real &x);

  mp_complex &operator/=(double x);
  mp_complex &operator/=(int x);

  mp_complex &operator=(const mp_complex &x);
  mp_complex &operator=(const mp_real &x);
  mp_complex &operator=(mp_complex_temp &x);

  mp_complex_temp operator-() {
    return mp_complex_temp(-(this->real), -(this->imag));
  }

  static mp_complex *alloc_array(int n);
  static void free_array(mp_complex *m);

};

 mp_complex_temp operator+(const mp_complex &a,
          const mp_complex &b);
 mp_complex_temp operator+(const mp_complex &a, const mp_real &breal);
 mp_complex_temp operator+(const mp_real &breal, const mp_complex &a);

 mp_complex_temp operator-(const mp_complex &a,
         const mp_complex &b);
 mp_complex_temp operator-(const mp_complex &a,
         const mp_real &breal);
 mp_complex_temp operator-(const mp_real &breal,
         const mp_complex &a);

 mp_complex_temp operator*(const mp_complex &a,
          const mp_complex &b);
 mp_complex_temp operator/(const mp_complex &a,
         const mp_complex &b);
 mp_complex_temp operator/(const mp_complex &a,
         const mp_real &b);
 mp_complex_temp operator/(const mp_real &a,
         const mp_complex &b);
 mp_complex_temp operator/(const mp_complex &a,
         double b);
 mp_complex_temp operator/(double b, const mp_complex &a);
 mp_complex_temp operator/(int b, const mp_complex &a);

 mp_complex_temp operator*(const mp_complex& a, const mp_real& b);
 mp_complex_temp operator*(const mp_real& b, const mp_complex& a);
 mp_complex_temp operator*(const mp_complex& a, double b);
 mp_complex_temp operator*(double b, const mp_complex& a);
 mp_complex_temp exp(const mp_complex& a);
 mp_complex_temp log(const mp_complex& a);
 mp_complex_temp sin(const mp_complex &a);
 mp_complex_temp cos(const mp_complex &a);
 mp_complex_temp sqr(const mp_complex &a);
 mp_complex_temp sqrt(const mp_complex &a);
 mp_real_temp abs(const mp_complex &a);
 mp_real_temp arg(const mp_complex &a);
 mp_complex_temp pow(const mp_complex& a, int n);
 mp_complex_temp pow(const mp_complex& a, const mp_real& b);
 mp_complex_temp pow(const mp_complex& a, const mp_complex& b);

 bool operator==(const mp_complex &a, const mp_complex &b);
 bool operator!=(const mp_complex &a, const mp_complex &b);



# 1 "arprec/include/arprec/mp_complex_inline.h" 1
# 14 "arprec/include/arprec/mp_complex_inline.h"
inline mp_complex_temp operator+(const mp_complex &a, const mp_complex &b) {
  return mp_complex_temp(a.real+b.real, a.imag+b.imag);
}

inline mp_complex_temp operator+(const mp_complex &a, const mp_real &breal) {
  mp_real temp(a.imag);
  return mp_complex_temp(a.real+breal, temp.toTempAndDestroy());
}

inline mp_complex_temp operator+(const mp_real &breal, const mp_complex &a) {
  mp_real temp(a.imag);
  return mp_complex_temp(a.real+breal, temp.toTempAndDestroy());
}

inline mp_complex_temp operator-(const mp_complex &a, const mp_complex &b) {
  return mp_complex_temp(a.real-b.real, a.imag-b.imag);
}

inline mp_complex_temp operator-(const mp_complex &a, const mp_real &breal) {
  mp_real temp(a.imag);
  return mp_complex_temp(a.real - breal, temp.toTempAndDestroy());
}

inline mp_complex_temp operator-(const mp_real &breal, const mp_complex &a) {
  mp_real temp(a.imag);

  temp[1] = -temp[1];
  return mp_complex_temp(breal - a.real, temp.toTempAndDestroy());
}

inline mp_complex_temp operator*(const mp_complex &a, const mp_complex &b) {
  mp_complex c;
  int prec_words = mp::prec_words;
  mp_complex::mpcmulx(a, b, c, prec_words);
  return c.toTempAndDestroy();
}

inline mp_complex_temp operator/(const mp_complex &a, const mp_complex &b) {
  mp_complex c;
  int prec_words = mp::prec_words;
  mp_complex::mpcdivx(a, b, c, prec_words);
  return c.toTempAndDestroy();
}

inline mp_complex_temp operator/(const mp_complex &a, const mp_real &b) {
  mp_complex c;
  int prec_words = mp::prec_words;
  mp_real::mpdivx(a.real, b, c.real, prec_words);
  mp_real::mpdivx(a.imag, b, c.imag, prec_words);
  return c.toTempAndDestroy();
}

inline mp_complex_temp operator/(const mp_complex &a, double b) {
  mp_complex c;
  int prec_words = mp::prec_words;
  mp_real::mpdivd(a.real, b, 0, c.real, prec_words);
  mp_real::mpdivd(a.imag, b, 0, c.imag, prec_words);
  return c.toTempAndDestroy();
}

inline mp_complex_temp operator/(const mp_real &a, const mp_complex &b) {
  mp_real c;
  c = sqr(b.real) + sqr(b.imag);
  c = a/c;
  mp_real_temp ret_imag(b.imag * c);
  ret_imag.mpr[1] = -ret_imag.mpr[1];
  return mp_complex_temp(b.real*c,ret_imag);
}

inline mp_complex_temp operator/(double b, const mp_complex& a) {
  return mp_real(b) / a;
}

inline mp_complex_temp operator/(int b, const mp_complex& a) {
  return mp_real(static_cast<double>(b)) / a;
}

inline mp_complex_temp operator*(const mp_complex& a, double b) {
  mp_complex ret;
  int prec_words = mp::prec_words;
  mp_complex::mpcmuld(a, b, 0, ret, prec_words);
  return ret.toTempAndDestroy();
}

inline mp_complex_temp operator*(double b, const mp_complex& a) {
  return a * b;
}

inline mp_complex_temp operator*(const mp_complex& a, const mp_real& b) {
  mp_complex c;
  int prec_words = mp::prec_words;
  mp_real::mpmulx(a.real, b, c.real, prec_words);
  mp_real::mpmulx(a.imag, b, c.imag, prec_words);
  return c.toTempAndDestroy();
}

inline mp_complex_temp operator*(const mp_real& b, const mp_complex& a) {
  return a * b;
}

inline mp_complex &mp_complex::operator+=(const mp_complex &other) {
  int prec_words = mp::prec_words;
  mp_real::mpadd(this->real, other.real, this->real, prec_words);
  mp_real::mpadd(this->imag, other.imag, this->imag, prec_words);
  return *this;
}

inline mp_complex &mp_complex::operator-=(const mp_complex &other) {
  int prec_words = mp::prec_words;
  mp_real::mpsub(this->real, other.real, this->real, prec_words);
  mp_real::mpsub(this->imag, other.imag, this->imag, prec_words);
  return *this;
}

inline mp_complex &mp_complex::operator*=(const mp_complex &other) {
  mp_complex temp;
  int prec_words = mp::prec_words;
  mpcmulx(*this, other, temp, prec_words);
  mpceq(temp, *this, prec_words);
  return *this;
}

inline mp_complex &mp_complex::operator/=(const mp_complex &other) {
  mp_complex temp;
  int prec_words = mp::prec_words;
  mpcdivx(*this, other, temp, prec_words);
  mpceq(temp, *this, prec_words);
  return *this;
}

inline mp_complex &mp_complex::operator+=(const mp_real &other) {
  int prec_words = mp::prec_words;
  mp_real::mpadd(this->real, other, this->real, prec_words);
  return *this;
}

inline mp_complex &mp_complex::operator-=(const mp_real &other) {
  int prec_words = mp::prec_words;
  mp_real::mpsub(this->real, other, this->real, prec_words);
  return *this;
}

inline mp_complex &mp_complex::operator*=(const mp_real &other) {
  int prec_words = mp::prec_words;
  mp_real::mpmulx(this->real, other, this->real, prec_words);
  mp_real::mpmulx(this->imag, other, this->imag, prec_words);
  return *this;
}

inline mp_complex &mp_complex::operator/=(const mp_real &other) {
  int prec_words = mp::prec_words;
  mp_real::mpdivx(this->real, other, this->real, prec_words);
  mp_real::mpdivx(this->imag, other, this->imag, prec_words);
  return *this;
}

inline bool operator==(const mp_complex &a, const mp_complex &b) {
  return (a.real == b.real) && (a.imag == b.imag);
}

inline bool operator!=(const mp_complex &a, const mp_complex &b) {
  return (a.real != b.real) || (a.imag != b.imag);
}

inline mp_complex &mp_complex::operator=(const mp_complex &other) {
  this->real = other.real;
  this->imag = other.imag;
  return *this;
}

inline mp_complex &mp_complex::operator=(const mp_real &other) {
  this->real = other;
  mp_real::zero(this->imag);
  return *this;
}

inline mp_complex &mp_complex::operator=(mp_complex_temp &other) {
  this->real = other.real;
  this->imag = other.imag;
  return *this;
}

inline mp_complex &mp_complex::operator/=(double other) {
  return *this = *this / other;
}

inline mp_complex &mp_complex::operator/=(int other) {
  return *this = *this / other;
}
# 135 "arprec/include/arprec/mp_complex.h" 2
# 11 "precision.h" 2
# 1 "qd/include/qd/dd_real.h" 1
# 32 "qd/include/qd/dd_real.h"
# 1 "/usr/include/c++/5/cmath" 1 3
# 39 "/usr/include/c++/5/cmath" 3
       
# 40 "/usr/include/c++/5/cmath" 3
# 33 "qd/include/qd/dd_real.h" 2


# 1 "/usr/include/c++/5/limits" 1 3
# 40 "/usr/include/c++/5/limits" 3
       
# 41 "/usr/include/c++/5/limits" 3
# 158 "/usr/include/c++/5/limits" 3

# 158 "/usr/include/c++/5/limits" 3
namespace std __attribute__ ((__visibility__ ("default")))
{







  enum float_round_style
  {
    round_indeterminate = -1,
    round_toward_zero = 0,
    round_to_nearest = 1,
    round_toward_infinity = 2,
    round_toward_neg_infinity = 3
  };







  enum float_denorm_style
  {

    denorm_indeterminate = -1,

    denorm_absent = 0,

    denorm_present = 1
  };
# 202 "/usr/include/c++/5/limits" 3
  struct __numeric_limits_base
  {


    static const bool is_specialized = false;




    static const int digits = 0;


    static const int digits10 = 0;
# 223 "/usr/include/c++/5/limits" 3
    static const bool is_signed = false;


    static const bool is_integer = false;




    static const bool is_exact = false;



    static const int radix = 0;



    static const int min_exponent = 0;



    static const int min_exponent10 = 0;




    static const int max_exponent = 0;



    static const int max_exponent10 = 0;


    static const bool has_infinity = false;



    static const bool has_quiet_NaN = false;



    static const bool has_signaling_NaN = false;


    static const float_denorm_style has_denorm = denorm_absent;



    static const bool has_denorm_loss = false;



    static const bool is_iec559 = false;




    static const bool is_bounded = false;
# 288 "/usr/include/c++/5/limits" 3
    static const bool is_modulo = false;


    static const bool traps = false;


    static const bool tinyness_before = false;




    static const float_round_style round_style =
          round_toward_zero;
  };
# 314 "/usr/include/c++/5/limits" 3
  template<typename _Tp>
    struct numeric_limits : public __numeric_limits_base
    {


      static _Tp
      min() throw() { return _Tp(); }


      static _Tp
      max() throw() { return _Tp(); }
# 335 "/usr/include/c++/5/limits" 3
      static _Tp
      epsilon() throw() { return _Tp(); }


      static _Tp
      round_error() throw() { return _Tp(); }


      static _Tp
      infinity() throw() { return _Tp(); }



      static _Tp
      quiet_NaN() throw() { return _Tp(); }



      static _Tp
      signaling_NaN() throw() { return _Tp(); }




      static _Tp
      denorm_min() throw() { return _Tp(); }
    };
# 381 "/usr/include/c++/5/limits" 3
  template<>
    struct numeric_limits<bool>
    {
      static const bool is_specialized = true;

      static bool
      min() throw() { return false; }

      static bool
      max() throw() { return true; }





      static const int digits = 1;
      static const int digits10 = 0;



      static const bool is_signed = false;
      static const bool is_integer = true;
      static const bool is_exact = true;
      static const int radix = 2;

      static bool
      epsilon() throw() { return false; }

      static bool
      round_error() throw() { return false; }

      static const int min_exponent = 0;
      static const int min_exponent10 = 0;
      static const int max_exponent = 0;
      static const int max_exponent10 = 0;

      static const bool has_infinity = false;
      static const bool has_quiet_NaN = false;
      static const bool has_signaling_NaN = false;
      static const float_denorm_style has_denorm
       = denorm_absent;
      static const bool has_denorm_loss = false;

      static bool
      infinity() throw() { return false; }

      static bool
      quiet_NaN() throw() { return false; }

      static bool
      signaling_NaN() throw() { return false; }

      static bool
      denorm_min() throw() { return false; }

      static const bool is_iec559 = false;
      static const bool is_bounded = true;
      static const bool is_modulo = false;




      static const bool traps = true;
      static const bool tinyness_before = false;
      static const float_round_style round_style
       = round_toward_zero;
    };


  template<>
    struct numeric_limits<char>
    {
      static const bool is_specialized = true;

      static char
      min() throw() { return (((char)(-1) < 0) ? -(((char)(-1) < 0) ? (((((char)1 << ((sizeof(char) * 8 - ((char)(-1) < 0)) - 1)) - 1) << 1) + 1) : ~(char)0) - 1 : (char)0); }

      static char
      max() throw() { return (((char)(-1) < 0) ? (((((char)1 << ((sizeof(char) * 8 - ((char)(-1) < 0)) - 1)) - 1) << 1) + 1) : ~(char)0); }






      static const int digits = (sizeof(char) * 8 - ((char)(-1) < 0));
      static const int digits10 = ((sizeof(char) * 8 - ((char)(-1) < 0)) * 643L / 2136);



      static const bool is_signed = ((char)(-1) < 0);
      static const bool is_integer = true;
      static const bool is_exact = true;
      static const int radix = 2;

      static char
      epsilon() throw() { return 0; }

      static char
      round_error() throw() { return 0; }

      static const int min_exponent = 0;
      static const int min_exponent10 = 0;
      static const int max_exponent = 0;
      static const int max_exponent10 = 0;

      static const bool has_infinity = false;
      static const bool has_quiet_NaN = false;
      static const bool has_signaling_NaN = false;
      static const float_denorm_style has_denorm
       = denorm_absent;
      static const bool has_denorm_loss = false;

      static
      char infinity() throw() { return char(); }

      static char
      quiet_NaN() throw() { return char(); }

      static char
      signaling_NaN() throw() { return char(); }

      static char
      denorm_min() throw() { return static_cast<char>(0); }

      static const bool is_iec559 = false;
      static const bool is_bounded = true;
      static const bool is_modulo = !is_signed;

      static const bool traps = true;
      static const bool tinyness_before = false;
      static const float_round_style round_style
       = round_toward_zero;
    };


  template<>
    struct numeric_limits<signed char>
    {
      static const bool is_specialized = true;

      static signed char
      min() throw() { return -0x7f - 1; }

      static signed char
      max() throw() { return 0x7f; }






      static const int digits = (sizeof(signed char) * 8 - ((signed char)(-1) < 0));
      static const int digits10
       = ((sizeof(signed char) * 8 - ((signed char)(-1) < 0)) * 643L / 2136);



      static const bool is_signed = true;
      static const bool is_integer = true;
      static const bool is_exact = true;
      static const int radix = 2;

      static signed char
      epsilon() throw() { return 0; }

      static signed char
      round_error() throw() { return 0; }

      static const int min_exponent = 0;
      static const int min_exponent10 = 0;
      static const int max_exponent = 0;
      static const int max_exponent10 = 0;

      static const bool has_infinity = false;
      static const bool has_quiet_NaN = false;
      static const bool has_signaling_NaN = false;
      static const float_denorm_style has_denorm
       = denorm_absent;
      static const bool has_denorm_loss = false;

      static signed char
      infinity() throw() { return static_cast<signed char>(0); }

      static signed char
      quiet_NaN() throw() { return static_cast<signed char>(0); }

      static signed char
      signaling_NaN() throw()
      { return static_cast<signed char>(0); }

      static signed char
      denorm_min() throw()
      { return static_cast<signed char>(0); }

      static const bool is_iec559 = false;
      static const bool is_bounded = true;
      static const bool is_modulo = false;

      static const bool traps = true;
      static const bool tinyness_before = false;
      static const float_round_style round_style
       = round_toward_zero;
    };


  template<>
    struct numeric_limits<unsigned char>
    {
      static const bool is_specialized = true;

      static unsigned char
      min() throw() { return 0; }

      static unsigned char
      max() throw() { return 0x7f * 2U + 1; }






      static const int digits
       = (sizeof(unsigned char) * 8 - ((unsigned char)(-1) < 0));
      static const int digits10
       = ((sizeof(unsigned char) * 8 - ((unsigned char)(-1) < 0)) * 643L / 2136);



      static const bool is_signed = false;
      static const bool is_integer = true;
      static const bool is_exact = true;
      static const int radix = 2;

      static unsigned char
      epsilon() throw() { return 0; }

      static unsigned char
      round_error() throw() { return 0; }

      static const int min_exponent = 0;
      static const int min_exponent10 = 0;
      static const int max_exponent = 0;
      static const int max_exponent10 = 0;

      static const bool has_infinity = false;
      static const bool has_quiet_NaN = false;
      static const bool has_signaling_NaN = false;
      static const float_denorm_style has_denorm
       = denorm_absent;
      static const bool has_denorm_loss = false;

      static unsigned char
      infinity() throw()
      { return static_cast<unsigned char>(0); }

      static unsigned char
      quiet_NaN() throw()
      { return static_cast<unsigned char>(0); }

      static unsigned char
      signaling_NaN() throw()
      { return static_cast<unsigned char>(0); }

      static unsigned char
      denorm_min() throw()
      { return static_cast<unsigned char>(0); }

      static const bool is_iec559 = false;
      static const bool is_bounded = true;
      static const bool is_modulo = true;

      static const bool traps = true;
      static const bool tinyness_before = false;
      static const float_round_style round_style
       = round_toward_zero;
    };


  template<>
    struct numeric_limits<wchar_t>
    {
      static const bool is_specialized = true;

      static wchar_t
      min() throw() { return (((wchar_t)(-1) < 0) ? -(((wchar_t)(-1) < 0) ? (((((wchar_t)1 << ((sizeof(wchar_t) * 8 - ((wchar_t)(-1) < 0)) - 1)) - 1) << 1) + 1) : ~(wchar_t)0) - 1 : (wchar_t)0); }

      static wchar_t
      max() throw() { return (((wchar_t)(-1) < 0) ? (((((wchar_t)1 << ((sizeof(wchar_t) * 8 - ((wchar_t)(-1) < 0)) - 1)) - 1) << 1) + 1) : ~(wchar_t)0); }






      static const int digits = (sizeof(wchar_t) * 8 - ((wchar_t)(-1) < 0));
      static const int digits10
       = ((sizeof(wchar_t) * 8 - ((wchar_t)(-1) < 0)) * 643L / 2136);



      static const bool is_signed = ((wchar_t)(-1) < 0);
      static const bool is_integer = true;
      static const bool is_exact = true;
      static const int radix = 2;

      static wchar_t
      epsilon() throw() { return 0; }

      static wchar_t
      round_error() throw() { return 0; }

      static const int min_exponent = 0;
      static const int min_exponent10 = 0;
      static const int max_exponent = 0;
      static const int max_exponent10 = 0;

      static const bool has_infinity = false;
      static const bool has_quiet_NaN = false;
      static const bool has_signaling_NaN = false;
      static const float_denorm_style has_denorm
       = denorm_absent;
      static const bool has_denorm_loss = false;

      static wchar_t
      infinity() throw() { return wchar_t(); }

      static wchar_t
      quiet_NaN() throw() { return wchar_t(); }

      static wchar_t
      signaling_NaN() throw() { return wchar_t(); }

      static wchar_t
      denorm_min() throw() { return wchar_t(); }

      static const bool is_iec559 = false;
      static const bool is_bounded = true;
      static const bool is_modulo = !is_signed;

      static const bool traps = true;
      static const bool tinyness_before = false;
      static const float_round_style round_style
       = round_toward_zero;
    };
# 852 "/usr/include/c++/5/limits" 3
  template<>
    struct numeric_limits<short>
    {
      static const bool is_specialized = true;

      static short
      min() throw() { return -0x7fff - 1; }

      static short
      max() throw() { return 0x7fff; }






      static const int digits = (sizeof(short) * 8 - ((short)(-1) < 0));
      static const int digits10 = ((sizeof(short) * 8 - ((short)(-1) < 0)) * 643L / 2136);



      static const bool is_signed = true;
      static const bool is_integer = true;
      static const bool is_exact = true;
      static const int radix = 2;

      static short
      epsilon() throw() { return 0; }

      static short
      round_error() throw() { return 0; }

      static const int min_exponent = 0;
      static const int min_exponent10 = 0;
      static const int max_exponent = 0;
      static const int max_exponent10 = 0;

      static const bool has_infinity = false;
      static const bool has_quiet_NaN = false;
      static const bool has_signaling_NaN = false;
      static const float_denorm_style has_denorm
       = denorm_absent;
      static const bool has_denorm_loss = false;

      static short
      infinity() throw() { return short(); }

      static short
      quiet_NaN() throw() { return short(); }

      static short
      signaling_NaN() throw() { return short(); }

      static short
      denorm_min() throw() { return short(); }

      static const bool is_iec559 = false;
      static const bool is_bounded = true;
      static const bool is_modulo = false;

      static const bool traps = true;
      static const bool tinyness_before = false;
      static const float_round_style round_style
       = round_toward_zero;
    };


  template<>
    struct numeric_limits<unsigned short>
    {
      static const bool is_specialized = true;

      static unsigned short
      min() throw() { return 0; }

      static unsigned short
      max() throw() { return 0x7fff * 2U + 1; }






      static const int digits
       = (sizeof(unsigned short) * 8 - ((unsigned short)(-1) < 0));
      static const int digits10
       = ((sizeof(unsigned short) * 8 - ((unsigned short)(-1) < 0)) * 643L / 2136);



      static const bool is_signed = false;
      static const bool is_integer = true;
      static const bool is_exact = true;
      static const int radix = 2;

      static unsigned short
      epsilon() throw() { return 0; }

      static unsigned short
      round_error() throw() { return 0; }

      static const int min_exponent = 0;
      static const int min_exponent10 = 0;
      static const int max_exponent = 0;
      static const int max_exponent10 = 0;

      static const bool has_infinity = false;
      static const bool has_quiet_NaN = false;
      static const bool has_signaling_NaN = false;
      static const float_denorm_style has_denorm
       = denorm_absent;
      static const bool has_denorm_loss = false;

      static unsigned short
      infinity() throw()
      { return static_cast<unsigned short>(0); }

      static unsigned short
      quiet_NaN() throw()
      { return static_cast<unsigned short>(0); }

      static unsigned short
      signaling_NaN() throw()
      { return static_cast<unsigned short>(0); }

      static unsigned short
      denorm_min() throw()
      { return static_cast<unsigned short>(0); }

      static const bool is_iec559 = false;
      static const bool is_bounded = true;
      static const bool is_modulo = true;

      static const bool traps = true;
      static const bool tinyness_before = false;
      static const float_round_style round_style
       = round_toward_zero;
    };


  template<>
    struct numeric_limits<int>
    {
      static const bool is_specialized = true;

      static int
      min() throw() { return -0x7fffffff - 1; }

      static int
      max() throw() { return 0x7fffffff; }






      static const int digits = (sizeof(int) * 8 - ((int)(-1) < 0));
      static const int digits10 = ((sizeof(int) * 8 - ((int)(-1) < 0)) * 643L / 2136);



      static const bool is_signed = true;
      static const bool is_integer = true;
      static const bool is_exact = true;
      static const int radix = 2;

      static int
      epsilon() throw() { return 0; }

      static int
      round_error() throw() { return 0; }

      static const int min_exponent = 0;
      static const int min_exponent10 = 0;
      static const int max_exponent = 0;
      static const int max_exponent10 = 0;

      static const bool has_infinity = false;
      static const bool has_quiet_NaN = false;
      static const bool has_signaling_NaN = false;
      static const float_denorm_style has_denorm
       = denorm_absent;
      static const bool has_denorm_loss = false;

      static int
      infinity() throw() { return static_cast<int>(0); }

      static int
      quiet_NaN() throw() { return static_cast<int>(0); }

      static int
      signaling_NaN() throw() { return static_cast<int>(0); }

      static int
      denorm_min() throw() { return static_cast<int>(0); }

      static const bool is_iec559 = false;
      static const bool is_bounded = true;
      static const bool is_modulo = false;

      static const bool traps = true;
      static const bool tinyness_before = false;
      static const float_round_style round_style
       = round_toward_zero;
    };


  template<>
    struct numeric_limits<unsigned int>
    {
      static const bool is_specialized = true;

      static unsigned int
      min() throw() { return 0; }

      static unsigned int
      max() throw() { return 0x7fffffff * 2U + 1; }






      static const int digits
       = (sizeof(unsigned int) * 8 - ((unsigned int)(-1) < 0));
      static const int digits10
       = ((sizeof(unsigned int) * 8 - ((unsigned int)(-1) < 0)) * 643L / 2136);



      static const bool is_signed = false;
      static const bool is_integer = true;
      static const bool is_exact = true;
      static const int radix = 2;

      static unsigned int
      epsilon() throw() { return 0; }

      static unsigned int
      round_error() throw() { return 0; }

      static const int min_exponent = 0;
      static const int min_exponent10 = 0;
      static const int max_exponent = 0;
      static const int max_exponent10 = 0;

      static const bool has_infinity = false;
      static const bool has_quiet_NaN = false;
      static const bool has_signaling_NaN = false;
      static const float_denorm_style has_denorm
       = denorm_absent;
      static const bool has_denorm_loss = false;

      static unsigned int
      infinity() throw() { return static_cast<unsigned int>(0); }

      static unsigned int
      quiet_NaN() throw()
      { return static_cast<unsigned int>(0); }

      static unsigned int
      signaling_NaN() throw()
      { return static_cast<unsigned int>(0); }

      static unsigned int
      denorm_min() throw()
      { return static_cast<unsigned int>(0); }

      static const bool is_iec559 = false;
      static const bool is_bounded = true;
      static const bool is_modulo = true;

      static const bool traps = true;
      static const bool tinyness_before = false;
      static const float_round_style round_style
       = round_toward_zero;
    };


  template<>
    struct numeric_limits<long>
    {
      static const bool is_specialized = true;

      static long
      min() throw() { return -0x7fffffffffffffffL - 1; }

      static long
      max() throw() { return 0x7fffffffffffffffL; }






      static const int digits = (sizeof(long) * 8 - ((long)(-1) < 0));
      static const int digits10 = ((sizeof(long) * 8 - ((long)(-1) < 0)) * 643L / 2136);



      static const bool is_signed = true;
      static const bool is_integer = true;
      static const bool is_exact = true;
      static const int radix = 2;

      static long
      epsilon() throw() { return 0; }

      static long
      round_error() throw() { return 0; }

      static const int min_exponent = 0;
      static const int min_exponent10 = 0;
      static const int max_exponent = 0;
      static const int max_exponent10 = 0;

      static const bool has_infinity = false;
      static const bool has_quiet_NaN = false;
      static const bool has_signaling_NaN = false;
      static const float_denorm_style has_denorm
       = denorm_absent;
      static const bool has_denorm_loss = false;

      static long
      infinity() throw() { return static_cast<long>(0); }

      static long
      quiet_NaN() throw() { return static_cast<long>(0); }

      static long
      signaling_NaN() throw() { return static_cast<long>(0); }

      static long
      denorm_min() throw() { return static_cast<long>(0); }

      static const bool is_iec559 = false;
      static const bool is_bounded = true;
      static const bool is_modulo = false;

      static const bool traps = true;
      static const bool tinyness_before = false;
      static const float_round_style round_style
       = round_toward_zero;
    };


  template<>
    struct numeric_limits<unsigned long>
    {
      static const bool is_specialized = true;

      static unsigned long
      min() throw() { return 0; }

      static unsigned long
      max() throw() { return 0x7fffffffffffffffL * 2UL + 1; }






      static const int digits
       = (sizeof(unsigned long) * 8 - ((unsigned long)(-1) < 0));
      static const int digits10
       = ((sizeof(unsigned long) * 8 - ((unsigned long)(-1) < 0)) * 643L / 2136);



      static const bool is_signed = false;
      static const bool is_integer = true;
      static const bool is_exact = true;
      static const int radix = 2;

      static unsigned long
      epsilon() throw() { return 0; }

      static unsigned long
      round_error() throw() { return 0; }

      static const int min_exponent = 0;
      static const int min_exponent10 = 0;
      static const int max_exponent = 0;
      static const int max_exponent10 = 0;

      static const bool has_infinity = false;
      static const bool has_quiet_NaN = false;
      static const bool has_signaling_NaN = false;
      static const float_denorm_style has_denorm
       = denorm_absent;
      static const bool has_denorm_loss = false;

      static unsigned long
      infinity() throw()
      { return static_cast<unsigned long>(0); }

      static unsigned long
      quiet_NaN() throw()
      { return static_cast<unsigned long>(0); }

      static unsigned long
      signaling_NaN() throw()
      { return static_cast<unsigned long>(0); }

      static unsigned long
      denorm_min() throw()
      { return static_cast<unsigned long>(0); }

      static const bool is_iec559 = false;
      static const bool is_bounded = true;
      static const bool is_modulo = true;

      static const bool traps = true;
      static const bool tinyness_before = false;
      static const float_round_style round_style
       = round_toward_zero;
    };


  template<>
    struct numeric_limits<long long>
    {
      static const bool is_specialized = true;

      static long long
      min() throw() { return -0x7fffffffffffffffLL - 1; }

      static long long
      max() throw() { return 0x7fffffffffffffffLL; }






      static const int digits
       = (sizeof(long long) * 8 - ((long long)(-1) < 0));
      static const int digits10
       = ((sizeof(long long) * 8 - ((long long)(-1) < 0)) * 643L / 2136);



      static const bool is_signed = true;
      static const bool is_integer = true;
      static const bool is_exact = true;
      static const int radix = 2;

      static long long
      epsilon() throw() { return 0; }

      static long long
      round_error() throw() { return 0; }

      static const int min_exponent = 0;
      static const int min_exponent10 = 0;
      static const int max_exponent = 0;
      static const int max_exponent10 = 0;

      static const bool has_infinity = false;
      static const bool has_quiet_NaN = false;
      static const bool has_signaling_NaN = false;
      static const float_denorm_style has_denorm
       = denorm_absent;
      static const bool has_denorm_loss = false;

      static long long
      infinity() throw() { return static_cast<long long>(0); }

      static long long
      quiet_NaN() throw() { return static_cast<long long>(0); }

      static long long
      signaling_NaN() throw()
      { return static_cast<long long>(0); }

      static long long
      denorm_min() throw() { return static_cast<long long>(0); }

      static const bool is_iec559 = false;
      static const bool is_bounded = true;
      static const bool is_modulo = false;

      static const bool traps = true;
      static const bool tinyness_before = false;
      static const float_round_style round_style
       = round_toward_zero;
    };


  template<>
    struct numeric_limits<unsigned long long>
    {
      static const bool is_specialized = true;

      static unsigned long long
      min() throw() { return 0; }

      static unsigned long long
      max() throw() { return 0x7fffffffffffffffLL * 2ULL + 1; }






      static const int digits
       = (sizeof(unsigned long long) * 8 - ((unsigned long long)(-1) < 0));
      static const int digits10
       = ((sizeof(unsigned long long) * 8 - ((unsigned long long)(-1) < 0)) * 643L / 2136);



      static const bool is_signed = false;
      static const bool is_integer = true;
      static const bool is_exact = true;
      static const int radix = 2;

      static unsigned long long
      epsilon() throw() { return 0; }

      static unsigned long long
      round_error() throw() { return 0; }

      static const int min_exponent = 0;
      static const int min_exponent10 = 0;
      static const int max_exponent = 0;
      static const int max_exponent10 = 0;

      static const bool has_infinity = false;
      static const bool has_quiet_NaN = false;
      static const bool has_signaling_NaN = false;
      static const float_denorm_style has_denorm
       = denorm_absent;
      static const bool has_denorm_loss = false;

      static unsigned long long
      infinity() throw()
      { return static_cast<unsigned long long>(0); }

      static unsigned long long
      quiet_NaN() throw()
      { return static_cast<unsigned long long>(0); }

      static unsigned long long
      signaling_NaN() throw()
      { return static_cast<unsigned long long>(0); }

      static unsigned long long
      denorm_min() throw()
      { return static_cast<unsigned long long>(0); }

      static const bool is_iec559 = false;
      static const bool is_bounded = true;
      static const bool is_modulo = true;

      static const bool traps = true;
      static const bool tinyness_before = false;
      static const float_round_style round_style
       = round_toward_zero;
    };
# 1569 "/usr/include/c++/5/limits" 3
  template<> struct numeric_limits<__int128> { static const bool is_specialized = true; static __int128 min() throw() { return (((__int128)(-1) < 0) ? -(((__int128)(-1) < 0) ? (((((__int128)1 << ((128 - ((__int128)(-1) < 0)) - 1)) - 1) << 1) + 1) : ~(__int128)0) - 1 : (__int128)0); } static __int128 max() throw() { return (((__int128)(-1) < 0) ? (((((__int128)1 << ((128 - ((__int128)(-1) < 0)) - 1)) - 1) << 1) + 1) : ~(__int128)0); } static const int digits = 128 - 1; static const int digits10 = (128 - 1) * 643L / 2136; static const bool is_signed = true; static const bool is_integer = true; static const bool is_exact = true; static const int radix = 2; static __int128 epsilon() throw() { return 0; } static __int128 round_error() throw() { return 0; } static const int min_exponent = 0; static const int min_exponent10 = 0; static const int max_exponent = 0; static const int max_exponent10 = 0; static const bool has_infinity = false; static const bool has_quiet_NaN = false; static const bool has_signaling_NaN = false; static const float_denorm_style has_denorm = denorm_absent; static const bool has_denorm_loss = false; static __int128 infinity() throw() { return static_cast<__int128>(0); } static __int128 quiet_NaN() throw() { return static_cast<__int128>(0); } static __int128 signaling_NaN() throw() { return static_cast<__int128>(0); } static __int128 denorm_min() throw() { return static_cast<__int128>(0); } static const bool is_iec559 = false; static const bool is_bounded = true; static const bool is_modulo = false; static const bool traps = true; static const bool tinyness_before = false; static const float_round_style round_style = round_toward_zero; }; template<> struct numeric_limits<unsigned __int128> { static const bool is_specialized = true; static unsigned __int128 min() throw() { return 0; } static unsigned __int128 max() throw() { return (((unsigned __int128)(-1) < 0) ? (((((unsigned __int128)1 << ((128 - ((unsigned __int128)(-1) < 0)) - 1)) - 1) << 1) + 1) : ~(unsigned __int128)0); } static const int digits = 128; static const int digits10 = 128 * 643L / 2136; static const bool is_signed = false; static const bool is_integer = true; static const bool is_exact = true; static const int radix = 2; static unsigned __int128 epsilon() throw() { return 0; } static unsigned __int128 round_error() throw() { return 0; } static const int min_exponent = 0; static const int min_exponent10 = 0; static const int max_exponent = 0; static const int max_exponent10 = 0; static const bool has_infinity = false; static const bool has_quiet_NaN = false; static const bool has_signaling_NaN = false; static const float_denorm_style has_denorm = denorm_absent; static const bool has_denorm_loss = false; static unsigned __int128 infinity() throw() { return static_cast<unsigned __int128>(0); } static unsigned __int128 quiet_NaN() throw() { return static_cast<unsigned __int128>(0); } static unsigned __int128 signaling_NaN() throw() { return static_cast<unsigned __int128>(0); } static unsigned __int128 denorm_min() throw() { return static_cast<unsigned __int128>(0); } static const bool is_iec559 = false; static const bool is_bounded = true; static const bool is_modulo = true; static const bool traps = true; static const bool tinyness_before = false; static const float_round_style round_style = round_toward_zero; };
# 1592 "/usr/include/c++/5/limits" 3
  template<>
    struct numeric_limits<float>
    {
      static const bool is_specialized = true;

      static float
      min() throw() { return 1.17549435082228750797e-38F; }

      static float
      max() throw() { return 3.40282346638528859812e+38F; }






      static const int digits = 24;
      static const int digits10 = 6;




      static const bool is_signed = true;
      static const bool is_integer = false;
      static const bool is_exact = false;
      static const int radix = 2;

      static float
      epsilon() throw() { return 1.19209289550781250000e-7F; }

      static float
      round_error() throw() { return 0.5F; }

      static const int min_exponent = (-125);
      static const int min_exponent10 = (-37);
      static const int max_exponent = 128;
      static const int max_exponent10 = 38;

      static const bool has_infinity = 1;
      static const bool has_quiet_NaN = 1;
      static const bool has_signaling_NaN = has_quiet_NaN;
      static const float_denorm_style has_denorm
 = bool(1) ? denorm_present : denorm_absent;
      static const bool has_denorm_loss
       = false;

      static float
      infinity() throw() { return __builtin_huge_valf(); }

      static float
      quiet_NaN() throw() { return __builtin_nanf(""); }

      static float
      signaling_NaN() throw() { return __builtin_nansf(""); }

      static float
      denorm_min() throw() { return 1.40129846432481707092e-45F; }

      static const bool is_iec559
 = has_infinity && has_quiet_NaN && has_denorm == denorm_present;
      static const bool is_bounded = true;
      static const bool is_modulo = false;

      static const bool traps = false;
      static const bool tinyness_before
       = false;
      static const float_round_style round_style
       = round_to_nearest;
    };






  template<>
    struct numeric_limits<double>
    {
      static const bool is_specialized = true;

      static double
      min() throw() { return double(2.22507385850720138309e-308L); }

      static double
      max() throw() { return double(1.79769313486231570815e+308L); }






      static const int digits = 53;
      static const int digits10 = 15;




      static const bool is_signed = true;
      static const bool is_integer = false;
      static const bool is_exact = false;
      static const int radix = 2;

      static double
      epsilon() throw() { return double(2.22044604925031308085e-16L); }

      static double
      round_error() throw() { return 0.5; }

      static const int min_exponent = (-1021);
      static const int min_exponent10 = (-307);
      static const int max_exponent = 1024;
      static const int max_exponent10 = 308;

      static const bool has_infinity = 1;
      static const bool has_quiet_NaN = 1;
      static const bool has_signaling_NaN = has_quiet_NaN;
      static const float_denorm_style has_denorm
 = bool(1) ? denorm_present : denorm_absent;
      static const bool has_denorm_loss
        = false;

      static double
      infinity() throw() { return __builtin_huge_val(); }

      static double
      quiet_NaN() throw() { return __builtin_nan(""); }

      static double
      signaling_NaN() throw() { return __builtin_nans(""); }

      static double
      denorm_min() throw() { return double(4.94065645841246544177e-324L); }

      static const bool is_iec559
 = has_infinity && has_quiet_NaN && has_denorm == denorm_present;
      static const bool is_bounded = true;
      static const bool is_modulo = false;

      static const bool traps = false;
      static const bool tinyness_before
       = false;
      static const float_round_style round_style
       = round_to_nearest;
    };






  template<>
    struct numeric_limits<long double>
    {
      static const bool is_specialized = true;

      static long double
      min() throw() { return 3.36210314311209350626e-4932L; }

      static long double
      max() throw() { return 1.18973149535723176502e+4932L; }






      static const int digits = 64;
      static const int digits10 = 18;




      static const bool is_signed = true;
      static const bool is_integer = false;
      static const bool is_exact = false;
      static const int radix = 2;

      static long double
      epsilon() throw() { return 1.08420217248550443401e-19L; }

      static long double
      round_error() throw() { return 0.5L; }

      static const int min_exponent = (-16381);
      static const int min_exponent10 = (-4931);
      static const int max_exponent = 16384;
      static const int max_exponent10 = 4932;

      static const bool has_infinity = 1;
      static const bool has_quiet_NaN = 1;
      static const bool has_signaling_NaN = has_quiet_NaN;
      static const float_denorm_style has_denorm
 = bool(1) ? denorm_present : denorm_absent;
      static const bool has_denorm_loss
 = false;

      static long double
      infinity() throw() { return __builtin_huge_vall(); }

      static long double
      quiet_NaN() throw() { return __builtin_nanl(""); }

      static long double
      signaling_NaN() throw() { return __builtin_nansl(""); }

      static long double
      denorm_min() throw() { return 3.64519953188247460253e-4951L; }

      static const bool is_iec559
 = has_infinity && has_quiet_NaN && has_denorm == denorm_present;
      static const bool is_bounded = true;
      static const bool is_modulo = false;

      static const bool traps = false;
      static const bool tinyness_before =
      false;
      static const float_round_style round_style =
            round_to_nearest;
    };






}
# 36 "qd/include/qd/dd_real.h" 2
# 1 "qd/include/qd/qd_config.h" 1
# 37 "qd/include/qd/dd_real.h" 2
# 1 "qd/include/qd/fpu.h" 1
# 21 "qd/include/qd/fpu.h"

# 21 "qd/include/qd/fpu.h"
extern "C" {






 void fpu_fix_start(unsigned int *old_cw);




 void fpu_fix_end(unsigned int *old_cw);


}
# 38 "qd/include/qd/dd_real.h" 2
# 62 "qd/include/qd/dd_real.h"
struct dd_real {
  double x[2];

  dd_real(double hi, double lo) { x[0] = hi; x[1] = lo; }
  dd_real() {x[0] = 0.0; x[1] = 0.0; }
  dd_real(double h) { x[0] = h; x[1] = 0.0; }
  dd_real(int h) {
    x[0] = (static_cast<double>(h));
    x[1] = 0.0;
  }

  dd_real (const char *s);
  explicit dd_real (const double *d) {
    x[0] = d[0]; x[1] = d[1];
  }

  static void error(const char *msg);

  double _hi() const { return x[0]; }
  double _lo() const { return x[1]; }

  static const dd_real _2pi;
  static const dd_real _pi;
  static const dd_real _3pi4;
  static const dd_real _pi2;
  static const dd_real _pi4;
  static const dd_real _e;
  static const dd_real _log2;
  static const dd_real _log10;
  static const dd_real _nan;
  static const dd_real _inf;

  static const double _eps;
  static const double _min_normalized;
  static const dd_real _max;
  static const dd_real _safe_max;
  static const int _ndigits;

  bool isnan() const { return std::isnan(x[0]) || std::isnan(x[1]); }
  bool isfinite() const { return std::isfinite(x[0]); }
  bool isinf() const { return std::isinf(x[0]); }

  static dd_real add(double a, double b);
  static dd_real ieee_add(const dd_real &a, const dd_real &b);
  static dd_real sloppy_add(const dd_real &a, const dd_real &b);

  dd_real &operator+=(double a);
  dd_real &operator+=(const dd_real &a);

  static dd_real sub(double a, double b);

  dd_real &operator-=(double a);
  dd_real &operator-=(const dd_real &a);

  dd_real operator-() const;

  static dd_real mul(double a, double b);

  dd_real &operator*=(double a);
  dd_real &operator*=(const dd_real &a);

  static dd_real div(double a, double b);
  static dd_real sloppy_div(const dd_real &a, const dd_real &b);
  static dd_real accurate_div(const dd_real &a, const dd_real &b);

  dd_real &operator/=(double a);
  dd_real &operator/=(const dd_real &a);

  dd_real &operator=(double a);
  dd_real &operator=(const char *s);

  dd_real operator^(int n);
  static dd_real sqr(double d);

  static dd_real sqrt(double a);

  bool is_zero() const;
  bool is_one() const;
  bool is_positive() const;
  bool is_negative() const;

  static dd_real rand(void);

  void to_digits(char *s, int &expn, int precision = _ndigits) const;
  void write(char *s, int len, int precision = _ndigits,
      bool showpos = false, bool uppercase = false) const;
  std::string to_string(int precision = _ndigits, int width = 0,
      std::ios_base::fmtflags fmt = static_cast<std::ios_base::fmtflags>(0),
      bool showpos = false, bool uppercase = false, char fill = ' ') const;
  int read(const char *s, dd_real &a);


  void dump(const std::string &name = "", std::ostream &os = std::cerr) const;
  void dump_bits(const std::string &name = "",
                 std::ostream &os = std::cerr) const;

  static dd_real debug_rand();

  explicit operator double() const { return x[0]; }
};


namespace std {
  template <>
  class numeric_limits<dd_real> : public numeric_limits<double> {
  public:
    inline static double epsilon() { return dd_real::_eps; }
    inline static dd_real max() { return dd_real::_max; }
    inline static dd_real safe_max() { return dd_real::_safe_max; }
    inline static double min() { return dd_real::_min_normalized; }
    static const int digits = 104;
    static const int digits10 = 31;
  };
}

 dd_real ddrand(void);
 dd_real sqrt(const dd_real &a);

 dd_real polyeval(const dd_real *c, int n, const dd_real &x);
 dd_real polyroot(const dd_real *c, int n,
    const dd_real &x0, int max_iter = 32, double thresh = 0.0);

 inline bool isnan(const dd_real &a) { return a.isnan(); }
 inline bool isfinite(const dd_real &a) { return a.isfinite(); }
 inline bool isinf(const dd_real &a) { return a.isinf(); }


 dd_real mul_pwr2(const dd_real &dd, double d);

 dd_real operator+(const dd_real &a, double b);
 dd_real operator+(double a, const dd_real &b);
 dd_real operator+(const dd_real &a, const dd_real &b);

 dd_real operator-(const dd_real &a, double b);
 dd_real operator-(double a, const dd_real &b);
 dd_real operator-(const dd_real &a, const dd_real &b);

 dd_real operator*(const dd_real &a, double b);
 dd_real operator*(double a, const dd_real &b);
 dd_real operator*(const dd_real &a, const dd_real &b);

 dd_real operator/(const dd_real &a, double b);
 dd_real operator/(double a, const dd_real &b);
 dd_real operator/(const dd_real &a, const dd_real &b);

 dd_real inv(const dd_real &a);

 dd_real rem(const dd_real &a, const dd_real &b);
 dd_real drem(const dd_real &a, const dd_real &b);
 dd_real divrem(const dd_real &a, const dd_real &b, dd_real &r);

 dd_real pow(const dd_real &a, int n);
 dd_real pow(const dd_real &a, const dd_real &b);
 dd_real npwr(const dd_real &a, int n);
 dd_real sqr(const dd_real &a);

 dd_real sqrt(const dd_real &a);
 dd_real nroot(const dd_real &a, int n);

 bool operator==(const dd_real &a, double b);
 bool operator==(double a, const dd_real &b);
 bool operator==(const dd_real &a, const dd_real &b);

 bool operator<=(const dd_real &a, double b);
 bool operator<=(double a, const dd_real &b);
 bool operator<=(const dd_real &a, const dd_real &b);

 bool operator>=(const dd_real &a, double b);
 bool operator>=(double a, const dd_real &b);
 bool operator>=(const dd_real &a, const dd_real &b);

 bool operator<(const dd_real &a, double b);
 bool operator<(double a, const dd_real &b);
 bool operator<(const dd_real &a, const dd_real &b);

 bool operator>(const dd_real &a, double b);
 bool operator>(double a, const dd_real &b);
 bool operator>(const dd_real &a, const dd_real &b);

 bool operator!=(const dd_real &a, double b);
 bool operator!=(double a, const dd_real &b);
 bool operator!=(const dd_real &a, const dd_real &b);

 dd_real nint(const dd_real &a);
 dd_real floor(const dd_real &a);
 dd_real ceil(const dd_real &a);
 dd_real aint(const dd_real &a);

 dd_real ddrand(void);

double to_double(const dd_real &a);
int to_int(const dd_real &a);

 dd_real exp(const dd_real &a);
 dd_real ldexp(const dd_real &a, int exp);
 dd_real log(const dd_real &a);
 dd_real log10(const dd_real &a);

 dd_real sin(const dd_real &a);
 dd_real cos(const dd_real &a);
 dd_real tan(const dd_real &a);
 void sincos(const dd_real &a, dd_real &sin_a, dd_real &cos_a);

 dd_real asin(const dd_real &a);
 dd_real acos(const dd_real &a);
 dd_real atan(const dd_real &a);
 dd_real atan2(const dd_real &y, const dd_real &x);

 dd_real sinh(const dd_real &a);
 dd_real cosh(const dd_real &a);
 dd_real tanh(const dd_real &a);
 void sincosh(const dd_real &a,
                      dd_real &sinh_a, dd_real &cosh_a);

 dd_real asinh(const dd_real &a);
 dd_real acosh(const dd_real &a);
 dd_real atanh(const dd_real &a);

 dd_real fabs(const dd_real &a);
 dd_real abs(const dd_real &a);

 dd_real fmod(const dd_real &a, const dd_real &b);

 std::ostream& operator<<(std::ostream &s, const dd_real &a);
 std::istream& operator>>(std::istream &s, dd_real &a);

# 1 "qd/include/qd/dd_inline.h" 1
# 16 "qd/include/qd/dd_inline.h"
# 1 "/usr/include/c++/5/cmath" 1 3
# 39 "/usr/include/c++/5/cmath" 3
       
# 40 "/usr/include/c++/5/cmath" 3
# 17 "qd/include/qd/dd_inline.h" 2
# 1 "qd/include/qd/inline.h" 1
# 26 "qd/include/qd/inline.h"
# 1 "/usr/include/c++/5/cmath" 1 3
# 39 "/usr/include/c++/5/cmath" 3
       
# 40 "/usr/include/c++/5/cmath" 3
# 27 "qd/include/qd/inline.h" 2


namespace qd {

static const double _d_nan = std::numeric_limits<double>::quiet_NaN();
static const double _d_inf = std::numeric_limits<double>::infinity();



inline double quick_two_sum(double a, double b, double &err) {
  double s = a + b;
  err = b - (s - a);
  return s;
}


inline double quick_two_diff(double a, double b, double &err) {
  double s = a - b;
  err = (a - s) - b;
  return s;
}


inline double two_sum(double a, double b, double &err) {
  double s = a + b;
  double bb = s - a;
  err = (a - (s - bb)) + (b - bb);
  return s;
}


inline double two_diff(double a, double b, double &err) {
  double s = a - b;
  double bb = s - a;
  err = (a - (s - bb)) - (b + bb);
  return s;
}



inline void split(double a, double &hi, double &lo) {
  double temp;
  if (a > 6.69692879491417e+299 || a < -6.69692879491417e+299) {
    a *= 3.7252902984619140625e-09;
    temp = 134217729.0 * a;
    hi = temp - (temp - a);
    lo = a - hi;
    hi *= 268435456.0;
    lo *= 268435456.0;
  } else {
    temp = 134217729.0 * a;
    hi = temp - (temp - a);
    lo = a - hi;
  }
}



inline double two_prod(double a, double b, double &err) {





  double a_hi, a_lo, b_hi, b_lo;
  double p = a * b;
  split(a, a_hi, a_lo);
  split(b, b_hi, b_lo);
  err = ((a_hi * b_hi - p) + a_hi * b_lo + a_lo * b_hi) + a_lo * b_lo;
  return p;

}


inline double two_sqr(double a, double &err) {





  double hi, lo;
  double q = a * a;
  split(a, hi, lo);
  err = ((hi * hi - q) + 2.0 * hi * lo) + lo * lo;
  return q;

}


inline double nint(double d) {
  if (d == std::floor(d))
    return d;
  return std::floor(d + 0.5);
}


inline double aint(double d) {
  return (d >= 0.0) ? std::floor(d) : std::ceil(d);
}



inline void sincosh(double t, double &sinh_t, double &cosh_t) {
  sinh_t = std::sinh(t);
  cosh_t = std::cosh(t);
}

inline double sqr(double t) {
  return t * t;
}

inline double to_double(double a) { return a; }
inline int to_int(double a) { return static_cast<int>(a); }

}
# 18 "qd/include/qd/dd_inline.h" 2
# 26 "qd/include/qd/dd_inline.h"
inline dd_real dd_real::add(double a, double b) {
  double s, e;
  s = qd::two_sum(a, b, e);
  return dd_real(s, e);
}


inline dd_real operator+(const dd_real &a, double b) {
  double s1, s2;
  s1 = qd::two_sum(a.x[0], b, s2);
  s2 += a.x[1];
  s1 = qd::quick_two_sum(s1, s2, s2);
  return dd_real(s1, s2);
}


inline dd_real dd_real::ieee_add(const dd_real &a, const dd_real &b) {


  double s1, s2, t1, t2;

  s1 = qd::two_sum(a.x[0], b.x[0], s2);
  t1 = qd::two_sum(a.x[1], b.x[1], t2);
  s2 += t1;
  s1 = qd::quick_two_sum(s1, s2, s2);
  s2 += t2;
  s1 = qd::quick_two_sum(s1, s2, s2);
  return dd_real(s1, s2);
}

inline dd_real dd_real::sloppy_add(const dd_real &a, const dd_real &b) {


  double s, e;

  s = qd::two_sum(a.x[0], b.x[0], e);
  e += (a.x[1] + b.x[1]);
  s = qd::quick_two_sum(s, e, e);
  return dd_real(s, e);
}

inline dd_real operator+(const dd_real &a, const dd_real &b) {

  return dd_real::sloppy_add(a, b);



}


inline dd_real operator+(double a, const dd_real &b) {
  return (b + a);
}




inline dd_real &dd_real::operator+=(double a) {
  double s1, s2;
  s1 = qd::two_sum(x[0], a, s2);
  s2 += x[1];
  x[0] = qd::quick_two_sum(s1, s2, x[1]);
  return *this;
}


inline dd_real &dd_real::operator+=(const dd_real &a) {

  double s, e;
  s = qd::two_sum(x[0], a.x[0], e);
  e += x[1];
  e += a.x[1];
  x[0] = qd::quick_two_sum(s, e, x[1]);
  return *this;
# 110 "qd/include/qd/dd_inline.h"
}



inline dd_real dd_real::sub(double a, double b) {
  double s, e;
  s = qd::two_diff(a, b, e);
  return dd_real(s, e);
}


inline dd_real operator-(const dd_real &a, double b) {
  double s1, s2;
  s1 = qd::two_diff(a.x[0], b, s2);
  s2 += a.x[1];
  s1 = qd::quick_two_sum(s1, s2, s2);
  return dd_real(s1, s2);
}


inline dd_real operator-(const dd_real &a, const dd_real &b) {

  double s, e;
  s = qd::two_diff(a.x[0], b.x[0], e);
  e += a.x[1];
  e -= b.x[1];
  s = qd::quick_two_sum(s, e, e);
  return dd_real(s, e);
# 148 "qd/include/qd/dd_inline.h"
}


inline dd_real operator-(double a, const dd_real &b) {
  double s1, s2;
  s1 = qd::two_diff(a, b.x[0], s2);
  s2 -= b.x[1];
  s1 = qd::quick_two_sum(s1, s2, s2);
  return dd_real(s1, s2);
}



inline dd_real &dd_real::operator-=(double a) {
  double s1, s2;
  s1 = qd::two_diff(x[0], a, s2);
  s2 += x[1];
  x[0] = qd::quick_two_sum(s1, s2, x[1]);
  return *this;
}


inline dd_real &dd_real::operator-=(const dd_real &a) {

  double s, e;
  s = qd::two_diff(x[0], a.x[0], e);
  e += x[1];
  e -= a.x[1];
  x[0] = qd::quick_two_sum(s, e, x[1]);
  return *this;
# 188 "qd/include/qd/dd_inline.h"
}


inline dd_real dd_real::operator-() const {
  return dd_real(-x[0], -x[1]);
}



inline dd_real dd_real::mul(double a, double b) {
  double p, e;
  p = qd::two_prod(a, b, e);
  return dd_real(p, e);
}


inline dd_real ldexp(const dd_real &a, int exp) {
  return dd_real(std::ldexp(a.x[0], exp), std::ldexp(a.x[1], exp));
}


inline dd_real mul_pwr2(const dd_real &a, double b) {
  return dd_real(a.x[0] * b, a.x[1] * b);
}


inline dd_real operator*(const dd_real &a, double b) {
  double p1, p2;

  p1 = qd::two_prod(a.x[0], b, p2);
  p2 += (a.x[1] * b);
  p1 = qd::quick_two_sum(p1, p2, p2);
  return dd_real(p1, p2);
}


inline dd_real operator*(const dd_real &a, const dd_real &b) {
  double p1, p2;

  p1 = qd::two_prod(a.x[0], b.x[0], p2);
  p2 += (a.x[0] * b.x[1] + a.x[1] * b.x[0]);
  p1 = qd::quick_two_sum(p1, p2, p2);
  return dd_real(p1, p2);
}


inline dd_real operator*(double a, const dd_real &b) {
  return (b * a);
}



inline dd_real &dd_real::operator*=(double a) {
  double p1, p2;
  p1 = qd::two_prod(x[0], a, p2);
  p2 += x[1] * a;
  x[0] = qd::quick_two_sum(p1, p2, x[1]);
  return *this;
}


inline dd_real &dd_real::operator*=(const dd_real &a) {
  double p1, p2;
  p1 = qd::two_prod(x[0], a.x[0], p2);
  p2 += a.x[1] * x[0];
  p2 += a.x[0] * x[1];
  x[0] = qd::quick_two_sum(p1, p2, x[1]);
  return *this;
}


inline dd_real dd_real::div(double a, double b) {
  double q1, q2;
  double p1, p2;
  double s, e;

  q1 = a / b;


  p1 = qd::two_prod(q1, b, p2);
  s = qd::two_diff(a, p1, e);
  e -= p2;


  q2 = (s + e) / b;

  s = qd::quick_two_sum(q1, q2, e);

  return dd_real(s, e);
}


inline dd_real operator/(const dd_real &a, double b) {

  double q1, q2;
  double p1, p2;
  double s, e;
  dd_real r;

  q1 = a.x[0] / b;


  p1 = qd::two_prod(q1, b, p2);
  s = qd::two_diff(a.x[0], p1, e);
  e += a.x[1];
  e -= p2;


  q2 = (s + e) / b;


  r.x[0] = qd::quick_two_sum(q1, q2, r.x[1]);

  return r;
}

inline dd_real dd_real::sloppy_div(const dd_real &a, const dd_real &b) {
  double s1, s2;
  double q1, q2;
  dd_real r;

  q1 = a.x[0] / b.x[0];


  r = b * q1;
  s1 = qd::two_diff(a.x[0], r.x[0], s2);
  s2 -= r.x[1];
  s2 += a.x[1];


  q2 = (s1 + s2) / b.x[0];


  r.x[0] = qd::quick_two_sum(q1, q2, r.x[1]);
  return r;
}

inline dd_real dd_real::accurate_div(const dd_real &a, const dd_real &b) {
  double q1, q2, q3;
  dd_real r;

  q1 = a.x[0] / b.x[0];

  r = a - q1 * b;

  q2 = r.x[0] / b.x[0];
  r -= (q2 * b);

  q3 = r.x[0] / b.x[0];

  q1 = qd::quick_two_sum(q1, q2, q2);
  r = dd_real(q1, q2) + q3;
  return r;
}


inline dd_real operator/(const dd_real &a, const dd_real &b) {

  return dd_real::sloppy_div(a, b);



}


inline dd_real operator/(double a, const dd_real &b) {
  return dd_real(a) / b;
}

inline dd_real inv(const dd_real &a) {
  return 1.0 / a;
}



inline dd_real &dd_real::operator/=(double a) {
  *this = *this / a;
  return *this;
}


inline dd_real &dd_real::operator/=(const dd_real &a) {
  *this = *this / a;
  return *this;
}


inline dd_real drem(const dd_real &a, const dd_real &b) {
  dd_real n = nint(a / b);
  return (a - n * b);
}

inline dd_real divrem(const dd_real &a, const dd_real &b, dd_real &r) {
  dd_real n = nint(a / b);
  r = a - n * b;
  return n;
}


inline dd_real sqr(const dd_real &a) {
  double p1, p2;
  double s1, s2;
  p1 = qd::two_sqr(a.x[0], p2);
  p2 += 2.0 * a.x[0] * a.x[1];
  p2 += a.x[1] * a.x[1];
  s1 = qd::quick_two_sum(p1, p2, s2);
  return dd_real(s1, s2);
}

inline dd_real dd_real::sqr(double a) {
  double p1, p2;
  p1 = qd::two_sqr(a, p2);
  return dd_real(p1, p2);
}



inline dd_real dd_real::operator^(int n) {
  return npwr(*this, n);
}




inline dd_real &dd_real::operator=(double a) {
  x[0] = a;
  x[1] = 0.0;
  return *this;
}



inline bool operator==(const dd_real &a, double b) {
  return (a.x[0] == b && a.x[1] == 0.0);
}


inline bool operator==(const dd_real &a, const dd_real &b) {
  return (a.x[0] == b.x[0] && a.x[1] == b.x[1]);
}


inline bool operator==(double a, const dd_real &b) {
  return (a == b.x[0] && b.x[1] == 0.0);
}



inline bool operator>(const dd_real &a, double b) {
  return (a.x[0] > b || (a.x[0] == b && a.x[1] > 0.0));
}


inline bool operator>(const dd_real &a, const dd_real &b) {
  return (a.x[0] > b.x[0] || (a.x[0] == b.x[0] && a.x[1] > b.x[1]));
}


inline bool operator>(double a, const dd_real &b) {
  return (a > b.x[0] || (a == b.x[0] && b.x[1] < 0.0));
}



inline bool operator<(const dd_real &a, double b) {
  return (a.x[0] < b || (a.x[0] == b && a.x[1] < 0.0));
}


inline bool operator<(const dd_real &a, const dd_real &b) {
  return (a.x[0] < b.x[0] || (a.x[0] == b.x[0] && a.x[1] < b.x[1]));
}


inline bool operator<(double a, const dd_real &b) {
  return (a < b.x[0] || (a == b.x[0] && b.x[1] > 0.0));
}



inline bool operator>=(const dd_real &a, double b) {
  return (a.x[0] > b || (a.x[0] == b && a.x[1] >= 0.0));
}


inline bool operator>=(const dd_real &a, const dd_real &b) {
  return (a.x[0] > b.x[0] || (a.x[0] == b.x[0] && a.x[1] >= b.x[1]));
}


inline bool operator>=(double a, const dd_real &b) {
  return (b <= a);
}



inline bool operator<=(const dd_real &a, double b) {
  return (a.x[0] < b || (a.x[0] == b && a.x[1] <= 0.0));
}


inline bool operator<=(const dd_real &a, const dd_real &b) {
  return (a.x[0] < b.x[0] || (a.x[0] == b.x[0] && a.x[1] <= b.x[1]));
}


inline bool operator<=(double a, const dd_real &b) {
  return (b >= a);
}



inline bool operator!=(const dd_real &a, double b) {
  return (a.x[0] != b || a.x[1] != 0.0);
}


inline bool operator!=(const dd_real &a, const dd_real &b) {
  return (a.x[0] != b.x[0] || a.x[1] != b.x[1]);
}


inline bool operator!=(double a, const dd_real &b) {
  return (a != b.x[0] || b.x[1] != 0.0);
}



inline bool dd_real::is_zero() const {
  return (x[0] == 0.0);
}


inline bool dd_real::is_one() const {
  return (x[0] == 1.0 && x[1] == 0.0);
}


inline bool dd_real::is_positive() const {
  return (x[0] > 0.0);
}


inline bool dd_real::is_negative() const {
  return (x[0] < 0.0);
}


inline dd_real abs(const dd_real &a) {
  return (a.x[0] < 0.0) ? -a : a;
}

inline dd_real fabs(const dd_real &a) {
  return abs(a);
}


inline dd_real nint(const dd_real &a) {
  double hi = qd::nint(a.x[0]);
  double lo;

  if (hi == a.x[0]) {

    lo = qd::nint(a.x[1]);


    hi = qd::quick_two_sum(hi, lo, lo);
  } else {

    lo = 0.0;
    if (std::abs(hi-a.x[0]) == 0.5 && a.x[1] < 0.0) {


      hi -= 1.0;
    }
  }

  return dd_real(hi, lo);
}

inline dd_real floor(const dd_real &a) {
  double hi = std::floor(a.x[0]);
  double lo = 0.0;

  if (hi == a.x[0]) {

    lo = std::floor(a.x[1]);
    hi = qd::quick_two_sum(hi, lo, lo);
  }

  return dd_real(hi, lo);
}

inline dd_real ceil(const dd_real &a) {
  double hi = std::ceil(a.x[0]);
  double lo = 0.0;

  if (hi == a.x[0]) {

    lo = std::ceil(a.x[1]);
    hi = qd::quick_two_sum(hi, lo, lo);
  }

  return dd_real(hi, lo);
}

inline dd_real aint(const dd_real &a) {
  return (a.x[0] >= 0.0) ? floor(a) : ceil(a);
}


inline double to_double(const dd_real &a) {
  return a.x[0];
}


inline int to_int(const dd_real &a) {
  return static_cast<int>(a.x[0]);
}


inline dd_real dd_real::rand() {
  return ddrand();
}
# 289 "qd/include/qd/dd_real.h" 2
# 12 "precision.h" 2
# 1 "qd/include/qd/qd_real.h" 1
# 32 "qd/include/qd/qd_real.h"
struct qd_real {
  double x[4];


  void zero_elim();
  void zero_elim(double &e);

  void renorm();
  void renorm(double &e);

  void quick_accum(double d, double &e);
  void quick_prod_accum(double a, double b, double &e);

  qd_real(double x0, double x1, double x2, double x3);
  explicit qd_real(const double *xx);

  static const qd_real _2pi;
  static const qd_real _pi;
  static const qd_real _3pi4;
  static const qd_real _pi2;
  static const qd_real _pi4;
  static const qd_real _e;
  static const qd_real _log2;
  static const qd_real _log10;
  static const qd_real _nan;
  static const qd_real _inf;

  static const double _eps;
  static const double _min_normalized;
  static const qd_real _max;
  static const qd_real _safe_max;
  static const int _ndigits;

  qd_real();
  qd_real(const char *s);
  qd_real(const dd_real &dd);
  qd_real(double d);
  qd_real(int i);

  double operator[](int i) const;
  double &operator[](int i);

  static void error(const char *msg);

  bool isnan() const;
  bool isfinite() const { return std::isfinite(x[0]); }
  bool isinf() const { return std::isinf(x[0]); }

  static qd_real ieee_add(const qd_real &a, const qd_real &b);
  static qd_real sloppy_add(const qd_real &a, const qd_real &b);

  qd_real &operator+=(double a);
  qd_real &operator+=(const dd_real &a);
  qd_real &operator+=(const qd_real &a);

  qd_real &operator-=(double a);
  qd_real &operator-=(const dd_real &a);
  qd_real &operator-=(const qd_real &a);

  static qd_real sloppy_mul(const qd_real &a, const qd_real &b);
  static qd_real accurate_mul(const qd_real &a, const qd_real &b);

  qd_real &operator*=(double a);
  qd_real &operator*=(const dd_real &a);
  qd_real &operator*=(const qd_real &a);

  static qd_real sloppy_div(const qd_real &a, const dd_real &b);
  static qd_real accurate_div(const qd_real &a, const dd_real &b);
  static qd_real sloppy_div(const qd_real &a, const qd_real &b);
  static qd_real accurate_div(const qd_real &a, const qd_real &b);

  qd_real &operator/=(double a);
  qd_real &operator/=(const dd_real &a);
  qd_real &operator/=(const qd_real &a);

  qd_real operator^(int n) const;

  qd_real operator-() const;

  qd_real &operator=(double a);
  qd_real &operator=(const dd_real &a);
  qd_real &operator=(const char *s);

  bool is_zero() const;
  bool is_one() const;
  bool is_positive() const;
  bool is_negative() const;

  static qd_real rand(void);

  void to_digits(char *s, int &expn, int precision = _ndigits) const;
  void write(char *s, int len, int precision = _ndigits,
      bool showpos = false, bool uppercase = false) const;
  std::string to_string(int precision = _ndigits, int width = 0,
      std::ios_base::fmtflags fmt = static_cast<std::ios_base::fmtflags>(0),
      bool showpos = false, bool uppercase = false, char fill = ' ') const;
  static int read(const char *s, qd_real &a);


  void dump(const std::string &name = "", std::ostream &os = std::cerr) const;
  void dump_bits(const std::string &name = "",
                 std::ostream &os = std::cerr) const;

  static qd_real debug_rand();

  explicit operator double() const { return x[0]; }
  explicit operator dd_real() const { return dd_real(x[0],x[1]); }
};

namespace std {
  template <>
  class numeric_limits<qd_real> : public numeric_limits<double> {
  public:
    inline static double epsilon() { return qd_real::_eps; }
    inline static double min() { return qd_real::_min_normalized; }
    inline static qd_real max() { return qd_real::_max; }
    inline static qd_real safe_max() { return qd_real::_safe_max; }
    static const int digits = 209;
    static const int digits10 = 62;
  };
}

 qd_real polyeval(const qd_real *c, int n, const qd_real &x);
 qd_real polyroot(const qd_real *c, int n,
    const qd_real &x0, int max_iter = 64, double thresh = 0.0);

 qd_real qdrand(void);
 qd_real sqrt(const qd_real &a);

 inline bool isnan(const qd_real &a) { return a.isnan(); }
 inline bool isfinite(const qd_real &a) { return a.isfinite(); }
 inline bool isinf(const qd_real &a) { return a.isinf(); }



 qd_real mul_pwr2(const qd_real &qd, double d);

 qd_real operator+(const qd_real &a, const qd_real &b);
 qd_real operator+(const dd_real &a, const qd_real &b);
 qd_real operator+(const qd_real &a, const dd_real &b);
 qd_real operator+(const qd_real &a, double b);
 qd_real operator+(double a, const qd_real &b);

 qd_real operator-(const qd_real &a, const qd_real &b);
 qd_real operator-(const dd_real &a, const qd_real &b);
 qd_real operator-(const qd_real &a, const dd_real &b);
 qd_real operator-(const qd_real &a, double b);
 qd_real operator-(double a, const qd_real &b);

 qd_real operator*(const qd_real &a, const qd_real &b);
 qd_real operator*(const dd_real &a, const qd_real &b);
 qd_real operator*(const qd_real &a, const dd_real &b);
 qd_real operator*(const qd_real &a, double b);
 qd_real operator*(double a, const qd_real &b);

 qd_real operator/(const qd_real &a, const qd_real &b);
 qd_real operator/(const dd_real &a, const qd_real &b);
 qd_real operator/(const qd_real &a, const dd_real &b);
 qd_real operator/(const qd_real &a, double b);
 qd_real operator/(double a, const qd_real &b);

 qd_real sqr(const qd_real &a);
 qd_real sqrt(const qd_real &a);
 qd_real pow(const qd_real &a, int n);
 qd_real pow(const qd_real &a, const qd_real &b);
 qd_real npwr(const qd_real &a, int n);

 qd_real nroot(const qd_real &a, int n);

 qd_real rem(const qd_real &a, const qd_real &b);
 qd_real drem(const qd_real &a, const qd_real &b);
 qd_real divrem(const qd_real &a, const qd_real &b, qd_real &r);

dd_real to_dd_real(const qd_real &a);
double to_double(const qd_real &a);
int to_int(const qd_real &a);

 bool operator==(const qd_real &a, const qd_real &b);
 bool operator==(const qd_real &a, const dd_real &b);
 bool operator==(const dd_real &a, const qd_real &b);
 bool operator==(double a, const qd_real &b);
 bool operator==(const qd_real &a, double b);

 bool operator<(const qd_real &a, const qd_real &b);
 bool operator<(const qd_real &a, const dd_real &b);
 bool operator<(const dd_real &a, const qd_real &b);
 bool operator<(double a, const qd_real &b);
 bool operator<(const qd_real &a, double b);

 bool operator>(const qd_real &a, const qd_real &b);
 bool operator>(const qd_real &a, const dd_real &b);
 bool operator>(const dd_real &a, const qd_real &b);
 bool operator>(double a, const qd_real &b);
 bool operator>(const qd_real &a, double b);

 bool operator<=(const qd_real &a, const qd_real &b);
 bool operator<=(const qd_real &a, const dd_real &b);
 bool operator<=(const dd_real &a, const qd_real &b);
 bool operator<=(double a, const qd_real &b);
 bool operator<=(const qd_real &a, double b);

 bool operator>=(const qd_real &a, const qd_real &b);
 bool operator>=(const qd_real &a, const dd_real &b);
 bool operator>=(const dd_real &a, const qd_real &b);
 bool operator>=(double a, const qd_real &b);
 bool operator>=(const qd_real &a, double b);

 bool operator!=(const qd_real &a, const qd_real &b);
 bool operator!=(const qd_real &a, const dd_real &b);
 bool operator!=(const dd_real &a, const qd_real &b);
 bool operator!=(double a, const qd_real &b);
 bool operator!=(const qd_real &a, double b);

 qd_real fabs(const qd_real &a);
 qd_real abs(const qd_real &a);

 qd_real ldexp(const qd_real &a, int n);

 qd_real nint(const qd_real &a);
 qd_real quick_nint(const qd_real &a);
 qd_real floor(const qd_real &a);
 qd_real ceil(const qd_real &a);
 qd_real aint(const qd_real &a);

 qd_real sin(const qd_real &a);
 qd_real cos(const qd_real &a);
 qd_real tan(const qd_real &a);
 void sincos(const qd_real &a, qd_real &s, qd_real &c);

 qd_real asin(const qd_real &a);
 qd_real acos(const qd_real &a);
 qd_real atan(const qd_real &a);
 qd_real atan2(const qd_real &y, const qd_real &x);

 qd_real exp(const qd_real &a);
 qd_real log(const qd_real &a);
 qd_real log10(const qd_real &a);

 qd_real sinh(const qd_real &a);
 qd_real cosh(const qd_real &a);
 qd_real tanh(const qd_real &a);
 void sincosh(const qd_real &a, qd_real &sin_qd, qd_real &cos_qd);

 qd_real asinh(const qd_real &a);
 qd_real acosh(const qd_real &a);
 qd_real atanh(const qd_real &a);

 qd_real qdrand(void);

 qd_real max(const qd_real &a, const qd_real &b);
 qd_real max(const qd_real &a, const qd_real &b, const qd_real &c);
 qd_real min(const qd_real &a, const qd_real &b);
 qd_real min(const qd_real &a, const qd_real &b, const qd_real &c);

 qd_real fmod(const qd_real &a, const qd_real &b);

 std::ostream &operator<<(std::ostream &s, const qd_real &a);
 std::istream &operator>>(std::istream &s, qd_real &a);

# 1 "qd/include/qd/qd_inline.h" 1
# 16 "qd/include/qd/qd_inline.h"
# 1 "/usr/include/c++/5/cmath" 1 3
# 39 "/usr/include/c++/5/cmath" 3
       
# 40 "/usr/include/c++/5/cmath" 3
# 17 "qd/include/qd/qd_inline.h" 2







inline qd_real::qd_real(double x0, double x1, double x2, double x3) {
  x[0] = x0;
  x[1] = x1;
  x[2] = x2;
  x[3] = x3;
}

inline qd_real::qd_real(const double *xx) {
  x[0] = xx[0];
  x[1] = xx[1];
  x[2] = xx[2];
  x[3] = xx[3];
}

inline qd_real::qd_real(double x0) {
  x[0] = x0;
  x[1] = x[2] = x[3] = 0.0;
}

inline qd_real::qd_real() {
 x[0] = 0.0;
 x[1] = 0.0;
 x[2] = 0.0;
 x[3] = 0.0;
}

inline qd_real::qd_real(const dd_real &a) {
  x[0] = a._hi();
  x[1] = a._lo();
  x[2] = x[3] = 0.0;
}

inline qd_real::qd_real(int i) {
  x[0] = static_cast<double>(i);
  x[1] = x[2] = x[3] = 0.0;
}


inline double qd_real::operator[](int i) const {
  return x[i];
}

inline double &qd_real::operator[](int i) {
  return x[i];
}

inline bool qd_real::isnan() const {
  return std::isnan(x[0]) || std::isnan(x[1]) || std::isnan(x[2]) || std::isnan(x[3]);
}


namespace qd {
inline void quick_renorm(double &c0, double &c1,
                         double &c2, double &c3, double &c4) {
  double t0, t1, t2, t3;
  double s;
  s = qd::quick_two_sum(c3, c4, t3);
  s = qd::quick_two_sum(c2, s , t2);
  s = qd::quick_two_sum(c1, s , t1);
  c0 = qd::quick_two_sum(c0, s , t0);

  s = qd::quick_two_sum(t2, t3, t2);
  s = qd::quick_two_sum(t1, s , t1);
  c1 = qd::quick_two_sum(t0, s , t0);

  s = qd::quick_two_sum(t1, t2, t1);
  c2 = qd::quick_two_sum(t0, s , t0);

  c3 = t0 + t1;
}

inline void renorm(double &c0, double &c1,
                   double &c2, double &c3) {
  double s0, s1, s2 = 0.0, s3 = 0.0;

  if (std::isinf(c0)) return;

  s0 = qd::quick_two_sum(c2, c3, c3);
  s0 = qd::quick_two_sum(c1, s0, c2);
  c0 = qd::quick_two_sum(c0, s0, c1);

  s0 = c0;
  s1 = c1;
  if (s1 != 0.0) {
    s1 = qd::quick_two_sum(s1, c2, s2);
    if (s2 != 0.0)
      s2 = qd::quick_two_sum(s2, c3, s3);
    else
      s1 = qd::quick_two_sum(s1, c3, s2);
  } else {
    s0 = qd::quick_two_sum(s0, c2, s1);
    if (s1 != 0.0)
      s1 = qd::quick_two_sum(s1, c3, s2);
    else
      s0 = qd::quick_two_sum(s0, c3, s1);
  }

  c0 = s0;
  c1 = s1;
  c2 = s2;
  c3 = s3;
}

inline void renorm(double &c0, double &c1,
                   double &c2, double &c3, double &c4) {
  double s0, s1, s2 = 0.0, s3 = 0.0;

  if (std::isinf(c0)) return;

  s0 = qd::quick_two_sum(c3, c4, c4);
  s0 = qd::quick_two_sum(c2, s0, c3);
  s0 = qd::quick_two_sum(c1, s0, c2);
  c0 = qd::quick_two_sum(c0, s0, c1);

  s0 = c0;
  s1 = c1;

  s0 = qd::quick_two_sum(c0, c1, s1);
  if (s1 != 0.0) {
    s1 = qd::quick_two_sum(s1, c2, s2);
    if (s2 != 0.0) {
      s2 = qd::quick_two_sum(s2, c3, s3);
      if (s3 != 0.0)
        s3 += c4;
      else
        s2 += c4;
    } else {
      s1 = qd::quick_two_sum(s1, c3, s2);
      if (s2 != 0.0)
        s2 = qd::quick_two_sum(s2, c4, s3);
      else
        s1 = qd::quick_two_sum(s1, c4, s2);
    }
  } else {
    s0 = qd::quick_two_sum(s0, c2, s1);
    if (s1 != 0.0) {
      s1 = qd::quick_two_sum(s1, c3, s2);
      if (s2 != 0.0)
        s2 = qd::quick_two_sum(s2, c4, s3);
      else
        s1 = qd::quick_two_sum(s1, c4, s2);
    } else {
      s0 = qd::quick_two_sum(s0, c3, s1);
      if (s1 != 0.0)
        s1 = qd::quick_two_sum(s1, c4, s2);
      else
        s0 = qd::quick_two_sum(s0, c4, s1);
    }
  }

  c0 = s0;
  c1 = s1;
  c2 = s2;
  c3 = s3;
}
}

inline void qd_real::renorm() {
  qd::renorm(x[0], x[1], x[2], x[3]);
}

inline void qd_real::renorm(double &e) {
  qd::renorm(x[0], x[1], x[2], x[3], e);
}



namespace qd {

inline void three_sum(double &a, double &b, double &c) {
  double t1, t2, t3;
  t1 = qd::two_sum(a, b, t2);
  a = qd::two_sum(c, t1, t3);
  b = qd::two_sum(t2, t3, c);
}

inline void three_sum2(double &a, double &b, double &c) {
  double t1, t2, t3;
  t1 = qd::two_sum(a, b, t2);
  a = qd::two_sum(c, t1, t3);
  b = t2 + t3;
}

}


inline qd_real operator+(const qd_real &a, double b) {
  double c0, c1, c2, c3;
  double e;

  c0 = qd::two_sum(a[0], b, e);
  c1 = qd::two_sum(a[1], e, e);
  c2 = qd::two_sum(a[2], e, e);
  c3 = qd::two_sum(a[3], e, e);

  qd::renorm(c0, c1, c2, c3, e);

  return qd_real(c0, c1, c2, c3);
}


inline qd_real operator+(const qd_real &a, const dd_real &b) {

  double s0, s1, s2, s3;
  double t0, t1;

  s0 = qd::two_sum(a[0], b._hi(), t0);
  s1 = qd::two_sum(a[1], b._lo(), t1);

  s1 = qd::two_sum(s1, t0, t0);

  s2 = a[2];
  qd::three_sum(s2, t0, t1);

  s3 = qd::two_sum(t0, a[3], t0);
  t0 += t1;

  qd::renorm(s0, s1, s2, s3, t0);
  return qd_real(s0, s1, s2, s3);
}



inline qd_real operator+(double a, const qd_real &b) {
  return (b + a);
}


inline qd_real operator+(const dd_real &a, const qd_real &b) {
  return (b + a);
}

namespace qd {





inline double quick_three_accum(double &a, double &b, double c) {
  double s;
  bool za, zb;

  s = qd::two_sum(b, c, b);
  s = qd::two_sum(a, s, a);

  za = (a != 0.0);
  zb = (b != 0.0);

  if (za && zb)
    return s;

  if (!zb) {
    b = a;
    a = s;
  } else {
    a = s;
  }

  return 0.0;
}

}

inline qd_real qd_real::ieee_add(const qd_real &a, const qd_real &b) {
  int i, j, k;
  double s, t;
  double u, v;
  double x[4] = {0.0, 0.0, 0.0, 0.0};

  i = j = k = 0;
  if (std::abs(a[i]) > std::abs(b[j]))
    u = a[i++];
  else
    u = b[j++];
  if (std::abs(a[i]) > std::abs(b[j]))
    v = a[i++];
  else
    v = b[j++];

  u = qd::quick_two_sum(u, v, v);

  while (k < 4) {
    if (i >= 4 && j >= 4) {
      x[k] = u;
      if (k < 3)
        x[++k] = v;
      break;
    }

    if (i >= 4)
      t = b[j++];
    else if (j >= 4)
      t = a[i++];
    else if (std::abs(a[i]) > std::abs(b[j])) {
      t = a[i++];
    } else
      t = b[j++];

    s = qd::quick_three_accum(u, v, t);

    if (s != 0.0) {
      x[k++] = s;
    }
  }


  for (k = i; k < 4; k++)
    x[3] += a[k];
  for (k = j; k < 4; k++)
    x[3] += b[k];

  qd::renorm(x[0], x[1], x[2], x[3]);
  return qd_real(x[0], x[1], x[2], x[3]);
}

inline qd_real qd_real::sloppy_add(const qd_real &a, const qd_real &b) {
# 361 "qd/include/qd/qd_inline.h"
  double s0, s1, s2, s3;
  double t0, t1, t2, t3;

  double v0, v1, v2, v3;
  double u0, u1, u2, u3;
  double w0, w1, w2, w3;

  s0 = a[0] + b[0];
  s1 = a[1] + b[1];
  s2 = a[2] + b[2];
  s3 = a[3] + b[3];

  v0 = s0 - a[0];
  v1 = s1 - a[1];
  v2 = s2 - a[2];
  v3 = s3 - a[3];

  u0 = s0 - v0;
  u1 = s1 - v1;
  u2 = s2 - v2;
  u3 = s3 - v3;

  w0 = a[0] - u0;
  w1 = a[1] - u1;
  w2 = a[2] - u2;
  w3 = a[3] - u3;

  u0 = b[0] - v0;
  u1 = b[1] - v1;
  u2 = b[2] - v2;
  u3 = b[3] - v3;

  t0 = w0 + u0;
  t1 = w1 + u1;
  t2 = w2 + u2;
  t3 = w3 + u3;

  s1 = qd::two_sum(s1, t0, t0);
  qd::three_sum(s2, t0, t1);
  qd::three_sum2(s3, t0, t2);
  t0 = t0 + t1 + t3;


  qd::renorm(s0, s1, s2, s3, t0);
  return qd_real(s0, s1, s2, s3);
}


inline qd_real operator+(const qd_real &a, const qd_real &b) {

  return qd_real::sloppy_add(a, b);



}





inline qd_real &qd_real::operator+=(double a) {
  *this = *this + a;
  return *this;
}


inline qd_real &qd_real::operator+=(const dd_real &a) {
  *this = *this + a;
  return *this;
}


inline qd_real &qd_real::operator+=(const qd_real &a) {
  *this = *this + a;
  return *this;
}


inline qd_real qd_real::operator-() const {
  return qd_real(-x[0], -x[1], -x[2], -x[3]);
}


inline qd_real operator-(const qd_real &a, double b) {
  return (a + (-b));
}

inline qd_real operator-(double a, const qd_real &b) {
  return (a + (-b));
}

inline qd_real operator-(const qd_real &a, const dd_real &b) {
  return (a + (-b));
}

inline qd_real operator-(const dd_real &a, const qd_real &b) {
  return (a + (-b));
}

inline qd_real operator-(const qd_real &a, const qd_real &b) {
  return (a + (-b));
}


inline qd_real &qd_real::operator-=(double a) {
  return ((*this) += (-a));
}

inline qd_real &qd_real::operator-=(const dd_real &a) {
  return ((*this) += (-a));
}

inline qd_real &qd_real::operator-=(const qd_real &a) {
  return ((*this) += (-a));
}


inline qd_real operator*(double a, const qd_real &b) {
  return (b * a);
}

inline qd_real operator*(const dd_real &a, const qd_real &b) {
  return (b * a);
}

inline qd_real mul_pwr2(const qd_real &a, double b) {
  return qd_real(a[0] * b, a[1] * b, a[2] * b, a[3] * b);
}


inline qd_real operator*(const qd_real &a, double b) {
  double p0, p1, p2, p3;
  double q0, q1, q2;
  double s0, s1, s2, s3, s4;

  p0 = qd::two_prod(a[0], b, q0);
  p1 = qd::two_prod(a[1], b, q1);
  p2 = qd::two_prod(a[2], b, q2);
  p3 = a[3] * b;

  s0 = p0;

  s1 = qd::two_sum(q0, p1, s2);

  qd::three_sum(s2, q1, p2);

  qd::three_sum2(q1, q2, p3);
  s3 = q1;

  s4 = q2 + p2;

  qd::renorm(s0, s1, s2, s3, s4);
  return qd_real(s0, s1, s2, s3);

}
# 526 "qd/include/qd/qd_inline.h"
inline qd_real operator*(const qd_real &a, const dd_real &b) {
  double p0, p1, p2, p3, p4;
  double q0, q1, q2, q3, q4;
  double s0, s1, s2;
  double t0, t1;

  p0 = qd::two_prod(a[0], b._hi(), q0);
  p1 = qd::two_prod(a[0], b._lo(), q1);
  p2 = qd::two_prod(a[1], b._hi(), q2);
  p3 = qd::two_prod(a[1], b._lo(), q3);
  p4 = qd::two_prod(a[2], b._hi(), q4);

  qd::three_sum(p1, p2, q0);


  qd::three_sum(p2, p3, p4);
  q1 = qd::two_sum(q1, q2, q2);
  s0 = qd::two_sum(p2, q1, t0);
  s1 = qd::two_sum(p3, q2, t1);
  s1 = qd::two_sum(s1, t0, t0);
  s2 = t0 + t1 + p4;
  p2 = s0;

  p3 = a[2] * b._hi() + a[3] * b._lo() + q3 + q4;
  qd::three_sum2(p3, q0, s1);
  p4 = q0 + s2;

  qd::renorm(p0, p1, p2, p3, p4);
  return qd_real(p0, p1, p2, p3);
}
# 568 "qd/include/qd/qd_inline.h"
inline qd_real qd_real::sloppy_mul(const qd_real &a, const qd_real &b) {
  double p0, p1, p2, p3, p4, p5;
  double q0, q1, q2, q3, q4, q5;
  double t0, t1;
  double s0, s1, s2;

  p0 = qd::two_prod(a[0], b[0], q0);

  p1 = qd::two_prod(a[0], b[1], q1);
  p2 = qd::two_prod(a[1], b[0], q2);

  p3 = qd::two_prod(a[0], b[2], q3);
  p4 = qd::two_prod(a[1], b[1], q4);
  p5 = qd::two_prod(a[2], b[0], q5);


  qd::three_sum(p1, p2, q0);


  qd::three_sum(p2, q1, q2);
  qd::three_sum(p3, p4, p5);

  s0 = qd::two_sum(p2, p3, t0);
  s1 = qd::two_sum(q1, p4, t1);
  s2 = q2 + p5;
  s1 = qd::two_sum(s1, t0, t0);
  s2 += (t0 + t1);


  s1 += a[0]*b[3] + a[1]*b[2] + a[2]*b[1] + a[3]*b[0] + q0 + q3 + q4 + q5;
  qd::renorm(p0, p1, s0, s1, s2);
  return qd_real(p0, p1, s0, s1);
}

inline qd_real qd_real::accurate_mul(const qd_real &a, const qd_real &b) {
  double p0, p1, p2, p3, p4, p5;
  double q0, q1, q2, q3, q4, q5;
  double p6, p7, p8, p9;
  double q6, q7, q8, q9;
  double r0, r1;
  double t0, t1;
  double s0, s1, s2;

  p0 = qd::two_prod(a[0], b[0], q0);

  p1 = qd::two_prod(a[0], b[1], q1);
  p2 = qd::two_prod(a[1], b[0], q2);

  p3 = qd::two_prod(a[0], b[2], q3);
  p4 = qd::two_prod(a[1], b[1], q4);
  p5 = qd::two_prod(a[2], b[0], q5);


  qd::three_sum(p1, p2, q0);


  qd::three_sum(p2, q1, q2);
  qd::three_sum(p3, p4, p5);

  s0 = qd::two_sum(p2, p3, t0);
  s1 = qd::two_sum(q1, p4, t1);
  s2 = q2 + p5;
  s1 = qd::two_sum(s1, t0, t0);
  s2 += (t0 + t1);


  p6 = qd::two_prod(a[0], b[3], q6);
  p7 = qd::two_prod(a[1], b[2], q7);
  p8 = qd::two_prod(a[2], b[1], q8);
  p9 = qd::two_prod(a[3], b[0], q9);


  q0 = qd::two_sum(q0, q3, q3);
  q4 = qd::two_sum(q4, q5, q5);
  p6 = qd::two_sum(p6, p7, p7);
  p8 = qd::two_sum(p8, p9, p9);

  t0 = qd::two_sum(q0, q4, t1);
  t1 += (q3 + q5);

  r0 = qd::two_sum(p6, p8, r1);
  r1 += (p7 + p9);

  q3 = qd::two_sum(t0, r0, q4);
  q4 += (t1 + r1);

  t0 = qd::two_sum(q3, s1, t1);
  t1 += q4;


  t1 += a[1] * b[3] + a[2] * b[2] + a[3] * b[1] + q6 + q7 + q8 + q9 + s2;

  qd::renorm(p0, p1, s0, t0, t1);
  return qd_real(p0, p1, s0, t0);
}

inline qd_real operator*(const qd_real &a, const qd_real &b) {

  return qd_real::sloppy_mul(a, b);



}




inline qd_real sqr(const qd_real &a) {
  double p0, p1, p2, p3, p4, p5;
  double q0, q1, q2, q3;
  double s0, s1;
  double t0, t1;

  p0 = qd::two_sqr(a[0], q0);
  p1 = qd::two_prod(2.0 * a[0], a[1], q1);
  p2 = qd::two_prod(2.0 * a[0], a[2], q2);
  p3 = qd::two_sqr(a[1], q3);

  p1 = qd::two_sum(q0, p1, q0);

  q0 = qd::two_sum(q0, q1, q1);
  p2 = qd::two_sum(p2, p3, p3);

  s0 = qd::two_sum(q0, p2, t0);
  s1 = qd::two_sum(q1, p3, t1);

  s1 = qd::two_sum(s1, t0, t0);
  t0 += t1;

  s1 = qd::quick_two_sum(s1, t0, t0);
  p2 = qd::quick_two_sum(s0, s1, t1);
  p3 = qd::quick_two_sum(t1, t0, q0);

  p4 = 2.0 * a[0] * a[3];
  p5 = 2.0 * a[1] * a[2];

  p4 = qd::two_sum(p4, p5, p5);
  q2 = qd::two_sum(q2, q3, q3);

  t0 = qd::two_sum(p4, q2, t1);
  t1 = t1 + p5 + q3;

  p3 = qd::two_sum(p3, t0, p4);
  p4 = p4 + q0 + t1;

  qd::renorm(p0, p1, p2, p3, p4);
  return qd_real(p0, p1, p2, p3);

}



inline qd_real &qd_real::operator*=(double a) {
  *this = (*this * a);
  return *this;
}


inline qd_real &qd_real::operator*=(const dd_real &a) {
  *this = (*this * a);
  return *this;
}


inline qd_real &qd_real::operator*=(const qd_real &a) {
  *this = *this * a;
  return *this;
}

inline qd_real operator/ (const qd_real &a, const dd_real &b) {

  return qd_real::sloppy_div(a, b);



}

inline qd_real operator/(const qd_real &a, const qd_real &b) {

  return qd_real::sloppy_div(a, b);



}


inline qd_real operator/(double a, const qd_real &b) {
  return qd_real(a) / b;
}


inline qd_real operator/(const dd_real &a, const qd_real &b) {
  return qd_real(a) / b;
}



inline qd_real &qd_real::operator/=(double a) {
  *this = (*this / a);
  return *this;
}


inline qd_real &qd_real::operator/=(const dd_real &a) {
  *this = (*this / a);
  return *this;
}


inline qd_real &qd_real::operator/=(const qd_real &a) {
  *this = (*this / a);
  return *this;
}



inline qd_real qd_real::operator^(int n) const {
  return pow(*this, n);
}


inline qd_real abs(const qd_real &a) {
  return (a[0] < 0.0) ? -a : a;
}

inline qd_real fabs(const qd_real &a) {
  return abs(a);
}



inline qd_real quick_nint(const qd_real &a) {
  qd_real r = qd_real(qd::nint(a[0]), qd::nint(a[1]),
      qd::nint(a[2]), qd::nint(a[3]));
  r.renorm();
  return r;
}



inline qd_real &qd_real::operator=(double a) {
  x[0] = a;
  x[1] = x[2] = x[3] = 0.0;
  return *this;
}


inline qd_real &qd_real::operator=(const dd_real &a) {
  x[0] = a._hi();
  x[1] = a._lo();
  x[2] = x[3] = 0.0;
  return *this;
}


inline bool operator==(const qd_real &a, double b) {
  return (a[0] == b && a[1] == 0.0 && a[2] == 0.0 && a[3] == 0.0);
}

inline bool operator==(double a, const qd_real &b) {
  return (b == a);
}

inline bool operator==(const qd_real &a, const dd_real &b) {
  return (a[0] == b._hi() && a[1] == b._lo() &&
          a[2] == 0.0 && a[3] == 0.0);
}

inline bool operator==(const dd_real &a, const qd_real &b) {
  return (b == a);
}

inline bool operator==(const qd_real &a, const qd_real &b) {
  return (a[0] == b[0] && a[1] == b[1] &&
          a[2] == b[2] && a[3] == b[3]);
}



inline bool operator<(const qd_real &a, double b) {
  return (a[0] < b || (a[0] == b && a[1] < 0.0));
}

inline bool operator<(double a, const qd_real &b) {
  return (b > a);
}

inline bool operator<(const qd_real &a, const dd_real &b) {
  return (a[0] < b._hi() ||
          (a[0] == b._hi() && (a[1] < b._lo() ||
                            (a[1] == b._lo() && a[2] < 0.0))));
}

inline bool operator<(const dd_real &a, const qd_real &b) {
  return (b > a);
}

inline bool operator<(const qd_real &a, const qd_real &b) {
  return (a[0] < b[0] ||
          (a[0] == b[0] && (a[1] < b[1] ||
                            (a[1] == b[1] && (a[2] < b[2] ||
                                              (a[2] == b[2] && a[3] < b[3]))))));
}


inline bool operator>(const qd_real &a, double b) {
  return (a[0] > b || (a[0] == b && a[1] > 0.0));
}

inline bool operator>(double a, const qd_real &b) {
  return (b < a);
}

inline bool operator>(const qd_real &a, const dd_real &b) {
  return (a[0] > b._hi() ||
          (a[0] == b._hi() && (a[1] > b._lo() ||
                            (a[1] == b._lo() && a[2] > 0.0))));
}

inline bool operator>(const dd_real &a, const qd_real &b) {
  return (b < a);
}

inline bool operator>(const qd_real &a, const qd_real &b) {
  return (a[0] > b[0] ||
          (a[0] == b[0] && (a[1] > b[1] ||
                            (a[1] == b[1] && (a[2] > b[2] ||
                                              (a[2] == b[2] && a[3] > b[3]))))));
}



inline bool operator<=(const qd_real &a, double b) {
  return (a[0] < b || (a[0] == b && a[1] <= 0.0));
}

inline bool operator<=(double a, const qd_real &b) {
  return (b >= a);
}

inline bool operator<=(const qd_real &a, const dd_real &b) {
  return (a[0] < b._hi() ||
          (a[0] == b._hi() && (a[1] < b._lo() ||
                            (a[1] == b._lo() && a[2] <= 0.0))));
}

inline bool operator<=(const dd_real &a, const qd_real &b) {
  return (b >= a);
}

inline bool operator<=(const qd_real &a, const qd_real &b) {
  return (a[0] < b[0] ||
          (a[0] == b[0] && (a[1] < b[1] ||
                            (a[1] == b[1] && (a[2] < b[2] ||
                                              (a[2] == b[2] && a[3] <= b[3]))))));
}


inline bool operator>=(const qd_real &a, double b) {
  return (a[0] > b || (a[0] == b && a[1] >= 0.0));
}

inline bool operator>=(double a, const qd_real &b) {
  return (b <= a);
}

inline bool operator>=(const qd_real &a, const dd_real &b) {
  return (a[0] > b._hi() ||
          (a[0] == b._hi() && (a[1] > b._lo() ||
                            (a[1] == b._lo() && a[2] >= 0.0))));
}

inline bool operator>=(const dd_real &a, const qd_real &b) {
  return (b <= a);
}

inline bool operator>=(const qd_real &a, const qd_real &b) {
  return (a[0] > b[0] ||
          (a[0] == b[0] && (a[1] > b[1] ||
                            (a[1] == b[1] && (a[2] > b[2] ||
                                              (a[2] == b[2] && a[3] >= b[3]))))));
}




inline bool operator!=(const qd_real &a, double b) {
  return !(a == b);
}

inline bool operator!=(double a, const qd_real &b) {
  return !(a == b);
}

inline bool operator!=(const qd_real &a, const dd_real &b) {
  return !(a == b);
}

inline bool operator!=(const dd_real &a, const qd_real &b) {
  return !(a == b);
}

inline bool operator!=(const qd_real &a, const qd_real &b) {
  return !(a == b);
}



inline qd_real aint(const qd_real &a) {
  return (a[0] >= 0) ? floor(a) : ceil(a);
}

inline bool qd_real::is_zero() const {
  return (x[0] == 0.0);
}

inline bool qd_real::is_one() const {
  return (x[0] == 1.0 && x[1] == 0.0 && x[2] == 0.0 && x[3] == 0.0);
}

inline bool qd_real::is_positive() const {
  return (x[0] > 0.0);
}

inline bool qd_real::is_negative() const {
  return (x[0] < 0.0);
}

inline dd_real to_dd_real(const qd_real &a) {
  return dd_real(a[0], a[1]);
}

inline double to_double(const qd_real &a) {
  return a[0];
}

inline int to_int(const qd_real &a) {
  return static_cast<int>(a[0]);
}

inline qd_real inv(const qd_real &qd) {
  return 1.0 / qd;
}

inline qd_real max(const qd_real &a, const qd_real &b) {
  return (a > b) ? a : b;
}

inline qd_real max(const qd_real &a, const qd_real &b,
                   const qd_real &c) {
  return (a > b) ? ((a > c) ? a : c) : ((b > c) ? b : c);
}

inline qd_real min(const qd_real &a, const qd_real &b) {
  return (a < b) ? a : b;
}

inline qd_real min(const qd_real &a, const qd_real &b,
                   const qd_real &c) {
  return (a < b) ? ((a < c) ? a : c) : ((b < c) ? b : c);
}


inline qd_real qd_real::rand() {
  return qdrand();
}

inline qd_real ldexp(const qd_real &a, int n) {
  return qd_real(std::ldexp(a[0], n), std::ldexp(a[1], n),
                 std::ldexp(a[2], n), std::ldexp(a[3], n));
}
# 292 "qd/include/qd/qd_real.h" 2
# 13 "precision.h" 2







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






template<typename floatval_t>
inline std::string to_out_string(floatval_t a, const int nDigs);

template<>
inline std::string to_out_string<float>( float a, const int nDigs) { std::ostringstream streamObj; streamObj << std::setprecision(nDigs) << a; return streamObj.str(); }
template<>
inline std::string to_out_string<double>( double a, const int nDigs) { std::ostringstream streamObj; streamObj << std::setprecision(nDigs) << a; return streamObj.str(); }
template<>
inline std::string to_out_string<dd_real>( dd_real a, const int nDigs) { return a.to_string(nDigs, 0, std::ios_base::scientific); }
template<>
inline std::string to_out_string<qd_real>( qd_real a, const int nDigs) { return a.to_string(nDigs, 0, std::ios_base::scientific); }
template<>
inline std::string to_out_string<mp_real>( mp_real a, const int nDigs) { return a.to_string(nDigs, 0, 0, std::ios_base::scientific); }
# 205 "precision.h"
template <typename floatval_t>
inline floatval_t rnd_uni()
{
    return ((floatval_t)rand()) / 
# 208 "precision.h" 3 4
                                 2147483647
# 208 "precision.h"
                                         ;
}
# 7 "function.h" 2
# 15 "localMinima.cpp" 2
# 23 "localMinima.cpp"
# 1 "lbfgs.h" 1
# 53 "lbfgs.h"
enum {

    LBFGS_SUCCESS = 0,
    LBFGS_CONVERGENCE = 0,
    LBFGS_STOP,

    LBFGS_ALREADY_MINIMIZED,


    LBFGSERR_UNKNOWNERROR = -1024,

    LBFGSERR_LOGICERROR,

    LBFGSERR_OUTOFMEMORY,

    LBFGSERR_CANCELED,

    LBFGSERR_INVALID_N,

    LBFGSERR_INVALID_N_SSE,

    LBFGSERR_INVALID_X_SSE,

    LBFGSERR_INVALID_EPSILON,

    LBFGSERR_INVALID_TESTPERIOD,

    LBFGSERR_INVALID_DELTA,

    LBFGSERR_INVALID_LINESEARCH,

    LBFGSERR_INVALID_MINSTEP,

    LBFGSERR_INVALID_MAXSTEP,

    LBFGSERR_INVALID_FTOL,

    LBFGSERR_INVALID_WOLFE,

    LBFGSERR_INVALID_GTOL,

    LBFGSERR_INVALID_XTOL,

    LBFGSERR_INVALID_MAXLINESEARCH,

    LBFGSERR_INVALID_ORTHANTWISE,

    LBFGSERR_INVALID_ORTHANTWISE_START,

    LBFGSERR_INVALID_ORTHANTWISE_END,

    LBFGSERR_OUTOFINTERVAL,


    LBFGSERR_INCORRECT_TMINMAX,


    LBFGSERR_ROUNDING_ERROR,

    LBFGSERR_MINIMUMSTEP,

    LBFGSERR_MAXIMUMSTEP,

    LBFGSERR_MAXIMUMLINESEARCH,

    LBFGSERR_MAXIMUMITERATION,


    LBFGSERR_WIDTHTOOSMALL,

    LBFGSERR_INVALIDPARAMETERS,

    LBFGSERR_INCREASEGRADIENT,

    LBFGSERR_INVALID_BOUNDS,

    LBFGSERR_INVALID_START_X
};




enum {

    LBFGS_LINESEARCH_DEFAULT = 0,

    LBFGS_LINESEARCH_MORETHUENTE = 0,
# 149 "lbfgs.h"
    LBFGS_LINESEARCH_BACKTRACKING_ARMIJO = 1,

    LBFGS_LINESEARCH_BACKTRACKING = 2,
# 162 "lbfgs.h"
    LBFGS_LINESEARCH_BACKTRACKING_WOLFE = 2,
# 173 "lbfgs.h"
    LBFGS_LINESEARCH_BACKTRACKING_STRONG_WOLFE = 3
};





template <typename floatval_t>
struct lbfgs_parameter_t {
# 190 "lbfgs.h"
    int m;
# 200 "lbfgs.h"
    floatval_t conv_epsilon;




    floatval_t eps;
# 214 "lbfgs.h"
    int past;
# 226 "lbfgs.h"
    floatval_t delta;
# 236 "lbfgs.h"
    int max_iterations;






    int linesearch;






    int max_linesearch;
# 259 "lbfgs.h"
    floatval_t min_step;
# 268 "lbfgs.h"
    floatval_t max_step;






    floatval_t ftol;
# 286 "lbfgs.h"
    floatval_t wolfe;
# 298 "lbfgs.h"
    floatval_t gtol;
# 307 "lbfgs.h"
    floatval_t xtol;
# 322 "lbfgs.h"
    floatval_t orthantwise_c;
# 336 "lbfgs.h"
    int orthantwise_start;
# 345 "lbfgs.h"
    int orthantwise_end;




    floatval_t gstep;
};
# 371 "lbfgs.h"
template<typename floatval_t>
using lbfgs_evaluate_t = floatval_t (*)(
    void *,
    const floatval_t *,
    const floatval_t *,
    floatval_t *,
    const int,
    const floatval_t
    );
# 401 "lbfgs.h"
template <typename floatval_t>
using lbfgs_progress_t = int (*)(
    void *,
    const floatval_t *,
    const floatval_t *,
    const floatval_t,
    const floatval_t,
    const floatval_t,
    const floatval_t,
    int,
    int,
    int
    );

template <typename floatval_t>
struct callback_data_t {
    int n;
    void *instance;
    lbfgs_evaluate_t<floatval_t> proc_evaluate;
    lbfgs_progress_t<floatval_t> proc_progress;
};

template <typename floatval_t>
using line_search_proc_t = int (*)(
    int,
    floatval_t *,
    floatval_t *,
    floatval_t *,
    floatval_t *,
    floatval_t *,
    floatval_t *,
    floatval_t *,
    floatval_t *,
    const floatval_t*,
    const floatval_t*,
    floatval_t *,
    callback_data_t<floatval_t> *,
    const lbfgs_parameter_t<floatval_t> *
    );

template <typename floatval_t>
struct iteration_data_t {
    floatval_t alpha;
    floatval_t *s;
    floatval_t *y;
    floatval_t ys;
    };






template <typename floatval_t>
struct lbfgs_wspace_t {



    line_search_proc_t<floatval_t> linesearch;

    lbfgs_parameter_t<floatval_t> param;




    floatval_t *xp;
    floatval_t *g, *gp, *pg;
    floatval_t *d, *w, *pf;
    iteration_data_t<floatval_t> *lm;
    };
# 532 "lbfgs.h"
template <typename floatval_t>
int lbfgs(
    int n,
    floatval_t *x,
    floatval_t *ptr_fx,
    floatval_t *lowerbounds,
    floatval_t *upperbounds,
    floatval_t *extparams,
    lbfgs_evaluate_t<floatval_t> proc_evaluate,
    lbfgs_progress_t<floatval_t> proc_progress,
    void *instance,
    lbfgs_wspace_t<floatval_t> *wspace
    );






template <typename floatval_t>
int lbfgs_init(int n, lbfgs_wspace_t<floatval_t> *wspace, lbfgs_parameter_t<floatval_t> *param);




template <typename floatval_t>
int lbfgs_dest(lbfgs_wspace_t<floatval_t> *wspace);
# 24 "localMinima.cpp" 2

# 1 "preprocessor_trickery.h" 1
# 26 "localMinima.cpp" 2


# 1 "/usr/include/unistd.h" 1 3 4
# 27 "/usr/include/unistd.h" 3 4

# 27 "/usr/include/unistd.h" 3 4
extern "C" {
# 205 "/usr/include/unistd.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/posix_opt.h" 1 3 4
# 206 "/usr/include/unistd.h" 2 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/environments.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/environments.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 23 "/usr/include/x86_64-linux-gnu/bits/environments.h" 2 3 4
# 210 "/usr/include/unistd.h" 2 3 4
# 229 "/usr/include/unistd.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 1 3 4
# 230 "/usr/include/unistd.h" 2 3 4
# 270 "/usr/include/unistd.h" 3 4
typedef __intptr_t intptr_t;






typedef __socklen_t socklen_t;
# 290 "/usr/include/unistd.h" 3 4
extern int access (const char *__name, int __type) throw () __attribute__ ((__nonnull__ (1)));




extern int euidaccess (const char *__name, int __type)
     throw () __attribute__ ((__nonnull__ (1)));


extern int eaccess (const char *__name, int __type)
     throw () __attribute__ ((__nonnull__ (1)));






extern int faccessat (int __fd, const char *__file, int __type, int __flag)
     throw () __attribute__ ((__nonnull__ (2))) ;
# 337 "/usr/include/unistd.h" 3 4
extern __off_t lseek (int __fd, __off_t __offset, int __whence) throw ();
# 348 "/usr/include/unistd.h" 3 4
extern __off64_t lseek64 (int __fd, __off64_t __offset, int __whence)
     throw ();






extern int close (int __fd);






extern ssize_t read (int __fd, void *__buf, size_t __nbytes) ;





extern ssize_t write (int __fd, const void *__buf, size_t __n) ;
# 379 "/usr/include/unistd.h" 3 4
extern ssize_t pread (int __fd, void *__buf, size_t __nbytes,
        __off_t __offset) ;






extern ssize_t pwrite (int __fd, const void *__buf, size_t __n,
         __off_t __offset) ;
# 407 "/usr/include/unistd.h" 3 4
extern ssize_t pread64 (int __fd, void *__buf, size_t __nbytes,
   __off64_t __offset) ;


extern ssize_t pwrite64 (int __fd, const void *__buf, size_t __n,
    __off64_t __offset) ;







extern int pipe (int __pipedes[2]) throw () ;




extern int pipe2 (int __pipedes[2], int __flags) throw () ;
# 435 "/usr/include/unistd.h" 3 4
extern unsigned int alarm (unsigned int __seconds) throw ();
# 447 "/usr/include/unistd.h" 3 4
extern unsigned int sleep (unsigned int __seconds);







extern __useconds_t ualarm (__useconds_t __value, __useconds_t __interval)
     throw ();






extern int usleep (__useconds_t __useconds);
# 472 "/usr/include/unistd.h" 3 4
extern int pause (void);



extern int chown (const char *__file, __uid_t __owner, __gid_t __group)
     throw () __attribute__ ((__nonnull__ (1))) ;



extern int fchown (int __fd, __uid_t __owner, __gid_t __group) throw () ;




extern int lchown (const char *__file, __uid_t __owner, __gid_t __group)
     throw () __attribute__ ((__nonnull__ (1))) ;






extern int fchownat (int __fd, const char *__file, __uid_t __owner,
       __gid_t __group, int __flag)
     throw () __attribute__ ((__nonnull__ (2))) ;



extern int chdir (const char *__path) throw () __attribute__ ((__nonnull__ (1))) ;



extern int fchdir (int __fd) throw () ;
# 514 "/usr/include/unistd.h" 3 4
extern char *getcwd (char *__buf, size_t __size) throw () ;





extern char *get_current_dir_name (void) throw ();







extern char *getwd (char *__buf)
     throw () __attribute__ ((__nonnull__ (1))) __attribute__ ((__deprecated__)) ;




extern int dup (int __fd) throw () ;


extern int dup2 (int __fd, int __fd2) throw ();




extern int dup3 (int __fd, int __fd2, int __flags) throw ();



extern char **__environ;

extern char **environ;





extern int execve (const char *__path, char *const __argv[],
     char *const __envp[]) throw () __attribute__ ((__nonnull__ (1, 2)));




extern int fexecve (int __fd, char *const __argv[], char *const __envp[])
     throw () __attribute__ ((__nonnull__ (2)));




extern int execv (const char *__path, char *const __argv[])
     throw () __attribute__ ((__nonnull__ (1, 2)));



extern int execle (const char *__path, const char *__arg, ...)
     throw () __attribute__ ((__nonnull__ (1, 2)));



extern int execl (const char *__path, const char *__arg, ...)
     throw () __attribute__ ((__nonnull__ (1, 2)));



extern int execvp (const char *__file, char *const __argv[])
     throw () __attribute__ ((__nonnull__ (1, 2)));




extern int execlp (const char *__file, const char *__arg, ...)
     throw () __attribute__ ((__nonnull__ (1, 2)));




extern int execvpe (const char *__file, char *const __argv[],
      char *const __envp[])
     throw () __attribute__ ((__nonnull__ (1, 2)));





extern int nice (int __inc) throw () ;




extern void _exit (int __status) __attribute__ ((__noreturn__));





# 1 "/usr/include/x86_64-linux-gnu/bits/confname.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/confname.h" 3 4
enum
  {
    _PC_LINK_MAX,

    _PC_MAX_CANON,

    _PC_MAX_INPUT,

    _PC_NAME_MAX,

    _PC_PATH_MAX,

    _PC_PIPE_BUF,

    _PC_CHOWN_RESTRICTED,

    _PC_NO_TRUNC,

    _PC_VDISABLE,

    _PC_SYNC_IO,

    _PC_ASYNC_IO,

    _PC_PRIO_IO,

    _PC_SOCK_MAXBUF,

    _PC_FILESIZEBITS,

    _PC_REC_INCR_XFER_SIZE,

    _PC_REC_MAX_XFER_SIZE,

    _PC_REC_MIN_XFER_SIZE,

    _PC_REC_XFER_ALIGN,

    _PC_ALLOC_SIZE_MIN,

    _PC_SYMLINK_MAX,

    _PC_2_SYMLINKS

  };


enum
  {
    _SC_ARG_MAX,

    _SC_CHILD_MAX,

    _SC_CLK_TCK,

    _SC_NGROUPS_MAX,

    _SC_OPEN_MAX,

    _SC_STREAM_MAX,

    _SC_TZNAME_MAX,

    _SC_JOB_CONTROL,

    _SC_SAVED_IDS,

    _SC_REALTIME_SIGNALS,

    _SC_PRIORITY_SCHEDULING,

    _SC_TIMERS,

    _SC_ASYNCHRONOUS_IO,

    _SC_PRIORITIZED_IO,

    _SC_SYNCHRONIZED_IO,

    _SC_FSYNC,

    _SC_MAPPED_FILES,

    _SC_MEMLOCK,

    _SC_MEMLOCK_RANGE,

    _SC_MEMORY_PROTECTION,

    _SC_MESSAGE_PASSING,

    _SC_SEMAPHORES,

    _SC_SHARED_MEMORY_OBJECTS,

    _SC_AIO_LISTIO_MAX,

    _SC_AIO_MAX,

    _SC_AIO_PRIO_DELTA_MAX,

    _SC_DELAYTIMER_MAX,

    _SC_MQ_OPEN_MAX,

    _SC_MQ_PRIO_MAX,

    _SC_VERSION,

    _SC_PAGESIZE,


    _SC_RTSIG_MAX,

    _SC_SEM_NSEMS_MAX,

    _SC_SEM_VALUE_MAX,

    _SC_SIGQUEUE_MAX,

    _SC_TIMER_MAX,




    _SC_BC_BASE_MAX,

    _SC_BC_DIM_MAX,

    _SC_BC_SCALE_MAX,

    _SC_BC_STRING_MAX,

    _SC_COLL_WEIGHTS_MAX,

    _SC_EQUIV_CLASS_MAX,

    _SC_EXPR_NEST_MAX,

    _SC_LINE_MAX,

    _SC_RE_DUP_MAX,

    _SC_CHARCLASS_NAME_MAX,


    _SC_2_VERSION,

    _SC_2_C_BIND,

    _SC_2_C_DEV,

    _SC_2_FORT_DEV,

    _SC_2_FORT_RUN,

    _SC_2_SW_DEV,

    _SC_2_LOCALEDEF,


    _SC_PII,

    _SC_PII_XTI,

    _SC_PII_SOCKET,

    _SC_PII_INTERNET,

    _SC_PII_OSI,

    _SC_POLL,

    _SC_SELECT,

    _SC_UIO_MAXIOV,

    _SC_IOV_MAX = _SC_UIO_MAXIOV,

    _SC_PII_INTERNET_STREAM,

    _SC_PII_INTERNET_DGRAM,

    _SC_PII_OSI_COTS,

    _SC_PII_OSI_CLTS,

    _SC_PII_OSI_M,

    _SC_T_IOV_MAX,



    _SC_THREADS,

    _SC_THREAD_SAFE_FUNCTIONS,

    _SC_GETGR_R_SIZE_MAX,

    _SC_GETPW_R_SIZE_MAX,

    _SC_LOGIN_NAME_MAX,

    _SC_TTY_NAME_MAX,

    _SC_THREAD_DESTRUCTOR_ITERATIONS,

    _SC_THREAD_KEYS_MAX,

    _SC_THREAD_STACK_MIN,

    _SC_THREAD_THREADS_MAX,

    _SC_THREAD_ATTR_STACKADDR,

    _SC_THREAD_ATTR_STACKSIZE,

    _SC_THREAD_PRIORITY_SCHEDULING,

    _SC_THREAD_PRIO_INHERIT,

    _SC_THREAD_PRIO_PROTECT,

    _SC_THREAD_PROCESS_SHARED,


    _SC_NPROCESSORS_CONF,

    _SC_NPROCESSORS_ONLN,

    _SC_PHYS_PAGES,

    _SC_AVPHYS_PAGES,

    _SC_ATEXIT_MAX,

    _SC_PASS_MAX,


    _SC_XOPEN_VERSION,

    _SC_XOPEN_XCU_VERSION,

    _SC_XOPEN_UNIX,

    _SC_XOPEN_CRYPT,

    _SC_XOPEN_ENH_I18N,

    _SC_XOPEN_SHM,


    _SC_2_CHAR_TERM,

    _SC_2_C_VERSION,

    _SC_2_UPE,


    _SC_XOPEN_XPG2,

    _SC_XOPEN_XPG3,

    _SC_XOPEN_XPG4,


    _SC_CHAR_BIT,

    _SC_CHAR_MAX,

    _SC_CHAR_MIN,

    _SC_INT_MAX,

    _SC_INT_MIN,

    _SC_LONG_BIT,

    _SC_WORD_BIT,

    _SC_MB_LEN_MAX,

    _SC_NZERO,

    _SC_SSIZE_MAX,

    _SC_SCHAR_MAX,

    _SC_SCHAR_MIN,

    _SC_SHRT_MAX,

    _SC_SHRT_MIN,

    _SC_UCHAR_MAX,

    _SC_UINT_MAX,

    _SC_ULONG_MAX,

    _SC_USHRT_MAX,


    _SC_NL_ARGMAX,

    _SC_NL_LANGMAX,

    _SC_NL_MSGMAX,

    _SC_NL_NMAX,

    _SC_NL_SETMAX,

    _SC_NL_TEXTMAX,


    _SC_XBS5_ILP32_OFF32,

    _SC_XBS5_ILP32_OFFBIG,

    _SC_XBS5_LP64_OFF64,

    _SC_XBS5_LPBIG_OFFBIG,


    _SC_XOPEN_LEGACY,

    _SC_XOPEN_REALTIME,

    _SC_XOPEN_REALTIME_THREADS,


    _SC_ADVISORY_INFO,

    _SC_BARRIERS,

    _SC_BASE,

    _SC_C_LANG_SUPPORT,

    _SC_C_LANG_SUPPORT_R,

    _SC_CLOCK_SELECTION,

    _SC_CPUTIME,

    _SC_THREAD_CPUTIME,

    _SC_DEVICE_IO,

    _SC_DEVICE_SPECIFIC,

    _SC_DEVICE_SPECIFIC_R,

    _SC_FD_MGMT,

    _SC_FIFO,

    _SC_PIPE,

    _SC_FILE_ATTRIBUTES,

    _SC_FILE_LOCKING,

    _SC_FILE_SYSTEM,

    _SC_MONOTONIC_CLOCK,

    _SC_MULTI_PROCESS,

    _SC_SINGLE_PROCESS,

    _SC_NETWORKING,

    _SC_READER_WRITER_LOCKS,

    _SC_SPIN_LOCKS,

    _SC_REGEXP,

    _SC_REGEX_VERSION,

    _SC_SHELL,

    _SC_SIGNALS,

    _SC_SPAWN,

    _SC_SPORADIC_SERVER,

    _SC_THREAD_SPORADIC_SERVER,

    _SC_SYSTEM_DATABASE,

    _SC_SYSTEM_DATABASE_R,

    _SC_TIMEOUTS,

    _SC_TYPED_MEMORY_OBJECTS,

    _SC_USER_GROUPS,

    _SC_USER_GROUPS_R,

    _SC_2_PBS,

    _SC_2_PBS_ACCOUNTING,

    _SC_2_PBS_LOCATE,

    _SC_2_PBS_MESSAGE,

    _SC_2_PBS_TRACK,

    _SC_SYMLOOP_MAX,

    _SC_STREAMS,

    _SC_2_PBS_CHECKPOINT,


    _SC_V6_ILP32_OFF32,

    _SC_V6_ILP32_OFFBIG,

    _SC_V6_LP64_OFF64,

    _SC_V6_LPBIG_OFFBIG,


    _SC_HOST_NAME_MAX,

    _SC_TRACE,

    _SC_TRACE_EVENT_FILTER,

    _SC_TRACE_INHERIT,

    _SC_TRACE_LOG,


    _SC_LEVEL1_ICACHE_SIZE,

    _SC_LEVEL1_ICACHE_ASSOC,

    _SC_LEVEL1_ICACHE_LINESIZE,

    _SC_LEVEL1_DCACHE_SIZE,

    _SC_LEVEL1_DCACHE_ASSOC,

    _SC_LEVEL1_DCACHE_LINESIZE,

    _SC_LEVEL2_CACHE_SIZE,

    _SC_LEVEL2_CACHE_ASSOC,

    _SC_LEVEL2_CACHE_LINESIZE,

    _SC_LEVEL3_CACHE_SIZE,

    _SC_LEVEL3_CACHE_ASSOC,

    _SC_LEVEL3_CACHE_LINESIZE,

    _SC_LEVEL4_CACHE_SIZE,

    _SC_LEVEL4_CACHE_ASSOC,

    _SC_LEVEL4_CACHE_LINESIZE,



    _SC_IPV6 = _SC_LEVEL1_ICACHE_SIZE + 50,

    _SC_RAW_SOCKETS,


    _SC_V7_ILP32_OFF32,

    _SC_V7_ILP32_OFFBIG,

    _SC_V7_LP64_OFF64,

    _SC_V7_LPBIG_OFFBIG,


    _SC_SS_REPL_MAX,


    _SC_TRACE_EVENT_NAME_MAX,

    _SC_TRACE_NAME_MAX,

    _SC_TRACE_SYS_MAX,

    _SC_TRACE_USER_EVENT_MAX,


    _SC_XOPEN_STREAMS,


    _SC_THREAD_ROBUST_PRIO_INHERIT,

    _SC_THREAD_ROBUST_PRIO_PROTECT

  };


enum
  {
    _CS_PATH,


    _CS_V6_WIDTH_RESTRICTED_ENVS,



    _CS_GNU_LIBC_VERSION,

    _CS_GNU_LIBPTHREAD_VERSION,


    _CS_V5_WIDTH_RESTRICTED_ENVS,



    _CS_V7_WIDTH_RESTRICTED_ENVS,



    _CS_LFS_CFLAGS = 1000,

    _CS_LFS_LDFLAGS,

    _CS_LFS_LIBS,

    _CS_LFS_LINTFLAGS,

    _CS_LFS64_CFLAGS,

    _CS_LFS64_LDFLAGS,

    _CS_LFS64_LIBS,

    _CS_LFS64_LINTFLAGS,


    _CS_XBS5_ILP32_OFF32_CFLAGS = 1100,

    _CS_XBS5_ILP32_OFF32_LDFLAGS,

    _CS_XBS5_ILP32_OFF32_LIBS,

    _CS_XBS5_ILP32_OFF32_LINTFLAGS,

    _CS_XBS5_ILP32_OFFBIG_CFLAGS,

    _CS_XBS5_ILP32_OFFBIG_LDFLAGS,

    _CS_XBS5_ILP32_OFFBIG_LIBS,

    _CS_XBS5_ILP32_OFFBIG_LINTFLAGS,

    _CS_XBS5_LP64_OFF64_CFLAGS,

    _CS_XBS5_LP64_OFF64_LDFLAGS,

    _CS_XBS5_LP64_OFF64_LIBS,

    _CS_XBS5_LP64_OFF64_LINTFLAGS,

    _CS_XBS5_LPBIG_OFFBIG_CFLAGS,

    _CS_XBS5_LPBIG_OFFBIG_LDFLAGS,

    _CS_XBS5_LPBIG_OFFBIG_LIBS,

    _CS_XBS5_LPBIG_OFFBIG_LINTFLAGS,


    _CS_POSIX_V6_ILP32_OFF32_CFLAGS,

    _CS_POSIX_V6_ILP32_OFF32_LDFLAGS,

    _CS_POSIX_V6_ILP32_OFF32_LIBS,

    _CS_POSIX_V6_ILP32_OFF32_LINTFLAGS,

    _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS,

    _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS,

    _CS_POSIX_V6_ILP32_OFFBIG_LIBS,

    _CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS,

    _CS_POSIX_V6_LP64_OFF64_CFLAGS,

    _CS_POSIX_V6_LP64_OFF64_LDFLAGS,

    _CS_POSIX_V6_LP64_OFF64_LIBS,

    _CS_POSIX_V6_LP64_OFF64_LINTFLAGS,

    _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS,

    _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS,

    _CS_POSIX_V6_LPBIG_OFFBIG_LIBS,

    _CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS,


    _CS_POSIX_V7_ILP32_OFF32_CFLAGS,

    _CS_POSIX_V7_ILP32_OFF32_LDFLAGS,

    _CS_POSIX_V7_ILP32_OFF32_LIBS,

    _CS_POSIX_V7_ILP32_OFF32_LINTFLAGS,

    _CS_POSIX_V7_ILP32_OFFBIG_CFLAGS,

    _CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS,

    _CS_POSIX_V7_ILP32_OFFBIG_LIBS,

    _CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS,

    _CS_POSIX_V7_LP64_OFF64_CFLAGS,

    _CS_POSIX_V7_LP64_OFF64_LDFLAGS,

    _CS_POSIX_V7_LP64_OFF64_LIBS,

    _CS_POSIX_V7_LP64_OFF64_LINTFLAGS,

    _CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS,

    _CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS,

    _CS_POSIX_V7_LPBIG_OFFBIG_LIBS,

    _CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS,


    _CS_V6_ENV,

    _CS_V7_ENV

  };
# 613 "/usr/include/unistd.h" 2 3 4


extern long int pathconf (const char *__path, int __name)
     throw () __attribute__ ((__nonnull__ (1)));


extern long int fpathconf (int __fd, int __name) throw ();


extern long int sysconf (int __name) throw ();



extern size_t confstr (int __name, char *__buf, size_t __len) throw ();




extern __pid_t getpid (void) throw ();


extern __pid_t getppid (void) throw ();


extern __pid_t getpgrp (void) throw ();


extern __pid_t __getpgid (__pid_t __pid) throw ();

extern __pid_t getpgid (__pid_t __pid) throw ();






extern int setpgid (__pid_t __pid, __pid_t __pgid) throw ();
# 663 "/usr/include/unistd.h" 3 4
extern int setpgrp (void) throw ();






extern __pid_t setsid (void) throw ();



extern __pid_t getsid (__pid_t __pid) throw ();



extern __uid_t getuid (void) throw ();


extern __uid_t geteuid (void) throw ();


extern __gid_t getgid (void) throw ();


extern __gid_t getegid (void) throw ();




extern int getgroups (int __size, __gid_t __list[]) throw () ;



extern int group_member (__gid_t __gid) throw ();






extern int setuid (__uid_t __uid) throw () ;




extern int setreuid (__uid_t __ruid, __uid_t __euid) throw () ;




extern int seteuid (__uid_t __uid) throw () ;






extern int setgid (__gid_t __gid) throw () ;




extern int setregid (__gid_t __rgid, __gid_t __egid) throw () ;




extern int setegid (__gid_t __gid) throw () ;





extern int getresuid (__uid_t *__ruid, __uid_t *__euid, __uid_t *__suid)
     throw ();



extern int getresgid (__gid_t *__rgid, __gid_t *__egid, __gid_t *__sgid)
     throw ();



extern int setresuid (__uid_t __ruid, __uid_t __euid, __uid_t __suid)
     throw () ;



extern int setresgid (__gid_t __rgid, __gid_t __egid, __gid_t __sgid)
     throw () ;






extern __pid_t fork (void) throw ();







extern __pid_t vfork (void) throw ();





extern char *ttyname (int __fd) throw ();



extern int ttyname_r (int __fd, char *__buf, size_t __buflen)
     throw () __attribute__ ((__nonnull__ (2))) ;



extern int isatty (int __fd) throw ();





extern int ttyslot (void) throw ();




extern int link (const char *__from, const char *__to)
     throw () __attribute__ ((__nonnull__ (1, 2))) ;




extern int linkat (int __fromfd, const char *__from, int __tofd,
     const char *__to, int __flags)
     throw () __attribute__ ((__nonnull__ (2, 4))) ;




extern int symlink (const char *__from, const char *__to)
     throw () __attribute__ ((__nonnull__ (1, 2))) ;




extern ssize_t readlink (const char *__restrict __path,
    char *__restrict __buf, size_t __len)
     throw () __attribute__ ((__nonnull__ (1, 2))) ;




extern int symlinkat (const char *__from, int __tofd,
        const char *__to) throw () __attribute__ ((__nonnull__ (1, 3))) ;


extern ssize_t readlinkat (int __fd, const char *__restrict __path,
      char *__restrict __buf, size_t __len)
     throw () __attribute__ ((__nonnull__ (2, 3))) ;



extern int unlink (const char *__name) throw () __attribute__ ((__nonnull__ (1)));



extern int unlinkat (int __fd, const char *__name, int __flag)
     throw () __attribute__ ((__nonnull__ (2)));



extern int rmdir (const char *__path) throw () __attribute__ ((__nonnull__ (1)));



extern __pid_t tcgetpgrp (int __fd) throw ();


extern int tcsetpgrp (int __fd, __pid_t __pgrp_id) throw ();






extern char *getlogin (void);







extern int getlogin_r (char *__name, size_t __name_len) __attribute__ ((__nonnull__ (1)));




extern int setlogin (const char *__name) throw () __attribute__ ((__nonnull__ (1)));
# 874 "/usr/include/unistd.h" 3 4
# 1 "/usr/include/getopt.h" 1 3 4
# 48 "/usr/include/getopt.h" 3 4
extern "C" {
# 57 "/usr/include/getopt.h" 3 4
extern char *optarg;
# 71 "/usr/include/getopt.h" 3 4
extern int optind;




extern int opterr;



extern int optopt;
# 150 "/usr/include/getopt.h" 3 4
extern int getopt (int ___argc, char *const *___argv, const char *__shortopts)
       throw ();
# 185 "/usr/include/getopt.h" 3 4
}
# 875 "/usr/include/unistd.h" 2 3 4







extern int gethostname (char *__name, size_t __len) throw () __attribute__ ((__nonnull__ (1)));






extern int sethostname (const char *__name, size_t __len)
     throw () __attribute__ ((__nonnull__ (1))) ;



extern int sethostid (long int __id) throw () ;





extern int getdomainname (char *__name, size_t __len)
     throw () __attribute__ ((__nonnull__ (1))) ;
extern int setdomainname (const char *__name, size_t __len)
     throw () __attribute__ ((__nonnull__ (1))) ;





extern int vhangup (void) throw ();


extern int revoke (const char *__file) throw () __attribute__ ((__nonnull__ (1))) ;







extern int profil (unsigned short int *__sample_buffer, size_t __size,
     size_t __offset, unsigned int __scale)
     throw () __attribute__ ((__nonnull__ (1)));





extern int acct (const char *__name) throw ();



extern char *getusershell (void) throw ();
extern void endusershell (void) throw ();
extern void setusershell (void) throw ();





extern int daemon (int __nochdir, int __noclose) throw () ;






extern int chroot (const char *__path) throw () __attribute__ ((__nonnull__ (1))) ;



extern char *getpass (const char *__prompt) __attribute__ ((__nonnull__ (1)));







extern int fsync (int __fd);





extern int syncfs (int __fd) throw ();






extern long int gethostid (void);


extern void sync (void) throw ();





extern int getpagesize (void) throw () __attribute__ ((__const__));




extern int getdtablesize (void) throw ();
# 996 "/usr/include/unistd.h" 3 4
extern int truncate (const char *__file, __off_t __length)
     throw () __attribute__ ((__nonnull__ (1))) ;
# 1008 "/usr/include/unistd.h" 3 4
extern int truncate64 (const char *__file, __off64_t __length)
     throw () __attribute__ ((__nonnull__ (1))) ;
# 1019 "/usr/include/unistd.h" 3 4
extern int ftruncate (int __fd, __off_t __length) throw () ;
# 1029 "/usr/include/unistd.h" 3 4
extern int ftruncate64 (int __fd, __off64_t __length) throw () ;
# 1040 "/usr/include/unistd.h" 3 4
extern int brk (void *__addr) throw () ;





extern void *sbrk (intptr_t __delta) throw ();
# 1061 "/usr/include/unistd.h" 3 4
extern long int syscall (long int __sysno, ...) throw ();
# 1084 "/usr/include/unistd.h" 3 4
extern int lockf (int __fd, int __cmd, __off_t __len) ;
# 1094 "/usr/include/unistd.h" 3 4
extern int lockf64 (int __fd, int __cmd, __off64_t __len) ;
# 1115 "/usr/include/unistd.h" 3 4
extern int fdatasync (int __fildes);







extern char *crypt (const char *__key, const char *__salt)
     throw () __attribute__ ((__nonnull__ (1, 2)));



extern void encrypt (char *__glibc_block, int __edflag)
     throw () __attribute__ ((__nonnull__ (1)));






extern void swab (const void *__restrict __from, void *__restrict __to,
    ssize_t __n) throw () __attribute__ ((__nonnull__ (1, 2)));
# 1154 "/usr/include/unistd.h" 3 4
}
# 29 "localMinima.cpp" 2


# 30 "localMinima.cpp"
using namespace std;
using std::cout;
using std::cerr;
using std::endl;

template<typename floatval_t>
struct OptimizeResult
{
 floatval_t f;
 floatval_t* X;
};

template <typename floatval_t>
struct parameter_t
{
 floatval_t (*get)(int i, floatval_t* params, int depth);
 int (*steps)(floatval_t* params, int depth);
 int (*findPos)(floatval_t value, floatval_t* params, int depth);
};

template <typename floatval_t>
struct boundary_t
{
 floatval_t startLower;
 floatval_t incrementLower;
 floatval_t startUpper;
 floatval_t incrementUpper;
 int steps;
 int dim;
 bool intCast;
 bool hasSym;
};

int nruns = 0;
bool startBound = true;

dd_real* params;





dd_real* ubounds = 
# 72 "localMinima.cpp" 3 4
                          __null
# 72 "localMinima.cpp"
                              ;
dd_real* lbounds = 
# 73 "localMinima.cpp" 3 4
                          __null
# 73 "localMinima.cpp"
                              ;
dd_real* stepUp = 
# 74 "localMinima.cpp" 3 4
                         __null
# 74 "localMinima.cpp"
                             ;
dd_real* stepDown = 
# 75 "localMinima.cpp" 3 4
                           __null
# 75 "localMinima.cpp"
                               ;


dd_real* x0;

int currStage=0;

int nodeNum = 0;
# 130 "localMinima.cpp"
int nThreads = 1;

pthread_spinlock_t workLock;
pthread_mutex_t theadCoordLock;
pthread_cond_t threadsComplete;
pthread_cond_t threadsStart;
pthread_t* threadPool;
volatile int threadsDone = 0;
volatile int workNumber = 0;
volatile bool finished = false;
volatile int threadStartCount = 0;
bool threadError = false;


parameter_t<dd_real>* parameters;
boundary_t<dd_real>* boundaries;

int* threadMinBin;
int** threadBins;
int* threadFails;
int num_nodes;
bool* startLatch;





struct OptimizeResult<dd_real> bestRes;
struct OptimizeResult<dd_real>* results;
# 233 "localMinima.cpp"
static double lbgfs_evaluate_0_double( const double *X, const double *params, double *g, const int n, const double step ) { double* batch_x; double fx = 0.; double fx_sum = 0.; double* g_sum; for(int i=0;i<n;i++) { g[i] = 0.; } batch_x = new double[1]; g_sum = new double[1]; for(int i=0;i<n;i++) { g_sum[i] = 0.; } for(int i=0;i<10;i++) { for(int j=0;j<n;j++) { batch_x[j] = X[j] + 0.0001 * ((double)rand() / 
# 233 "localMinima.cpp" 3 4
2147483647 
# 233 "localMinima.cpp"
- 0.5); } fx = ({0.;}); ({g[0]=0.;}); for(int j=0;j<n;j++) { g_sum[j] += g[j]; } fx_sum += fx; } fx = fx_sum / 10; for(int i=0;i<n;i++) { g[i] = g_sum[i] / 10; } delete[] batch_x; delete[] g_sum; if(fx < 0.0) cout << "The cost function was negative!" << endl; return fx; } static double lbgfs_evaluate_1_double( const double *X, const double *params, double *g, const int n, const double step ) { double* batch_x; double fx = 0.; double fx_sum = 0.; double* g_sum; for(int i=0;i<n;i++) { g[i] = 0.; } batch_x = new double[1]; g_sum = new double[1]; for(int i=0;i<n;i++) { g_sum[i] = 0.; } for(int i=0;i<10;i++) { for(int j=0;j<n;j++) { batch_x[j] = X[j] + 0.0001 * ((double)rand() / 
# 233 "localMinima.cpp" 3 4
2147483647 
# 233 "localMinima.cpp"
- 0.5); } fx = FUNCTION1(batch_x, params); DERIVATIVES1(g, batch_x, params, fx, step); for(int j=0;j<n;j++) { g_sum[j] += g[j]; } fx_sum += fx; } fx = fx_sum / 10; for(int i=0;i<n;i++) { g[i] = g_sum[i] / 10; } delete[] batch_x; delete[] g_sum; if(fx < 0.0) cout << "The cost function was negative!" << endl; return fx; }



static dd_real lbgfs_evaluate_0_dd_real( const dd_real *X, const dd_real *params, dd_real *g, const int n, const dd_real step ) { dd_real* batch_x; dd_real fx = 0.; dd_real fx_sum = 0.; dd_real* g_sum; for(int i=0;i<n;i++) { g[i] = 0.; } batch_x = new dd_real[1]; g_sum = new dd_real[1]; for(int i=0;i<n;i++) { g_sum[i] = 0.; } for(int i=0;i<10;i++) { for(int j=0;j<n;j++) { batch_x[j] = X[j] + 0.0001 * ((dd_real)rand() / 
# 237 "localMinima.cpp" 3 4
2147483647 
# 237 "localMinima.cpp"
- 0.5); } fx = ({0.;}); ({g[0]=0.;}); for(int j=0;j<n;j++) { g_sum[j] += g[j]; } fx_sum += fx; } fx = fx_sum / 10; for(int i=0;i<n;i++) { g[i] = g_sum[i] / 10; } delete[] batch_x; delete[] g_sum; if(fx < 0.0) cout << "The cost function was negative!" << endl; return fx; } static dd_real lbgfs_evaluate_1_dd_real( const dd_real *X, const dd_real *params, dd_real *g, const int n, const dd_real step ) { dd_real* batch_x; dd_real fx = 0.; dd_real fx_sum = 0.; dd_real* g_sum; for(int i=0;i<n;i++) { g[i] = 0.; } batch_x = new dd_real[1]; g_sum = new dd_real[1]; for(int i=0;i<n;i++) { g_sum[i] = 0.; } for(int i=0;i<10;i++) { for(int j=0;j<n;j++) { batch_x[j] = X[j] + 0.0001 * ((dd_real)rand() / 
# 237 "localMinima.cpp" 3 4
2147483647 
# 237 "localMinima.cpp"
- 0.5); } fx = FUNCTION1(batch_x, params); DERIVATIVES1(g, batch_x, params, fx, step); for(int j=0;j<n;j++) { g_sum[j] += g[j]; } fx_sum += fx; } fx = fx_sum / 10; for(int i=0;i<n;i++) { g[i] = g_sum[i] / 10; } delete[] batch_x; delete[] g_sum; if(fx < 0.0) cout << "The cost function was negative!" << endl; return fx; }
# 258 "localMinima.cpp"
typedef void (*fptr)();





void (* evaluates_dbl [])( ) =
{
 reinterpret_cast<fptr>(lbgfs_evaluate_0_double) , reinterpret_cast<fptr>(de_evaluate_1_double)
};




void (* evaluates_dd [])( ) =
{
 reinterpret_cast<fptr>(lbgfs_evaluate_0_dd_real) , reinterpret_cast<fptr>(de_evaluate_1_dd_real)
};
# 298 "localMinima.cpp"
template <typename floatval_t>
static floatval_t de_evaluate(
 const floatval_t *X,
 const floatval_t *params,
 const int n
 )
{
 floatval_t* batch_x;
 floatval_t fx = 0.;
 floatval_t fx_sum = 0.;

 if(false)
 {
  batch_x = new floatval_t[1];

  for(int i=0;i<10;i++)
  {
   for(int j=0;j<n;j++)
   {
    batch_x[j] = X[j] + 0.0001 * ((floatval_t)rand() / 
# 317 "localMinima.cpp" 3 4
                                                     2147483647 
# 317 "localMinima.cpp"
                                                              - 0.5);
   }

   fx = FUNCTION(batch_x, params);

   fx_sum += fx;
  }

  fx = fx_sum / 10;

  delete[] batch_x;
 }
 else
 {
  fx = FUNCTION(X, params);
 }

 return fx;
}

template <typename floatval_t>
static int progress(
 const floatval_t *x,
 const floatval_t *g,
 const floatval_t fx,
 const floatval_t xnorm,
 const floatval_t gnorm,
 const floatval_t step,
 int n,
 int k,
 int ls
 )
{
 cout << "Iteration " << k << ":" << endl;
 cout << "  fx = " << to_out_string(fx,9);

 for(int j = 0; j < 1; j++)
 {
  cout << ", x[" << j << "] = " << to_out_string(x[j],9);
 }

 cout << endl;
 cout << "  xnorm = " << to_out_string(xnorm,9) << ", gnorm =" << to_out_string(gnorm,9);
 cout << ", step = " << to_out_string(step,9) << endl;
 cout << endl;

 ofstream outfile;

 outfile.open("progress.csv", ios::app );

 outfile << k << "," << to_out_string(fx,9) << ",";
 for(int j = 0; j < 1; j++)
 {
  outfile << to_out_string(x[j],9) << ",";
 }
 for(int j = 0; j < 1; j++)
 {
  outfile << to_out_string(g[j],9) << ",";
 }
 outfile << to_out_string(step,9) << "," << ls << endl;

 return 0;
}





template <typename floatval_t>
class objective_function
{
public:
 bool initialized;
protected:
    floatval_t* m_x;
    floatval_t* localLower;
    floatval_t* localUpper;


 floatval_t* ini_upper;
 floatval_t* ini_lower;
 floatval_t* c;
    floatval_t* d;
    floatval_t* oldarray;
 floatval_t* newarray;
 floatval_t* swaparray;
 floatval_t* tmp;
    floatval_t* best;
 floatval_t* energy;
    floatval_t* bestit;

 int threadNum;
 int ret;
 lbfgs_wspace_t<floatval_t> wspace;

 const floatval_t EPS = get_epsilon<floatval_t>();

public:




    objective_function(int threadNum_in)
    {
     lbfgs_parameter_t<floatval_t> param;

  initialized = false;

  threadNum = threadNum_in;

     param.m = 12;
     param.conv_epsilon = get_conv_epsilon<floatval_t>();
  param.eps = EPS;
     param.past = 0;
     param.delta = get_delta<floatval_t>();
     param.max_iterations = 50;
     param.linesearch = LBFGS_LINESEARCH_MORETHUENTE;
     param.max_linesearch = 50;
     param.min_step = get_min_step<floatval_t>();
     param.max_step = get_max_step<floatval_t>();
     param.ftol = 1e-4;
     param.wolfe = 0.9;
     param.gtol = 0.9;
     param.xtol = EPS;
     param.orthantwise_c = 0.0;
     param.orthantwise_start = 0;
     param.orthantwise_end = -1;
  param.gstep = get_gstep<floatval_t>();

  ret = -1;


        m_x = new floatval_t[1];





        localLower = new floatval_t[1];
        localUpper = new floatval_t[1];

  int dimCount = 0;
  for (int i = 0;i < 1;i++)
  {
   for(int j = 0; j < boundaries[i].dim; j++)
   {
    bStepDown[dimCount + j] = (floatval_t)boundaries[i].incrementLower;
    bStepUp[dimCount + j] = (floatval_t)boundaries[i].incrementUpper;
    if(j == 0 && boundaries[i].hasSym)
    {



     bStepDown[dimCount + j] = 0.0;
    }
   }
   dimCount += boundaries[i].dim;
  }

  if(0 == 0)
  {
   ret = lbfgs_init<floatval_t>(1, &wspace, &param);
   if(ret != 0)
   {
    cout << "Initialization error: " << ret << endl;
    std::cout.flush();
    std::_Exit(
# 483 "localMinima.cpp" 3 4
              1
# 483 "localMinima.cpp"
                          );
   }
  }
  else if(0 == 1)
  {
   ini_upper = new floatval_t[1];
     ini_lower = new floatval_t[1];
   c = new floatval_t[30*1];
     d = new floatval_t[30*1];
     oldarray = new floatval_t[30*1];
      newarray = new floatval_t[30*1];
      swaparray = new floatval_t[30*1];
      tmp = new floatval_t[1];
      best = new floatval_t[1];
      bestit = new floatval_t[1];
      energy = new floatval_t[30];
  }

  if (m_x == 
# 501 "localMinima.cpp" 3 4
            __null 
# 501 "localMinima.cpp"
                 || localLower == 
# 501 "localMinima.cpp" 3 4
                                  __null 
# 501 "localMinima.cpp"
                                       || localUpper == 
# 501 "localMinima.cpp" 3 4
                                                        __null
# 501 "localMinima.cpp"
                                                            )
        {
            cout << "ERROR: Failed to allocate a memory block for variables." << endl;
   return;
        }

  initialized = true;
    }





    virtual ~objective_function()
    {

        if (m_x != 
# 517 "localMinima.cpp" 3 4
                  __null
# 517 "localMinima.cpp"
                      )
        {
            delete[] m_x;
            m_x = 
# 520 "localMinima.cpp" 3 4
                 __null
# 520 "localMinima.cpp"
                     ;
        }
        if (localLower != 
# 522 "localMinima.cpp" 3 4
                         __null
# 522 "localMinima.cpp"
                             )
        {
            delete[] localLower;
        }
        if (localUpper != 
# 526 "localMinima.cpp" 3 4
                         __null
# 526 "localMinima.cpp"
                             )
        {
            delete[] localUpper;
        }
  if (bStepDown != 
# 530 "localMinima.cpp" 3 4
                  __null
# 530 "localMinima.cpp"
                      )
        {
            delete[] bStepDown;
        }
        if (bStepUp != 
# 534 "localMinima.cpp" 3 4
                      __null
# 534 "localMinima.cpp"
                          )
        {
            delete[] bStepUp;
        }

  if(0 == 0)
  {
   lbfgs_dest<floatval_t>(&wspace);
  }
  else if(0 == 1)
  {
   delete[] ini_upper;
      delete[] ini_lower;
   delete[] c;
      delete[] d;
      delete[] oldarray;
      delete[] newarray;
      delete[] swaparray;
      delete[] tmp;
      delete[] best;
      delete[] bestit;
      delete[] energy;
  }
    }





 int getSingleStartPos(int workNumber)
 {
  int dim;
  int remaining;
  int dimNumber;
  int workPos;
  int dimCount = 0;

  floatval_t stepScale;


  if(true)
  {

   for(int j = 0; j < 1; j++)
   {

    int sect = rand() % (2*boundaries[j].dim - (boundaries[j].hasSym ? 1 : 0));


    for (int i = dimCount;i < (dimCount + boundaries[j].dim);i++)
    {
     if(fabs(bStepDown[i]) < EPS && sect >= 2*i)
       sect++;
     if(fabs(bStepUp[i]) < EPS && sect > 2*i)
       sect++;






     if((sect / 2) == i)
     {
      if((sect % 2))
       m_x[i] = localUpper[i] - bStepUp[i]*rnd_uni<floatval_t>();
      else
       m_x[i] = localLower[i] - bStepDown[i]*rnd_uni<floatval_t>();

     }
     else
     {
      m_x[i] = (localUpper[i] - localLower[i])*rnd_uni<floatval_t>() + localLower[i];
     }
# 621 "localMinima.cpp"
    }




    dimCount += boundaries[j].dim;
   }
  }
  else
  {

   if(startBound)
   {
    remaining = workNumber;

    for(int i = 0; i < 1; i++)
    {
     dimNumber = remaining / (int)pow(13, 1 - dimCount);
     remaining = remaining % (int)pow(13, 1 - dimCount);
     dimCount++;
     stepScale = (localUpper[i] - localLower[i]) / 13;

     m_x[i] = localLower[i] + (dimNumber + 0.5) * stepScale;
    }
   }
   else
   {
    if(workNumber > 2 * 1 * (int)pow(13, 1 - 1))
    {

     workNumber -= 2 * 1 * (int)pow(13, 1 - 1);
     dim = workNumber / (2 * (int)pow(13 - 1, 1 - 1));
     workPos = workNumber % (2 * (int)pow(13 - 1, 1 - 1));

     if(workPos > (int)pow(13 - 1, 1 - 1))
     {

      remaining = workPos - (int)pow(13 - 1, 1 - 1);

      for(int i = 0; i < 1; i++)
      {
       if(dim == i)
       {
        m_x[i] = localLower[i] - bStepDown[i];
       }
       else
       {
        dimNumber = remaining / (int)pow(13 - 1, 1 - 1 - dimCount);
        remaining = remaining % (int)pow(13 - 1, 1 - 1 - dimCount);
        dimCount++;
        stepScale = (localUpper[i] - localLower[i]) / (13 - 1);

        m_x[i] = localLower[i] + (dimNumber * stepScale - bStepDown[i]);
       }
      }
     }
     else
     {

      remaining = workPos;

      for(int i = 0; i < 1; i++)
      {
       if(dim == i)
       {
        m_x[i] = localUpper[i] - bStepUp[i];
       }
       else
       {
        dimNumber = remaining / (int)pow(13 - 1, 1 - 1 - dimCount);
        remaining = remaining % (int)pow(13 - 1, 1 - 1 - dimCount);
        dimCount++;
        stepScale = (localUpper[i] - localLower[i]) / (13 - 1);

        m_x[i] = localUpper[i] - (dimNumber * stepScale + bStepUp[i]);
       }
      }
     }
    }
    else
    {

     dim = workNumber / (2 * (int)pow(13, 1 - 1));
     workPos = workNumber % (2 * (int)pow(13, 1 - 1));

     if(workPos > (int)pow(13, 1 - 1))
     {

      remaining = workPos - (int)pow(13, 1 - 1);

      for(int i = 0; i < 1; i++)
      {
       if(dim == i)
       {
        m_x[i] = localLower[i] - bStepDown[i] / 2;
       }
       else
       {
        dimNumber = remaining / (int)pow(13, 1 - 1 - dimCount);
        remaining = remaining % (int)pow(13, 1 - 1 - dimCount);
        dimCount++;
        stepScale = (localUpper[i] - localLower[i]) / (13);

        m_x[i] = localLower[i] + (dimNumber * stepScale - bStepDown[i] / 2);
       }
      }
     }
     else
     {

      remaining = workPos;

      for(int i = 0; i < 1; i++)
      {
       if(dim == i)
       {
        m_x[i] = localUpper[i] - bStepUp[i] / 2;
       }
       else
       {
        dimNumber = remaining / (int)pow(13, 1 - 1 - dimCount);
        remaining = remaining % (int)pow(13, 1 - 1 - dimCount);
        dimCount++;
        stepScale = (localUpper[i] - localLower[i]) / (13);

        m_x[i] = localUpper[i] - (dimNumber * stepScale + bStepUp[i] / 2);
       }
      }
     }
    }
   }
  }

  return 0;
 }

 void setBounds()
 {
  for (int i = 0;i < 1;i++)
  {
   localLower[i] = (floatval_t)lbounds[i];
   localUpper[i] = (floatval_t)ubounds[i];
  }
 }





 int getSwarmStartPos(int workNumber)
 {
  int dimCount = 0;

  if(workNumber == 1 && !startBound)
  {

   for (int i = 0;i < 1;i++)
   {
    m_x[i] = (floatval_t)bestRes.X[i];

    ini_lower[i] = (floatval_t)(bestRes.X[i] - 0.005);
    ini_upper[i] = (floatval_t)(bestRes.X[i] + 0.005);
   }
  }
  else
  {

   for(int j = 0; j < nActiveBSETS; j++)
   {

    int sect = rand() % (2*boundaries[j].dim - (boundaries[j].hasSym ? 1 : 0));
    int upper = sect % 2;
    sect = (sect / 2) + dimCount;

    int fixedCounter = 0;
# 804 "localMinima.cpp"
    for (int i = dimCount;i < (dimCount + boundaries[j].dim);i++)
    {
     bool fixed = !((bStepDown[i] > EPS && !upper) || (bStepUp[i] > EPS && upper));
     if(sect + fixedCounter == i && !fixed)
     {
      if(upper)
      {
       m_x[i] = (localUpper[i] - 0.005) - (bStepUp[i] - 2*0.005)*rnd_uni<floatval_t>();
       ini_lower[i] = m_x[i] - 0.005;
       ini_upper[i] = m_x[i] + 0.005;
      }
      else
      {
       m_x[i] = (localLower[i] + 0.005) - (bStepDown[i] - 2*0.005)*rnd_uni<floatval_t>();
       ini_lower[i] = m_x[i] - 0.005;
       ini_upper[i] = m_x[i] + 0.005;
      }
     }
     else
     {
      if(fixed)
      {



       fixedCounter++;
       upper = !(upper);
      }

      m_x[i] = (localUpper[i] - localLower[i] - 2*0.005)*rnd_uni<floatval_t>() + localLower[i] + 0.005;
      ini_lower[i] = m_x[i] - 0.005;
      ini_upper[i] = m_x[i] + 0.005;
     }
# 851 "localMinima.cpp"
    }




    dimCount += boundaries[j].dim;
   }
  }

  return 0;
 }

 int getStartPosition(int workNumber)
 {



  int ret;
  if(0 == 0)
  {
   ret = getSingleStartPos(workNumber);
  }
  else if(0 == 1)
  {
   ret = getSwarmStartPos(workNumber);
  }
  else
  {
   ret = -1;
  }
# 926 "localMinima.cpp"
  return ret;
 }

    int run(struct OptimizeResult<floatval_t>* result, int workNumber, floatval_t* locParams, floatval_t* start_x, bool use_start)
    {
        int ret = -1;
        floatval_t fx = get_max_step<floatval_t>();
# 941 "localMinima.cpp"
  if(!use_start)
   ret = getStartPosition(workNumber);

  if(0 == 0)
  {
# 956 "localMinima.cpp"
      ret = lbfgs<floatval_t>(1, use_start ? start_x : m_x, &fx, localLower, localUpper, locParams, _lbgfs_evaluate, 
# 956 "localMinima.cpp" 3 4
                                                                                                                      __null
# 956 "localMinima.cpp"
                                                                                                                          , this, &wspace);







  }
# 973 "localMinima.cpp"
  else
  {
   cout << "Unknown search algorithm." << endl;
  }
# 990 "localMinima.cpp"
        for (int i = 0;i < 1;i++)
        {
   if(use_start)
    result->X[i] = start_x[i];
   else
    result->X[i] = m_x[i];

        }
        result->f = fx;

        return ret;
    }


 static floatval_t evaluate(
        const floatval_t *X,
        const floatval_t *params
        )
    {
        floatval_t fx = 0.;

  fx = FUNCTION(X, params);

        return fx;
    }

protected:
    static floatval_t _lbgfs_evaluate(
        const floatval_t *X,
        const floatval_t *params,
        floatval_t *g,
        const int n,
        const floatval_t step
        )
    {
        return reinterpret_cast<objective_function*>lbgfs_evaluate<floatval_t>(X, params, g, n, step);
    }
 static floatval_t _de_evaluate(
        const floatval_t *X,
        const floatval_t *params,
        const int n
        )
    {
        return reinterpret_cast<objective_function*>de_evaluate<floatval_t>(X, params, n);
    }

    static int _progress(
        void *instance,
        const floatval_t *x,
        const floatval_t *g,
        const floatval_t fx,
        const floatval_t xnorm,
        const floatval_t gnorm,
        const floatval_t step,
        int n,
        int k,
        int ls
        )
    {
        return reinterpret_cast<objective_function*>progress<floatval_t>(x, g, fx, xnorm, gnorm, step, n, k, ls);
    }
};





template<typename floatval_t>
void castBoundaries(int depth, int dimCount, objective_function<floatval_t> *obj, floatval_t* params, floatval_t* Xin, floatval_t* X, floatval_t* best, floatval_t* bestX);

template<typename floatval_t>
void locCastRecurs(int depth, int locDepth, int dimCount, objective_function<floatval_t> *obj, floatval_t* params, floatval_t* Xin, floatval_t* X, floatval_t* best, floatval_t* bestX)
{
 if(locDepth == boundaries[depth].dim)
 {
  castBoundaries<floatval_t>(depth + 1, dimCount + boundaries[depth].dim, obj, params, Xin, X, best, bestX);
 }
 else
 {
  X[dimCount + locDepth] = floor(Xin[dimCount + locDepth]);
  locCastRecurs<floatval_t>(depth, locDepth + 1, dimCount, obj, params, Xin, X, best, bestX);

  X[dimCount + locDepth] = ceil(Xin[dimCount + locDepth]);
  locCastRecurs<floatval_t>(depth, locDepth + 1, dimCount, obj, params, Xin, X, best, bestX);
 }
}


template<typename floatval_t>
void castBoundaries(int depth, int dimCount, objective_function<floatval_t> *obj, floatval_t* params, floatval_t* Xin, floatval_t* X, floatval_t* best, floatval_t* bestX)
{
 if(depth == nActiveBSETS)
 {
  floatval_t f = obj->evaluate(X, params);
  if(f < *best)
  {
   *best = f;
   for(int k = 0; k < 1; k++)
   {
    bestX[k] = X[k];
   }
  }
 }
 else
 {
  if(boundaries[depth].intCast)
  {
   locCastRecurs(depth, 0, dimCount, obj, params, Xin, X, best, bestX);
  }
  else
  {
   for(int i = 0; i < boundaries[depth].dim; i++)
   {
    X[dimCount + i] = Xin[dimCount + i];
   }
   castBoundaries(depth + 1, dimCount + boundaries[depth].dim, obj, params, Xin, X, best, bestX);
  }
 }
}


void *run_multi(void *threadarg)
{
 pthread_mutex_lock(&theadCoordLock);

 int threadNum = threadStartCount++;

 srand((int)time(
# 1117 "localMinima.cpp" 3 4
                __null
# 1117 "localMinima.cpp"
                    ) ^ (threadNum*(1+nodeNum)));

 objective_function<double> *obj_dbl = new objective_function<double>(threadNum);
 OptimizeResult<double> locResults_dbl;




 objective_function<dd_real> *obj_dd = new objective_function<dd_real>(threadNum);
 OptimizeResult<dd_real> locResults_dd;
# 1150 "localMinima.cpp"
 double* locParams_dbl = new double[0];
# 1159 "localMinima.cpp"
 bool workDone = false;
 bool exitFlag = true;
 bool mustCast = false;

 int item;
 int numWorks = nruns / nThreads;

 int n;
 int ret;

 dd_real bestCast;
 dd_real* bestCastX = new dd_real[1];
 dd_real* XCast = new dd_real[1];


 if(!obj_dbl->initialized)
 {
  delete obj_dbl;
  threadError = true;
  pthread_exit(
# 1178 "localMinima.cpp" 3 4
              __null
# 1178 "localMinima.cpp"
                  );
  return 
# 1179 "localMinima.cpp" 3 4
        __null
# 1179 "localMinima.cpp"
            ;
 }


 if(!obj_dd->initialized)
 {
  delete obj_dd;
  threadError = true;
  pthread_exit(
# 1187 "localMinima.cpp" 3 4
              __null
# 1187 "localMinima.cpp"
                  );
  return 
# 1188 "localMinima.cpp" 3 4
        __null
# 1188 "localMinima.cpp"
            ;
 }
# 1210 "localMinima.cpp"
 if(threadNum == nThreads - 1 && nruns % nThreads != 0)
 {
  numWorks = nruns % nThreads;
 }

 locResults_dbl.X = new double[1];


 locResults_dd.X = new dd_real[1];
# 1227 "localMinima.cpp"
 for(int i = 0; i < 1; i++)
 {
  if(boundaries[i].intCast)
  {
   mustCast = true;
  }
 }


 cout << "Thread number " << threadNum << " started." << endl;

 while(startLatch[threadNum])
 {
  pthread_cond_wait(&threadsStart, &theadCoordLock);
 }
 startLatch[threadNum] = true;
 pthread_mutex_unlock(&theadCoordLock);

 if(threadError)
 {
  delete obj_dbl;

  delete obj_dd;
# 1258 "localMinima.cpp"
  pthread_exit(
# 1258 "localMinima.cpp" 3 4
              __null
# 1258 "localMinima.cpp"
                  );
  return 
# 1259 "localMinima.cpp" 3 4
        __null
# 1259 "localMinima.cpp"
            ;
 }

 while(!finished)
 {
  pthread_spin_lock(&workLock);
  if(workNumber < nruns)
  {
   item = workNumber++;
   exitFlag = false;
  }
  pthread_spin_unlock(&workLock);

  n = 0;
  threadFails[threadNum] = 0;
  threadMinBin[threadNum] = 2<<(9 +1);
  for(int i = 0; i < 5; i++)
  {
   threadBins[threadNum][i] = 0;
  }

  obj_dbl->setBounds();


  for(int i = 0; i < 0; i++)
  {
   locParams_dbl[i] = (double)params[i];
  }
  obj_dd->setBounds();
# 1304 "localMinima.cpp"
  while(!exitFlag)
  {
   if(threadError)
   {
    delete obj_dbl;

    delete obj_dd;

    pthread_exit(
# 1312 "localMinima.cpp" 3 4
                __null
# 1312 "localMinima.cpp"
                    );
    return 
# 1313 "localMinima.cpp" 3 4
          __null
# 1313 "localMinima.cpp"
              ;
   }


   ret = obj_dbl->run(&locResults_dbl, item, locParams_dbl, 
# 1317 "localMinima.cpp" 3 4
                                                           __null
# 1317 "localMinima.cpp"
                                                               , false);




   if(ret < 0)
   {
    if(ret != LBFGSERR_ROUNDING_ERROR || false)
    {

     if(false)
     {
      cout << "Failure code was: " << ret << endl;
     }

     threadFails[threadNum]++;
    }
   }


   for(int i = 0; i < 1; i++)
   {
    locResults_dd.X[i] = locResults_dbl.X[i];

    if(locResults_dd.X[i] - lbounds[i] < get_delta<dd_real>())
    {
     locResults_dd.X[i] = lbounds[i];
    }
    else if(ubounds[i] - locResults_dd.X[i] < get_delta<dd_real>())
    {
     locResults_dd.X[i] = ubounds[i];
    }
   }

   if(locResults_dbl.f < results[threadNum].f || locResults_dbl.f < get_delta<double>()*1e5)
   {



    ret = obj_dd->run(&locResults_dd, item, params, locResults_dd.X, true);


    locResults_dd.f = locResults_dd.f;
    for(int i = 0; i < 1; i++)
    {
     locResults_dd.X[i] = locResults_dd.X[i];
    }
   }
   else
   {
    locResults_dd.f = dd_real(locResults_dbl.f);
    for(int i = 0; i < 1; i++)
    {
     locResults_dd.X[i] = dd_real(locResults_dbl.X[i]);
    }
   }

   if(ret < 0)
   {
    if(ret != LBFGSERR_ROUNDING_ERROR || false)
    {

     if(false)
     {
      cout << "Failure code was: " << ret << endl;
     }

     threadFails[threadNum]++;
    }
   }
# 1474 "localMinima.cpp"
   if(locResults_dd.f < 0.0)
   {
    cout << "The cost function was negative before cast at: ";

    for(int i = 0; i < 1; i++)
    {
     cout << to_out_string(locResults_dd.X[i],25) << ",";
    }

    cout << endl;

    cout << "Applying hack to make it 0.0." << endl;

    locResults_dd.f = 0.0;
   }



   if(mustCast)
   {
    bestCast = 1e10;
    castBoundaries<dd_real>(0, 0, obj_dd, params, locResults_dd.X, XCast, &bestCast, bestCastX);

    for(int i = 0; i < 1; i++)
    {
     locResults_dd.X[i] = bestCastX[i];
    }
    locResults_dd.f = bestCast;
   }

   if(locResults_dd.f < 0.0)
   {
    cout << "About to take negative log." << endl;
    std::_Exit(
# 1507 "localMinima.cpp" 3 4
              1
# 1507 "localMinima.cpp"
                          );
   }


   dd_real logRes = log10(locResults_dd.f + get_epsilon<dd_real>());
   int binNum;

   if(logRes > 0)
   {
    binNum = (2<<(9 +1)) - 1;
   }
   else if(fabs(logRes) > 9)
   {
    binNum = 0;
   }
   else
   {
    binNum = to_int(floor((locResults_dd.f / pow(10.0,floor(fabs(logRes)))) * (2<<(9 - to_int(floor(fabs(logRes))))))) + (2<<(9 - to_int(floor(fabs(logRes))))) - 1;
   }

   if(binNum < threadMinBin[threadNum])
   {
    if(threadMinBin[threadNum] - binNum < 5)
    {

     for(int i = 0; i < 5; i++)
     {
      if((i + threadMinBin[threadNum] - binNum) < 5)
      {
       threadBins[threadNum][i] = threadBins[threadNum][i + threadMinBin[threadNum] - binNum];
      }
      else
      {
       threadBins[threadNum][i] = 0;
      }
     }
    }
    else
    {

     for(int i = 0; i < 5; i++)
     {
      threadBins[threadNum][i] = 0;
     }
    }
    threadMinBin[threadNum] = binNum;
    threadBins[threadNum][0]++;

   }
   else if(binNum - threadMinBin[threadNum] < 5)
   {
    threadBins[threadNum][binNum - threadMinBin[threadNum]]++;
   }

   if(locResults_dd.f < results[threadNum].f)
   {
    for(int i = 0; i < 1; i++)
    {
     results[threadNum].X[i] = locResults_dd.X[i];
    }
    results[threadNum].f = locResults_dd.f;
   }
# 1612 "localMinima.cpp"
   pthread_spin_lock(&workLock);
   if(workNumber < nruns)
    item = workNumber++;
   else
    exitFlag = true;
   pthread_spin_unlock(&workLock);
  }

  pthread_mutex_lock(&theadCoordLock);
  threadsDone++;
  if(threadsDone >= (nThreads))
  {

   cout << "Signalling threads complete...." << endl;

   pthread_cond_signal(&threadsComplete);
  }
  while(startLatch[threadNum])
  {
   pthread_cond_wait(&threadsStart, &theadCoordLock);
  }
  startLatch[threadNum] = true;
  pthread_mutex_unlock(&theadCoordLock);
 }

 delete[] bestCastX;
 delete[] XCast;
 delete[] locResults_dbl.X;
 delete obj_dbl;


 delete[] locResults_dd.X;
 delete obj_dd;


 pthread_exit(
# 1647 "localMinima.cpp" 3 4
             __null
# 1647 "localMinima.cpp"
                 );
 return 
# 1648 "localMinima.cpp" 3 4
       __null
# 1648 "localMinima.cpp"
           ;
}

int find_minima(OptimizeResult<dd_real>* bestResult, OptimizeResult<dd_real>* prevBest)
{
 ofstream outfile;
 dd_real best;
 dd_real* bestX;
 dd_real avRes = 0.0;
 dd_real stdDev = 0.0;
 int nClose = 0;
 int* binsOut = new int[5];
 int lBin = 2<<(9 +1);
 int fails = 0;
# 1675 "localMinima.cpp"
 for(int i=0; i<5; i++)
 {
  binsOut[i] = 0;
 }

 for(int i=0; i<nThreads; i++)
 {
  results[i].f = 1e10;
 }


 pthread_mutex_lock(&theadCoordLock);
 pthread_spin_lock(&workLock);
 workNumber = 0;
 threadsDone = 0;






 pthread_spin_unlock(&workLock);
 for(int i = 0; i < nThreads; i++)
 {
  startLatch[i] = false;
 }
 pthread_cond_broadcast(&threadsStart);


 cout << "Waiting for threads to finish..." << endl;


 while((threadsDone < (nThreads)))
 {
  pthread_cond_wait(&threadsComplete, &theadCoordLock);
 }
 pthread_mutex_unlock(&theadCoordLock);


 cout << "Finished threads." << endl;


 bestResult->f = 1e10;

 for(int i=0; i<(nThreads); i++)
 {

  cout << "Thread " << i << " result is: " << to_out_string(results[i].f,4);
  cout << " at: ";

  for(int k = 0; k < 1; k++)
  {
   cout << to_out_string(results[i].X[k],4) << " ";
  }
  cout << endl;


  best = results[i].f;
  bestX = results[i].X;

  if(i == 0 || best < bestResult->f)
  {
   bestResult->f = best;

   for(int k = 0; k < 1; k++)
   {
    bestResult->X[k] = bestX[k];
   }
  }


  fails += threadFails[i];


  cout << "Thread minimum bin is: " << threadMinBin[i] << endl;


  if(lBin > threadMinBin[i])
  {
   for(int j = 0; j < 5; j++)
   {
    if((j + lBin - threadMinBin[i]) < 5)
    {
     binsOut[j + lBin - threadMinBin[i]] = binsOut[j];
     binsOut[j] = 0;
    }

    binsOut[j] += threadBins[i][j];
   }
   lBin = threadMinBin[i];
  }
  else
  {
   for(int j = threadMinBin[i] - lBin; j < 5; j++)
   {
    binsOut[j] += threadBins[i][j - (threadMinBin[i] - lBin)];
   }
  }
 }


 cout << "Finished working results." << endl;
 cout << "Finalising statistics." << endl;
# 1880 "localMinima.cpp"
  outfile.open("stats.csv", ios::app );

  outfile << workNumber << "," << fails;
  if(prevBest->f > bestResult->f)
   outfile << ",1,";
  else
   outfile << ",0,";
  outfile << lBin << "," << binsOut[0];

  for(int i = 1; i < 5; i++)
  {
   outfile << "," << binsOut[i];
  }

  outfile << endl;

  outfile.close();
# 1940 "localMinima.cpp"
 cout << "Finished working statistics." << endl;


 delete[] binsOut;

 return 0;
}

void runExperiment(OptimizeResult<dd_real>* prevBest)
{
 ofstream outfile;
    OptimizeResult<dd_real> bestRun;
 dd_real best;
 dd_real* bestX = new dd_real[1];
 bestRun.X = new dd_real[1];


    cout << "---------Starting test---------" << endl;


    find_minima(&bestRun, prevBest);


    cout << "---------Finished test---------" << endl;





 cout << "Best result is: " << to_out_string(bestRun.f,4);
 cout << " at: ";

 for(int k = 0; k < 1; k++)
 {
  cout << to_out_string(bestRun.X[k],4) << " ";
 }
 cout << endl;



    best = bestRun.f;
 for(int k = 0; k < 1; k++)
 {
  bestX[k] = bestRun.X[k];
 }

 if(true)
 {
  if(best < prevBest->f)
  {
   prevBest->f = best;
   for(int k = 0; k < 1; k++)
   {
    prevBest->X[k] = bestX[k];
   }
  }
  else
  {
   cout << "Using previous best: " << to_out_string(prevBest->f,5) << " at: ";
   for(int k = 0; k < 1; k++)
   {
    cout << to_out_string(prevBest->X[k],5) << ", ";
   }
   cout << endl;
   best = prevBest->f;
   for(int k = 0; k < 1; k++)
   {
    bestX[k] = prevBest->X[k];
   }
  }
 }

 if(nodeNum == 0)
 {


  cout << "Best result now: " << to_out_string(best,4);
  cout << " at: ";

  for(int k = 0; k < 1; k++)
  {
   cout << to_out_string(bestX[k],4) << " ";
  }
  cout << endl;


  outfile.open("results.csv", ios::app );

     if(0 > 0)
     {
         outfile << to_out_string(params[0],4);

         for(int i=1; i<0; i++)
         {
             outfile << "," << to_out_string(params[i],4);
         }

         outfile << ",";
     }

     if(true)
     {
         outfile << to_out_string(lbounds[0],4) << "," << to_out_string(ubounds[0],4);
         for(int k = 1; k < 1; k++)
         {
             outfile << "," << to_out_string(lbounds[k],4) << "," << to_out_string(ubounds[k],4);
         }
         outfile << ",";
     }


 

  outfile << to_out_string(best,9);

     for(int k = 0; k < 1; k++)
     {
         outfile << "," << to_out_string(bestX[k],9);
     }

     outfile << endl;

     outfile.close();
 }


 delete[] bestRun.X;
 delete[] bestX;
}

int getMult(int depth)
{
 int mult = 1;
 for(int i = depth + 1; i < 1; i++)
 {
  mult *= (boundaries[i].steps + 1);
 }
 return mult;
}

void getAdjacentRes(int depth, int* bState, dd_real** pBest, dd_real*** pPoint, OptimizeResult<dd_real>* res)
{

 cout << "Getting adjacent result." << endl;


 if(boundaries[depth].steps > 0)
 {
  dd_real* depthRes = pBest[depth];
  dd_real** depthP = pPoint[depth];

  int index = 0;

  for(int i = depth + 1; i < 1; i++)
  {
   index += getMult(i) * bState[i];
  }


  cout << "Index now is: " << index << endl;


  res->f = depthRes[index];
  for(int k = 0; k < 1; k++)
  {
   res->X[k] = depthP[index][k];
  }


  cout << "Got it, it was: " << res->f << " at: ";
  for(int k = 0; k < 1; k++)
  {
   cout << to_out_string(res->X[k],4) << ", ";
  }
  cout << endl;

 }
 else
 {
  res->f = 1e10;

  cout << "Only 1 item in this layer so ignore." << endl;

 }
}

int boundaryRecursion(int depth, int dimCount, int* bState, dd_real*** pBests, dd_real**** pPoints, bool isStart, int stageNum)
{

 cout << "Running Boundary Recursion." << endl;

 int mult = 1;

 dd_real** pBest = pBests[stageNum];
 dd_real*** pPoint = pPoints[stageNum];

 if(true)
 {
  if(depth == bSetsCovered[stageNum])
  {






   for(int k = 0; k < 1; k++)
   {
    cout << "Boundaries for dimension " << k << " lower: ";
    cout << to_out_string(lbounds[k],4) << " upper: ";
    cout << to_out_string(ubounds[k],4) << endl;
   }


   OptimizeResult<dd_real> res;
   res.X = new dd_real[1];
   dd_real currBest = 1e10;
   dd_real* point = new dd_real[1];


   int stepCount = 1;

   cout << "Before getting bests: " << endl;
   for(int i = 1 - 1; i >= 0; i--)
   {
    for(int j = 0; j < stepCount; j++)
    {
     cout << to_out_string(pBest[i][j],4) << ", ";
    }
    stepCount *= (boundaries[i].steps + 1);
    cout << endl;
   }

   cout << "Getting adjacent results." << endl;

   for(int j = 0; j < 1; j++)
   {

    if(bState[j] > 0)
    {
     getAdjacentRes(j, bState, pBest, pPoint, &res);

     cout << "Post function, it was: " << res.f << endl;

     if(res.f < currBest)
     {
      currBest = res.f;
      for(int k = 0; k < 1; k++)
      {
       point[k] = res.X[k];
      }
     }
    }
    else
    {
     for(int k = 0; k < 1; k++)
     {
      point[k] = res.X[k];
     }
    }
   }


   cout << "Setting Bests, current best is: " << to_out_string(currBest,4) << endl;


   bestRes.f = currBest;
   for(int k = 0; k < 1; k++)
   {
    bestRes.X[k] = point[k];
   }

   delete[] res.X;
   delete[] point;

   if(isStart && !true)
   {
    if(2 * 1 * pow(13, 1 - 1) + 2 * 1 * pow(13 - 1, 1 - 1) > workNumber)
    {
     workNumber = 2 * 1 * pow(13, 1 - 1) + 2 * 1 * pow(13 - 1, 1 - 1);
    }

    nruns = 2 * 1 * pow(13, 1 - 1) + 2 * 1 * pow(13 - 1, 1 - 1);

    startBound = false;
   }


   nruns = 1000*(1 + bState[0]);



   cout << "Running experiment." << endl;


   cout << "Previous best is: " << to_out_string(bestRes.f,5) << " at: ";
   for(int k = 0; k < 1; k++)
   {
    cout << to_out_string(bestRes.X[k],5) << ", ";
   }
   cout << endl;

   runExperiment(&bestRes);

   cout << "Finished experiment." << endl;


   pBest[1 - 1][0] = bestRes.f;
   for(int k = 0; k < 1; k++)
   {
    pPoint[1 - 1][0][k] = bestRes.X[k];
   }


   stageIteration(stageNum+1, dimCount, bState, pBests, pPoints);

  }
  else
  {



   cout << "Boundary start at boundary set: " << depth << " is: " << bState[depth] << endl;


   for(int i = bState[depth]; i <= boundaries[depth].steps; i++)
      {
    bState[depth] = i;
    for(int j = 0; j < boundaries[depth].dim; j++)
    {
     lbounds[j + dimCount] = boundaries[depth].startLower + boundaries[depth].incrementLower * i;
     ubounds[j + dimCount] = boundaries[depth].startUpper + boundaries[depth].incrementUpper * i;

     if(boundaries[depth].hasSym && j == 0)
     {
      lbounds[j + dimCount] = 0.0;
     }
    }

    mult = boundaryRecursion(depth + 1, dimCount + boundaries[depth].dim, bState, pBests, pPoints, i == 0, stageNum);



    if(1 > 1 && depth > 0)
    {
     dd_real* nextLevelBest = pBest[depth];
     dd_real** nextLevelPoint = pPoint[depth];
     dd_real* levelBest = pBest[depth - 1];
     dd_real** levelPoint = pPoint[depth - 1];

     for(int j = 0; j < mult; j++)
     {
      levelBest[i*mult + j] = nextLevelBest[j];
      for(int k = 0; k < 1; k++)
      {
       levelPoint[i*mult + j][k] = nextLevelPoint[j][k];
      }
     }
    }

   }
   bState[depth] = 0;
   mult *= (boundaries[depth].steps + 1);


   int stepCount = 1;

   cout << "After propagating bests: " << endl;
   for(int i = 1 - 1; i >= 0; i--)
   {
    for(int j = 0; j < stepCount; j++)
    {
     cout << to_out_string(pBest[i][j],4) << ", ";
    }
    stepCount *= (boundaries[i].steps + 1);
    cout << endl;
   }


  }
 }
 else
    {
        runExperiment(&bestRes);
    }



 return mult;
}






stage_t* stages;






void stageIteration(int stageNum, int dimCount, int* bState, dd_real*** pBests, dd_real**** pPoints)
{
 if(stageNum < 2)
 {

  1 = stages[stageNum].dim;
  1 = stages[stageNum].bSets;




  bestRes.f = 1e10;
  bestRes.X = new dd_real[1];
  ubounds = new dd_real[1];
        lbounds = new dd_real[1];





  stepUp = new dd_real[1];
  stepDown = new dd_real[1];
# 2374 "localMinima.cpp"
  int startDepth = 0;
  if(stageNum > 0)
  {
   startDepth = bSetsCovered[stageNum-1];
  }

  boundaryRecursion(startDepth, dimCount, bState, pBests, pPoints, false, stageNum);


  for(int k = 0; k < 1; k++)
  {
   x0[stages[stageNum].vars[k]] = pPoints[stageNum][1 - 1][0][k];
  }


  delete[] bestRes.X;
  delete[] ubounds;
  delete[] lbounds;
 }
}

void parameterRecursion(int depth, int* paramState, int* bState, dd_real*** pBests, dd_real**** pPoints)
{

 cout << "Running Parameter Recursion." << endl;


    if(depth == 0)
    {





  stageIteration(0, 0, bState, pBests, pPoints);


  bState[0] = 0;
  for(int i = 0; i < 2; i++)
   pBests[i][bSetsCovered[i] - 1][0] = 1e10;
    }
    else
    {

        parameter_t<dd_real> currentParam = parameters[depth];
        for(int i=paramState[depth]; i <= (*(currentParam.steps))(params, depth); i++)
        {
            params[depth] = (*(currentParam.get))(i, params, depth);


   cout << "Parameter at: " << depth << " is: " << to_out_string(params[depth],4) << endl;



            parameterRecursion(depth + 1, paramState, bState, pBests, pPoints);
        }
  paramState[depth] = 0;
    }
}

bool skipBackLine(ifstream* infile)
{
 infile->seekg(-2,ios_base::cur);

 int count = 0;
 while(true)
 {
  char ch;
  infile->get(ch);

  if((int)infile->tellg() <= 1)
  {
   infile->seekg(0);
   return true;
  }
  else if(ch == '\n')
  {

   if(count > 0)
   {
    return false;
   }
   else
   {
    count++;
    infile->seekg(-2,ios_base::cur);
   }
  }
  else
  {
   infile->seekg(-2,ios_base::cur);
  }
 }
}

void getLineResult(string line, OptimizeResult<dd_real>* res)
{
 istringstream iss(line);
 string s;
 for(int i = 0; i < 0 + 2*1 + 0; i++)
 {
  getline( iss, s, ',' );
 }

 getline( iss, s, ',' );
 res->f = dd_real(s.c_str());
 for(int i = 0; i < 1; i++)
 {
  getline( iss, s, ',' );
  res->X[i] = dd_real(s.c_str());
 }
}

bool setFileToLastLine(ifstream* infile)
{
 infile->seekg(-1,ios_base::end);

 int count = 0;
 while(true)
 {
  char ch;
  infile->get(ch);

  if((int)infile->tellg() <= 1)
  {
   infile->seekg(0);

   if(count == 0)
    return false;

   return true;
  }
  else if(ch == '\n')
  {

   if(count > 0)
   {
    return true;
   }
   else
   {
    count++;
    infile->seekg(-2,ios_base::cur);
   }
  }
  else
  {
   infile->seekg(-2,ios_base::cur);
  }
 }
}


void getPrevResuts(ifstream* infile, int* bState, dd_real** pBest, dd_real*** pPoint)
{
 int dimSize = 1;
 bool startReached = false;
 bool usePrev = false;
 if(infile->is_open())
 {
  OptimizeResult<dd_real> res;
  res.X = new dd_real[1];


  cout << "Previous results are: " << endl;


  for(int i = 1 - 1; i >= 0; i--)
  {
   startReached = false;

   dd_real* dimPBest = pBest[i];
   dd_real** dimPPoint = pPoint[i];

   setFileToLastLine(infile);

   for(int j = dimSize - 1; j >= 0; j--)
   {
    if(startReached)
    {

     cout << "Hit the start" << endl;

    }
    else
    {
     if(j < dimSize - 1)
     {
      startReached = skipBackLine(infile);
      if((int)infile->tellg() <= 1)
      {

       cout << "Hit the start" << endl;

       startReached = true;
      }
     }

     string lastLine;

     getline(*infile,lastLine);
     getLineResult(lastLine, &res);


     int index = (bState[i + 1] + j) % dimSize;

     dimPBest[index] = res.f;
     dd_real* newX = dimPPoint[index];

     for(int k = 0; k < 1; k++)
     {
      newX[k] = res.X[k];
     }


     cout << ", " << to_out_string(res.f,4);

    }
   }

   cout << endl;

   dimSize *= (boundaries[i].steps + 1);

   cout << "Dim size is now: " << dimSize << endl;

  }

  delete[] res.X;
 }
 else
 {

 }
}

int main(int argc, char **argv)
{
    int threadReturn;
 dd_real* pParams;

 int ierr, my_id;

 num_nodes = 1;
# 2694 "localMinima.cpp"
 cout << "Rand max is: " << 
# 2694 "localMinima.cpp" 3 4
                           2147483647 
# 2694 "localMinima.cpp"
                                    << endl;


 workNumber = pow(13, 1);
 if(false)
 {
  nruns = pow(13, 1);
 }
 else
 {
  nruns = 3000;
 }
    params = new dd_real[0];
    parameters = new parameter_t<dd_real>[0];
    boundaries = new boundary_t<dd_real>[1];

    boundary_t<dd_real> b0;b0.startUpper=2.;b0.startLower=-2.;b0.steps=49;b0.incrementUpper=2.;b0.incrementLower=-2.;b0.intCast=true;b0.dim=1;b0.hasSym=true;boundaries[0]=b0;

   

    ifstream infile;
 bool gotLastLine = false;
 string lastLine;

 infile.open("results.csv", std::ifstream::in );
 if(infile.is_open())
 {
        gotLastLine = setFileToLastLine(&infile);

        getline(infile,lastLine);
        infile.close();
    }

 int paramState[0];



 int currMaxBSet=0;

 int* bState = new int[1];

 dd_real*** pBests = new dd_real**[2];
 dd_real**** pPoints = new dd_real***[2];

 int dimCount = 0;

 for(int i = 0; i < 2; i++)
 {
  bSetsCovered[i] = 0;

  for(int k = 0; k < stageDims[i]; k++)
  {
   if(stageVars[i][k] > dimCount + boundaries[bSetsCovered[i]].dim && bSetsCovered[i] < 1)
    bSetsCovered[i]++;
  }

  pBests[i] = new dd_real*[bSetsCovered[i]];
  pPoints[i] = new dd_real**[bSetsCovered[i]];

  int stepCount = 1;

  for(int j = bSetsCovered[i] - 1; j >= 0; j--)
  {
   pBests[i][j] = new dd_real[stepCount];
   pPoints[i][j] = new dd_real*[stepCount];
   for(int k = 0; k < stepCount; k++)
   {
    pPoints[i][j][k] = new dd_real[1];
   }
   stepCount *= (boundaries[j].steps + 1);
  }
 }

 for(int i = 0; i < 0; i++)
 {
  paramState[i] = 0;
 }






 ofstream outfile;
 outfile.open("header.txt", ios::app );

    char buff[21];
 time_t t = time(0);
    strftime(buff, 21, "%Y-%m-%d %H:%M:%S ", localtime (&t));

 if(gotLastLine)
 {
# 2881 "localMinima.cpp"
 }
 else
 {
  for(int i = 0; i < 2; i++)
   pBests[i][bSetsCovered[i] - 1][0] = 1e10;

  outfile << "=======================================================================================================================" << endl;
  outfile << "Running expermiment: " << "2 Qubit Gate Test" << endl;
  outfile << "Date Created: " << "2019-02-22" << endl;
  outfile << "Time Run: " << buff << endl;
  outfile << "Parameters: " << 0 << endl;
  outfile << "Format: " << "{[nk,chi],[lowerBound, upperBound], tau, f, [X]}" << endl;
  outfile << "=======================================================================================================================" << endl;
 }

    outfile.close();

 nThreads = get_nprocs();





    pthread_spin_init(&workLock, 
# 2904 "localMinima.cpp" 3 4
                                PTHREAD_PROCESS_PRIVATE
# 2904 "localMinima.cpp"
                                                       );
 pthread_mutex_init(&theadCoordLock, 
# 2905 "localMinima.cpp" 3 4
                                    __null
# 2905 "localMinima.cpp"
                                        );
 pthread_cond_init(&threadsStart, 
# 2906 "localMinima.cpp" 3 4
                                 __null
# 2906 "localMinima.cpp"
                                     );
 pthread_cond_init(&threadsComplete, 
# 2907 "localMinima.cpp" 3 4
                                    __null
# 2907 "localMinima.cpp"
                                        );


 cout << "Number of threads on this node: " << nThreads << endl;


 threadPool = new pthread_t[nThreads];

 threadMinBin = new int[nThreads];
 threadBins = new int*[nThreads];
 threadFails = new int[nThreads];

 startLatch = new bool[nThreads];

 results = new OptimizeResult<dd_real>[nThreads];
    for(int i=0; i<(nThreads); i++)
 {
        results[i].X = new dd_real[1];
  threadBins[i] = new int[5];
  startLatch[i] = true;
    }


    cout << "Starting threads...." << endl;


 for(int i=0; i<(nThreads); i++)
 {
  int threadNum = i;
  threadReturn = pthread_create(&threadPool[i], 
# 2936 "localMinima.cpp" 3 4
                                               __null
# 2936 "localMinima.cpp"
                                                   , run_multi, &threadNum);
  if(threadReturn)
  {
   cout << "Error: Unable to create thread: " << threadReturn << endl;
   return -1;
  }
 }

 bool ready = false;
 while(!ready)
 {
  pthread_mutex_lock(&theadCoordLock);
  if(threadStartCount >= (nThreads))
   ready = true;

  cout << "Still waiting...." << endl;

  pthread_mutex_unlock(&theadCoordLock);
 }



    parameterRecursion(0, paramState, bState, pBests, pPoints);


 pthread_mutex_lock(&theadCoordLock);
 pthread_spin_lock(&workLock);
    finished = true;
 pthread_spin_unlock(&workLock);
 for(int i = 0; i < nThreads; i++)
 {
  startLatch[i] = false;
 }
 pthread_mutex_unlock(&theadCoordLock);
 pthread_cond_broadcast(&threadsStart);


 cout << "Waiting for threads to finish work...." << endl;


 for(int i=0; i<(nThreads); i++)
 {
  threadReturn = pthread_join(threadPool[i], 
# 2978 "localMinima.cpp" 3 4
                                            __null
# 2978 "localMinima.cpp"
                                                );
  if (threadReturn)
  {
   cout << "Error: Unable to join thread: " << threadReturn << endl;
   return -1;
  }
 }

    for(int i=0; i<(nThreads); i++)
 {
        delete[] results[i].X;
  delete[] threadBins[i];
    }

 delete[] threadPool;
 delete[] threadMinBin;
 delete[] threadBins;
 delete[] results;
 delete[] threadFails;
 delete[] startLatch;




 for(int i = 0; i < 2; i++)
 {
  int stepCount = 1;

  for(int j = bSetsCovered[i] - 1; j >= 0; j--)
  {
   for(int k = 0; k < stepCount; k++)
   {
    delete[] pPoints[i][j][k];
   }

   delete[] pBests[i][j];
   delete[] pPoints[i][j];
   stepCount *= (boundaries[j].steps + 1);
  }

  delete[] pBests[i];
  delete[] pPoints[i];
 }

 delete[] pBests;
 delete[] pPoints;
 delete[] bState;

 delete[] params;
 delete[] parameters;
 delete[] boundaries;

 pthread_spin_destroy(&workLock);
 pthread_mutex_destroy(&theadCoordLock);
 pthread_cond_destroy(&threadsStart);
 pthread_cond_destroy(&threadsComplete);
# 3050 "localMinima.cpp"
}
