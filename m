Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.22]:52601 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727488AbgC2O2u (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 29 Mar 2020 10:28:50 -0400
From: Reinhard Karcher <reinhard.karcher@gmx.net>
Subject: Re: Bug#954778: Patch: Suppress irrelevant warning when generating a debian package
Date: Sun, 29 Mar 2020 16:28:44 +0200
Message-ID: <3046032.1AMzvzNrTs@apollon>
In-Reply-To: <CAK7LNAQBypq0QxUafH6f4k4d7wObjycK6eys2NKDZi8_Qdxb4A@mail.gmail.com>
References: <1966103.4dT7el1ifK@apollon> <2516578.0xqDLvIEN0@apollon> <CAK7LNAQBypq0QxUafH6f4k4d7wObjycK6eys2NKDZi8_Qdxb4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart53114204.YFjIEDjTXD"
Content-Transfer-Encoding: 7Bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: 954778@bugs.debian.org

This is a multi-part message in MIME format.

--nextPart53114204.YFjIEDjTXD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Am Sonntag, 29. M=C3=A4rz 2020, 15:30 schrieb Masahiro Yamada:
>=20
> I want you to directly use
>=20
> if is_enabled CONFIG_DEBUG_INFO; then
> ...
> fi
>=20

Corrected patch attached

=2D-
Best regards
Reinhard Karcher

--nextPart53114204.YFjIEDjTXD
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
index 357dc56bcf30..327ea3c2a785 100755
=2D-- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -198,7 +198,10 @@ Description: Linux support headers for userspace deve=
lopment
  This package provides userspaces headers from the Linux kernel.  These h=
eaders
  are used by the installed headers for GNU glibc and other system librari=
es.
 Multi-Arch: same
+EOF

+if is_enabled CONFIG_DEBUG_INFO; then
+cat <<EOF >> debian/control
 Package: $dbg_packagename
 Section: debug
 Architecture: $debarch
@@ -206,6 +209,7 @@ Description: Linux kernel debugging symbols for $versi=
on
  This package will come in handy if you need to debug the kernel. It prov=
ides
  all the necessary debug symbols for the kernel and its modules.
 EOF
+fi

 cat <<EOF > debian/rules
 #!$(command -v $MAKE) -f

--nextPart53114204.YFjIEDjTXD--
