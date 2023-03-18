TERMUX_PKG_HOMEPAGE=https://duck.sh/
TERMUX_PKG_DESCRIPTION="Cyberduck is a libre FTP, SFTP, WebDAV, Amazon S3, Backblaze B2, Microsoft Azure & OneDrive and OpenStack Swift file transfer client"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="8.5.6"
TERMUX_PKG_SRCURL=https://github.com/iterate-ch/cyberduck/archive/refs/tags/release-${TERMUX_PKG_VERSION//./-}.tar.gz
TERMUX_PKG_SHA256=eddc0342e65efe46681e0e98ef6274c1a9aae55ec071ce47c759b76da890e40d
TERMUX_PKG_BUILD_DEPENDS="maven, openjdk-17"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_UPDATE_VERSION_REGEXP="\d+-\d+-\d+"
TERMUX_PKG_AUTO_UPDATE=true

termux_step_make() {
	unset JAVA_HOME

	sed -i "s/TERMUX_ARCH/${TERMUX_ARCH}/g" $TERMUX_PKG_SRCDIR/cli/linux/pom.xml
        $TERMUX_PREFIX/bin/mvn verify -DskipTests -DskipSign -T ${TERMUX_MAKE_PROCESSES}C
	ls -lah $TERMUX_PKG_SRCDIR/cli/linux/target/
	ls -lah $TERMUX_PKG_SRCDIR/cli/linux/target/release/
	ls -lah $TERMUX_PKG_SRCDIR/cli/linux/target/release/duck/
}

termux_step_make_install() {
        rm -rf $TERMUX_PREFIX/opt/duck
	
	mkdir -p $TERMUX_PREFIX/opt/duck
	
	cp -a $TERMUX_PKG_SRCDIR/cli/linux/target/release/duck/* $TERMUX_PREFIX/opt/duck
	ln -sfr $TERMUX_PREFIX/opt/duck/bin/duck $TERMUX_PREFIX/bin/duck
}
