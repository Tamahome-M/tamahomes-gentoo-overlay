EAPI=8

DESCRIPTION="Teleport client tools (tsh, tctl, teleport-update) v15.5.4"
HOMEPAGE="https://goteleport.com/"
SRC_URI="
    amd64? ( https://cdn.teleport.dev/teleport-v${PV}-linux-amd64-bin.tar.gz )
"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"

# Куда устанавливаем
PREFIX="/opt/teleport-${PV}"
S="${WORKDIR}/teleport-v${PV}-linux-amd64"

src_unpack() {
    unpack ${A}
}

src_prepare() {
    default
}

src_install() {
    # Создаём bin внутри /opt
    dodir "${PREFIX}/bin"

    # Перечисляем потенциальные бинарники, не все присутствуют во всех версиях
    for bin in teleport tsh tctl teleport-update tbot; do
        if [[ -x "${bin}" ]]; then
            exeinto "${PREFIX}/bin"
            doexe "${bin}"
        fi
    done

    # Лицензия (если есть)
    if [[ -f LICENSE ]]; then
        insinto "${PREFIX}/share/licenses/teleport"
        doins LICENSE
    fi
}

pkg_postinst() {
    einfo "Teleport ${PV} установлен в ${PREFIX}"
    einfo "Добавьте ${PREFIX}/bin в PATH, если хотите вызывать tsh/teleport/tctl напрямую:"
    einfo "  export PATH=${PREFIX}/bin:\\\$PATH"
}
