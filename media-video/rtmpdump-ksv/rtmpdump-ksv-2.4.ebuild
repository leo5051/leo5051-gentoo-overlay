EAPI="4"

inherit multilib toolchain-funcs

DESCRIPTION="Open source command-line RTMP client intended to stream audio or video flash content (PATCHED)"
HOMEPAGE="http://rtmpdump.mplayerhq.hu/"
SRC_URI="https://github.com/BurntSushi/rtmpdump-ksv/archive/ksv.zip"

LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="ssl"

DEPEND="ssl? ( dev-libs/openssl )
	sys-libs/zlib"
RDEPEND="${DEPEND}"

S=${WORKDIR}/rtmpdump-ksv-ksv

src_prepare() {
	sed -i 's/\$(MAKEFLAGS)//g' Makefile \
		|| die "failed to fix Makefile"
	sed -i -e 's:OPT=:&-fPIC :' \
		-e 's:OPT:OPTS:' \
		-e 's:CFLAGS=.*:& $(OPT):' librtmp/Makefile \
		|| die "failed to fix Makefile"
}

src_compile() {
	if use ssl ; then
		crypto="OPENSSL"
	fi
	sed -i "/^libdir/s:lib$:$(get_libdir):" librtmp/Makefile
	emake CC="$(tc-getCC)" LD="$(tc-getLD)" \
		OPT="${CFLAGS}" XLDFLAGS="${LDFLAGS}" CRYPTO="${crypto}" SYS=posix
}

src_install() {
	mkdir -p "${ED}"/${DESTTREE}/$(get_libdir)
	emake DESTDIR="${ED}" prefix="${DESTTREE}" mandir="${DESTTREE}/share/man" \
	CRYPTO="${crypto}" install
	dodoc README ChangeLog rtmpdump.1.html rtmpgw.8.html
}
