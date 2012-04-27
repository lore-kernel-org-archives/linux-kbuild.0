Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:50359 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758551Ab2D0DOy (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 26 Apr 2012 23:14:54 -0400
Received: by iadi9 with SMTP id i9so421610iad.19
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Apr 2012 20:14:53 -0700 (PDT)
From: Edward Shao <laface.tw@gmail.com>
Subject: [PATCH] kbuild: Makefile: remove unnecessary check for m68knommu ARCH
Date: Fri, 27 Apr 2012 11:14:44 +0800
Message-Id: <1335496484-3438-1-git-send-email-laface.tw@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: mmarek@suse.cz, sam@ravnborg.org, geert@linux-m68k.org

ARCH is never set to m68knomm.
make ARCH=m68knomm is not supported anymore.

Signed-off-by: Edward Shao <laface.tw@gmail.com>
---
 Makefile |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index afc868e..6f46cf9 100644
--- a/Makefile
+++ b/Makefile
@@ -231,10 +231,6 @@ endif
 # Where to locate arch specific headers
 hdr-arch  := $(SRCARCH)
 
-ifeq ($(ARCH),m68knommu)
-       hdr-arch  := m68k
-endif
-
 KCONFIG_CONFIG	?= .config
 export KCONFIG_CONFIG
 
-- 
1.7.7.6

