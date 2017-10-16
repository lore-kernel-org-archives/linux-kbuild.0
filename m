Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f43.google.com ([209.85.214.43]:52032 "EHLO
        mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754565AbdJPRNq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Oct 2017 13:13:46 -0400
Received: by mail-it0-f43.google.com with SMTP id o135so2012513itb.0
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Oct 2017 10:13:45 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v4 2/2] kbuild: Cache a few more calls to the compiler
Date: Mon, 16 Oct 2017 10:12:46 -0700
Message-Id: <20171016171246.15712-3-dianders@chromium.org>
In-Reply-To: <20171016171246.15712-1-dianders@chromium.org>
References: <20171016171246.15712-1-dianders@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com
Cc: groeck@chromium.org, sjg@chromium.org, briannorris@chromium.org, mingo@kernel.org, Douglas Anderson <dianders@chromium.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

These are a few stragglers that I left out of the original patch to
cache calls to the C compiler ("kbuild: Add a cache for generated
variables") because they bleed out into the main Makefile and thus
uglify things a little bit.  The idea is the same here, though.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Ingo Molnar <mingo@kernel.org>
Tested-by: Guenter Roeck <linux@roeck-us.net>
---

Changes in v4: None
Changes in v3:
- Add Tested-by for Ingo and Guenter since v2 and v3 are very similar

Changes in v2:
- Abstract at a different level (like shell-cached) per Masahiro Yamada

 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index a2d715d7a327..5c82cca84d29 100644
--- a/Makefile
+++ b/Makefile
@@ -638,7 +638,7 @@ KBUILD_CFLAGS += $(call cc-ifversion, -lt, 0409, \
 KBUILD_CFLAGS	+= $(call cc-option,--param=allow-store-data-races=0)
 
 # check for 'asm goto'
-ifeq ($(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh $(CC) $(KBUILD_CFLAGS)), y)
+ifeq ($(call shell-cached,$(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh $(CC) $(KBUILD_CFLAGS)), y)
 	KBUILD_CFLAGS += -DCC_HAVE_ASM_GOTO
 	KBUILD_AFLAGS += -DCC_HAVE_ASM_GOTO
 endif
@@ -774,7 +774,7 @@ KBUILD_CFLAGS	+= $(call cc-option,-fdata-sections,)
 endif
 
 # arch Makefile may override CC so keep this after arch Makefile is included
-NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
+NOSTDINC_FLAGS += -nostdinc -isystem $(call shell-cached,$(CC) -print-file-name=include)
 CHECKFLAGS     += $(NOSTDINC_FLAGS)
 
 # warn about C99 declaration after statement
-- 
2.15.0.rc0.271.g36b669edcc-goog

