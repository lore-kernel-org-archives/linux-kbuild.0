Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:44434 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754063Ab1DEO7f (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 5 Apr 2011 10:59:35 -0400
From: Michal Marek <mmarek@suse.cz>
Subject: [PATCH 05/34] powerpc: Use the deterministic mode of ar
Date: Tue,  5 Apr 2011 16:58:52 +0200
Message-Id: <1302015561-21047-6-git-send-email-mmarek@suse.cz>
In-Reply-To: <1302015561-21047-1-git-send-email-mmarek@suse.cz>
References: <1302015561-21047-1-git-send-email-mmarek@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Michal Marek <mmarek@suse.cz>
---
 arch/powerpc/boot/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 8917816..d028a65 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -127,7 +127,7 @@ quiet_cmd_bootas = BOOTAS  $@
       cmd_bootas = $(CROSS32CC) -Wp,-MD,$(depfile) $(BOOTAFLAGS) -c -o $@ $<
 
 quiet_cmd_bootar = BOOTAR  $@
-      cmd_bootar = $(CROSS32AR) -cr $@.$$$$ $(filter-out FORCE,$^); mv $@.$$$$ $@
+      cmd_bootar = $(CROSS32AR) -crD $@.$$$$ $(filter-out FORCE,$^); mv $@.$$$$ $@
 
 $(obj-libfdt): $(obj)/%.o: $(srctree)/scripts/dtc/libfdt/%.c FORCE
 	$(call if_changed_dep,bootcc)
-- 
1.7.4.1

