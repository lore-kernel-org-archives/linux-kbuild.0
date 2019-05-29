Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36774 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbfE2IQU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 May 2019 04:16:20 -0400
From: Mathieu Malaterre <malat@debian.org>
Subject: [PATCH] kbuild: Remove -Waggregate-return from scripts/Makefile.extrawarn
Date: Wed, 29 May 2019 10:04:34 +0200
Message-Id: <20190529080434.1409-1-malat@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Mathieu Malaterre <malat@debian.org>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

It makes little sense to pass -Waggregate-return these days since large
part of the linux kernel rely on returning struct(s). For instance:

  ../include/linux/timekeeping.h: In function 'show_uptime':
  ../include/linux/ktime.h:91:34: error: function call has aggregate value [-Werror=aggregate-return]
   #define ktime_to_timespec64(kt)  ns_to_timespec64((kt))
                                    ^~~~~~~~~~~~~~~~~~~~~~
  ../include/linux/timekeeping.h:166:8: note: in expansion of macro 'ktime_to_timespec64'
    *ts = ktime_to_timespec64(ktime_get_coarse_boottime());

Remove this warning from W=2 completely.

Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
 scripts/Makefile.extrawarn | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 3ab8d1a303cd..98081ab300e5 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -34,7 +34,6 @@ warning-1 += $(call cc-option, -Wstringop-truncation)
 warning-1 += -Wno-missing-field-initializers
 warning-1 += -Wno-sign-compare
 
-warning-2 := -Waggregate-return
 warning-2 += -Wcast-align
 warning-2 += -Wdisabled-optimization
 warning-2 += -Wnested-externs
-- 
2.20.1
