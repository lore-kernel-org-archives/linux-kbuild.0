Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:60226 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbeLCHvp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Dec 2018 02:51:45 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/7] microblaze: adjust the help to the real behavior
Date: Mon,  3 Dec 2018 16:50:52 +0900
Message-Id: <1543823457-32478-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
References: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Simek <monstr@monstr.eu>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

"make ARCH=microblaze help" mentions simpleImage.<dt>.unstrip,
but it never works because Makefile assumes "system.unstrip" is
the name of DT.

$ make ARCH=microblaze CROSS_COMPILE=microblaze-linux- simpleImage.system.unstrip
  [ snip ]
make[1]: *** No rule to make target 'arch/microblaze/boot/dts/system.unstrip.dtb', needed by 'arch/microblaze/boot/dts/system.dtb'.  Stop.
make: *** [Makefile;1060: arch/microblaze/boot/dts] Error 2
make: *** Waiting for unfinished jobs....

Rip off the never-working target.

In my understanding, simpleImage.<dt> works like a phony target that
generates multiple images. Reflect the behavior to the help message.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/microblaze/Makefile | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/microblaze/Makefile b/arch/microblaze/Makefile
index 0823d29..97e1384 100644
--- a/arch/microblaze/Makefile
+++ b/arch/microblaze/Makefile
@@ -89,9 +89,7 @@ define archhelp
   echo '* linux.bin    - Create raw binary'
   echo '  linux.bin.gz - Create compressed raw binary'
   echo '  linux.bin.ub - Create U-Boot wrapped raw binary'
-  echo '  simpleImage.<dt> - ELF image with $(arch)/boot/dts/<dt>.dts linked in'
-  echo '                   - stripped elf with fdt blob'
-  echo '  simpleImage.<dt>.unstrip - full ELF image with fdt blob'
+  echo '  simpleImage.<dt> - Create images with $(arch)/boot/dts/<dt>.dts linked in'
   echo '  *_defconfig      - Select default config from arch/microblaze/configs'
   echo ''
   echo '  Targets with <dt> embed a device tree blob inside the image'
-- 
2.7.4
