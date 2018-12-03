Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:60222 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725835AbeLCHvp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Dec 2018 02:51:45 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 3/7] microblaze: move "... is ready" message to arch/microblaze/Makefile
Date: Mon,  3 Dec 2018 16:50:53 +0900
Message-Id: <1543823457-32478-4-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
References: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Simek <monstr@monstr.eu>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

To prepare for more fixes, move this to arch/microblaze/Makefile.
Otherwise, the same "... is ready" would be printed multiple times.

(Another solution would be, to remove these messages entirely unless
people persist with them.)

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/microblaze/Makefile      | 2 ++
 arch/microblaze/boot/Makefile | 4 ----
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/microblaze/Makefile b/arch/microblaze/Makefile
index 97e1384..cfd7bfca 100644
--- a/arch/microblaze/Makefile
+++ b/arch/microblaze/Makefile
@@ -81,9 +81,11 @@ archclean:
 
 linux.bin linux.bin.gz linux.bin.ub: vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
+	@echo 'Kernel: $(boot)/$@ is ready' ' (#'`cat .version`')'
 
 simpleImage.%: vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
+	@echo 'Kernel: $(boot)/$@ is ready' ' (#'`cat .version`')'
 
 define archhelp
   echo '* linux.bin    - Create raw binary'
diff --git a/arch/microblaze/boot/Makefile b/arch/microblaze/boot/Makefile
index e8684a2..c2579a7 100644
--- a/arch/microblaze/boot/Makefile
+++ b/arch/microblaze/boot/Makefile
@@ -9,15 +9,12 @@ OBJCOPYFLAGS := -R .note -R .comment -R .note.gnu.build-id -O binary
 
 $(obj)/linux.bin: vmlinux FORCE
 	$(call if_changed,objcopy)
-	@echo 'Kernel: $@ is ready' ' (#'`cat .version`')'
 
 $(obj)/linux.bin.ub: $(obj)/linux.bin FORCE
 	$(call if_changed,uimage)
-	@echo 'Kernel: $@ is ready' ' (#'`cat .version`')'
 
 $(obj)/linux.bin.gz: $(obj)/linux.bin FORCE
 	$(call if_changed,gzip)
-	@echo 'Kernel: $@ is ready' ' (#'`cat .version`')'
 
 quiet_cmd_cp = CP      $< $@$2
 	cmd_cp = cat $< >$@$2 || (rm -f $@ && echo false)
@@ -35,6 +32,5 @@ $(obj)/simpleImage.%: vmlinux FORCE
 	$(call if_changed,objcopy)
 	$(call if_changed,uimage)
 	$(call if_changed,strip,.strip)
-	@echo 'Kernel: $(UIMAGE_OUT) is ready' ' (#'`cat .version`')'
 
 clean-files += simpleImage.*
-- 
2.7.4
