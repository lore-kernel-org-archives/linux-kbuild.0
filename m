Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:33967 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751725AbaHVKw5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 22 Aug 2014 06:52:57 -0400
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH] kbuild: arm: Do not define "comma" twice
Date: Fri, 22 Aug 2014 19:52:17 +0900
Message-Id: <1408704737-16973-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>, linux-arm-kernel@lists.infradead.org

The definition of "comma" exists in scripts/Kbuild.include.
We should not double it.

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm/Makefile   | 2 --
 arch/arm64/Makefile | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 0ce9d0f..8568b6fb 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -50,8 +50,6 @@ AS		+= -EL
 LD		+= -EL
 endif
 
-comma = ,
-
 # This selects which instruction set is used.
 # Note that GCC does not numerically define an architecture version
 # macro, but instead defines a whole series of macros which makes
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 5783354..ebd0659 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -30,8 +30,6 @@ AS		+= -EL
 LD		+= -EL
 endif
 
-comma = ,
-
 CHECKFLAGS	+= -D__aarch64__
 
 # Default value
-- 
1.9.1

