Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:58278 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1763425AbYBSJ5S (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Feb 2008 04:57:18 -0500
Received: from cpe001d60ad7267-cm001225dbafb6.cpe.net.cable.rogers.com ([99.236.100.208] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.68)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1JRPE7-0002Vm-B3
	for linux-kbuild@vger.kernel.org; Tue, 19 Feb 2008 04:57:27 -0500
Date: Tue, 19 Feb 2008 04:57:12 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: [PATCH] KBUILD: Define the standard files and dirs for tar and find
 commands.
Message-ID: <alpine.LFD.1.00.0802190456430.25620@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild devel list <linux-kbuild@vger.kernel.org>


Define a whitelist of standard source tree files and directories to be
used for subsequent searching and archiving operations, so that those
operations don't try to descend into non-kernel directories like
"lost+found".

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  if this looks good, any chance on pushing it thru as is so i don't
have to keep adding that patch for subsequent work?  i'm still feeling
like crap today so i can't guarantee my turnaround time.

  note that i chose to distinguish between files and directories, just
in case.

diff --git a/Makefile b/Makefile
index 99300dc..76b16f5 100644
--- a/Makefile
+++ b/Makefile
@@ -353,6 +353,16 @@ export KBUILD_AFLAGS AFLAGS_KERNEL AFLAGS_MODULE
 # even be read-only.
 export MODVERDIR := $(if $(KBUILD_EXTMOD),$(firstword $(KBUILD_EXTMOD))/).tmp_versions

+# An explicit list of source files and directories, to be used in subsequent
+# "find" and "tar" operations to avoid trying to descend into directories like
+# "lost+found".
+
+KBUILD_ALL_FILES := COPYING CREDITS Kbuild MAINTAINERS Makefile README REPORTING-BUGS
+KBUILD_ALL_DIRS := arch block crypto Documentation drivers fs include init ipc
+KBUILD_ALL_DIRS += kernel lib mm net samples scripts security sound usr virt
+KBUILD_ALL SRCS := $(KBUILD_ALL_FILES) $(KBUILD_ALL_DIRS)
+export KBUILD_ALL_FILES KBUILD_ALL_DIRS KBUILD_ALL_SRCS
+
 # Files to ignore in find ... statements

 RCS_FIND_IGNORE := \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o
========================================================================
Robert P. J. Day Linux Consulting, Training and Annoying Kernel
Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================
