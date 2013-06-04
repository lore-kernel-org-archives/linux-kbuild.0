Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:44533 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750748Ab3FDSAb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 4 Jun 2013 14:00:31 -0400
Subject: [PATCH 2] kbuild: fix error when building from src rpm
From: Mike Marciniszyn <mike.marciniszyn@intel.com>
Date: Tue, 04 Jun 2013 14:00:26 -0400
Message-ID: <20130604180026.12438.55336.stgit@phlsvslse11.ph.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

The following issue can be reproduced with Linus' tree.

+ cp /home/user/rpmbuild-test/BUILDROOT/kernel-3.9.2.x86_64/boot/vmlinuz-3.9.2
cp: missing destination file operand after
`/home/user/rpmbuild-test/BUILDROOT/kernel-3.9.2-1.x86_64/boot/vmlinuz-3.9.2'
Try `cp --help' for more information.
error: Bad exit status from /var/tmp/rpm-tmp.R4o0iI (%install)

make defconfig
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/zconf.tab.o
  HOSTLD  scripts/kconfig/conf
*** Default configuration is based on 'x86_64_defconfig'
#
# configuration written to .config
#
make rpm-pkg

Use the resulting src rpm to build as follows:

mkdir ~/rpmbuild-test
cd ~/rpmbuild-test

rpmbuild --rebuild --define "_topdir `pwd`" -vv
~/rpmbuild/SRPMS/kernel-3.10.0_rc1+-1.src.rpm

The issue is because the %install script uses $KBUILD_IMAGE and it hasn't
been set.

	echo 'cp $KBUILD_IMAGE $RPM_BUILD_ROOT'"/boot/vmlinuz-$KERNELRELEASE"

It probably isn't as simple as allowing it to come from the environment, since
it might be architecture specific.

This patch changes the manual install code to user the kernel's make install
with an INSTALL_PATH override.   installkernel with then install the
files into $RPM_BUILD_ROOT/boot.

Signed-off-by: Mike Marciniszyn <mike.marciniszyn@intel.com>
---
 scripts/package/mkspec |   12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index fbbfd08..9b4f209 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -83,17 +83,7 @@ echo 'mkdir -p $RPM_BUILD_ROOT/lib/firmware'
 echo "%endif"
 
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
+echo 'INSTALL_PATH=$RPM_BUILD_ROOT/boot make %{?_smp_mflags} KBUILD_SRC= install'
 
 echo 'make %{?_smp_mflags} INSTALL_HDR_PATH=$RPM_BUILD_ROOT/usr KBUILD_SRC= headers_install'
 echo 'cp System.map $RPM_BUILD_ROOT'"/boot/System.map-$KERNELRELEASE"

