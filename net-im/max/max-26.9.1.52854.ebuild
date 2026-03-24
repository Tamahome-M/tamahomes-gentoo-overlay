# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit unpacker desktop xdg-utils

MY_PN="${PN%}"

DESCRIPTION="MAX messenger (VK)"
HOMEPAGE="https://max.ru/"
SRC_URI="https://download.max.ru/linux/deb/pool/main/m/max/MAX-${PV}.deb"

SLOT="0"
KEYWORDS="~amd64"
RESTRICT="bindist strip"

DEPEND=""
BDEPEND=""
RDEPEND="
    x11-libs/libX11
    x11-libs/libXext
    x11-libs/libXrender
    x11-libs/libXrandr
    x11-libs/libXcomposite
    x11-libs/libXdamage
    x11-libs/libXfixes
    x11-libs/libXi
    x11-libs/libXtst
    x11-libs/libXcursor
    x11-libs/libXinerama
    x11-libs/libXres
    x11-libs/libXScrnSaver

    x11-libs/libxcb
    x11-libs/xcb-util-wm

    media-libs/libglvnd
    media-libs/mesa

    media-libs/alsa-lib

    dev-libs/nss
    dev-libs/nspr

    x11-libs/libnotify
    x11-libs/libxkbcommon
"

S="${WORKDIR}"

src_prepare() {
    default
#    gunzip usr/share/doc/lens/changelog.gz
}

src_install() {
    doicon usr/share/icons/hicolor/512x512/apps/max.png
    doicon -s 512 usr/share/icons/hicolor/512x512/apps/max.png
    sed -i '/DBusActivatable/d' usr/share/applications/max.desktop || die
    sed -i 's#/usr/share/max#/opt/max#g' usr/share/applications/max.desktop || die
    domenu usr/share/applications/max.desktop
    insinto /opt/max
    doins -r usr/share/max/* || die
    fperms +x /opt/max/bin/max
    fperms +x /opt/max/bin/max-service/bin/max-service
#    mv opt "${ED}" || die
}

pkg_postinst() {
   xdg_desktop_database_update
   xdg_icon_cache_update
}

pkg_postrm() {
   xdg_desktop_database_update
   xdg_icon_cache_update
}
