ACLOCAL_AMFLAGS = -I m4
SUBDIRS = src tests include fortran toolkit

bin_SCRIPTS=arprec-config
dist_doc_DATA = README doc/arprec.pdf

cpp-demo:
	$(MAKE) -C tests demo

if HAVE_FORTRAN

fortran-demo:
	$(MAKE) -C fortran demo

demo: fortran-demo cpp-demo

toolkit:
	$(MAKE) -C toolkit toolkit

else

fortran-demo:
	@echo "You need a Fortran 95 compiler to build fortran demo programs." && false

demo: cpp-demo

toolkit:
	@echo "You need a Fortran 95 compiler to build the toolkit." && false

endif

time:
	$(MAKE) -C tests time

changelog:
	git log >ChangeLog

.PHONY: toolkit demo fortran-demo cpp-demo time changelog

