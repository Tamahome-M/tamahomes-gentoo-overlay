# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit unpacker desktop

MY_PN="${PN%-bin}"

DESCRIPTION="Обновлённая, любимая Яндекс Музыка в бета-версии для компьютера"
HOMEPAGE="https://music.yandex.ru/download/"
SRC_URI="https://github.com/cucumber-sp/yandex-music-linux/releases/download/v${PV}/yandex-music_${PV}_amd64.deb"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="bindist strip"

# Depends: libgtk-3-0, libnotify4, libnss3, libxss1, libxtst6, xdg-utils, libatspi2.0-0, libuuid1, libsecret-1-0
# Recommends: libappindicator3-1
# this depends on so much more...
DEPEND="x11-libs/gtk+:3
	x11-libs/libnotify
	dev-libs/nss
	x11-misc/xdg-utils
	app-crypt/libsecret"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"



src_unpack(){
        unpack_deb ${A}
}

src_install(){
        cp -R "${WORKDIR}/usr" "${D}" || die "install failed!"


}

