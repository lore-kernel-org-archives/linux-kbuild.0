Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:34160 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756106Ab3LEOhp (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 5 Dec 2013 09:37:45 -0500
Message-ID: <1386254255.3000.20.camel@deadeye.wl.decadent.org.uk>
Subject: [PATCH 1/2] deb-pkg: Fix cross-building linux-headers package
From: Ben Hutchings <ben@decadent.org.uk>
Date: Thu, 05 Dec 2013 14:37:35 +0000
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-iGrOf77sXbjyQCgJCAEM"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, debian-kernel@lists.debian.org, "Niew, Sh." <shniew@gmail.com>


--=-iGrOf77sXbjyQCgJCAEM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

builddeb generates a control file that says the linux-headers package
can only be built for the build system primary architecture.  This
breaks cross-building configurations.  We should use $debarch for this
instead.

Since $debarch is not yet set when generating the control file, set
Architecture: any and use control file variables to fill in the
description.

Fixes: cd8d60a20a45 ('kbuild: create linux-headers package in deb-pkg')
Reported-by: "Niew, Sh." <shniew@gmail.com>
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 scripts/package/builddeb | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 90e521f..301acdc 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -62,7 +62,7 @@ create_package() {
 	fi
=20
 	# Create the package
-	dpkg-gencontrol -isp $forcearch -p$pname -P"$pdir"
+	dpkg-gencontrol -isp $forcearch -Vkernel:debarch=3D"${debarch:-$(dpkg --p=
rint-architecture)}" -p$pname -P"$pdir"
 	dpkg --build "$pdir" ..
 }
=20
@@ -288,15 +288,14 @@ mkdir -p "$destdir"
 (cd $objtree; cp $KCONFIG_CONFIG $destdir/.config) # copy .config manually=
 to be where it's expected to be
 ln -sf "/usr/src/linux-headers-$version" "$kernel_headers_dir/lib/modules/=
$version/build"
 rm -f "$objtree/debian/hdrsrcfiles" "$objtree/debian/hdrobjfiles"
-arch=3D$(dpkg --print-architecture)
=20
 cat <<EOF >> debian/control
=20
 Package: $kernel_headers_packagename
 Provides: linux-headers, linux-headers-2.6
-Architecture: $arch
-Description: Linux kernel headers for $KERNELRELEASE on $arch
- This package provides kernel header files for $KERNELRELEASE on $arch
+Architecture: any
+Description: Linux kernel headers for $KERNELRELEASE on \${kernel:debarch}
+ This package provides kernel header files for $KERNELRELEASE on \${kernel=
:debarch}
  .
  This is useful for people who need to build external modules
 EOF


--=20
Ben Hutchings
Knowledge is power.  France is bacon.

--=-iGrOf77sXbjyQCgJCAEM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIVAwUAUqCPr+e/yOyVhhEJAQrwyBAAnVW9hrQpaP7Xqldx80PmAtqDC8A4Tg8t
B5Ib3Mp8py+MtEuaAzkeG2r7hEqOhCHy6JJ1NaaYoV0yRf3rbJ8zSYf3iwrozmyK
4KSmZpZyNXwwvwODM41KQjkkK4sX04OlHytF0MCMTFPuW6a7JmMZ7sbJ532dRcaw
uDD5Cx6oOCGCWRHnp1XK5dYs7griuRt5cX1yV/Db7ltqLwdtDnP1cLRDJpDkP2vB
103tn1OFlDS0tvO31Gm15c+4PTP/VGd0HDO1OyY2PHBTJWcJD28jnSabRE300G3k
HE+Jk1mpuEOgSZs+tQqdSGKMywEPstweo5Csq9lHtChumYRrwdtf5vU7AOgyvCIu
b8oo4icTxXPY0m3QXFrtvQ24TMQv/XZalnGq3VaYtcD665cTqrvg8SwDuZx1dR5M
gk+jMUrSYAIGiNvkiOZrlNMLOTslep0aMfuYaYa4tlTEWx6HFxu2tfEjBPTgV5CY
EfXVkLWBFCqTM0ujr5M4rBDOeyWFaX4AQo6GQ3X4ZBc+/ehDEblFhe1bfjVTS7Uh
a+wGTiEl3kn54PQF1BoSZeKXupBjztwr7lAlQllzLPbsdtBt8zVgcxrSAh6gdXUN
r/TgvUPHQE7gFb2OtbXY/WFzR8ifuUgD6HQ7G2me20wnGBK0hdy7zm7cy4lc/N5z
VsYVROu9ND8=
=p1kR
-----END PGP SIGNATURE-----

--=-iGrOf77sXbjyQCgJCAEM--
