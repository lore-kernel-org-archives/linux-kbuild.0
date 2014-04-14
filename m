Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:59864 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751272AbaDNMUS (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Apr 2014 08:20:18 -0400
Received: by mail-lb0-f174.google.com with SMTP id u14so5567967lbd.19
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Apr 2014 05:20:16 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
Subject: [PATCH] builddeb: fix missing headers in linux-headers package on arm architecture
Date: Mon, 14 Apr 2014 15:19:56 +0300
Message-Id: <1397477996-24575-1-git-send-email-fathi.boudra@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <mmarek@suse.cz>, Ben Hutchings <ben@decadent.org.uk>, Maximilian Attems <maks@debian.org>, Fathi Boudra <fathi.boudra@linaro.org>

The kernel headers package (linux-headers) doesn't include
the arch/arm/mach-*/include header files.

It makes the package unusable on ARM architecture and prevent
out-of-tree modules build:
 /usr/src/linux-headers-3.14.0/arch/arm/include/asm/memory.h:24:25:
 fatal error: mach/memory.h: No such file or directory
 #include <mach/memory.h>
 ^
 compilation terminated.

While this patch explicitely test arm architecture, avr32 and blackfin are
affected since they ship mach-* headers. However, they haven't been included
in the test because they aren't official architectures supported by Debian.

minor tweak: clean up the linux-headers package by using tar exclude option.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 scripts/package/builddeb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index f46e4dd..74ebd54 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -287,14 +287,18 @@ EOF
 
 fi
 
-# Build header package
+# Build kernel header package
 (cd $srctree; find . -name Makefile\* -o -name Kconfig\* -o -name \*.pl > "$objtree/debian/hdrsrcfiles")
 (cd $srctree; find arch/$SRCARCH/include include scripts -type f >> "$objtree/debian/hdrsrcfiles")
+if [ "$ARCH" = "arm" ]; then
+	(cd $srctree; find arch/arm/mach-*/include -type f >> "$objtree/debian/hdrsrcfiles")
+fi
 (cd $objtree; find arch/$SRCARCH/include Module.symvers include scripts -type f >> "$objtree/debian/hdrobjfiles")
 destdir=$kernel_headers_dir/usr/src/linux-headers-$version
 mkdir -p "$destdir"
-(cd $srctree; tar -c -f - -T "$objtree/debian/hdrsrcfiles") | (cd $destdir; tar -xf -)
-(cd $objtree; tar -c -f - -T "$objtree/debian/hdrobjfiles") | (cd $destdir; tar -xf -)
+excludes="--exclude-vcs --exclude=*.cmd --exclude=*.o --exclude=Documentation"
+(cd $srctree; tar $excludes -cf - -T "$objtree/debian/hdrsrcfiles") | (cd $destdir; tar -xf -)
+(cd $objtree; tar $excludes -cf - -T "$objtree/debian/hdrobjfiles") | (cd $destdir; tar -xf -)
 (cd $objtree; cp $KCONFIG_CONFIG $destdir/.config) # copy .config manually to be where it's expected to be
 ln -sf "/usr/src/linux-headers-$version" "$kernel_headers_dir/lib/modules/$version/build"
 rm -f "$objtree/debian/hdrsrcfiles" "$objtree/debian/hdrobjfiles"
-- 
1.9.1

