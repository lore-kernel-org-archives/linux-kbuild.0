Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kapsi.fi ([217.30.184.167]:32840 "EHLO mail.kapsi.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750931AbbBPXGG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 Feb 2015 18:06:06 -0500
From: Mikko Rapeli <mikko.rapeli@iki.fi>
Subject: [PATCH 01/45] Makefile: propagate verbose options
Date: Tue, 17 Feb 2015 00:05:04 +0100
Message-Id: <1424127948-22484-2-git-send-email-mikko.rapeli@iki.fi>
In-Reply-To: <1424127948-22484-1-git-send-email-mikko.rapeli@iki.fi>
References: <1424127948-22484-1-git-send-email-mikko.rapeli@iki.fi>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Mikko Rapeli <mikko.rapeli@iki.fi>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

Usefull when debugging the make scripts.

Signed-off-by: Mikko Rapeli <mikko.rapeli@iki.fi>
---
 Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 4e93284..c1b515d 100644
--- a/Makefile
+++ b/Makefile
@@ -912,13 +912,13 @@ quiet_cmd_link-vmlinux = LINK    $@
 # execute if the rest of the kernel build went well.
 vmlinux: scripts/link-vmlinux.sh $(vmlinux-deps) FORCE
 ifdef CONFIG_HEADERS_CHECK
-	$(Q)$(MAKE) -f $(srctree)/Makefile headers_check
+	$(Q)$(MAKE) V=$(KBUILD_VERBOSE) -f $(srctree)/Makefile headers_check
 endif
 ifdef CONFIG_SAMPLES
-	$(Q)$(MAKE) $(build)=samples
+	$(Q)$(MAKE) V=$(KBUILD_VERBOSE) $(build)=samples
 endif
 ifdef CONFIG_BUILD_DOCSRC
-	$(Q)$(MAKE) $(build)=Documentation
+	$(Q)$(MAKE) V=$(KBUILD_VERBOSE) $(build)=Documentation
 endif
 	+$(call if_changed,link-vmlinux)
 
@@ -1069,7 +1069,7 @@ headers_check_all: headers_install_all
 PHONY += headers_check
 headers_check: headers_install
 	$(Q)$(MAKE) $(hdr-inst)=include/uapi HDRCHECK=1
-	$(Q)$(MAKE) $(hdr-inst)=arch/$(hdr-arch)/include/uapi/asm $(hdr-dst) HDRCHECK=1
+	$(Q)$(MAKE) V=$(KBUILD_VERBOSE) $(hdr-inst)=arch/$(hdr-arch)/include/uapi/asm $(hdr-dst) HDRCHECK=1
 
 # ---------------------------------------------------------------------------
 # Kernel selftest
-- 
2.1.4

