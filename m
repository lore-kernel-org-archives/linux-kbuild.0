Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:29726 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730890AbfHVEq2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Aug 2019 00:46:28 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/6] kbuild: remove 'Using ... as source for kernel' message
Date: Thu, 22 Aug 2019 13:46:08 +0900
Message-Id: <20190822044613.5349-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

You already know the location of the source tree without this message.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Makefile b/Makefile
index 7e54a821b4b0..a77102e4ee90 100644
--- a/Makefile
+++ b/Makefile
@@ -1118,7 +1118,6 @@ PHONY += prepare archprepare prepare3
 # 1) Check that make has not been executed in the kernel src $(srctree)
 prepare3: include/config/kernel.release
 ifdef building_out_of_srctree
-	@$(kecho) '  Using $(srctree) as source for kernel'
 	$(Q)if [ -f $(srctree)/.config -o \
 		 -d $(srctree)/include/config -o \
 		 -d $(srctree)/arch/$(SRCARCH)/include/generated ]; then \
-- 
2.17.1
