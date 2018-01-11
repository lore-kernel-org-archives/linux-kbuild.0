Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:47658 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750752AbeAKJ2k (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jan 2018 04:28:40 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] genksyms: drop *.hash.c from .gitignore
Date: Thu, 11 Jan 2018 18:28:08 +0900
Message-Id: <1515662888-18296-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

This is a left-over of commit bb3290d91695 ("Remove gperf usage from
toolchain").

We do not generate a hash function any more.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/genksyms/.gitignore | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/genksyms/.gitignore b/scripts/genksyms/.gitignore
index 86dc07a..e7836b4 100644
--- a/scripts/genksyms/.gitignore
+++ b/scripts/genksyms/.gitignore
@@ -1,4 +1,3 @@
-*.hash.c
 *.lex.c
 *.tab.c
 *.tab.h
-- 
2.7.4

