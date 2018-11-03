Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45018 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726691AbeKDF1n (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Nov 2018 01:27:43 -0400
Received: by mail-wr1-f66.google.com with SMTP id j17-v6so160764wrq.11
        for <linux-kbuild@vger.kernel.org>; Sat, 03 Nov 2018 13:15:23 -0700 (PDT)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: [PATCH] Revert "kbuild: add --include-dir flag only for out-of-tree build"
Date: Sat,  3 Nov 2018 21:15:04 +0100
Message-Id: <20181103201504.29413-1-ard.biesheuvel@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: michal.lkml@markovi.net, yamada.masahiro@socionext.com, riku.voipio@linaro.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>

This reverts commit 80463f1b7bf9f822fd3495139bcf3ef254fdca10, because
it breaks the bindeb-pkg build target in the following way:

  ...
    LD [M]  sound/soc/rockchip/snd-soc-rk3399-gru-sound.ko
    LD [M]  sound/soc/rockchip/snd-soc-rockchip-pcm.ko
    LD [M]  sound/soc/rockchip/snd-soc-rockchip-rt5645.ko
    LD [M]  sound/soc/rockchip/snd-soc-rockchip-spdif.ko
    LD [M]  sound/soc/sh/rcar/snd-soc-rcar.ko
   fakeroot -u debian/rules binary
  make KERNELRELEASE=4.19.0-12677-g19beffaf7a99-dirty ARCH=arm64 KBUILD_SRC= intdeb-pkg
  /bin/bash /home/ard/linux/scripts/package/builddeb
  Makefile:600: include/config/auto.conf: No such file or directory
  ***
  *** Configuration file ".config" not found!
  ***
  *** Please run some configurator (e.g. "make oldconfig" or
  *** "make menuconfig" or "make xconfig").
  ***
  make[12]: *** [syncconfig] Error 1
  make[11]: *** [syncconfig] Error 2
  make[10]: *** [include/config/auto.conf] Error 2
  make[9]: *** [__sub-make] Error 2
  cp: cannot stat '/home/ard/linux/scripts/kconfig/Makefile:69: recipe for target '\''syncconfig'\'' failed'$'\n''/home/ard/linux/Makefile:544: recipe for target '\''syncconfig'\'' failed'$'\n''Makefile:640: recipe for target '\''include/config/auto.conf'\'' failed'$'\n''Makefile:15: recipe for target '\''__sub-make'\'' failed': No such file or directory
  /home/ard/linux/scripts/package/Makefile:83: recipe for target 'intdeb-pkg' failed
  make[8]: *** [intdeb-pkg] Error 1
  /home/ard/linux/Makefile:1399: recipe for target 'intdeb-pkg' failed
  make[7]: *** [intdeb-pkg] Error 2
  Makefile:152: recipe for target 'sub-make' failed
  make[6]: *** [sub-make] Error 2
  Makefile:15: recipe for target '__sub-make' failed
  make[5]: *** [__sub-make] Error 2
  debian/rules:7: recipe for target 'binary-arch' failed
  make[4]: *** [binary-arch] Error 2
  dpkg-buildpackage: error: fakeroot -u debian/rules binary gave error exit status 2
  /home/ard/linux/scripts/package/Makefile:79: recipe for target 'bindeb-pkg' failed
  make[3]: *** [bindeb-pkg] Error 2
  /home/ard/linux/Makefile:1399: recipe for target 'bindeb-pkg' failed
  make[2]: *** [bindeb-pkg] Error 2
  Makefile:152: recipe for target 'sub-make' failed
  make[1]: *** [sub-make] Error 2
  Makefile:15: recipe for target '__sub-make' failed
  make: *** [__sub-make] Error 2

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 Makefile | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index 9aa352b38815..f9d7af9e5146 100644
--- a/Makefile
+++ b/Makefile
@@ -15,9 +15,10 @@ NAME = "People's Front"
 PHONY := _all
 _all:
 
-# Do not use make's built-in rules and variables
-# (this increases performance and avoids hard-to-debug behaviour)
-MAKEFLAGS += -rR
+# o Do not use make's built-in rules and variables
+#   (this increases performance and avoids hard-to-debug behaviour);
+# o Look for make include files relative to root of kernel src
+MAKEFLAGS += -rR --include-dir=$(CURDIR)
 
 # Avoid funny character set dependencies
 unexport LC_ALL
@@ -135,13 +136,6 @@ KBUILD_OUTPUT := $(shell mkdir -p $(KBUILD_OUTPUT) && cd $(KBUILD_OUTPUT) \
 $(if $(KBUILD_OUTPUT),, \
      $(error failed to create output directory "$(saved-output)"))
 
-# Look for make include files relative to root of kernel src
-#
-# This does not become effective immediately because MAKEFLAGS is re-parsed
-# once after the Makefile is read.  It is OK since we are going to invoke
-# 'sub-make' below.
-MAKEFLAGS += --include-dir=$(CURDIR)
-
 PHONY += $(MAKECMDGOALS) sub-make
 
 $(filter-out _all sub-make $(CURDIR)/Makefile, $(MAKECMDGOALS)) _all: sub-make
-- 
2.19.1
