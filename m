Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:50235 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753311AbbDHPih (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 Apr 2015 11:38:37 -0400
From: Andrey Ryabinin <a.ryabinin@samsung.com>
Subject: [PATCH] kasan: Makefile: shut up warnings if CONFIG_COMPILE_TEST=y
Date: Wed, 08 Apr 2015 18:38:25 +0300
Message-id: <1428507505-4015-1-git-send-email-a.ryabinin@samsung.com>
In-reply-to: <20150407160213.8f66c90ca812c30f362dd543@linux-foundation.org>
References: <20150407160213.8f66c90ca812c30f362dd543@linux-foundation.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Andrey Ryabinin <a.ryabinin@samsung.com>

It might be annoying to constantly see this:

	scripts/Makefile.kasan:16: Cannot use CONFIG_KASAN: -fsanitize=kernel-address is not supported by compiler

while performing allmodconfig/allyesconfig build tests.
Disable this warning if CONFIG_COMPILE_TEST=y.

Signed-off-by: Andrey Ryabinin <a.ryabinin@samsung.com>
---
 scripts/Makefile.kasan | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
index 631619b..3f874d2 100644
--- a/scripts/Makefile.kasan
+++ b/scripts/Makefile.kasan
@@ -13,12 +13,16 @@ CFLAGS_KASAN := $(call cc-option, -fsanitize=kernel-address \
 		--param asan-instrumentation-with-call-threshold=$(call_threshold))
 
 ifeq ($(call cc-option, $(CFLAGS_KASAN_MINIMAL) -Werror),)
+   ifneq ($(CONFIG_COMPILE_TEST),y)
         $(warning Cannot use CONFIG_KASAN: \
             -fsanitize=kernel-address is not supported by compiler)
+   endif
 else
     ifeq ($(CFLAGS_KASAN),)
-        $(warning CONFIG_KASAN: compiler does not support all options.\
-            Trying minimal configuration)
+        ifneq ($(CONFIG_COMPILE_TEST),y)
+            $(warning CONFIG_KASAN: compiler does not support all options.\
+                Trying minimal configuration)
+        endif
         CFLAGS_KASAN := $(CFLAGS_KASAN_MINIMAL)
     endif
 endif
-- 
2.3.5

