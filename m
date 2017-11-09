Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:16903 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751225AbdKIHCa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Nov 2017 02:02:30 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2] coccinelle: fix parallel build with CHECK=scripts/coccicheck
Date: Thu,  9 Nov 2017 16:00:50 +0900
Message-Id: <1510210850-28866-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: cocci@systeme.lip6.fr, Julia Lawall <Julia.Lawall@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>

The command "make -j8 C=1 CHECK=scripts/coccicheck" produces lots of
"coccicheck failed" error messages.

I do not know the coccinelle internals, but I guess --jobs does not
work well if spatch is invoked from Make running in parallel.
Disable --jobs in this case.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Grep '-j' instead of '--jobserver-auth'.
    '--jobserver-*' is not a stable option flag.
    Make 4.2 change '--jobserver-fds' into '--jobserver-auth'
  - Add -q option to grep

 scripts/coccicheck | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/coccicheck b/scripts/coccicheck
index 040a8b1..8bab11e 100755
--- a/scripts/coccicheck
+++ b/scripts/coccicheck
@@ -70,6 +70,9 @@ if [ "$C" = "1" -o "$C" = "2" ]; then
     # Take only the last argument, which is the C file to test
     shift $(( $# - 1 ))
     OPTIONS="$COCCIINCLUDE $1"
+
+    # --jobs does not work if Make is running in parallel
+    echo $MAKEFLAGS | grep -q -E '(^| )-j' && USE_JOBS="no"
 else
     ONLINE=0
     if [ "$KBUILD_EXTMOD" = "" ] ; then
-- 
2.7.4

