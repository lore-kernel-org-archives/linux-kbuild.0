Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-la0-f43.google.com ([209.85.215.43]:34846 "EHLO
	mail-la0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752064AbbFKILn (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 11 Jun 2015 04:11:43 -0400
Received: by labko7 with SMTP id ko7so46835689lab.2
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Jun 2015 01:11:41 -0700 (PDT)
From: riku.voipio@linaro.org
Subject: [PATCH v3] deb-pkg: add source package
Date: Thu, 11 Jun 2015 11:11:38 +0300
Message-Id: <1434010298-21445-1-git-send-email-riku.voipio@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, mmarek@suse.cz, debian-kernel@lists.debian.org
Cc: Riku Voipio <riku.voipio@linaro.org>, Chris J Arges <chris.j.arges@canonical.com>, maximilian attems <maks@stro.at>, Ben Hutchings <ben@decadent.org.uk>

From: Riku Voipio <riku.voipio@linaro.org>

Make deb-pkg build both source and binary package like make rpm-pkg does.
For people who only need binary kernel package, there is now bindeb-pkg
target, same target also used to build the .deb files if built from the
source package using dpkg-buildpackage.

Generated source package will build the same kernel .config than what
was available for make deb-pkg. The name of the source package can
be set with KDEB_SOURCENAME enviroment variable.

The source package is useful for gpl compliance, or for feeding to a
automated debian package builder.

Cc: Chris J Arges <chris.j.arges@canonical.com>
Cc: maximilian attems <maks@stro.at>
Cc: Ben Hutchings <ben@decadent.org.uk>
Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
v3,
 * Allow setting source package name with KDEB_SOURCENAME
 * Fix issues noted by Ben: drop python and fix target in debian/rules
 * Merge "ensure $MAKE can use jobserver" oneliner from Chris J Arges

v2, address Maximilians comments
 * Isolate from my other patches, so it can be merged easier
 * Separate bindeb-pkg target for building just binary debs
 * Build source package in deb-pkg target to match rpm-pkg target
 scripts/package/Makefile | 13 +++++++++----
 scripts/package/builddeb | 43 +++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 50 insertions(+), 6 deletions(-)

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 99ca6e7..f97857c 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -84,11 +84,15 @@ quiet_cmd_builddeb = BUILDDEB
 	} && \
 	\
 	$$KBUILD_PKG_ROOTCMD $(CONFIG_SHELL) \
-		$(srctree)/scripts/package/builddeb
+		$(srctree)/scripts/package/builddeb $@
 
 deb-pkg: FORCE
 	$(MAKE) KBUILD_SRC=
-	$(call cmd,builddeb)
+	+$(call cmd,builddeb)
+
+bindeb-pkg: FORCE
+	$(MAKE) KBUILD_SRC=
+	+$(call cmd,builddeb)
 
 clean-dirs += $(objtree)/debian/
 
@@ -133,8 +137,9 @@ perf-%pkg: FORCE
 # ---------------------------------------------------------------------------
 help: FORCE
 	@echo '  rpm-pkg             - Build both source and binary RPM kernel packages'
-	@echo '  binrpm-pkg          - Build only the binary kernel package'
-	@echo '  deb-pkg             - Build the kernel as a deb package'
+	@echo '  binrpm-pkg          - Build only the binary kernel RPM package'
+	@echo '  deb-pkg             - Build both source and binary deb kernel packages'
+	@echo '  bindeb-pkg          - Build only the binary kernel deb package'
 	@echo '  tar-pkg             - Build the kernel as an uncompressed tarball'
 	@echo '  targz-pkg           - Build the kernel as a gzip compressed tarball'
 	@echo '  tarbz2-pkg          - Build the kernel as a bzip2 compressed tarball'
diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 0ccd7ee..079a84b 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -79,6 +79,12 @@ if [ -n "$KDEB_PKGVERSION" ]; then
 else
 	packageversion=$version-$revision
 fi
+if [ -n "$KDEB_SOURCENAME" ]; then
+	sourcename=$KDEB_SOURCENAME
+else
+	sourcename=linux-upstream
+fi
+tmpdir="$objtree/debian/tmp"
 tmpdir="$objtree/debian/tmp"
 fwdir="$objtree/debian/fwtmp"
 kernel_headers_dir="$objtree/debian/hdrtmp"
@@ -238,7 +244,7 @@ fi
 
 # Generate a simple changelog template
 cat <<EOF > debian/changelog
-linux-upstream ($packageversion) $distribution; urgency=low
+$sourcename ($packageversion) $distribution; urgency=low
 
   * Custom built Linux kernel.
 
@@ -265,12 +271,16 @@ On Debian GNU/Linux systems, the complete text of the GNU General Public
 License version 2 can be found in \`/usr/share/common-licenses/GPL-2'.
 EOF
 
+
+build_depends="bc, kmod, cpio "
+
 # Generate a control file
 cat <<EOF > debian/control
-Source: linux-upstream
+Source: $sourcename
 Section: kernel
 Priority: optional
 Maintainer: $maintainer
+Build-Depends: $build_depends
 Standards-Version: 3.8.4
 Homepage: http://www.kernel.org/
 EOF
@@ -391,4 +401,33 @@ EOF
 	create_package "$dbg_packagename" "$dbg_dir"
 fi
 
+if [ "x$1" = "xdeb-pkg" ]
+then
+    cat <<EOF > debian/rules
+#!/usr/bin/make -f
+
+build:
+	cp debian/config .config
+	\$(MAKE) oldconfig
+
+binary-arch:
+	\$(MAKE) KDEB_SOURCENAME=${sourcename} KDEB_PKGVERSION=${packageversion} bindeb-pkg
+
+clean:
+	\$(MAKE) clean
+
+binary: binary-arch
+EOF
+
+	(cd $KBUILD_SRC; git archive --prefix=${sourcename}-${version}/ HEAD)|gzip -9 > ../${sourcename}_${version}.orig.tar.gz
+	cp $KCONFIG_CONFIG debian/config
+	tar caf ../${sourcename}_${packageversion}.debian.tar.gz debian/{config,copyright,rules,changelog,control}
+	dpkg-source -cdebian/control -ldebian/changelog --format="3.0 (custom)" --target-format="3.0 (quilt)" \
+		-b / ../${sourcename}_${version}.orig.tar.gz  ../${sourcename}_${packageversion}.debian.tar.gz
+	mv ${sourcename}_${packageversion}*dsc ..
+	dpkg-genchanges > ../${sourcename}_${packageversion}_${debarch}.changes
+else
+	dpkg-genchanges -b > ../${sourcename}_${packageversion}_${debarch}.changes
+fi
+
 exit 0
-- 
2.1.4

