Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33185 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752820AbcKNCsR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 13 Nov 2016 21:48:17 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id uAE2hl92115642
        for <linux-kbuild@vger.kernel.org>; Sun, 13 Nov 2016 21:48:17 -0500
Received: from e23smtp02.au.ibm.com (e23smtp02.au.ibm.com [202.81.31.144])
        by mx0a-001b2d01.pphosted.com with ESMTP id 26pqj13erd-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-kbuild@vger.kernel.org>; Sun, 13 Nov 2016 21:48:16 -0500
Received: from localhost
        by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-kbuild@vger.kernel.org> from <andrew.donnellan@au1.ibm.com>;
        Mon, 14 Nov 2016 12:48:14 +1000
From: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Subject: [PATCH RESEND 2/2] builddeb: allow building without headers/firmware packages
Date: Mon, 14 Nov 2016 13:47:49 +1100
In-Reply-To: <20161114024749.25488-1-andrew.donnellan@au1.ibm.com>
References: <20161114024749.25488-1-andrew.donnellan@au1.ibm.com>
Message-Id: <20161114024749.25488-2-andrew.donnellan@au1.ibm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Currently, the deb-pkg and bindeb-pkg targets create multiple packages for
the kernel binaries, headers, userspace headers and firmware.

For developers who generate Debian packages as part of their development
workflows, it's often not necessary to generate all these packages.

Allow the creation of the linux-headers, linux-libc-dev and linux-firmware
packages to be disabled if the environment variables KDEB_NO_HEADERS,
KDEB_NO_LIBC_HEADERS or KDEB_NO_FIRMWARE are non-empty.

Signed-off-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
---
 Documentation/kbuild/kbuild.txt |  7 +++++
 scripts/package/builddeb        | 67 ++++++++++++++++++++++++-----------------
 2 files changed, 46 insertions(+), 28 deletions(-)

diff --git a/Documentation/kbuild/kbuild.txt b/Documentation/kbuild/kbuild.txt
index 0ff6a46..cef4f7f 100644
--- a/Documentation/kbuild/kbuild.txt
+++ b/Documentation/kbuild/kbuild.txt
@@ -238,3 +238,10 @@ KBUILD_VMLINUX_MAIN
 All object files for the main part of vmlinux.
 KBUILD_VMLINUX_INIT and KBUILD_VMLINUX_MAIN together specify
 all the object files used to link vmlinux.
+
+KDEB_NO_HEADERS, KDEB_NO_LIBC_HEADERS, KDEB_NO_FIRMWARE
+-------------------------------------------------------
+If these variables are set, the deb-pkg and bindeb-pkg targets won't create
+linux-headers, linux-libc-dev and linux-firmware packages respectively. This
+may be useful for developers who use the deb-pkg targets in their workflow
+but don't need the full set of packages.
diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index d600fd0..da595da 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -187,7 +187,9 @@ fi
 
 if [ "$ARCH" != "um" ]; then
 	$MAKE headers_check KBUILD_SRC=
-	$MAKE headers_install KBUILD_SRC= INSTALL_HDR_PATH="$libc_headers_dir/usr"
+	if [ -z "$KDEB_NO_LIBC_HEADERS" ]; then
+		$MAKE headers_install KBUILD_SRC= INSTALL_HDR_PATH="$libc_headers_dir/usr"
+	fi
 fi
 
 # Install the maintainer scripts
@@ -324,26 +326,27 @@ EOF
 fi
 
 # Build kernel header package
-(cd $srctree; find . -name Makefile\* -o -name Kconfig\* -o -name \*.pl) > "$objtree/debian/hdrsrcfiles"
-(cd $srctree; find arch/*/include include scripts -type f) >> "$objtree/debian/hdrsrcfiles"
-(cd $srctree; find arch/$SRCARCH -name module.lds -o -name Kbuild.platforms -o -name Platform) >> "$objtree/debian/hdrsrcfiles"
-(cd $srctree; find $(find arch/$SRCARCH -name include -o -name scripts -type d) -type f) >> "$objtree/debian/hdrsrcfiles"
-if grep -q '^CONFIG_STACK_VALIDATION=y' $KCONFIG_CONFIG ; then
-	(cd $objtree; find tools/objtool -type f -executable) >> "$objtree/debian/hdrobjfiles"
-fi
-(cd $objtree; find arch/$SRCARCH/include Module.symvers include scripts -type f) >> "$objtree/debian/hdrobjfiles"
-if grep -q '^CONFIG_GCC_PLUGINS=y' $KCONFIG_CONFIG ; then
-	(cd $objtree; find scripts/gcc-plugins -name \*.so -o -name gcc-common.h) >> "$objtree/debian/hdrobjfiles"
-fi
-destdir=$kernel_headers_dir/usr/src/linux-headers-$version
-mkdir -p "$destdir"
-(cd $srctree; tar -c -f - -T -) < "$objtree/debian/hdrsrcfiles" | (cd $destdir; tar -xf -)
-(cd $objtree; tar -c -f - -T -) < "$objtree/debian/hdrobjfiles" | (cd $destdir; tar -xf -)
-(cd $objtree; cp $KCONFIG_CONFIG $destdir/.config) # copy .config manually to be where it's expected to be
-ln -sf "/usr/src/linux-headers-$version" "$kernel_headers_dir/lib/modules/$version/build"
-rm -f "$objtree/debian/hdrsrcfiles" "$objtree/debian/hdrobjfiles"
+if [ -z "$KDEB_NO_HEADERS" ]; then
+	(cd $srctree; find . -name Makefile\* -o -name Kconfig\* -o -name \*.pl) > "$objtree/debian/hdrsrcfiles"
+	(cd $srctree; find arch/*/include include scripts -type f) >> "$objtree/debian/hdrsrcfiles"
+	(cd $srctree; find arch/$SRCARCH -name module.lds -o -name Kbuild.platforms -o -name Platform) >> "$objtree/debian/hdrsrcfiles"
+	(cd $srctree; find $(find arch/$SRCARCH -name include -o -name scripts -type d) -type f) >> "$objtree/debian/hdrsrcfiles"
+	if grep -q '^CONFIG_STACK_VALIDATION=y' $KCONFIG_CONFIG ; then
+		(cd $objtree; find tools/objtool -type f -executable) >> "$objtree/debian/hdrobjfiles"
+	fi
+	(cd $objtree; find arch/$SRCARCH/include Module.symvers include scripts -type f) >> "$objtree/debian/hdrobjfiles"
+	if grep -q '^CONFIG_GCC_PLUGINS=y' $KCONFIG_CONFIG ; then
+		(cd $objtree; find scripts/gcc-plugins -name \*.so -o -name gcc-common.h) >> "$objtree/debian/hdrobjfiles"
+	fi
+	destdir=$kernel_headers_dir/usr/src/linux-headers-$version
+	mkdir -p "$destdir"
+	(cd $srctree; tar -c -f - -T -) < "$objtree/debian/hdrsrcfiles" | (cd $destdir; tar -xf -)
+	(cd $objtree; tar -c -f - -T -) < "$objtree/debian/hdrobjfiles" | (cd $destdir; tar -xf -)
+	(cd $objtree; cp $KCONFIG_CONFIG $destdir/.config) # copy .config manually to be where it's expected to be
+	ln -sf "/usr/src/linux-headers-$version" "$kernel_headers_dir/lib/modules/$version/build"
+	rm -f "$objtree/debian/hdrsrcfiles" "$objtree/debian/hdrobjfiles"
 
-cat <<EOF >> debian/control
+	cat <<EOF >> debian/control
 
 Package: $kernel_headers_packagename
 Provides: linux-headers, linux-headers-2.6
@@ -353,13 +356,13 @@ Description: Linux kernel headers for $KERNELRELEASE on \${kernel:debarch}
  .
  This is useful for people who need to build external modules
 EOF
+fi
 
 # Do we have firmware? Move it out of the way and build it into a package.
 if [ -e "$tmpdir/lib/firmware" ]; then
-	mv "$tmpdir/lib/firmware"/* "$fwdir/lib/firmware/$version/"
-	rmdir "$tmpdir/lib/firmware"
-
-	cat <<EOF >> debian/control
+	if [ -z "$KDEB_NO_FIRMWARE" ]; then
+		mv "$tmpdir/lib/firmware"/* "$fwdir/lib/firmware/$version/"
+		cat <<EOF >> debian/control
 
 Package: $fwpackagename
 Architecture: all
@@ -367,10 +370,13 @@ Description: Linux kernel firmware, version $version
  This package contains firmware from the Linux kernel, version $version.
 EOF
 
-	create_package "$fwpackagename" "$fwdir"
+		create_package "$fwpackagename" "$fwdir"
+	fi
+	rm -r "$tmpdir/lib/firmware"
 fi
 
-cat <<EOF >> debian/control
+if [ -z "$KDEB_NO_LIBC_HEADERS" ]; then
+	cat <<EOF >> debian/control
 
 Package: $libc_headers_packagename
 Section: devel
@@ -380,10 +386,15 @@ Description: Linux support headers for userspace development
  This package provides userspaces headers from the Linux kernel.  These headers
  are used by the installed headers for GNU glibc and other system libraries.
 EOF
+fi
 
 if [ "$ARCH" != "um" ]; then
-	create_package "$kernel_headers_packagename" "$kernel_headers_dir"
-	create_package "$libc_headers_packagename" "$libc_headers_dir"
+	if [ -z "$KDEB_NO_HEADERS" ]; then
+		create_package "$kernel_headers_packagename" "$kernel_headers_dir"
+	fi
+	if [ -z "$KDEB_NO_LIBC_HEADERS" ]; then
+		create_package "$libc_headers_packagename" "$libc_headers_dir"
+	fi
 fi
 
 create_package "$packagename" "$tmpdir"
-- 
Andrew Donnellan              OzLabs, ADL Canberra
andrew.donnellan@au1.ibm.com  IBM Australia Limited

