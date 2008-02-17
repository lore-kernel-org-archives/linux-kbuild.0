Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:38227 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755727AbYBQUXF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 17 Feb 2008 15:23:05 -0500
Received: from cpe001d60ad7267-cm001225dbafb6.cpe.net.cable.rogers.com ([99.236.100.208] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.68)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1JQq2S-0007XM-Ah
	for linux-kbuild@vger.kernel.org; Sun, 17 Feb 2008 15:23:04 -0500
Date: Sun, 17 Feb 2008 15:22:59 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: [PATCH] KBUILD: Clarify which tags targets are for which editors.
Message-ID: <alpine.LFD.1.00.0802171522001.592@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild devel list <linux-kbuild@vger.kernel.org>


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/Makefile b/Makefile
index 67cc457..95d6a63 100644
--- a/Makefile
+++ b/Makefile
@@ -1189,7 +1189,7 @@ help:
 	@echo  '  dir/file.[ois]  - Build specified target only'
 	@echo  '  dir/file.ko     - Build module including final link'
 	@echo  '  prepare         - Set up for building external modules'
-	@echo  '  tags/TAGS	  - Generate tags file for editors'
+	@echo  '  {tags,TAGS}     - Generate tags file for {vi,emacs} editors'
 	@echo  '  cscope	  - Generate cscope index'
 	@echo  '  kernelrelease	  - Output the release version string'
 	@echo  '  kernelversion	  - Output the version stored in Makefile'
========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================
