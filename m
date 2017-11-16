Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:65069 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936183AbdKPQtr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Nov 2017 11:49:47 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: clean up *.i and *.lst patterns by make clean
Date: Fri, 17 Nov 2017 01:49:13 +0900
Message-Id: <1510850953-8795-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

*.i and *.lst are supported by single targets build.  Clean up them.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 4299f94..3ea081a 100644
--- a/Makefile
+++ b/Makefile
@@ -1545,9 +1545,9 @@ clean: $(clean-dirs)
 	$(call cmd,rmdirs)
 	$(call cmd,rmfiles)
 	@find $(if $(KBUILD_EXTMOD), $(KBUILD_EXTMOD), .) $(RCS_FIND_IGNORE) \
-		\( -name '*.[oas]' -o -name '*.ko' -o -name '.*.cmd' \
+		\( -name '*.[aios]' -o -name '*.ko' -o -name '.*.cmd' \
 		-o -name '*.ko.*' -o -name '*.dtb' -o -name '*.dtb.S' \
-		-o -name '*.dwo'  \
+		-o -name '*.dwo' -o -name '*.lst' \
 		-o -name '*.su'  \
 		-o -name '.*.d' -o -name '.*.tmp' -o -name '*.mod.c' \
 		-o -name '*.symtypes' -o -name 'modules.order' \
-- 
2.7.4

