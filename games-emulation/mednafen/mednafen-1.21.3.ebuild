# Copyright 2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Argument-driven multi-system emulator utilizing OpenGL and SDL"
HOMEPAGE="https://mednafen.github.io/"
SRC_URI="https://mednafen.github.io/releases/files/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="alsa"

RDEPEND="
		dev-libs/libcdio
		>=dev-libs/lzo-2.10
		media-libs/libsdl2
		media-libs/libsndfile
		sys-libs/zlib[minizip]
		virtual/opengl
		alsa? ( media-libs/alsa-lib )"
DEPEND="${RDEPEND}
		virtual/pkgconfig"

S=${WORKDIR}/${PN}
