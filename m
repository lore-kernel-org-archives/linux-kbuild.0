Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nat28.tlf.novell.com ([130.57.49.28]:43528 "EHLO
	nat28.tlf.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753809Ab3LPO2j convert rfc822-to-8bit (ORCPT
	<rfc822;groupwise-linux-kbuild@vger.kernel.org:4:1>);
	Mon, 16 Dec 2013 09:28:39 -0500
Message-Id: <52AF1C23020000780010DBD7@nat28.tlf.novell.com>
Date: Mon, 16 Dec 2013 14:28:35 +0000
From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] fix build with make 3.80
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: akpm@linux-foundation.org, Michal Marek <mmarek@suse.cz>
Cc: ppandit@redhat.com, linux-kbuild@vger.kernel.org

According to Documentation/Changes, make 3.80 is still being supported
for building the kernel, hence make files must not make (unconditional)
use of features introduced only in newer versions. Commit 1bf49dd4
("./Makefile: export initial ramdisk compression config option")
however introduced "else ifeq" constructs which make 3.80 doesn't
understand. Replace the logic there with more conventional (in the
kernel build infrastructure) list constructs (except that the list here
is intentionally limited to exactly one element).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Cc: P J P <ppandit@redhat.com>
---
 Makefile |   20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

--- 3.13-rc4/Makefile
+++ 3.13-rc4-make-3.80/Makefile
@@ -732,19 +732,13 @@ export mod_strip_cmd
 # Select initial ramdisk compression format, default is gzip(1).
 # This shall be used by the dracut(8) tool while creating an initramfs image.
 #
-INITRD_COMPRESS=gzip
-ifeq ($(CONFIG_RD_BZIP2), y)
-        INITRD_COMPRESS=bzip2
-else ifeq ($(CONFIG_RD_LZMA), y)
-        INITRD_COMPRESS=lzma
-else ifeq ($(CONFIG_RD_XZ), y)
-        INITRD_COMPRESS=xz
-else ifeq ($(CONFIG_RD_LZO), y)
-        INITRD_COMPRESS=lzo
-else ifeq ($(CONFIG_RD_LZ4), y)
-        INITRD_COMPRESS=lz4
-endif
-export INITRD_COMPRESS
+INITRD_COMPRESS-y                  := gzip
+INITRD_COMPRESS-$(CONFIG_RD_BZIP2) := bzip2
+INITRD_COMPRESS-$(CONFIG_RD_LZMA)  := lzma
+INITRD_COMPRESS-$(CONFIG_RD_XZ)    := xz
+INITRD_COMPRESS-$(CONFIG_RD_LZO)   := lzo
+INITRD_COMPRESS-$(CONFIG_RD_LZ4)   := lz4
+export INITRD_COMPRESS := $(INITRD_COMPRESS-y)
 
 ifdef CONFIG_MODULE_SIG_ALL
 MODSECKEY = ./signing_key.priv



