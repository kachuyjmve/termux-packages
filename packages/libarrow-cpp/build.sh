TERMUX_PKG_HOMEPAGE=https://github.com/apache/arrow
TERMUX_PKG_DESCRIPTION="C++ libraries for Apache Arrow"
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_MAINTAINER="@termux"
# Align the version with `libarrow-python` package.
TERMUX_PKG_VERSION=14.0.1
TERMUX_PKG_SRCURL=https://github.com/apache/arrow/archive/refs/tags/apache-arrow-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=a48e54a09d58168bc04d86b13e7dab04f0aaba18a6f7e4dadf3e9c7bb835c8f1
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_UPDATE_METHOD=repology
TERMUX_PKG_DEPENDS="libandroid-execinfo, libc++, liblz4, libprotobuf, libre2, libsnappy, utf8proc, zlib, zstd"
TERMUX_PKG_BUILD_DEPENDS="rapidjson"
TERMUX_PKG_BREAKS="libarrow-python (<< ${TERMUX_PKG_VERSION})"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DARROW_BUILD_STATIC=OFF
-DARROW_CSV=ON
-DARROW_DATASET=ON
-DARROW_HDFS=ON
-DARROW_JEMALLOC=OFF
-DARROW_JSON=ON
-DARROW_ORC=ON
-DARROW_ZSTD=ON
-DARROW_PARQUET=ON
-DARROW_RUNTIME_SIMD_LEVEL=NONE
-DARROW_SIMD_LEVEL=NONE
"

termux_step_pre_configure() {
	termux_setup_protobuf

	TERMUX_PKG_SRCDIR+="/cpp"

	CPPFLAGS+=" -DPROTOBUF_USE_DLLS"
	LDFLAGS+=" -landroid-execinfo"
}
