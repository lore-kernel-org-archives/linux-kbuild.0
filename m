Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg009.nifty.com ([202.248.44.35]:57526 "EHLO
	conuserg009-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751803AbbCMGWW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 13 Mar 2015 02:22:22 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/6] kbuild: mergeconfig: fix "jobserver unavailable" warning
Date: Fri, 13 Mar 2015 15:21:38 +0900
Message-Id: <1426227703-31815-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1426227703-31815-1-git-send-email-yamada.masahiro@socionext.com>
References: <1426227703-31815-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Josh Boyer <jwboyer@redhat.com>, Darren Hart <dvhart@linux.intel.com>, john stultz <johnstul@us.ibm.com>, Michal Marek <mmarek@suse.cz>, Josh Triplett <josh@joshtriplett.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, "Yann E. MORIN" <yann.morin.1998@free.fr>

If "make kvmconfig" is run with "-j" option, a warning message,
"jobserver unavailable: using -j1.  Add `+' to parent make rule.",
is displayed.

  $ make -s defconfig
  *** Default configuration is based on 'x86_64_defconfig'
  #
  # configuration written to .config
  #
  $ make -j8 kvmconfig
  Using ./.config as base
  Merging ./arch/x86/configs/kvm_guest.config
    [ snip ]
  #
  # merged configuration written to ./.config (needs make)
  #
  make[2]: warning: jobserver unavailable: using -j1.  Add `+' to
  parent make rule.
  scripts/kconfig/conf --oldconfig Kconfig
    [ snip ]
  #
  # configuration written to .config
  #

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 9645c07..fc34f46 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -110,7 +110,7 @@ define mergeconfig
 $(if $(wildcard $(objtree)/.config),, $(error You need an existing .config for this target))
 $(if $(call configfiles,$(1)),, $(error No configuration exists for this target on this architecture))
 $(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m -O $(objtree) $(objtree)/.config $(call configfiles,$(1))
-$(Q)yes "" | $(MAKE) -f $(srctree)/Makefile oldconfig
++$(Q)yes "" | $(MAKE) -f $(srctree)/Makefile oldconfig
 endef
 
 PHONY += kvmconfig
-- 
1.9.1

