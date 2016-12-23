Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:36463 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S941136AbcLWDPX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Dec 2016 22:15:23 -0500
Received: by mail-pf0-f196.google.com with SMTP id c4so13192298pfb.3
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Dec 2016 19:15:23 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] kbuild: Fix dependency checking for initramfs build
Date: Fri, 23 Dec 2016 13:15:08 +1000
Message-Id: <20161223031508.30532-1-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linux-kbuild@vger.kernel.org, Francisco Blas Izquierdo Riera <klondike@klondike.es>, Andrew Morton <akpm@linux-foundation.org>

When using initramfs compression, the data file gets quotes pulled
in from Kconfig, e.g., initramfs_data.cpio".gz" which make does not
match a target and causes rebuild.

Fix this by filtering out quotes from the Kconfig string.

While we're here, set the target explicitly so the Makefile does not
have to know about all the suffixes.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 usr/Makefile | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/usr/Makefile b/usr/Makefile
index 17a513268325..3116b23d44f8 100644
--- a/usr/Makefile
+++ b/usr/Makefile
@@ -5,8 +5,10 @@
 klibcdirs:;
 PHONY += klibcdirs
 
-suffix_y = $(CONFIG_INITRAMFS_COMPRESSION)
-AFLAGS_initramfs_data.o += -DINITRAMFS_IMAGE="usr/initramfs_data.cpio$(suffix_y)"
+suffix_y = $(subst $\",,$(CONFIG_INITRAMFS_COMPRESSION))
+datafile_y = initramfs_data.cpio$(suffix_y)
+AFLAGS_initramfs_data.o += -DINITRAMFS_IMAGE=usr/$(datafile_y)
+
 
 # Generate builtin.o based on initramfs_data.o
 obj-$(CONFIG_BLK_DEV_INITRD) := initramfs_data.o
@@ -14,7 +16,7 @@ obj-$(CONFIG_BLK_DEV_INITRD) := initramfs_data.o
 # initramfs_data.o contains the compressed initramfs_data.cpio image.
 # The image is included using .incbin, a dependency which is not
 # tracked automatically.
-$(obj)/initramfs_data.o: $(obj)/initramfs_data.cpio$(suffix_y) FORCE
+$(obj)/initramfs_data.o: $(obj)/$(datafile_y) FORCE
 
 #####
 # Generate the initramfs cpio archive
@@ -38,10 +40,8 @@ endif
 quiet_cmd_initfs = GEN     $@
       cmd_initfs = $(initramfs) -o $@ $(ramfs-args) $(ramfs-input)
 
-targets := initramfs_data.cpio.gz initramfs_data.cpio.bz2 \
-	initramfs_data.cpio.lzma initramfs_data.cpio.xz \
-	initramfs_data.cpio.lzo initramfs_data.cpio.lz4 \
-	initramfs_data.cpio
+targets := $(datafile_y)
+
 # do not try to update files included in initramfs
 $(deps_initramfs): ;
 
@@ -51,6 +51,6 @@ $(deps_initramfs): klibcdirs
 # 2) There are changes in which files are included (added or deleted)
 # 3) If gen_init_cpio are newer than initramfs_data.cpio
 # 4) arguments to gen_initramfs.sh changes
-$(obj)/initramfs_data.cpio$(suffix_y): $(obj)/gen_init_cpio $(deps_initramfs) klibcdirs
+$(obj)/$(datafile_y): $(obj)/gen_init_cpio $(deps_initramfs) klibcdirs
 	$(Q)$(initramfs) -l $(ramfs-input) > $(obj)/.initramfs_data.cpio.d
 	$(call if_changed,initfs)
-- 
2.11.0

