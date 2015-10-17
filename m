Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:34862 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751201AbbJQAJ2 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 16 Oct 2015 20:09:28 -0400
From: Jim Davis <jim.epost@gmail.com>
Subject: [PATCH] scripts/package/Makefile: Restore the RPMOPTS variable
Date: Fri, 16 Oct 2015 17:09:09 -0700
Message-Id: <1445040549-31011-1-git-send-email-jim.epost@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: alaa.hl2@gmail.com

Restore the RPMOPTS variable to the rpm-pkg and binrpm-pkg targets
that commit 21a59991ce0c ("scripts/package/Makefile: rpmbuild is
needed for rpm targets") removed.

Reported-by: Alaa Hleihel <alaa.hl2@gmail.com>
Signed-off-by: Jim Davis <jim.epost@gmail.com>
---
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
2.1.4

