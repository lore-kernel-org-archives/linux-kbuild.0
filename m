Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:35089 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751997AbdJZE6E (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Oct 2017 00:58:04 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [RFC PATCH] coccinelle: fix parallel build with CHECK=scripts/coccicheck
Date: Thu, 26 Oct 2017 13:56:46 +0900
Message-Id: <1508993806-17320-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: cocci@systeme.lip6.fr, linux-kbuild@vger.kernel.org, Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Gilles Muller <Gilles.Muller@lip6.fr>, Michal Marek <michal.lkml@markovi.net>

If I run the following:

  $ make -j8 C=1 CHECK=scripts/coccicheck

lots of "coccicheck failed" messages are displayed.

I do not know the coccinell internals, but I guess --jobs does not
work well if spatch is invoked from Make running in parallel.
Disable --jobs in this case.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/coccicheck | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/coccicheck b/scripts/coccicheck
index 9d18662..b74c789 100755
--- a/scripts/coccicheck
+++ b/scripts/coccicheck
@@ -69,6 +69,9 @@ if [ "$C" = "1" -o "$C" = "2" ]; then
     # Take only the last argument, which is the C file to test
     shift $(( $# - 1 ))
     OPTIONS="$COCCIINCLUDE $1"
+
+    # --jobs does not work if Make is running in parallel
+    echo $MAKEFLAGS | grep "\-\-jobserver-auth" && USE_JOBS="no"
 else
     ONLINE=0
     if [ "$KBUILD_EXTMOD" = "" ] ; then
-- 
2.7.4

