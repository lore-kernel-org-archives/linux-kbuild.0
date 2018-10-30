Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:36013 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727650AbeJ3WUW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Oct 2018 18:20:22 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 2/2] kbuild: remove cc-name variable
Date: Tue, 30 Oct 2018 22:26:34 +0900
Message-Id: <1540905994-6073-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1540905994-6073-1-git-send-email-yamada.masahiro@socionext.com>
References: <1540905994-6073-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

There is one more user of $(cc-name) in the top Makefile. It is supposed
to detect Clang before invoking Kconfig, so it should still be there
in the $(shell ...) form. All the other users of $(cc-name) have been
replaced with $(CONFIG_CC_IS_CLANG). Hence, scripts/Kbuild.include does
not need to define cc-name any more.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 Makefile               | 2 +-
 scripts/Kbuild.include | 4 ----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 1c0696d..25b1518 100644
--- a/Makefile
+++ b/Makefile
@@ -485,7 +485,7 @@ ifneq ($(KBUILD_SRC),)
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkmakefile $(srctree)
 endif
 
-ifeq ($(cc-name),clang)
+ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
 ifneq ($(CROSS_COMPILE),)
 CLANG_TARGET	:= --target=$(notdir $(CROSS_COMPILE:%-=%))
 GCC_TOOLCHAIN_DIR := $(dir $(shell which $(LD)))
diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index ca21a35..51703ae 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -140,10 +140,6 @@ cc-option-yn = $(call try-run,\
 cc-disable-warning = $(call try-run,\
 	$(CC) -Werror $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) -W$(strip $(1)) -c -x c /dev/null -o "$$TMP",-Wno-$(strip $(1)))
 
-# cc-name
-# Expands to either gcc or clang
-cc-name = $(shell $(CC) -v 2>&1 | grep -q "clang version" && echo clang || echo gcc)
-
 # cc-version
 cc-version = $(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-version.sh $(CC))
 
-- 
2.7.4
