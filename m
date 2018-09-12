Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:52579 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725958AbeILLr0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Sep 2018 07:47:26 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/2] kbuild: hide most of targets when running config or mixed targets
Date: Wed, 12 Sep 2018 15:43:29 +0900
Message-Id: <1536734610-22173-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

When mixed/config targets are being processed, the top Makefile
does not need to parse the rest of targets.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 4d5c883..4b76e22 100644
--- a/Makefile
+++ b/Makefile
@@ -1615,9 +1615,6 @@ namespacecheck:
 export_report:
 	$(PERL) $(srctree)/scripts/export_report.pl
 
-endif #ifeq ($(config-targets),1)
-endif #ifeq ($(mixed-targets),1)
-
 PHONY += checkstack kernelrelease kernelversion image_name
 
 # UML needs a little special treatment here.  It wants to use the host
@@ -1732,6 +1729,8 @@ ifneq ($(cmd_files),)
   include $(cmd_files)
 endif
 
+endif   # ifeq ($(config-targets),1)
+endif   # ifeq ($(mixed-targets),1)
 endif	# skip-makefile
 
 PHONY += FORCE
-- 
2.7.4
