Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:59866 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729254AbeGZLix (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Jul 2018 07:38:53 -0400
Date: Thu, 26 Jul 2018 11:22:42 +0100
From: Ben Hutchings <ben@decadent.org.uk>
Message-ID: <20180726102242.GD14131@decadent.org.uk>
References: <20180726101934.GT14131@decadent.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="owW5Nhvu5w1mI38U"
Content-Disposition: inline
In-Reply-To: <20180726101934.GT14131@decadent.org.uk>
Subject: [PATCH 10/12] builddeb: Add automatic support for m68k architecture
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: debian-kernel@lists.debian.org


--owW5Nhvu5w1mI38U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 scripts/package/mkdebian | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index fb0d3056f3e2..470899fa3a8c 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -26,7 +26,7 @@ set_debarch() {
=20
 	# Attempt to find the correct Debian architecture
 	case "$UTS_MACHINE" in
-	i386|ia64|alpha)
+	i386|ia64|alpha|m68k)
 		debarch=3D"$UTS_MACHINE" ;;
 	x86_64)
 		debarch=3Damd64 ;;


--owW5Nhvu5w1mI38U
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUBW1mg8ee/yOyVhhEJAQryWA/8D5z7ZwQL65iU3wcOICoCKQP7b/nuV10F
dXZ0JFpdbBb1ubG94SlhLQRJ4zB/NbVxwQehwWkqThWBhhc6saiH/y7mtUOqmItH
cw/WIyKPwzLYguhJWODq3+zfUvXWATqTphXX2VkTjWLeZOYWK58XTai85gBRVB2w
LEtEl6SE9IfUJDxPmAMqiPqmR6n5W/OZx5Fe2qN2IFtoJtigzh+yMfkSG8yFR6YB
3Y1HwCCy8oiBwYU8/nzSUJ6G6cYDNjJWlaOUHwUMbgaM5H34Es9OcOiqJhsUr2oP
E209OyWW1iqa+n6kTHcDO8HvW5BbyWq+2imqtZh73h9bsUUIpP5se2VckSLwl3Ot
nHwtQHnn6f+6Id0I135BgewmAPzmCs9pCOivn6amJw1lkobpfP9dY2e+88bYuPau
MgjxDWKZe+BrGFRYXTJwveZHsU0Wyut9xiEzdrqR9GyA/cjYOh0g5h9/890IYZ9l
ly+mzeqMXLwY1jVgUZ3ttOE1rOv+3jo9yw5db7EmcfuttVPJwUhfc2FPfMKaB+c7
H6FE0qlCEla7MH0Cq5QevEW9UcnPqpHLSt6c6n7650iJRy3iMZ1R3XKjygUGedIO
Ui4IJ8VZa5/iNmL0FndLdwk0bT7/BFAF+9lURZyK5RrIMlRQDHZc/UFSgEYujGty
6SrSbutGGUE=
=UOIH
-----END PGP SIGNATURE-----

--owW5Nhvu5w1mI38U--
