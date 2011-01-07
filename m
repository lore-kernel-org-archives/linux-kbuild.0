Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from vostochny.stro.at ([78.47.22.85]:40026 "EHLO vostochny.stro.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753074Ab1AGPOJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 7 Jan 2011 10:14:09 -0500
From: maximilian attems <max@stro.at>
Subject: [PATCH] deb-pkg: s/hdr/kernel_headers_/ && s/header/libc_headers_/
Date: Fri,  7 Jan 2011 16:13:06 +0100
Message-Id: <1294413186-29006-1-git-send-email-max@stro.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, maximilian attems <max@stro.at>, Theodore Ts'o <tytso@mit.edu>

hdrpackage and headerpackage are not intuitive names,
use proposed alternatives by Michel Marek.

While touching them move the mkdir of the kernel_headers dir up
and fix it for paranoid umask.

CC: Theodore Ts'o <tytso@mit.edu>
Signed-off-by: maximilian attems <max@stro.at>
---
 scripts/package/builddeb |   30 ++++++++++++++++--------------
 1 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 8c1f8d4..0c921be 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -76,25 +76,27 @@ else
 fi
 tmpdir="$objtree/debian/tmp"
 fwdir="$objtree/debian/fwtmp"
-hdrdir="$objtree/debian/hdrtmp"
-headerdir="$objtree/debian/headertmp"
+kernel_headers_dir="$objtree/debian/hdrtmp"
+libc_headers_dir="$objtree/debian/headertmp"
 packagename=linux-image-$version
 fwpackagename=linux-firmware-image
-hdrpackagename=linux-headers-$version
-headerpackagename=linux-libc-dev
+kernel_headers_packagename=linux-headers-$version
+libc_headers_packagename=linux-libc-dev
 
 if [ "$ARCH" = "um" ] ; then
 	packagename=user-mode-linux-$version
 fi
 
 # Setup the directory structure
-rm -rf "$tmpdir" "$fwdir" "$hdrdir" "$headerdir"
+rm -rf "$tmpdir" "$fwdir" "$kernel_headers_dir" "$libc_headers_dir"
 mkdir -m 755 -p "$tmpdir/DEBIAN"
 mkdir -p  "$tmpdir/lib" "$tmpdir/boot" "$tmpdir/usr/share/doc/$packagename"
 mkdir -m 755 -p "$fwdir/DEBIAN"
 mkdir -p "$fwdir/lib" "$fwdir/usr/share/doc/$fwpackagename"
-mkdir -m 755 -p "$headerdir/DEBIAN"
-mkdir -p "$headerdir/usr/share/doc/$headerpackagename"
+mkdir -m 755 -p "$libc_headers_dir/DEBIAN"
+mkdir -p "$libc_headers_dir/usr/share/doc/$libc_headers_packagename"
+mkdir -m 755 -p "$kernel_headers_dir/DEBIAN"
+mkdir -p "$kernel_headers_dir/usr/share/doc/$kernel_headers_packagename"
 if [ "$ARCH" = "um" ] ; then
 	mkdir -p "$tmpdir/usr/lib/uml/modules/$version" "$tmpdir/usr/bin"
 fi
@@ -126,7 +128,7 @@ if grep -q '^CONFIG_MODULES=y' .config ; then
 fi
 
 make headers_check
-make headers_install INSTALL_HDR_PATH="$headerdir/usr" 
+make headers_install INSTALL_HDR_PATH="$libc_headers_dir/usr" 
 
 # Install the maintainer scripts
 # Note: hook scripts under /etc/kernel are also executed by official Debian
@@ -239,8 +241,8 @@ fi
 find . -name Makefile -o -name Kconfig\* -o -name \*.pl > /tmp/files$$
 find arch/x86/include include scripts -type f >> /tmp/files$$
 (cd $objtree; find .config Module.symvers include scripts -type f >> /tmp/objfiles$$)
-destdir=$hdrdir/usr/src/linux-headers-$version
-mkdir -p "$destdir" "$hdrdir/DEBIAN" "$hdrdir/usr/share/doc/$hdrpackagename"
+destdir=$kernel_headers_dir/usr/src/linux-headers-$version
+mkdir -p "$destdir"
 tar -c -f - -T /tmp/files$$ | (cd $destdir; tar -xf -)
 (cd $objtree; tar -c -f - -T /tmp/objfiles$$) | (cd $destdir; tar -xf -)
 rm -f /tmp/files$$ /tmp/objfiles$$
@@ -248,7 +250,7 @@ arch=$(dpkg --print-architecture)
 
 cat <<EOF >> debian/control
 
-Package: $hdrpackagename
+Package: $kernel_headers_packagename
 Provides: linux-headers, linux-headers-2.6
 Architecture: $arch
 Description: Linux kernel headers for $KERNELRELEASE on $arch
@@ -257,7 +259,7 @@ Description: Linux kernel headers for $KERNELRELEASE on $arch
  This is useful for people who need to build external modules
 EOF
 
-create_package "$hdrpackagename" "$hdrdir"
+create_package "$kernel_headers_packagename" "$kernel_headers_dir"
 
 # Do we have firmware? Move it out of the way and build it into a package.
 if [ -e "$tmpdir/lib/firmware" ]; then
@@ -276,7 +278,7 @@ fi
 
 cat <<EOF >> debian/control
 
-Package: $headerpackagename
+Package: $libc_headers_packagename
 Section: devel
 Provides: linux-kernel-headers
 Architecture: any
@@ -285,7 +287,7 @@ Description: Linux support headers for userspace development
  are used by the installed headers for GNU glibc and other system libraries.
 EOF
 
-create_package "$headerpackagename" "$headerdir"
+create_package "$libc_headers_packagename" "$libc_headers_dir"
 create_package "$packagename" "$tmpdir"
 
 exit 0
-- 
1.7.2.3

