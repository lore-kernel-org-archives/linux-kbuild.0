Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f176.google.com ([209.85.192.176]:49398 "EHLO
        mail-pf0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751273AbdJDWiU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Oct 2017 18:38:20 -0400
Received: by mail-pf0-f176.google.com with SMTP id l188so6981355pfc.6
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Oct 2017 15:38:20 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 2/2] kbuild: Cache a few more calls to the compiler
Date: Wed,  4 Oct 2017 15:37:17 -0700
Message-Id: <20171004223717.3010-3-dianders@chromium.org>
In-Reply-To: <20171004223717.3010-1-dianders@chromium.org>
References: <20171004223717.3010-1-dianders@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, mmarek@suse.com
Cc: groeck@chromium.org, sjg@chromium.org, briannorris@chromium.org, Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

These are a few stragglers that I left out of the original patch to
cache calls to the C compiler ("kbuild: Add a cache for generated
variables") because they bleed out into the main Makefile and thus
uglify things a little bit.  The idea is the same here, though.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Abstract at a different level (like shell-cached) per Masahiro Yamada

 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index d1119941261c..d366bdc3da04 100644
--- a/Makefile
+++ b/Makefile
@@ -652,7 +652,7 @@ KBUILD_CFLAGS += $(call cc-ifversion, -lt, 0409, \
 KBUILD_CFLAGS	+= $(call cc-option,--param=allow-store-data-races=0)
 
 # check for 'asm goto'
-ifeq ($(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh $(CC) $(KBUILD_CFLAGS)), y)
+ifeq ($(call shell-cached,$(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh $(CC) $(KBUILD_CFLAGS)), y)
 	KBUILD_CFLAGS += -DCC_HAVE_ASM_GOTO
 	KBUILD_AFLAGS += -DCC_HAVE_ASM_GOTO
 endif
@@ -788,7 +788,7 @@ KBUILD_CFLAGS	+= $(call cc-option,-fdata-sections,)
 endif
 
 # arch Makefile may override CC so keep this after arch Makefile is included
-NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
+NOSTDINC_FLAGS += -nostdinc -isystem $(call shell-cached,$(CC) -print-file-name=include)
 CHECKFLAGS     += $(NOSTDINC_FLAGS)
 
 # warn about C99 declaration after statement
-- 
2.14.2.920.gcf0c67979c-goog

