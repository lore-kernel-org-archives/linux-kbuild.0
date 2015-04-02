Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-la0-f43.google.com ([209.85.215.43]:34094 "EHLO
	mail-la0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750714AbbDBL1x (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 2 Apr 2015 07:27:53 -0400
Received: by lagg8 with SMTP id g8so57829769lag.1
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Apr 2015 04:27:51 -0700 (PDT)
From: riku.voipio@linaro.org
Subject: [PATCH 4/4] RFC: builddeb: add linux-tools package with perf
Date: Thu,  2 Apr 2015 14:27:30 +0300
Message-Id: <51b2a18cb7801c2866233a19506c4eead4727887.1427968988.git.riku.voipio@linaro.org>
In-Reply-To: <cover.1427968988.git.riku.voipio@linaro.org>
References: <cover.1427968988.git.riku.voipio@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, mmarek@suse.cz, debian-kernel@lists.debian.org
Cc: Riku Voipio <riku.voipio@linaro.org>

From: Riku Voipio <riku.voipio@linaro.org>

Perf is shipped in debian in linux-tools-$version package. Extend
the existing to builddeb script to build perf if BUILD_TOOLS=y
is added the make deb-pkg line

Some features of this patch I'm uncomfortable with:

1. Relative paths are resoved to absolute ones
   Especially with separate O= buildd, perf build from tools/perf dir
   fail.

2. Unsetting LDFLAGS
   make -> shell (builddeb) -> make expands variables. The LDFLAGS as
   set by toplevel makefile are for kernel, so we just unset the flag
   here.

3. Replaces ubuntu/debian packages instead attempting to fit to
   the linux-base/linux-tools-common frameworks. I think people who
   want to run "make deb-pkg" for their kernels would rather keep this
   simple.

4. More tools than just perf could be built - unfortunately most
   tools fail to have a working "install" target and/or else have
   build process inconsistent with other tools. A topic for another
   patch series.

Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
 scripts/package/builddeb | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 36185d6..2d6d547 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -92,11 +92,13 @@ fwdir="$objtree/debian/fwtmp"
 kernel_headers_dir="$objtree/debian/hdrtmp"
 libc_headers_dir="$objtree/debian/headertmp"
 dbg_dir="$objtree/debian/dbgtmp"
+tools_dir="$objtree/debian/toolstmp"
 packagename=linux-image-$version
 fwpackagename=linux-firmware-image-$version
 kernel_headers_packagename=linux-headers-$version
 libc_headers_packagename=linux-libc-dev
 dbg_packagename=$packagename-dbg
+tools_packagename=linux-tools-$version
 
 if [ "$ARCH" = "um" ] ; then
 	packagename=user-mode-linux-$version
@@ -119,7 +121,7 @@ esac
 BUILD_DEBUG="$(grep -s '^CONFIG_DEBUG_INFO=y' $KCONFIG_CONFIG || true)"
 
 # Setup the directory structure
-rm -rf "$tmpdir" "$fwdir" "$kernel_headers_dir" "$libc_headers_dir" "$dbg_dir"
+rm -rf "$tmpdir" "$fwdir" "$kernel_headers_dir" "$libc_headers_dir" "$dbg_dir" "$tools_dir"
 mkdir -p "$tmpdir/lib" "$tmpdir/boot"
 mkdir -p "$fwdir/lib/firmware/$version/"
 mkdir -p "$kernel_headers_dir/lib/modules/$version/"
@@ -387,4 +389,31 @@ EOF
 	create_package "$dbg_packagename" "$dbg_dir"
 fi
 
+if [ -n "$BUILD_TOOLS" ]
+then
+	# HACK - change output dir from relative to absolute
+	mkdir -p $tools_dir
+	tools_dest=`readlink -f $tools_dir`
+	if [ -n "$O" ]
+	then
+		output=`readlink -f $objtree`
+		mkdir -p $output/tools/perf
+		output="O=$output/tools/perf"
+	fi
+	$MAKE -C $srctree/tools/perf $output LDFLAGS= srctree=$KBUILD_SRC prefix=$tools_dest/usr install
+	cat <<EOF >> debian/control
+
+Package: $tools_packagename
+Architecture: any
+Replaces: linux-base, linux-tools-common
+Depends: \${shlibs:Depends}
+Description: Performance analysis tools for Linux $version
+ This package contains the 'perf' performance analysis tools for Linux
+ kernel version $version .
+EOF
+
+	dpkg-shlibdeps $tools_dest/usr/bin/* $tools_dest/usr/lib/traceevent/plugins/*
+	create_package "$tools_packagename" "$tools_dir"
+fi
+
 exit 0
-- 
2.1.4

