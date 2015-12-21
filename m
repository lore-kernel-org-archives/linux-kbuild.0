Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp01.smtpout.orange.fr ([80.12.242.123]:47873 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750802AbbLUUtp (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 21 Dec 2015 15:49:45 -0500
From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: kbuild: global makefile and spaces in path
Date: Mon, 21 Dec 2015 21:49:39 +0100
Message-ID: <87lh8nfrx8.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org

Hi Michal,

I compiled my kernel in a directory /home/robert jarzmik/kernel, and that's the
first time I encountered a space in the path containing my kernel in years.

I was wondering if there is a known constraint that the linux kernel source
should be contained within a path without any space ?

If no such constraint is known, maybe you could consider the patch in [1].

Cheers.

-- 
Robert

---8>---
From a8af33224ad536cc3137297e4a7617ee1031efb7 Mon Sep 17 00:00:00 2001
From: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Mon, 21 Dec 2015 21:42:42 +0100
Subject: [PATCH] kbuild: fix modules_install with spaces in kernel path

When the kernel path contains a space somewhere in the path name, the
modules_install target doesn't work anymore, as the path names are not
enclosed in double quotes.

This patch fixes the modules_install target.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 Makefile | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index 7ce5c5a76c0b..45ec34644b4f 100644
--- a/Makefile
+++ b/Makefile
@@ -1119,16 +1119,16 @@ modules_install: _modinst_ _modinst_post
 
 PHONY += _modinst_
 _modinst_:
-	@rm -rf $(MODLIB)/kernel
-	@rm -f $(MODLIB)/source
-	@mkdir -p $(MODLIB)/kernel
-	@ln -s `cd $(srctree) && /bin/pwd` $(MODLIB)/source
-	@if [ ! $(objtree) -ef  $(MODLIB)/build ]; then \
-		rm -f $(MODLIB)/build ; \
-		ln -s $(CURDIR) $(MODLIB)/build ; \
+	@rm -rf "$(MODLIB)"/kernel
+	@rm -f "$(MODLIB)"/source
+	@mkdir -p "$(MODLIB)"/kernel
+	@ln -s "`cd $(srctree) && /bin/pwd`" "$(MODLIB)"/source
+	@if [ ! "$(objtree)" -ef  "$(MODLIB)"/build ]; then \
+		rm -f "$(MODLIB)"/build ; \
+		ln -s "$(CURDIR)" "$(MODLIB)"/build ; \
 	fi
-	@cp -f $(objtree)/modules.order $(MODLIB)/
-	@cp -f $(objtree)/modules.builtin $(MODLIB)/
+	@cp -f $(objtree)/modules.order "$(MODLIB)"/
+	@cp -f $(objtree)/modules.builtin "$(MODLIB)"/
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modinst
 
 # This depmod is only for convenience to give the initial
-- 
2.1.4

