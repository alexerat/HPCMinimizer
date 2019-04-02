CC=icpc
LD=icpc
CFLAGS=-c -O3 -fno-exceptions -std=c++11
TFLAGS=
PROFDIR=
ARCHFLAGS=
INCLUDES=-I./qd/include -I./arprec/include
LFLAGS= -L./arprec/src/.libs
SOURCES=lbfgs.cpp localMinima.cpp 
PROFFLAG=
QDOBJS=$(wildcard ./qd/src/*.o)
OPTFLAG=
OBJECTS=$(SOURCES:.cpp=.o) $(QDOBJS)
EXECUTABLE=localMinima
EXECUTABLE_MPI=localMinima_MPI
LIBRARIERS=-lpthread -ltensorflow
SUBDIRS=./qd/src/ ./arprec/src/

no_prof: PROFFLAG=

profile: CFLAGS=-c -O3 -fno-exceptions -std=c++11 -ansi-alias
profile: PROFFLAG=-prof-gen
profile: OPTFLAG=

debug: CFLAGS=-c -O0 -fno-exceptions -std=c++11 -g -Wall -pedantic -DVERBOSE
debug: LD=g++
debug: OPTFLAG=
debug: PROFFLAG=

debug_det: CFLAGS=-c -O0 -fno-exceptions -g -Wall -pedantic -DVERBOSE -D DETERMINISTIC
debug_det: OPTFLAG=
debug_det: PROFFLAG=

test: CFLAGS=-c -O0 -fno-exceptions -std=c++11 -g -Wall -pedantic
test: LD=g++
test: OPTFLAG=
test: PROFFLAG=

det: CFLAGS=-c -O3 -fno-exceptions -std=c++11 -ansi-alias -fno-exceptions -D DETERMINISTIC

mpi: CC=mpicxx
mpi: CFLAGS=-c -O3 -fno-exceptions -std=c++11 -ansi-alias -fno-exceptions -D USE_MPI -cxx=g++
mpi: PROFFLAG=
mpi: PROFDIR=-prof-dir=./.MPI-Profiling
mpi_debug: CC=mpicxx
mpi_debug: CFLAGS=-c -O0 -fno-exceptions -std=c++11 -g -D USE_MPI -cxx=g++
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
