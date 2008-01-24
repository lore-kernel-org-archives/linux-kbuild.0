Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:37405 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758776AbYAXWDs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:48 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 09/77] kbuild: Add missing srctree prefix for includecheck and versioncheck
Date: Thu, 24 Jan 2008 23:02:50 +0100
Message-Id: <1201212238-4369-9-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, Sam Ravnborg <sam@ravnborg.org>

From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>

Add missing $(srctree)/ prefix for scripts used by the includecheck and
versioncheck make targets

Signed-off-by: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 Makefile |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 39b9bfe..c546e05 100644
--- a/Makefile
+++ b/Makefile
@@ -1430,12 +1430,12 @@ tags: FORCE
 includecheck:
 	find * $(RCS_FIND_IGNORE) \
 		-name '*.[hcS]' -type f -print | sort \
-		| xargs $(PERL) -w scripts/checkincludes.pl
+		| xargs $(PERL) -w $(srctree)/scripts/checkincludes.pl
 
 versioncheck:
 	find * $(RCS_FIND_IGNORE) \
 		-name '*.[hcS]' -type f -print | sort \
-		| xargs $(PERL) -w scripts/checkversion.pl
+		| xargs $(PERL) -w $(srctree)/scripts/checkversion.pl
 
 namespacecheck:
 	$(PERL) $(srctree)/scripts/namespace.pl
-- 
1.5.4.rc3.14.g44397

