Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw0-f174.google.com ([209.85.211.174]:45951 "EHLO
	mail-yw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752707AbZIYXLq (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 25 Sep 2009 19:11:46 -0400
Received: by ywh4 with SMTP id 4so3292169ywh.33
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Sep 2009 16:11:49 -0700 (PDT)
Date: Fri, 25 Sep 2009 18:11:56 -0500
From: Jonathan Nieder <jrnieder@gmail.com>
Subject: [PATCH 1/2] kbuild: scripts/package: use $(ROOTCMD) to become root
Message-ID: <20090925231156.GA28714@progeny.tock>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Ryan Anderson <ryan@michonline.com>

Use the value of the ROOTCMD variable as a command to acquire
root or fake root privileges for "make tar-pkg" et al.

So now you can do

$ make oldconfig rpm-pkg ROOTCMD="fakeroot -u"

as a shortcut for

$ make oldconfig &&
> make &&
> fakeroot -u make rpm-pkg

In the future, ROOTCMD="fakeroot -u" could be set automatically
when not running as root and fakeroot is found on the path, so that
"make oldconfig deb-pkg" would just work without fuss.

Idea from Ryan Anderson
<http://thread.gmane.org/gmane.comp.version-control.git/14770/focus=14802>.

Signed-off-by: Jonathan Nieder <jrnieder@gmail.com>
---
Thoughts?

Thanks,
Jonathan

 scripts/package/Makefile |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index fa4a0a1..a5d9088 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -44,7 +44,8 @@ rpm-pkg rpm: $(objtree)/kernel.spec FORCE
 	set -e; \
 	mv -f $(objtree)/.tmp_version $(objtree)/.version
 
-	$(RPM) $(RPMOPTS) --target $(UTS_MACHINE) -ta ../$(KERNELPATH).tar.gz
+	$(ROOTCMD) $(RPM) $(RPMOPTS) --target $(UTS_MACHINE) \
+		-ta ../$(KERNELPATH).tar.gz
 	rm ../$(KERNELPATH).tar.gz
 
 clean-files := $(objtree)/kernel.spec
@@ -61,8 +62,8 @@ binrpm-pkg: $(objtree)/binkernel.spec FORCE
 	set -e; \
 	mv -f $(objtree)/.tmp_version $(objtree)/.version
 
-	$(RPM) $(RPMOPTS) --define "_builddir $(srctree)" --target \
-		$(UTS_MACHINE) -bb $<
+	$(ROOTCMD) $(RPM) $(RPMOPTS) --define "_builddir $(srctree)" \
+		--target $(UTS_MACHINE) -bb $<
 
 clean-files += $(objtree)/binkernel.spec
 
@@ -70,7 +71,7 @@ clean-files += $(objtree)/binkernel.spec
 # ---------------------------------------------------------------------------
 deb-pkg: FORCE
 	$(MAKE) KBUILD_SRC=
-	$(CONFIG_SHELL) $(srctree)/scripts/package/builddeb
+	$(ROOTCMD) $(CONFIG_SHELL) $(srctree)/scripts/package/builddeb
 
 clean-dirs += $(objtree)/debian/
 
@@ -79,7 +80,7 @@ clean-dirs += $(objtree)/debian/
 # ---------------------------------------------------------------------------
 tar%pkg: FORCE
 	$(MAKE) KBUILD_SRC=
-	$(CONFIG_SHELL) $(srctree)/scripts/package/buildtar $@
+	$(ROOTCMD) $(CONFIG_SHELL) $(srctree)/scripts/package/buildtar $@
 
 clean-dirs += $(objtree)/tar-install/
 
@@ -87,10 +88,10 @@ clean-dirs += $(objtree)/tar-install/
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

