Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:36327 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1033574AbdAEKaC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Jan 2017 05:30:02 -0500
Received: by mail-pf0-f194.google.com with SMTP id b22so1964802pfd.3
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Jan 2017 02:30:02 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 1/2] kbuild: initramfs fix dependency checking for compressed target
Date: Thu,  5 Jan 2017 20:29:35 +1000
Message-Id: <20170105102936.5673-1-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Florian Fainelli <f.fainelli@gmail.com>, torvalds@linux-foundation.org, pebolle@tiscali.nl, ppandit@redhat.com

When using initramfs compression, the data file compression suffix
gets quotes pulled in from Kconfig, e.g., initramfs_data.cpio".gz"
which make does not match a target and causes rebuild.

Fix this by filtering out quotes from the Kconfig string.

Fixes: 35e669e1a254 ("initramfs: select builtin initram compression algorithm on KConfig instead of Makefile")
Reviewed-by: Francisco Blas Izquierdo Riera (klondike) <klondike@klondike.es>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 usr/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/usr/Makefile b/usr/Makefile
index 17a513268325..746c3fd0b933 100644
--- a/usr/Makefile
+++ b/usr/Makefile
@@ -5,7 +5,7 @@
 klibcdirs:;
 PHONY += klibcdirs
 
-suffix_y = $(CONFIG_INITRAMFS_COMPRESSION)
+suffix_y = $(subst $\",,$(CONFIG_INITRAMFS_COMPRESSION))
 AFLAGS_initramfs_data.o += -DINITRAMFS_IMAGE="usr/initramfs_data.cpio$(suffix_y)"
 
 # Generate builtin.o based on initramfs_data.o
-- 
2.11.0

