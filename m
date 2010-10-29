Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from vostochny.stro.at ([78.47.22.85]:52718 "EHLO vostochny.stro.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750976Ab0KBKY2 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 2 Nov 2010 06:24:28 -0400
From: maximilian attems <max@stro.at>
Subject: [PATCH] kbuild, deb-pkg: Fix build with paranoid umask
Date: Fri, 29 Oct 2010 15:55:50 +0200
Message-Id: <1288360550-26710-1-git-send-email-max@stro.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, maximilian attems <max@stro.at>

umask 077
make deb-pkg
<snipp ..>
dpkg-deb: building package `linux-image-2.6.36+' in `../linux-image-2.6.36+_2.6.36+-4_amd64.deb'.
dpkg-deb: control directory has bad permissions 700 (must be >=0755 and <=0775)
make[1]: *** [deb-pkg] Error 2

Reported-by: Bastian Blank <waldi@debian.org>
Signed-off-by: maximilian attems <max@stro.at>
---
 scripts/package/builddeb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 49b74e1..4dfec9a 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -49,8 +49,10 @@ fi
 
 # Setup the directory structure
 rm -rf "$tmpdir" "$fwdir"
-mkdir -p "$tmpdir/DEBIAN" "$tmpdir/lib" "$tmpdir/boot" "$tmpdir/usr/share/doc/$packagename"
-mkdir -p "$fwdir/DEBIAN" "$fwdir/lib" "$fwdir/usr/share/doc/$fwpackagename"
+mkdir -m 755 -p "$tmpdir/DEBIAN"
+mkdir -p  "$tmpdir/lib" "$tmpdir/boot" "$tmpdir/usr/share/doc/$packagename"
+mkdir -m 755 -p "$fwdir/DEBIAN"
+mkdir -p "$fwdir/lib" "$fwdir/usr/share/doc/$fwpackagename"
 if [ "$ARCH" = "um" ] ; then
 	mkdir -p "$tmpdir/usr/lib/uml/modules/$version" "$tmpdir/usr/bin"
 fi
-- 
1.7.1

