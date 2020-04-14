# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit multilib epatch

DESCRIPTION="Lisp-flavoured Erlang"
HOMEPAGE="http://lfe.github.io/"
SRC_URI="https://github.com/rvirding/lfe/archive/v${PV}.zip -> ${P}.zip"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-lang/erlang"
DEPEND="${RDEPEND}"

PATCHES=(
        "${FILESDIR}/Makefile.patch"
)

src_prepare() {
	default
	export PATH="${S}/bin:$PATH"
}

src_compile() {
	emake compile -j1
}

src_install() {
	dobin bin/lfe
	dobin bin/lfec
	dobin bin/lfescript
	dobin bin/lfeexec
	dodir /usr/$(get_libdir)/erlang/lib/lfe/ebin/
	dodir /usr/$(get_libdir)/erlang/lib/lfe/emacs/
	cp -R "${S}/ebin" "${ED}/usr/$(get_libdir)/erlang/lib/lfe/"
	cp -R "${S}/emacs" "${ED}/usr/$(get_libdir)/erlang/lib/lfe/"
}
