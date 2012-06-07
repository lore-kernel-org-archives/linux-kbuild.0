Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from vostochny.stro.at ([78.47.22.85]:50139 "EHLO vostochny.stro.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933184Ab2FGWVU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Jun 2012 18:21:20 -0400
From: maximilian attems <max@stro.at>
Subject: [PATCH] deb-pkg: Install linux-firmware-image in versioned dir
Date: Fri,  8 Jun 2012 00:21:15 +0200
Message-Id: <1339107675-7402-1-git-send-email-max@stro.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Michael Prokop <mika@debian.org>, maximilian attems <max@stro.at>

That way they don't file conflict with official firmware package:
 trying to overwrite '/lib/firmware/qlogic/1040.bin', which is
               also in package firmware-qlogic 0.35
..

Reported-by: Michael Prokop <mika@debian.org>
Signed-off-by: maximilian attems <max@stro.at>
---
 scripts/package/builddeb |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index c95fdda..6505ecd 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -92,7 +92,7 @@ rm -rf "$tmpdir" "$fwdir" "$kernel_headers_dir" "$libc_headers_dir"
 mkdir -m 755 -p "$tmpdir/DEBIAN"
 mkdir -p  "$tmpdir/lib" "$tmpdir/boot" "$tmpdir/usr/share/doc/$packagename"
 mkdir -m 755 -p "$fwdir/DEBIAN"
-mkdir -p "$fwdir/lib" "$fwdir/usr/share/doc/$fwpackagename"
+mkdir -p "$fwdir/lib/firmware/$version/" "$fwdir/usr/share/doc/$fwpackagename"
 mkdir -m 755 -p "$libc_headers_dir/DEBIAN"
 mkdir -p "$libc_headers_dir/usr/share/doc/$libc_headers_packagename"
 mkdir -m 755 -p "$kernel_headers_dir/DEBIAN"
@@ -267,7 +267,8 @@ EOF
 
 # Do we have firmware? Move it out of the way and build it into a package.
 if [ -e "$tmpdir/lib/firmware" ]; then
-	mv "$tmpdir/lib/firmware" "$fwdir/lib/"
+	mv "$tmpdir/lib/firmware"/* "$fwdir/lib/firmware/$version/"
+	rmdir "$tmpdir/lib/firmware"
 
 	cat <<EOF >> debian/control
 
-- 
1.7.10

