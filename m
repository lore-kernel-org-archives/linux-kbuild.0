Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:36266 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752776AbYKXUxa (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 24 Nov 2008 15:53:30 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 2/8] kbuild: kill output in silent mode of mkcompile_h
Date: Mon, 24 Nov 2008 21:54:49 +0100
Message-Id: <1227560095-32597-2-git-send-email-sam@ravnborg.org>
In-Reply-To: <20081124205150.GA32497@uranus.ravnborg.org>
References: <20081124205150.GA32497@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: lkml <linux-kernel@vger.kernel.org>, kbuild <linux-kbuild@vger.kernel.org>
Cc: Mike Frysinger <vapier@gentoo.org>, Sam Ravnborg <sam@ravnborg.org>

From: Mike Frysinger <vapier@gentoo.org>

The mkcompile_h script does `echo` regardless of silent mode the make is
running at, so have it respect $quiet from kbuild and only echo when not in
silent mode.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
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
1.5.6.GIT

