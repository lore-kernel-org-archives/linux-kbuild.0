Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:59870 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729254AbeGZLi7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Jul 2018 07:38:59 -0400
Date: Thu, 26 Jul 2018 11:22:47 +0100
From: Ben Hutchings <ben@decadent.org.uk>
Message-ID: <20180726102247.GE14131@decadent.org.uk>
References: <20180726101934.GT14131@decadent.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="B3XPdYri2NuANWBV"
Content-Disposition: inline
In-Reply-To: <20180726101934.GT14131@decadent.org.uk>
Subject: [PATCH 11/12] builddeb: Add automatic support for riscv*
 architectures
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: debian-kernel@lists.debian.org


--B3XPdYri2NuANWBV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Debian currently only defines "riscv64", but it seems safe to assume
that any 32-bit port will now be called "riscv32", also matching
$UTS_MACHINE.

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 scripts/package/mkdebian | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 470899fa3a8c..3ef2fd0c5086 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -26,7 +26,7 @@ set_debarch() {
=20
 	# Attempt to find the correct Debian architecture
 	case "$UTS_MACHINE" in
-	i386|ia64|alpha|m68k)
+	i386|ia64|alpha|m68k|riscv*)
 		debarch=3D"$UTS_MACHINE" ;;
 	x86_64)
 		debarch=3Damd64 ;;


--B3XPdYri2NuANWBV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUBW1mg9+e/yOyVhhEJAQoZexAAhWbaesS7b0+lhZWMP4RyM5vMzfFrNu1p
spOaqKRaao0thzzlvfVDOBQ/syS3fllWBQjF4d11uDVqxWAB2reZwzStr5sSr2Tm
2uMSShw0sDFYu7TD7f+REEVZwN9hgBEnWmosdw6Q7yfTiG4WVTJi9jOj0a7aX2aw
uzDR1nY3t6P8QJwMtysqXlZ6npxgNjZLDZUQmwvTB6MgGRk0dYv98MDLbTAEI6zU
O3ovrxVfMVqd6kx9DspB4nnQ4+/QQ4HV1HlUj7iywP3kaPW+vXbffm93VIgMrhUP
EyUnyo2yFGgwCAaAjLK3lF+kMyzLoxeF9HGi/H6E6swIxZHxv4q5sUtQGfvo64Eq
limnrIRC58g8JBMdNU0qWe3Wj6cGNLfr0AfUC1UvOLO+mjTpixFsNbkC9pCTs+de
owHLe0Y7LbSO3k/caroTxgMVTFDrzrR5SYfeXQZ/vsWIgF4zvx6DBiMCijZGtgha
PNFrcTHLdpHSEEbgyZrNEje7WJ0+jvD3g8zR+8MVHqTmlS9jZY9b3VdjGcT69hyt
4LxZ28CynSeOIEewqU9CwvW87nyu/ccgvEaxV74Y+P8DV7+v/eEwomwz1jA76ki8
3Y+d4ZoVaRXE7hruMikLckEbhqcC5f4973kucxf8H5FlHBIyfhgv026VLw7odUsV
2KBF5gJs1/Q=
=QK0z
-----END PGP SIGNATURE-----

--B3XPdYri2NuANWBV--
