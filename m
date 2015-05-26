Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from wilson.telenet-ops.be ([195.130.132.42]:50255 "EHLO
	wilson.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932270AbbEZNg0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 May 2015 09:36:26 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	by wilson.telenet-ops.be (Postfix) with ESMTP id C6EA835949
	for <linux-kbuild@vger.kernel.org>; Tue, 26 May 2015 13:40:14 +0200 (CEST)
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] Blackfin: Wrap long "make help" text lines
Date: Tue, 26 May 2015 13:39:53 +0200
Message-Id: <1432640395-17310-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Steven Miao <realmz6@gmail.com>, adi-buildroot-devel@lists.sourceforge.net

Some "make help" text lines extend beyond 80 characters. Wrap them at 79
characters.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Steven Miao <realmz6@gmail.com>
Cc: adi-buildroot-devel@lists.sourceforge.net
---
 arch/blackfin/Makefile | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/blackfin/Makefile b/arch/blackfin/Makefile
index 1fce08632ad763ab..a6ce3ba90b6706a5 100644
--- a/arch/blackfin/Makefile
+++ b/arch/blackfin/Makefile
@@ -155,12 +155,18 @@ install:
 
 define archhelp
   echo  '* vmImage         - Alias to selected kernel format (vmImage.gz by default)'
-  echo  '  vmImage.bin     - Uncompressed Kernel-only image for U-Boot (arch/$(ARCH)/boot/vmImage.bin)'
-  echo  '  vmImage.bz2     - Kernel-only image for U-Boot (arch/$(ARCH)/boot/vmImage.bz2)'
-  echo  '* vmImage.gz      - Kernel-only image for U-Boot (arch/$(ARCH)/boot/vmImage.gz)'
-  echo  '  vmImage.lzma    - Kernel-only image for U-Boot (arch/$(ARCH)/boot/vmImage.lzma)'
-  echo  '  vmImage.lzo     - Kernel-only image for U-Boot (arch/$(ARCH)/boot/vmImage.lzo)'
-  echo  '  vmImage.xip     - XIP Kernel-only image for U-Boot (arch/$(ARCH)/boot/vmImage.xip)'
+  echo  '  vmImage.bin     - Uncompressed Kernel-only image for U-Boot'
+  echo  '                     (arch/$(ARCH)/boot/vmImage.bin)'
+  echo  '  vmImage.bz2     - Kernel-only image for U-Boot'
+  echo  '                     (arch/$(ARCH)/boot/vmImage.bz2)'
+  echo  '* vmImage.gz      - Kernel-only image for U-Boot'
+  echo  '                     (arch/$(ARCH)/boot/vmImage.gz)'
+  echo  '  vmImage.lzma    - Kernel-only image for U-Boot'
+  echo  '                     (arch/$(ARCH)/boot/vmImage.lzma)'
+  echo  '  vmImage.lzo     - Kernel-only image for U-Boot'
+  echo  '                     (arch/$(ARCH)/boot/vmImage.lzo)'
+  echo  '  vmImage.xip     - XIP Kernel-only image for U-Boot'
+  echo  '                     (arch/$(ARCH)/boot/vmImage.xip)'
   echo  '  install         - Install kernel using'
   echo  '                     (your) ~/bin/$(INSTALLKERNEL) or'
   echo  '                     (distribution) PATH: $(INSTALLKERNEL) or'
-- 
1.9.1

