Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:35547 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756141AbdD3QQT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 30 Apr 2017 12:16:19 -0400
From: Rabin Vincent <rabin@rab.in>
Subject: [PATCH] Makefile: evaluate LDFLAGS_BUILD_ID only once
Date: Sun, 30 Apr 2017 18:16:00 +0200
Message-Id: <20170430161600.15845-1-rabin@rab.in>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, mmarek@suse.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Rabin Vincent <rabin@rab.in>

Evaluate LDFLAGS_BUILD_ID (which involves invoking the compiler) only
once instead of over and over.

This provides a ~20% reduction in null build time with x86 allnoconfig:

$ make allnoconfig && make -j8
$ perf stat -r5 -e sched:sched_process_exec make -j8
-       2 119      sched:sched_process_exec
+       1 878      sched:sched_process_exec

-       1,238817018 seconds time elapsed
+       0,971020553 seconds time elapsed

Signed-off-by: Rabin Vincent <rabin@rab.in>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 779302695453..c78a266594c1 100644
--- a/Makefile
+++ b/Makefile
@@ -815,7 +815,7 @@ KBUILD_AFLAGS   += $(ARCH_AFLAGS)   $(KAFLAGS)
 KBUILD_CFLAGS   += $(ARCH_CFLAGS)   $(KCFLAGS)
 
 # Use --build-id when available.
-LDFLAGS_BUILD_ID = $(patsubst -Wl$(comma)%,%,\
+LDFLAGS_BUILD_ID := $(patsubst -Wl$(comma)%,%,\
 			      $(call cc-ldoption, -Wl$(comma)--build-id,))
 KBUILD_LDFLAGS_MODULE += $(LDFLAGS_BUILD_ID)
 LDFLAGS_vmlinux += $(LDFLAGS_BUILD_ID)
-- 
2.11.0

