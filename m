Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:40166 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752368AbYBQVdu (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 17 Feb 2008 16:33:50 -0500
Received: from cpe001d60ad7267-cm001225dbafb6.cpe.net.cable.rogers.com ([99.236.100.208] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.68)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1JQr8v-0001eB-1R
	for linux-kbuild@vger.kernel.org; Sun, 17 Feb 2008 16:33:49 -0500
Date: Sun, 17 Feb 2008 16:33:45 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: [PATCH] KBUILD:  Add a couple entries to no-dot-config-targets.
Message-ID: <alpine.LFD.1.00.0802171633270.6477@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild devel list <linux-kbuild@vger.kernel.org>


Add the targets "includecheck" and "versioncheck" to
no-dot-config-targets, and make a number of targets PHONY.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  feel free to tweak if i missed anything.

diff --git a/Makefile b/Makefile
index 67cc457..023c085 100644
--- a/Makefile
+++ b/Makefile
@@ -390,7 +390,8 @@ endif
 no-dot-config-targets := clean mrproper distclean \
 			 cscope TAGS tags help %docs check% \
 			 include/linux/version.h headers_% \
-			 kernelrelease kernelversion
+			 kernelrelease kernelversion includecheck \
+			 versioncheck

 config-targets := 0
 mixed-targets  := 0
@@ -1441,6 +1442,8 @@ tags: FORCE
 # Scripts to check various things for consistency
 # ---------------------------------------------------------------------------

+PHONY += includecheck versioncheck namespacecheck export_report
+
 includecheck:
 	find * $(RCS_FIND_IGNORE) \
 		-name '*.[hcS]' -type f -print | sort \


========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================
