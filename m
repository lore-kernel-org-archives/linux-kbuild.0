Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:47885 "EHLO
        mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750986AbdJBKnq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Oct 2017 06:43:46 -0400
Received: by mail-lf0-f51.google.com with SMTP id n140so3248520lfn.4
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Oct 2017 03:43:45 -0700 (PDT)
From: riku.voipio@linaro.org
Subject: [PATCH v3] scripts/package/builddeb: split generating packaging and build
Date: Mon,  2 Oct 2017 13:43:39 +0300
Message-Id: <20171002104339.4349-1-riku.voipio@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: debian-kernel@lists.debian.org, Riku Voipio <riku.voipio@linaro.org>

From: Riku Voipio <riku.voipio@linaro.org>

Move debian/ directory generation out of builddeb to a new script,
mkdebian. The package build commands are kept in builddeb, which
is now an internal command called from debian/rules.

With these changes in place, we can now use dpkg-buildpackage from
deb-pkg and bindeb-pkg removing need for handrolled source/changes
generation.

This patch is based on the criticism of the current state of builddeb
discussed on:

https://patchwork.kernel.org/patch/9656403/

Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
changes since v2:
- revert back to intdeb-pkg target
- fix parellel builds from deb-pkg targets
- drop unneccesary -us flag from bindeb-pkg target
changes since v1:
- use scripts/package/builddeb directly instead of
  using a internal intdeb-pkg target
- as consequence remove cmd_builddeb
- use KBUILD_PKG_ROOTCMD instead of hardcoded fakeroot -u
- don't clean tree in bindeb-pkg target
- fix source tarball version
- rebase on kbuild/next: no more firmware package
 scripts/package/Makefile |  34 +++-----
 scripts/package/builddeb | 221 +----------------------------------------------
 scripts/package/mkdebian | 191 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 202 insertions(+), 244 deletions(-)
 create mode 100755 scripts/package/mkdebian

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 73f9f3192b9f..2850a1b1f9ab 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -24,6 +24,7 @@
 # Remove hyphens since they have special meaning in RPM filenames
 KERNELPATH := kernel-$(subst -,_,$(KERNELRELEASE))
 KDEB_SOURCENAME ?= linux-$(KERNELRELEASE)
+KBUILD_PKG_ROOTCMD ?="fakeroot -u"
 export KDEB_SOURCENAME
 # Include only those top-level files that are needed by make, plus the GPL copy
 TAR_CONTENT := $(KBUILD_ALLDIRS) .config .scmversion Makefile \
@@ -62,35 +63,20 @@ binrpm-pkg: FORCE
 		$(UTS_MACHINE) -bb $(objtree)/binkernel.spec
 	rm binkernel.spec
 
-# Deb target
-# ---------------------------------------------------------------------------
-quiet_cmd_builddeb = BUILDDEB
-      cmd_builddeb = set -e; \
-	test `id -u` = 0 || \
-	test -n "$(KBUILD_PKG_ROOTCMD)" || { \
-		which fakeroot >/dev/null 2>&1 && \
-		KBUILD_PKG_ROOTCMD="fakeroot -u"; \
-	} || { \
-		echo; \
-		echo "builddeb must be run as root (or using fakeroot)."; \
-		echo "KBUILD_PKG_ROOTCMD is unset and fakeroot not found."; \
-		echo "Try setting KBUILD_PKG_ROOTCMD to a command to acquire"; \
-		echo "root privileges (e.g., 'fakeroot -u' or 'sudo')."; \
-		false; \
-	} && \
-	\
-	$$KBUILD_PKG_ROOTCMD $(CONFIG_SHELL) \
-		$(srctree)/scripts/package/builddeb $@
-
 deb-pkg: FORCE
 	$(MAKE) clean
+	$(CONFIG_SHELL) $(srctree)/scripts/package/mkdebian
 	$(call cmd,src_tar,$(KDEB_SOURCENAME))
-	$(MAKE) KBUILD_SRC=
-	+$(call cmd,builddeb)
+	origversion=$$(dpkg-parsechangelog -SVersion |sed 's/-[^-]*$$//');\
+		mv $(KDEB_SOURCENAME).tar.gz ../$(KDEB_SOURCENAME)_$${origversion}.orig.tar.gz
+	+dpkg-buildpackage -j1 -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) -i.git -us -uc
 
 bindeb-pkg: FORCE
-	$(MAKE) KBUILD_SRC=
-	+$(call cmd,builddeb)
+	$(CONFIG_SHELL) $(srctree)/scripts/package/mkdebian
+	+dpkg-buildpackage -j1 -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) -b -nc -uc
+
+intdeb-pkg: FORCE
+	+$(CONFIG_SHELL) $(srctree)/scripts/package/builddeb
 
 clean-dirs += $(objtree)/debian/
 
diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 0bc87473f68f..9dd31f5d5395 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -30,67 +30,11 @@ create_package() {
 	chmod -R a+rX "$pdir"
 
 	# Create the package
-	dpkg-gencontrol $forcearch -Vkernel:debarch="${debarch}" -p$pname -P"$pdir"
+	dpkg-gencontrol -p$pname -P"$pdir"
 	dpkg --build "$pdir" ..
 }
 
-set_debarch() {
-	# Attempt to find the correct Debian architecture
-	case "$UTS_MACHINE" in
-	i386|ia64|alpha)
-		debarch="$UTS_MACHINE" ;;
-	x86_64)
-		debarch=amd64 ;;
-	sparc*)
-		debarch=sparc ;;
-	s390*)
-		debarch=s390$(grep -q CONFIG_64BIT=y $KCONFIG_CONFIG && echo x || true) ;;
-	ppc*)
-		debarch=$(grep -q CPU_LITTLE_ENDIAN=y $KCONFIG_CONFIG && echo ppc64el || echo powerpc) ;;
-	parisc*)
-		debarch=hppa ;;
-	mips*)
-		debarch=mips$(grep -q CPU_LITTLE_ENDIAN=y $KCONFIG_CONFIG && echo el || true) ;;
-	aarch64|arm64)
-		debarch=arm64 ;;
-	arm*)
-		if grep -q CONFIG_AEABI=y $KCONFIG_CONFIG; then
-		    if grep -q CONFIG_VFP=y $KCONFIG_CONFIG; then
-			debarch=armhf
-		    else
-			debarch=armel
-		    fi
-		else
-		    debarch=arm
-		fi
-		;;
-	*)
-		debarch=$(dpkg --print-architecture)
-		echo "" >&2
-		echo "** ** **  WARNING  ** ** **" >&2
-		echo "" >&2
-		echo "Your architecture doesn't have its equivalent" >&2
-		echo "Debian userspace architecture defined!" >&2
-		echo "Falling back to using your current userspace instead!" >&2
-		echo "Please add support for $UTS_MACHINE to ${0} ..." >&2
-		echo "" >&2
-	esac
-	if [ -n "$KBUILD_DEBARCH" ] ; then
-		debarch="$KBUILD_DEBARCH"
-	fi
-	forcearch="-DArchitecture=$debarch"
-
-}
-
-# Some variables and settings used throughout the script
 version=$KERNELRELEASE
-revision=$(cat .version)
-if [ -n "$KDEB_PKGVERSION" ]; then
-	packageversion=$KDEB_PKGVERSION
-else
-	packageversion=$version-$revision
-fi
-sourcename=$KDEB_SOURCENAME
 tmpdir="$objtree/debian/tmp"
 kernel_headers_dir="$objtree/debian/hdrtmp"
 libc_headers_dir="$objtree/debian/headertmp"
@@ -99,9 +43,6 @@ packagename=linux-image-$version
 kernel_headers_packagename=linux-headers-$version
 libc_headers_packagename=linux-libc-dev
 dbg_packagename=$packagename-dbg
-debarch=
-forcearch=
-set_debarch
 
 if [ "$ARCH" = "um" ] ; then
 	packagename=user-mode-linux-$version
@@ -212,105 +153,6 @@ EOF
 	chmod 755 "$tmpdir/DEBIAN/$script"
 done
 
-# Try to determine maintainer and email values
-if [ -n "$DEBEMAIL" ]; then
-       email=$DEBEMAIL
-elif [ -n "$EMAIL" ]; then
-       email=$EMAIL
-else
-       email=$(id -nu)@$(hostname -f 2>/dev/null || hostname)
-fi
-if [ -n "$DEBFULLNAME" ]; then
-       name=$DEBFULLNAME
-elif [ -n "$NAME" ]; then
-       name=$NAME
-else
-       name="Anonymous"
-fi
-maintainer="$name <$email>"
-
-# Try to determine distribution
-if [ -n "$KDEB_CHANGELOG_DIST" ]; then
-        distribution=$KDEB_CHANGELOG_DIST
-# In some cases lsb_release returns the codename as n/a, which breaks dpkg-parsechangelog
-elif distribution=$(lsb_release -cs 2>/dev/null) && [ -n "$distribution" ] && [ "$distribution" != "n/a" ]; then
-        : # nothing to do in this case
-else
-        distribution="unstable"
-        echo >&2 "Using default distribution of 'unstable' in the changelog"
-        echo >&2 "Install lsb-release or set \$KDEB_CHANGELOG_DIST explicitly"
-fi
-
-# Generate a simple changelog template
-cat <<EOF > debian/changelog
-$sourcename ($packageversion) $distribution; urgency=low
-
-  * Custom built Linux kernel.
-
- -- $maintainer  $(date -R)
-EOF
-
-# Generate copyright file
-cat <<EOF > debian/copyright
-This is a packacked upstream version of the Linux kernel.
-
-The sources may be found at most Linux archive sites, including:
-https://www.kernel.org/pub/linux/kernel
-
-Copyright: 1991 - 2017 Linus Torvalds and others.
-
-The git repository for mainline kernel development is at:
-git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
-
-    This program is free software; you can redistribute it and/or modify
-    it under the terms of the GNU General Public License as published by
-    the Free Software Foundation; version 2 dated June, 1991.
-
-On Debian GNU/Linux systems, the complete text of the GNU General Public
-License version 2 can be found in \`/usr/share/common-licenses/GPL-2'.
-EOF
-
-
-build_depends="bc, kmod, cpio "
-
-# Generate a control file
-cat <<EOF > debian/control
-Source: $sourcename
-Section: kernel
-Priority: optional
-Maintainer: $maintainer
-Build-Depends: $build_depends
-Homepage: http://www.kernel.org/
-EOF
-
-if [ "$ARCH" = "um" ]; then
-	cat <<EOF >> debian/control
-
-Package: $packagename
-Architecture: any
-Description: User Mode Linux kernel, version $version
- User-mode Linux is a port of the Linux kernel to its own system call
- interface.  It provides a kind of virtual machine, which runs Linux
- as a user process under another Linux kernel.  This is useful for
- kernel development, sandboxes, jails, experimentation, and
- many other things.
- .
- This package contains the Linux kernel, modules and corresponding other
- files, version: $version.
-EOF
-
-else
-	cat <<EOF >> debian/control
-
-Package: $packagename
-Architecture: any
-Description: Linux kernel, version $version
- This package contains the Linux kernel, modules and corresponding other
- files, version: $version.
-EOF
-
-fi
-
 # Build kernel header package
 (cd $srctree; find . -name Makefile\* -o -name Kconfig\* -o -name \*.pl) > "$objtree/debian/hdrsrcfiles"
 (cd $srctree; find arch/*/include include scripts -type f) >> "$objtree/debian/hdrsrcfiles"
@@ -331,27 +173,6 @@ mkdir -p "$destdir"
 ln -sf "/usr/src/linux-headers-$version" "$kernel_headers_dir/lib/modules/$version/build"
 rm -f "$objtree/debian/hdrsrcfiles" "$objtree/debian/hdrobjfiles"
 
-cat <<EOF >> debian/control
-
-Package: $kernel_headers_packagename
-Architecture: any
-Description: Linux kernel headers for $KERNELRELEASE on \${kernel:debarch}
- This package provides kernel header files for $KERNELRELEASE on \${kernel:debarch}
- .
- This is useful for people who need to build external modules
-EOF
-
-cat <<EOF >> debian/control
-
-Package: $libc_headers_packagename
-Section: devel
-Provides: linux-kernel-headers
-Architecture: any
-Description: Linux support headers for userspace development
- This package provides userspaces headers from the Linux kernel.  These headers
- are used by the installed headers for GNU glibc and other system libraries.
-EOF
-
 if [ "$ARCH" != "um" ]; then
 	create_package "$kernel_headers_packagename" "$kernel_headers_dir"
 	create_package "$libc_headers_packagename" "$libc_headers_dir"
@@ -370,47 +191,7 @@ if [ -n "$BUILD_DEBUG" ] ; then
 	ln -s ../lib/modules/$version/vmlinux $dbg_dir/usr/lib/debug/boot/vmlinux-$version
 	# kdump-tools
 	ln -s lib/modules/$version/vmlinux $dbg_dir/usr/lib/debug/vmlinux-$version
-
-	cat <<EOF >> debian/control
-
-Package: $dbg_packagename
-Section: debug
-Architecture: any
-Description: Linux kernel debugging symbols for $version
- This package will come in handy if you need to debug the kernel. It provides
- all the necessary debug symbols for the kernel and its modules.
-EOF
-
 	create_package "$dbg_packagename" "$dbg_dir"
 fi
 
-if [ "x$1" = "xdeb-pkg" ]
-then
-    cat <<EOF > debian/rules
-#!/usr/bin/make -f
-
-build:
-	\$(MAKE)
-
-binary-arch:
-	\$(MAKE) KDEB_SOURCENAME=${sourcename} KDEB_PKGVERSION=${packageversion} bindeb-pkg
-
-clean:
-	rm -rf debian/*tmp debian/files
-	mv debian/ debian.backup # debian/ might be cleaned away
-	\$(MAKE) clean
-	mv debian.backup debian
-
-binary: binary-arch
-EOF
-	mv ${sourcename}.tar.gz ../${sourcename}_${version}.orig.tar.gz
-	tar caf ../${sourcename}_${packageversion}.debian.tar.gz debian/{copyright,rules,changelog,control}
-	dpkg-source -cdebian/control -ldebian/changelog --format="3.0 (custom)" --target-format="3.0 (quilt)" \
-		-b / ../${sourcename}_${version}.orig.tar.gz  ../${sourcename}_${packageversion}.debian.tar.gz
-	mv ${sourcename}_${packageversion}*dsc ..
-	dpkg-genchanges > ../${sourcename}_${packageversion}_${debarch}.changes
-else
-	dpkg-genchanges -b > ../${sourcename}_${packageversion}_${debarch}.changes
-fi
-
 exit 0
diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
new file mode 100755
index 000000000000..a151646a2c99
--- /dev/null
+++ b/scripts/package/mkdebian
@@ -0,0 +1,191 @@
+#!/bin/sh
+#
+# Copyright 2003 Wichert Akkerman <wichert@wiggy.net>
+#
+# Simple script to generate a debian/ directory for a Linux kernel.
+
+set -e
+
+set_debarch() {
+	# Attempt to find the correct Debian architecture
+	case "$UTS_MACHINE" in
+	i386|ia64|alpha)
+		debarch="$UTS_MACHINE" ;;
+	x86_64)
+		debarch=amd64 ;;
+	sparc*)
+		debarch=sparc ;;
+	s390*)
+		debarch=s390$(grep -q CONFIG_64BIT=y $KCONFIG_CONFIG && echo x || true) ;;
+	ppc*)
+		debarch=$(grep -q CPU_LITTLE_ENDIAN=y $KCONFIG_CONFIG && echo ppc64el || echo powerpc) ;;
+	parisc*)
+		debarch=hppa ;;
+	mips*)
+		debarch=mips$(grep -q CPU_LITTLE_ENDIAN=y $KCONFIG_CONFIG && echo el || true) ;;
+	aarch64|arm64)
+		debarch=arm64 ;;
+	arm*)
+		if grep -q CONFIG_AEABI=y $KCONFIG_CONFIG; then
+		    if grep -q CONFIG_VFP=y $KCONFIG_CONFIG; then
+			debarch=armhf
+		    else
+			debarch=armel
+		    fi
+		else
+		    debarch=arm
+		fi
+		;;
+	*)
+		debarch=$(dpkg --print-architecture)
+		echo "" >&2
+		echo "** ** **  WARNING  ** ** **" >&2
+		echo "" >&2
+		echo "Your architecture doesn't have its equivalent" >&2
+		echo "Debian userspace architecture defined!" >&2
+		echo "Falling back to using your current userspace instead!" >&2
+		echo "Please add support for $UTS_MACHINE to ${0} ..." >&2
+		echo "" >&2
+	esac
+	if [ -n "$KBUILD_DEBARCH" ] ; then
+		debarch="$KBUILD_DEBARCH"
+	fi
+}
+
+# Some variables and settings used throughout the script
+version=$KERNELRELEASE
+if [ -n "$KDEB_PKGVERSION" ]; then
+	packageversion=$KDEB_PKGVERSION
+else
+	revision=$(cat .version 2>/dev/null||echo 1)
+	packageversion=$version-$revision
+fi
+sourcename=$KDEB_SOURCENAME
+packagename=linux-image-$version
+kernel_headers_packagename=linux-headers-$version
+dbg_packagename=$packagename-dbg
+debarch=
+set_debarch
+
+if [ "$ARCH" = "um" ] ; then
+	packagename=user-mode-linux-$version
+fi
+
+# Try to determine maintainer and email values
+if [ -n "$DEBEMAIL" ]; then
+       email=$DEBEMAIL
+elif [ -n "$EMAIL" ]; then
+       email=$EMAIL
+else
+       email=$(id -nu)@$(hostname -f 2>/dev/null || hostname)
+fi
+if [ -n "$DEBFULLNAME" ]; then
+       name=$DEBFULLNAME
+elif [ -n "$NAME" ]; then
+       name=$NAME
+else
+       name="Anonymous"
+fi
+maintainer="$name <$email>"
+
+# Try to determine distribution
+if [ -n "$KDEB_CHANGELOG_DIST" ]; then
+        distribution=$KDEB_CHANGELOG_DIST
+# In some cases lsb_release returns the codename as n/a, which breaks dpkg-parsechangelog
+elif distribution=$(lsb_release -cs 2>/dev/null) && [ -n "$distribution" ] && [ "$distribution" != "n/a" ]; then
+        : # nothing to do in this case
+else
+        distribution="unstable"
+        echo >&2 "Using default distribution of 'unstable' in the changelog"
+        echo >&2 "Install lsb-release or set \$KDEB_CHANGELOG_DIST explicitly"
+fi
+
+mkdir -p debian/
+echo $debarch > debian/arch
+
+# Generate a simple changelog template
+cat <<EOF > debian/changelog
+$sourcename ($packageversion) $distribution; urgency=low
+
+  * Custom built Linux kernel.
+
+ -- $maintainer  $(date -R)
+EOF
+
+# Generate copyright file
+cat <<EOF > debian/copyright
+This is a packacked upstream version of the Linux kernel.
+
+The sources may be found at most Linux archive sites, including:
+https://www.kernel.org/pub/linux/kernel
+
+Copyright: 1991 - 2017 Linus Torvalds and others.
+
+The git repository for mainline kernel development is at:
+git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
+
+    This program is free software; you can redistribute it and/or modify
+    it under the terms of the GNU General Public License as published by
+    the Free Software Foundation; version 2 dated June, 1991.
+
+On Debian GNU/Linux systems, the complete text of the GNU General Public
+License version 2 can be found in \`/usr/share/common-licenses/GPL-2'.
+EOF
+
+# Generate a control file
+cat <<EOF > debian/control
+Source: $sourcename
+Section: kernel
+Priority: optional
+Maintainer: $maintainer
+Build-Depends: bc, kmod, cpio
+Homepage: http://www.kernel.org/
+
+Package: $packagename
+Architecture: $debarch
+Description: Linux kernel, version $version
+ This package contains the Linux kernel, modules and corresponding other
+ files, version: $version.
+
+Package: $kernel_headers_packagename
+Architecture: $debarch
+Description: Linux kernel headers for $version on $debarch
+ This package provides kernel header files for $version on $debarch
+ .
+ This is useful for people who need to build external modules
+
+Package: linux-libc-dev
+Section: devel
+Provides: linux-kernel-headers
+Architecture: $debarch
+Description: Linux support headers for userspace development
+ This package provides userspaces headers from the Linux kernel.  These headers
+ are used by the installed headers for GNU glibc and other system libraries.
+
+Package: $dbg_packagename
+Section: debug
+Architecture: $debarch
+Description: Linux kernel debugging symbols for $version
+ This package will come in handy if you need to debug the kernel. It provides
+ all the necessary debug symbols for the kernel and its modules.
+EOF
+
+cat <<EOF > debian/rules
+#!/usr/bin/make -f
+
+build:
+	\$(MAKE) KERNELRELEASE=${version} ARCH=${ARCH} KBUILD_SRC=
+
+binary-arch:
+	\$(MAKE) KERNELRELEASE=${version} ARCH=${ARCH} KBUILD_SRC= intdeb-pkg
+
+clean:
+	rm -rf debian/*tmp debian/files
+	mv debian/ debian.backup # debian/ might be cleaned away
+	\$(MAKE) clean
+	mv debian.backup debian
+
+binary: binary-arch
+EOF
+
+exit 0
-- 
2.11.0

