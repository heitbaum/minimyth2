#-------------------------------------------------------------------------------
# Values in this file can be overridden by including the desired value in
# '$(HOME)/.minimyth2/minimyth.conf.mk'
#-------------------------------------------------------------------------------

-include $(HOME)/.minimyth2/minimyth.conf.mk

# The version of MiniMyth2.
mm_VERSION                ?= $(mm_VERSION_MYTH)-$(mm_VERSION_MINIMYTH)$(mm_VERSION_EXTRA)
mm_VERSION_MYTH           ?= $(strip \
                                $(if $(filter 29     ,      $(mm_MYTH_VERSION)),29                            ) \
                                $(if $(filter 30     ,      $(mm_MYTH_VERSION)),30                            ) \
                                $(if $(filter 31     ,      $(mm_MYTH_VERSION)),31                            ) \
                                $(if $(filter master ,      $(mm_MYTH_VERSION)),master                        ) \
                                $(if $(filter test   ,      $(mm_MYTH_VERSION)),test                          ) \
                                $(if $(filter trunk  ,      $(mm_MYTH_VERSION)),trunk.$(mm_MYTH_TRUNK_VERSION)) \
                              )

mm_VERSION_MINIMYTH ?= 11.19.0.r2751

mm_VERSION_EXTRA          ?= $(strip \
                                $(if $(filter yes,$(mm_DEBUG)),-debug) \
                              )

# Configuration file (minimyth.conf) version.
mm_CONF_VERSION           ?= 48

#-------------------------------------------------------------------------------
# Variables that you are likely to be override based on your environment.
#-------------------------------------------------------------------------------
# Indicates whether or not to enable debugging in the image.
# Valid values for mm_DEBUG are 'yes' and 'no'.
mm_DEBUG                  ?= no

# Indicates whether or not to enable debugging in the build system.
# Valid values for mm_DEBUG_BUILD are 'yes' and 'no'.
mm_DEBUG_BUILD            ?= no

# Indicates whether or not to strip libs, perl and python in build image.
# Valid values for mm_STRIP_IMAGE are 'yes' and 'no'.
mm_STRIP_IMAGE            ?= yes

# Lists the graphics drivers supported.
# Valid values for mm_GRAPHICS are one or more of 'intel', 'nvidia',
# 'nvidia-legacy', 'radeon', 'vmware', 'armsoc', 'meson', 'rockchip'
# 'sun4i' and 'vc4'.
mm_GRAPHICS               ?= intel nvidia nvidia-legacy radeon vmware

# Selects OpenGL provider used by qt and mythtv. Valid values for
# mm_OPENGL_PROVIDER are:.
# 'mesa' (official mesa library),
# 'mesa-git' (mesa code from git),
# 'mali450-dummy',
# 'mali450-fbdev',
# 'mali450-wayland',
# 'mali450-x11',
# 'brcm-vc4' (3D library BLOB provided by Broadcom for RPI)
mm_OPENGL_PROVIDER        ?= mesa

# Lists the software to be supported.
# Valid values for MM_SOFTWARE are zero or more of list below:
mm_SOFTWARE               ?= \
                            python \
                            perl \
                            mythplugins \
                            airplay \
                            avahi \
                            udisks \
                            dvdcss \
                            gstreamer \
                            mc \
                            lcdproc \
                            voip \
                            makemkv \
                            connman \
                            iwd \
                            weston \
                            bootloader \
                            $(if $(filter $(mm_DEBUG),yes),debug)

#                             mednafen \
#                             stella \
#                             jzintv \
#                             mame \
#                             stella \
#                             visualboyadvance \
#                             bumblebee \
#                             mplayer-svn \
#                             mpv \
#                             netflix \
#                             ipxe \
#                             apitrace \
#                             gdb \
#                             valgrind \

# Indicates the microprocessor architecture.
# Valid values for mm_GARCH are 'pentium-mmx', 'x86-64', 'armv7', 'armv8'.
mm_GARCH                  ?= x86-64

# Indicates bootloader board type. Valid values are:
# 'board-rpi2'
# 'board-rpi3.mainline32'
# 'board-rpi3.mainline64'
# 'board-rpi3.rpi32'
# 'board-rpi4.mainline64'
# 'board-rpi34.mainline64'
# 'board-rpi4.rpi32'
# 'board-rpi4.rpi64'
# 'board-s905'
# 'board-s912'
# 'board-g12'
# 'board-sm1'
# 'board-rk3328.beelink_a1'
# 'board-rk3399.rockpi4-b'
# 'board-rk3399.orangepi_4'
# 'board-h6.beelink_gs1'
# 'board-h6.eachlink_mini'
# 'board-h6.tanix_tx6'
# 'board-h6.tanix_tx6_mini'
# 'board-h616.tanix_tx6s'
# 'board-h616.orangepi_lite2'
# 'board-x86pc.bios'
# 'board-x86pc.efi64'
# 'board-x86pc.bios_efi64'
# Note: some combinations for multiboard are not allowed.
# (due bootloader or architecture conflict):
# 1. 'board-rpi3*' and 'board-rk3328'
# 2. 'board-h6' and 'board-rk3328'
# 3. 'board-rpi2' and 'board-*'
# 4. 'board-s*' and 'board-s*' or 'board-g12'
# 5. Any multiple H6 boards combination
mm_BOARD_TYPE             ?= board-x86pc.bios_efi64

# Indicates whether or not to create the share distribution. Share distribution
# is full set of files generated by build process. Set of this files will be
# installed in mm_SHARE_FILES location by install process
mm_DISTRIBUTION_SHARE     ?= yes

# Indicates where to put DISTRIBUTION_SHARE files
mm_SHARE_FILES            ?= ${HOME}/build/share/$(mm_GARCH_FAMILY)/$(mm_MYTH_VERSION)

# Indicates whether or not to instal files for on-line updates. Set of this files will be
# installed in mm_ONLINE_UPDATES location by install process
mm_INSTALL_ONLINE_UPDATES ?= yes

# Indicates where to put mm_ONLINE_UPDATES files
mm_ONLINE_UPDATES         ?= ${HOME}/build/online-updates/$(mm_GARCH_FAMILY)/$(mm_MYTH_VERSION)

# Indicates whether or not to create the RAM based part of the share distribution.
mm_DISTRIBUTION_RAM       ?= yes

# Indicates whether or not to install the MiniMyth files needed to network boot
# with a RAM root file system. This will cause files to be installed in
# directory $(mm_TFTP_ROOT)/minimyth-$(mm_VERSION)/.
# Valid values for mm_INSTALL_RAM_BOOT are 'yes' and 'no'.
mm_INSTALL_RAM_BOOT       ?= yes

# Indicates the pxeboot TFTP directory.
# The MiniMyth kernel, the MiniMyth file system image and MiniMyth themes are
# installed in this directory. The files will be installed in a subdirectory
# named 'minimyth-$(mm_VERSION)'.
mm_TFTP_ROOT              ?= ${HOME}/build/tftp/$(mm_GARCH_FAMILY)/$(mm_MYTH_VERSION)

# Indicates whether or not to create the NFS based part of the share distribution.
mm_DISTRIBUTION_NFS       ?= no

# Indicates whether or not to install the MiniMyth files needed to network boot
# with an NFS root file system. This will cause files to be installed in
# directories $(mm_TFTP_ROOT)/minimyth-$(mm_VERSION) and
# $(mm_NFS_ROOT)/minimyth-$(mm_VERSION).
# Valid values for mm_INSTALL_NFS_BOOT are 'yes' and 'no'.
mm_INSTALL_NFS_BOOT       ?= no

# Indicates the directory in which the directory containing the MiniMyth root
# file system for mounting using NFS. The MiniMyth root file system will be
# installed in a subdirectory named 'minimyth-$(mm_VERSION)'.
mm_NFS_ROOT               ?= ${HOME}/build/nfs/$(mm_GARCH_FAMILY)/$(mm_MYTH_VERSION)

# Indicates whether or not to create the SD card image. Generated image will
# be installed in mm_SDCARD_FILES location by install process
mm_DISTRIBUTION_SDCARD    ?= yes

# Indicates the directory in which SD Card image will be installed.
mm_SDCARD_FILES           ?= ${HOME}/build

# Indicates the directory where the GAR MiniMyth build system is installed.
mm_HOME                   ?= /home/minimyth/minimyth2

# The version of kernel to use.
# Valid values are 'rpi-5.12' '5.11' '5.12'
mm_KERNEL_VERSION         ?= 5.12

# The kernel configuration file to use.
# When set, the kernel configuration file $(HOME)/.minimyth/$(mm_KERNEL_CONFIG) will be used.
# When not set, a built-in kernel configuration file will be used.
mm_KERNEL_CONFIG          ?=

# The version of Myth to use.
# Valid values are '29', '30', '31', 'master' and 'test'
mm_MYTH_VERSION           ?= master

# The version of the NVIDIA driver.
# Valid values are '440.36'
mm_NVIDIA_VERSION         ?= 455.45

# The version of the NVIDIA legacy driver.
# Valid values are '340.107' '340.108'
mm_NVIDIA_LEGACY_VERSION  ?= 340.108

# The version of xorg to use.
# Valid values are '7.6'.
mm_XORG_VERSION           ?= 7.6

# Myth trunk version built. If the version changes too much then the patches may
# no longer work.
mm_MYTH_TRUNK_VERSION     ?=

# Lists additional packages to build when minimyth is built.
mm_USER_PACKAGES          ?=

# Lists additional binaries to include in the MiniMyth image
# by adding to the lists found in minimyth-bin-list and bins-share-list
mm_USER_BIN_LIST          ?=

# Lists additional configs to include in the MiniMyth image
# by adding to the lists found in minimyth-etc-list and extras-etc-list
mm_USER_ETC_LIST          ?=

# Lists additional libraries to include in the MiniMyth image
# by adding to the lists found in minimyth-lib-list and extras-lib-list
mm_USER_LIB_LIST          ?=

# Lists additional data to include in the MiniMyth image
# by adding to the lists found in minimyth-share-list and extras-share-list
mm_USER_REMOVE_LIST       ?=

# Lists additional files to remove from the MiniMyth image
# by adding to the lists found in minimyth-remove-list*.
mm_USER_SHARE_LIST        ?=

#-------------------------------------------------------------------------------
# Variables that you are not likely to override.
#-------------------------------------------------------------------------------
# arch used by kerel arch
mm_GARCH_FAMILY           ?= $(strip \
                                 $(if $(filter pentium-mmx,$(mm_GARCH)),i386  ) \
                                 $(if $(filter x86-64     ,$(mm_GARCH)),x86_64) \
                                 $(if $(filter armv7      ,$(mm_GARCH)),arm   ) \
                                 $(if $(filter armv8      ,$(mm_GARCH)),arm64 ) \
                              )
# arch used by i.e. glibc
mm_GARHOST                ?= $(strip \
                                 $(if $(filter pentium-mmx,$(mm_GARCH)),i586-minimyth-linux-gnu        ) \
                                 $(if $(filter x86-64     ,$(mm_GARCH)),x86_64-minimyth-linux-gnu      ) \
                                 $(if $(filter armv7      ,$(mm_GARCH)),arm-minimyth-linux-gnueabi     ) \
                                 $(if $(filter armv8      ,$(mm_GARCH)),aarch64-minimyth-linux-gnu     ) \
                              )
mm_CFLAGS                 ?= $(strip \
                                 -pipe                                                                                        \
                                 $(if $(filter pentium-mmx ,$(mm_GARCH)),-march=pentium-mmx -mtune=generic              -O3 ) \
                                 $(if $(filter x86-64      ,$(mm_GARCH)),-march=x86-64 -mtune=generic -mfpmath=sse      -O3 ) \
                                 $(if $(filter armv7       ,$(mm_GARCH)),-mthumb -march=armv7-a+simd -mfloat-abi=softfp -O3 ) \
                                 $(if $(filter armv8       ,$(mm_GARCH)),-march=armv8-a+fp+simd                         -O3 ) \
                                 -flto                                                                                    \
                                 $(if $(filter i386  ,$(mm_GARCH_FAMILY)),-m32)                                           \
                                 $(if $(filter x86_64,$(mm_GARCH_FAMILY)),-m64)                                           \
                                 $(if $(filter yes,$(mm_DEBUG)),-g)                                                       \
                              )
mm_CXXFLAGS               ?= $(mm_CFLAGS)
mm_DESTDIR                ?= $(mm_HOME)/images/mm

# For ARM target MiniMyth2 GCC9.3 multi-lib capabilities allows to compile for
# following ARM target variants:
# -marm   -march=armv5te+fp   -mfloat-abi=softfp
# -mthumb -march=armv7-a      -mfloat-abi=soft
# -mthumb -march=armv7-a+fp   -mfloat-abi=softfp
# -mthumb -march=armv7-a+simd -mfloat-abi=softfp
# -mthumb -march=armv7ve+simd -mfloat-abi=softfp

#-------------------------------------------------------------------------------
# Variables that you cannot override.
#-------------------------------------------------------------------------------
# Set the language for gettext to English so the configure scripts for packages
# such as lib/libjpeg do not yield incorrect results.
LANGUAGE=en
export LANGUAGE

# Stop attempts to check out patches from perforce.
PATCH_GET=0
export PATCH_GET

# Set the number of parallel makes to the number of processors.
PARALLELMFLAGS=-j$(shell cat /proc/cpuinfo | grep -c '^processor[[:cntrl:]]*:' | sed -e 's/2/3/' -e 's/4/5/' -e 's/8/9/')
export PARALLELMFLAGS
