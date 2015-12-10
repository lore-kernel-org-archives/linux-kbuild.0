Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:33255 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750933AbbLJQqk (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 10 Dec 2015 11:46:40 -0500
Date: Fri, 11 Dec 2015 00:35:19 +0800
From: Wang YanQing <udknight@gmail.com>
Subject: [PATCH] Makefile: revert "Makefile: Document ability to make
 file.lst and file.S" partially
Message-ID: <20151210163518.GB18947@udknight>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com
Cc: joe@perches.com, xiyou.wangcong@gmail.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Commit 627189797807 ("Makefile: Document ability to make file.lst
and file.S") document ability to make file.S, but there isn't such
ability in kbuild, so revert it.

Signed-off-by: Wang YanQing <udknight@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index d7e2060..e2d056b 100644
--- a/Makefile
+++ b/Makefile
@@ -1277,7 +1277,7 @@ help:
 	@echo  '  firmware_install- Install all firmware to INSTALL_FW_PATH'
 	@echo  '                    (default: $$(INSTALL_MOD_PATH)/lib/firmware)'
 	@echo  '  dir/            - Build all files in dir and below'
-	@echo  '  dir/file.[oisS] - Build specified target only'
+	@echo  '  dir/file.[ois]  - Build specified target only'
 	@echo  '  dir/file.lst    - Build specified mixed source/assembly target only'
 	@echo  '                    (requires a recent binutils and recent build (System.map))'
 	@echo  '  dir/file.ko     - Build module including final link'
-- 
1.8.5.6.2.g3d8a54e.dirty
