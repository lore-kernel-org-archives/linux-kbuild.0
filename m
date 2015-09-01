Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-la0-f49.google.com ([209.85.215.49]:35009 "EHLO
	mail-la0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751141AbbIANs7 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 1 Sep 2015 09:48:59 -0400
Received: by lanb10 with SMTP id b10so57888573lan.2
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Sep 2015 06:48:57 -0700 (PDT)
From: riku.voipio@linaro.org
Subject: [PATCH] package/Makefile: move source tar creation to a function
Date: Tue,  1 Sep 2015 16:48:54 +0300
Message-Id: <1441115335-25165-1-git-send-email-riku.voipio@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, mmarek@suse.cz
Cc: Riku Voipio <riku.voipio@linaro.org>

From: Riku Voipio <riku.voipio@linaro.org>

Split source tarball creation from rpm-pkg target
so it can be used from deb-pkg target as well. Other
improvements:

- Replace symlink to self with tar --transform
- Print the name of tarball created in quiet mode

This patch prepares the groundwork for deb-pkg source
package adding bit.

Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
 scripts/package/Makefile | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 8b11d5a..65cf12d 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -24,27 +24,29 @@
 # Remove hyphens since they have special meaning in RPM filenames
 KERNELPATH := kernel-$(subst -,_,$(KERNELRELEASE))
 # Include only those top-level files that are needed by make, plus the GPL copy
-TAR_CONTENT := $(KBUILD_ALLDIRS) kernel.spec .config .scmversion Makefile \
+TAR_CONTENT := $(KBUILD_ALLDIRS) .config .scmversion Makefile \
                Kbuild Kconfig COPYING $(wildcard localversion*)
-TAR_CONTENT := $(addprefix $(KERNELPATH)/,$(TAR_CONTENT))
 MKSPEC     := $(srctree)/scripts/package/mkspec
 
+quiet_cmd_src_tar = TAR     $(2).tar.gz
+      cmd_src_tar = \
+if test "$(objtree)" != "$(srctree)"; then \
+	echo "Building source tarball is not possible outside the"; \
+	echo "kernel source tree. Don't set KBUILD_OUTPUT, or use the"; \
+	echo "binrpm-pkg or bindeb-pkg target instead."; \
+	false; \
+fi ; \
+$(srctree)/scripts/setlocalversion --save-scmversion; \
+tar -cz $(RCS_TAR_IGNORE) --transform 's,^,$(2)/,' \
+    -f $(2).tar.gz $(TAR_CONTENT) $(3);\
+rm -f $(objtree)/.scmversion
+
 # rpm-pkg
 # ---------------------------------------------------------------------------
 rpm-pkg rpm: FORCE
-	@if test "$(objtree)" != "$(srctree)"; then \
-		echo "Building source + binary RPM is not possible outside the"; \
-		echo "kernel source tree. Don't set KBUILD_OUTPUT, or use the"; \
-		echo "binrpm-pkg target instead."; \
-		false; \
-	fi
 	$(MAKE) clean
-	ln -sf $(srctree) $(KERNELPATH)
 	$(CONFIG_SHELL) $(MKSPEC) >$(objtree)/kernel.spec
-	$(CONFIG_SHELL) $(srctree)/scripts/setlocalversion --save-scmversion
-	tar -cz $(RCS_TAR_IGNORE) -f $(KERNELPATH).tar.gz $(TAR_CONTENT)
-	rm $(KERNELPATH)
-	rm -f $(objtree)/.scmversion
+	$(call cmd,src_tar,$(KERNELPATH),kernel.spec)
 	$(CONFIG_SHELL) $(srctree)/scripts/mkversion > $(objtree)/.tmp_version
 	mv -f $(objtree)/.tmp_version $(objtree)/.version
 	rpmbuild --target $(UTS_MACHINE) -ta $(KERNELPATH).tar.gz
-- 
2.4.6

