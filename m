Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.19]:40721 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727951AbgC2Mz5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 29 Mar 2020 08:55:57 -0400
From: Reinhard Karcher <reinhard.karcher@gmx.net>
Subject: Re: Patch: Suppress irrelevant warning when generating a debian package
Date: Sun, 29 Mar 2020 14:55:51 +0200
Message-ID: <2516578.0xqDLvIEN0@apollon>
In-Reply-To: <CAK7LNAQcMM_H41zXA++FOF=LJT+YKNfmwHMYqdF3r1uQT307Hw@mail.gmail.com>
References: <1966103.4dT7el1ifK@apollon> <CAK7LNAQcMM_H41zXA++FOF=LJT+YKNfmwHMYqdF3r1uQT307Hw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart2088962.f1JdSLc2P8"
Content-Transfer-Encoding: 7Bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: 954778@bugs.debian.org

This is a multi-part message in MIME format.

--nextPart2088962.f1JdSLc2P8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Am Sonntag, 29. M=C3=A4rz 2020, 14:01 schrieb Masahiro Yamada:
>=20
> > By making a contribution to this project, I certify that:
> > The contribution was created in whole or in part by me and I have the
> > right to submit it under the open source license indicated in the file.
>=20
> Please drop this.
>=20
> Signed-off-by implies this.
> No need to explain this in an individual patch.

Droped in attached new version.

> > +if [ -n "$BUILD_DEBUG" ] ; then
>=20
> This file does not define BUILD_DEBUG.
> So, this conditional is always false, isn't it?
>=20
> It should be:
>=20
> if is_enabled CONFIG_DEBUG_INFO; then
>=20

The definition of BUILD_DEBUG is copied from builddeb too.=20
See attached patch.

=2D-
Best regards
Reinhard Karcher

--nextPart2088962.f1JdSLc2P8
Content-Disposition: attachment; filename="remove_debug_warning.patch"
Content-Transfer-Encoding: quoted-printable
Content-Type: text/x-patch; charset="UTF-8"; name="remove_debug_warning.patch"

from Reinhard.Karcher reinhard.karcher@gmx.net

Creating a Debian package by compiling the kernel
make bindeb-pkg
without creating debug information creates a warning that no
debug package was created
This patch excludes the debug package from the control file,
if no debug package is created by this configuration

Signed-off-by:Reinhard Karcher <reinhard.karcher@gmx.net>

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 357dc56bcf30..572abe5a149e 100755
=2D-- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -96,6 +96,7 @@ fi
 sourcename=3D$KDEB_SOURCENAME
 packagename=3Dlinux-image-$version
 kernel_headers_packagename=3Dlinux-headers-$version
+BUILD_DEBUG=3D$(if_enabled_echo CONFIG_DEBUG_INFO Yes)
 dbg_packagename=3D$packagename-dbg
 debarch=3D
 set_debarch
@@ -198,7 +199,10 @@ Description: Linux support headers for userspace deve=
lopment
  This package provides userspaces headers from the Linux kernel.  These h=
eaders
  are used by the installed headers for GNU glibc and other system librari=
es.
 Multi-Arch: same
+EOF

+if [ -n "$BUILD_DEBUG" ] ; then
+cat <<EOF >> debian/control
 Package: $dbg_packagename
 Section: debug
 Architecture: $debarch
@@ -206,6 +210,7 @@ Description: Linux kernel debugging symbols for $versi=
on
  This package will come in handy if you need to debug the kernel. It prov=
ides
  all the necessary debug symbols for the kernel and its modules.
 EOF
+fi

 cat <<EOF > debian/rules
 #!$(command -v $MAKE) -f

--nextPart2088962.f1JdSLc2P8--
