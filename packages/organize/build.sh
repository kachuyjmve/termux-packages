TERMUX_PKG_HOMEPAGE=https://github.com/organize-rs/organize
TERMUX_PKG_DESCRIPTION="A file management automation tool"
TERMUX_PKG_LICENSE="AGPL-V3"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=0.4.1
TERMUX_PKG_SRCURL=https://github.com/organize-rs/organize/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=af5dba3b7537ab3f19ba515b3320788d809d0cfa0d342d91c0c8c4c46b435105
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make() {
        termux_setup_rust

        cargo build --jobs $TERMUX_MAKE_PROCESSES --target $CARGO_TARGET_NAME --release
}

termux_step_make_install() {
        install -Dm755 -t $TERMUX_PREFIX/bin target/${CARGO_TARGET_NAME}/release/organize
}
