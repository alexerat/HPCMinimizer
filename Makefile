CC=icpc
LD=icpc
CFLAGS=-c -O3 -ansi-alias -fno-exceptions
TFLAGS=
PROFDIR=-prof-dir=./.Profiling
ARCHFLAGS=-xCOMMON-AVX512
INCLUDES=-I./qd/include -I./arprec/include
LFLAGS= -L./arprec/src/.libs
SOURCES=localMinima.cpp lbfgs.cpp DE.cpp
PROFFLAG=-prof-use
QDOBJS=$(wildcard ./qd/src/*.o)
OPTFLAG=-ipo
OBJECTS=$(SOURCES:.cpp=.o) $(QDOBJS)
EXECUTABLE=localMinima
EXECUTABLE_MPI=localMinima_MPI
LIBRARIERS=-larprec -lpthread
SUBDIRS=./qd/src/

no_prof: PROFFLAG=

profile: CFLAGS=-c -O3 -ansi-alias
profile: PROFFLAG=-prof-gen
profile: OPTFLAG=

debug: CFLAGS=-c -O0 -g -Wall -pedantic -DVERBOSE
debug: LD=icpc
debug: OPTFLAG=
debug: PROFFLAG=

debug_det: CFLAGS=-c -O0 -g -Wall -pedantic -DVERBOSE -D DETERMINISTIC
debug_det: OPTFLAG=
debug_det: PROFFLAG=

test: CFLAGS=-c -O0 -g -Wall -pedantic
test: LD=icpc
test: OPTFLAG=
test: PROFFLAG=

det: CFLAGS=-c -O3 -ansi-alias -fno-exceptions -D DETERMINISTIC

mpi: CC=mpicxx
mpi: CFLAGS=-c -O3 -ansi-alias -fno-exceptions -D USE_MPI -cxx=icpc
mpi: PROFFLAG=
mpi: PROFDIR=-prof-dir=./.MPI-Profiling
mpi_debug: CC=mpicxx
mpi_debug: CFLAGS=-c -O0 -g -D USE_MPI -cxx=icpc
mpi_debug: OPTFLAG=
mpi_debug: PROFFLAG=
mpi_debug: LIBRARIERS=-pthread -l arprec -l irc -lm -lbfd -liberty -lunwind


.PHONY: clean $(SUBDIRS)

build: clean $(SUBDIRS) $(SOURCES) $(EXECUTABLE) clean

build_MPI: clean $(SUBDIRS) $(SOURCES) $(EXECUTABLE_MPI) clean

no_prof: build

profile: build

det: build

debug: build

debug_det: build

test: build

mpi: build_MPI

mpi_debug: build_MPI

test_starts: PROFFLAG=
test_starts: TFLAGS=-DTEST_START_POINTS -DFHEADER=\"tests/singleBSet.h\"
test_starts: build

$(SUBDIRS):
	$(MAKE) ARCHFLAGS=$(ARCHFLAGS) OPTFLAG=$(OPTFLAG) PROFFLAG=$(PROFFLAG) -C $@

$(EXECUTABLE): $(OBJECTS)
	$(LD) $(LFLAGS) $(OBJECTS) -o $@ $(LIBRARIERS)

$(EXECUTABwE_MPI): $(OBJECTS)
	$(LD) $(LFLAGS) $(OBJECTS) -o $@ $(LIBRARIERS)

.cpp.o:
	$(CC) $(CFLAGS) $(TFLAGS) $(OPTFLAG) $(PROFFLAG) $(PROFDIR) $(ARCHFLAGS) $(INCLUDES) $< -o $@

clean:
	$(RM) *.o *~
