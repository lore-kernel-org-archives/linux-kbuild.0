Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.gentoo.org ([140.211.166.183]:36096 "EHLO smtp.gentoo.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754093AbZFGHoq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 7 Jun 2009 03:44:46 -0400
From: Mike Frysinger <vapier@gentoo.org>
Subject: [PATCH] kbuild: fix spacing for bzip2 commands
Date: Sun,  7 Jun 2009 03:44:37 -0400
Message-Id: <1244360677-26434-1-git-send-email-vapier@gentoo.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org

The current bzip2 command has an extra space before the target:
  MODPOST 4 modules
  BZIP2    arch/blackfin/boot/vmlinux.bin.bz2
  UIMAGE  arch/blackfin/boot/vmImage.bz2

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 scripts/Makefile.lib |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index cba61ca..69e7d8f 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -197,7 +197,7 @@ cmd_gzip = gzip -f -9 < $< > $@
 # Bzip2 does not include size in file... so we have to fake that
 size_append=$(CONFIG_SHELL) $(srctree)/scripts/bin_size
 
-quiet_cmd_bzip2 = BZIP2    $@
+quiet_cmd_bzip2 = BZIP2   $@
 cmd_bzip2 = (bzip2 -9 < $< && $(size_append) $<) > $@ || (rm -f $@ ; false)
 
 # Lzma
-- 
1.6.3.1

