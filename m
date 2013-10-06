Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:50574 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751203Ab3JFRFR (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 6 Oct 2013 13:05:17 -0400
Message-ID: <1381079114.2788.26.camel@deadeye.wl.decadent.org.uk>
Subject: [PATCH 2/2] deb-pkg: Add automatic support for s390x architecture
From: Ben Hutchings <ben@decadent.org.uk>
Date: Sun, 06 Oct 2013 18:05:14 +0100
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-XWenwoVHp5uKclUa50YW"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>
Cc: maximilian attems <max@stro.at>, Michal Marek <mmarek@suse.cz>, debian-s390@lists.debian.org


--=-XWenwoVHp5uKclUa50YW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The Debian s390x architecture has 64-bit userland whereas s390 has
32-bit userland.  A 64-bit kernel can be used with either.  Now that
Debian supports multiarch and officially supports s390x, it makes more
sense to assign a 64-bit kernel package to s390x.

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 scripts/package/builddeb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index e14c56e..25c5abd 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -35,7 +35,7 @@ create_package() {
 	sparc*)
 		debarch=3Dsparc ;;
 	s390*)
-		debarch=3Ds390 ;;
+		debarch=3Ds390$(grep -q CONFIG_64BIT=3Dy $KCONFIG_CONFIG && echo x) ;;
 	ppc*)
 		debarch=3Dpowerpc ;;
 	parisc*)

--=20
Ben Hutchings
Who are all these weirdos? - David Bowie, reading IRC for the first time

--=-XWenwoVHp5uKclUa50YW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIVAwUAUlGYSue/yOyVhhEJAQrsQg//aT0xrtzImoAM5rq4h9BEHlhwKQrfRWlR
oYxevOEsqBC/7nBEfqoUkOIGc+xIEgXh9nktx9y2atf8OSba7uepMvp/MlxvFtlj
FvNs8Zuu20whBso8EY5q3FiClenpu3XBcm4EKVCs/J3kp3qyOH1xTpJR1/6UqXQ6
7MTM2XgOVkF0mIJLBMKWYV1cmu/q0VDSim7pe8zqRZAjEkQkqnfw0dt+kSoF7PdM
joKZo9xQ5Knu6ARJB6aqckRJ0RUt7xMX67yP9dZIKL4WB8lot7J+aLEB0cU5KibY
HHKbZOOCzhwAqYAosJE62AVgIK5X1C6GA5OR3/eMuM88eretneepZAh8nkDXbHtd
KO5S/RN4aT408d7baF/C+znPrfDz2eSTcIXhHu+NKvKT3PBHEEvZvtMaMobtZV7r
E1X7+pZKT1gtR4ydi8zfl7Y/Vg8UTXel15iqOIAKr0fUmT2wy3NIn9vuqZHMuiU+
sVnG8mGzGP70unyLL9zf9vbqh8rj+zp8NcNSktqPzc63MA9TPxABkSee/xVqvfmU
NYr0R21PgnVWd0dfS4kaPD3qKOGoI8sfZ9iSIgJteiefBxgKLegbdwl9WiGVmGN5
+QbJtq4A6S7wyurSCd3+S3n8hgXbKNDtxYHVKFbX5NvqtLdvq8h1iu4c/JLk5BsU
bgN31lSWlsk=
=RF13
-----END PGP SIGNATURE-----

--=-XWenwoVHp5uKclUa50YW--
