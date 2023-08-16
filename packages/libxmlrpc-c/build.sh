TERMUX_PKG_HOMEPAGE=https://xmlrpc-c.sourceforge.io/
TERMUX_PKG_DESCRIPTION="XML-RPC is a quick-and-easy way to make procedure calls over the Internet"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_LICENSE="custom"
TERMUX_PKG_LICENSE_FILE="doc/COPYING"
TERMUX_PKG_VERSION=1.54.06
TERMUX_PKG_SRCURL=https://sourceforge.net/projects/xmlrpc-c/files/Xmlrpc-c%20Super%20Stable/1.54.06/xmlrpc-c-1.54.06.tgz/download
TERMUX_PKG_SHA256=ae6d0fb58f38f1536511360dc0081d3876c1f209d9eaa54357e2bacd690a5640
TERMUX_PKG_DEPENDS="libcurl"

termux_step_pre_configure() {
	autoreconf -vfi
}
