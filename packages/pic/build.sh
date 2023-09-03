TERMUX_PKG_HOMEPAGE=hhttps://github.com/emsquid/pic
TERMUX_PKG_DESCRIPTION="Preview Image in CLI"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
_COMMIT=dbea6f605aa367847ec0ae6b9aa4372a881b71d9
TERMUX_PKG_VERSION="2023.03.21"
TERMUX_PKG_GIT_BRANCH="main"
TERMUX_PKG_SRCURL=git+https://github.com/emsquid/pic
TERMUX_PKG_SHA256=8ef631e587c1ccd6e2e69d6ed89bd7912b1d6c56ff73f9a9b97d0ff9e4140c95
TERMUX_PKG_DEPENDS="libsixel, libsixel-static"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_post_get_source() {
	git fetch --unshallow
	git checkout $_COMMIT

	local version="$(git log -1 --format=%cs | sed 's/-/./g')"
	if [ "$version" != "$TERMUX_PKG_VERSION" ]; then
		echo -n "ERROR: The specified version \"$TERMUX_PKG_VERSION\""
		echo " is different from what is expected to be: \"$version\""
		return 1
	fi

	local s=$(find . -type f ! -path '*/.git/*' -print0 | xargs -0 sha256sum | LC_ALL=C sort | sha256sum)
	if [[ "${s}" != "${TERMUX_PKG_SHA256}  "* ]]; then
		termux_error_exit "Checksum mismatch for source files."
	fi
}

termux_step_make() {
	termux_setup_rust
	pkg-config --modversion libsixel
	echo $LD_LIBRAARY_PATH
	exit 1
	# cargo build --jobs $TERMUX_MAKE_PROCESSES --target $CARGO_TARGET_NAME --release
}

termux_step_make_install() {
	install -Dm700 -t $TERMUX_PREFIX/bin target/${CARGO_TARGET_NAME}/release/pic
}
