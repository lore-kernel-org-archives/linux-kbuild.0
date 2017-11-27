Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:33523 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751277AbdK0JqX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Nov 2017 04:46:23 -0500
Date: Mon, 27 Nov 2017 10:46:20 +0100
From: Pavel Machek <pavel@ucw.cz>
Subject: [PATCH] fix perl locale warnings in arch/arm/boot/
Message-ID: <20171127094620.GA18072@amd>
References: <20171119222703.GA12824@amd>
 <CAK7LNARWMpxxC9hT8f7rGj5McjdNU1GXfjML9NbWFTCGyQ++dg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Content-Disposition: inline
In-Reply-To: <CAK7LNARWMpxxC9hT8f7rGj5McjdNU1GXfjML9NbWFTCGyQ++dg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, rmk+kernel@armlinux.org.uk, tony@atomide.com, j-keerthy@ti.com, linux-arm-kernel@lists.infradead.org
Cc: kernel list <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Commit 429f7a062e3b5cf6fcf01eb00600cee5fe4d751f introduced perl into
arch/arm/boot/compressed/Makefile, which unfortunately leads to locale
warnings.

Fix it by setting default locale.

Signed-off-by: Pavel Machek <pavel@ucw.cz>

diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/M=
akefile
index 45a6b9b..4656e98 100644
--- a/arch/arm/boot/compressed/Makefile
+++ b/arch/arm/boot/compressed/Makefile
@@ -118,7 +118,7 @@ asflags-y :=3D -DZIMAGE
=20
 # Supply kernel BSS size to the decompressor via a linker symbol.
 KBSS_SZ =3D $(shell $(CROSS_COMPILE)nm $(obj)/../../../../vmlinux | \
-		perl -e 'while (<>) { \
+		LC_ALL=3DC perl -e 'while (<>) { \
 			$$bss_start=3Dhex($$1) if /^([[:xdigit:]]+) B __bss_start$$/; \
 			$$bss_end=3Dhex($$1) if /^([[:xdigit:]]+) B __bss_stop$$/; \
 		}; printf "%d\n", $$bss_end - $$bss_start;')


--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlob3uwACgkQMOfwapXb+vI80QCePWXnvR7vzWcSWqEENk/2+MDY
1RMAn2dgbJ5YbbbtBiE0vE8MUhH2hreo
=fgQv
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--
