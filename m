Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:35105 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752026AbdHPLI7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Aug 2017 07:08:59 -0400
Received: by mail-lf0-f52.google.com with SMTP id t128so14958929lff.2
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Aug 2017 04:08:59 -0700 (PDT)
From: riku.voipio@linaro.org
Subject: [PATCH 1/2] scripts/package/Makefile: make revision update a function
Date: Wed, 16 Aug 2017 14:08:54 +0300
Message-Id: <20170816110855.6021-1-riku.voipio@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, mmarek@suse.com
Cc: yamada.masahiro@socionext.com, debian-kernel@lists.debian.org, Riku Voipio <riku.voipio@linaro.org>

From: Riku Voipio <riku.voipio@linaro.org>

The updated deb-pkg and bindeb-pkg will use the same snippet,
so make it reusable.

Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
 scripts/package/Makefile | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 71b4a8af9d4d..9867638896ad 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -44,14 +44,18 @@ tar -cz $(RCS_TAR_IGNORE) -f $(2).tar.gz \
 	$(addprefix $(2)/,$(TAR_CONTENT) $(3)); \
 rm -f $(2) $(objtree)/.scmversion
 
+quiet_cmd_updateversion = UPDATEVERSION
+      cmd_updateversion = \
+	$(CONFIG_SHELL) $(srctree)/scripts/mkversion > $(objtree)/.tmp_version; \
+	mv -f $(objtree)/.tmp_version $(objtree)/.version
+
 # rpm-pkg
 # ---------------------------------------------------------------------------
 rpm-pkg rpm: FORCE
 	$(MAKE) clean
 	$(CONFIG_SHELL) $(MKSPEC) >$(objtree)/kernel.spec
 	$(call cmd,src_tar,$(KERNELPATH),kernel.spec)
-	$(CONFIG_SHELL) $(srctree)/scripts/mkversion > $(objtree)/.tmp_version
-	mv -f $(objtree)/.tmp_version $(objtree)/.version
+	$(call cmd,updateversion)
 	rpmbuild $(RPMOPTS) --target $(UTS_MACHINE) -ta $(KERNELPATH).tar.gz
 	rm $(KERNELPATH).tar.gz kernel.spec
 
@@ -60,9 +64,7 @@ rpm-pkg rpm: FORCE
 binrpm-pkg: FORCE
 	$(MAKE) KBUILD_SRC=
 	$(CONFIG_SHELL) $(MKSPEC) prebuilt > $(objtree)/binkernel.spec
-	$(CONFIG_SHELL) $(srctree)/scripts/mkversion > $(objtree)/.tmp_version
-	mv -f $(objtree)/.tmp_version $(objtree)/.version
-
+	$(call cmd,updateversion)
 	rpmbuild $(RPMOPTS) --define "_builddir $(objtree)" --target \
 		$(UTS_MACHINE) -bb $(objtree)/binkernel.spec
 	rm binkernel.spec
-- 
2.11.0

