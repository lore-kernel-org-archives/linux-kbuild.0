Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:17205 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753449AbdKNJts (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Nov 2017 04:49:48 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: move coccicheck help in scripts/Makefile.help to top Makefile
Date: Tue, 14 Nov 2017 18:47:20 +0900
Message-Id: <1510652841-6779-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: cocci@systeme.lip6.fr, Julia Lawall <Julia.Lawall@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

I do not think it is helpful to have a separate file just for the
coccicheck help message.  Merge scripts/Makefile.help into the
top-level Makefile.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile              | 2 +-
 scripts/Makefile.help | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)
 delete mode 100644 scripts/Makefile.help

diff --git a/Makefile b/Makefile
index f060f94..3b7d477 100644
--- a/Makefile
+++ b/Makefile
@@ -1388,7 +1388,7 @@ help:
 	@echo  '  export_report   - List the usages of all exported symbols'
 	@echo  '  headers_check   - Sanity check on exported headers'
 	@echo  '  headerdep       - Detect inclusion cycles in headers'
-	@$(MAKE) -f $(srctree)/scripts/Makefile.help checker-help
+	@echo  '  coccicheck      - Check with Coccinelle'
 	@echo  ''
 	@echo  'Kernel selftest:'
 	@echo  '  kselftest       - Build and run kernel selftest (run as root)'
diff --git a/scripts/Makefile.help b/scripts/Makefile.help
deleted file mode 100644
index d03608f..0000000
--- a/scripts/Makefile.help
+++ /dev/null
@@ -1,3 +0,0 @@
-
-checker-help:
-	@echo  '  coccicheck      - Check with Coccinelle.'
-- 
2.7.4

