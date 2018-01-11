Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:60587 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934033AbeAKNG1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jan 2018 08:06:27 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 1/7] fixdep: remove unnecessary <arpa/inet.h> inclusion
Date: Thu, 11 Jan 2018 22:05:40 +0900
Message-Id: <1515675946-7514-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

<arpa/inet.h> was included for ntohl(), but it was removed by
commit dee81e988674 ("fixdep: faster CONFIG_ search").

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - newly added

 scripts/basic/fixdep.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index 86a61d6..b9b4bbf 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -112,7 +112,6 @@
 #include <stdio.h>
 #include <limits.h>
 #include <ctype.h>
-#include <arpa/inet.h>
 
 int insert_extra_deps;
 char *target;
-- 
2.7.4

