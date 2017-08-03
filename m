Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:42789 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751629AbdHCKJd (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Aug 2017 06:09:33 -0400
From: Johannes Thumshirn <jthumshirn@suse.de>
Subject: [PATCH] Kbuild: enable -Wunused-macros warning for "make W=1"
Date: Thu,  3 Aug 2017 12:09:24 +0200
Message-Id: <20170803100924.8791-1-jthumshirn@suse.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Johannes Thumshirn <jthumshirn@suse.de>

We have lots of dead defines and macros in drivers, lets offer users a way
to detect and eventually remove them.

Signed-off-by: Johannes Thumshirn <jthumshirn@suse.de>
---
 scripts/Makefile.extrawarn | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index fb3522fd8702..8ab8bc91da55 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -25,6 +25,7 @@ warning-1 += -Wold-style-definition
 warning-1 += $(call cc-option, -Wmissing-include-dirs)
 warning-1 += $(call cc-option, -Wunused-but-set-variable)
 warning-1 += $(call cc-option, -Wunused-const-variable)
+warning-1 += $(call cc-option, -Wunused-macros)
 warning-1 += $(call cc-disable-warning, missing-field-initializers)
 warning-1 += $(call cc-disable-warning, sign-compare)
 
-- 
2.12.3

