CC=g++
CFLAGS=-c -O2 -fno-exceptions -DHAVE_CONFIG -std=gnu++11
debug: CFLAGS=-c -O0 -g -DHAVE_CONFIG -std=gnu++11
debug_opt: CFLAGS=-c -g -O2 -DHAVE_CONFIG -std=gnu++11
INCLUDES=-I../ -I../include -I../../qd/include
ARCHFLAGS=
PROFFLAG=
OPTFLAG=
PROFDIR=
SOURCES=$(wildcard *.cpp)
OBJECTS=$(SOURCES:.cpp=.o)

all: clean $(OBJECTS)

debug: all

debug_opt: all

%.o : %.cpp
	$(CC) $(CFLAGS) $(ARCHFLAGS) $(OPTFLAG) $(PROFFLAG) $(PROFDIR) $(INCLUDES) $< -o $@

.PHONY: clean

clean: 
	$(RM) *.o *~
