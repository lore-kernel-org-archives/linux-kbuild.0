Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:34679 "EHLO
	mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934126AbbKTAFa (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 19 Nov 2015 19:05:30 -0500
From: Jim Davis <jim.epost@gmail.com>
Subject: [PATCH v2] scripts/package/Makefile: Restore the RPMOPTS variable
Date: Thu, 19 Nov 2015 17:05:15 -0700
Message-Id: <1447977915-12925-1-git-send-email-jim.epost@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: alaa.hl2@gmail.com

Restore the RPMOPTS variable to the rpm-pkg and binrpm-pkg targets
that commit 21a59991ce0c ("scripts/package/Makefile: rpmbuild is
needed for rpm targets") removed.

Reported-by: Alaa Hleihel <alaa.hl2@gmail.com>
Fixes: 21a59991ce0c ("scripts/package/Makefile: rpmbuild is needed for rpm targets")
Signed-off-by: Jim Davis <jim.epost@gmail.com>
---
v2: Added a Fixes: line

 scripts/package/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 1aca224e8597..493e226356ca 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -52,7 +52,7 @@ rpm-pkg rpm: FORCE
 	$(call cmd,src_tar,$(KERNELPATH),kernel.spec)
 	$(CONFIG_SHELL) $(srctree)/scripts/mkversion > $(objtree)/.tmp_version
 	mv -f $(objtree)/.tmp_version $(objtree)/.version
-	rpmbuild --target $(UTS_MACHINE) -ta $(KERNELPATH).tar.gz
+	rpmbuild $(RPMOPTS) --target $(UTS_MACHINE) -ta $(KERNELPATH).tar.gz
 	rm $(KERNELPATH).tar.gz kernel.spec
 
 # binrpm-pkg
@@ -63,7 +63,7 @@ binrpm-pkg: FORCE
 	$(CONFIG_SHELL) $(srctree)/scripts/mkversion > $(objtree)/.tmp_version
 	mv -f $(objtree)/.tmp_version $(objtree)/.version
 
-	rpmbuild --define "_builddir $(objtree)" --target \
+	rpmbuild $(RPMOPTS) --define "_builddir $(objtree)" --target \
 		$(UTS_MACHINE) -bb $(objtree)/binkernel.spec
 	rm binkernel.spec
 
-- 
2.5.0

