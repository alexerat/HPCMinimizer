CC=g++
CFLAGS=-c -O2 -DHAVE_CONFIG -std=c++11
debug: CFLAGS=-c -O0 -g -DHAVE_CONFIG -std=c++11
INCLUDES=-I../ -I../include
ARCHFLAGS=
PROFFLAG=
OPTFLAG=
PROFDIR=
SOURCES=$(wildcard *.cpp)
OBJECTS=$(SOURCES:.cpp=.o)

all: clean $(OBJECTS)

%.o : %.cpp
	$(CC) $(CFLAGS) $(ARCHFLAGS) $(OPTFLAG) $(PROFFLAG) $(PROFDIR) $(INCLUDES) $< -o $@

.PHONY: clean

clean: 
	$(RM) *.o *~
