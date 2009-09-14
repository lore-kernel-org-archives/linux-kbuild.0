Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:57991 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756219AbZINVte (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Sep 2009 17:49:34 -0400
Message-Id: <200909142149.n8ELnHY4018867@imap1.linux-foundation.org>
Subject: [patch 15/18] kbuild: check if linker supports the -X option
From: akpm@linux-foundation.org
Date: Mon, 14 Sep 2009 14:49:16 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, andi@firstfloor.org, ak@linux.intel.com

From: Andi Kleen <andi@firstfloor.org>

The new alternative `gold' linker in recent binutils doesn't support the
-X option.  This breaks allyesconfig builds that have
CONFIG_STRIP_ASM_SYMS enabled.  Check if the linker really supports the
option using ld-option.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -puN Makefile~kbuild-check-if-linker-supports-the-x-option Makefile
--- a/Makefile~kbuild-check-if-linker-supports-the-x-option
+++ a/Makefile
@@ -598,7 +598,7 @@ LDFLAGS_MODULE += $(LDFLAGS_BUILD_ID)
 LDFLAGS_vmlinux += $(LDFLAGS_BUILD_ID)
 
 ifeq ($(CONFIG_STRIP_ASM_SYMS),y)
-LDFLAGS_vmlinux	+= -X
+LDFLAGS_vmlinux	+= $(call ld-option, -X,)
 endif
 
 # Default kernel image to build when no specific target is given.
_
