Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from numascale.com ([213.162.240.84]:57676 "EHLO numascale.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752192AbbF3LsI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 30 Jun 2015 07:48:08 -0400
From: Espen Carlsen <ec@numascale.com>
Subject: [PATCH, resend] build: fix broken kernel RPM source symlink
Date: Tue, 30 Jun 2015 13:47:22 +0200
Message-Id: <1435664842-17908-1-git-send-email-ec@numascale.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Espen Carlsen <ec@numascale.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel J Blueman <daniel@numascale.com>, Steffen Persvold <sp@numascale.com>

Fix the 'rpm-pkg' makefile target to always generate the correct
/usr/src/kernel/<ver> symlink; this fails on non-RPM-native systems
eg Ubuntu.

On a non-RPM-native system, the symlink created by rpmbuild points to
the source tree, so the ln -sf commands to overwrite build and source will
create a new link inside the directory pointed to by the build and source
symlinks. This will break the -devel.rpm, as the build and source symlinks
will point to non existing directories after installing them.

Candidate for stable.

Signed-off-by: Espen Carlsen <ec@numascale.com>
---
 scripts/package/mkspec | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index d9ab94b..2d28d48 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -123,8 +123,8 @@ echo "mkdir -p "'$RPM_BUILD_ROOT'"/usr/src/kernels/$KERNELRELEASE"
 echo "EXCLUDES=\"$RCS_TAR_IGNORE --exclude .tmp_versions --exclude=*vmlinux* --exclude=*.o --exclude=*.ko --exclude=*.cmd --exclude=Documentation --exclude=firmware --exclude .config.old --exclude .missing-syscalls.d\""
 echo "tar "'$EXCLUDES'" -cf- . | (cd "'$RPM_BUILD_ROOT'"/usr/src/kernels/$KERNELRELEASE;tar xvf -)"
 echo 'cd $RPM_BUILD_ROOT'"/lib/modules/$KERNELRELEASE"
-echo "ln -sf /usr/src/kernels/$KERNELRELEASE build"
-echo "ln -sf /usr/src/kernels/$KERNELRELEASE source"
+echo "ln -sfT /usr/src/kernels/$KERNELRELEASE build"
+echo "ln -sfT /usr/src/kernels/$KERNELRELEASE source"
 fi
 
 echo ""
-- 
1.9.1

