TERMUX_PKG_HOMEPAGE=https://www.winehq.org
TERMUX_PKG_DESCRIPTION="Windows API implementation"
TERMUX_PKG_VERSION=5.1
TERMUX_PKG_SRCURL=https://dl.winehq.org/wine/source/5.x/wine-${TERMUX_PKG_VERSION}.tar.xz
TERMUX_PKG_SHA256=9756f5a2129b6a83ba701e546173cbff86caa671b0af73eb8f72c03b20c066c6
TERMUX_PKG_BUILD_IN_SRC=yes
TERMUX_PKG_LICENSE="custom"
TERMUX_PKG_LICENSE_FILE="LICENSE, COPYING-LIB"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_DEPENDS="ncurses, libpng, libjpeg-turbo, libx11, xorg-util-macros, libxaw, libxt, libxml2, libxslt, freetype"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--with-x --without-pcap"
TERMUX_PKG_HOSTBUILD="yes"
TERMUX_PKG_EXTRA_HOSTBUILD_CONFIGURE_ARGS="--with-x --without-mingw32, --disable-nls"

termux_step_host_build () {
   $TERMUX_PKG_SRCDIR/configure ${TERMUX_PKG_EXTRA_HOSTBUILD_CONFIGURE_ARGS}
   make -j8
}
