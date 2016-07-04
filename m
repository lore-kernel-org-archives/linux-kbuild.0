Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:52842 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750713AbcGDOXd (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 4 Jul 2016 10:23:33 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] [RFC] Kbuild: avoid "make tinyconfig" warnings
Date: Mon,  4 Jul 2016 16:25:55 +0200
Message-Id: <20160704142608.2069991-1-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Josh Triplett <josh@joshtriplett.org>, Darren Hart <dvhart@linux.intel.com>, linux-kbuild@vger.kernel.org, kernel-build-reports@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>, Michal Marek <mmarek@suse.com>, Thiago Macieira <thiago.macieira@intel.com>, linux-kernel@vger.kernel.org

The introduction of "make *.config" as a shorthand for merging configuration
files unfortunately introduced some build warnings that we see in every
single run of the various build bots testing tinyconfig:

.config:966:warning: override: NOHIGHMEM changes choice state
.config:965:warning: override: SLOB changes choice state
.config:963:warning: override: KERNEL_XZ changes choice state
.config:962:warning: override: CC_OPTIMIZE_FOR_SIZE changes choice state
.config:933:warning: override: SLOB changes choice state
.config:930:warning: override: CC_OPTIMIZE_FOR_SIZE changes choice state
.config:870:warning: override: SLOB changes choice state
.config:868:warning: override: KERNEL_XZ changes choice state
.config:867:warning: override: CC_OPTIMIZE_FOR_SIZE changes choice state

This changes the behavior for tinyconfig again, so we call the special
allnoconfig target directly, with the fragment as the KCONFIG_ALLCONFIG
file so it gets merged into the configuration. The disadvantage of
this approach is that we cannot pass another KCONFIG_ALLCONFIG on
the command line, that would again have to be done using the mergeconfig
script afterwards.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Fixes: 63a91033d52e ("kbuild: add generic mergeconfig target, %.config")
Link: https://storage.kernelci.org/mainline/v4.7-rc6/x86-tinyconfig/build.log
---
 scripts/kconfig/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index ebced77deb9c..35d0e191fe3f 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -125,8 +125,8 @@ xenconfig: xen.config
 	@:
 
 PHONY += tinyconfig
-tinyconfig:
-	$(Q)$(MAKE) -f $(srctree)/Makefile allnoconfig tiny.config
+tinyconfig: $(obj)/conf
+	$(Q)$(MAKE) -f $(srctree)/Makefile allnoconfig KCONFIG_ALLCONFIG=$(wildcard $(srctree)/kernel/configs/tiny.config $(srctree)/arch/$(SRCARCH)/configs/tiny.config)
 
 # Help text used by make help
 help:
-- 
2.9.0

