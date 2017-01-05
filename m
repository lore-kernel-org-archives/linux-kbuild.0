Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:33155 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1033575AbdAEKaG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Jan 2017 05:30:06 -0500
Received: by mail-pf0-f194.google.com with SMTP id 127so18379227pfg.0
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Jan 2017 02:30:06 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 2/2] kbuild: initramfs cleanup, set target from Kconfig
Date: Thu,  5 Jan 2017 20:29:36 +1000
Message-Id: <20170105102936.5673-2-npiggin@gmail.com>
In-Reply-To: <20170105102936.5673-1-npiggin@gmail.com>
References: <20170105102936.5673-1-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Florian Fainelli <f.fainelli@gmail.com>, torvalds@linux-foundation.org, pebolle@tiscali.nl, ppandit@redhat.com

Rather than keep a list of all possible compression types in the
Makefile, set the target explicitly from Kconfig.

Reviewed-by: Francisco Blas Izquierdo Riera (klondike) <klondike@klondike.es>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 usr/Makefile | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/usr/Makefile b/usr/Makefile
index 746c3fd0b933..0b87e71c00fc 100644
--- a/usr/Makefile
+++ b/usr/Makefile
@@ -6,7 +6,9 @@ klibcdirs:;
 PHONY += klibcdirs
 
 suffix_y = $(subst $\",,$(CONFIG_INITRAMFS_COMPRESSION))
-AFLAGS_initramfs_data.o += -DINITRAMFS_IMAGE="usr/initramfs_data.cpio$(suffix_y)"
+datafile_y = initramfs_data.cpio$(suffix_y)
+AFLAGS_initramfs_data.o += -DINITRAMFS_IMAGE="usr/$(datafile_y)"
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

