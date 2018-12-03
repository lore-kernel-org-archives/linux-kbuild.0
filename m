Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:60228 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbeLCHvp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Dec 2018 02:51:45 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/7] microblaze: fix cleaning of boot images
Date: Mon,  3 Dec 2018 16:50:51 +0900
Message-Id: <1543823457-32478-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
References: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Simek <monstr@monstr.eu>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

The simpleImage.<dt> target generates the following files:

  arch/microblaze/boot/simpleImage.<dt>
  arch/microblaze/boot/simpleImage.<dt>.ub
  arch/microblaze/boot/simpleImage.<dt>.strip
  arch/microblaze/boot/simpleImage.<dt>.unstrip

However, "make ARCH=microblaze clean" only cleans up the unstrip
image. Fix the clean-files to take care of all the four.

Adding linux.bin.ub to clean-files is redundant because it is
already added into "targets".

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/microblaze/boot/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/microblaze/boot/Makefile b/arch/microblaze/boot/Makefile
index 600e5a1..e8684a2 100644
--- a/arch/microblaze/boot/Makefile
+++ b/arch/microblaze/boot/Makefile
@@ -37,4 +37,4 @@ $(obj)/simpleImage.%: vmlinux FORCE
 	$(call if_changed,strip,.strip)
 	@echo 'Kernel: $(UIMAGE_OUT) is ready' ' (#'`cat .version`')'
 
-clean-files += simpleImage.*.unstrip linux.bin.ub
+clean-files += simpleImage.*
-- 
2.7.4
