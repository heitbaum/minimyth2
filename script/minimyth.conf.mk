#-------------------------------------------------------------------------------
# Values in this file can be overridden by including the desired value in
# '$(HOME)/.minimyth2/minimyth.conf.mk'
#-------------------------------------------------------------------------------

-include $(HOME)/.minimyth2/minimyth.conf.mk

# The version of MiniMyth2.
mm_VERSION                ?= $(mm_VERSION_MYTH)-$(mm_VERSION_MINIMYTH)$(mm_VERSION_EXTRA)
mm_VERSION_MYTH           ?= $(strip \
                                $(if $(filter 0.28   ,      $(mm_MYTH_VERSION)),0.28                          ) \
                                $(if $(filter 29     ,      $(mm_MYTH_VERSION)),29                            ) \
                                $(if $(filter 30     ,      $(mm_MYTH_VERSION)),30                            ) \
                                $(if $(filter 31     ,      $(mm_MYTH_VERSION)),31                            ) \
                                $(if $(filter master ,      $(mm_MYTH_VERSION)),master                        ) \
                                $(if $(filter test   ,      $(mm_MYTH_VERSION)),test                          ) \
                                $(if $(filter trunk  ,      $(mm_MYTH_VERSION)),trunk.$(mm_MYTH_TRUNK_VERSION)) \
                              )

mm_VERSION_MINIMYTH ?= 9.21.2.r575

mm_VERSION_EXTRA          ?= $(strip \
                                $(if $(filter yes,$(mm_DEBUG)),-debug) \
                              )

# Configuration file (minimyth.conf) version.
mm_CONF_VERSION           ?= 47

#-------------------------------------------------------------------------------
# Variables that you are likely to be override based on your environment.
#-------------------------------------------------------------------------------
# Indicates whether or not to enable debugging in the image.
# Valid values for mm_DEBUG are 'yes' and 'no'.
mm_DEBUG                  ?= no

# Indicates whether or not to enable debugging in the build system.
# Valid values for mm_DEBUG_BUILD are 'yes' and 'no'.
mm_DEBUG_BUILD            ?= no

# Lists the graphics drivers supported.
# Valid values for mm_GRAPHICS are one or more of 'intel', 'nvidia',
# 'nvidia-legacy', 'radeon', 'vmware', 'armsoc', 'meson', 'rockchip'
# 'sun4i' and 'vc4'.
mm_GRAPHICS               ?= intel nvidia nvidia-legacy radeon vmware

# Selects OpenGL provider used by qt and mythtv. Valid values for
# mm_OPENGL_PROVIDER are:.
# 'mesa' (official mesa library),
# 'mesa-git' (mesa code from git),
# 'lima' (mesa library for ARM Mali 3D engine),
# 'mali450-dummy',
# 'mali450-fbdev',
# 'mali450-wayland',
# 'mali450-x11',
# 'brcm-vc4' (3D library BLOB provided by Broadcom for RPI)
mm_OPENGL_PROVIDER        ?= mesa

# Lists the software to be supported.
# Valid values for MM_SOFTWARE are zero or more of 'airplay', 'avahi', 'mythplugins',
# 'flash', 'mplayer-svn', 'voip', 'perl', 'python', 'mame',
# 'emulators', 'mc', 'dvdcss', 'udisks', 'gstreamer', 'ipxe' 'bootloader' 'chrome', 'firefox',
# 'lcdproc', 'glmark2' 'kmscube' 'mpv' 'ffmpeg-drm' 'debug'.
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
                            mednafen \
                            stella \
                            voip \
                            makemkv \
                            $(if $(filter $(mm_DEBUG),yes),debug)

#                             lcdproc \
#                             mednafen \
#                             stella \
#                             voip \
#                             makemkv \
#                             fceu \
#                             jzintv \
#                             mame \
#                             stella \
#                             visualboyadvance \
#                             zsnes \
#                             bumblebee \
#                             flash \
#                             mplayer-svn \
#                             netflix \
#                             ipxe \

# Indicates the microprocessor architecture.
# Valid values for mm_GARCH are 'pentium-mmx', 'x86-64', 'armv7', 'armv8'.
mm_GARCH                  ?= x86-64

# Indicates bootloader board type. Valid values are:
# 'board-rpi2',
# 'board-rpi3_32b',
# 'board-rpi3_64b',
# 'board-s905'
# 'board-s912'
# 'board-rk3328'
# 'board-h6.beelink_gs1'
# 'board-h6.eachlink_mini'
# 'board-h6.tanix_tx6'
# Note: some combinations for multiboard are not allowed.
# (due bootloader or architecture conflict):
# 1. 'board-rpi3_*' and 'board-rk3328'
# 2. 'board-h6' and 'board-rk3328'
# 3. 'board-rpi2' and 'board-*'
# 4. 'board-s905' and 'board-s912'
# 5. Any H6 boards combination
mm_BOARD_TYPE             ?= board-s905 board-rpi3_64b

# Indicates whether or not to create the share distribution. Share distribution
# is full set of files generated by build process. Set of this files will be
# installed in mm_SHARE_FILES location by install process
mm_DISTRIBUTION_SHARE     ?= yes

# Indicates where to put DISTRIBUTION_SHARE files
mm_SHARE_FILES            ?= /home/piotro/ABS/mythtv-pxe_image/src

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
mm_TFTP_ROOT              ?= /home/piotro/tftpboot

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
mm_NFS_ROOT               ?= /home/piotro/tftpboot

# Indicates whether or not to create the SD card image. Generated image will
# be installed in mm_SDCARD_FILES location by install process
mm_DISTRIBUTION_SDCARD    ?= no

# Indicates the directory in which SD Card image will be installed.
mm_SDCARD_FILES           ?= /home/piotro/ABS/SD-image-builder

# Indicates the directory where the GAR MiniMyth build system is installed.
mm_HOME                   ?= /home/piotro/minimyth-dev

# The version of kernel to use.
# Valid values are '5.3' 'rpi-5.3' '5.4'
mm_KERNEL_VERSION         ?= 5.3

# The kernel configuration file to use.
# When set, the kernel configuration file $(HOME)/.minimyth/$(mm_KERNEL_CONFIG) will be used.
# When not set, a built-in kernel configuration file will be used.
mm_KERNEL_CONFIG          ?=

# The version of Myth to use.
# Valid values are '0.28', '29', '30' 'master' and 'test'
mm_MYTH_VERSION           ?= master

# The version of the NVIDIA driver.
# Valid values are '440.26'
mm_NVIDIA_VERSION         ?= 440.26

# The version of the NVIDIA legacy driver.
# Valid values are '340.107'
mm_NVIDIA_LEGACY_VERSION  ?= 340.107

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
                                 $(if $(filter armv7      ,$(mm_GARCH)),armv7a-minimyth-linux-gnueabihf) \
                                 $(if $(filter armv8      ,$(mm_GARCH)),aarch64-minimyth-linux-gnu     ) \
                              )
mm_CFLAGS                 ?= $(strip \
                                 -pipe                                                                                                                 \
                                 $(if $(filter pentium-mmx ,$(mm_GARCH)),-march=pentium-mmx -mtune=generic   -Os                                     ) \
                                 $(if $(filter x86-64      ,$(mm_GARCH)),-march=x86-64      -mtune=generic   -O3 -mfpmath=sse                        ) \
                                 $(if $(filter armv7       ,$(mm_GARCH)),-march=armv7-a     -mtune=cortex-a7 -O2 -mfloat-abi=softfp -mfpu=neon-vfpv4 ) \
                                 $(if $(filter armv8       ,$(mm_GARCH)),-march=armv8-a                      -O2                                     ) \
                                 -flto                                                                                         \
                                 $(if $(filter i386  ,$(mm_GARCH_FAMILY)),-m32)                                                \
                                 $(if $(filter x86_64,$(mm_GARCH_FAMILY)),-m64)                                                \
                                 $(if $(filter yes,$(mm_DEBUG)),-g)                                                            \
                              )
mm_CXXFLAGS               ?= $(mm_CFLAGS)
mm_DESTDIR                ?= $(mm_HOME)/images/mm

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
