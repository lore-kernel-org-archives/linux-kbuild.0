Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:39264 "EHLO
	baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753940AbbBAUA3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 1 Feb 2015 15:00:29 -0500
From: Yann Droneaud <ydroneaud@opteya.com>
Subject: [PATCH] kbuild: support W=e to make build abort in case of warning
Date: Sun,  1 Feb 2015 16:15:20 +0100
Message-Id: <1422803720-14723-1-git-send-email-ydroneaud@opteya.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Yann Droneaud <ydroneaud@opteya.com>

In order to piss off^W^Whelp people trying to fix warnings,
this patch introduces a new 'e' modifier to W= as a short
hand for KCFLAGS+=-Werror" so that -Werror got added to
the kernel (built-in) and modules' CFLAGS and makes the
build abort when any warning is reported by the compiler.

In the end, people not sane enough can do not so useful
thing such as 'make W=123e'.

Signed-off-by: Yann Droneaud <ydroneaud@opteya.com>
---
 Makefile                   | 1 +
 scripts/Makefile.extrawarn | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/Makefile b/Makefile
index 6b69223a5267..42fd50d939e8 100644
--- a/Makefile
+++ b/Makefile
@@ -1338,6 +1338,7 @@ help:
 	@echo  '		1: warnings which may be relevant and do not occur too often'
 	@echo  '		2: warnings which occur quite often but may still be relevant'
 	@echo  '		3: more obscure warnings, can most likely be ignored'
+	@echo  '		e: warnings are being treated as errors'
 	@echo  '		Multiple levels can be combined with W=12 or W=123'
 	@echo  ''
 	@echo  'Execute "make" or "make all" to build all targets marked with [*] '
diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index f734033af219..798796e078d9 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -5,6 +5,7 @@
 # W=1 - warnings that may be relevant and does not occur too often
 # W=2 - warnings that occur quite often but may still be relevant
 # W=3 - the more obscure warnings, can most likely be ignored
+# W=e - warnings are being treated as errors
 #
 # $(call cc-option, -W...) handles gcc -W.. options which
 # are not supported by all versions of the compiler
@@ -45,9 +46,12 @@ warning-3 += -Wswitch-default
 warning-3 += $(call cc-option, -Wpacked-bitfield-compat)
 warning-3 += $(call cc-option, -Wvla)
 
+warning-e := -Werror
+
 warning := $(warning-$(findstring 1, $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)))
 warning += $(warning-$(findstring 2, $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)))
 warning += $(warning-$(findstring 3, $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)))
+warning += $(warning-$(findstring e, $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)))
 
 ifeq ("$(strip $(warning))","")
         $(error W=$(KBUILD_ENABLE_EXTRA_GCC_CHECKS) is unknown)
-- 
2.1.0

