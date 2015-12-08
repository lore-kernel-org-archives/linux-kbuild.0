Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:64205 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932267AbbLHKXR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 8 Dec 2015 05:23:17 -0500
From: Rami Rosen <rami.rosen@intel.com>
Subject: [PATCH] scripts/basic/Makefie: add missing parenthesis
Date: Tue,  8 Dec 2015 12:22:48 -0500
Message-Id: <1449595368-10373-1-git-send-email-rami.rosen@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org, Rami Rosen <rami.rosen@intel.com>

This patch adds  missing parenthesis in scripts/basic/Makefie.

Signed-off-by: Rami Rosen <rami.rosen@intel.com>
---
 scripts/basic/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/basic/Makefile b/scripts/basic/Makefile
index 4fcef87..77a05ef 100644
--- a/scripts/basic/Makefile
+++ b/scripts/basic/Makefile
@@ -4,7 +4,7 @@
 # such as fix file dependencies.
 # This initial step is needed to avoid files to be recompiled
 # when kernel configuration changes (which is what happens when
-# .config is included by main Makefile.
+# .config is included by main Makefile).
 # ---------------------------------------------------------------------------
 # fixdep: 	 Used to generate dependency information during build process
 
-- 
2.5.0

