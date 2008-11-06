Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.gentoo.org ([140.211.166.183]:38341 "EHLO smtp.gentoo.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753265AbYKFIbY (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 6 Nov 2008 03:31:24 -0500
From: Mike Frysinger <vapier@gentoo.org>
Subject: [PATCH] scripts/mkcompile_h: kill output in silent mode
Date: Thu,  6 Nov 2008 03:31:22 -0500
Message-Id: <1225960282-30342-1-git-send-email-vapier@gentoo.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

The mkcompile_h script does `echo` regardless of silent mode the make is
running at, so have it respect $quiet from kbuild and only echo when not in
silent mode.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 scripts/mkcompile_h |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
index a8740df..6a12dd9 100755
--- a/scripts/mkcompile_h
+++ b/scripts/mkcompile_h
@@ -4,6 +4,8 @@ SMP=$3
 PREEMPT=$4
 CC=$5
 
+vecho() { [ "${quiet}" = "silent_" ] || echo "$@" ; }
+
 # If compile.h exists already and we don't own autoconf.h
 # (i.e. we're not the same user who did make *config), don't
 # modify compile.h
@@ -11,7 +13,7 @@ CC=$5
 # do "compiled by root"
 
 if [ -r $TARGET -a ! -O include/linux/autoconf.h ]; then
-  echo "  SKIPPED $TARGET"
+  vecho "  SKIPPED $TARGET"
   exit 0
 fi
 
@@ -89,7 +91,7 @@ if [ -r $TARGET ] && \
       cmp -s .tmpver.1 .tmpver.2; then
    rm -f .tmpcompile
 else
-   echo "  UPD     $TARGET"
+   vecho "  UPD     $TARGET"
    mv -f .tmpcompile $TARGET
 fi
 rm -f .tmpver.1 .tmpver.2
-- 
1.6.0.3

