Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from [212.203.95.146] ([212.203.95.146]:59066 "EHLO
	srv01.theangrymob.co.uk" rhost-flags-FAIL-FAIL-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752422Ab3AWRwv (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 23 Jan 2013 12:52:51 -0500
Received: from [192.168.150.5] (217-162-209-89.dynamic.hispeed.ch [217.162.209.89])
	by srv01.theangrymob.co.uk (Postfix) with ESMTPSA id 7353E45D801F
	for <linux-kbuild@vger.kernel.org>; Wed, 23 Jan 2013 18:43:18 +0100 (CET)
Message-ID: <51002135.2060302@theangrymob.co.uk>
Date: Wed, 23 Jan 2013 18:43:17 +0100
From: Alec Bickerton <alec@theangrymob.co.uk>
Reply-To: alec@theangrymob.co.uk
MIME-Version: 1.0
Subject: [PATCH] Add Intel Ivy bridge CPU flags
Content-Type: multipart/mixed;
 boundary="------------020903030709050603020200"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

This is a multi-part message in MIME format.
--------------020903030709050603020200
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I'd like to submit the attached patch to add Ivy Bridge processor support to the
processor type menu in menuconfig. Setting this configures the appropriate
CFLAGS (core-avx-i) for ivy bridge.

As this is my first kbuild patch, could somebody review it and let me know what
I've done wrong. ;-)

Thanks
Alec.

--------------020903030709050603020200
Content-Type: text/x-patch;
 name="0001-Added-Ivy-bridge-to-menu.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-Added-Ivy-bridge-to-menu.patch"

From 2eaf7717da5b7f753c66e2158d29744aafbc2a0c Mon Sep 17 00:00:00 2001
From: Alec Bickerton <alec.bickerton@gmail.com>
Date: Mon, 1 Oct 2012 21:12:55 +0200
Subject: [PATCH] Added Ivy bridge to menu

---
 arch/x86/Kconfig.cpu          |    5 +++++
 arch/x86/Makefile             |    5 ++++-
 arch/x86/Makefile_32.cpu      |    1 +
 arch/x86/include/asm/module.h |    2 ++
 4 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/x86/Kconfig.cpu b/arch/x86/Kconfig.cpu
index f3b86d0..e7834c0 100644
--- a/arch/x86/Kconfig.cpu
+++ b/arch/x86/Kconfig.cpu
@@ -267,6 +267,11 @@ config MCORE2
 	  53xx) CPUs. You can distinguish newer from older Xeons by the CPU
 	  family in /proc/cpuinfo. Newer ones have 6 and older ones 15
 	  (not a typo)
+config MIVYBRIDGE
+    bool "Intel Ivy Bridge"
+    --help--
+    
+      Select this foe Intel 3770K family processors.
 
 config MATOM
 	bool "Intel Atom"
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 474ca35..e945e58 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -61,7 +61,10 @@ else
         cflags-$(CONFIG_MPSC) += $(call cc-option,-march=nocona)
 
         cflags-$(CONFIG_MCORE2) += \
-                $(call cc-option,-march=core2,$(call cc-option,-mtune=generic))
+                $(call cc-option,-march=core2,$(call cc-option,-mtune=generic)
+		)
+        cflags-$(CONFIG_MIVYBRIDGE) += \
+                $(call cc-option,-march=core-avx-i,$(call cc-option,-mtune=generic))
 	cflags-$(CONFIG_MATOM) += $(call cc-option,-march=atom) \
 		$(call cc-option,-mtune=atom,$(call cc-option,-mtune=generic))
         cflags-$(CONFIG_GENERIC_CPU) += $(call cc-option,-mtune=generic)
diff --git a/arch/x86/Makefile_32.cpu b/arch/x86/Makefile_32.cpu
index 86cee7b..f5194ff 100644
--- a/arch/x86/Makefile_32.cpu
+++ b/arch/x86/Makefile_32.cpu
@@ -33,6 +33,7 @@ cflags-$(CONFIG_MCYRIXIII)	+= $(call cc-option,-march=c3,-march=i486) $(align)-f
 cflags-$(CONFIG_MVIAC3_2)	+= $(call cc-option,-march=c3-2,-march=i686)
 cflags-$(CONFIG_MVIAC7)		+= -march=i686
 cflags-$(CONFIG_MCORE2)		+= -march=i686 $(call tune,core2)
+cflags-$(CONFIG_MIVYBRIDGE)		+= -march=i686 $(call tune,core-avx-i)
 cflags-$(CONFIG_MATOM)		+= $(call cc-option,-march=atom,$(call cc-option,-march=core2,-march=i686)) \
 	$(call cc-option,-mtune=atom,$(call cc-option,-mtune=generic))
 
diff --git a/arch/x86/include/asm/module.h b/arch/x86/include/asm/module.h
index 9eae775..758a438 100644
--- a/arch/x86/include/asm/module.h
+++ b/arch/x86/include/asm/module.h
@@ -17,6 +17,8 @@
 #define MODULE_PROC_FAMILY "586MMX "
 #elif defined CONFIG_MCORE2
 #define MODULE_PROC_FAMILY "CORE2 "
+#elif defined CONFIG_MIVYBRIDGE
+#define MODULE_PROC_FAMILY "IVYBRIDGE"
 #elif defined CONFIG_MATOM
 #define MODULE_PROC_FAMILY "ATOM "
 #elif defined CONFIG_M686
-- 
1.7.10.4


--------------020903030709050603020200--
