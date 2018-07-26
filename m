Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:59839 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728956AbeGZLhM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Jul 2018 07:37:12 -0400
Date: Thu, 26 Jul 2018 11:21:01 +0100
From: Ben Hutchings <ben@decadent.org.uk>
Message-ID: <20180726102101.GX14131@decadent.org.uk>
References: <20180726101934.GT14131@decadent.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kLdbqvpuLRxNeSq5"
Content-Disposition: inline
In-Reply-To: <20180726101934.GT14131@decadent.org.uk>
Subject: [PATCH 04/12] builddeb: Introduce functions to simplify kconfig
 tests in set_debarch
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: debian-kernel@lists.debian.org


--kLdbqvpuLRxNeSq5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

We now have many repetitive greps over the kernel config.  Refactor
them into functions.

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 scripts/package/mkdebian | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index f4449b575379..ada3c73d1493 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -6,6 +6,18 @@
=20
 set -e
=20
+is_enabled() {
+	grep -q "^CONFIG_$1=3Dy" $KCONFIG_CONFIG
+}
+
+if_enabled_echo() {
+	if is_enabled "$1"; then
+		echo -n "$2"
+	elif [ $# -ge 3 ]; then
+		echo -n "$3"
+	fi
+}
+
 set_debarch() {
 	if [ -n "$KBUILD_DEBARCH" ] ; then
 		debarch=3D"$KBUILD_DEBARCH"
@@ -23,22 +35,18 @@ set_debarch() {
 	s390*)
 		debarch=3Ds390x ;;
 	ppc*)
-		debarch=3D$(grep -q CPU_LITTLE_ENDIAN=3Dy $KCONFIG_CONFIG && echo ppc64e=
l || echo powerpc) ;;
+		debarch=3D$(if_enabled_echo CPU_LITTLE_ENDIAN ppc64el powerpc) ;;
 	parisc*)
 		debarch=3Dhppa ;;
 	mips*)
-		debarch=3Dmips$(grep -q CPU_LITTLE_ENDIAN=3Dy $KCONFIG_CONFIG && echo el=
 || true) ;;
+		debarch=3Dmips$(if_enabled_echo CPU_LITTLE_ENDIAN el) ;;
 	aarch64|arm64)
 		debarch=3Darm64 ;;
 	arm*)
-		if grep -q CONFIG_AEABI=3Dy $KCONFIG_CONFIG; then
-		    if grep -q CONFIG_VFP=3Dy $KCONFIG_CONFIG; then
-			debarch=3Darmhf
-		    else
-			debarch=3Darmel
-		    fi
+		if is_enabled AEABI; then
+			debarch=3Darm$(if_enabled_echo VFP hf el)
 		else
-		    debarch=3Darm
+			debarch=3Darm
 		fi
 		;;
 	*)


--kLdbqvpuLRxNeSq5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUBW1mgjOe/yOyVhhEJAQqxlA/+Mm8Jt2dj4Cd/3r9pl4qhDkhuUEuJQGVt
E1taUtErl8WfeztEiA00py0DPaBIiHj72wxV3hThbsNp5r5qqO60Dt8chmSJVqEZ
Mi++GcXCosLELBi/hfbq9u/QO7snA0n3+QNwreh+fhjDx0a15ghucdmXTDNyKgRk
jGll9FEvyVy/cREa4//X2sO6SgGW+mh0oDJqIVZtQ8UkDRTe74lTChWjxRFkooEL
BBTloygrrHPywdVo/IwbTT0rvwg8Bsaxa2F23I+T5pqCVbyawrfavvGhhxA0sxW6
i8hMXSKE4jN55BRF7VYrcJgA/T4SaLX8VxqYwGqHDQA86wb12My6tyVjKANfJe17
H5nTednV2je+FXmxhf4aTYP8zQKCw9G1V9eAV9AbBjETecZj7TPaNO5gnUqGSSuH
SA4x71qpYZo09+WDMkZtxhIZXESbnYf7rp1RUZ5up8Cj5JVlvNE0PuS/wEePSec9
NL9rUj4lUNtHQsH8y+Or5uoqvVANLHywJmSsezmR4dZAME/YzZCKJuvABLFQChEc
7HkiyYB0FCsj+YWtJKxu/vZz3Lx21JHXgfQnO58Qu6Wg92ork4DWi2vwIysdot3O
pVAeNogWTWIYD4idYs5CCIRx3EK1aggczPHE9KSXL8ZGFXzk6QzZsTQa2GzTw1T3
hQ8pNgmTEks=
=BukG
-----END PGP SIGNATURE-----

--kLdbqvpuLRxNeSq5--
