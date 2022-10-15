TERMUX_PKG_HOMEPAGE=https://www.winehq.org
TERMUX_PKG_DESCRIPTION="Windows API implementation"
TERMUX_PKG_VERSION=5.1
TERMUX_PKG_SRCURL=https://dl.winehq.org/wine/source/5.x/wine-${TERMUX_PKG_VERSION}.tar.xz
TERMUX_PKG_SHA256=de8380f78bb0dc0f0ee26a8f16675f8c80c0bf45cf4e305acb82eb9ec3c2c9cd
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_LICENSE="custom"
TERMUX_PKG_LICENSE_FILE="LICENSE, COPYING-LIB"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_DEPENDS="ncurses, libpng, libjpeg-turbo, libx11, xorg-util-macros, libxaw, libxt, libxml2, libxslt, libandroid-shmem, dbus, cups, fontconfig, xorgproto, flex, bison, libusb, zlib, libandroid-shmem-static, freetype, freetype-static, binutils"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="enable_wineandroid_drv=no exec_prefix=$TERMUX_PREFIX --without-x --without-pcap --with-freetype --disable-tests --enable-nls --with-wine-tools=$TERMUX_PKG_SRCDIR"

env -i PATH="$PATH" sudo apt update -y
env -i PATH="$PATH" sudo apt install -y libfreetype-dev:i386 libfreetype-dev binutils*

termux_step_make () {
   make tools
   make -j $TERMUX_MAKE_PROCESSES
}

termux_step_pre_configure() {
   LDFLAGS+=" -landroid-shmem"
}
