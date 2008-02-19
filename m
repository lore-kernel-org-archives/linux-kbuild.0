Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:38967 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753047AbYBSPbg (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Feb 2008 10:31:36 -0500
Received: from cpe001d60ad7267-cm001225dbafb6.cpe.net.cable.rogers.com ([99.236.100.208] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.68)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1JRURS-0007Yj-TU
	for linux-kbuild@vger.kernel.org; Tue, 19 Feb 2008 10:31:35 -0500
Date: Tue, 19 Feb 2008 10:31:30 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: [PATCH] KBUILD:  Extend some command directory blacklists.
Message-ID: <alpine.LFD.1.00.0802191028260.4382@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild devel list <linux-kbuild@vger.kernel.org>


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  packaging is still somewhat broken, but this patch at least makes it
less broken.  it defines a Kbuild whitelist but doesn't actually take
advantage of it (yet).  all this does is fix the annoying lost+found
issue for now.

  obviously, you can toss any of the earlier patches related to this.


 Makefile                 |   39 +++++++++++++++++++++++--------------
 scripts/package/Makefile |    2 -
 2 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/Makefile b/Makefile
index 99300dc..3b444ac 100644
--- a/Makefile
+++ b/Makefile
@@ -353,10 +353,21 @@ export KBUILD_AFLAGS AFLAGS_KERNEL AFLAGS_MODULE
 # even be read-only.
 export MODVERDIR := $(if $(KBUILD_EXTMOD),$(firstword $(KBUILD_EXTMOD))/).tmp_versions

-# Files to ignore in find ... statements
+# An explicit whitelist of source files and directories to be used by various
+# commands to avoid descending into unwanted directories.

-RCS_FIND_IGNORE := \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o
-export RCS_TAR_IGNORE := --exclude SCCS --exclude BitKeeper --exclude .svn --exclude CVS --exclude .pc --exclude .hg --exclude .git
+KBUILD_ALL_FILES := COPYING CREDITS Kbuild MAINTAINERS Makefile README REPORTING-BUGS
+KBUILD_ALL_DIRS := arch block crypto Documentation drivers fs include init ipc
+KBUILD_ALL_DIRS += kernel lib mm net samples scripts security sound usr virt
+KBUILD_ALL SRCS := $(KBUILD_ALL_FILES) $(KBUILD_ALL_DIRS)
+export KBUILD_ALL_FILES KBUILD_ALL_DIRS KBUILD_ALL_SRCS
+
+# Files and directories to be avoided on a command-by-command basis, both at
+# the top level and in subdirectories.
+
+FIND_OBJS_TO_IGNORE := \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git -o -name lost+found \) -prune -o
+
+export TAR_OBJS_TO_IGNORE := --exclude SCCS --exclude BitKeeper --exclude .svn --exclude CVS --exclude .pc --exclude .hg --exclude .git --exclude lost+found

 # ===========================================================================
 # Rules shared between *config targets and build targets
@@ -1123,7 +1134,7 @@ $(clean-dirs):
 clean: archclean $(clean-dirs)
 	$(call cmd,rmdirs)
 	$(call cmd,rmfiles)
-	@find . $(RCS_FIND_IGNORE) \
+	@find . $(FIND_OBJS_TO_IGNORE) \
 		\( -name '*.[oas]' -o -name '*.ko' -o -name '.*.cmd' \
 		-o -name '.*.d' -o -name '.*.tmp' -o -name '*.mod.c' \
 		-o -name '*.symtypes' -o -name 'modules.order' \) \
@@ -1148,7 +1159,7 @@ mrproper: clean archmrproper $(mrproper-dirs)
 PHONY += distclean

 distclean: mrproper
-	@find $(srctree) $(RCS_FIND_IGNORE) \
+	@find $(srctree) $(FIND_OBJS_TO_IGNORE) \
 		\( -name '*.orig' -o -name '*.rej' -o -name '*~' \
 		-o -name '*.bak' -o -name '#*#' -o -name '.*.orig' \
 		-o -name '.*.rej' -o -size 0 \
@@ -1307,7 +1318,7 @@ clean: rm-files := $(KBUILD_EXTMOD)/Module.symvers
 clean: $(clean-dirs)
 	$(call cmd,rmdirs)
 	$(call cmd,rmfiles)
-	@find $(KBUILD_EXTMOD) $(RCS_FIND_IGNORE) \
+	@find $(KBUILD_EXTMOD) $(FIND_OBJS_TO_IGNORE) \
 		\( -name '*.[oas]' -o -name '*.ko' -o -name '.*.cmd' \
 		-o -name '.*.d' -o -name '.*.tmp' -o -name '*.mod.c' \) \
 		-type f -print | xargs rm -f
@@ -1355,21 +1366,21 @@ ALLSOURCE_ARCHS := $(SRCARCH)

 define find-sources
         ( for arch in $(ALLSOURCE_ARCHS) ; do \
-	       find $(__srctree)arch/$${arch} $(RCS_FIND_IGNORE) \
+	       find $(__srctree)arch/$${arch} $(FIND_OBJS_TO_IGNORE) \
 	            -name $1 -print; \
 	  done ; \
-	  find $(__srctree)security/selinux/include $(RCS_FIND_IGNORE) \
+	  find $(__srctree)security/selinux/include $(FIND_OBJS_TO_IGNORE) \
 	       -name $1 -print; \
-	  find $(__srctree)include $(RCS_FIND_IGNORE) \
+	  find $(__srctree)include $(FIND_OBJS_TO_IGNORE) \
 	       \( -name config -o -name 'asm-*' \) -prune \
 	       -o -name $1 -print; \
 	  for arch in $(ALLINCLUDE_ARCHS) ; do \
-	       find $(__srctree)include/asm-$${arch} $(RCS_FIND_IGNORE) \
+	       find $(__srctree)include/asm-$${arch} $(FIND_OBJS_TO_IGNORE) \
 	            -name $1 -print; \
 	  done ; \
-	  find $(__srctree)include/asm-generic $(RCS_FIND_IGNORE) \
+	  find $(__srctree)include/asm-generic $(FIND_OBJS_TO_IGNORE) \
 	       -name $1 -print; \
-	  find $(__srctree) $(RCS_FIND_IGNORE) \
+	  find $(__srctree) $(FIND_OBJS_TO_IGNORE) \
 	       \( -name include -o -name arch -o -name '.tmp_*' \) -prune -o \
 	       -name $1 -print; \
 	  )
@@ -1445,12 +1456,12 @@ tags: FORCE
 # ---------------------------------------------------------------------------

 includecheck:
-	find * $(RCS_FIND_IGNORE) \
+	find * $(FIND_OBJS_TO_IGNORE) \
 		-name '*.[hcS]' -type f -print | sort \
 		| xargs $(PERL) -w $(srctree)/scripts/checkincludes.pl

 versioncheck:
-	find * $(RCS_FIND_IGNORE) \
+	find * $(FIND_OBJS_TO_IGNORE) \
 		-name '*.[hcS]' -type f -print | sort \
 		| xargs $(PERL) -w $(srctree)/scripts/checkversion.pl

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 5e32607..be0c5cf 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -39,7 +39,7 @@ $(objtree)/kernel.spec: $(MKSPEC) $(srctree)/Makefile
 rpm-pkg rpm: $(objtree)/kernel.spec FORCE
 	$(MAKE) clean
 	$(PREV) ln -sf $(srctree) $(KERNELPATH)
-	$(PREV) tar -cz $(RCS_TAR_IGNORE) -f $(KERNELPATH).tar.gz $(KERNELPATH)/.
+	$(PREV) tar -cz $(TAR_OBJS_TO_IGNORE) -f $(KERNELPATH).tar.gz $(KERNELPATH)/.
 	$(PREV) rm $(KERNELPATH)

 	set -e; \

========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================
