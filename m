Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:39600 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755792AbYFHUG5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 8 Jun 2008 16:06:57 -0400
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 5/6] kbuild: error out early in make headers_install
Date: Sun,  8 Jun 2008 22:07:37 +0200
Message-Id: <1212955658-32168-5-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080608094730.GA30098@uranus.ravnborg.org>
References: <20080608094730.GA30098@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>

Fix the a.out.h case by setting SRCARCH and error
out early in case of an error.
The a.out.h case failed with the *_all targets.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 Makefile |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 2630f5f..8f8fd6f 100644
--- a/Makefile
+++ b/Makefile
@@ -1012,8 +1012,9 @@ __headers: include/linux/version.h scripts_basic FORCE
 
 PHONY += headers_install_all
 headers_install_all: __headers
-	$(Q)for arch in $(hdr-archs); do \
-	 $(MAKE) ARCH=$$arch $(hdr-inst)=include BIASMDIR=-bi-$$arch ;\
+	$(Q)set -e; for arch in $(hdr-archs); do \
+	 $(MAKE) ARCH=$$arch SRCARCH=$$arch $(hdr-inst)=include \
+	         BIASMDIR=-bi-$$arch ;\
 	 done
 
 PHONY += headers_install
@@ -1026,8 +1027,9 @@ headers_install: __headers
 
 PHONY += headers_check_all
 headers_check_all: headers_install_all
-	$(Q)for arch in $(hdr-archs); do \
-	 $(MAKE) ARCH=$$arch $(hdr-inst)=include BIASMDIR=-bi-$$arch HDRCHECK=1 ;\
+	$(Q)set -e; for arch in $(hdr-archs); do \
+	 $(MAKE) ARCH=$$arch SRCARCH=$$arch $(hdr-inst)=include \
+	         BIASMDIR=-bi-$$arch HDRCHECK=1 ;\
 	 done
 
 PHONY += headers_check
-- 
1.5.4.1.143.ge7e51

