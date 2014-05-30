Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:53343 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753089AbaE3LMI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 30 May 2014 07:12:08 -0400
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH 5/7] scripts: objdiff: change the extension of disassembly from .o to .dis
Date: Fri, 30 May 2014 20:11:53 +0900
Message-Id: <1401448315-800-6-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1401448315-800-1-git-send-email-yamada.m@jp.panasonic.com>
References: <1401448315-800-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>, Jason Cooper <jason@lakedaemon.net>

Prior to this commit, the command "scripts/objdiff record path/to/*.o"
disassembles the given object into ".tmp_objdiff/path/to/*.o" file.

The problem here is that recorded disassemblies are lost if we run
"make clean" because "make clean" removes all the *.o files.
Disassembled code should be dumped into *.dis instead of *.o file.

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: Jason Cooper <jason@lakedaemon.net>
---
 scripts/objdiff | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/objdiff b/scripts/objdiff
index 499eb4b..c997e44 100755
--- a/scripts/objdiff
+++ b/scripts/objdiff
@@ -65,13 +65,14 @@ dorecord() {
 
 	for f in $FILES; do
 		dir=$(get_output_dir $f)
-		bn="${f##*/}"
+		base=${f##*/}
+		dis=$dir/${base%.o}.dis
 
 		[ ! -d "$dir" ] && mkdir -p $dir
 
 		# remove addresses for a more clear diff
 		# http://dummdida.tumblr.com/post/60924060451/binary-diff-between-libc-from-scientificlinux-and
-		$OBJDUMP -D $f | sed "s/^[[:space:]]\+[0-9a-f]\+//" > $dir/$bn
+		$OBJDUMP -D $f | sed "s/^[[:space:]]\+[0-9a-f]\+//" > $dis
 	done
 }
 
-- 
1.9.1

