Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from db3ehsobe005.messaging.microsoft.com ([213.199.154.143]:23993
	"EHLO DB3EHSOBE003.bigfish.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750862Ab2BOQyJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Feb 2012 11:54:09 -0500
From: Joerg Roedel <joerg.roedel@amd.com>
Subject: [PATCH 1/2] kbuild: Fix link to headers in 'make deb-pkg'
Date: Wed, 15 Feb 2012 17:38:26 +0100
Message-ID: <1329323907-7696-1-git-send-email-joerg.roedel@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Joerg Roedel <joerg.roedel@amd.com>, Michal Marek <mmarek@suse.cz>, maximilian attems <max@stro.at>, Ben Hutchings <ben@decadent.org.uk>, debian-kernel@lists.debian.org, linux-kbuild@vger.kernel.org

The Link to the kernel header files in the debian packages
point to the original build directory. This is a bad choice
if the packages were installed on a different machine. Fix
this in by manually re-creating the link in the builddeb
script.

Cc: Michal Marek <mmarek@suse.cz>
Cc: maximilian attems <max@stro.at>
Cc: Ben Hutchings <ben@decadent.org.uk>
Cc: debian-kernel@lists.debian.org
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 scripts/package/builddeb |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 3c6c0b1..39e3f30 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -97,6 +97,7 @@ mkdir -m 755 -p "$libc_headers_dir/DEBIAN"
 mkdir -p "$libc_headers_dir/usr/share/doc/$libc_headers_packagename"
 mkdir -m 755 -p "$kernel_headers_dir/DEBIAN"
 mkdir -p "$kernel_headers_dir/usr/share/doc/$kernel_headers_packagename"
+mkdir -p "$kernel_headers_dir/lib/modules/$version/"
 if [ "$ARCH" = "um" ] ; then
 	mkdir -p "$tmpdir/usr/lib/uml/modules/$version" "$tmpdir/usr/bin"
 fi
@@ -121,6 +122,8 @@ fi
 
 if grep -q '^CONFIG_MODULES=y' .config ; then
 	INSTALL_MOD_PATH="$tmpdir" make KBUILD_SRC= modules_install
+	rm -f "$tmpdir/lib/modules/$version/build"
+	rm -f "$tmpdir/lib/modules/$version/source"
 	if [ "$ARCH" = "um" ] ; then
 		mv "$tmpdir/lib/modules/$version"/* "$tmpdir/usr/lib/uml/modules/$version/"
 		rmdir "$tmpdir/lib/modules/$version"
@@ -245,6 +248,7 @@ destdir=$kernel_headers_dir/usr/src/linux-headers-$version
 mkdir -p "$destdir"
 (cd $srctree; tar -c -f - -T "$objtree/debian/hdrsrcfiles") | (cd $destdir; tar -xf -)
 (cd $objtree; tar -c -f - -T "$objtree/debian/hdrobjfiles") | (cd $destdir; tar -xf -)
+ln -sf "/usr/src/linux-headers-$version" "$kernel_headers_dir/lib/modules/$version/build"
 rm -f "$objtree/debian/hdrsrcfiles" "$objtree/debian/hdrobjfiles"
 arch=$(dpkg --print-architecture)
 
-- 
1.7.5.4


