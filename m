Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.152]:57074 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758080AbZJON2l (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 15 Oct 2009 09:28:41 -0400
Received: by fg-out-1718.google.com with SMTP id 16so485863fgg.1
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Oct 2009 06:26:53 -0700 (PDT)
Date: Thu, 15 Oct 2009 08:35:32 -0500
From: Jonathan Nieder <jrnieder@gmail.com>
Subject: [PATCH v2 1/2] scripts/package: add KBUILD_PKG_ROOTCMD variable
Message-ID: <20091015133532.GB6718@progeny.tock>
References: <20091014064622.GA8711@progeny.tock>
 <20091014071627.GA6256@merkur.ravnborg.org>
 <200910141159.03799.elendil@planet.nl>
 <20091014110331.GZ28231@baikonur.stro.at>
 <20091015133139.GA6718@progeny.tock>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20091015133139.GA6718@progeny.tock>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: maximilian attems <max@stro.at>, Sam Ravnborg <sam@ravnborg.org>, Frans Pop <elendil@planet.nl>

Allow "make foo-pkg" to acquire root or fake root privileges before
running commands that need them.  This is especially important for
tar-pkg, since if buildtar is run as an unprivileged user, the
installed kernel will have that user as owner and can easily be
overwritten by a broken program running as that user later.

The new KBUILD_PKG_ROOTCMD variable, if defined, is used as a command
to run other commands with possibly fake elevated privileges.  Its use
is restricted to *pkg targets, hence the name.  If it is not defined,
the behavior is as before, and hopefully make is running as root
already.

In other words, as a shortcut, instead of running

	make oldconfig &&
	make &&
	fakeroot -u make rpm-pkg

now one can use a single command:

	make oldconfig rpm-pkg KBUILD_PKG_ROOTCMD="fakeroot -u"

Idea from Ryan Anderson
<http://thread.gmane.org/gmane.comp.version-control.git/14770/focus=14802>.

Signed-off-by: Jonathan Nieder <jrnieder@gmail.com>
---
Changes from v1:
 - use KBUILD_PKG_ROOTCMD instead of ROOTCMD
 - shorten advice in "make help" so it still fits on one terminal line

 scripts/package/Makefile |   16 ++++++++++------
 1 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index f67cc88..6997f38 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -53,7 +53,8 @@ rpm-pkg rpm: $(objtree)/kernel.spec FORCE
 	set -e; \
 	mv -f $(objtree)/.tmp_version $(objtree)/.version
 
-	$(RPM) $(RPMOPTS) --target $(UTS_MACHINE) -ta ../$(KERNELPATH).tar.gz
+	$(KBUILD_PKG_ROOTCMD) $(RPM) $(RPMOPTS) --target $(UTS_MACHINE) \
+		-ta ../$(KERNELPATH).tar.gz
 	rm ../$(KERNELPATH).tar.gz
 
 clean-files := $(objtree)/kernel.spec
@@ -70,8 +71,9 @@ binrpm-pkg: $(objtree)/binkernel.spec FORCE
 	set -e; \
 	mv -f $(objtree)/.tmp_version $(objtree)/.version
 
-	$(RPM) $(RPMOPTS) --define "_builddir $(objtree)" --target \
-		$(UTS_MACHINE) -bb $<
+	$(KBUILD_PKG_ROOTCMD) $(RPM) $(RPMOPTS) \
+		--define "_builddir $(objtree)" \
+		--target $(UTS_MACHINE) -bb $<
 
 clean-files += $(objtree)/binkernel.spec
 
@@ -79,7 +81,8 @@ clean-files += $(objtree)/binkernel.spec
 # ---------------------------------------------------------------------------
 deb-pkg: FORCE
 	$(MAKE) KBUILD_SRC=
-	$(CONFIG_SHELL) $(srctree)/scripts/package/builddeb
+	$(KBUILD_PKG_ROOTCMD) $(CONFIG_SHELL) \
+		$(srctree)/scripts/package/builddeb
 
 clean-dirs += $(objtree)/debian/
 
@@ -88,7 +91,8 @@ clean-dirs += $(objtree)/debian/
 # ---------------------------------------------------------------------------
 tar%pkg: FORCE
 	$(MAKE) KBUILD_SRC=
-	$(CONFIG_SHELL) $(srctree)/scripts/package/buildtar $@
+	$(KBUILD_PKG_ROOTCMD) $(CONFIG_SHELL) \
+		$(srctree)/scripts/package/buildtar $@
 
 clean-dirs += $(objtree)/tar-install/
 
@@ -96,10 +100,10 @@ clean-dirs += $(objtree)/tar-install/
 # Help text displayed when executing 'make help'
 # ---------------------------------------------------------------------------
 help: FORCE
+	@echo ' Set KBUILD_PKG_ROOTCMD={sudo|fakeroot -u|...} and make as non-root:'
 	@echo '  rpm-pkg         - Build both source and binary RPM kernel packages'
 	@echo '  binrpm-pkg      - Build only the binary kernel package'
 	@echo '  deb-pkg         - Build the kernel as an deb package'
 	@echo '  tar-pkg         - Build the kernel as an uncompressed tarball'
 	@echo '  targz-pkg       - Build the kernel as a gzip compressed tarball'
 	@echo '  tarbz2-pkg      - Build the kernel as a bzip2 compressed tarball'
-
-- 
1.6.5.rc1.199.g596ec

