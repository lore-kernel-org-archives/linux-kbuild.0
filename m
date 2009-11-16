Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:45322 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751113AbZKPFwz (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 Nov 2009 00:52:55 -0500
From: Wenji Huang <wenji.huang@oracle.com>
Subject: [PATCH] Kbuild: clean up marker
Date: Mon, 16 Nov 2009 13:49:54 +0800
Message-Id: <1258350595-19285-1-git-send-email-wenji.huang@oracle.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Wenji Huang <wenji.huang@oracle.com>

Drop Module.markers from cleaning list.

Signed-off-by: Wenji Huang <wenji.huang@oracle.com>
---
 Makefile |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 8278361..1c8c3e1 100644
--- a/Makefile
+++ b/Makefile
@@ -1198,7 +1198,7 @@ MRPROPER_FILES += .config .config.old include/asm .version .old_version \
                   include/linux/autoconf.h include/linux/version.h      \
                   include/linux/utsrelease.h                            \
                   include/linux/bounds.h include/asm*/asm-offsets.h     \
-		  Module.symvers Module.markers tags TAGS cscope*
+		  Module.symvers tags TAGS cscope*
 
 # clean - Delete most, but leave enough to build external modules
 #
@@ -1217,7 +1217,7 @@ clean: archclean $(clean-dirs)
 		\( -name '*.[oas]' -o -name '*.ko' -o -name '.*.cmd' \
 		-o -name '.*.d' -o -name '.*.tmp' -o -name '*.mod.c' \
 		-o -name '*.symtypes' -o -name 'modules.order' \
-		-o -name 'Module.markers' -o -name '.tmp_*.o.*' \
+		-o -name '.tmp_*.o.*' \
 		-o -name '*.gcno' \) -type f -print | xargs rm -f
 
 # mrproper - Delete all generated files, including .config
@@ -1415,7 +1415,6 @@ $(clean-dirs):
 
 clean:	rm-dirs := $(MODVERDIR)
 clean: rm-files := $(KBUILD_EXTMOD)/Module.symvers \
-                   $(KBUILD_EXTMOD)/Module.markers \
                    $(KBUILD_EXTMOD)/modules.order
 clean: $(clean-dirs)
 	$(call cmd,rmdirs)
-- 
1.5.6

