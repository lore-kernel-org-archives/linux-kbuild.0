Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:35009 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752162AbbIANtA (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 1 Sep 2015 09:49:00 -0400
Received: by lbcbn3 with SMTP id bn3so79041220lbc.2
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Sep 2015 06:48:58 -0700 (PDT)
From: riku.voipio@linaro.org
Subject: [PATCH v4] deb-pkg: add source package
Date: Tue,  1 Sep 2015 16:48:55 +0300
Message-Id: <1441115335-25165-2-git-send-email-riku.voipio@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, mmarek@suse.cz
Cc: Riku Voipio <riku.voipio@linaro.org>, Chris J Arges <chris.j.arges@canonical.com>, maximilian attems <maks@stro.at>, Ben Hutchings <ben@decadent.org.uk>

From: Riku Voipio <riku.voipio@linaro.org>

Make deb-pkg build both source and binary package like make rpm-pkg does.
For people who only need binary kernel package, there is now bindeb-pkg
target, same target also used to build the .deb files if built from the
source package using dpkg-buildpackage.

Generated source package will build the same kernel .config than what
was available for make deb-pkg. The name of the source package can
be set with SOURCENAME enviroment variable.

The source package is useful for GPL compliance, or for feeding to a
automated debian package builder.

Cc: Chris J Arges <chris.j.arges@canonical.com>
Cc: maximilian attems <maks@stro.at>
Cc: Ben Hutchings <ben@decadent.org.uk>
Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
v4 address Bens commends,
- use src_tar function instead of git archive for kernel sources
- move KDEB_SOURCENAME setting to Makefile so it can be passed to
  src_tar
- use a toplevel .config file instead of a copy in debian/control
- defend against delete of debian/ in clean target

v3,
- Allow setting source package name with KDEB_SOURCENAME
- Fix issues noted by Ben: drop python and fix target in debian/rules
- Merge "ensure $MAKE can use jobserver" oneliner from Chris J Arges

v2, address Maximilians comments
- Isolate from my other patches, so it can be merged easier
- Separate bindeb-pkg target for building just binary debs
- Build source package in deb-pkg target to match rpm-pkg target

 scripts/package/Makefile | 17 +++++++++++++----
 scripts/package/builddeb | 37 +++++++++++++++++++++++++++++++++++--
 2 files changed, 48 insertions(+), 6 deletions(-)

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 65cf12d..562aa15 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -23,6 +23,8 @@
 
 # Remove hyphens since they have special meaning in RPM filenames
 KERNELPATH := kernel-$(subst -,_,$(KERNELRELEASE))
+KDEB_SOURCENAME ?= linux-$(KERNELRELEASE)
+export KDEB_SOURCENAME
 # Include only those top-level files that are needed by make, plus the GPL copy
 TAR_CONTENT := $(KBUILD_ALLDIRS) .config .scmversion Makefile \
                Kbuild Kconfig COPYING $(wildcard localversion*)
@@ -82,11 +84,17 @@ quiet_cmd_builddeb = BUILDDEB
 	} && \
 	\
 	$$KBUILD_PKG_ROOTCMD $(CONFIG_SHELL) \
-		$(srctree)/scripts/package/builddeb
+		$(srctree)/scripts/package/builddeb $@
 
 deb-pkg: FORCE
+	$(MAKE) clean
+	$(call cmd,src_tar,$(KDEB_SOURCENAME))
+	$(MAKE) KBUILD_SRC=
+	+$(call cmd,builddeb)
+
+bindeb-pkg: FORCE
 	$(MAKE) KBUILD_SRC=
-	$(call cmd,builddeb)
+	+$(call cmd,builddeb)
 
 clean-dirs += $(objtree)/debian/
 
@@ -131,8 +139,9 @@ perf-%pkg: FORCE
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
index 0c18cfd..6231cbef 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -79,6 +79,7 @@ if [ -n "$KDEB_PKGVERSION" ]; then
 else
 	packageversion=$version-$revision
 fi
+sourcename=$KDEB_SOURCENAME
 tmpdir="$objtree/debian/tmp"
 fwdir="$objtree/debian/fwtmp"
 kernel_headers_dir="$objtree/debian/hdrtmp"
@@ -238,7 +239,7 @@ fi
 
 # Generate a simple changelog template
 cat <<EOF > debian/changelog
-linux-upstream ($packageversion) $distribution; urgency=low
+$sourcename ($packageversion) $distribution; urgency=low
 
   * Custom built Linux kernel.
 
@@ -265,12 +266,16 @@ On Debian GNU/Linux systems, the complete text of the GNU General Public
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
@@ -391,4 +396,32 @@ EOF
 	create_package "$dbg_packagename" "$dbg_dir"
 fi
 
+if [ "x$1" = "xdeb-pkg" ]
+then
+    cat <<EOF > debian/rules
+#!/usr/bin/make -f
+
+build:
+	\$(MAKE) sourcename=${sourcename} KDEB_PKGVERSION=${packageversion}
+
+binary-arch:
+	\$(MAKE) sourcename=${sourcename} KDEB_PKGVERSION=${packageversion} bindeb-pkg
+
+clean:
+	mv debian/ debian.backup # debian/ might be cleaned away
+	\$(MAKE) clean
+	mv debian.backup debian
+
+binary: binary-arch
+EOF
+	mv ${sourcename}.tar.gz ../${sourcename}_${version}.orig.tar.gz
+	tar caf ../${sourcename}_${packageversion}.debian.tar.gz debian/{copyright,rules,changelog,control}
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
2.4.6

