Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:59827 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728956AbeGZLgl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Jul 2018 07:36:41 -0400
Date: Thu, 26 Jul 2018 11:20:28 +0100
From: Ben Hutchings <ben@decadent.org.uk>
Message-ID: <20180726102028.GU14131@decadent.org.uk>
References: <20180726101934.GT14131@decadent.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="twKjCw1/F6C/WBH6"
Content-Disposition: inline
In-Reply-To: <20180726101934.GT14131@decadent.org.uk>
Subject: [PATCH 01/12] builddeb: Skip architecture detection when
 KBUILD_DEBARCH is set
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: debian-kernel@lists.debian.org


--twKjCw1/F6C/WBH6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

If KBUILD_DEBARCH is set then we will not use the result of
architecture detection, and we may also warn unnecessarily.
Move the check for KBUILD_DEBARCH further up to avoid this.

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 scripts/package/mkdebian | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 985d72d1ab34..434f0b4d5231 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -7,6 +7,11 @@
 set -e
=20
 set_debarch() {
+	if [ -n "$KBUILD_DEBARCH" ] ; then
+		debarch=3D"$KBUILD_DEBARCH"
+		return
+	fi
+
 	# Attempt to find the correct Debian architecture
 	case "$UTS_MACHINE" in
 	i386|ia64|alpha)
@@ -46,10 +51,8 @@ set_debarch() {
 		echo "Falling back to using your current userspace instead!" >&2
 		echo "Please add support for $UTS_MACHINE to ${0} ..." >&2
 		echo "" >&2
+		;;
 	esac
-	if [ -n "$KBUILD_DEBARCH" ] ; then
-		debarch=3D"$KBUILD_DEBARCH"
-	fi
 }
=20
 # Some variables and settings used throughout the script


--twKjCw1/F6C/WBH6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUBW1mgbOe/yOyVhhEJAQo51w/9HSVq4w9ND3G+RIqQ/7WVncKIQJJJHQ3/
BIPjN0aZ1NA5WacD2SD75wcrDenxoK6Y4iOpmWdLKbzghoNsoyMBD0WxBTVqUeKe
srE4RI9KETHyyTMs8vmwIHnb4ZvRQcEq2KU4dG8BFTUUk/HHT+bPo0/B1IT29uoQ
L2AscvFbJdO7GZtwW0XCud3FM0rDg0cmrD8bFeiAkWubSvq6Lyty7vCTyKRXQ/2e
PKS0uPBtLubkzzRoc8eaTEsJMOciFa1iQeeIEMxkf9F1mb4or5JZRfxgus8OY83m
N+MOjSlMMhpa9TtOQNxunlMaiAKR2333cnyBHoSpIBW1BelaLwQwW/kpBmyqOOtU
E+JQwzsz6xCOWsNlG4B8iirTZdj3TYtoU9yZ2RQAjQFhWyts7DWLVygivxkcCRZH
Nu8RFP9eG3ouWPU4ICHHBstDvZ2+7717kJjrMBsgNF1JwY0VOujNEvTzU6/0XFz3
6Xrr2iMM6ehDDiCV0m7n2Z/8pjuzpGf+qgWRa1D/lE3zNWCNnKR238014MKymosm
9NUkeU0g++vd4RC8zcV6KUE6zu1XMeXMpPCDT5jbDyFpTZLz2bTcQ2CrF6UOqEcR
i67CiRJCOcltJWE5sXrNTSkRz87qkncslm4p2FyYhJSLMu6J3kzyQvSq1tbglkgu
xabsEcypKT4=
=3426
-----END PGP SIGNATURE-----

--twKjCw1/F6C/WBH6--
