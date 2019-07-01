Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:59957 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbfGABAO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 30 Jun 2019 21:00:14 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 5/7] kheaders: remove meaningless -R option of 'ls'
Date: Mon,  1 Jul 2019 09:58:43 +0900
Message-Id: <20190701005845.12475-6-yamada.masahiro@socionext.com>
In-Reply-To: <20190701005845.12475-1-yamada.masahiro@socionext.com>
References: <20190701005845.12475-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Joel Fernandes <joel@joelfernandes.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

The -R option of 'ls' is supposed to be used for directories.

       -R, --recursive
              list subdirectories recursively

Since 'find ... -type f' only matches to regular files, we do not
expect directories passed to the 'ls' command here.

Giving -R is harmless at least, but unneeded.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v4:
  - New patch

Changes in v3: None
Changes in v2: None

 kernel/gen_kheaders.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
index 9a34e1d9bd7f..86a666f5cb17 100755
--- a/kernel/gen_kheaders.sh
+++ b/kernel/gen_kheaders.sh
@@ -33,8 +33,8 @@ arch/$SRCARCH/include/
 # Uncomment it for debugging.
 # if [ ! -f /tmp/iter ]; then iter=1; echo 1 > /tmp/iter;
 # else iter=$(($(cat /tmp/iter) + 1)); echo $iter > /tmp/iter; fi
-# find $src_file_list -type f | xargs ls -lR > /tmp/src-ls-$iter
-# find $obj_file_list -type f | xargs ls -lR > /tmp/obj-ls-$iter
+# find $src_file_list -type f | xargs ls -l > /tmp/src-ls-$iter
+# find $obj_file_list -type f | xargs ls -l > /tmp/obj-ls-$iter
 
 # include/generated/compile.h is ignored because it is touched even when none
 # of the source files changed. This causes pointless regeneration, so let us
@@ -46,7 +46,7 @@ src_files_md5="$(find $src_file_list -type f                       |
 		grep -v "include/config/auto.conf"		   |
 		grep -v "include/config/auto.conf.cmd"		   |
 		grep -v "include/config/tristate.conf"		   |
-		xargs ls -lR | md5sum | cut -d ' ' -f1)"
+		xargs ls -l | md5sum | cut -d ' ' -f1)"
 popd > /dev/null
 obj_files_md5="$(find $obj_file_list -type f                       |
 		grep -v "include/generated/compile.h"		   |
@@ -54,7 +54,7 @@ obj_files_md5="$(find $obj_file_list -type f                       |
 		grep -v "include/config/auto.conf"                 |
 		grep -v "include/config/auto.conf.cmd"		   |
 		grep -v "include/config/tristate.conf"		   |
-		xargs ls -lR | md5sum | cut -d ' ' -f1)"
+		xargs ls -l | md5sum | cut -d ' ' -f1)"
 
 if [ -f $tarfile ]; then tarfile_md5="$(md5sum $tarfile | cut -d ' ' -f1)"; fi
 if [ -f kernel/kheaders.md5 ] &&
-- 
2.17.1
