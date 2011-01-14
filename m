Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from qmta02.emeryville.ca.mail.comcast.net ([76.96.30.24]:54725 "EHLO
	qmta02.emeryville.ca.mail.comcast.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757107Ab1ANOTC (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Jan 2011 09:19:02 -0500
From: matt mooney <mfm@muteddisk.com>
Subject: [RESEND PATCH 03/27] arm: change to new flag variables
Date: Fri, 14 Jan 2011 06:12:26 -0800
Message-Id: <a2c35e99040d0679f827c1fde5c56e845f79b955.1295006565.git.mfm@muteddisk.com>
In-Reply-To: <cover.1295006561.git.mfm@muteddisk.com>
References: <cover.1295006561.git.mfm@muteddisk.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Replace EXTRA_CFLAGS with ccflags-y and EXTRA_AFLAGS with asflags-y.

Signed-off-by: matt mooney <mfm@muteddisk.com>
Acked-by: WANG Cong <xiyou.wangcong@gmail.com>
---
 arch/arm/boot/compressed/Makefile |    4 ++--
 arch/arm/vfp/Makefile             |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
index 0a8f748..0a53b8a 100644
--- a/arch/arm/boot/compressed/Makefile
+++ b/arch/arm/boot/compressed/Makefile
@@ -80,8 +80,8 @@ ORIG_CFLAGS := $(KBUILD_CFLAGS)
 KBUILD_CFLAGS = $(subst -pg, , $(ORIG_CFLAGS))
 endif
 
-EXTRA_CFLAGS  := -fpic -fno-builtin
-EXTRA_AFLAGS  := -Wa,-march=all
+ccflags-y := -fpic -fno-builtin
+asflags-y := -Wa,-march=all
 
 # Supply ZRELADDR to the decompressor via a linker symbol.
 ifneq ($(CONFIG_AUTO_ZRELADDR),y)
diff --git a/arch/arm/vfp/Makefile b/arch/arm/vfp/Makefile
index 39f6d8e..6de73aa 100644
--- a/arch/arm/vfp/Makefile
+++ b/arch/arm/vfp/Makefile
@@ -4,8 +4,8 @@
 # Copyright (C) 2001 ARM Limited
 #
 
-# EXTRA_CFLAGS := -DDEBUG
-# EXTRA_AFLAGS := -DDEBUG
+# ccflags-y := -DDEBUG
+# asflags-y := -DDEBUG
 
 KBUILD_AFLAGS	:=$(KBUILD_AFLAGS:-msoft-float=-Wa,-mfpu=softvfp+vfp)
 LDFLAGS		+=--no-warn-mismatch
-- 
1.7.3.4

