Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:51436 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753708AbZGHNfj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 Jul 2009 09:35:39 -0400
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com ([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1MOXmY-0002tW-Ms
	for linux-kbuild@vger.kernel.org; Wed, 08 Jul 2009 10:05:58 -0400
Date: Wed, 8 Jul 2009 09:33:25 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: [PATCH] KBUILD:  Centralize the compression tests for
 BLK_DEV_INITRD.
Message-ID: <alpine.LFD.2.00.0907080933010.25809@localhost>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild devel list <linux-kbuild@vger.kernel.org>


Factor out the tests for BLK_DEV_INITRD from the compression entries
and wrap the whole thing in a single test to make it more visually
obvious what's happening.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/usr/Kconfig b/usr/Kconfig
index 1c3039f..a913b3a 100644
--- a/usr/Kconfig
+++ b/usr/Kconfig
@@ -45,10 +45,11 @@ config INITRAMFS_ROOT_GID

 	  If you are not sure, leave it set to "0".

+if BLK_DEV_INITRD
+
 config RD_GZIP
 	bool "Support initial ramdisks compressed using gzip" if EMBEDDED
 	default y
-	depends on BLK_DEV_INITRD
 	select DECOMPRESS_GZIP
 	help
 	  Support loading of a gzip encoded initial ramdisk or cpio buffer.
@@ -57,7 +58,6 @@ config RD_GZIP
 config RD_BZIP2
 	bool "Support initial ramdisks compressed using bzip2" if EMBEDDED
 	default !EMBEDDED
-	depends on BLK_DEV_INITRD
 	select DECOMPRESS_BZIP2
 	help
 	  Support loading of a bzip2 encoded initial ramdisk or cpio buffer
@@ -66,12 +66,13 @@ config RD_BZIP2
 config RD_LZMA
 	bool "Support initial ramdisks compressed using LZMA" if EMBEDDED
 	default !EMBEDDED
-	depends on BLK_DEV_INITRD
 	select DECOMPRESS_LZMA
 	help
 	  Support loading of a LZMA encoded initial ramdisk or cpio buffer
 	  If unsure, say N.

+endif # BLK_DEV_INITRD
+
 choice
 	prompt "Built-in initramfs compression mode" if INITRAMFS_SOURCE!=""
 	help


========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

        Linux Consulting, Training and Annoying Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Linked In:                             http://www.linkedin.com/in/rpjday
Twitter:                                       http://twitter.com/rpjday
========================================================================
