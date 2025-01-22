# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit unpacker desktop

MY_PN="${PN%-bin}"

DESCRIPTION="eXpress"
HOMEPAGE="https://express.ms/"
SRC_URI="https://updates.express.ms/desktop/eXpress_${PV}_amd64.deb"

SLOT="0"
KEYWORDS="~amd64"
RESTRICT="bindist strip"

# Depends: libgtk-3-0, libnotify4, libnss3, libxss1, libxtst6, xdg-utils, libatspi2.0-0, libuuid1, libsecret-1-0
# Recommends: libappindicator3-1
# this depends on so much more...
DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_prepare() {
    default
    gunzip usr/share/doc/lens/changelog.gz
}

src_install() {
    doicon usr/share/icons/hicolor/512x512/apps/express.png
    doicon -s 512 usr/share/icons/hicolor/512x512/apps/express.png
    domenu usr/share/applications/express.desktop
    mv opt "${ED}" || die
}

pkg_postinst() {
   xdg_desktop_database_update
   xdg_icon_cache_update
}

pkg_postrm() {
   xdg_desktop_database_update
   xdg_icon_cache_update
}
