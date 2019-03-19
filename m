Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from so254-39.mailgun.net ([198.61.254.39]:53257 "EHLO
        so254-39.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726876AbfCSPBh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Mar 2019 11:01:37 -0400
From: Major Hayden <major@redhat.com>
Subject: [PATCH] scripts/package/Makefile: Add source RPM target
Date: Tue, 19 Mar 2019 09:56:08 -0500
Message-Id: <20190319145608.18636-1-major@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, michal.lkml@markovi.net, yamada.masahiro@socionext.com
Cc: Major Hayden <major@redhat.com>

Some developers use external build systems to compile kernels and these
build systems may accept a source RPM as an input. This patch adds a
quick method for developers to build a source RPM using `make srpm-pkg`.

Signed-off-by: Major Hayden <major@redhat.com>
---
 scripts/package/Makefile | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 2c6de21e5152..8329d6dfe3d8 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -47,6 +47,14 @@ tar -cz $(RCS_TAR_IGNORE) -f $(2).tar.gz \
 	--transform 's:^:$(2)/:S' $(TAR_CONTENT) $(3); \
 rm -f $(objtree)/.scmversion
 
+# srpm-pkg
+# ---------------------------------------------------------------------------
+srpm-pkg: FORCE
+	$(MAKE) clean
+	$(CONFIG_SHELL) $(MKSPEC) >$(objtree)/kernel.spec
+	$(call cmd,src_tar,$(KERNELPATH),kernel.spec)
+	+rpmbuild $(RPMOPTS) -ts $(KERNELPATH).tar.gz
+
 # rpm-pkg
 # ---------------------------------------------------------------------------
 rpm-pkg: FORCE
@@ -140,6 +148,7 @@ perf-%pkg: FORCE
 help: FORCE
 	@echo '  rpm-pkg             - Build both source and binary RPM kernel packages'
 	@echo '  binrpm-pkg          - Build only the binary kernel RPM package'
+	@echo '  srpm-pkg            - Build only the source kernel RPM package'
 	@echo '  deb-pkg             - Build both source and binary deb kernel packages'
 	@echo '  bindeb-pkg          - Build only the binary kernel deb package'
 	@echo '  snap-pkg            - Build only the binary kernel snap package (will connect to external hosts)'
-- 
2.20.1
