# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
 
EAPI=8

inherit meson

DESCRIPTION="Cassette"
HOMEPAGE="https://gitlab.gnome.org/Rirusha/Cassette"
SRC_URI="https://gitlab.gnome.org/Rirusha/Cassette/-/archive/ver-0.2.0/Cassette-ver-0.2.0.tar.gz"
 
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
 
DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
    cp -r /var/tmp/portage/media-sound/cassette-0.2/work/Cassette-ver-0.2.0 ${S} || die

}

src_configure() {
        local emesonargs=(
                $(meson_use qt5)
                $(meson_feature threads)
                $(meson_use bindist official_branding)
        )
        meson_src_configure
}