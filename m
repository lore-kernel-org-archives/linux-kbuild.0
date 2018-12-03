Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:60227 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbeLCHvp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Dec 2018 02:51:45 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 5/7] microblaze: add linux.bin* and simpleImage.* to PHONY
Date: Mon,  3 Dec 2018 16:50:55 +0900
Message-Id: <1543823457-32478-6-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
References: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Simek <monstr@monstr.eu>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

linux.bin, linux.bin.gz, and linux.bin.ub are phony targets to
generate a corresponding image under arch/microblaze/boot/.

simpleImage.% also works like a PHONY target, but a pattern that
contains '%' cannot be a PHONY target. I renamed it to equivalent
simpleImage.$(DTB).

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/microblaze/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/microblaze/Makefile b/arch/microblaze/Makefile
index c5d5b0e..7a5df02 100644
--- a/arch/microblaze/Makefile
+++ b/arch/microblaze/Makefile
@@ -79,11 +79,13 @@ all: linux.bin
 archclean:
 	$(Q)$(MAKE) $(clean)=$(boot)
 
+PHONY += linux.bin linux.bin.gz linux.bin.ub
 linux.bin linux.bin.gz linux.bin.ub: vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
 	@echo 'Kernel: $(boot)/$@ is ready' ' (#'`cat .version`')'
 
-simpleImage.%: vmlinux
+PHONY += simpleImage.$(DTB)
+simpleImage.$(DTB): vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) simple_images
 	@echo 'Kernel: $(boot)/$@ is ready' ' (#'`cat .version`')'
 
-- 
2.7.4
