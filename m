Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.skyhub.de ([5.9.137.197]:47808 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725764AbeKIFdd (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Nov 2018 00:33:33 -0500
From: Borislav Petkov <bp@alien8.de>
Subject: [PATCH] kbuild/builddeb: Fix building .deb packages out-of-tree
Date: Thu,  8 Nov 2018 20:56:24 +0100
Message-Id: <20181108195624.25410-1-bp@alien8.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org

From: Borislav Petkov <bp@suse.de>

When building a .deb package with

  make O=/tmp/b oldconfig
  cd /tmp/b
  make bindeb-pkg

the build fails with

   fakeroot -u debian/rules binary
  ***
  *** Configuration file ".config" not found!
  ***
  *** Please run some configurator (e.g. "make oldconfig" or
  *** "make menuconfig" or "make xconfig").
  ***
  make[12]: *** [/mnt/kernel/kernel/linux/scripts/kconfig/Makefile:69: syncconfig] Error 1
  make[11]: *** [/mnt/kernel/kernel/linux/Makefile:544: syncconfig] Error 2
  make[10]: *** [Makefile:640: include/config/auto.conf] Error 2
  make[9]: *** [Makefile:15: __sub-make] Error 2

because ($MAKE -s image_name) in the subshell is missing KBUILD_SRC and
cannot find .config. Passing in KBUILD_SRC= for the current pwd fixes
the build.

Signed-off-by: Borislav Petkov <bp@suse.de>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: <linux-kbuild@vger.kernel.org>
---
 scripts/package/builddeb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 90c9a8ac7adb..149bbbd8e98d 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -81,7 +81,7 @@ else
 	cp System.map "$tmpdir/boot/System.map-$version"
 	cp $KCONFIG_CONFIG "$tmpdir/boot/config-$version"
 fi
-cp "$($MAKE -s image_name)" "$tmpdir/$installed_image_path"
+cp "$($MAKE KBUILD_SRC= -s image_name)" "$tmpdir/$installed_image_path"
 
 if grep -q "^CONFIG_OF=y" $KCONFIG_CONFIG ; then
 	# Only some architectures with OF support have this target
-- 
2.19.1
