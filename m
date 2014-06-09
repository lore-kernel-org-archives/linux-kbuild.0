Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:41727 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753098AbaFIAY3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 8 Jun 2014 20:24:29 -0400
Message-ID: <1402273462.23860.62.camel@deadeye.wl.decadent.org.uk>
Subject: [PATCH v2 2/2] deb-pkg: Add automatic support for s390x architecture
From: Ben Hutchings <ben@decadent.org.uk>
Date: Mon, 09 Jun 2014 01:24:22 +0100
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Tdy7dvw9O3fmetmGumez"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>
Cc: maximilian attems <max@stro.at>, Michal Marek <mmarek@suse.cz>, debian-s390@lists.debian.org, Stephen Powell <zlinuxman@wowway.com>, 750925@bugs.debian.org


--=-Tdy7dvw9O3fmetmGumez
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The Debian s390x architecture has 64-bit userland whereas s390 has
32-bit userland.  A 64-bit kernel can be used with either.  Now that
Debian supports multiarch and officially supports s390x, it makes more
sense to assign a 64-bit kernel package to s390x.

Reported-by: Stephen Powell <zlinuxman@wowway.com>
References: https://bugs.debian.org/750925
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
v2: - add bug reference, since Stephen also found this
    - add '|| true', as in recent fixes for other architectures

 scripts/package/builddeb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 6756ed6..8db6dbd 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -35,7 +35,7 @@ create_package() {
 	sparc*)
 		debarch=3Dsparc ;;
 	s390*)
-		debarch=3Ds390 ;;
+		debarch=3Ds390$(grep -q CONFIG_64BIT=3Dy $KCONFIG_CONFIG && echo x || tr=
ue) ;;
 	ppc*)
 		debarch=3Dpowerpc ;;
 	parisc*)

--=20
Ben Hutchings
One of the nice things about standards is that there are so many of them.

--=-Tdy7dvw9O3fmetmGumez
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIVAwUAU5T+t+e/yOyVhhEJAQrrog//fLR7rPQPsCOReM8zm9NSDE3PW9mdOYw2
Dz7C/zAFn6+iyUHr8qGXLBbI0wO1QUc6FipqXr2/i4HJiymekzMyP6Ay2vPNb1cs
hAx93JupMezKXg/+ZfL5YjIu8WRe0iPNHkXQOs5Um4rphdsB6d/TQsYwLS8vf4xm
3BgRqVU1lOmJ6x55FmnDjKmwKASuqyS+Oy1FcgIXslraDm5VqHxCkcXG37o6diIU
kUNtId3Ey6laoFD+qsPXkhjafZBCPIW5wxWnUAURDhEN2KXh2b0RrKZ4DD/b2X6s
o6fPKx1eCvsn0XhmXx4oN6koOMKaKcrFFY3ss0ZgTb2NNsGiBUi5pO6Iwo1vEUqP
qkNAVWmzeeU8s42lMzGmKUr0bRZxQtM2OdgtZnk7O5cNidNf+/iP64V0iqlI8ULw
readywKq/ozzg1bFRxinkOJd+em7OpO37tfXkyFEUuvD9Amq992pGvW+ZRYb2GUW
KLY/xH6asTSyej6F00a6Ewpn6mcJ3BsNkA7OylozSHiHdao/goyyw7sTEJNBFBNn
ts6/54jQ1dXZfXABtGu9/DscEaM6WX9dNBYDl7wbICdan/A947dxoiWlmah0oDlo
HdlQoF62cX6vgiBcQ4vmtANC+otoerMzRaamjiCOZsOvxghb1izJ1XW3POGTvoHO
m6kGwPPQi4Y=
=GapZ
-----END PGP SIGNATURE-----

--=-Tdy7dvw9O3fmetmGumez--
