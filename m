Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f45.google.com ([74.125.82.45]:55558 "EHLO
	mail-wg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751401Ab3FIQON (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 9 Jun 2013 12:14:13 -0400
Received: by mail-wg0-f45.google.com with SMTP id n12so4241784wgh.0
        for <linux-kbuild@vger.kernel.org>; Sun, 09 Jun 2013 09:14:12 -0700 (PDT)
Message-ID: <51B4A9D1.7070502@gmail.com>
Date: Sun, 09 Jun 2013 18:14:09 +0200
From: Gabriel de Perthuis <g2p.code@gmail.com>
MIME-Version: 1.0
Subject: [PATCH] deb-pkg: Don't run find across mountpoints
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

Signed-off-by: Gabriel de Perthuis <g2p.code@gmail.com>
---
 scripts/package/builddeb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index acb8650..1435f5a 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -16,11 +16,11 @@ create_package() {
 	local pname="$1" pdir="$2"
 
 	cp debian/copyright "$pdir/usr/share/doc/$pname/"
 	cp debian/changelog "$pdir/usr/share/doc/$pname/changelog.Debian"
 	gzip -9 "$pdir/usr/share/doc/$pname/changelog.Debian"
-	sh -c "cd '$pdir'; find . -type f ! -path './DEBIAN/*' -printf '%P\0' \
+	sh -c "cd '$pdir'; find . -xdev -type f ! -path './DEBIAN/*' -printf '%P\0' \
 		| xargs -r0 md5sum > DEBIAN/md5sums"
 
 	# Fix ownership and permissions
 	chown -R root:root "$pdir"
 	chmod -R go-w "$pdir"
@@ -241,11 +241,11 @@ Description: Linux kernel, version $version
 EOF
 
 fi
 
 # Build header package
-(cd $srctree; find . -name Makefile\* -o -name Kconfig\* -o -name \*.pl > "$objtree/debian/hdrsrcfiles")
+(cd $srctree; find . -xdev -name Makefile\* -o -name Kconfig\* -o -name \*.pl > "$objtree/debian/hdrsrcfiles")
 (cd $srctree; find arch/$SRCARCH/include include scripts -type f >> "$objtree/debian/hdrsrcfiles")
 (cd $objtree; find arch/$SRCARCH/include .config Module.symvers include scripts -type f >> "$objtree/debian/hdrobjfiles")
 destdir=$kernel_headers_dir/usr/src/linux-headers-$version
 mkdir -p "$destdir"
 (cd $srctree; tar -c -f - -T "$objtree/debian/hdrsrcfiles") | (cd $destdir; tar -xf -)
-- 
1.8.3.222.g430da9e

