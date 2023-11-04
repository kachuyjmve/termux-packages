TERMUX_PKG_HOMEPAGE=https://github.com/XmacsLabs/mogan
TERMUX_PKG_DESCRIPTION="A structure editor forked from GNU TeXmacs"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=1.1.6
TERMUX_PKG_SRCURL=https://github.com/XmacsLabs/mogan/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=23ae08cd3c2af99d952b5ec37253ee639519402784b8766f37b2d223587659ab
TERMUX_PKG_DEPENDS="freetype, ghostscript, libandroid-complex-math, libandroid-execinfo, libandroid-spawn, libc++, libcurl, libiconv, libjpeg-turbo, libpng, libsqlite, mogan-data, qt5-qtbase, qt5-qtsvg, zlib"
TERMUX_PKG_BUILD_DEPENDS="xmake, qt5-qtbase-cross-tools"

termux_step_pre_configure() {
	LDFLAGS+=" -landroid-complex-math -landroid-execinfo -landroid-spawn"
}

termux_step_make() {
	xrepo update-repo
	xmake config -m release --yes
	xmake build --yes --verbose --diagnosis --jobs=$TERMUX_MAKE_PROCESSES --all
}

termux_step_make_install() {
	xmake install -o $TERMUX_PREFIX mogan_install
}
