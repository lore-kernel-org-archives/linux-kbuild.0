Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:59376 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932544AbcDYNTM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 25 Apr 2016 09:19:12 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 1/3] kbuild: call adjust_autoksyms.sh from source directory
Date: Mon, 25 Apr 2016 15:17:19 +0200
Message-Id: <1461590265-1397577-1-git-send-email-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Nicolas Pitre <nico@linaro.org>, Rusty Russell <rusty@rustcorp.com.au>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

When building with separate object trees, scripts/adjust_autoksyms.sh
cannot be called from the object directory:

/bin/bash: scripts/adjust_autoksyms.sh: No such file or directory

This adds a $(src) prefix, as we do for all other shell scripts.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Fixes: 23121ca2b56b ("kbuild: create/adjust generated/autoksyms.h")
---
 Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 81534210dcb9..b5c67617a98d 100644
--- a/Makefile
+++ b/Makefile
@@ -945,7 +945,7 @@ quiet_cmd_link-vmlinux = LINK    $@
 # execute if the rest of the kernel build went well.
 vmlinux: scripts/link-vmlinux.sh $(vmlinux-deps) FORCE
 ifdef CONFIG_TRIM_UNUSED_KSYMS
-	$(Q)$(CONFIG_SHELL) scripts/adjust_autoksyms.sh \
+	$(Q)$(CONFIG_SHELL) $(src)/scripts/adjust_autoksyms.sh \
 	  "$(MAKE) KBUILD_MODULES=1 -f $(srctree)/Makefile autoksyms_recursive"
 endif
 ifdef CONFIG_HEADERS_CHECK
@@ -960,13 +960,13 @@ endif
 	+$(call if_changed,link-vmlinux)
 
 autoksyms_recursive: $(vmlinux-deps)
-	$(Q)$(CONFIG_SHELL) scripts/adjust_autoksyms.sh \
+	$(Q)$(CONFIG_SHELL) $(src)/scripts/adjust_autoksyms.sh \
 	  "$(MAKE) KBUILD_MODULES=1 -f $(srctree)/Makefile autoksyms_recursive"
 PHONY += autoksyms_recursive
 
 # standalone target for easier testing
 include/generated/autoksyms.h: FORCE
-	$(Q)$(CONFIG_SHELL) scripts/adjust_autoksyms.sh true
+	$(Q)$(CONFIG_SHELL) $(src)/scripts/adjust_autoksyms.sh true
 
 # Build samples along the rest of the kernel
 ifdef CONFIG_SAMPLES
-- 
2.7.0

