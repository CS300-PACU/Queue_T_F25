#############################################################################
# File name:  Makefile
# Author:     chadd williams
# Date:       Sept 1, 2021
# Class:      CS360
# Assignment: 
# Purpose:    
#############################################################################


# variables
CC=clang-16
CFLAGS=-g -Wall
VALGRIND_FLAGS=-v --leak-check=yes --track-origins=yes --leak-check=full \
--show-leak-kinds=all
ENSCRIPT_FLAGS=-C -T 2 -p - -M Letter --color -fCourier8

	
TARGETS=bin/queue.o

all: clean_objects ${TARGETS}


bin/queue.o: src/queue.c include/queue.h
	${CC} -o bin/queue.o src/queue.c -c ${CFLAGS} 

valgrind: all
	valgrind ${VALGRIND_FLAGS} bin/queuetester
	
printAll:
	@#enscript ${ENSCRIPT_FLAGS} -Emakefile  Makefile  | ps2pdf - bin/Makefile.pdf
	enscript ${ENSCRIPT_FLAGS} -Ec src/queue.c  | ps2pdf - bin/queue.pdf
	enscript ${ENSCRIPT_FLAGS} -Ecpp test/UnitTests.cpp  | ps2pdf - bin/UnitTests.pdf
	pdfunite bin/queue.pdf bin/UnitTests.pdf  bin/${USER}_queue.pdf
	@echo
	@echo File produced: bin/${USER}_queue.pdf
	@echo
	@ls -l bin/${USER}_queue.pdf
	@echo

clean_objects:
	rm -f ${TARGETS} bin/*.o

clean_pdfs:
	rm -f bin/*.pdf

clean: clean_objects clean_pdfs

build: CMakeLists.txt test/CMakeLists.txt
	cmake -S . -B ./build;
	cmake --build build --target clean;

build/test/TestsToRunQ: build test/UnitTests.cpp src/queue.c include/queue.h
	cmake --build build;

runUnittest: build/test/TestsToRunQ
	build/test/TestsToRunQ

valgrindUnittests: build/test/TestsToRunQ
	bash -c 'time valgrind ${VALGRIND_FLAGS} build/test/TestsToRunQ'

