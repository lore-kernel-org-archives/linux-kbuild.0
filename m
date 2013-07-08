Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:45162 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751582Ab3GHROU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Jul 2013 13:14:20 -0400
Subject: [PATCH v3] kbuild: add generation of kernel-devel
From: Mike Marciniszyn <mike.marciniszyn@intel.com>
Date: Mon, 08 Jul 2013 13:14:06 -0400
Message-ID: <20130708171406.21590.49678.stgit@phlsvslse11.ph.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org, mmarcini@yahoo.com

Change the spec file to generate a kernel-devel module
allowing for compilation of external kernel modules.

This patch requires a new minimum RPM level of 4.0.3.

Signed-off-by: Mike Marciniszyn <mike.marciniszyn@intel.com>
---
 scripts/package/mkspec |   28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index 514aeb2..1395760 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -1,7 +1,7 @@
 #!/bin/sh
 #
-#	Output a simple RPM spec file that uses no fancy features requiring
-#	RPM v4. This is intended to work with any RPM distro.
+#	Output a simple RPM spec file.
+#	This version assumes a minimum of RPM 4.0.3.
 #
 #	The only gothic bit here is redefining install_post to avoid
 #	stripping the symbols from files in the kernel which we want
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
@@ -126,6 +142,8 @@ echo "%files"
 echo '%defattr (-, root, root)'
 echo "%dir /lib/modules"
 echo "/lib/modules/$KERNELRELEASE"
+echo "%exclude /lib/modules/$KERNELRELEASE/build"
+echo "%exclude /lib/modules/$KERNELRELEASE/source"
 echo "/lib/firmware/$KERNELRELEASE"
 echo "/boot/*"
 echo ""
@@ -133,3 +151,9 @@ echo "%files headers"
 echo '%defattr (-, root, root)'
 echo "/usr/include"
 echo ""
+echo "%files devel"
+echo '%defattr (-, root, root)'
+echo "/usr/src/kernels/$KERNELRELEASE"
+echo "/lib/modules/$KERNELRELEASE/build"
+echo "/lib/modules/$KERNELRELEASE/source"
+echo ""

