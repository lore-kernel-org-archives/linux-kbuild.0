Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:33101 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751891AbcF0S2y (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 27 Jun 2016 14:28:54 -0400
From: Rabin Vincent <rabin@rab.in>
Subject: [PATCH 1/2] Makefile: evaluate LDFLAGS_BUILD_ID only once
Date: Mon, 27 Jun 2016 20:28:26 +0200
Message-Id: <1467052107-26735-1-git-send-email-rabin@rab.in>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Rabin Vincent <rabin@rab.in>

Evaluate LDFLAGS_BUILD_ID (which involves invoking the compiler) only
once instead of over and over.

This provides a 20% reduction in null build time with x86 allnoconfig on
my machine:

$ make -j8 && perf stat -r5 make -j8
Before: 1,086617617 seconds time elapsed ( +-  0,37% )
 After: 0,864487173 seconds time elapsed ( +-  0,35% )

Signed-off-by: Rabin Vincent <rabin@rab.in>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 6471f20ca400..91baa282f3fa 100644
--- a/Makefile
+++ b/Makefile
@@ -814,7 +814,7 @@ KBUILD_AFLAGS   += $(ARCH_AFLAGS)   $(KAFLAGS)
 KBUILD_CFLAGS   += $(ARCH_CFLAGS)   $(KCFLAGS)
 
 # Use --build-id when available.
-LDFLAGS_BUILD_ID = $(patsubst -Wl$(comma)%,%,\
+LDFLAGS_BUILD_ID := $(patsubst -Wl$(comma)%,%,\
 			      $(call cc-ldoption, -Wl$(comma)--build-id,))
 KBUILD_LDFLAGS_MODULE += $(LDFLAGS_BUILD_ID)
 LDFLAGS_vmlinux += $(LDFLAGS_BUILD_ID)
-- 
2.8.1

