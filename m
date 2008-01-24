Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:42827 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758883AbYAXWDw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:52 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 19/77] Kbuild: Clarify the rpm-related make packaging targets
Date: Thu, 24 Jan 2008 23:03:00 +0100
Message-Id: <1201212238-4369-19-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>, Sam Ravnborg <sam@ravnborg.org>

From: Robert P. J. Day <rpjday@crashcourse.ca>

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 Makefile                 |    1 -
 scripts/package/Makefile |    5 ++---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 532981a..4aa59b8 100644
--- a/Makefile
+++ b/Makefile
@@ -1181,7 +1181,6 @@ help:
 	@echo  '  dir/            - Build all files in dir and below'
 	@echo  '  dir/file.[ois]  - Build specified target only'
 	@echo  '  dir/file.ko     - Build module including final link'
-	@echo  '  rpm		  - Build a kernel as an RPM package'
 	@echo  '  tags/TAGS	  - Generate tags file for editors'
 	@echo  '  cscope	  - Generate cscope index'
 	@echo  '  kernelrelease	  - Output the release version string'
diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 7c434e0..5e32607 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -89,9 +89,8 @@ clean-dirs += $(objtree)/tar-install/
 # Help text displayed when executing 'make help'
 # ---------------------------------------------------------------------------
 help: FORCE
-	@echo '  rpm-pkg         - Build the kernel as an RPM package'
-	@echo '  binrpm-pkg      - Build an rpm package containing the compiled kernel'
-	@echo '                    and modules'
+	@echo '  rpm-pkg         - Build both source and binary RPM kernel packages'
+	@echo '  binrpm-pkg      - Build only the binary kernel package'
 	@echo '  deb-pkg         - Build the kernel as an deb package'
 	@echo '  tar-pkg         - Build the kernel as an uncompressed tarball'
 	@echo '  targz-pkg       - Build the kernel as a gzip compressed tarball'
-- 
1.5.4.rc3.14.g44397

