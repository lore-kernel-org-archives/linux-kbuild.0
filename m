Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:53412 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755233AbYBRI4F (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Feb 2008 03:56:05 -0500
Received: from cpe001d60ad7267-cm001225dbafb6.cpe.net.cable.rogers.com ([99.236.100.208] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.68)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1JR1nB-0003Re-8q
	for linux-kbuild@vger.kernel.org; Mon, 18 Feb 2008 03:56:05 -0500
Date: Mon, 18 Feb 2008 03:55:58 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: [PATCH] KBUILD:  Fix help to refer to "make modules_prepare".
Message-ID: <alpine.LFD.1.00.0802180354420.1157@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild devel list <linux-kbuild@vger.kernel.org>


"make prepare" is not sufficient for building modules, you need "make
modules_prepare".

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/Makefile b/Makefile
index 67cc457..d2d25de 100644
--- a/Makefile
+++ b/Makefile
@@ -1188,7 +1188,7 @@ help:
 	@echo  '  dir/            - Build all files in dir and below'
 	@echo  '  dir/file.[ois]  - Build specified target only'
 	@echo  '  dir/file.ko     - Build module including final link'
-	@echo  '  prepare         - Set up for building external modules'
+	@echo  '  modules_prepare - Set up for building external modules'
 	@echo  '  tags/TAGS	  - Generate tags file for editors'
 	@echo  '  cscope	  - Generate cscope index'
 	@echo  '  kernelrelease	  - Output the release version string'
========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================
