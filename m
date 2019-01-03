Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:28990 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726072AbfACBrR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Jan 2019 20:47:17 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: remove unnecessary stubs for archheader and archscripts
Date: Thu,  3 Jan 2019 10:47:05 +0900
Message-Id: <1546480026-13337-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Make simply skips a missing rule when it is marked as .PHONY.
Remove the dummy targets.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 62c9890..0f0f689 100644
--- a/Makefile
+++ b/Makefile
@@ -1159,11 +1159,7 @@ export INSTALL_HDR_PATH = $(objtree)/usr
 # If we do an all arch process set dst to include/arch-$(SRCARCH)
 hdr-dst = $(if $(KBUILD_HEADERS), dst=include/arch-$(SRCARCH), dst=include)
 
-PHONY += archheaders
-archheaders:
-
-PHONY += archscripts
-archscripts:
+PHONY += archheaders archscripts
 
 PHONY += __headers
 __headers: $(version_h) scripts_basic uapi-asm-generic archheaders archscripts
-- 
2.7.4
