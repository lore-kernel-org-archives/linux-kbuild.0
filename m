Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg010.nifty.com ([202.248.44.36]:17309 "EHLO
	conuserg010-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753746AbcCMAkK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 12 Mar 2016 19:40:10 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: mark help target as PHONY
Date: Sun, 13 Mar 2016 09:39:55 +0900
Message-Id: <1457829595-31866-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org

Obviously, the "help" should be a PHONY target.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index 64cf099..848a7dc 100644
--- a/Makefile
+++ b/Makefile
@@ -1249,6 +1249,7 @@ boards := $(sort $(notdir $(boards)))
 board-dirs := $(dir $(wildcard $(srctree)/arch/$(SRCARCH)/configs/*/*_defconfig))
 board-dirs := $(sort $(notdir $(board-dirs:/=)))
 
+PHONY += help
 help:
 	@echo  'Cleaning targets:'
 	@echo  '  clean		  - Remove most generated files but keep the config and'
@@ -1417,6 +1418,7 @@ $(clean-dirs):
 clean:	rm-dirs := $(MODVERDIR)
 clean: rm-files := $(KBUILD_EXTMOD)/Module.symvers
 
+PHONY += help
 help:
 	@echo  '  Building external modules.'
 	@echo  '  Syntax: make -C path/to/kernel/src M=$$PWD target'
-- 
1.9.1

