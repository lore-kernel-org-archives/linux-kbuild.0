Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:36461 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754027AbbI1Bew (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 27 Sep 2015 21:34:52 -0400
Message-ID: <1443404080.2517.30.camel@decadent.org.uk>
Subject: [PATCH v3] deb-pkg: Add automatic support for armhf architecture
From: Ben Hutchings <ben@decadent.org.uk>
Date: Mon, 28 Sep 2015 02:34:40 +0100
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-HDTwrQJUbQKPMuhUPHOp"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>
Cc: maximilian attems <max@stro.at>, Michal Marek <mmarek@suse.cz>, Fathi Boudra <fathi.boudra@linaro.org>, debian-arm@lists.debian.org, Hector Oron <hector.oron@gmail.com>, Ian Campbell <ijc@hellion.org.uk>, Riku Voipio <riku.voipio@iki.fi>


--=-HDTwrQJUbQKPMuhUPHOp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The Debian armhf architecture uses the ARM EABI hard-float variant,
whereas armel uses the soft-float variant.  Although the kernel
doesn't use FP itself, CONFIG_VFP must be enabled to support
hard-float userland and will probably be disabled when supporting a
soft-float userland.  So set the architecture to armhf by default when
CONFIG_AEABI and CONFIG_VFP are both enabled.

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
Acked-by: Ian Campbell <ijc@hellion.org.uk>
Acked-by: Fathi Boudra <fathi.boudra@linaro.org>
---
v2: rebased
v3: rebased

 scripts/package/builddeb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -52,7 +52,16 @@ set_debarch() {
 	arm64)
 		debarch=3Darm64 ;;
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
 		debarch=3D$(dpkg --print-architecture)
 		echo "" >&2
--=20
Ben Hutchings
All extremists should be taken out and shot.
--=-HDTwrQJUbQKPMuhUPHOp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUAVgiZMOe/yOyVhhEJAQo8fxAApLphlOC2NQBTrhbVC7eCmetjGbXHtV8w
u1IVlTs0sYquzXRZYBh75uJrnt00mpT0f9o2SL2t4Wv6elj7Z68I436AGKnbIhNj
jrhOf6kph9ee4hU4QRisqBYQORwpqWvtLk75Z1kPXGcrF2LsO7VTqeD07Wg2JeZU
P6LXhWgEzRvzM64Zhplad7+NKlfuu2DWhzY2257owODf/34UOT7LAiY9+8BimrdL
Ga/DmEEW9b2HVmtH83ttSImQQJrimrdb2ENUklgYyYTxG4F3/NKZakPYBl/paY3Z
/qtgWUERILR1lUHUl++VLrseF1KnmIgZbp4t41JLdaJVuyMSWLjqB2XYTIDe5Ptn
D8Xtdzt/rdV7uF5OmcIZX2Je8Ecos1OllOUhmQo67ryu8WykjRGL8f/YGHi1cplO
k5ZBZXpArM6PesbiWQhdKiZNhB2d7TdaXKpxyIEC2DIuqEY7Dg+rxRlwavDSvAyC
d8i6qAvp6WX5SMEbH+AmV5F0cG0Z+oyGwHjYnkxH/INMrg8adVU7EpLnLT0bakib
QP/dx9P6xbAKUzLI1YaYQCUGWEwcXDf1Tf0frwTiMBW7vH9lNBf/3OUucS9pGbjG
7CYhucNjuNq+diBp0QtofLHgi04t3ZZpV7lt1QSSrvABBvSivrLuRaR50nVQayTk
HXSPOwOYBx0=
=/h+N
-----END PGP SIGNATURE-----

--=-HDTwrQJUbQKPMuhUPHOp--
