TERMUX_PKG_HOMEPAGE=https://www.gryphel.com/c/minivmac/index.html
TERMUX_PKG_DESCRIPTION="a miniature early Macintosh emulator"
# Licenses: GPL-1.0, GPL-2.0
TERMUX_PKG_LICENSE="custom"
TERMUX_PKG_LICENSE_FILE="COPYING.txt"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=36.04
TERMUX_PKG_SRCURL=https://www.gryphel.com/d/minivmac/minivmac-36.04/minivmac-36.04.src.tgz
TERMUX_PKG_SHA256=9b7343cec87723177a203e69ad3baf20f49b4e8f03619e366c4bf2705167dfa4
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make() {
	gcc setup/tool.c -o setup_t
	chmod +x setup
	if [ $TERMUX_ARCH = "arm" ]; then
		./setup_t -t larm -intl > setup.sh
	elif [ $TERMUX_ARCH = "aarch64" ]; then
		./setup_t -t lx64 -intl > setup.sh
	elif [ $TERMUX_ARCH = "i686" ]; then
		./setup_t -t lx86 -intl > setup.sh
	elif [ $TERMUX_ARCH = "x86_64" ]; then
		./setup_t -t lx64 -intl > setup.sh
	fi
	chmod +x setup.sh
	./setup.sh
	sed -i "s/gcc/\$TERMUX_ARCH-linux-gnu-clang/g" Makefile
	make -j $TERMUX_MAKE_PROCESSES
}

termux_step_make_install() {
	install -Dm700 minivmac "$TERMUX_PREFIX"/bin/minivmac
}
