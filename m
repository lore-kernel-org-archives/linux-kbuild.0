Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from vostochny.stro.at ([78.47.22.85]:45720 "EHLO vostochny.stro.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759779Ab2FHJgk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 8 Jun 2012 05:36:40 -0400
From: maximilian attems <mattems@hep.itp.tuwien.ac.at>
Subject: [PATCH] deb-pkg: Add all Makefiles to header package
Date: Fri,  8 Jun 2012 11:36:26 +0200
Message-Id: <1339148186-14123-1-git-send-email-mattems@hep.itp.tuwien.ac.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Michael Prokop <mika@debian.org>, maximilian attems <max@stro.at>

From: maximilian attems <max@stro.at>

I discovered that make deb-pkg does not add Makefile_32.cpu from
arch/x86 directory when doing i386 kernel build and package build.
Fix it by greedily adding all Makefiles.

Reported-by: Witold Baryluk <baryluk@smp.if.uj.edu.pl>
Signed-off-by: maximilian attems <max@stro.at>
---
 scripts/package/builddeb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 6505ecd..acb8650 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -243,7 +243,7 @@ EOF
 fi
 
 # Build header package
-(cd $srctree; find . -name Makefile -o -name Kconfig\* -o -name \*.pl > "$objtree/debian/hdrsrcfiles")
+(cd $srctree; find . -name Makefile\* -o -name Kconfig\* -o -name \*.pl > "$objtree/debian/hdrsrcfiles")
 (cd $srctree; find arch/$SRCARCH/include include scripts -type f >> "$objtree/debian/hdrsrcfiles")
 (cd $objtree; find arch/$SRCARCH/include .config Module.symvers include scripts -type f >> "$objtree/debian/hdrobjfiles")
 destdir=$kernel_headers_dir/usr/src/linux-headers-$version
-- 
1.7.10

