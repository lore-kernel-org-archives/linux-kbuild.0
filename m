Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:37403 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758756AbYAXWDs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:48 -0500
Received: from ravnborg.org (0x535d98d8.vgnxx8.adsl-dhcp.tele.dk [83.93.152.216])
	by pasmtpA.tele.dk (Postfix) with ESMTP id C76A7801DF5
	for <linux-kbuild@vger.kernel.org>; Thu, 24 Jan 2008 23:03:47 +0100 (CET)
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 08/77] kbuild: document versioncheck in make help
Date: Thu, 24 Jan 2008 23:02:49 +0100
Message-Id: <1201212238-4369-8-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 79c48b2..39b9bfe 100644
--- a/Makefile
+++ b/Makefile
@@ -1188,6 +1188,7 @@ help:
 	@echo  'Static analysers'
 	@echo  '  checkstack      - Generate a list of stack hogs'
 	@echo  '  namespacecheck  - Name space analysis on compiled kernel'
+	@echo  '  versioncheck    - Sanity check on version.h usage'
 	@echo  '  includecheck    - Check for duplicate included header files'
 	@echo  '  export_report   - List the usages of all exported symbols'
 	@if [ -r $(srctree)/include/asm-$(SRCARCH)/Kbuild ]; then \
-- 
1.5.4.rc3.14.g44397

