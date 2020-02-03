Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:39669 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728725AbgBCQst (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Feb 2020 11:48:49 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] initramfs: do not show compression mode choice if INITRAMFS_SOURCE is empty
Date: Tue,  4 Feb 2020 01:47:08 +0900
Message-Id: <20200203164708.17478-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Thelen <gthelen@google.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Sam Ravnborg <sam@ravnborg.org>

Since commit ddd09bcc899f ("initramfs: make compression options not
depend on INITRAMFS_SOURCE"), Kconfig asks the compression mode for
the built-in initramfs regardless of INITRAMFS_SOURCE.

It is technically simpler, but pointless from a UI perspective,
Linus says [1].

When INITRAMFS_SOURCE is empty, usr/Makefile creates a tiny default
cpio, which is so small that nobody cares about the compression.

This commit hides the Kconfig choice in that case. The default cpio
is embedded without compression, which was the original behavior.

[1]: https://lkml.org/lkml/2020/2/1/160

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Linus,

Will you directly pick up this if you are OK with it?



 usr/Kconfig  | 1 +
 usr/Makefile | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/usr/Kconfig b/usr/Kconfig
index 529caab1a328..bdf5bbd40727 100644
--- a/usr/Kconfig
+++ b/usr/Kconfig
@@ -102,6 +102,7 @@ config RD_LZ4
 
 choice
 	prompt "Built-in initramfs compression mode"
+	depends on INITRAMFS_SOURCE != ""
 	help
 	  This option allows you to decide by which algorithm the builtin
 	  initramfs will be compressed.  Several compression algorithms are
diff --git a/usr/Makefile b/usr/Makefile
index 18aed2ab98da..c12e6b15ce72 100644
--- a/usr/Makefile
+++ b/usr/Makefile
@@ -8,7 +8,7 @@
 # with unpack_to_rootfs(). Make size_append no-op.
 override size_append := :
 
-compress-$(CONFIG_INITRAMFS_COMPRESSION_NONE)	:= shipped
+compress-y					:= shipped
 compress-$(CONFIG_INITRAMFS_COMPRESSION_GZIP)	:= gzip
 compress-$(CONFIG_INITRAMFS_COMPRESSION_BZIP2)	:= bzip2
 compress-$(CONFIG_INITRAMFS_COMPRESSION_LZMA)	:= lzma
-- 
2.17.1
