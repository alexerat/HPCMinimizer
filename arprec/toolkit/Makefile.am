if HAVE_FORTRAN
AM_CPPFLAGS=-I$(top_builddir)
AM_FFLAGS=@ax_f90_modflag@$(top_builddir)/fortran
LDADD = $(top_builddir)/fortran/libarprec_f_main.la \
        $(top_builddir)/fortran/libarprecmod.la \
        $(top_builddir)/src/libarprec.la $(FCLIBS)

TOOLKIT = mathinit$(EXEEXT) mathtool$(EXEEXT)
EXTRA_PROGRAMS = $(TOOLKIT)
CLEANFILES = $(TOOLKIT)

mathinit_SOURCES = globdata.f mathinit.f
nodist_mathinit_SOURCES = second.f
nodist_EXTRA_mathinit_SOURCES = dummy.cpp
mathinit_LINK = $(CXXLINK)

mathtool_SOURCES = mathtool.f globdata.f pslqsub.f quadsub.f \
                   rootsub.f zetapz.f 
nodist_mathtool_SOURCES = second.f
nodist_EXTRA_mathtool_SOURCES = dummy.cpp
mathtool_LINK = $(CXXLINK)
if UPCASE_MODULE
GLOBDATAMOD = GLOBDATA.$(module_ext)
else
GLOBDATAMOD = globdata.$(module_ext)
endif
$(GLOBDATAMOD): globdata.o
mathinit.o: $(GLOBDATAMOD)
mathtool.o: $(GLOBDATAMOD)
pqlsub.o: $(GLOBDATAMOD)
rootsub.o: $(GLOBDATAMOD)
quadsub.o: $(GLOBDATAMOD)
zetapz.o: $(GLOBDATAMOD)

toolkit: $(TOOLKIT)

endif
