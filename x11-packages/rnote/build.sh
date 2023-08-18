TERMUX_PKG_HOMEPAGE=https://rnote.flxzt.net
TERMUX_PKG_DESCRIPTION="Sketch and take handwritten notes"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="0.7.1"
TERMUX_PKG_SRCURL=https://github.com/flxzt/rnote/archive/refs/tags/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=beb04d1e76dd62b934a89490174b24cbbcae44ec686cd8458209ef7b8ec823db
TERMUX_PKG_DEPENDS="glib, gtk4, libcairo, poppler, libadwaita"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make() {
	termux_setup_rust
}

termux_step_make_install() {
	ls
	install -Dm755 -t $TERMUX_PREFIX/bin target/${CARGO_TARGET_NAME}/release/rnote
}
