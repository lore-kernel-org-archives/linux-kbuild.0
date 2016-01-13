Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:61699 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757242AbcAMN1z (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 13 Jan 2016 08:27:55 -0500
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] logfs: clarify MTD dependency
Date: Wed, 13 Jan 2016 14:25:55 +0100
Message-ID: <5776957.XLg438VUOx@wuerfel>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: mmarek@suse.com, Peter Chen <peter.chen@freescale.com>, Randy Dunlap <rdunlap@infradead.org>, Joern Engel <joern@logfs.org>, Prasad Joshi <prasadjoshi.linux@gmail.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

After a change to the way that composite modules work, we get
a logfs build error:

fs/built-in.o: In function `logfs_mount':
:(.text+0x139d34): undefined reference to `logfs_get_sb_mtd'
fs/built-in.o: In function `logfs_get_sb_bdev':
:(.text+0x13aa08): undefined reference to `logfs_get_sb_mtd'

This patch avoids the error by changing the dependencies of
logfs in a way that we can no longer configure logfs as built-in
when the MTD core is a loadable module, while leaving the
dependency to require at least one of MTD or BLOCK to be
enabled.

Another patch tried to work around the problem, but accidentally
dropped the dependency on 'BLOCK || MTD', allowing the file
system to be built if neither is selected.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Fixes: cf4f21938e13 ("kbuild: Allow to specify composite modules with modname-m")
Fixes: e6be296f680c ("logfs: fix logfs build errors and dependencies")
---
I originally sent the patch November 27, but the discussion did not
conclude, see https://lkml.org/lkml/2015/11/27/299

This version is rebased on the patch that got applied yesterday.

diff --git a/fs/logfs/Kconfig b/fs/logfs/Kconfig
index 2b1485a5c086..2b4503163930 100644
--- a/fs/logfs/Kconfig
+++ b/fs/logfs/Kconfig
@@ -1,7 +1,6 @@
 config LOGFS
 	tristate "LogFS file system"
-	depends on BLOCK || BLOCK=n
-	depends on MTD || MTD=n
+	depends on MTD || (!MTD && BLOCK)
 	select ZLIB_INFLATE
 	select ZLIB_DEFLATE
 	select CRC32

