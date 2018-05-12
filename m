Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:38319 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751438AbeELTqV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 12 May 2018 15:46:21 -0400
Received: by mail-wm0-f66.google.com with SMTP id m129-v6so8544434wmb.3
        for <linux-kbuild@vger.kernel.org>; Sat, 12 May 2018 12:46:20 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
Subject: [PATCH 1/1] Makefile: Add testconfig target into doc
Date: Sat, 12 May 2018 21:46:13 +0200
Message-Id: <20180512194613.24059-1-petr.vorel@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Petr Vorel <petr.vorel@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>

make testconfig appeared in these commits:
022a4bf6b59d kconfig: tests: add framework for Kconfig unit testing
1903c5119059 kconfig: tests: add basic choice tests

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index d0d2652db174..da9a254203f7 100644
--- a/Makefile
+++ b/Makefile
@@ -1477,6 +1477,9 @@ help:
 	@echo  'Documentation targets:'
 	@$(MAKE) -f $(srctree)/Documentation/Makefile dochelp
 	@echo  ''
+	@echo  'Testing targets:'
+	@echo  '  testconfig   - Run Kconfig unit tests'
+	@echo  ''
 	@echo  'Architecture specific targets ($(SRCARCH)):'
 	@$(if $(archhelp),$(archhelp),\
 		echo '  No architecture specific help defined for $(SRCARCH)')
-- 
2.17.0

