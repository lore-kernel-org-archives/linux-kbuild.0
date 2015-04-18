Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.skyhub.de ([78.46.96.112]:50556 "EHLO mail.skyhub.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750818AbbDRWFR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 18 Apr 2015 18:05:17 -0400
From: Borislav Petkov <bp@alien8.de>
Subject: [PATCH] kbuild/mkspec: Simplify vmlinux.bz2 creation
Date: Sun, 19 Apr 2015 00:05:14 +0200
Message-Id: <1429394714-9028-1-git-send-email-bp@alien8.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

From: Borislav Petkov <bp@suse.de>

No need for the intermediary vmlinux.orig - bzip2 can keep the original
files used for compression with --keep.

Signed-off-by: Borislav Petkov <bp@suse.de>
Cc: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org
---
 scripts/package/mkspec | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index d9ab94b17de0..89f9669d4f00 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -111,10 +111,8 @@ echo 'cp System.map $RPM_BUILD_ROOT'"/boot/System.map-$KERNELRELEASE"
 echo 'cp .config $RPM_BUILD_ROOT'"/boot/config-$KERNELRELEASE"
 
 echo "%ifnarch ppc64"
-echo 'cp vmlinux vmlinux.orig'
-echo 'bzip2 -9 vmlinux'
+echo 'bzip2 -9 --keep vmlinux'
 echo 'mv vmlinux.bz2 $RPM_BUILD_ROOT'"/boot/vmlinux-$KERNELRELEASE.bz2"
-echo 'mv vmlinux.orig vmlinux'
 echo "%endif"
 
 if ! $PREBUILT; then
-- 
2.3.5

