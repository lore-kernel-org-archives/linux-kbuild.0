Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:62937 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750859AbdJZE5C (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Oct 2017 00:57:02 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] coccinelle: fix verbose message about .cocci file being run
Date: Thu, 26 Oct 2017 13:55:51 +0900
Message-Id: <1508993751-17218-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: cocci@systeme.lip6.fr, linux-kbuild@vger.kernel.org, Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Gilles Muller <Gilles.Muller@lip6.fr>, Michal Marek <michal.lkml@markovi.net>

If you run coccicheck with V=1 and COCCI=, you will see a strange
path to the semantic patch file.  For example, run the following:

$ make V=1 COCCI=scripts/coccinelle/free/kfree.cocci coccicheck
  [ snip ]
 The semantic patch that makes this report is available
 in scriptcoccinelle/free/kfree.cocci.

Notice "s/" was dropped from "scripts/coccinelle/free/kfree.cocci".

When running coccicheck without O=, $srctree is expanded to ".", which
represents one arbitrary character in the regular expression.  Using
sed is not a good choice here.  Strip $srctree/ simply without sed.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/coccicheck | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/coccicheck b/scripts/coccicheck
index 1bfa2d2..9d18662 100755
--- a/scripts/coccicheck
+++ b/scripts/coccicheck
@@ -186,7 +186,7 @@ coccinelle () {
 
     if [ $VERBOSE -ne 0 -a $ONLINE -eq 0 ] ; then
 
-	FILE=`echo $COCCI | sed "s|$srctree/||"`
+	FILE=${COCCI#$srctree/}
 
 	echo "Processing `basename $COCCI`"
 	echo "with option(s) \"$OPT\""
-- 
2.7.4

