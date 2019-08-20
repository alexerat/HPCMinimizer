CC=icpc
LD=icpc
CFLAGS=-c -O3 -fno-exceptions -std=gnu++11 -DNINTELLISENSE -qopt-zmm-usage=high
TFLAGS=
PROFDIR=-prof-dir.profile
ARCHFLAGS=-xCOMMON-AVX512
INCLUDES=-I./qd/include -I./arprec/include
LFLAGS=
SOURCES=lbfgs.cpp localMinima.cpp
PROFFLAG=-prof-use -ipo
QDOBJS=$(wildcard ./qd/src/*.o) $(wildcard ./arprec/src/*.o)
OPTFLAG=
OBJECTS=$(SOURCES:.cpp=.o) $(QDOBJS)
EXECUTABLE=localMinima
EXECUTABLE_MPI=localMinima_MPI
LIBRARIERS=-lpthread -lquadmath
SUBDIRS=./qd/src/ ./arprec/src/

no_prof: PROFFLAG=

profile: CFLAGS=-c -O3 -fno-exceptions -std=gnu++11 -ansi-alias -DNINTELLISENSE -qopt-zmm-usage=high
profile: PROFFLAG=-prof-gen
profile: OPTFLAG=

debug: CFLAGS=-c -O0 -std=gnu++11 -fp-model consistent -g -Wall -pedantic -DVERBOSE -DNINTELLISENSE
debug: OPTFLAG=
debug: PROFFLAG=

debug_opt: CFLAGS=-c -g -O3 -fno-exceptions -std=gnu++11 -DNINTELLISENSE -qopt-report=5 -qopt-zmm-usage=high
debug_opt: OPTFLAG=
debug_opt: PROFFLAG=

debug_det: CFLAGS=-c -O0 -fno-exceptions -g -Wall -pedantic -DVERBOSE -DDETERMINISTIC -DNINTELLISENSE
debug_det: OPTFLAG=
debug_det: PROFFLAG=

test: CFLAGS=-c -O0 -fno-exceptions -std=gnu++11 -g -Wall -pedantic -DNINTELLISENSE
test: LD=g++
test: OPTFLAG=
test: PROFFLAG=

det: CFLAGS=-c -O2 -fno-exceptions -std=gnu++11 -ansi-alias -fno-exceptions -DDETERMINISTIC -DNINTELLISENSE

mpi: CC=mpicxx
mpi: CFLAGS=-c -O2 -fno-exceptions -std=gnu++11 -ansi-alias -fno-exceptions -DUSE_MPI -cxx=g++ -DNINTELLISENSE
mpi: PROFFLAG=
mpi: PROFDIR=-prof-dir=./.MPI-Profiling
mpi_debug: CC=mpicxx
mpi_debug: CFLAGS=-c -O0 -fno-exceptions -std=gnu++11 -g -D USE_MPI -cxx=g++ -DNINTELLISENSE
mpi_debug: OPTFLAG=
mpi_debug: PROFFLAG=
mpi_debug: LIBRARIERS=-pthread -l irc -lm -lbfd -liberty -lunwind


.PHONY: clean $(SUBDIRS)

build: clean $(SUBDIRS) $(SOURCES) $(EXECUTABLE) clean

build_MPI: clean $(SUBDIRS) $(SOURCES) $(EXECUTABLE_MPI) clean

no_prof: build

profile: build

det: build

debug: build

debug_opt: build

debug_det: build

test: build

mpi: build_MPI

mpi_debug: build_MPI

test_starts: PROFFLAG=
test_starts: TFLAGS=-DTEST_START_POINTS -DFHEADER=\"tests/singleBSet.h\"
test_starts: build

$(SUBDIRS):
	$(MAKE) CC=$(CC) ARCHFLAGS=$(ARCHFLAGS) OPTFLAG=$(OPTFLAG) PROFFLAG=$(PROFFLAG) -C $@ $(MAKECMDGOALS)

$(EXECUTABLE): $(OBJECTS)
	$(LD) $(LFLAGS) $(OBJECTS) -o $@ $(LIBRARIERS)

$(EXECUTABwE_MPI): $(OBJECTS)
	$(LD) $(LFLAGS) $(OBJECTS) -o $@ $(LIBRARIERS)

.cpp.o:
	$(CC) $(CFLAGS) $(TFLAGS) $(OPTFLAG) $(PROFFLAG) $(PROFDIR) $(ARCHFLAGS) $(INCLUDES) $< -o $@

clean:
	$(RM) *.o *~
