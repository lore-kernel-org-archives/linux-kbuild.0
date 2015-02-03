Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:47284 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753451AbbBCKn7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 3 Feb 2015 05:43:59 -0500
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH] kbuild: remove warning about "make depend"
Date: Tue,  3 Feb 2015 19:43:45 +0900
Message-Id: <1422960226-10298-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>, linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.cz>

Enough time has passed since "make depend" was deprecated.
Nobody would be in trouble without this hint.

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
---

 Makefile | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Makefile b/Makefile
index 109c173..7aeba7a 100644
--- a/Makefile
+++ b/Makefile
@@ -1035,12 +1035,6 @@ headerdep:
 	$(srctree)/scripts/headerdep.pl -I$(srctree)/include
 
 # ---------------------------------------------------------------------------
-
-PHONY += depend dep
-depend dep:
-	@echo '*** Warning: make $@ is unnecessary now.'
-
-# ---------------------------------------------------------------------------
 # Firmware install
 INSTALL_FW_PATH=$(INSTALL_MOD_PATH)/lib/firmware
 export INSTALL_FW_PATH
-- 
1.9.1

