Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.18]:48389 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726524AbgCXKYz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Mar 2020 06:24:55 -0400
From: Reinhard Karcher <reinhard.karcher@gmx.net>
Subject: Patch: Suppress irrelevant warning when generating a debian package
Date: Tue, 24 Mar 2020 11:24:47 +0100
Message-ID: <1966103.4dT7el1ifK@apollon>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: 954778@bugs.debian.org

Creating a Debian package by compiling the kernel using make bindeb-pkg
without creating debug information creates a warning that no
debug package was created.
This patch excludes the debug package from the control file,
if no debug package is created by this configuration.

By making a contribution to this project, I certify that:
The contribution was created in whole or in part by me and I have the righ=
t to
submit it under the open source license indicated in the file.
Signed-off-by: Reinhard Karcher <reinhard.karcher@gmx.net>
=2D--
The condition to include the debug package is copied from the file
builddeb in the same directory.

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 357dc56bcf30..1673b9f84804 100755
=2D-- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -198,7 +198,10 @@ Description: Linux support headers for userspace
development
  This package provides userspaces headers from the Linux kernel.  These
headers
  are used by the installed headers for GNU glibc and other system librari=
es.
 Multi-Arch: same
+EOF

+if [ -n "$BUILD_DEBUG" ] ; then
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
