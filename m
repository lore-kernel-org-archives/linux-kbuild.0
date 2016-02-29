Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.135]:60739 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753485AbcB2Mkx (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Feb 2016 07:40:53 -0500
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] lz4c: shut up lz4c output
Date: Mon, 29 Feb 2016 13:40:15 +0100
Message-Id: <1456749618-1067584-1-git-send-email-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

When KERNEL_LZ4 is set, we always get an output even when building
with 'make -s':

    *** LZ4 Compression CLI , by Yann Collet (May 31 2013) ***
    ! Generating compressed LZ4 using Legacy format (deprecated !) !
    Using stdin for input
    Using stdout for output
    Compressed 11213376 bytes into 4555781 bytes ==> 40.63%
    Done in 0.63 s ==> 16.97 MB/s

The output is not helpful in the context of building the kernel,
so this patch hides the stdout output of the lz4 binary completely.

We could also try to not hide the output when building without '-s',
but I could not come up with any use for that.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 scripts/Makefile.lib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 31d7a73c35ce..5ab935aed8ad 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -347,7 +347,7 @@ cmd_lzo = (cat $(filter-out FORCE,$^) | \
 
 quiet_cmd_lz4 = LZ4     $@
 cmd_lz4 = (cat $(filter-out FORCE,$^) | \
-	lz4c -l -c1 stdin stdout && $(call size_append, $(filter-out FORCE,$^))) > $@ || \
+	lz4c -l -c1 stdin stdout && $(call size_append, $(filter-out FORCE,$^))) > $@ 2>&1 || \
 	(rm -f $@ ; false)
 
 # U-Boot mkimage
-- 
2.7.0

