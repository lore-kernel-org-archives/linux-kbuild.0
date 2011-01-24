Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp6-g21.free.fr ([212.27.42.6]:52280 "EHLO smtp6-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752022Ab1AXNmC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 24 Jan 2011 08:42:02 -0500
From: =?UTF-8?q?Nicolas=20de=20Peslo=C3=BCan?=
	<nicolas.2p.debian@free.fr>
Subject: [PATCH] deb-pkg: Fix building outside of source tree (O=...).
Date: Mon, 24 Jan 2011 14:41:41 +0100
Message-Id: <1295876501-805-1-git-send-email-nicolas.2p.debian@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz, linux-kbuild@vger.kernel.org
Cc: nicolas.2p.debian@free.fr

When building linux-headers package using deb-pkg, builddeb erroneously assume
current directory is the source tree. This is not true if building in another
directory, using make O=... deb-pkg.

This patch fix this problem.

Signed-off-by: Nicolas de Pesloüan <nicolas.2p.debian@free.fr>
---
 scripts/package/builddeb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index ebc6d6e..f6cbc3d 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -238,12 +238,12 @@ EOF
 fi
 
 # Build header package
-find . -name Makefile -o -name Kconfig\* -o -name \*.pl > /tmp/files$$
-find arch/$SRCARCH/include include scripts -type f >> /tmp/files$$
+(cd $srctree; find . -name Makefile -o -name Kconfig\* -o -name \*.pl > /tmp/files$$)
+(cd $srctree; find arch/$SRCARCH/include include scripts -type f >> /tmp/files$$)
 (cd $objtree; find .config Module.symvers include scripts -type f >> /tmp/objfiles$$)
 destdir=$kernel_headers_dir/usr/src/linux-headers-$version
 mkdir -p "$destdir"
-tar -c -f - -T /tmp/files$$ | (cd $destdir; tar -xf -)
+(cd $srctree; tar -c -f - -T /tmp/files$$) | (cd $destdir; tar -xf -)
 (cd $objtree; tar -c -f - -T /tmp/objfiles$$) | (cd $destdir; tar -xf -)
 rm -f /tmp/files$$ /tmp/objfiles$$
 arch=$(dpkg --print-architecture)
-- 
1.7.2.3

