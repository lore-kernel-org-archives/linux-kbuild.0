Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:38433 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbfGIJc5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 05:32:57 -0400
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: [PATCH 2/4] scripts: mkdebian: allow renaming generated debian/rules via env
Date: Tue,  9 Jul 2019 11:32:37 +0200
Message-Id: <1562664759-16009-2-git-send-email-info@metux.net>
In-Reply-To: <1562664759-16009-1-git-send-email-info@metux.net>
References: <1562664759-16009-1-git-send-email-info@metux.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: yamada.masahiro@socionext.com, michal.lkml@markovi.net, info@metux.net, apw@canonical.com, joe@perches.com, linux-kbuild@vger.kernel.org, linux-riscv@lists.infradead.org, clang-built-linux@googlegroups.com

Add new environment variable KDEB_RULES for controlling where the
generated debian rules are written to. By defaults, it's debian/rules,
but packagers might override it for providing their own rules file.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 scripts/package/mkdebian | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 8351584..7a9ca4e 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -99,6 +99,9 @@ kernel_headers_packagename=linux-headers-$version
 dbg_packagename=$packagename-dbg
 debarch=
 set_debarch
+if [ -z "$KDEB_RULES" ]; then
+    KDEB_RULES=debian/rules
+fi
 
 if [ "$ARCH" = "um" ] ; then
 	packagename=user-mode-linux-$version
@@ -206,7 +209,7 @@ Description: Linux kernel debugging symbols for $version
  all the necessary debug symbols for the kernel and its modules.
 EOF
 
-cat <<EOF > debian/rules
+cat <<EOF > $KDEB_RULES
 #!$(command -v $MAKE) -f
 
 srctree ?= .
-- 
1.9.1
