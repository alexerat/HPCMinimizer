CC=g++
CFLAGS=-c -O2 -DHAVE_CONFIG -std=c++11
debug: CFLAGS=-c -O0 -g -DHAVE_CONFIG -std=c++11
INCLUDES=-I../ -I../include
ARCHFLAGS=
PROFFLAG=
OPTFLAG=
PROFDIR=
SOURCES=$(wildcard *.cc)
ABSLOBJS=$(wildcard ../../absl/strings/*.o ../../absl/strings/internal/*.o  ../../absl/strings/internal/str_format/*.o ../../absl/base/*.o ../../absl/base/internal/*.o)
OBJECTS=$(SOURCES:.cc=.o) $(ABSLOBJS)


all: clean $(OBJECTS)

%.o : %.cc
	$(CC) $(CFLAGS) $(ARCHFLAGS) $(OPTFLAG) $(PROFFLAG) $(PROFDIR) $(INCLUDES) $< -o $@

.PHONY: clean

clean: 
	$(RM) *.o *~
