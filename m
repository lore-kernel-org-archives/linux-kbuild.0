Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58901 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729471AbfJIPKi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 9 Oct 2019 11:10:38 -0400
Received: by mail-wm1-f70.google.com with SMTP id 4so797769wmj.6
        for <linux-kbuild@vger.kernel.org>; Wed, 09 Oct 2019 08:10:34 -0700 (PDT)
From: Matteo Croce <mcroce@redhat.com>
Subject: [PATCH] kbuild: Add make dir-pkg build option
Date: Wed,  9 Oct 2019 17:10:19 +0200
Message-Id: <20191009151019.13488-1-mcroce@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Add a 'dir-pkg' target which just creates the same directory structures
as in tar-pkg, but doesn't package anything.
Useful when the user wants to copy the kernel tree on a machine using
ssh, rsync or whatever.

Signed-off-by: Matteo Croce <mcroce@redhat.com>
---
 scripts/Makefile.package | 3 ++-
 scripts/package/buildtar | 9 +++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

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
index 2f66c81e4021..ca283079f652 100755
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
@@ -133,6 +133,11 @@ if tar --owner=3Droot --group=3Droot --help >/dev/null=
 2>&1; then
 =09opts=3D"$opts --owner=3Droot --group=3Droot"
 fi
=20
+if [ "${1}" =3D dir-pkg ]; then
+=09echo "Kernel tree successfully created in $tmpdir"
+=09exit 0
+fi
+
 tar cf $tarball -C $tmpdir $opts $dirs
=20
 echo "Tarball successfully created in $tarball"
--=20
2.21.0
