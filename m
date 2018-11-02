Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from userp2120.oracle.com ([156.151.31.85]:33810 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725935AbeKBUcw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 2 Nov 2018 16:32:52 -0400
MIME-Version: 1.0
Message-ID: <3e40ec15-3a8c-444d-8d32-35ef587f3980@default>
Date: Fri, 2 Nov 2018 04:25:54 -0700 (PDT)
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Subject: [PATCH] kbuild: rpm-pkg: fix two build breaks when O= is used
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: Srinivas REDDY Eeda <srinivas.eeda@oracle.com>, yamada.masahiro@socionext.com, michal.lkml@markovi.net

Running 'make O=3D/build/kernel binrpm-pkg' failed with below two errors.

Makefile:600: include/config/auto.conf: No such file or directory

+ cp make -C /mnt/root/kernel O=3D/build/kernel image_name make -f
/mnt/root/kernel/Makefile ...
cp: invalid option -- 'C'
Try 'cp --help' for more information.

Export KBUILD_OUTPUT when O=3D is used so that it could be used in locating
include/config/auto.conf

Use $srctree to locate source dir when generating image name, no matter
if O=3D is used.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@oracle.com>
---
 Makefile               | 5 +++++
 scripts/package/mkspec | 4 ++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 9aa352b..df316e5 100644
--- a/Makefile
+++ b/Makefile
@@ -135,6 +135,7 @@ KBUILD_OUTPUT :=3D $(shell mkdir -p $(KBUILD_OUTPUT) &&=
 cd $(KBUILD_OUTPUT) \
 $(if $(KBUILD_OUTPUT),, \
      $(error failed to create output directory "$(saved-output)"))
=20
+export KBUILD_OUTPUT
 # Look for make include files relative to root of kernel src
 #
 # This does not become effective immediately because MAKEFLAGS is re-parse=
d
@@ -597,7 +598,11 @@ virt-y=09=09:=3D virt/
 endif # KBUILD_EXTMOD
=20
 ifeq ($(dot-config),1)
+ifeq ($(KBUILD_OUTPUT),)
 include include/config/auto.conf
+else
+include $(KBUILD_OUTPUT)/include/config/auto.conf
+endif
 endif
=20
 # The all: target is the default when no target is given on the
diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index e05646d..3b4e5e4 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -84,10 +84,10 @@ $S
 =09mkdir -p %{buildroot}/boot
 =09%ifarch ia64
 =09mkdir -p %{buildroot}/boot/efi
-=09cp \$(make image_name) %{buildroot}/boot/efi/vmlinuz-$KERNELRELEASE
+=09cp \$(make -C \$srctree image_name) %{buildroot}/boot/efi/vmlinuz-$KERN=
ELRELEASE
 =09ln -s efi/vmlinuz-$KERNELRELEASE %{buildroot}/boot/
 =09%else
-=09cp \$(make image_name) %{buildroot}/boot/vmlinuz-$KERNELRELEASE
+=09cp \$(make -C \$srctree image_name) %{buildroot}/boot/vmlinuz-$KERNELRE=
LEASE
 =09%endif
 $M=09make %{?_smp_mflags} INSTALL_MOD_PATH=3D%{buildroot} KBUILD_SRC=3D mo=
dules_install
 =09make %{?_smp_mflags} INSTALL_HDR_PATH=3D%{buildroot}/usr KBUILD_SRC=3D =
headers_install
--=20
1.8.3.1
