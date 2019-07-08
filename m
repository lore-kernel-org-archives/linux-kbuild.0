Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:58865 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390899AbfGHPfK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Jul 2019 11:35:10 -0400
From: Harald Seiler <hws@denx.de>
Subject: [PATCH] kbuild: fix compression errors getting ignored
Date: Mon,  8 Jul 2019 17:34:36 +0200
Message-Id: <20190708153436.19260-1-hws@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Harald Seiler <hws@denx.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>

A missing compression utility or other errors were not picked up by make
and an empty kernel image was produced.  With the added "|| exit $?",
the error is propagated outwards and will make the build fail.

Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Signed-off-by: Harald Seiler <hws@denx.de>
---
 scripts/Makefile.lib | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index f1f38c8cdc74..4b374da065a3 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -331,19 +331,19 @@ printf "%08x\n" $$dec_size |						\
 )
 
 quiet_cmd_bzip2 = BZIP2   $@
-      cmd_bzip2 = { cat $(real-prereqs) | bzip2 -9 && $(size_append); } > $@
+      cmd_bzip2 = { cat $(real-prereqs) | bzip2 -9 || exit $$? && $(size_append); } > $@
 
 # Lzma
 # ---------------------------------------------------------------------------
 
 quiet_cmd_lzma = LZMA    $@
-      cmd_lzma = { cat $(real-prereqs) | lzma -9 && $(size_append); } > $@
+      cmd_lzma = { cat $(real-prereqs) | lzma -9 || exit $$? && $(size_append); } > $@
 
 quiet_cmd_lzo = LZO     $@
-      cmd_lzo = { cat $(real-prereqs) | lzop -9 && $(size_append); } > $@
+      cmd_lzo = { cat $(real-prereqs) | lzop -9 || exit $$? && $(size_append); } > $@
 
 quiet_cmd_lz4 = LZ4     $@
-      cmd_lz4 = { cat $(real-prereqs) | lz4c -l -c1 stdin stdout && \
+      cmd_lz4 = { cat $(real-prereqs) | lz4c -l -c1 stdin stdout || exit $$? && \
                   $(size_append); } > $@
 
 # U-Boot mkimage
@@ -386,8 +386,8 @@ quiet_cmd_uimage = UIMAGE  $@
 # big dictionary would increase the memory usage too much in the multi-call
 # decompression mode. A BCJ filter isn't used either.
 quiet_cmd_xzkern = XZKERN  $@
-      cmd_xzkern = { cat $(real-prereqs) | sh $(srctree)/scripts/xz_wrap.sh && \
-                     $(size_append); } > $@
+      cmd_xzkern = { cat $(real-prereqs) | sh $(srctree)/scripts/xz_wrap.sh || \
+                     exit $$? && $(size_append); } > $@
 
 quiet_cmd_xzmisc = XZMISC  $@
       cmd_xzmisc = cat $(real-prereqs) | xz --check=crc32 --lzma2=dict=1MiB > $@
-- 
2.20.1
