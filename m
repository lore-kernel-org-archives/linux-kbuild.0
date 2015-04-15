Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from one.firstfloor.org ([193.170.194.197]:57675 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751607AbbDOTsm (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Apr 2015 15:48:42 -0400
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH] Support gcc 6 for building
Date: Wed, 15 Apr 2015 12:45:43 -0700
Message-Id: <1429127143-31745-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: mmarek@suse.cz, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, Segher Boessenkool <segher@kernel.crashing.org>

From: Andi Kleen <ak@linux.intel.com>

gcc recently switched to a new version number scheme, where every version
gets a new major version number. The current version is 5.x, the next 6.x, etc.

The gcc git repository trunk branch just switched to report 6.x for the next
major release.

This breaks the way Linux selects compiler-gccX.h based on the major
version. Every new version would require adding a new compiler-gccX.h file,
which wouldn't really scale.

Let's assume that future gccs are fairly compatible (they are unlikely
to break anything Linux is relying on). So we can just keep using
compiler-gcc5.h, and select any specific differences with #if.

Cc: Segher Boessenkool <segher@kernel.crashing.org>
Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 include/linux/compiler-gcc.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
index cdf13ca..9c9a4e4 100644
--- a/include/linux/compiler-gcc.h
+++ b/include/linux/compiler-gcc.h
@@ -104,7 +104,12 @@
 #define __gcc_header(x) #x
 #define _gcc_header(x) __gcc_header(linux/compiler-gcc##x.h)
 #define gcc_header(x) _gcc_header(x)
-#include gcc_header(__GNUC__)
+#if __GNUC__ < 5
+#define __LINUX_GCC_VERSION __GNUC__
+#else
+#define __LINUX_GCC_VERSION 5
+#endif
+#include gcc_header(__LINUX_GCC_VERSION)
 
 #if !defined(__noclone)
 #define __noclone	/* not needed */
-- 
2.3.3

