Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:28282 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730719AbfJHMGn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Oct 2019 08:06:43 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 3/5] kheaders: optimize header copy for in-tree builds
Date: Tue,  8 Oct 2019 21:05:54 +0900
Message-Id: <20191008120556.4263-3-yamada.masahiro@socionext.com>
In-Reply-To: <20191008120556.4263-1-yamada.masahiro@socionext.com>
References: <20191008120556.4263-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Greg KH <gregkh@linuxfoundation.org>, Joel Fernandes <joel@joelfernandes.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

This script copies headers by the cpio command twice; first from
srctree, and then from objtree. However, when we building in-tree,
we know the srctree and the objtree are the same. That is, all the
headers copied by the first cpio are overwritten by the second one.

Skip the first cpio when we are building in-tree.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 kernel/gen_kheaders.sh | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
index 5f8e664977f8..dd40a1b86f96 100755
--- a/kernel/gen_kheaders.sh
+++ b/kernel/gen_kheaders.sh
@@ -56,14 +56,16 @@ fi
 rm -rf $cpio_dir
 mkdir $cpio_dir
 
-pushd $srctree > /dev/null
-for f in $dir_list;
-	do find "$f" -name "*.h";
-done | cpio --quiet -pd $cpio_dir
-popd > /dev/null
+if [ "$building_out_of_srctree" ]; then
+	pushd $srctree > /dev/null
+	for f in $dir_list
+		do find "$f" -name "*.h";
+	done | cpio --quiet -pd $cpio_dir
+	popd > /dev/null
+fi
 
-# The second CPIO can complain if files already exist which can
-# happen with out of tree builds. Just silence CPIO for now.
+# The second CPIO can complain if files already exist which can happen with out
+# of tree builds having stale headers in srctree. Just silence CPIO for now.
 for f in $dir_list;
 	do find "$f" -name "*.h";
 done | cpio --quiet -pd $cpio_dir >/dev/null 2>&1
-- 
2.17.1
