Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:60006 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1761279AbYBBUqk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 2 Feb 2008 15:46:40 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] kbuild: Spelling/grammar fixes for config DEBUG_SECTION_MISMATCH
Date: Sat,  2 Feb 2008 21:46:36 +0100
Message-Id: <1201985204-26589-2-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080202203503.GA26415@uranus.ravnborg.org>
References: <20080202203503.GA26415@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild <linux-kbuild@vger.kernel.org>
Cc: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>

From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>

Including additional fixes from Randy Dunlap <randy.dunlap@oracle.com>

Signed-off-by: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 lib/Kconfig.debug |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index d090d72..0d385be 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -90,19 +90,19 @@ config DEBUG_SECTION_MISMATCH
 	  most likely result in an oops.
 	  In the code functions and variables are annotated with
 	  __init, __devinit etc. (see full list in include/linux/init.h)
-	  which result in the code/data being placed in specific sections.
-	  The section mismatch anaylsis are always done after a full
-	  kernel build but enabling this options will in addition
+	  which results in the code/data being placed in specific sections.
+	  The section mismatch analysis is always done after a full
+	  kernel build but enabling this option will in addition
 	  do the following:
 	  - Add the option -fno-inline-functions-called-once to gcc
 	    When inlining a function annotated __init in a non-init
-	    function we would loose the section information and thus
+	    function we would lose the section information and thus
 	    the analysis would not catch the illegal reference.
-	    This options tell gcc to inline less but will also
+	    This option tells gcc to inline less but will also
 	    result in a larger kernel.
 	  - Run the section mismatch analysis for each module/built-in.o
 	    When we run the section mismatch analysis on vmlinux.o we
-	    looses valueable information about where the mismatch was
+	    lose valueble information about where the mismatch was
 	    introduced.
 	    Running the analysis for each module/built-in.o file
 	    will tell where the mismatch happens much closer to the
-- 
1.5.4.rc3.14.g44397

