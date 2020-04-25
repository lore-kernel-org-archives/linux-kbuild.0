Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:65507 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbgDYNSk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 25 Apr 2020 09:18:40 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kbuild: remove '/' target
Date: Sat, 25 Apr 2020 22:18:10 +0900
Message-Id: <20200425131810.991717-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

This notice has been here for a while. Remove it entirely now.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Makefile b/Makefile
index 49b2709ff44e..95c2d8c2dfe8 100644
--- a/Makefile
+++ b/Makefile
@@ -1650,10 +1650,6 @@ _emodinst_post: _emodinst_
 clean-dirs := $(KBUILD_EXTMOD)
 clean: rm-files := $(KBUILD_EXTMOD)/Module.symvers $(KBUILD_EXTMOD)/modules.nsdeps
 
-PHONY += /
-/:
-	@echo >&2 '"$(MAKE) /" is no longer supported. Please use "$(MAKE) ./" instead.'
-
 PHONY += help
 help:
 	@echo  '  Building external modules.'
-- 
2.25.1
