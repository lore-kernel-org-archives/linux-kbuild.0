Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg009.nifty.com ([202.248.44.35]:58022 "EHLO
	conuserg009-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752038AbbCMGWc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 13 Mar 2015 02:22:32 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 3/6] kbuild: mergeconfig: remove redundant $(objtree)
Date: Fri, 13 Mar 2015 15:21:40 +0900
Message-Id: <1426227703-31815-4-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1426227703-31815-1-git-send-email-yamada.masahiro@socionext.com>
References: <1426227703-31815-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Josh Boyer <jwboyer@redhat.com>, Darren Hart <dvhart@linux.intel.com>, john stultz <johnstul@us.ibm.com>, Michal Marek <mmarek@suse.cz>, Josh Triplett <josh@joshtriplett.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, "Yann E. MORIN" <yann.morin.1998@free.fr>

Kbuild always runs in $(objtree).  Actually, $(objtree) is always
set to "." by the top-level Makefile.

We can omit "-O $(objtree)" and "$(objtree)/".

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index be0fad4..b0e4be2 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -108,7 +108,7 @@ configfiles=$(wildcard $(srctree)/kernel/configs/$(1).config $(srctree)/arch/$(S
 
 define mergeconfig
 $(if $(call configfiles,$(1)),, $(error No configuration exists for this target on this architecture))
-$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m -O $(objtree) $(objtree)/.config $(call configfiles,$(1))
+$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m .config $(call configfiles,$(1))
 +$(Q)yes "" | $(MAKE) -f $(srctree)/Makefile oldconfig
 endef
 
-- 
1.9.1

