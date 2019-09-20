Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:33788 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405208AbfITTB3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Sep 2019 15:01:29 -0400
From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH] kbuild: binrpm-pkg: Propagate O= to rpmbuild
Date: Fri, 20 Sep 2019 13:01:02 -0600
Message-Id: <1569006062-17862-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>

If the user specifies O= to indicate a specific output directory for the
build, rpmbuild does not honor this, and will use its default, which could
be the user's home directory.  In cases where the user has limited home
directory space, this could cause the build to outright fail.

In the case of the binrpm-pkg target, redefine the top directory for output
to be what the user specified in O=, thus the user will find a "rpmbuild"
subdirectory in that location with all of the RPM artifacts.

This does not apply to rpm-pkg, since we already cannot handle creating
the source tarball out of tree.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 scripts/Makefile.package | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index 56eadcc..aab0711 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -21,7 +21,7 @@ include $(srctree)/scripts/Kbuild.include
 # - Use /. to avoid tar packing just the symlink
 
 # Note that the rpm-pkg target cannot be used with KBUILD_OUTPUT,
-# but the binrpm-pkg target can; for some reason O= gets ignored.
+# but the binrpm-pkg target can
 
 # Remove hyphens since they have special meaning in RPM filenames
 KERNELPATH := kernel-$(subst -,_,$(KERNELRELEASE))
@@ -33,6 +33,12 @@ TAR_CONTENT := $(KBUILD_ALLDIRS) .config .scmversion Makefile \
                Kbuild Kconfig COPYING $(wildcard localversion*)
 MKSPEC     := $(srctree)/scripts/package/mkspec
 
+RPM_OUTDIR :=
+ifneq ($(objtree),$(srctree))
+# Using absolute path as relative path will cause parts of rpmbuild to fail
+        RPM_OUTDIR := --define "_topdir $(abs_objtree)/rpmbuild"
+endif
+
 quiet_cmd_src_tar = TAR     $(2).tar.gz
       cmd_src_tar = \
 if test "$(objtree)" != "$(srctree)"; then \
@@ -65,8 +71,8 @@ PHONY += binrpm-pkg
 binrpm-pkg:
 	$(MAKE) -f $(srctree)/Makefile
 	$(CONFIG_SHELL) $(MKSPEC) prebuilt > $(objtree)/binkernel.spec
-	+rpmbuild $(RPMOPTS) --define "_builddir $(objtree)" --target \
-		$(UTS_MACHINE) -bb $(objtree)/binkernel.spec
+	+rpmbuild $(RPMOPTS) --define "_builddir $(objtree)" $(RPM_OUTDIR) \
+		--target $(UTS_MACHINE) -bb $(objtree)/binkernel.spec
 
 PHONY += deb-pkg
 deb-pkg:
-- 
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
