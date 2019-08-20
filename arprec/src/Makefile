CC=g++
CFLAGS=-c -O2 -fno-exceptions -DHAVE_CONFIG -std=gnu++11
debug: CFLAGS=-c -O0 -g -DHAVE_CONFIG -std=gnu++11
debug_opt: CFLAGS=-c -g -O2 -DHAVE_CONFIG -std=gnu++11
INCLUDES=-I../ -I../include -I../../qd/include
ARCHFLAGS=
PROFFLAG=
OPTFLAG=
PROFDIR=-prof-dir.profile
SOURCES=$(wildcard *.cpp)
OBJECTS=$(SOURCES:.cpp=.o)

profile: CFLAGS=-c -O2 -fno-exceptions -std=gnu++11 -ansi-alias -DNINTELLISENSE -qopt-zmm-usage=high
profile: PROFFLAG=-prof-gen
profile: OPTFLAG=

no_prof: PROFFLAG=

all: clean $(OBJECTS)

debug: all

debug_opt: all

profile: all

no_prof: all

%.o : %.cpp
	$(CC) $(CFLAGS) $(ARCHFLAGS) $(OPTFLAG) $(PROFFLAG) $(PROFDIR) $(INCLUDES) $< -o $@

.PHONY: clean

clean: 
	$(RM) *.o *~
