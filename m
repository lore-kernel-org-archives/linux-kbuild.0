Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from co1ehsobe003.messaging.microsoft.com ([216.32.180.186]:8676
	"EHLO co1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752762Ab3LEWVc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 5 Dec 2013 17:21:32 -0500
From: Emil Medve <Emilian.Medve@Freescale.com>
Subject: [PATCH] kbuild: Fix silent builds with make-4
Date: Thu, 5 Dec 2013 15:56:23 -0600
Message-ID: <1386280583-2735-1-git-send-email-Emilian.Medve@Freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Emil Medve <Emilian.Medve@Freescale.com>

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
 Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Makefile b/Makefile
index 2c88e44..0332949 100644
--- a/Makefile
+++ b/Makefile
@@ -311,9 +311,15 @@ endif
 # If the user is running make -s (silent mode), suppress echoing of
 # commands
 
+ifneq ($(filter 4.%,$(MAKE_VERSION)),)	# make-4
+ifneq ($(filter %s -s%,$(MAKEFLAGS)),)
+  quiet=silent_
+endif
+else					# make-3.8x
 ifneq ($(filter s% -s%,$(MAKEFLAGS)),)
   quiet=silent_
 endif
+endif
 
 export quiet Q KBUILD_VERBOSE
 
-- 
1.8.5.1


