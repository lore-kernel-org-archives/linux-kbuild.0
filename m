Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:50563 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751203Ab3JFREK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 6 Oct 2013 13:04:10 -0400
Message-ID: <1381079041.2788.25.camel@deadeye.wl.decadent.org.uk>
Subject: [PATCH 1/2] deb-pkg: Add automatic support for armhf architecture
From: Ben Hutchings <ben@decadent.org.uk>
Date: Sun, 06 Oct 2013 18:04:01 +0100
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Vg2phR3MjFsEfTSZAeRS"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>
Cc: maximilian attems <max@stro.at>, Michal Marek <mmarek@suse.cz>, Fathi Boudra <fathi.boudra@linaro.org>, debian-arm@lists.debian.org


--=-Vg2phR3MjFsEfTSZAeRS
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
 scripts/package/builddeb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 90e521f..e14c56e 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -43,7 +43,16 @@ create_package() {
 	mips*)
 		debarch=3Dmips$(grep -q CPU_LITTLE_ENDIAN=3Dy $KCONFIG_CONFIG && echo el=
) ;;
 	arm*)
-		debarch=3Darm$(grep -q CONFIG_AEABI=3Dy $KCONFIG_CONFIG && echo el) ;;
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
Who are all these weirdos? - David Bowie, reading IRC for the first time

--=-Vg2phR3MjFsEfTSZAeRS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIVAwUAUlGYAee/yOyVhhEJAQosYxAAuWiDEfanAkRpuFcOu8gd/4EQlu4WKi+t
5jEOb8AtHRfKXpGA5A/BCpfvPbZQFBXgE9NsO6wSJ/YIkg+iyq++xDfGTI9ZkD04
3MKHLMwhN5r7E3XeVjXeRGE5H08dNftoXGoRUT0AMv80UlRwOpHC/5V7Gfp4UQdo
8WnLqM1bEBeI8WKdKqxt4iwmXzSHRDEh9Yx48eKQYMhFK2DtlIh6i2kwPEcVmrKx
b24niYj7GTlhs7AQ6fQDdhMIKgPbNrbLqrRz7dAa46+FhA++w5PiBqcMeXm4CSu5
q8ni08K+Qs5V2XeBiBErTYFCz5eh04bYcBaPcnkNxtXu/jg0LytKhLBfwZvEEvK1
oxCIl8b4X1ut+wnF+V7wF+WUpgtpb9G6piV+8ehOlZL9nwEzOqZGgs+E3axHG0zV
rweKJHoTvZgNUc6biw/zyrd8zR0QIH3oc6YNdtIwYhHSpRoVxowXUlGa5Gk/qaJo
en9oEJgnvGNV5bxT8yA2XXBpL7t2qHKYvSh6r/7Gdb4Ffi2mVt2e8MJvHpgZmR1k
knuNNWOYJXbIn5m51M1wymLEGStWfMEIybdOFspZ54alZqUH6/wYqEUoFKsaM9kn
i0izXD9fwKr7mqC07kxshYkVthOUnZmzyq01qhRuhYMcIaqbcldazM6DNKnx3ZOP
UCNGjk5GCPk=
=Hjhl
-----END PGP SIGNATURE-----

--=-Vg2phR3MjFsEfTSZAeRS--
