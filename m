Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37357 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755142AbbJOGFy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 15 Oct 2015 02:05:54 -0400
From: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] scripts/kconfig/Makefile: Fix KBUILD_DEFCONFIG check when building with O=
Date: Thu, 15 Oct 2015 17:05:50 +1100
Message-Id: <1444889150-23609-1-git-send-email-mpe@ellerman.id.au>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linuxppc-dev@ozlabs.org
Cc: Olof Johannsson <olof@lixom.net>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, yann.morin.1998@free.fr, mmarek@suse.com

My recent commit d2036f30cfe1 ("scripts/kconfig/Makefile: Allow
KBUILD_DEFCONFIG to be a target"), contained a bug in that when it
checks if KBUILD_DEFCONFIG is a file it forgets to prepend $(srctree) to
the path.

This causes the build to fail when building out of tree (with O=), and
when the value of KBUILD_DEFCONFIG is 'defconfig'. In that case we will
fail to find the 'defconfig' file, because we look in the build
directory not $(srctree), and so we will call Make again with
'defconfig' as the target. From there we loop infinitely calling 'make
defconfig' again and again.

The fix is simple, we need to look for the file under $(srctree).

Fixes: d2036f30cfe1 ("scripts/kconfig/Makefile: Allow KBUILD_DEFCONFIG to be a target")
Reported-by: Olof Johansson <olof@lixom.net>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 scripts/kconfig/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


This works for me and is a minimal fix. I'll merge this into the powerpc#next
branch unless anyone yells.

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index b2b9c87cec50..3043d6b0b51d 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -96,7 +96,7 @@ savedefconfig: $(obj)/conf
 defconfig: $(obj)/conf
 ifeq ($(KBUILD_DEFCONFIG),)
 	$< $(silent) --defconfig $(Kconfig)
-else ifneq ($(wildcard arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)),)
+else ifneq ($(wildcard $(srctree)/arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)),)
 	@$(kecho) "*** Default configuration is based on '$(KBUILD_DEFCONFIG)'"
 	$(Q)$< $(silent) --defconfig=arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG) $(Kconfig)
 else
-- 
2.1.4

