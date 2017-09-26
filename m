Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f169.google.com ([209.85.192.169]:56143 "EHLO
        mail-pf0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967636AbdIZRzt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Sep 2017 13:55:49 -0400
Received: by mail-pf0-f169.google.com with SMTP id r71so5896868pfe.12
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Sep 2017 10:55:48 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
Subject: [RFC PATCH 2/2] kbuild: Cache a few more calls to the compiler
Date: Tue, 26 Sep 2017 10:55:08 -0700
Message-Id: <20170926175508.29950-3-dianders@chromium.org>
In-Reply-To: <20170926175508.29950-1-dianders@chromium.org>
References: <20170926175508.29950-1-dianders@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, mmarek@suse.com
Cc: groeck@chromium.org, briannorris@chromium.org, Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

These are a few stragglers that I left out of the original patch to
cache calls to the C compiler ("kbuild: Add a cache for generated
variables") because they bleed out into the main Makefile and thus
uglify things a little bit.  The idea is the same here, though.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 Makefile | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index d1119941261c..7b7342d79771 100644
--- a/Makefile
+++ b/Makefile
@@ -652,7 +652,10 @@ KBUILD_CFLAGS += $(call cc-ifversion, -lt, 0409, \
 KBUILD_CFLAGS	+= $(call cc-option,--param=allow-store-data-races=0)
 
 # check for 'asm goto'
-ifeq ($(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh $(CC) $(KBUILD_CFLAGS)), y)
+ASM_GOTO = $(call cached-val,$(call __sanitize-opt,asm_goto_$(CC)),\
+	   $$(shell $(CONFIG_SHELL) \
+	   $(srctree)/scripts/gcc-goto.sh $(CC) $(KBUILD_CFLAGS)))
+ifeq ($(ASM_GOTO), y)
 	KBUILD_CFLAGS += -DCC_HAVE_ASM_GOTO
 	KBUILD_AFLAGS += -DCC_HAVE_ASM_GOTO
 endif
@@ -788,7 +791,9 @@ KBUILD_CFLAGS	+= $(call cc-option,-fdata-sections,)
 endif
 
 # arch Makefile may override CC so keep this after arch Makefile is included
-NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
+NOSTDINC_FLAGS += -nostdinc -isystem \
+		  $(call cached-val,$(call __sanitize-opt,cc_include_$(CC)),\
+		  $$(shell $(CC) -print-file-name=include))
 CHECKFLAGS     += $(NOSTDINC_FLAGS)
 
 # warn about C99 declaration after statement
-- 
2.14.1.821.g8fa685d3b7-goog

