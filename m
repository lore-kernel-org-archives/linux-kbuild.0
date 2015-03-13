Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg009.nifty.com ([202.248.44.35]:57880 "EHLO
	conuserg009-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752032AbbCMGW3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 13 Mar 2015 02:22:29 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [RFC PATCH 6/6] kbuild: add generic mergeconfig target, %.config
Date: Fri, 13 Mar 2015 15:21:43 +0900
Message-Id: <1426227703-31815-7-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1426227703-31815-1-git-send-email-yamada.masahiro@socionext.com>
References: <1426227703-31815-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Josh Boyer <jwboyer@redhat.com>, Darren Hart <dvhart@linux.intel.com>, john stultz <johnstul@us.ibm.com>, Michal Marek <mmarek@suse.cz>, Josh Triplett <josh@joshtriplett.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, "Yann E. MORIN" <yann.morin.1998@free.fr>

"scripts/kconfig/merge_config.sh && make oldconfig" works well
enough for merging local config fragments, but Kbuild currently has
the entry points only for "kvmconfig" and "tinyconfig".

This commit provides the generic target for mergeconfig, so we can
manage our own config fragments easily:
put "foo.config" in arch/$(SRCARCH)/configs/ or kernel/configs/,
and then run "make foo.config".

Now "make kvmconfig" is just a shorthand of "make kvm_guest.config".
Likewise, "make tinyconfig" is equivalent to
"make allnoconfig tiny.config".

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Perhaps, "make foo_mergeconfig" is better than "make foo.config"?


 scripts/kconfig/Makefile | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index b0e4be2..cb2cf54 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -104,21 +104,20 @@ endif
 %_defconfig: $(obj)/conf
 	$(Q)$< --defconfig=arch/$(SRCARCH)/configs/$@ $(Kconfig)
 
-configfiles=$(wildcard $(srctree)/kernel/configs/$(1).config $(srctree)/arch/$(SRCARCH)/configs/$(1).config)
+configfiles=$(wildcard $(srctree)/kernel/configs/$@ $(srctree)/arch/$(SRCARCH)/configs/$@)
 
-define mergeconfig
-$(if $(call configfiles,$(1)),, $(error No configuration exists for this target on this architecture))
-$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m .config $(call configfiles,$(1))
-+$(Q)yes "" | $(MAKE) -f $(srctree)/Makefile oldconfig
-endef
+%.config: $(obj)/conf
+	$(if $(call configfiles),, $(error No configuration exists for this target on this architecture))
+	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m .config $(configfiles)
+	+$(Q)yes "" | $(MAKE) -f $(srctree)/Makefile oldconfig
 
 PHONY += kvmconfig
-kvmconfig:
-	$(call mergeconfig,kvm_guest)
+kvmconfig: kvm_guest.config
+	@:
 
 PHONY += tinyconfig
-tinyconfig: allnoconfig
-	$(call mergeconfig,tiny)
+tinyconfig:
+	$(Q)$(MAKE) -f $(srctree)/Makefile allnoconfig tiny.config
 
 # Help text used by make help
 help:
-- 
1.9.1

