Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from local.xorcom.com ([81.218.177.19]:49135 "EHLO local.xorcom.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1031630Ab2COP65 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 15 Mar 2012 11:58:57 -0400
From: Tzafrir Cohen <tzafrir.cohen@xorcom.com>
Subject: [PATCH] deb-pkg: Add mach-specific includes
Date: Thu, 15 Mar 2012 17:48:58 +0200
Message-Id: <1331826538-8162-1-git-send-email-tzafrir.cohen@xorcom.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, debian-kernel@lists.debian.org, Tzafrir Cohen <tzafrir.cohen@xorcom.com>

When building a deb package, the linux-headers package should also
add arch/$ARCH/mach-*/include Required for arm and probably some
other architectures: avr32, blackfin, ia64, mn10300.

Signed-off-by: Tzafrir Cohen <tzafrir.cohen@xorcom.com>
---
 scripts/package/builddeb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index a87c04e..9c0ce55 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -240,6 +240,7 @@ fi
 # Build header package
 (cd $srctree; find . -name Makefile -o -name Kconfig\* -o -name \*.pl > "$objtree/debian/hdrsrcfiles")
 (cd $srctree; find arch/$SRCARCH/include include scripts -type f >> "$objtree/debian/hdrsrcfiles")
+(cd $srctree; find arch/$SRCARCH/mach-*/include -type f >> "$objtree/debian/hdrsrcfiles" 2>/dev/null)
 (cd $objtree; find .config Module.symvers include scripts -type f >> "$objtree/debian/hdrobjfiles")
 destdir=$kernel_headers_dir/usr/src/linux-headers-$version
 mkdir -p "$destdir"
-- 
1.7.9.1

