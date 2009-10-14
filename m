Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yx0-f188.google.com ([209.85.210.188]:39341 "EHLO
	mail-yx0-f188.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753200AbZJNGq2 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 14 Oct 2009 02:46:28 -0400
Received: by yxe26 with SMTP id 26so5099407yxe.4
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Oct 2009 23:45:52 -0700 (PDT)
Date: Wed, 14 Oct 2009 01:54:25 -0500
From: Jonathan Nieder <jrnieder@gmail.com>
Subject: [PATCH resend 1/2] scripts/package: add ROOTCMD variable
Message-ID: <20091014065425.GA8771@progeny.tock>
References: <20091014064622.GA8711@progeny.tock>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20091014064622.GA8711@progeny.tock>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, maximilian attems <max@stro.at>, Frans Pop <elendil@planet.nl>

Allow "make foo-pkg" to acquire root or fake root privileges before
running commands that need it.  This is especially important for
tar-pkg, since otherwise if a user forgets to run make as root, the
installed kernel will have that user as owner and can easily be
overwritten by a broken program running as that user later.

The new ROOTCMD variable, if defined, is used as a command to run
other commands with possibly fake elevated privileges.  If it is not
defined, the behavior is as before, and hopefully make is running as
root already.

In other words, as a shortcut, instead of running

$ make oldconfig &&
> make &&
> fakeroot -u make rpm-pkg

now one can use a single command:

$ make oldconfig rpm-pkg ROOTCMD="fakeroot -u"

Idea from Ryan Anderson
<http://thread.gmane.org/gmane.comp.version-control.git/14770/focus=14802>.

Signed-off-by: Jonathan Nieder <jrnieder@gmail.com>
---
Changes from v1: rebased on top of current torvalds/master.

 scripts/package/Makefile |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index f67cc88..14b65a8 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -53,7 +53,8 @@ rpm-pkg rpm: $(objtree)/kernel.spec FORCE
 	set -e; \
 	mv -f $(objtree)/.tmp_version $(objtree)/.version
 
-	$(RPM) $(RPMOPTS) --target $(UTS_MACHINE) -ta ../$(KERNELPATH).tar.gz
+	$(ROOTCMD) $(RPM) $(RPMOPTS) --target $(UTS_MACHINE) \
+		-ta ../$(KERNELPATH).tar.gz
 	rm ../$(KERNELPATH).tar.gz
 
 clean-files := $(objtree)/kernel.spec
@@ -70,8 +71,8 @@ binrpm-pkg: $(objtree)/binkernel.spec FORCE
 	set -e; \
 	mv -f $(objtree)/.tmp_version $(objtree)/.version
 
-	$(RPM) $(RPMOPTS) --define "_builddir $(objtree)" --target \
-		$(UTS_MACHINE) -bb $<
+	$(ROOTCMD) $(RPM) $(RPMOPTS) --define "_builddir $(objtree)" \
+		--target $(UTS_MACHINE) -bb $<
 
 clean-files += $(objtree)/binkernel.spec
 
@@ -79,7 +80,7 @@ clean-files += $(objtree)/binkernel.spec
 # ---------------------------------------------------------------------------
 deb-pkg: FORCE
 	$(MAKE) KBUILD_SRC=
-	$(CONFIG_SHELL) $(srctree)/scripts/package/builddeb
+	$(ROOTCMD) $(CONFIG_SHELL) $(srctree)/scripts/package/builddeb
 
 clean-dirs += $(objtree)/debian/
 
@@ -88,7 +89,7 @@ clean-dirs += $(objtree)/debian/
 # ---------------------------------------------------------------------------
 tar%pkg: FORCE
 	$(MAKE) KBUILD_SRC=
-	$(CONFIG_SHELL) $(srctree)/scripts/package/buildtar $@
+	$(ROOTCMD) $(CONFIG_SHELL) $(srctree)/scripts/package/buildtar $@
 
 clean-dirs += $(objtree)/tar-install/
 
@@ -96,10 +97,10 @@ clean-dirs += $(objtree)/tar-install/
 # Help text displayed when executing 'make help'
 # ---------------------------------------------------------------------------
 help: FORCE
+	@echo ' Set ROOTCMD={sudo|fakeroot -u|super|...} and make as non-root:'
 	@echo '  rpm-pkg         - Build both source and binary RPM kernel packages'
 	@echo '  binrpm-pkg      - Build only the binary kernel package'
 	@echo '  deb-pkg         - Build the kernel as an deb package'
 	@echo '  tar-pkg         - Build the kernel as an uncompressed tarball'
 	@echo '  targz-pkg       - Build the kernel as a gzip compressed tarball'
 	@echo '  tarbz2-pkg      - Build the kernel as a bzip2 compressed tarball'
-
-- 
1.6.5.rc1.199.g596ec

