Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.133]:60786 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751910AbdAMPkf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Jan 2017 10:40:35 -0500
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] Kbuild: use cc-disable-warning consistently for maybe-uninitialized
Date: Fri, 13 Jan 2017 16:40:01 +0100
Message-Id: <20170113154010.2718601-1-arnd@arndb.de>
In-Reply-To: <201701131834.BsUjtXaC%fengguang.wu@intel.com>
References: <201701131834.BsUjtXaC%fengguang.wu@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, fengguang.wu@intel.com, kbuild-all@01.org, Arnd Bergmann <arnd@arndb.de>, stable@vger.kernel.org, linux-kernel@vger.kernel.org

In commit a76bcf557ef4 ("Kbuild: enable -Wmaybe-uninitialized warning
for "make W=1""), I reverted another change that happened to fix a problem
with old compilers, and now we get this report again with old compilers
(prior to gcc-4.8) and GCOV enabled:

   cc1: warnings being treated as errors
   drivers/gpu/drm/i915/intel_ringbuffer.c: In function 'intel_ring_setup_status_page':
   drivers/gpu/drm/i915/intel_ringbuffer.c:438: error: 'mmio.reg' may be used uninitialized in this function
   At top level:
>> cc1: error: unrecognized command line option "-Wno-maybe-uninitialized"

The problem is that we turn off the warning conditionally in a number
of places as we should, but one of them does it unconditionally.
Instead, change it to call cc-disable-warning as we do elsewhere.

The original patch that caused it was merged into linux-4.7, then
4.8 removed the change and 4.9 brought it back, so we probably want
a backport to 4.9 once this is merged.

Cc: stable@vger.kernel.org
Fixes: a76bcf557ef4 ("Kbuild: enable -Wmaybe-uninitialized warning for "make W=1"")
Fixes: e72e2dfe7c16 ("gcov: disable -Wmaybe-uninitialized warning")
Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 4fcc0f2dd93c..dbe9ce5d0e96 100644
--- a/Makefile
+++ b/Makefile
@@ -370,7 +370,7 @@ LDFLAGS_MODULE  =
 CFLAGS_KERNEL	=
 AFLAGS_KERNEL	=
 LDFLAGS_vmlinux =
-CFLAGS_GCOV	= -fprofile-arcs -ftest-coverage -fno-tree-loop-im -Wno-maybe-uninitialized
+CFLAGS_GCOV	= -fprofile-arcs -ftest-coverage -fno-tree-loop-im $(call cc-disable-warning,maybe-uninitialized,)
 CFLAGS_KCOV	:= $(call cc-option,-fsanitize-coverage=trace-pc,)
 
 
-- 
2.9.0

