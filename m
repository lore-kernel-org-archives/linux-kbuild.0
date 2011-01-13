Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from vostochny.stro.at ([78.47.22.85]:46745 "EHLO vostochny.stro.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754728Ab1AMOe0 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 13 Jan 2011 09:34:26 -0500
From: maximilian attems <max@stro.at>
Subject: [PATCH] deb-pkg: Use $SRCARCH for include path
Date: Thu, 13 Jan 2011 15:34:20 +0100
Message-Id: <1294929260-9511-1-git-send-email-max@stro.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, maximilian attems <max@stro.at>

Fix x86 centric path to allow building kernel-header packages for
other architecture.

Thanks: Michal Marek <mmarek@suse.cz>
Signed-off-by: maximilian attems <max@stro.at>
---
 scripts/package/builddeb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index b0b2357..ebc6d6e 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -239,7 +239,7 @@ fi
 
 # Build header package
 find . -name Makefile -o -name Kconfig\* -o -name \*.pl > /tmp/files$$
-find arch/x86/include include scripts -type f >> /tmp/files$$
+find arch/$SRCARCH/include include scripts -type f >> /tmp/files$$
 (cd $objtree; find .config Module.symvers include scripts -type f >> /tmp/objfiles$$)
 destdir=$kernel_headers_dir/usr/src/linux-headers-$version
 mkdir -p "$destdir"
-- 
1.7.2.3

