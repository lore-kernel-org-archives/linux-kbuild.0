Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:13806 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753735Ab3FEJvk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 5 Jun 2013 05:51:40 -0400
Subject: [RFC PATCH v4] kbuild: fix error when building from src rpm
From: Mike Marciniszyn <mike.marciniszyn@intel.com>
Date: Wed, 05 Jun 2013 05:51:38 -0400
Message-ID: <20130605095138.19780.89920.stgit@phlsvslse11.ph.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org

The following issue can be reproduced with Linus' tree on
and x86_64 serve.

>+ cp /home/user/rpmbuild-test/BUILDROOT/kernel-3.9.2.x86_64/boot/vmlinuz-3.9.2
>cp: missing destination file operand after
>/home/user/rpmbuild-test/BUILDROOT/kernel-3.9.2-1.x86_64/boot/vmlinuz-3.9.2'
>Try `cp --help' for more information.
>error: Bad exit status from /var/tmp/rpm-tmp.R4o0iI (%install)

Here are the commands to reproduce:

make defconfig
make rpm-pkg

Use the resulting src rpm to build as follows:

mkdir ~/rpmbuild-test
cd ~/rpmbuild-test
rpmbuild --rebuild --define "_topdir `pwd`" -vv ~/rpmbuild/SRPMS/kernel-3.10.0_rc1+-1.src.rpm

The issue is because the %install script uses $KBUILD_IMAGE and it hasn't
been set since it is only available in the kbuild system and not in the
%install script.

This patch add arch specific defines to replace $KBUILD_IMAGE.

Signed-off-by: Mike Marciniszyn <mike.marciniszyn@intel.com>
---
 scripts/package/mkspec |   51 ++++++++++++++++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 17 deletions(-)

diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index fbbfd08..e65d198 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -59,6 +59,38 @@ echo "header files define structures and constants that are needed for"
 echo "building most standard programs and are also needed for rebuilding the"
 echo "glibc package."
 echo ""
+echo "%define boot boot"
+echo "%ifarch %{all_x86}"
+echo "%define kbuild_image arch/x86/boot/bzImage"
+echo "%endif"
+echo "%ifarch x86_64"
+echo "%define kbuild_image arch/x86/boot/bzImage"
+echo "%endif"
+echo "%ifarch ppc64"
+echo "%define kbuild_image vmlinux"
+echo "%endif"
+echo "%ifarch s390"
+echo "%define kbuild_image arch/s390/boot/image"
+echo "%endif"
+echo "%ifarch s390x"
+echo "%define kbuild_image arch/s390/boot/image"
+echo "%endif"
+echo "%ifarch sparc64"
+echo "%define kbuild_image arch/sparc/boot/image"
+echo "%endif"
+echo "%ifarch ppc"
+echo "%define kbuild_image vmlinux"
+echo "%endif"
+echo "%ifarch ia64"
+echo "%define boot boot/efi"
+echo "%define kbuild_image vmlinux.gz"
+echo "%endif"
+echo "%ifarch alpha alphaev56"
+echo "%define kbuild_image vmlinux"
+echo "%endif"
+echo "%ifarch %{arm}"
+echo "%define kbuild_image vmlinux"
+echo "%endif"
 
 if ! $PREBUILT; then
 echo "%prep"
@@ -74,26 +106,11 @@ echo ""
 fi
 
 echo "%install"
-echo "%ifarch ia64"
-echo 'mkdir -p $RPM_BUILD_ROOT/boot/efi $RPM_BUILD_ROOT/lib/modules'
+echo 'mkdir -p $RPM_BUILD_ROOT/%{boot} $RPM_BUILD_ROOT/lib/modules'
 echo 'mkdir -p $RPM_BUILD_ROOT/lib/firmware'
-echo "%else"
-echo 'mkdir -p $RPM_BUILD_ROOT/boot $RPM_BUILD_ROOT/lib/modules'
-echo 'mkdir -p $RPM_BUILD_ROOT/lib/firmware'
-echo "%endif"
 
 echo 'INSTALL_MOD_PATH=$RPM_BUILD_ROOT make %{?_smp_mflags} KBUILD_SRC= modules_install'
-echo "%ifarch ia64"
-echo 'cp $KBUILD_IMAGE $RPM_BUILD_ROOT'"/boot/efi/vmlinuz-$KERNELRELEASE"
-echo 'ln -s '"efi/vmlinuz-$KERNELRELEASE" '$RPM_BUILD_ROOT'"/boot/"
-echo "%else"
-echo "%ifarch ppc64"
-echo "cp vmlinux arch/powerpc/boot"
-echo "cp arch/powerpc/boot/"'$KBUILD_IMAGE $RPM_BUILD_ROOT'"/boot/vmlinuz-$KERNELRELEASE"
-echo "%else"
-echo 'cp $KBUILD_IMAGE $RPM_BUILD_ROOT'"/boot/vmlinuz-$KERNELRELEASE"
-echo "%endif"
-echo "%endif"
+echo 'cp %{kbuild_image} $RPM_BUILD_ROOT'"/%{boot}/vmlinuz-$KERNELRELEASE"
 
 echo 'make %{?_smp_mflags} INSTALL_HDR_PATH=$RPM_BUILD_ROOT/usr KBUILD_SRC= headers_install'
 echo 'cp System.map $RPM_BUILD_ROOT'"/boot/System.map-$KERNELRELEASE"

