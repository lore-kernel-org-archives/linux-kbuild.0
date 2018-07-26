Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:59835 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728956AbeGZLhG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Jul 2018 07:37:06 -0400
Date: Thu, 26 Jul 2018 11:20:54 +0100
From: Ben Hutchings <ben@decadent.org.uk>
Message-ID: <20180726102053.GW14131@decadent.org.uk>
References: <20180726101934.GT14131@decadent.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qxpYSgLynlcP4boX"
Content-Disposition: inline
In-Reply-To: <20180726101934.GT14131@decadent.org.uk>
Subject: [PATCH 03/12] builddeb: Drop check for 32-bit s390
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: debian-kernel@lists.debian.org


--qxpYSgLynlcP4boX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

s390 now only supports 64-bit configurations.

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 scripts/package/mkdebian | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 389bf983879d..f4449b575379 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -21,7 +21,7 @@ set_debarch() {
 	sparc*)
 		debarch=sparc ;;
 	s390*)
-		debarch=s390$(grep -q CONFIG_64BIT=y $KCONFIG_CONFIG && echo x || true) ;;
+		debarch=s390x ;;
 	ppc*)
 		debarch=$(grep -q CPU_LITTLE_ENDIAN=y $KCONFIG_CONFIG && echo ppc64el || echo powerpc) ;;
 	parisc*)


--qxpYSgLynlcP4boX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUBW1mghee/yOyVhhEJAQoe1A/+NahcROJfGJ5Py/LN199qiUh4dmjICh3q
U3Og5UdQjqAr9asbRSb+9lqTd6jPZkUvX+5G8QLeI7kiwF+QABchKmtjrQ1O+LQt
XEm6ofc+36s/FA7PPqlnxjmnYI/sph2WRp7tzVYQgw0xS9bDpCFYOovY5jEkdCIV
RGVkOwbwcj+M3IQlwBjpneMYxfvKRUFS9lH/P0Me73rdenau4/cb2T/5fFmkR3Mv
GdMIGka09c05jn628Y1PvXe0jZEJ76TgJC0H6p0FwEBtpX+w9PE3p4xVgKvjEO3H
3kGLjBqlpJLDsWFvqEttMRSCMYGr1ePSqwCbpPM4bSBcz9aoe5Kj/nrbJuFFiCYQ
5YAe2ReAyCq9TLazyWRSCKyWJUij+aHv4i/upspzl1JuQpziQysEl7AT1ixdYx53
ZIH2Cfy/UV94CBbhlrYH71KXF0koTi9Ujq+Uj8xVA7Ly8WNz7P2jb0FMoftPO15y
4vDiYSbPUX68Funwxn97qdDX6/bhbZkxZa8wqOJAiwI+aaHHxo5GpZyx0VE93QMN
zaSKYRJ7oZMaP9Ab2qZ8MJ7uFqIjXouEEfiPRlLl/t1wlKtDQd1pU4MnK+yB6SMh
Ho7XqdKngAob9I+C4YrYeFQpGLqm7oF3fSgkwS5N4IFkVWfjavU4nQ1OX/Pkku7l
Dz6Xy34eHZc=
=kwkB
-----END PGP SIGNATURE-----

--qxpYSgLynlcP4boX--
