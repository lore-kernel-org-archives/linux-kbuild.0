Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f171.google.com ([209.85.192.171]:50432 "EHLO
        mail-pf0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756716AbdJKQTo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Oct 2017 12:19:44 -0400
Received: by mail-pf0-f171.google.com with SMTP id m63so1345757pfk.7
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Oct 2017 09:19:44 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v3 2/2] kbuild: Cache a few more calls to the compiler
Date: Wed, 11 Oct 2017 09:19:24 -0700
Message-Id: <20171011161924.11386-3-dianders@chromium.org>
In-Reply-To: <20171011161924.11386-1-dianders@chromium.org>
References: <20171011161924.11386-1-dianders@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com
Cc: groeck@chromium.org, sjg@chromium.org, briannorris@chromium.org, mingo@kernel.org, Douglas Anderson <dianders@chromium.org>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

These are a few stragglers that I left out of the original patch to
cache calls to the C compiler ("kbuild: Add a cache for generated
variables") because they bleed out into the main Makefile and thus
uglify things a little bit.  The idea is the same here, though.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Ingo Molnar <mingo@kernel.org>
Tested-by: Guenter Roeck <linux@roeck-us.net>
---

Changes in v3:
- Add Tested-by for Ingo and Guenter since v2 and v3 are very similar

Changes in v2:
- Abstract at a different level (like shell-cached) per Masahiro Yamada

 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 29c06eacf491..517d69cf30f8 100644
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
2.15.0.rc0.271.g36b669edcc-goog

