Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from [216.32.180.187] ([216.32.180.187]:47459 "EHLO
	co1outboundpool.messaging.microsoft.com" rhost-flags-FAIL-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1753341AbaAFJ0f (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 6 Jan 2014 04:26:35 -0500
From: Emil Medve <Emilian.Medve@Freescale.com>
Subject: [PATCH v2] kbuild: Fix silent builds with make-4
Date: Mon, 6 Jan 2014 02:58:40 -0600
Message-ID: <1388998720-3037-1-git-send-email-Emilian.Medve@Freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org, Emil Medve <Emilian.Medve@Freescale.com>

make-4 changed the way/order it presents the command line options
into MAKEFLAGS

In make-3.8x, '-s' would always be first into a group of options
with the '-'/hyphen removed

$ make -p -s 2>/dev/null | grep ^MAKEFLAGS
MAKEFLAGS = sp

In make-4, '-s' seems to always be last into a group of options
with the '-'/hyphen removed

$ make -s -p 2>/dev/null | grep ^MAKEFLAGS
MAKEFLAGS = ps

Signed-off-by: Emil Medve <Emilian.Medve@Freescale.com>
---

v2: Avoid false positives as per Michal's (Marek) feedback

 Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Makefile b/Makefile
index ae1a55a..5d3c303 100644
--- a/Makefile
+++ b/Makefile
@@ -311,9 +311,15 @@ endif
 # If the user is running make -s (silent mode), suppress echoing of
 # commands
 
+ifneq ($(filter 4.%,$(MAKE_VERSION)),)	# make-4
+ifneq ($(filter %s ,$(firstword x$(MAKEFLAGS))),)
+  quiet=silent_
+endif
+else					# make-3.8x
 ifneq ($(filter s% -s%,$(MAKEFLAGS)),)
   quiet=silent_
 endif
+endif
 
 export quiet Q KBUILD_VERBOSE
 
-- 
1.8.5.2


