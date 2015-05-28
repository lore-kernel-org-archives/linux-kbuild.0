Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-la0-f49.google.com ([209.85.215.49]:35989 "EHLO
	mail-la0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753647AbbE1JLY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 May 2015 05:11:24 -0400
Received: by lagv1 with SMTP id v1so26640158lag.3
        for <linux-kbuild@vger.kernel.org>; Thu, 28 May 2015 02:11:21 -0700 (PDT)
From: riku.voipio@linaro.org
Subject: [PATCH 2/2] deb-pkg: add source package
Date: Thu, 28 May 2015 12:11:15 +0300
Message-Id: <1432804275-13187-3-git-send-email-riku.voipio@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, mmarek@suse.cz, debian-kernel@lists.debian.org
Cc: Riku Voipio <riku.voipio@linaro.org>, maximilian attems <maks@stro.at>

From: Riku Voipio <riku.voipio@linaro.org>

By passing BUILD_SOURCE=y variable, make deb-pkg builds a debian source
package. It will generate a minimal debian/rules file that calls back
to make deb-pkg. Generated source package will build the same kernel
.config than what was available for make deb-pkg.

The source package is useful for gpl compliance, or for feeding to a
automated debian package builder.

v2, address Maximilians comments

- Isolate from my other patches, so it can be merged easier
- Separate bindeb-pkg target for building just binary debs
- Build source package in deb-pkg target to match rpm-pkg target

Cc: maximilian attems <maks@stro.at>
Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
 scripts/package/Makefile | 11 ++++++++---
 scripts/package/builddeb | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 99ca6e7..7ec4dcc 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -84,12 +84,16 @@ quiet_cmd_builddeb = BUILDDEB
 	} && \
 	\
 	$$KBUILD_PKG_ROOTCMD $(CONFIG_SHELL) \
-		$(srctree)/scripts/package/builddeb
+		$(srctree)/scripts/package/builddeb $@
 
 deb-pkg: FORCE
 	$(MAKE) KBUILD_SRC=
 	$(call cmd,builddeb)
 
+bindeb-pkg: FORCE
+	$(MAKE) KBUILD_SRC=
+	$(call cmd,builddeb)
+
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
index 0ccd7ee..1872d03 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -265,12 +265,16 @@ On Debian GNU/Linux systems, the complete text of the GNU General Public
 License version 2 can be found in \`/usr/share/common-licenses/GPL-2'.
 EOF
 
+
+build_depends="bc, kmod, cpio, python "
+
 # Generate a control file
 cat <<EOF > debian/control
 Source: linux-upstream
 Section: kernel
 Priority: optional
 Maintainer: $maintainer
+Build-Depends: $build_depends
 Standards-Version: 3.8.4
 Homepage: http://www.kernel.org/
 EOF
@@ -391,4 +395,33 @@ EOF
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
+	\$(MAKE) KDEB_PKGVERSION=${packageversion} deb-pkg
+
+clean:
+	\$(MAKE) clean
+
+binary: binary-arch
+EOF
+
+	(cd $KBUILD_SRC; git archive --prefix=linux-upstream-${version}/ HEAD)|gzip -9 > ../linux-upstream_${version}.orig.tar.gz
+	cp $KCONFIG_CONFIG debian/config
+	tar caf ../linux-upstream_${packageversion}.debian.tar.gz debian/{config,copyright,rules,changelog,control}
+	dpkg-source -cdebian/control -ldebian/changelog --format="3.0 (custom)" --target-format="3.0 (quilt)" \
+		-b / ../linux-upstream_${version}.orig.tar.gz  ../linux-upstream_${packageversion}.debian.tar.gz
+	mv linux-upstream_${packageversion}*dsc ..
+	dpkg-genchanges > ../linux-upstream_${packageversion}_${debarch}.changes
+else
+	dpkg-genchanges -b > ../linux-upstream_${packageversion}_${debarch}.changes
+fi
+
 exit 0
-- 
2.1.4

