Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:45466 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750876AbeAPQUx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jan 2018 11:20:53 -0500
Received: by mail-wr0-f195.google.com with SMTP id 16so15797529wry.12
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Jan 2018 08:20:52 -0800 (PST)
From: Florian Margaine <florian@platform.sh>
Subject: [PATCH] scripts: add the KDEB_ADDITIONAL_CONTROL knob to builddeb
Date: Tue, 16 Jan 2018 17:20:47 +0100
Message-ID: <87po696ahs.fsf@platform.sh>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

This lets builders configure the resulting .deb a bit
more. Especially, this lets builders choose to add additional
dependencies, such as e.g. adding initramfs-tools in Debian-like,
which will generate the initramfs for the newly installed package.

Signed-off-by: Florian Margaine <florian@platform.sh>

=2D--
 scripts/package/builddeb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index b4f0f2b3f8d2..1e5c42c9481a 100755
=2D-- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -307,6 +307,7 @@ Architecture: any
 Description: Linux kernel, version $version
  This package contains the Linux kernel, modules and corresponding other
  files, version: $version.
+$KDEB_ADDITIONAL_CONTROL
 EOF
=20
 fi
=2D-=20
2.14.3

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWcDV2nrrM20UJL9WhD9tdT2UlyoFAlpeJl8ACgkQhD9tdT2U
lypf8wf/btAZrT7AkL5a+6WWvFKAX8tJCdHvRLAaQwSG5k4yEkapI/8U/PjgnjSy
TpY2lycopraXsTWa/rw/ScImE4iSm9KlGS62JLLTxvypVBTvMroEGTkT9CWJFggR
tLya6Fjp+j9UFJwGwuWRvOcG7Emt+d2ync0CHmyGnZwmNwI9emAkZ9e5kAjC6J5M
nDNlnyJSi36UHbdfb5fyeeNVrmZTG/ByrmrF6tXNbrKIWoXo8rVP2UBsnO5IiRtn
xb1mOL5fJkAbLOhRqBGOXx9sfXL+fw6sj7b51cUC6B/QF0ZmyGcwXD09vo1poRTc
vaLhLjkSqj8SRLIExpKtwNir6+iE0g==
=ysuk
-----END PGP SIGNATURE-----
--=-=-=--
