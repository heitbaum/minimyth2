# 2021.02.09
GITHASH             = 656dc8295f67e3c4c475f76f10426fc358a952d0
LINUX_MAJOR_VERSION = 5
LINUX_MINOR_VERSION = 10
LINUX_TEENY_VERSION = 14
LINUX_EXTRA_VERSION = 

LINUX_VERSION      = $(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)$(if $(LINUX_TEENY_VERSION),.$(LINUX_TEENY_VERSION))$(LINUX_EXTRA_VERSION)
LINUX_FULL_VERSION = $(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)$(if $(LINUX_TEENY_VERSION),.$(LINUX_TEENY_VERSION),.0)$(LINUX_EXTRA_VERSION)

LINUX_DIR           = $(rootdir)/boot
LINUX_MODULESPREFIX = $(rootdir)/lib/modules
LINUX_MODULESDIR    = $(LINUX_MODULESPREFIX)/$(LINUX_FULL_VERSION)
LINUX_SOURCEDIR     = $(LINUX_MODULESDIR)/source
LINUX_BUILDDIR      = $(LINUX_MODULESDIR)/build

LINUX_MAKEFILE = $(DESTDIR)$(LINUX_SOURCEDIR)/Makefile

LINUX_MAKE_ARGS = \
	ARCH="$(GARCH_FAMILY)" \
	HOSTCC="$(build_CC)" \
	HOSTCXX="$(build_CXX)" \
	HOSTCFLAGS="$(build_CFLAGS)" \
	HOSTCXXFLAGS="$(build_CXXFLAGS)" \
	CROSS_COMPILE="$(compiler_prefix)" \
	$(PARALLELMFLAGS)

LINUX_MAKE_ENV = \
	KBUILD_VERBOSE="0"
