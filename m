Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-da0-f43.google.com ([209.85.210.43]:55727 "EHLO
	mail-da0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752176Ab3AUH2U (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 21 Jan 2013 02:28:20 -0500
From: Bin Wang <wbin00@gmail.com>
Subject: [PATCH 1/1] scripts/package/Makefile: remove useless KBUILD_OUTPUT test
Date: Mon, 21 Jan 2013 15:28:05 +0800
Message-Id: <1358753285-11812-1-git-send-email-wbin00@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bin Wang <wbin00@gmail.com>

The test of KBUILD_OUTPUT in "rpm-pkg rpm" target is useless.
KBUILD_OUTPUT is always empty here.

Signed-off-by: Bin Wang <wbin00@gmail.com>
---
 scripts/package/Makefile | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 87bf080..ba073a6 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -36,12 +36,6 @@ $(objtree)/kernel.spec: $(MKSPEC) $(srctree)/Makefile
 	$(CONFIG_SHELL) $(MKSPEC) > $@
 
 rpm-pkg rpm: $(objtree)/kernel.spec FORCE
-	@if test -n "$(KBUILD_OUTPUT)"; then \
-		echo "Building source + binary RPM is not possible outside the"; \
-		echo "kernel source tree. Don't set KBUILD_OUTPUT, or use the"; \
-		echo "binrpm-pkg target instead."; \
-		false; \
-	fi
 	$(MAKE) clean
 	$(PREV) ln -sf $(srctree) $(KERNELPATH)
 	$(CONFIG_SHELL) $(srctree)/scripts/setlocalversion --save-scmversion
-- 
1.7.11.7

