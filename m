Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:64240 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756549Ab3FGQZo (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 7 Jun 2013 12:25:44 -0400
Subject: [PATCH v6] kbuild: fix error when building from src rpm
From: Mike Marciniszyn <mike.marciniszyn@intel.com>
Date: Fri, 07 Jun 2013 12:25:33 -0400
Message-ID: <20130607162533.19157.25779.stgit@phlsvslse11.ph.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org, mmarcini@yahoo.com

The following issue can be reproduced with Linus' tree on
and x86_64 server.

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
 Makefile               |    6 ++++++
 scripts/package/mkspec |    1 +
 2 files changed, 7 insertions(+)

diff --git a/Makefile b/Makefile
index cd11e88..5b2217c 100644
--- a/Makefile
+++ b/Makefile
@@ -1275,6 +1275,12 @@ clean: $(clean-dirs)
 		-o -name modules.builtin -o -name '.tmp_*.o.*' \
 		-o -name '*.gcno' \) -type f -print | xargs rm -f
 
+# For probing for image name
+# ---------------------------------------------------------------------------
+.PHONY += image_name
+image_name: FORCE
+	@echo $(KBUILD_IMAGE)
+
 # Generate tags for editors
 # ---------------------------------------------------------------------------
 quiet_cmd_tags = GEN     $@
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

