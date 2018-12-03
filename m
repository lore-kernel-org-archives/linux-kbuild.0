Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:60223 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbeLCHvq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Dec 2018 02:51:46 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 4/7] microblaze: fix multiple bugs in arch/microblaze/boot/Makefile
Date: Mon,  3 Dec 2018 16:50:54 +0900
Message-Id: <1543823457-32478-5-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
References: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Simek <monstr@monstr.eu>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

This Makefile is wrong in multiple ways.

The first issue is the breakage of 'linux.bin.ub' target since commit
ece97f3a5fb5 ("microblaze: Fix simpleImage format generation")
because the addition of UIMAGE_{IN,OUT} obviously affected it.

make ARCH=microblaze CROSS_COMPILE=microblaze-linux- linux.bin.ub
  [ snip ]
  OBJCOPY arch/microblaze/boot/linux.bin
  UIMAGE  arch/microblaze/boot/linux.bin.ub.ub
/usr/bin/mkimage: Can't open arch/microblaze/boot/linux.bin.ub: No such file or directory
make[1]: *** [arch/microblaze/boot/Makefile;14: arch/microblaze/boot/linux.bin.ub] Error 1
make: *** [arch/microblaze/Makefile;83: linux.bin.ub] Error 2

The second issue is the use of the "if_changed" multiple times for
the same target.

As commit 92a4728608a8 ("x86/boot: Fix if_changed build flip/flop bug")
pointed out, this never works properly. Moreover, generating multiple
images as a side-effect is extremely confusing and wrong.

As far as I understood, "simpleImage.<dt>" works like a phony target
to generate the following four images.

 - arch/microblaze/boot/simpleImage.<dt>:
       identical to arch/microblaze/boot/linux.bin

 - arch/microblaze/boot/simpleImage.<dt>.unstrip:
       identical to vmlinux

 - arch/microblaze/boot/simpleImage.<dt>.ub:
       identical to arch/microblaze/boot/linux.bin.ub

 - arch/microblaze/boot/simpleImage.<dt>.strip:
       stripped vmlinux

The first three are just aliases of other images. Separate the recipe
for each image.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/microblaze/Makefile      |  2 +-
 arch/microblaze/boot/Makefile | 27 ++++++++++++++++-----------
 2 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/arch/microblaze/Makefile b/arch/microblaze/Makefile
index cfd7bfca..c5d5b0e 100644
--- a/arch/microblaze/Makefile
+++ b/arch/microblaze/Makefile
@@ -84,7 +84,7 @@ linux.bin linux.bin.gz linux.bin.ub: vmlinux
 	@echo 'Kernel: $(boot)/$@ is ready' ' (#'`cat .version`')'
 
 simpleImage.%: vmlinux
-	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
+	$(Q)$(MAKE) $(build)=$(boot) simple_images
 	@echo 'Kernel: $(boot)/$@ is ready' ' (#'`cat .version`')'
 
 define archhelp
diff --git a/arch/microblaze/boot/Makefile b/arch/microblaze/boot/Makefile
index c2579a7..f12a9d7 100644
--- a/arch/microblaze/boot/Makefile
+++ b/arch/microblaze/boot/Makefile
@@ -3,7 +3,7 @@
 # arch/microblaze/boot/Makefile
 #
 
-targets := linux.bin linux.bin.gz linux.bin.ub simpleImage.%
+targets := linux.bin linux.bin.gz linux.bin.ub simpleImage.*.strip
 
 OBJCOPYFLAGS := -R .note -R .comment -R .note.gnu.build-id -O binary
 
@@ -16,21 +16,26 @@ $(obj)/linux.bin.ub: $(obj)/linux.bin FORCE
 $(obj)/linux.bin.gz: $(obj)/linux.bin FORCE
 	$(call if_changed,gzip)
 
-quiet_cmd_cp = CP      $< $@$2
-	cmd_cp = cat $< >$@$2 || (rm -f $@ && echo false)
-
 quiet_cmd_strip = STRIP   $< $@$2
 	cmd_strip = $(STRIP) -K microblaze_start -K _end -K __log_buf \
 				-K _fdt_start $< -o $@$2
 
 UIMAGE_LOADADDR = $(CONFIG_KERNEL_BASE_ADDR)
-UIMAGE_IN = $@
-UIMAGE_OUT = $@.ub
 
-$(obj)/simpleImage.%: vmlinux FORCE
-	$(call if_changed,cp,.unstrip)
-	$(call if_changed,objcopy)
-	$(call if_changed,uimage)
-	$(call if_changed,strip,.strip)
+PHONY += simple_images
+simple_images: $(addprefix $(obj)/simpleImage., $(DTB) $(DTB).ub $(DTB).unstrip $(DTB).strip)
+	@:
+
+$(obj)/simpleImage.$(DTB): $(obj)/linux.bin
+	$(call cmd,shipped)
+
+$(obj)/simpleImage.$(DTB).ub: $(obj)/linux.bin.ub
+	$(call cmd,shipped)
+
+$(obj)/simpleImage.$(DTB).unstrip: vmlinux
+	$(call cmd,shipped)
+
+$(obj)/simpleImage.$(DTB).strip: vmlinux FORCE
+	$(call if_changed,strip)
 
 clean-files += simpleImage.*
-- 
2.7.4
