Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:46354 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752255Ab3LMCi2 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 12 Dec 2013 21:38:28 -0500
Received: from mail-gw.jp.panasonic.com ([157.8.1.157])
	by smtp.mei.co.jp (8.12.11.20060614/3.7W/kc-maile13) with ESMTP id rBD2cQ1B019346
	for <linux-kbuild@vger.kernel.org>; Fri, 13 Dec 2013 11:38:26 +0900 (JST)
Received: from epochmail.jp.panasonic.com ([157.8.1.130])
	by mail.jp.panasonic.com (8.11.6p2/3.7W/kc-maili17) with ESMTP id rBD2cQ314445
	for <linux-kbuild@vger.kernel.org>; Fri, 13 Dec 2013 11:38:26 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH] arm, kbuild: Do not define "comma" twice
Date: Fri, 13 Dec 2013 11:37:13 +0900
Message-Id: <1386902233-6280-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>

We have the definition of "comma" in scripts/Kbuild.include.
We should not double it.

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
---
 arch/arm/Makefile   | 2 --
 arch/arm64/Makefile | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index db50b62..60351d2 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -53,8 +53,6 @@ AS		+= -EL
 LD		+= -EL
 endif
 
-comma = ,
-
 # This selects which instruction set is used.
 # Note that GCC does not numerically define an architecture version
 # macro, but instead defines a whole series of macros which makes
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index d90cf79..75c5527 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -24,8 +24,6 @@ KBUILD_CPPFLAGS	+= -mlittle-endian
 AS		+= -EL
 LD		+= -EL
 
-comma = ,
-
 CHECKFLAGS	+= -D__aarch64__
 
 # Default value
-- 
1.8.3.2

