Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:59640 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751317AbdH3OEZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 30 Aug 2017 10:04:25 -0400
From: Johannes Thumshirn <jthumshirn@suse.de>
Subject: [PATCH v2] Kbuild: enable -Wunused-macros warning for "make W=2"
Date: Wed, 30 Aug 2017 16:04:13 +0200
Message-Id: <20170830140413.9333-1-jthumshirn@suse.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: Linux Kernel Mailinglist <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, Johannes Thumshirn <jthumshirn@suse.de>

We have lots of dead defines and macros in drivers, lets offer users a way
to detect and eventually remove them.

Signed-off-by: Johannes Thumshirn <jthumshirn@suse.de>
---

Notes:
    Changes to v1:
    * Change from W=1 to W=2

 scripts/Makefile.extrawarn | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index fb3522fd8702..ae8a1357d01d 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -37,6 +37,7 @@ warning-2 += $(call cc-option, -Wlogical-op)
 warning-2 += $(call cc-option, -Wmissing-field-initializers)
 warning-2 += $(call cc-option, -Wsign-compare)
 warning-2 += $(call cc-option, -Wmaybe-uninitialized)
+warning-2 += $(call cc-option, -Wunused-macros)
 
 warning-3 := -Wbad-function-cast
 warning-3 += -Wcast-qual
-- 
2.12.3

