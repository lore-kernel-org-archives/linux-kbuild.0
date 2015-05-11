Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:49416 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751561AbbEKBRJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 10 May 2015 21:17:09 -0400
Message-ID: <1431307012.6033.9.camel@decadent.org.uk>
Subject: [RFC PATCH] kbuild: Enable Large File Support for hostprogs
From: Ben Hutchings <ben@decadent.org.uk>
Date: Mon, 11 May 2015 02:16:52 +0100
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-nAseEg9/crzAI65aD2DT"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: 778942@bugs.debian.org


--=-nAseEg9/crzAI65aD2DT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Some programs built on a 32-bit host need Large File Support (LFS).
Regardless of whether any of them need to deal with large files,
non-LFS *stat() functions don't work at all on an XFS volume with
64-bit inodes.

References: https://bugs.debian.org/778942
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index fbd43bf..a6fb432 100644
--- a/Makefile
+++ b/Makefile
@@ -297,7 +297,7 @@ CONFIG_SHELL :=3D $(shell if [ -x "$$BASH" ]; then echo=
 $$BASH; \
=20
 HOSTCC       =3D gcc
 HOSTCXX      =3D g++
-HOSTCFLAGS   =3D -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit=
-frame-pointer -std=3Dgnu89
+HOSTCFLAGS   =3D -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit=
-frame-pointer -std=3Dgnu89 -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64
 HOSTCXXFLAGS =3D -O2
=20
 ifeq ($(shell $(HOSTCC) -v 2>&1 | grep -c "clang version"), 1)

--=20
Ben Hutchings
For every action, there is an equal and opposite criticism. - Harrison

--=-nAseEg9/crzAI65aD2DT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUAVVADDue/yOyVhhEJAQrStQ/+Pc/xT99y2Qq3Gxk6tNoQ7+a/YD0MHwdY
z8L569Jal/x32AVv+dO77jSxqqSmnjbPRc6Muh6doUALz9O3Zd2mfE7fou5Ca8/L
9sF+WKguww+eG17mqAdsk22Id8AnKTMLg9xipYwVBWu+DpDN8sg0tkKRQE8zvjam
SWgCGHLpLQOAWjTjYPAACsdk/hLI2jC6NCWe4pnLSyoi6qs1HFBTsx0pZa5WQcAO
aGJ9boCUUjhvWqhYu7nWuAzvSTD0XdVAY0qyKghrV3vwbQIU+doU20Iti5Cr96tJ
YXMfS1Zms58A0Ud2kR7RgvIUnLTPrBdeJzt3wdXqMitwIdO8pCe69eYkTze5RL+R
ny/yp/Mlrt0PWsN/KmmcNGTa5OqHFnoApqThOV5aPhzdaHPWTgPKQEyMCOCoBQDJ
xnzFXv7TqvXn1oWPku1dpCijRjnxW1yLi9gBmWVeFRbQONCfw56m+VjPCTalSLgF
eRIz42r+BnO5n/sMZFfSGF87TC5hYF/npf0FiUsuE9T95F/6WZTbyzUZAO/TGYqK
PJ1Coz49WiJ6z7jeUYzsfzETTw5K9qL7WQtuRZlCKsexnyQZH2TLTKCQW77h/AGe
8DzoGjU9KM2CkNLwi+WvF9vADkCJ4lt/gN1Na3ORU4mwe8CVSExDzMSsOTpBcPlH
oEZPFWH8JYY=
=Cp8h
-----END PGP SIGNATURE-----

--=-nAseEg9/crzAI65aD2DT--
