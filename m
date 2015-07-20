Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from one.firstfloor.org ([193.170.194.197]:50407 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753662AbbGTBDz (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 19 Jul 2015 21:03:55 -0400
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH] kbuild: Fix .text.unlikely placement
Date: Sun, 19 Jul 2015 18:01:19 -0700
Message-Id: <1437354079-18609-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: mmarek@suse.cz, linux-kernel@vger.kernel.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

When building a kernel with .text.unlikely text the unlikely text for
each translation unit was put next to the main .text code in the
final vmlinux.

The problem is that the linker doesn't allow more specific submatches
of a section name in a different linker script statement after the
main match.

So we need to move them all into one line. With that change
.text.unlikely is at the end of everything again.

I also moved .text.hot into the same statement though, even though
that's not strictly needed.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 include/asm-generic/vmlinux.lds.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 8bd374d..1781e54 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -412,12 +412,10 @@
  * during second ld run in second ld pass when generating System.map */
 #define TEXT_TEXT							\
 		ALIGN_FUNCTION();					\
-		*(.text.hot)						\
-		*(.text .text.fixup)					\
+		*(.text.hot .text .text.fixup .text.unlikely)		\
 		*(.ref.text)						\
 	MEM_KEEP(init.text)						\
 	MEM_KEEP(exit.text)						\
-		*(.text.unlikely)
 
 
 /* sched.text is aling to function alignment to secure we have same
-- 
2.4.5

