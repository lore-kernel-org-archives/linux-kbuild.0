Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:46671 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754046AbYJ2VUc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 29 Oct 2008 17:20:32 -0400
Message-Id: <200810292120.m9TLKAhZ019367@imap1.linux-foundation.org>
Subject: [patch 07/13] adjust init section definitions
From: akpm@linux-foundation.org
Date: Wed, 29 Oct 2008 14:20:10 -0700
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, jbeulich@novell.com

From: "Jan Beulich" <jbeulich@novell.com>

Add rodata equivalents for assembly use, and fix the section attributes
used by __REFCONST.

Signed-off-by: Jan Beulich <jbeulich@novell.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 include/linux/init.h |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff -puN include/linux/init.h~adjust-init-section-definitions include/linux/init.h
--- a/include/linux/init.h~adjust-init-section-definitions
+++ a/include/linux/init.h
@@ -112,21 +112,25 @@
 #define __FINIT		.previous
 
 #define __INITDATA	.section	".init.data","aw"
+#define __INITRODATA	.section	".init.rodata","a"
 #define __FINITDATA	.previous
 
 #define __DEVINIT        .section	".devinit.text", "ax"
 #define __DEVINITDATA    .section	".devinit.data", "aw"
+#define __DEVINITRODATA  .section	".devinit.rodata", "a"
 
 #define __CPUINIT        .section	".cpuinit.text", "ax"
 #define __CPUINITDATA    .section	".cpuinit.data", "aw"
+#define __CPUINITRODATA  .section	".cpuinit.rodata", "a"
 
 #define __MEMINIT        .section	".meminit.text", "ax"
 #define __MEMINITDATA    .section	".meminit.data", "aw"
+#define __MEMINITRODATA  .section	".meminit.rodata", "a"
 
 /* silence warnings when references are OK */
 #define __REF            .section       ".ref.text", "ax"
 #define __REFDATA        .section       ".ref.data", "aw"
-#define __REFCONST       .section       ".ref.rodata", "aw"
+#define __REFCONST       .section       ".ref.rodata", "a"
 
 #ifndef __ASSEMBLY__
 /*
_
