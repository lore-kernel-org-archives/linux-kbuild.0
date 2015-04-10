Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-la0-f47.google.com ([209.85.215.47]:34718 "EHLO
	mail-la0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932434AbbDJNPc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 10 Apr 2015 09:15:32 -0400
Received: by laat2 with SMTP id t2so12989506laa.1
        for <linux-kbuild@vger.kernel.org>; Fri, 10 Apr 2015 06:15:30 -0700 (PDT)
From: riku.voipio@linaro.org
Subject: [PATCH 2/2] deb-pkg: add source package
Date: Fri, 10 Apr 2015 16:15:14 +0300
Message-Id: <34017611f8a0056a09d2c38412efd7828efe00fe.1428671643.git.riku.voipio@linaro.org>
In-Reply-To: <cf573e24baadc04da27c471dafee90344e0cb400.1428671643.git.riku.voipio@linaro.org>
References: <cf573e24baadc04da27c471dafee90344e0cb400.1428671643.git.riku.voipio@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, mmarek@suse.cz, debian-kernel@lists.debian.org
Cc: Riku Voipio <riku.voipio@linaro.org>

From: Riku Voipio <riku.voipio@linaro.org>

By passing BUILD_SOURCE=y variable, make deb-pkg builds a debian source
package. It will generate a minimal debian/rules file that calls back
to make deb-pkg. Generated source package will build the same kernel
.config than what was available for make deb-pkg.

The source package is useful for gpl compliance, or for feeding to a
automated debian package builder.

Patch depends on the "deb-pkg: move setting debarch for a separate function"
for correct changelog filenames.

Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
 scripts/package/builddeb | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index e397815..3d77fd3 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -272,12 +272,23 @@ On Debian GNU/Linux systems, the complete text of the GNU General Public
 License version 2 can be found in \`/usr/share/common-licenses/GPL-2'.
 EOF
 
+
+build_depends="bc, "
+if [ -n "$BUILD_TOOLS" ]
+then
+	build_depends="$build_depends python-dev, libperl-dev, bison, flex, \
+libaudit-dev, libdw-dev, libelf-dev, libiberty-dev, libnewt-dev, autoconf, \
+automake, libtool, libglib2.0-dev, libudev-dev, libwrap0-dev, libiberty-dev, \
+libunwind8-dev [amd64 arm64 i386], libnuma-dev [amd64 arm64 i386 powerpc ppc64 ppc64el] "
+fi
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
@@ -425,4 +436,35 @@ EOF
 	create_package "$tools_packagename" "$tools_dir"
 fi
 
+if [ -n "$BUILD_SOURCE" ]
+then
+    cat <<EOF > debian/rules
+#!/usr/bin/make -f
+
+build:
+	cp debian/config .config
+	\$(MAKE) oldconfig
+
+binary-arch:
+	\$(MAKE) KDEB_PKGVERSION=${packageversion} BUILD_TOOLS=$BUILD_TOOLS deb-pkg
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
+
+
 exit 0
-- 
2.1.4

