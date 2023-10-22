TERMUX_PKG_HOMEPAGE=https://forgejo.org
TERMUX_PKG_DESCRIPTION="Forgejo is a self-hosted lightweight software forge"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=1.20.5-0
TERMUX_PKG_SRCURL=https://codeberg.org/forgejo/forgejo/releases/download/v$TERMUX_PKG_VERSION/forgejo-src-$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=e709c0e6403100fdef96eec8ac146c065375228b104125b9bf5ea844ea48633e
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make() {
	termux_setup_golang
	termux_setup_nodejs

	echo $TERMUX_PKG_VERSION > VERSION
	unset LDFLAGS
	TAGS="bindata sqlite sqlite_unlock_notify" make build
}

termux_step_make_install() {
	install -Dm700 ./gitea "${TERMUX_PREFIX}"/bin
}
