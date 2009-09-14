Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:50583 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756517AbZINVtf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Sep 2009 17:49:35 -0400
Message-Id: <200909142149.n8ELnJbp019009@imap1.linux-foundation.org>
Subject: [patch 18/18] kbuild: set -fconserve-stack option for gcc 4.5
From: akpm@linux-foundation.org
Date: Mon, 14 Sep 2009 14:49:18 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, andi@firstfloor.org, ak@linux.intel.com

From: Andi Kleen <andi@firstfloor.org>

The upcomming gcc 4.5 has a new -fconserve-stack option that tells the
inliner to take stack frame size in account.  Set it if the compiler
supports it.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 Makefile |    3 +++
 1 file changed, 3 insertions(+)

diff -puN Makefile~kbuild-set-fconserve-stack-option-for-gcc-45 Makefile
--- a/Makefile~kbuild-set-fconserve-stack-option-for-gcc-45
+++ a/Makefile
@@ -573,6 +573,9 @@ KBUILD_CFLAGS	+= $(call cc-option,-fno-s
 # revert to pre-gcc-4.4 behaviour of .eh_frame
 KBUILD_CFLAGS	+= $(call cc-option,-fno-dwarf2-cfi-asm)
 
+# conserve stack if available
+KBUILD_CFLAGS   += $(call cc-option,-fconserve-stack)
+
 # Add user supplied CPPFLAGS, AFLAGS and CFLAGS as the last assignments
 # But warn user when we do so
 warn-assign = \
_
