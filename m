Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.mnsspb.ru ([84.204.75.2]:47824 "EHLO mail.mnsspb.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934176Ab0BQJE5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 17 Feb 2010 04:04:57 -0500
From: Kirill Smelkov <kirr@mns.spb.ru>
Subject: [PATCH] kbuild: fix a couple of typos in Documentation
Date: Wed, 17 Feb 2010 11:45:33 +0300
Message-Id: <1266396333-6916-1-git-send-email-kirr@mns.spb.ru>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, Kirill Smelkov <kirr@mns.spb.ru>

Signed-off-by: Kirill Smelkov <kirr@mns.spb.ru>
---
 Documentation/kbuild/kbuild.txt    |    2 +-
 Documentation/kbuild/makefiles.txt |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/kbuild/kbuild.txt b/Documentation/kbuild/kbuild.txt
index 6f8c1ca..84725b7 100644
--- a/Documentation/kbuild/kbuild.txt
+++ b/Documentation/kbuild/kbuild.txt
@@ -65,7 +65,7 @@ CROSS_COMPILE
 Specify an optional fixed part of the binutils filename.
 CROSS_COMPILE can be a part of the filename or the full path.
 
-CROSS_COMPILE is also used for ccache is some setups.
+CROSS_COMPILE is also used for ccache in some setups.
 
 CF
 --------------------------------------------------
diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
index 71c602d..0135155 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.txt
@@ -320,7 +320,7 @@ more details, with real examples.
     subdir-ccflags-y, subdir-asflags-y
 	The two flags listed above are similar to ccflags-y and as-falgs-y.
 	The difference is that the subdir- variants has effect for the kbuild
-	file where tey are present and all subdirectories.
+	file where they are present and all subdirectories.
 	Options specified using subdir-* are added to the commandline before
 	the options specified using the non-subdir variants.
 
-- 
1.7.0.17.g7e5eb

