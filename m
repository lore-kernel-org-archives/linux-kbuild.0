Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f172.google.com ([209.85.192.172]:34896 "EHLO
	mail-pf0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752020AbcDDAln (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 3 Apr 2016 20:41:43 -0400
Received: by mail-pf0-f172.google.com with SMTP id n1so27090264pfn.2
        for <linux-kbuild@vger.kernel.org>; Sun, 03 Apr 2016 17:41:43 -0700 (PDT)
Date: Sun, 3 Apr 2016 17:41:40 -0700
From: "C.J. Collier KF7BMP" <cjcollier@linuxfoundation.org>
Subject: Example 3 inclusion, Documentation/kbuild/modules.txt:250
Message-ID: <20160404004140.GA10001@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7ZAtKRhVyVSsbBD2"
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org


--7ZAtKRhVyVSsbBD2
Content-Type: multipart/mixed; boundary="mYCpIKhGyMATD0i+"
Content-Disposition: inline


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Michal and kbuild team,

I think I've spotted an error in the module KBuild / Makefile
documentation.  I believe that the first condition should be executed
only if KERNELRELEASE is unset, and the rest should be executed
unconditionally.  Let me know if I'm misreading it.

This patch is Copyright 2016 The Linux Foundation.

Cheers,

C.J. Collier
Release Engineer

--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="modules.txt_20160403T145432-0800.diff.asc"
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

diff --git a/Documentation/kbuild/modules.txt b/Documentation/kbuild/module=
s.txt
index 3fb39e0..1c79e82 100644
- --- a/Documentation/kbuild/modules.txt
+++ b/Documentation/kbuild/modules.txt
@@ -247,8 +247,8 @@ module 8123.ko, which is built from the following files:
 		ifneq ($(KERNELRELEASE),)
 		# kbuild part of makefile
 		include Kbuild
+		endif
=20
- -		else
 		# normal makefile
 		KDIR ?=3D /lib/modules/`uname -r`/build
=20
@@ -259,7 +259,6 @@ module 8123.ko, which is built from the following files:
 		genbin:
 			echo "X" > 8123_bin.o_shipped
=20
- -		endif
=20
 	Here the "Kbuild" file is included from the makefile. This
 	allows an older version of kbuild, which only knows of
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCgAGBQJXAZCwAAoJEMDbis1LPFKZc6wQAKezPVsxhhIoAZCcyiKNRtnR
pfiwP4Xv770zA+bHU9OplMNr6uGRUqLfnub5X5dNTawiUWS0AuKp8JiOFdXA2jJf
gHsq2PGM9+qsV4JWVQ1Qf9sZo1g9gHDO+c9OJNRR0YYk6pqY1vX8/hksXT7mjZmr
g4JcPyqf9W0wtzt5yL9mdBforU1b+5/5K9Im1JYZoilgcEW7ZlbVhes6p3PcYbGn
+5/8DIvzRcGheyMqh12NQ2D6DckTqZWl5yNAJK+N7iWfD3VdPB/R6ZVcYC7NGiuf
ZQMDi59KKSf5tXXLcQnTSt/kB7yRRuM2TYpV6UvlTFV73VVLFrP17YjmirvYovKJ
EQ1s8d1JXgRmh6BWX9sONtd6DuhFk99C2g2vpoTTn2lc0f1FAfICMIAiLd+FonL/
2lPiQVBbNavKbz137lVUUtJ2rKWHyM9l/Zz1gbpHvtkvIYaKqajoZUGQmTS3RHSC
55bb8Y+13/fkmRCBRsAnEtS3Do/OPRd0+6Keed0FhsKYG/BlWtRUs7NSb2uehKu0
Qge+QT3mZgpPI2pjm0tm+98Afb6DYOpS8m5zY7MV7xof4ZAJRsvPwrIOKDyJfvDx
1LRw/CxAUK8d+RN6hpWdU2q1oHoWTxoQYXDgRu0ikiOMmAunbxNEFuGfCd7Q0ils
4ksi0j2Hv+qx4PsgKCXl
=3DffMV
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--

--7ZAtKRhVyVSsbBD2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCgAGBQJXAbhDAAoJEMDbis1LPFKZd6UP/j9+w8Ls3wpUd2K3tSwmZNZD
GeTJUabFcFV3uYuWhRq8yumWcgTMbicGimLqBhFra8BkeT8KNT+pk1yKyT+LORgp
ug93rNjtygdB3HWFN/nElKlXexGpMdjHYLWPu5/gYA/tEGbxOFgLPG3Hr+fINpN2
yzy9xGrvsp2zuTQOxMo6tvv3fKYjygsasQc+hdrqYqD2hi8ro7B5bR6k9gUXJEHs
h3z2MWN3s3Ma18t0XEuljKQFLIqJOnDTiFVplkDg7+RcFWY89T9fPYkNX3jyFqe8
ycbRC2PBn/d4w4VtvH3u6z9I3ycbW6iPa9OWVr1It3oWA7CcdfpYqt7tZ0ZNqj1T
ghppUkVOl1V8j63eWyoc6faqZDyuDB654CEsPbSACvCCFfdkjGWoxqOPGe1ewrUE
N1eyEwVP571/COstdz/00EafAbIPpKtPzC4UZwLnzmvjhTZzGv32H5qEXoXzS2oy
f+/QqkeBbQ7acgBzGmE8TbThH6c6GCMEy6IaDGidd4FV189ZXJuTiALrW8YhwOaB
Oa/5ch8WHAUCxj7gcSCIC94rqEuZYs89NF2l85IvOqdcdS7u+5vOen9JrhE9qLrx
LaFQ2X51+ANJLjWkGyMtFoZ7FBk9LQBZdnNz8+fo/KBzUyHWZ8YGNYKWPEThi2/8
YT3JfdQq3w2vOPH+rNGL
=1sTm
-----END PGP SIGNATURE-----

--7ZAtKRhVyVSsbBD2--
