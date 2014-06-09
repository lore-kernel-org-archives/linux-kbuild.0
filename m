Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:41718 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753604AbaFIAVp (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 8 Jun 2014 20:21:45 -0400
Message-ID: <1402273294.23860.59.camel@deadeye.wl.decadent.org.uk>
Subject: [PATCH v2 1/2] deb-pkg: Add automatic support for armhf architecture
From: Ben Hutchings <ben@decadent.org.uk>
Date: Mon, 09 Jun 2014 01:21:34 +0100
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-gPsj7cJs4u/hQyAlI22y"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>
Cc: maximilian attems <max@stro.at>, Michal Marek <mmarek@suse.cz>, Fathi Boudra <fathi.boudra@linaro.org>, debian-arm@lists.debian.org, Hector Oron <hector.oron@gmail.com>


--=-gPsj7cJs4u/hQyAlI22y
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The Debian armhf architecture uses the ARM EABI hard-float variant,
whereas armel uses the soft-float variant.  Although the kernel
doesn't use FP itself, CONFIG_VFP must be enabled to support
hard-float userland and will probably be disabled when supporting a
soft-float userland.  So set the architecture to armhf by default when
CONFIG_AEABI and CONFIG_VFP are both enabled.

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
v2: rebased

After discussion with Hector, we agreed this would be a worthwhile
change.  Hector may later improve this by using gcc specs.

Ben.

 scripts/package/builddeb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index f46e4dd..6756ed6 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -43,7 +43,16 @@ create_package() {
 	mips*)
 		debarch=3Dmips$(grep -q CPU_LITTLE_ENDIAN=3Dy $KCONFIG_CONFIG && echo el=
 || true) ;;
 	arm*)
-		debarch=3Darm$(grep -q CONFIG_AEABI=3Dy $KCONFIG_CONFIG && echo el || tr=
ue) ;;
+		if grep -q CONFIG_AEABI=3Dy $KCONFIG_CONFIG; then
+		    if grep -q CONFIG_VFP=3Dy $KCONFIG_CONFIG; then
+			debarch=3Darmhf
+		    else
+			debarch=3Darmel
+		    fi
+		else
+		    debarch=3Darm
+		fi
+		;;
 	*)
 		echo "" >&2
 		echo "** ** **  WARNING  ** ** **" >&2


--=20
Ben Hutchings
One of the nice things about standards is that there are so many of them.

--=-gPsj7cJs4u/hQyAlI22y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIVAwUAU5T+Eue/yOyVhhEJAQopyg//TXg7IojvvXdgy8+4jYIA2Pk7z0QRV2AE
dFEwIprkbJ0imtGf+xIO0wlMXn5LniO3llcDQvYnXOyfyxw788e5AT61aAkGro6Y
MPAd60j4ahMuAdGsnhhgi/ZJA13w2pxN30UGb0NGX0u8fNNAf8lg/gEilPWyXQZ8
UONE1NWVyYDvxrh1f/OImmOFePWcJZoeYk01TtnbplLiUYbUgzc8s+yEOZ51zW3F
aR3Ty40SxE0eM2f6ZOPgTX8wCIC7k6y9LmZcT21xDqR1pFGDj8XPed48P+Npdm+P
vdKsaYXxMhFQqC+O0h1D/VPLF9uNAlF/Ja+tw0FVM5IAAdADTuWSDm5ewP55j+zY
DvXJpRzyefbzFHHCtz8R37SO8ytOHWswOtEp/rXeBvw/n+gohZ3S84sHozC8rQ5V
QbvEX8imgFF7jfMA+l1EdDYv/kfuBZ9Z1gRGwvz8uBHHgJO2+5o1VBB0pffHl1mf
NVZ3doHY9NaCuEvF5HLlyVflkgmDREKBBY/IUD5thIq2mz3uJug3x1JZoH+VSITD
lXbkZpDHDbhxEn42ZTesA2rWj9jgLrx5NCwxgJdo2LQ78tD33kb2L/kmREM5YmL2
F1hTrSRiUreDyXMai6f9+pnJ3yP2hQTK+GNEwxYGLud5/fopd4CHOcUKrxms1C68
EHhPgs4mDBA=
=xnyl
-----END PGP SIGNATURE-----

--=-gPsj7cJs4u/hQyAlI22y--
