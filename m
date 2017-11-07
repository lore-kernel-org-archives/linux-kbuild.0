Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:46340 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751682AbdKGRiz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Nov 2017 12:38:55 -0500
Received: by mail-pf0-f193.google.com with SMTP id p87so4809pfj.3
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Nov 2017 09:38:54 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
Subject: [PATCH v2 1/3] Makefile: Move stack-protector compiler breakage test earlier
Date: Tue,  7 Nov 2017 09:38:38 -0800
Message-Id: <1510076320-69931-2-git-send-email-keescook@chromium.org>
In-Reply-To: <1510076320-69931-1-git-send-email-keescook@chromium.org>
References: <1510076320-69931-1-git-send-email-keescook@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kees Cook <keescook@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>, Nicholas Piggin <npiggin@gmail.com>, Laura Abbott <labbott@redhat.com>, linux-kernel@vger.kernel.org

In order to make stack-protector failures warn instead of unconditionally
breaking the build, this moves the compiler output sanity-check earlier,
and sets a flag for later testing. Future patches can choose to warn or
fail, depending on the flag value.

Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 Makefile | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index cf007a31d575..caa3f7e6f524 100644
--- a/Makefile
+++ b/Makefile
@@ -692,6 +692,12 @@ endif
 ifdef CONFIG_CC_STACKPROTECTOR
   stackp-path := $(srctree)/scripts/gcc-$(SRCARCH)_$(BITS)-has-stack-protector.sh
   stackp-check := $(wildcard $(stackp-path))
+  # If the wildcard test matches a test script, run it to check functionality.
+  ifdef stackp-check
+    ifneq ($(shell $(CONFIG_SHELL) $(stackp-check) $(CC) $(KBUILD_CPPFLAGS) $(biarch)),y)
+      stackp-broken := y
+    endif
+  endif
 endif
 KBUILD_CFLAGS += $(stackp-flag)
 
@@ -1087,11 +1093,9 @@ ifdef stackp-name
   endif
 endif
 # Make sure compiler does not have buggy stack-protector support.
-ifdef stackp-check
-  ifneq ($(shell $(CONFIG_SHELL) $(stackp-check) $(CC) $(KBUILD_CPPFLAGS) $(biarch)),y)
+ifdef stackp-broken
 	@echo Cannot use CONFIG_CC_STACKPROTECTOR_$(stackp-name): \
                   $(stackp-flag) available but compiler is broken >&2 && exit 1
-  endif
 endif
 	@:
 
-- 
2.7.4

