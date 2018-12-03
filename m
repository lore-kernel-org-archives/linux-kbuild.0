Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:60224 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725832AbeLCHvp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Dec 2018 02:51:45 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 6/7] microblaze: fix race condition in building boot images
Date: Mon,  3 Dec 2018 16:50:56 +0900
Message-Id: <1543823457-32478-7-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
References: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Simek <monstr@monstr.eu>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

I fixed a race condition in the parallel building of ARM in commit
3939f3345050 ("ARM: 8418/1: add boot image dependencies to not
generate invalid images").

I see the same problem for MicroBlaze too.

"make -j<N> ARCH=microblaze all linux.bin.ub" results in a broken build
since two threads descend into arch/microblaze/boot simultaneously.

Add proper dependencies to avoid it.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/microblaze/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/microblaze/Makefile b/arch/microblaze/Makefile
index 7a5df02..544796d 100644
--- a/arch/microblaze/Makefile
+++ b/arch/microblaze/Makefile
@@ -79,13 +79,15 @@ all: linux.bin
 archclean:
 	$(Q)$(MAKE) $(clean)=$(boot)
 
+linux.bin.ub linux.bin.gz: linux.bin
+
 PHONY += linux.bin linux.bin.gz linux.bin.ub
 linux.bin linux.bin.gz linux.bin.ub: vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
 	@echo 'Kernel: $(boot)/$@ is ready' ' (#'`cat .version`')'
 
 PHONY += simpleImage.$(DTB)
-simpleImage.$(DTB): vmlinux
+simpleImage.$(DTB): linux.bin.ub
 	$(Q)$(MAKE) $(build)=$(boot) simple_images
 	@echo 'Kernel: $(boot)/$@ is ready' ' (#'`cat .version`')'
 
-- 
2.7.4
