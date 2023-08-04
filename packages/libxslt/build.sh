TERMUX_PKG_HOMEPAGE=http://xmlsoft.org/libxslt/
TERMUX_PKG_DESCRIPTION="XSLT processing library"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_LICENSE_FILE="COPYING"
TERMUX_PKG_MAINTAINER="@termux"
_MAJOR_VERSION=1.1
TERMUX_PKG_VERSION=${_MAJOR_VERSION}.38
TERMUX_PKG_REVISION=2
TERMUX_PKG_SRCURL=https://download.gnome.org/sources/libxslt/${_MAJOR_VERSION}/libxslt-${TERMUX_PKG_VERSION}.tar.xz
TERMUX_PKG_SHA256=1f32450425819a09acaff2ab7a5a7f8a2ec7956e505d7beeb45e843d0e1ecab1
TERMUX_PKG_SETUP_PYTHON=true
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--with-python"
TERMUX_PKG_DEPENDS="libgcrypt, libgpg-error, libxml2"
TERMUX_PKG_BREAKS="libxslt-dev"
TERMUX_PKG_REPLACES="libxslt-dev"

termux_step_make_install() {
	make install
	cd python
	sed -i "s/libxslt_wrap.h/python\/libxslt_wrap.h/g" $TERMUX_PKG_SRCDIR/python/libxslt.c
	sed -i "s/libxslt-py.h/python\/libxslt-py.h/g" $TERMUX_PKG_SRCDIR/python/libxslt.c
	python setup.py install
}
