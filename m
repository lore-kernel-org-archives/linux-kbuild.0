Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from metis.extern.pengutronix.de ([83.236.181.26]:42432 "EHLO
	metis.extern.pengutronix.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750918AbYCaNdM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 31 Mar 2008 09:33:12 -0400
From: Wolfram Sang <w.sang@pengutronix.de>
Subject: [PATCH] Documentation/kbuild: fix typos (s/bin_shipped/bin.o_shipped/)
Date: Mon, 31 Mar 2008 15:08:04 +0200
Message-Id: <1206968884-16410-1-git-send-email-w.sang@pengutronix.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Wolfram Sang <w.sang@pengutronix.de>

The text always mentions ...bin.o_shipped, just the example makefiles
actually use ...bin_shipped. It was corrected in one place some time
ago, these ones seem to have been forgotten.

Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
---
 Documentation/kbuild/modules.txt |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/kbuild/modules.txt b/Documentation/kbuild/modules.txt
index 1d247d5..ce3f2ff 100644
--- a/Documentation/kbuild/modules.txt
+++ b/Documentation/kbuild/modules.txt
@@ -253,7 +253,7 @@ following files:
 
 		# Module specific targets
 		genbin:
-			echo "X" > 8123_bin_shipped
+			echo "X" > 8123_bin.o_shipped
 
 
 	In example 2, we are down to two fairly simple files and for simple
@@ -279,7 +279,7 @@ following files:
 
 		# Module specific targets
 		genbin:
-			echo "X" > 8123_bin_shipped
+			echo "X" > 8123_bin.o_shipped
 
 		endif
 
-- 
1.5.4.4

