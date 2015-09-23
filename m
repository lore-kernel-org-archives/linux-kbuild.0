Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40152 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751604AbbIWFkj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 23 Sep 2015 01:40:39 -0400
From: Michael Ellerman <mpe@ellerman.id.au>
Subject: [RFC PATCH 1/2] scripts/kconfig/Makefile: Allow KBUILD_DEFCONFIG to be a target
Date: Wed, 23 Sep 2015 15:40:34 +1000
Message-Id: <1442986835-13985-1-git-send-email-mpe@ellerman.id.au>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linuxppc-dev@ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, yann.morin.1998@free.fr, mmarek@suse.com

Arch Makefiles can set KBUILD_DEFCONFIG to tell kbuild the name of the
defconfig that should be built by default.

However currently there is an assumption that KBUILD_DEFCONFIG points to
a file at arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG).

We would like to use a target, using merge_config, as our defconfig, so
adapt the logic in scripts/kconfig/Makefile to allow that.

To minimise the chance of breaking anything, we first check if
KBUILD_DEFCONFIG is a file, and if so we do the old logic. If it's not a
file, then we call the top-level Makefile with KBUILD_DEFCONFIG as the
target.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 scripts/kconfig/Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index aceaaed09811..b2b9c87cec50 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -96,9 +96,12 @@ savedefconfig: $(obj)/conf
 defconfig: $(obj)/conf
 ifeq ($(KBUILD_DEFCONFIG),)
 	$< $(silent) --defconfig $(Kconfig)
-else
+else ifneq ($(wildcard arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)),)
 	@$(kecho) "*** Default configuration is based on '$(KBUILD_DEFCONFIG)'"
 	$(Q)$< $(silent) --defconfig=arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG) $(Kconfig)
+else
+	@$(kecho) "*** Default configuration is based on target '$(KBUILD_DEFCONFIG)'"
+	$(Q)$(MAKE) -f $(srctree)/Makefile $(KBUILD_DEFCONFIG)
 endif
 
 %_defconfig: $(obj)/conf
-- 
2.1.4

