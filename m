Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:51971 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387918AbeKVJsj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Nov 2018 04:48:39 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/2] kbuild: remove 'scripts' dummy target for external module build
Date: Thu, 22 Nov 2018 08:11:55 +0900
Message-Id: <1542841915-19686-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1542841915-19686-1-git-send-email-yamada.masahiro@socionext.com>
References: <1542841915-19686-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Make simply skips a missing rule as long as it is marked as PHONY.
Remove the dummy target.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Makefile b/Makefile
index 36f3f0e..269a9bf 100644
--- a/Makefile
+++ b/Makefile
@@ -1604,11 +1604,9 @@ help:
 	@echo  '  clean           - remove generated files in module directory only'
 	@echo  ''
 
-# Dummies...
 PHONY += prepare scripts
 prepare:
 	$(cmd_crmodverdir)
-scripts: ;
 endif # KBUILD_EXTMOD
 
 clean: $(clean-dirs)
-- 
2.7.4
