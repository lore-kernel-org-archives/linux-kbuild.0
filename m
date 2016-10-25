Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-hk2apc01on0102.outbound.protection.outlook.com ([104.47.124.102]:40532
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1755903AbcJYJPp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Oct 2016 05:15:45 -0400
Date: Tue, 25 Oct 2016 18:00:44 +0900
From: Anton Tikhomirov <anton.tikhomirov@cdnetworks.com>
Subject: [PATCH] kbuild/mkspec: avoid using brace expansion
Message-ID: <20161025090041.GA4423@cdnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Brace expansion might not work properly if _buildshell RPM macro
points to a shell other than bash. Particularly, with _bulidshell
defined to /bin/dash it leads to broken build and source symlinks.

Signed-off-by: Anton Tikhomirov <anton.tikhomirov@cdnetworks.com>
---
 scripts/package/mkspec | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index 57673ba..bb43f15 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -116,7 +116,8 @@ echo 'mv vmlinux.bz2 $RPM_BUILD_ROOT'"/boot/vmlinux-$KERNELRELEASE.bz2"
 echo "%endif"
 
 if ! $PREBUILT; then
-echo 'rm -f $RPM_BUILD_ROOT'"/lib/modules/$KERNELRELEASE/{build,source}"
+echo 'rm -f $RPM_BUILD_ROOT'"/lib/modules/$KERNELRELEASE/build"
+echo 'rm -f $RPM_BUILD_ROOT'"/lib/modules/$KERNELRELEASE/source"
 echo "mkdir -p "'$RPM_BUILD_ROOT'"/usr/src/kernels/$KERNELRELEASE"
 echo "EXCLUDES=\"$RCS_TAR_IGNORE --exclude .tmp_versions --exclude=*vmlinux* --exclude=*.o --exclude=*.ko --exclude=*.cmd --exclude=Documentation --exclude=firmware --exclude .config.old --exclude .missing-syscalls.d\""
 echo "tar "'$EXCLUDES'" -cf- . | (cd "'$RPM_BUILD_ROOT'"/usr/src/kernels/$KERNELRELEASE;tar xvf -)"
-- 
2.7.4

