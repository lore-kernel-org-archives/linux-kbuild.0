Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp6.pp.htv.fi ([213.243.153.40]:50047 "EHLO smtp6.pp.htv.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753689AbYGWTvC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 23 Jul 2008 15:51:02 -0400
Date: Wed, 23 Jul 2008 22:50:45 +0300
From: Adrian Bunk <bunk@kernel.org>
Subject: [2.6 patch] scripts/ver_linux: don't set PATH
Message-ID: <20080723195045.GB5991@cs181140183.pp.htv.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org

It would have saved both a bug submitter and me a few hours if 
scripts/ver_linux had picked the same gcc as the build.

Since I can't see any reason why it fiddles with PATH at all this patch 
therefore removes the PATH setting.

Signed-off-by: Adrian Bunk <bunk@kernel.org>

---
25791ec63deb848c897e7a03a62434a4f1c3a41a 
diff --git a/scripts/ver_linux b/scripts/ver_linux
index 7ac0e30..dbb3037 100755
--- a/scripts/ver_linux
+++ b/scripts/ver_linux
@@ -4,7 +4,6 @@
 # /bin /sbin /usr/bin /usr/sbin /usr/local/bin, but it may
 # differ on your system.
 #
-PATH=/sbin:/usr/sbin:/bin:/usr/bin:/usr/local/sbin:$PATH
 echo 'If some fields are empty or look unusual you may have an old version.'
 echo 'Compare to the current minimal requirements in Documentation/Changes.'
 echo ' '

