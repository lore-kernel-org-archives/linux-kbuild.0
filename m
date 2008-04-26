Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.queued.net ([207.210.101.209]:4704 "EHLO mail.queued.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755585AbYDZCkJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 25 Apr 2008 22:40:09 -0400
Date: Fri, 25 Apr 2008 22:34:58 -0400
From: Andres Salomon <dilinger@queued.net>
Subject: [PATCH 1/4] build: fix missing x86-specific help output
Message-ID: <20080425223458.4eb88ba6@ephemeral>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com


Normally 'make help' spits out architecture-specific targets (including
things like foo_defconfig).  However, it looks like ARCH was never changed
to SRCARCH during the x86 transition; the makefile still looks in
arch/i386/configs for arch-specific config files (if ARCH is i386, that is).

This changes it to use SRCARCH, which makes it properly display things
like i386_defconfig and x86_64_defconfig.

Signed-off-by: Andres Salomon <dilinger@debian.org>
---
 Makefile |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 3dbc826..e77149e 100644
--- a/Makefile
+++ b/Makefile
@@ -1170,7 +1170,7 @@ rpm: include/config/kernel.release FORCE
 # Brief documentation of the typical targets used
 # ---------------------------------------------------------------------------
 
-boards := $(wildcard $(srctree)/arch/$(ARCH)/configs/*_defconfig)
+boards := $(wildcard $(srctree)/arch/$(SRCARCH)/configs/*_defconfig)
 boards := $(notdir $(boards))
 
 help:
@@ -1217,9 +1217,9 @@ help:
 	@echo  'Documentation targets:'
 	@$(MAKE) -f $(srctree)/Documentation/DocBook/Makefile dochelp
 	@echo  ''
-	@echo  'Architecture specific targets ($(ARCH)):'
+	@echo  'Architecture specific targets ($(SRCARCH)):'
 	@$(if $(archhelp),$(archhelp),\
-		echo '  No architecture specific help defined for $(ARCH)')
+		echo '  No architecture specific help defined for $(SRCARCH)')
 	@echo  ''
 	@$(if $(boards), \
 		$(foreach b, $(boards), \
-- 
1.5.5

