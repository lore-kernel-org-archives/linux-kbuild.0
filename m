Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:48404 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752157AbbKQBAX (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 Nov 2015 20:00:23 -0500
From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH] staging: drop kbuild workaround dummy module from top dir
Date: Mon, 16 Nov 2015 19:58:49 -0500
Message-ID: <1447721929-45813-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org

This is essentially a revert of 86f69fe9c069dd8608d238581eea259caa1dfc99
("Staging: workaround build system bug"), but to call it a revert would
imply it was wrong -- rather it seems more like it is just no longer
required anymore.

It doesn't list the full details of the failing use case, but the most
obvious would appear to be a "make allnoconfig" that subsequently had set
just CONFIG_STAGING=y in the .config file, to give:

  paul@builder:~/git/linux-head$ grep STAGING ../staging-allno/.config
  CONFIG_STAGING=y
  # CONFIG_STAGING_MEDIA is not set
  # CONFIG_STAGING_BOARD is not set
  paul@builder:~/git/linux-head$

After building this .config (on ARM, just to be different), we see that
built-in.o is created, and the final vmlinux links OK:

  paul@builder:~/git/linux-head$ ls -l ../staging-allno/drivers/staging/built-in.o
  -rw-rw-r-- 1 paul paul 257 Nov 16 18:06 ../staging-allno/drivers/staging/built-in.o
  paul@builder:~/git/linux-head$ file ../staging-allno/drivers/staging/built-in.o
  ../staging-allno/drivers/staging/built-in.o: ELF 32-bit LSB relocatable, ARM, version 1, not stripped
  paul@builder:~/git/linux-head$ nm ../staging-allno/drivers/staging/built-in.o
  nm: ../staging-allno/drivers/staging/built-in.o: no symbols
  paul@builder:~/git/linux-head$ ls -l ../staging-allno/vmlinux
  -rwxrwxr-x 1 paul paul 1236326 Nov 16 18:07 ../staging-allno/vmlinux
  paul@builder:~/git/linux-head$

I also tested an "allmodconfig" and did not see any problems there
either.  Switching back to x86-64 and testing several things there didn't
show any issues either.  So it appears we do not need to carry the
workaround in tree any longer.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile
index 30918edef5e3..f666937739fb 100644
--- a/drivers/staging/Makefile
+++ b/drivers/staging/Makefile
@@ -1,8 +1,5 @@
 # Makefile for staging directory
 
-# fix for build system bug...
-obj-$(CONFIG_STAGING)		+= staging.o
-
 obj-y				+= media/
 obj-$(CONFIG_SLICOSS)		+= slicoss/
 obj-$(CONFIG_PRISM2_USB)	+= wlan-ng/
diff --git a/drivers/staging/staging.c b/drivers/staging/staging.c
deleted file mode 100644
index 233e589c0932..000000000000
--- a/drivers/staging/staging.c
+++ /dev/null
@@ -1,19 +0,0 @@
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/module.h>
-
-static int __init staging_init(void)
-{
-	return 0;
-}
-
-static void __exit staging_exit(void)
-{
-}
-
-module_init(staging_init);
-module_exit(staging_exit);
-
-MODULE_AUTHOR("Greg Kroah-Hartman");
-MODULE_DESCRIPTION("Staging Core");
-MODULE_LICENSE("GPL");
-- 
1.8.2.3

