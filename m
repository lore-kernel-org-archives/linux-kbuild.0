Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52343 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727673AbeJaUMm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Oct 2018 16:12:42 -0400
From: Mathieu Malaterre <malat@debian.org>
Subject: [PATCH] remove old GCC version implementation
Date: Wed, 31 Oct 2018 12:14:43 +0100
Message-Id: <20181031111444.3472-1-malat@debian.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Mathieu Malaterre <malat@debian.org>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

GCC 4.6 is the minimum supported now.

Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
 scripts/mod/file2alias.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 28a61665bb9c..4b59564d4706 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -83,11 +83,7 @@ extern struct devtable *__start___devtable[], *__stop___devtable[];
 #endif /* __MACH__ */
 
 #if !defined(__used)
-# if __GNUC__ == 3 && __GNUC_MINOR__ < 3
-#  define __used			__attribute__((__unused__))
-# else
-#  define __used			__attribute__((__used__))
-# endif
+#define __used			__attribute__((__used__))
 #endif
 
 /* Define a variable f that holds the value of field f of struct devid
-- 
2.11.0
