Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:59856 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728956AbeGZLic (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Jul 2018 07:38:32 -0400
Date: Thu, 26 Jul 2018 11:22:20 +0100
From: Ben Hutchings <ben@decadent.org.uk>
Message-ID: <20180726102220.GA14131@decadent.org.uk>
References: <20180726101934.GT14131@decadent.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zYtRAvLPyLojxZ7Y"
Content-Disposition: inline
In-Reply-To: <20180726101934.GT14131@decadent.org.uk>
Subject: [PATCH 07/12] builddeb: Add automatic support for mips{,64}r6{,el}
 architectures
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: debian-kernel@lists.debian.org


--zYtRAvLPyLojxZ7Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

MIPS R6 is not fully backward-compatible, so Debian has separate
architecture names for userland built for R6.  Label kernel
packages accordingly.

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 scripts/package/mkdebian | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 350724cdc5af..595482923844 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -45,7 +45,9 @@ set_debarch() {
 		debarch=hppa ;;
 	mips*)
 		if is_enabled CPU_LITTLE_ENDIAN; then
-			debarch=mips$(if_enabled_echo 64BIT 64)el
+			debarch=mips$(if_enabled_echo 64BIT 64)$(if_enabled_echo CPU_MIPSR6 r6)el
+		elif is_enabled CPU_MIPSR6; then
+			debarch=mips$(if_enabled_echo 64BIT 64)r6
 		else
 			debarch=mips
 		fi


--zYtRAvLPyLojxZ7Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUBW1mg3Oe/yOyVhhEJAQoAVQ//eFP5Z3wFqiTu1ragSQl7TjMY/YbZVDXf
jG5qlv68JXSWBtVHEXzVvO9ubxunDLhvjb6dgFGXzivCRi2Sf8opQ04ccP/c4+1c
mzW73t9oTfPWXPAj0IdK1kdBLOtnqKRrvmksH+jGj/jMwF/koHsmt9+PtnfOO6yz
YCQ09NyMhZaJFM+u8uq1bmsVfF5VwRyuVjEIKjvpG8NfFwfEZZNWG0+zAOk730/j
ViFNnmPfP1ld+tIj/SSDM5TxUuX8fhewqVSQ3v+o+dS0pejyYv1KlQ7ktqePj3W9
gBKCPo8aTNrzxUmYEE69DQ1sIW5VQtLD2XFXZsgUCxUZOhu7FK8x+1MzWRarTqim
fTuMaGxZyJ1/YjBeNDUTkqLEIOk3yfWiqiIkFDViDUZ9yhKJbwEYsA/LCxi/93j5
oGejwZZv2nbKOPEKYKUWR9lb15SWaAqs53+BJQLq2uEXUvK6Znxyz5+SFoe+yUuE
X5A6qsrvfg7B893FxI6HhdpIdnW5hnLpW8RdYJoumTTXlJOQ/8N4UZJ5wMtRfomX
mOMztqcPaFl0LGe3CYQrM+qjYvca/TEhewHIryeobv8qqZdST/NRUY/Pubk/Q5RU
Sv/rvQVd6cbspV/tD9P1xL8bPrUM5BM8ongjg5xHTIfowFZk1QKQJnTspklNQSiO
tJXNapko/jA=
=eha/
-----END PGP SIGNATURE-----

--zYtRAvLPyLojxZ7Y--
