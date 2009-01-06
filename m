Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:51839 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751727AbZAFOM2 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 6 Jan 2009 09:12:28 -0500
Date: Tue, 6 Jan 2009 15:12:27 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
Subject: [PATCH RESEND] Documentation/kbuild: fix typos
	(s/bin_shipped/bin.o_shipped/)
Message-ID: <20090106141227.GA28227@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: sam@ravnborg.org

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

