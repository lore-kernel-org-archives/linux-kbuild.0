Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:42808 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757453AbYAXWEF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:04:05 -0500
Received: from ravnborg.org (0x535d98d8.vgnxx8.adsl-dhcp.tele.dk [83.93.152.216])
	by pasmtpB.tele.dk (Postfix) with ESMTP id 799C2E31CA2
	for <linux-kbuild@vger.kernel.org>; Thu, 24 Jan 2008 23:03:52 +0100 (CET)
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 68/77] kbuild: link vmlinux.o before kallsyms passes
Date: Thu, 24 Jan 2008 23:03:49 +0100
Message-Id: <1201212238-4369-68-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>

link vmlinux.o so we may report section mismatch bugs before
we start with the real link - that may error out.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 Makefile |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 1f22c1f..ae80713 100644
--- a/Makefile
+++ b/Makefile
@@ -798,7 +798,7 @@ define rule_vmlinux-modpost
 endef
 
 # vmlinux image - including updated kernel symbols
-vmlinux: $(vmlinux-lds) $(vmlinux-init) $(vmlinux-main) $(kallsyms.o) vmlinux.o FORCE
+vmlinux: $(vmlinux-lds) $(vmlinux-init) $(vmlinux-main) vmlinux.o $(kallsyms.o) FORCE
 ifdef CONFIG_HEADERS_CHECK
 	$(Q)$(MAKE) -f $(srctree)/Makefile headers_check
 endif
@@ -809,7 +809,9 @@ endif
 	$(call if_changed_rule,vmlinux__)
 	$(Q)rm -f .old_version
 
-vmlinux.o: $(vmlinux-lds) $(vmlinux-init) $(vmlinux-main) $(kallsyms.o) FORCE
+# build vmlinux.o first to catch section mismatch errors early
+$(kallsyms.o): vmlinux.o
+vmlinux.o: $(vmlinux-lds) $(vmlinux-init) $(vmlinux-main) FORCE
 	$(call if_changed_rule,vmlinux-modpost)
 
 # The actual objects are generated when descending, 
-- 
1.5.4.rc3.14.g44397

