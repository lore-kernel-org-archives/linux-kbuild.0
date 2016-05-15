Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:44254 "EHLO mga04.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753994AbcEODJD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 14 May 2016 23:09:03 -0400
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH] scripts/package/Makefile: rpmbuild add support of RPMOPTS
Date: Sat, 14 May 2016 20:09:52 -0700
Message-Id: <1463281792-19129-1-git-send-email-srinivas.pandruvada@linux.intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com, jim.epost@gmail.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, stable@vger.kernel.org

After commit 21a59991ce0c ("scripts/package/Makefile: rpmbuild is needed
for rpm targets"), it is no longer possible to specify RPMOPTS.
For example, we can no longer able to control _topdir using the following
make command.
make RPMOPTS="--define '_topdir /home/xyz/workspace/'" binrpm-pkg

Fixes: 21a59991ce0c ("scripts/package/Makefile: rpmbuild is needed
for rpm targets")
Cc: <stable@vger.kernel.org> # 4.3+
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 scripts/package/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index c2c7389..71b4a8a 100644
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
2.5.5

