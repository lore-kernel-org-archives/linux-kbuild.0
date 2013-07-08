Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:48296 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751213Ab3GHLrh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Jul 2013 07:47:37 -0400
Subject: [PATCH v2] kbuild: add generation of kernel-devel
From: Mike Marciniszyn <mike.marciniszyn@intel.com>
Date: Mon, 08 Jul 2013 07:47:34 -0400
Message-ID: <20130708114734.20384.74966.stgit@phlsvslse11.ph.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org, mmarcini@yahoo.com

Change the spec file to generate a kernel-devel module
allowing for compilation of external kernel modules.

Signed-off-by: Mike Marciniszyn <mike.marciniszyn@intel.com>
---
 scripts/package/mkspec |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index 514aeb2..4df699e 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -59,6 +59,14 @@ echo "header files define structures and constants that are needed for"
 echo "building most standard programs and are also needed for rebuilding the"
 echo "glibc package."
 echo ""
+echo "%package devel"
+echo "Summary: Development package for building kernel modules to match the $__KERNELRELEASE kernel"
+echo "Group: System Environment/Kernel"
+echo "AutoReqProv: no"
+echo "%description -n kernel-devel"
+echo "This package provides kernel headers and makefiles sufficient to build modules"
+echo "against the $__KERNELRELEASE kernel package."
+echo ""
 
 if ! $PREBUILT; then
 echo "%prep"
@@ -109,6 +117,14 @@ echo 'mv vmlinux.bz2 $RPM_BUILD_ROOT'"/boot/vmlinux-$KERNELRELEASE.bz2"
 echo 'mv vmlinux.orig vmlinux'
 echo "%endif"
 
+echo 'rm -f $RPM_BUILD_ROOT'"/lib/modules/$KERNELRELEASE/{build,source}"
+echo "mkdir -p "'$RPM_BUILD_ROOT'"/usr/src/kernels/$KERNELRELEASE"
+echo "EXCLUDES=\"$RCS_TAR_IGNORE --exclude .tmp_versions --exclude=*vmlinux* --exclude=*.o --exclude=*.ko --exclude=*.cmd --exclude=Documentation --exclude=firmware --exclude .config.old --exclude .missing-syscalls.d\""
+echo "tar "'$EXCLUDES'" -cf- . | (cd "'$RPM_BUILD_ROOT'"/usr/src/kernels/$KERNELRELEASE;tar xvf -)"
+echo 'cd $RPM_BUILD_ROOT'"/lib/modules/$KERNELRELEASE"
+echo "ln -sf /usr/src/kernels/$KERNELRELEASE build"
+echo "ln -sf /usr/src/kernels/$KERNELRELEASE source"
+
 echo ""
 echo "%clean"
 echo 'rm -rf $RPM_BUILD_ROOT'
@@ -133,3 +149,7 @@ echo "%files headers"
 echo '%defattr (-, root, root)'
 echo "/usr/include"
 echo ""
+echo "%files devel"
+echo '%defattr (-, root, root)'
+echo "/usr/src/kernels/$KERNELRELEASE"
+echo ""

