Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl0-f67.google.com ([209.85.160.67]:37032 "EHLO
        mail-pl0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756501AbeEJFRU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 May 2018 01:17:20 -0400
Received: by mail-pl0-f67.google.com with SMTP id f7-v6so609674plr.4
        for <linux-kbuild@vger.kernel.org>; Wed, 09 May 2018 22:17:20 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 3/5] kbuild: call cc-option with the current set of KBUILD_CFLAGS
Date: Thu, 10 May 2018 15:16:57 +1000
Message-Id: <20180510051659.15356-4-npiggin@gmail.com>
In-Reply-To: <20180510051659.15356-1-npiggin@gmail.com>
References: <20180510051659.15356-1-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Nicholas Piggin <npiggin@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linuxppc-dev@lists.ozlabs.org

In some cases, the options that gcc will accept depend on options it
has already been given. For example -m32 / -m64 and -mbig-endian /
-mlittle-endian can have this affect.

Passing in KBUILD_CFLAGS to cc-option allows an architecture to
set such basic machine types at the beginning, rather than override
CC itself.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/Kbuild.include | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 9f7eb10079cc..66869bb815d2 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -121,7 +121,7 @@ CC_OPTION_CFLAGS = $(filter-out $(GCC_PLUGINS_CFLAGS),$(KBUILD_CFLAGS))
 # Usage: cflags-y += $(call cc-option,-march=winchip-c6,-march=i586)
 
 cc-option = $(call __cc-option, $(CC),\
-	$(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS),$(1),$(2))
+	$(KBUILD_CFLAGS) $(CC_OPTION_CFLAGS),$(1),$(2))
 
 # hostcc-option
 # Usage: cflags-y += $(call hostcc-option,-march=winchip-c6,-march=i586)
@@ -131,12 +131,12 @@ hostcc-option = $(call __cc-option, $(HOSTCC),\
 # cc-option-yn
 # Usage: flag := $(call cc-option-yn,-march=winchip-c6)
 cc-option-yn = $(call try-run,\
-	$(CC) -Werror $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) $(1) -c -x c /dev/null -o "$$TMP",y,n)
+	$(CC) -Werror $(KBUILD_CFLAGS) $(CC_OPTION_CFLAGS) $(1) -c -x c /dev/null -o "$$TMP",y,n)
 
 # cc-disable-warning
 # Usage: cflags-y += $(call cc-disable-warning,unused-but-set-variable)
 cc-disable-warning = $(call try-run,\
-	$(CC) -Werror $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) -W$(strip $(1)) -c -x c /dev/null -o "$$TMP",-Wno-$(strip $(1)))
+	$(CC) -Werror $(KBUILD_CFLAGS) $(CC_OPTION_CFLAGS) -W$(strip $(1)) -c -x c /dev/null -o "$$TMP",-Wno-$(strip $(1)))
 
 # cc-name
 # Expands to either gcc or clang
@@ -160,7 +160,7 @@ cc-if-fullversion = $(shell [ $(cc-fullversion) $(1) $(2) ] && echo $(3) || echo
 # cc-ldoption
 # Usage: ldflags += $(call cc-ldoption, -Wl$(comma)--hash-style=both)
 cc-ldoption = $(call try-run,\
-	$(CC) $(1) $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) -nostdlib -x c /dev/null -o "$$TMP",$(1),$(2))
+	$(CC) $(1) $(KBUILD_CFLAGS) $(CC_OPTION_CFLAGS) -nostdlib -x c /dev/null -o "$$TMP",$(1),$(2))
 
 # ld-option
 # Usage: LDFLAGS += $(call ld-option, -X)
-- 
2.17.0

