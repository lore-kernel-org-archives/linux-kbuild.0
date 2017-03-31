Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:32939 "EHLO
        mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933447AbdCaNJv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 31 Mar 2017 09:09:51 -0400
Received: by mail-lf0-f49.google.com with SMTP id h125so43511604lfe.0
        for <linux-kbuild@vger.kernel.org>; Fri, 31 Mar 2017 06:09:50 -0700 (PDT)
From: riku.voipio@linaro.org
Subject: [PATCH 3/3] builddeb: add make fastdeb-pkg target
Date: Fri, 31 Mar 2017 16:09:41 +0300
Message-Id: <20170331130941.5250-4-riku.voipio@linaro.org>
In-Reply-To: <20170331130941.5250-1-riku.voipio@linaro.org>
References: <20170331130941.5250-1-riku.voipio@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, mmarek@suse.com
Cc: yamada.masahiro@socionext.com, debian-kernel@lists.debian.org, Riku Voipio <riku.voipio@linaro.org>, Andrew Donnellan <andrew.donnellan@au1.ibm.com>

From: Riku Voipio <riku.voipio@linaro.org>

Currently, the deb-pkg and bindeb-pkg targets create multiple packages
for the kernel binaries, headers, userspace headers and firmware.

For developers who generate Debian packages as part of their development
workflows, it's often not necessary to generate all these packages.

Introduce new target, fastdeb-pkg, which only generates kernel packages.
Re-order package build order so that kernel binary package is created
first and we can exit cleanly unless generating rest packages with the
old bindeb-pkg and deb-pkg targets.

Cc: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Tested-By: Jim Davis <jim.epost@gmail.com>
Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
 scripts/package/Makefile |  7 ++++++-
 scripts/package/builddeb | 49 +++++++++++++++++++++++++-----------------------
 2 files changed, 32 insertions(+), 24 deletions(-)

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 71b4a8af9d4d..fc86cc3ae222 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -97,6 +97,10 @@ bindeb-pkg: FORCE
 	$(MAKE) KBUILD_SRC=
 	+$(call cmd,builddeb)
 
+fastdeb-pkg: FORCE
+	$(MAKE) KBUILD_SRC=
+	+$(call cmd,builddeb)
+
 clean-dirs += $(objtree)/debian/
 
 
@@ -142,7 +146,8 @@ help: FORCE
 	@echo '  rpm-pkg             - Build both source and binary RPM kernel packages'
 	@echo '  binrpm-pkg          - Build only the binary kernel RPM package'
 	@echo '  deb-pkg             - Build both source and binary deb kernel packages'
-	@echo '  bindeb-pkg          - Build only the binary kernel deb package'
+	@echo '  bindeb-pkg          - Build all binary kernel deb packages'
+	@echo '  fastdeb-pkg         - Build only the binary kernel image deb package'
 	@echo '  tar-pkg             - Build the kernel as an uncompressed tarball'
 	@echo '  targz-pkg           - Build the kernel as a gzip compressed tarball'
 	@echo '  tarbz2-pkg          - Build the kernel as a bzip2 compressed tarball'
diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 3407826f2a99..6c2f57039d22 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -180,11 +180,6 @@ if grep -q '^CONFIG_MODULES=y' $KCONFIG_CONFIG ; then
 	fi
 fi
 
-if [ "$ARCH" != "um" ]; then
-	$MAKE headers_check KBUILD_SRC=
-	$MAKE headers_install KBUILD_SRC= INSTALL_HDR_PATH="$libc_headers_dir/usr"
-fi
-
 # Install the maintainer scripts
 # Note: hook scripts under /etc/kernel are also executed by official Debian
 # kernel packages, as well as kernel packages built using make-kpkg.
@@ -315,6 +310,32 @@ EOF
 
 fi
 
+# Move firmware out of kernel image package.
+if [ -e "$tmpdir/lib/firmware" ]; then
+	mv "$tmpdir/lib/firmware"/* "$fwdir/lib/firmware/$version/"
+	rmdir "$tmpdir/lib/firmware"
+fi
+
+create_package "$packagename" "$tmpdir"
+[ "x$1" = "xfastdeb-pkg" ] && exit 0
+
+if [ -e "$fwdir/lib/firmware/$version" ]; then
+	cat <<EOF >> debian/control
+
+Package: $fwpackagename
+Architecture: all
+Description: Linux kernel firmware, version $version
+ This package contains firmware from the Linux kernel, version $version.
+EOF
+
+	create_package "$fwpackagename" "$fwdir"
+fi
+
+if [ "$ARCH" != "um" ]; then
+	$MAKE headers_check KBUILD_SRC=
+	$MAKE headers_install KBUILD_SRC= INSTALL_HDR_PATH="$libc_headers_dir/usr"
+fi
+
 # Build kernel header package
 (cd $srctree; find . -name Makefile\* -o -name Kconfig\* -o -name \*.pl) > "$objtree/debian/hdrsrcfiles"
 (cd $srctree; find arch/*/include include scripts -type f) >> "$objtree/debian/hdrsrcfiles"
@@ -345,22 +366,6 @@ Description: Linux kernel headers for $KERNELRELEASE on \${kernel:debarch}
  This is useful for people who need to build external modules
 EOF
 
-# Do we have firmware? Move it out of the way and build it into a package.
-if [ -e "$tmpdir/lib/firmware" ]; then
-	mv "$tmpdir/lib/firmware"/* "$fwdir/lib/firmware/$version/"
-	rmdir "$tmpdir/lib/firmware"
-
-	cat <<EOF >> debian/control
-
-Package: $fwpackagename
-Architecture: all
-Description: Linux kernel firmware, version $version
- This package contains firmware from the Linux kernel, version $version.
-EOF
-
-	create_package "$fwpackagename" "$fwdir"
-fi
-
 cat <<EOF >> debian/control
 
 Package: $libc_headers_packagename
@@ -377,8 +382,6 @@ if [ "$ARCH" != "um" ]; then
 	create_package "$libc_headers_packagename" "$libc_headers_dir"
 fi
 
-create_package "$packagename" "$tmpdir"
-
 if [ -n "$BUILD_DEBUG" ] ; then
 	# Build debug package
 	# Different tools want the image in different locations
-- 
2.11.0

