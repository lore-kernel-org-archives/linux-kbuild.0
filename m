Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:49448 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbfKWQFB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 11:05:01 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 01/16] scripts/kallsyms: remove unneeded #ifndef ARRAY_SIZE
Date: Sun, 24 Nov 2019 01:04:29 +0900
Message-Id: <20191123160444.11251-2-yamada.masahiro@socionext.com>
In-Reply-To: <20191123160444.11251-1-yamada.masahiro@socionext.com>
References: <20191123160444.11251-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

This is not defined in the standard headers. #ifndef is unneeded.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 scripts/kallsyms.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index ae6504d07fd6..918c2ba071b5 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -24,9 +24,7 @@
 #include <ctype.h>
 #include <limits.h>
 
-#ifndef ARRAY_SIZE
 #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof(arr[0]))
-#endif
 
 #define KSYM_NAME_LEN		128
 
-- 
2.17.1
