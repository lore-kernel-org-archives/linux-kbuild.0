Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:38175 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751919AbaE3LMH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 30 May 2014 07:12:07 -0400
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH 1/7] scripts: objdiff: get the path to .tmp_objdiff more simply
Date: Fri, 30 May 2014 20:11:49 +0900
Message-Id: <1401448315-800-2-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1401448315-800-1-git-send-email-yamada.m@jp.panasonic.com>
References: <1401448315-800-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>, Jason Cooper <jason@lakedaemon.net>

This commit is a minor refactoring.

Temporary files for objdiff are stored in .tmp_objdiff directory
which is located at the top directory.

To get the path to this directory,

  SRCTREE=`git rev-parse --show-toplevel`
  TMPD=$SRCTREE/.tmp_objdiff

seems easier to understand than

  GIT_DIR=`git rev-parse --git-dir`
  TMPD=${GIT_DIR%git}tmp_objdiff

Besides, it is not always necessary to create .tmp_objdiff dicrectory.
It should be created only for "record" command.

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: Jason Cooper <jason@lakedaemon.net>
---
 scripts/objdiff | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/scripts/objdiff b/scripts/objdiff
index b3e4f10..b8f7fc6 100755
--- a/scripts/objdiff
+++ b/scripts/objdiff
@@ -25,17 +25,15 @@
 #
 # Note: 'make mrproper' will also remove .tmp_objdiff
 
-GIT_DIR="`git rev-parse --git-dir`"
+SRCTREE=$(git rev-parse --show-toplevel 2>/dev/null)
 
-if [ -d "$GIT_DIR" ]; then
-	TMPD="${GIT_DIR%git}tmp_objdiff"
-
-	[ -d "$TMPD" ] || mkdir "$TMPD"
-else
-	echo "ERROR: git directory not found."
+if [ -z "$SRCTREE" ]; then
+	echo "ERROR: Not a git repository."
 	exit 1
 fi
 
+TMPD=$SRCTREE/.tmp_objdiff
+
 usage() {
 	echo "Usage: $0 <command> <args>"
 	echo "  record    <list of object files>"
-- 
1.9.1

