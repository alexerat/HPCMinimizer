CC=g++
LD=g++
CFLAGS=-c -O3 -fno-exceptions -std=c++11 -lz -pthread -DHAVE_PTHREAD -DHAVE_ZLIB -Woverloaded-virtual -Wno-sign-compare -Wno-unused-function -Wno-write-strings
INCLUDES=-I../ -I../io/ -I../stubs/ -I../util/
LFLAGS= 
SOURCES=main.cc
PROFFLAG=
OPTFLAG=
OBJECTS=$(SOURCES:.cc=.o) $(wildcard ./cpp/*.o)
EXECUTABLE=protoc
LIBRARIERS=

.PHONY: clean $(SUBDIRS)

build: clean $(SUBDIRS) $(SOURCES) $(EXECUTABLE) clean

$(EXECUTABLE): $(OBJECTS)
	$(LD) $(LFLAGS) $(OBJECTS) -o $@ $(LIBRARIERS)

.cc.o:
	$(CC) $(CFLAGS) $(TFLAGS) $(OPTFLAG) $(PROFFLAG) $(PROFDIR) $(ARCHFLAGS) $(INCLUDES) $< -o $@

clean:
	$(RM) *.o *~
