CC=icpc
CFLAGS=-c -O2 -ansi-alias -fno-exceptions -DHAVE_CONFIG
debug: CFLAGS=-c -O0 -g -DHAVE_CONFIG
INCLUDES=-I../ -I../include
ARCHFLAGS=
PROFFLAG=
OPTFLAG=
PROFDIR=-prof-dir=../../.Profiling
SOURCES=$(wildcard *.cpp)
OBJECTS=$(SOURCES:.cpp=.o)

all: clean $(OBJECTS)

%.o : %.cpp
	$(CC) $(CFLAGS) $(ARCHFLAGS) $(OPTFLAG) $(PROFFLAG) $(PROFDIR) $(INCLUDES) $< -o $@

.PHONY: clean

clean: 
	$(RM) *.o *~
