Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:42763 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758755AbYAXWDs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:48 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 07/77] kbuild: add 'includecheck' help text
Date: Thu, 24 Jan 2008 23:02:48 +0100
Message-Id: <1201212238-4369-7-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Sam Ravnborg <sam@ravnborg.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

Add 'includecheck' to the Static analyzers help list.

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index ce641eb..79c48b2 100644
--- a/Makefile
+++ b/Makefile
@@ -1188,6 +1188,7 @@ help:
 	@echo  'Static analysers'
 	@echo  '  checkstack      - Generate a list of stack hogs'
 	@echo  '  namespacecheck  - Name space analysis on compiled kernel'
+	@echo  '  includecheck    - Check for duplicate included header files'
 	@echo  '  export_report   - List the usages of all exported symbols'
 	@if [ -r $(srctree)/include/asm-$(SRCARCH)/Kbuild ]; then \
 	 echo  '  headers_check   - Sanity check on exported headers'; \
-- 
1.5.4.rc3.14.g44397

