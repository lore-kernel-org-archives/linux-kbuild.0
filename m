Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:40031 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752795AbYBRTev (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Feb 2008 14:34:51 -0500
Received: from cpe001d60ad7267-cm001225dbafb6.cpe.net.cable.rogers.com ([99.236.100.208] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.68)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1JRBlL-0002ed-T0
	for linux-kbuild@vger.kernel.org; Mon, 18 Feb 2008 14:34:51 -0500
Date: Mon, 18 Feb 2008 14:34:46 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: [PATCH] KBUILD:  Remove meaningless comment from Makefile.
Message-ID: <alpine.LFD.1.00.0802181432570.4650@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild devel list <linux-kbuild@vger.kernel.org>


Given that there is no usage of a TAR_IGNORE variable, that initial
comment can be tossed.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

sam,

  might as well just add this to the accumulating typoes patch if
you want, unless you've already fixed this.

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 5e32607..eb23656 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -1,10 +1,6 @@
 # Makefile for the different targets used to generate full packages of a kernel
 # It uses the generic clean infrastructure of kbuild

-# Ignore the following files/directories during tar operation
-TAR_IGNORE := --exclude SCCS --exclude BitKeeper --exclude .svn --exclude CVS
-
-
 # RPM target
 # ---------------------------------------------------------------------------
 # The rpm target generates two rpm files:
========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================
