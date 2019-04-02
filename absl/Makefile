CC=icpc
CFLAGS=-c -O2 -DHAVE_CONFIG -std=c++11
debug: CFLAGS=-c -O0 -g -DHAVE_CONFIG -std=c++11
INCLUDES=-I../ -I../include
ARCHFLAGS=
PROFFLAG=
OPTFLAG=
PROFDIR=
SOURCES=$(wildcard base/*.cc base/internal/*.cc strings/*.cc strings/internal/*.cc strings/internal/str_format/*.cc types/*.cc)
OBJECTS=$(SOURCES:.cc=.o)

all: clean $(OBJECTS)

%.o : %.cc
	$(CC) $(CFLAGS) $(ARCHFLAGS) $(OPTFLAG) $(PROFFLAG) $(PROFDIR) $(INCLUDES) $< -o $@

.PHONY: clean

clean: 
	$(RM) *.o *~
