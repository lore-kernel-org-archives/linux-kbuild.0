Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:35875 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727283AbfHUHCU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Aug 2019 03:02:20 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/4] kbuild: pkg: add package targets to PHONY instead of FORCE
Date: Wed, 21 Aug 2019 16:02:03 +0900
Message-Id: <20190821070205.8297-2-yamada.masahiro@socionext.com>
In-Reply-To: <20190821070205.8297-1-yamada.masahiro@socionext.com>
References: <20190821070205.8297-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

These are not real targets. Adding them to PHONY is preferred.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/package/Makefile | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index a2d8830f54be..407189d9942a 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -50,7 +50,8 @@ rm -f $(objtree)/.scmversion
 
 # rpm-pkg
 # ---------------------------------------------------------------------------
-rpm-pkg: FORCE
+PHONY += rpm-pkg
+rpm-pkg:
 	$(MAKE) clean
 	$(CONFIG_SHELL) $(MKSPEC) >$(objtree)/kernel.spec
 	$(call cmd,src_tar,$(KERNELPATH),kernel.spec)
@@ -59,13 +60,15 @@ rpm-pkg: FORCE
 
 # binrpm-pkg
 # ---------------------------------------------------------------------------
-binrpm-pkg: FORCE
+PHONY += binrpm-pkg
+binrpm-pkg:
 	$(MAKE) -f $(srctree)/Makefile
 	$(CONFIG_SHELL) $(MKSPEC) prebuilt > $(objtree)/binkernel.spec
 	+rpmbuild $(RPMOPTS) --define "_builddir $(objtree)" --target \
 		$(UTS_MACHINE) -bb $(objtree)/binkernel.spec
 
-deb-pkg: FORCE
+PHONY += deb-pkg
+deb-pkg:
 	$(MAKE) clean
 	$(CONFIG_SHELL) $(srctree)/scripts/package/mkdebian
 	$(call cmd,src_tar,$(KDEB_SOURCENAME))
@@ -73,16 +76,19 @@ deb-pkg: FORCE
 		mv $(KDEB_SOURCENAME).tar.gz ../$(KDEB_SOURCENAME)_$${origversion}.orig.tar.gz
 	+dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) $(DPKG_FLAGS) -i.git -us -uc
 
-bindeb-pkg: FORCE
+PHONY += bindeb-pkg
+bindeb-pkg:
 	$(CONFIG_SHELL) $(srctree)/scripts/package/mkdebian
 	+dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) $(DPKG_FLAGS) -b -nc -uc
 
-intdeb-pkg: FORCE
+PHONY += intdeb-pkg
+intdeb-pkg:
 	+$(CONFIG_SHELL) $(srctree)/scripts/package/builddeb
 
 # snap-pkg
 # ---------------------------------------------------------------------------
-snap-pkg: FORCE
+PHONY += snap-pkg
+snap-pkg:
 	rm -rf $(objtree)/snap
 	mkdir $(objtree)/snap
 	$(MAKE) clean
@@ -96,7 +102,9 @@ snap-pkg: FORCE
 
 # tarball targets
 # ---------------------------------------------------------------------------
-tar%pkg: FORCE
+tar-pkgs := tar-pkg targz-pkg tarbz2-pkg tarxz-pkg
+PHONY += $(tar-pkgs)
+$(tar-pkgs):
 	$(MAKE) -f $(srctree)/Makefile
 	+$(CONFIG_SHELL) $(srctree)/scripts/package/buildtar $@
 
@@ -124,12 +132,15 @@ $(if $(findstring xz,$@),xz,                                        \
 $(error unknown target $@))))                                       \
 	-f -9 $(perf-tar).tar)
 
-perf-%pkg: FORCE
+perf-tar-pkgs := perf-tar-src-pkg perf-targz-src-pkg perf-tarbz2-src-pkg perf-tarxz-src-pkg
+PHONY += $(perf-tar-pkgs)
+$(perf-tar-pkgs):
 	$(call cmd,perf_tar)
 
 # Help text displayed when executing 'make help'
 # ---------------------------------------------------------------------------
-help: FORCE
+PHONY += help
+help:
 	@echo '  rpm-pkg             - Build both source and binary RPM kernel packages'
 	@echo '  binrpm-pkg          - Build only the binary kernel RPM package'
 	@echo '  deb-pkg             - Build both source and binary deb kernel packages'
-- 
2.17.1
