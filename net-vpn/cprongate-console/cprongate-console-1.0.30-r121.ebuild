# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit unpacker

MY_PN="${PN%-bin}"

DESCRIPTION="cprongate-console"
HOMEPAGE="https://ng-client.cryptopro.ru/"
SRC_URI="https://ng-client.cryptopro.ru/repository/debian/amd64_snapshot/cprongate-console_1.0.30-121-gedc0c0d_amd64.deb"

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
    mv opt "${ED}" || die
}
