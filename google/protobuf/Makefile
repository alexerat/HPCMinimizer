CC=icpc
CFLAGS=-c -wd873 -DHAVE_CONFIG -std=c++11 -lz -pthread -DHAVE_PTHREAD -DHAVE_ZLIB -Woverloaded-virtual -Wno-sign-compare -Wno-unused-function -Wno-write-strings
debug: CFLAGS=-c -O0 -g -DHAVE_CONFIG -std=c++11
INCLUDES=-I../ -I../include
ARCHFLAGS=
PROFFLAG=
OPTFLAG=
PROFDIR=
SOURCES=$(wildcard *.cc io/*.cc stubs/*.cc util/*.cc util/internal/*.cc compiler/*.cc compiler/cpp/*.cc)
OBJECTS=$(SOURCES:.cc=.o)

all: clean $(OBJECTS)

%.o : %.cc
	$(CC) $(CFLAGS) $(ARCHFLAGS) $(OPTFLAG) $(PROFFLAG) $(PROFDIR) $(INCLUDES) $< -o $@

.PHONY: clean

clean: 
	$(RM) *.o *~
