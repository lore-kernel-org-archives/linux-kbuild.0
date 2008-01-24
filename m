Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:37464 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758503AbYAXWEG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:04:06 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 44/77] kbuild: document 'make prepare' in 'make help'
Date: Thu, 24 Jan 2008 23:03:25 +0100
Message-Id: <1201212238-4369-44-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: "Valdis.Kletnieks@vt.edu" <Valdis.Kletnieks@vt.edu>, Valdis Kletnieks <valdis.kletnieks@vt.edu>, Sam Ravnborg <sam@ravnborg.org>

From: Valdis.Kletnieks@vt.edu <Valdis.Kletnieks@vt.edu>

The output of 'make help' covers a lot of options, but doesn't include
a listing for 'make prepare'.  Here's a one-liner to fix that...

Signed-off-by: Valdis Kletnieks <valdis.kletnieks@vt.edu>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index d599acd..e518ed6 100644
--- a/Makefile
+++ b/Makefile
@@ -1181,6 +1181,7 @@ help:
 	@echo  '  dir/            - Build all files in dir and below'
 	@echo  '  dir/file.[ois]  - Build specified target only'
 	@echo  '  dir/file.ko     - Build module including final link'
+	@echo  '  prepare         - Set up for building external modules'
 	@echo  '  tags/TAGS	  - Generate tags file for editors'
 	@echo  '  cscope	  - Generate cscope index'
 	@echo  '  kernelrelease	  - Output the release version string'
-- 
1.5.4.rc3.14.g44397

