Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:61852 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbfD2EHG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Apr 2019 00:07:06 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] scripts/tags.sh: fix direct execution of scripts/tags.sh
Date: Mon, 29 Apr 2019 13:06:43 +0900
Message-Id: <1556510803-5628-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

I thought this script was run via "make tags" etc. but some people
run it directly.

Prior to commit a9a49c2ad9b9 ("kbuild: use $(srctree) instead of
KBUILD_SRC to check out-of-tree build"), in such a usecase, "tree"
was set empty since KBUILD_SRC is undefined. Now, "tree" is set to
"${srctree}/", which is evaluated to "/".

Fix it by taking into account the case where "srctree" is unset.

Link: https://lkml.org/lkml/2019/4/19/501
Fixes: a9a49c2ad9b9 ("kbuild: use $(srctree) instead of KBUILD_SRC to check out-of-tree build")
Reported-by: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/tags.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index 6a55180..70e14c6 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -19,7 +19,7 @@ ignore="$ignore ( -name *.mod.c ) -prune -o"
 # Do not use full path if we do not use O=.. builds
 # Use make O=. {tags|cscope}
 # to force full paths for a non-O= build
-if [ "${srctree}" = "." ]; then
+if [ "${srctree}" = "." -o -z "${srctree}" ]; then
 	tree=
 else
 	tree=${srctree}/
-- 
2.7.4
