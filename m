Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:39024 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750707AbaATFKQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 Jan 2014 00:10:16 -0500
Received: from mail-gw.jp.panasonic.com ([157.8.1.157])
	by smtp.mei.co.jp (8.12.11.20060614/3.7W/kc-maile12) with ESMTP id s0K5AEIa009073
	for <linux-kbuild@vger.kernel.org>; Mon, 20 Jan 2014 14:10:14 +0900 (JST)
Received: from epochmail.jp.panasonic.com ([157.8.1.130])
	by mail.jp.panasonic.com (8.11.6p2/3.7W/kc-maili16) with ESMTP id s0K5AEM21115
	for <linux-kbuild@vger.kernel.org>; Mon, 20 Jan 2014 14:10:14 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH 1/2] kbuild: docbook: include cmd files more simply
Date: Mon, 20 Jan 2014 14:10:10 +0900
Message-Id: <1390194611-15102-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
---
 Documentation/DocBook/Makefile | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/Documentation/DocBook/Makefile b/Documentation/DocBook/Makefile
index 6ea50a3..237f6dc 100644
--- a/Documentation/DocBook/Makefile
+++ b/Documentation/DocBook/Makefile
@@ -36,6 +36,7 @@ PS_METHOD	= $(prefer-db2x)
 # The targets that may be used.
 PHONY += xmldocs sgmldocs psdocs pdfdocs htmldocs mandocs installmandocs cleandocs
 
+targets += $(DOCBOOKS)
 BOOKS := $(addprefix $(obj)/,$(DOCBOOKS))
 xmldocs: $(BOOKS)
 sgmldocs: xmldocs
@@ -90,14 +91,6 @@ endef
 	$(call if_changed_rule,docproc)
 
 ###
-#Read in all saved dependency files
-cmd_files := $(wildcard $(foreach f,$(BOOKS),$(dir $(f)).$(notdir $(f)).cmd))
-
-ifneq ($(cmd_files),)
-  include $(cmd_files)
-endif
-
-###
 # Changes in kernel-doc force a rebuild of all documentation
 $(BOOKS): $(KERNELDOC)
 
-- 
1.8.3.2

