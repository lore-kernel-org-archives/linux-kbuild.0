Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:34512 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751451AbbIBJ5M (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 2 Sep 2015 05:57:12 -0400
Received: by lbbmp1 with SMTP id mp1so2905050lbb.1
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Sep 2015 02:57:10 -0700 (PDT)
From: riku.voipio@linaro.org
Subject: [PATCH] package/Makefile: move source tar creation to a function
Date: Wed,  2 Sep 2015 12:57:08 +0300
Message-Id: <1441187828-10599-1-git-send-email-riku.voipio@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, mmarek@suse.cz
Cc: Riku Voipio <riku.voipio@linaro.org>

From: Riku Voipio <riku.voipio@linaro.org>

Split source tarball creation from rpm-pkg target
so it can be used from deb-pkg target as well. As
added bonus, we can now pretty print TAR the name of
tarball created in quiet mode

This patch prepares the groundwork for deb-pkg source
package adding bit.

Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
v2: don't use tar --transform anymore
 scripts/package/Makefile | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 8b11d5a..297e756 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -24,27 +24,30 @@
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
+ln -sf $(srctree) $(2); \
+tar -cz $(RCS_TAR_IGNORE) -f $(2).tar.gz \
+	$(addprefix $(2)/,$(TAR_CONTENT) $(3)); \
+rm -f $(2) $(objtree)/.scmversion
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

