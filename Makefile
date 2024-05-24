#	$NetBSD: Makefile,v 1.19 2024/04/01 02:21:39 christos Exp $

USE_FORT?= yes	# data-driven bugs?

BINDIR=/usr/local/bin
LIBDIR=	/usr/local/lib
MANDIR=	/usr/local/share/man
PROG=		gzip
SRCS+=	gzip.c
MAN=		gzip.1 gzexe.1 zdiff.1 zforce.1 zgrep.1 zmore.1 znew.1

.if !defined(HOSTPROG)
DPADD=		${LIBZ} ${LIBBZ2} ${LIBLZMA} ${LIBZSTD}
LDADD=		-lz -llz4 -lbz2 -llzma -lzstd -larchive

SCRIPTS=	gzexe zdiff zforce zgrep zmore znew

MLINKS+=	gzip.1 gunzip.1 \
		gzip.1 gzcat.1 \
		gzip.1 zcat.1 \
		zdiff.1 zcmp.1 \
		zgrep.1 zegrep.1 \
		zgrep.1 zfgrep.1 \
		zmore.1 zless.1

LINKS+=		${BINDIR}/gzip ${BINDIR}/gunzip \
		${BINDIR}/gzip ${BINDIR}/gzcat \
		${BINDIR}/gzip ${BINDIR}/zcat \
		${BINDIR}/zdiff ${BINDIR}/zcmp \
		${BINDIR}/zgrep ${BINDIR}/zegrep \
		${BINDIR}/zgrep ${BINDIR}/zfgrep \
		${BINDIR}/zmore ${BINDIR}/zless
.endif

.include <bsd.prog.mk>
