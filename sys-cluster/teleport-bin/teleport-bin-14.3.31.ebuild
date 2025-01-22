# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit unpacker desktop

MY_PN="${PN%-bin}"

DESCRIPTION="Teleport"
HOMEPAGE="https://goteleport.com/download/"
SRC_URI="https://cdn.teleport.dev/teleport_14.3.31_arm64.deb"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="bindist strip"

# Depends: libgtk-3-0, libnotify4, libnss3, libxss1, libxtst6, xdg-utils, libatspi2.0-0, libuuid1, libsecret-1-0
# Recommends: libappindicator3-1
# this depends on so much more...
#DEPEND=""

#RDEPEND="${DEPEND}"
#BDEPEND=""

S="${WORKDIR}"


src_unpack(){
        unpack_deb ${A}
}

src_install(){
        cp -R "${WORKDIR}/usr" "/opt/teleport" || die "install failed!"
}

