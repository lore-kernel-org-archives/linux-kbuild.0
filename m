Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:45309 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756810AbZHFXFd (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 6 Aug 2009 19:05:33 -0400
Message-Id: <200908062304.n76N4TMK003046@imap1.linux-foundation.org>
Subject: [patch 1/8] gitignore usr/initramfs_data.cpio.bz2 and usr/initramfs_data.cpio.lzma
From: akpm@linux-foundation.org
Date: Thu, 06 Aug 2009 16:04:29 -0700
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, jaswinder@kernel.org, jaswinderrajput@gmail.com

From: Jaswinder Singh Rajput <jaswinder@kernel.org>

usr/initramfs_data.cpio.bz2 and usr/initramfs_data.cpio.lzma are binary
files should be ignored

Signed-off-by: Jaswinder Singh Rajput <jaswinderrajput@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 usr/.gitignore |    2 ++
 1 file changed, 2 insertions(+)

diff -puN usr/.gitignore~gitignore-usr-initramfs_datacpiobz2-and-usr-initramfs_datacpiolzma usr/.gitignore
--- a/usr/.gitignore~gitignore-usr-initramfs_datacpiobz2-and-usr-initramfs_datacpiolzma
+++ a/usr/.gitignore
@@ -4,5 +4,7 @@
 gen_init_cpio
 initramfs_data.cpio
 initramfs_data.cpio.gz
+initramfs_data.cpio.bz2
+initramfs_data.cpio.lzma
 initramfs_list
 include
_
