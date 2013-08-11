Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.15]:64974 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754862Ab3HKTzx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 11 Aug 2013 15:55:53 -0400
Received: from Workstation4.fritz.box ([109.90.98.31]) by mail.gmx.com
 (mrgmx102) with ESMTPSA (Nemesis) id 0MYtId-1VcUwG2ztz-00VhKG for
 <linux-kbuild@vger.kernel.org>; Sun, 11 Aug 2013 21:55:51 +0200
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: [PATCH] Provide version number for Debian firmware package
Date: Sun, 11 Aug 2013 21:55:19 +0200
Message-Id: <1376250919-13886-1-git-send-email-xypron.glpk@gmx.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org, xypron.glpk@gmx.de

scripts/package/builddeb is used to create Debian packages.
Currently the firmware package always gets the same version number
irrespective of the Kernel version.
The paths inside the firmware package depend on the Kernel
version.

With the patch supplied the Kernel version becomes part of the
Debian firmware package number.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---
 scripts/package/builddeb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index acb8650..4ca6111 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -79,7 +79,7 @@ fwdir="$objtree/debian/fwtmp"
 kernel_headers_dir="$objtree/debian/hdrtmp"
 libc_headers_dir="$objtree/debian/headertmp"
 packagename=linux-image-$version
-fwpackagename=linux-firmware-image
+fwpackagename=linux-firmware-image-$version
 kernel_headers_packagename=linux-headers-$version
 libc_headers_packagename=linux-libc-dev
 
-- 
1.7.10.4

