Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:34166 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752781Ab3LEOjO (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 5 Dec 2013 09:39:14 -0500
Message-ID: <1386254351.3000.22.camel@deadeye.wl.decadent.org.uk>
Subject: [PATCH 2/2] deb-pkg: Fix building for MIPS big-endian or ARM OABI
From: Ben Hutchings <ben@decadent.org.uk>
Date: Thu, 05 Dec 2013 14:39:11 +0000
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-4wB5zaP0tN3yVQa+rQfe"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Debian kernel maintainers <debian-kernel@lists.debian.org>


--=-4wB5zaP0tN3yVQa+rQfe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

These commands will mysteriously fail:

$ make ARCH=3Darm versatile_defconfig
[...]
$ make ARCH=3Darm deb-pkg
[...]
make[1]: *** [deb-pkg] Error 1
make: *** [deb-pkg] Error 2

The Debian architecture selection for these kernel architectures does
'grep FOO=3Dy $KCONFIG_CONFIG && echo bar', and after 'set -e' this
aborts the script if grep does not find the given config symbol.

Fixes: 10f26fa64200 ('build, deb-pkg: select userland architecture based on=
 UTS_MACHINE')
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 scripts/package/builddeb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 301acdc..c1bb9be 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -41,9 +41,9 @@ create_package() {
 	parisc*)
 		debarch=3Dhppa ;;
 	mips*)
-		debarch=3Dmips$(grep -q CPU_LITTLE_ENDIAN=3Dy $KCONFIG_CONFIG && echo el=
) ;;
+		debarch=3Dmips$(grep -q CPU_LITTLE_ENDIAN=3Dy $KCONFIG_CONFIG && echo el=
 || true) ;;
 	arm*)
-		debarch=3Darm$(grep -q CONFIG_AEABI=3Dy $KCONFIG_CONFIG && echo el) ;;
+		debarch=3Darm$(grep -q CONFIG_AEABI=3Dy $KCONFIG_CONFIG && echo el || tr=
ue) ;;
 	*)
 		echo "" >&2
 		echo "** ** **  WARNING  ** ** **" >&2

--=20
Ben Hutchings
Knowledge is power.  France is bacon.

--=-4wB5zaP0tN3yVQa+rQfe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIVAwUAUqCQD+e/yOyVhhEJAQrzqQ//bSHu9Al7RufgtVAqHHrrRqlV0dPR68PQ
EgOlUIH7o/2sxo+e5h+mJ71dJnzID0WLLW/GJLWW+QxnU7V/I9MGPb4TdgyEvptb
6plv+KgWHWfimM/+tj7lCZMj7Vun6MGPImXAbd4Qj7rsm/Vm5NYtcFyKwOwU/2jS
cL0m0DDX/hAtUwyRoELMUsbm9RGtR28psP7QD90k8l6M1ViGCxnXXg31ys+Mhphr
BxC9aQtTnUpEZ6rRZLKphAw5BfT8b+t2TmW65+9KU22jt+XgNtl/p6oD9enhrppW
arp/lyxhjiTaScTM6vjURPf6jXcHpVnwShmbJPXA9bsz01ZEyCnnVYGt2i8JtZtg
dc49ulgptk7nR4GFL1yebVtUqNxyZp4uslm8aPMcKD4YZL7osul/Ub6In4SXPJ0T
D8pyMN7n2q+/lAMU05sWmzV8xN0CxuKzu2EoEG7ORUON7V1BhJdJDhZWxRyjUzfi
fpbeJ5l85VjPReqFsqJR+WpDp8/L01oIGYKK4OyXrdF8WGmVaEJL9Bgkd6sHQpug
zBA32x/DURM2J35lzAOeTZ5ciu7hweI5siEOqUtl1PaScCKG15c+mvgRQjM09CSm
TRJ/A4KLki1UscKZk5Te2grqLQRJyCwy1hIxZlxOaZhs2w095QAKIHM/zzHMM4NA
vXxPR8oAwEY=
=dmoK
-----END PGP SIGNATURE-----

--=-4wB5zaP0tN3yVQa+rQfe--
