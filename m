Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:58601 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750791Ab3FXMsj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 24 Jun 2013 08:48:39 -0400
Subject: [PATCH v7] kbuild: fix error when building from src rpm
From: Mike Marciniszyn <mike.marciniszyn@intel.com>
Date: Mon, 24 Jun 2013 08:48:37 -0400
Message-ID: <20130624124836.31126.67401.stgit@phlsvslse11.ph.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org, mmarcini@yahoo.com

The following issue can be reproduced with Linus' tree on
an x86_64 server.

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

This patch adds a Makefile target to emit the image_name that can be used
and modifies the mkspec to use the dynamic name in %install.

Signed-off-by: Mike Marciniszyn <mike.marciniszyn@intel.com>
---
 Makefile               |    6 +++++-
 scripts/package/mkspec |    1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index cd11e88..6280aa1 100644
--- a/Makefile
+++ b/Makefile
@@ -1116,6 +1116,7 @@ help:
 	@echo  '  gtags           - Generate GNU GLOBAL index'
 	@echo  '  kernelrelease	  - Output the release version string'
 	@echo  '  kernelversion	  - Output the version stored in Makefile'
+	@echo  '  image_name	  - Output the image name'
 	@echo  '  headers_install - Install sanitised kernel headers to INSTALL_HDR_PATH'; \
 	 echo  '                    (default: $(INSTALL_HDR_PATH))'; \
 	 echo  ''
@@ -1310,7 +1311,7 @@ export_report:
 endif #ifeq ($(config-targets),1)
 endif #ifeq ($(mixed-targets),1)
 
-PHONY += checkstack kernelrelease kernelversion
+PHONY += checkstack kernelrelease kernelversion image_name
 
 # UML needs a little special treatment here.  It wants to use the host
 # toolchain, so needs $(SUBARCH) passed to checkstack.pl.  Everyone
@@ -1331,6 +1332,9 @@ kernelrelease:
 kernelversion:
 	@echo $(KERNELVERSION)
 
+image_name:
+	@echo $(KBUILD_IMAGE)
+
 # Clear a bunch of variables before executing the submake
 tools/: FORCE
 	$(Q)mkdir -p $(objtree)/tools
diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index fbbfd08..fdd3fbf 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -74,6 +74,7 @@ echo ""
 fi
 
 echo "%install"
+echo 'KBUILD_IMAGE=$(make image_name)'
 echo "%ifarch ia64"
 echo 'mkdir -p $RPM_BUILD_ROOT/boot/efi $RPM_BUILD_ROOT/lib/modules'
 echo 'mkdir -p $RPM_BUILD_ROOT/lib/firmware'

