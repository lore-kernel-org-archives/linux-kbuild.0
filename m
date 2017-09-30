Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:25324 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752732AbdI3BKf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Sep 2017 21:10:35 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/9] kbuild: rpm-pkg: remove ppc64 specific image handling
Date: Sat, 30 Sep 2017 10:10:03 +0900
Message-Id: <1506733811-24636-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org

This conditional was added by commit 1a0f3d422bb9 ("kbuild: fix
make rpm for powerpc").  Its git-log explains the default kernel
image is zImage, but obviously the current arch/powerpc/Makefile
does not set KBUILD_IMAGE, so the image file is actually vmlinux.

Moreover, since commit 09549aa1baa9 ("deb-pkg: Remove the KBUILD_IMAGE
workaround"), all architectures are supposed to set the full path to
the image in KBUILD_IMAGE.  I see no good reason to differentiate
ppc64 from others.  Rip off the conditional.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/package/mkspec | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index f47f17a..ef00750 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -92,13 +92,8 @@ echo "%ifarch ia64"
 echo 'cp $KBUILD_IMAGE $RPM_BUILD_ROOT'"/boot/efi/vmlinuz-$KERNELRELEASE"
 echo 'ln -s '"efi/vmlinuz-$KERNELRELEASE" '$RPM_BUILD_ROOT'"/boot/"
 echo "%else"
-echo "%ifarch ppc64"
-echo "cp vmlinux arch/powerpc/boot"
-echo "cp arch/powerpc/boot/"'$KBUILD_IMAGE $RPM_BUILD_ROOT'"/boot/vmlinuz-$KERNELRELEASE"
-echo "%else"
 echo 'cp $KBUILD_IMAGE $RPM_BUILD_ROOT'"/boot/vmlinuz-$KERNELRELEASE"
 echo "%endif"
-echo "%endif"
 
 echo 'make %{?_smp_mflags} INSTALL_HDR_PATH=$RPM_BUILD_ROOT/usr KBUILD_SRC= headers_install'
 echo 'cp System.map $RPM_BUILD_ROOT'"/boot/System.map-$KERNELRELEASE"
-- 
2.7.4

