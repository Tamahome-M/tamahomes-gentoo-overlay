# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit unpacker desktop

MY_PN="${PN%-bin}"

DESCRIPTION="Graphical frontend for CryptoPro NGate VPN client"
HOMEPAGE="https://ng-client.cryptopro.ru/"
SRC_URI="https://ng-client.cryptopro.ru/repository/debian/amd64/cprongate-gui_1.0.20-98-ga6f39b7_amd64.deb"

SLOT="0"
KEYWORDS="~amd64"
RESTRICT="bindist strip"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_prepare() {
    default
}

src_install() {
    domenu "${FILESDIR}"/cprongate.desktop
    mv opt "${ED}" || die
}
