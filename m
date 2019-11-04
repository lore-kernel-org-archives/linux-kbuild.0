Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41126 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729025AbfKDNMD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Nov 2019 08:12:03 -0500
Received: by mail-wr1-f69.google.com with SMTP id u2so4288959wrm.7
        for <linux-kbuild@vger.kernel.org>; Mon, 04 Nov 2019 05:12:00 -0800 (PST)
From: Matteo Croce <mcroce@redhat.com>
Subject: [PATCH v2] kbuild: Add make dir-pkg build option
Date: Mon,  4 Nov 2019 14:11:44 +0100
Message-Id: <20191104131144.14333-1-mcroce@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Add a 'dir-pkg' target which just creates the same directory structures
as in tar-pkg, but doesn't package anything.
Useful when the user wants to copy the kernel tree on a machine using
ssh, rsync or whatever.

Signed-off-by: Matteo Croce <mcroce@redhat.com>
---
 scripts/Makefile.package | 3 ++-
 scripts/package/buildtar | 8 ++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index 56eadcc48d46..36600ad1d5e6 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -103,7 +103,7 @@ snap-pkg:
=20
 # tarball targets
 # ------------------------------------------------------------------------=
---
-tar-pkgs :=3D tar-pkg targz-pkg tarbz2-pkg tarxz-pkg
+tar-pkgs :=3D dir-pkg tar-pkg targz-pkg tarbz2-pkg tarxz-pkg
 PHONY +=3D $(tar-pkgs)
 $(tar-pkgs):
 =09$(MAKE) -f $(srctree)/Makefile
@@ -147,6 +147,7 @@ help:
 =09@echo '  deb-pkg             - Build both source and binary deb kernel =
packages'
 =09@echo '  bindeb-pkg          - Build only the binary kernel deb package=
'
 =09@echo '  snap-pkg            - Build only the binary kernel snap packag=
e (will connect to external hosts)'
+=09@echo '  dir-pkg             - Build the kernel as a plain directory st=
ructure'
 =09@echo '  tar-pkg             - Build the kernel as an uncompressed tarb=
all'
 =09@echo '  targz-pkg           - Build the kernel as a gzip compressed ta=
rball'
 =09@echo '  tarbz2-pkg          - Build the kernel as a bzip2 compressed t=
arball'
diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index 2f66c81e4021..77c7caefede1 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -2,7 +2,7 @@
 # SPDX-License-Identifier: GPL-2.0
=20
 #
-# buildtar 0.0.4
+# buildtar 0.0.5
 #
 # (C) 2004-2006 by Jan-Benedict Glaw <jbglaw@lug-owl.de>
 #
@@ -24,7 +24,7 @@ tarball=3D"${objtree}/linux-${KERNELRELEASE}-${ARCH}.tar"
 # Figure out how to compress, if requested at all
 #
 case "${1}" in
-=09tar-pkg)
+=09dir-pkg|tar-pkg)
 =09=09opts=3D
 =09=09;;
 =09targz-pkg)
@@ -125,6 +125,10 @@ case "${ARCH}" in
 =09=09;;
 esac
=20
+if [ "${1}" =3D dir-pkg ]; then
+=09echo "Kernel tree successfully created in $tmpdir"
+=09exit 0
+fi
=20
 #
 # Create the tarball
--=20
2.23.0
