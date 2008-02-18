Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:35595 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755500AbYBRQfk (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Feb 2008 11:35:40 -0500
Received: from cpe001d60ad7267-cm001225dbafb6.cpe.net.cable.rogers.com ([99.236.100.208] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.68)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1JR8xv-0003R6-4A
	for linux-kbuild@vger.kernel.org; Mon, 18 Feb 2008 11:35:39 -0500
Date: Mon, 18 Feb 2008 11:35:30 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: packaging issues:  some serious, some not so serious
Message-ID: <alpine.LFD.1.00.0802181054100.9323@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild devel list <linux-kbuild@vger.kernel.org>


  there are a few bugs in the packaging targets, both with local
packaging and remote packaging if you've used "O=" for your kernel
build.  first, let's consider local builds.

  consider the packaging makefile scripts/package/Makefile.  these
early lines look entirely superfluous (nothing uses the variable
TAR_IGNORE):

...
# Ignore the following files/directories during tar operation
TAR_IGNORE := --exclude SCCS --exclude BitKeeper --exclude .svn --exclude CVS
...

  next, related to my earlier email, if your kernel source happens to
be in its own filesystem so that there's a "lost+found" directory, any
"tar" operation is going to fail due to lack of permissions for that
directory:

$ make rpm-pkg
...
find: ./lost+found: Permission denied
...
tar: kernel-2.6.25rc200015g1309d4e/./lost+found: Cannot open:
Permission denied
tar: Error exit delayed from previous errors
make[1]: *** [rpm-pkg] Error 2
make: *** [rpm-pkg] Error 2
$

  it seems to be sufficient to apply the following patch:

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 5e32607..d3307f1 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -39,7 +39,7 @@ $(objtree)/kernel.spec: $(MKSPEC) $(srctree)/Makefile
 rpm-pkg rpm: $(objtree)/kernel.spec FORCE
        $(MAKE) clean
        $(PREV) ln -sf $(srctree) $(KERNELPATH)
-       $(PREV) tar -cz $(RCS_TAR_IGNORE) -f $(KERNELPATH).tar.gz $(KERNELPATH)/.
+       $(PREV) tar -cz --exclude lost+found $(RCS_TAR_IGNORE) -f $(KERNELPATH).tar.gz $(KERNELPATH)/.
        $(PREV) rm $(KERNELPATH)

        set -e; \


but it's probable that a number of other operations need to take a
"lost+found" directory into account; that is, anything involving
"tar".

  observations on remote packaging to come.

rday
--


========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================
