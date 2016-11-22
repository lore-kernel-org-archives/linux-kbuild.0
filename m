Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:44154 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751028AbcKVVfj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Nov 2016 16:35:39 -0500
From: Michal Marek <mmarek@suse.com>
Subject: [PATCH 2/6] arm: Use full path in KBUILD_IMAGE definition
Date: Tue, 22 Nov 2016 22:34:30 +0100
Message-Id: <20161122213434.14788-2-mmarek@suse.com>
In-Reply-To: <20161122213434.14788-1-mmarek@suse.com>
References: <20161122213434.14788-1-mmarek@suse.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org

The KBUILD_IMAGE variable is used by the rpm and deb-pkg targets, which
expect it to point to the image file in the build directory. The
builddeb script has a workaround for architectures which only provide
the basename, but let's provide a clean interface for packaging tools.

Cc: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Michal Marek <mmarek@suse.com>
---
 arch/arm/Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 6be9ee148b78..f3fa2cafca15 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -296,10 +296,11 @@ drivers-$(CONFIG_OPROFILE)      += arch/arm/oprofile/
 libs-y				:= arch/arm/lib/ $(libs-y)
 
 # Default target when executing plain make
+boot := arch/arm/boot
 ifeq ($(CONFIG_XIP_KERNEL),y)
-KBUILD_IMAGE := xipImage
+KBUILD_IMAGE := $(boot)/xipImage
 else
-KBUILD_IMAGE := zImage
+KBUILD_IMAGE := $(boot)/zImage
 endif
 
 # Build the DT binary blobs if we have OF configured
@@ -307,9 +308,8 @@ ifeq ($(CONFIG_USE_OF),y)
 KBUILD_DTBS := dtbs
 endif
 
-all:	$(KBUILD_IMAGE) $(KBUILD_DTBS)
+all:	$(notdir $(KBUILD_IMAGE)) $(KBUILD_DTBS)
 
-boot := arch/arm/boot
 
 archprepare:
 	$(Q)$(MAKE) $(build)=arch/arm/tools include/generated/mach-types.h
-- 
2.10.0

