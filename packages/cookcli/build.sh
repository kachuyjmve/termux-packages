TERMUX_PKG_HOMEPAGE=https://cooklang.org
TERMUX_PKG_DESCRIPTION="A suite of tools to create shopping lists and maintain food recipes"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_LICENSE_FILE="LICENSE"
TERMUX_PKG_MAINTAINER="@finagolfin"
TERMUX_PKG_VERSION=0.4.0
TERMUX_PKG_SRCURL=https://github.com/CookLang/CookCLI/archive/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=b66b7256074e85dee717855ffb149afde66591c14c2da47229a27b8c2fce222d
TERMUX_PKG_DEPENDS="openssl"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true

termux_step_pre_configure() {
	export OPENSSL_INCLUDE_DIR=$TERMUX_PREFIX/include/openssl
	export OPENSSL_LIB_DIR=$TERMUX_PREFIX/lib
}

termux_step_make() {
	termux_setup_rust
	termux_setup_nodejs
	
	# Build Frontend
	cd ui
	npm i
	npm run build

	# Build Backend
	cd $TERMUX_PKG_SRCDIR
	cargo build --jobs $TERMUX_MAKE_PROCESSES --target $CARGO_TARGET_NAME --release
}

termux_step_make_install() {
	install -Dm755 -t $TERMUX_PREFIX/bin target/${CARGO_TARGET_NAME}/release/cook
}
