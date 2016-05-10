Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:64280 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752092AbcEJVat (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 May 2016 17:30:49 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] kbuild: move -Wunused-const-variable to W=1 warning level
Date: Tue, 10 May 2016 23:30:01 +0200
Message-Id: <1462915821-2843456-1-git-send-email-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, stable@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, David Howells <dhowells@redhat.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Josh Poimboeuf <jpoimboe@redhat.com>, David Woodhouse <David.Woodhouse@intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org

gcc-6 started warning by default about variables that are not
used anywhere and that are marked 'const', generating many
false positives in an allmodconfig build, e.g.:

arch/arm/mach-davinci/board-da830-evm.c:282:20: warning: 'da830_evm_emif25_pins' defined but not used [-Wunused-const-variable=]
arch/arm/plat-omap/dmtimer.c:958:34: warning: 'omap_timer_match' defined but not used [-Wunused-const-variable=]
drivers/bluetooth/hci_bcm.c:625:39: warning: 'acpi_bcm_default_gpios' defined but not used [-Wunused-const-variable=]
drivers/char/hw_random/omap-rng.c:92:18: warning: 'reg_map_omap4' defined but not used [-Wunused-const-variable=]
drivers/devfreq/exynos/exynos5_bus.c:381:32: warning: 'exynos5_busfreq_int_pm' defined but not used [-Wunused-const-variable=]
drivers/dma/mv_xor.c:1139:34: warning: 'mv_xor_dt_ids' defined but not used [-Wunused-const-variable=]

This is similar to the existing -Wunused-but-set-variable warning
that was added in an earlier release and that we disable by default
now and only enable when W=1 is set, so it makes sense to do
the same here. Once we have eliminated the majority of the
warnings for both, we can put them back into the default list.

We probably want this in backport kernels as well, to allow building
them with gcc-6 without introducing extra warnings.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Cc: stable@vger.kernel.org
---
I had originally started testing with gcc-6 a while ago and turned off
this option in my build scripts because it was too noisy. I fixed all
the other warnings I got and forgot about it until Olof mentioned it
when he upgraded his build bot and the warnings started exploding.

 Makefile                   | 5 +++--
 scripts/Makefile.extrawarn | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index f7ccd8a40450..7934088c011b 100644
--- a/Makefile
+++ b/Makefile
@@ -708,9 +708,10 @@ KBUILD_CFLAGS += $(call cc-option, -mno-global-merge,)
 KBUILD_CFLAGS += $(call cc-option, -fcatch-undefined-behavior)
 else
 
-# This warning generated too much noise in a regular build.
-# Use make W=1 to enable this warning (see scripts/Makefile.build)
+# These warnings generated too much noise in a regular build.
+# Use make W=1 to enable them (see scripts/Makefile.build)
 KBUILD_CFLAGS += $(call cc-disable-warning, unused-but-set-variable)
+KBUILD_CFLAGS += $(call cc-disable-warning, unused-const-variable)
 endif
 
 ifdef CONFIG_FRAME_POINTER
diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index f9e47a70509c..53449a6ff6aa 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -24,6 +24,7 @@ warning-1 += $(call cc-option, -Wmissing-prototypes)
 warning-1 += -Wold-style-definition
 warning-1 += $(call cc-option, -Wmissing-include-dirs)
 warning-1 += $(call cc-option, -Wunused-but-set-variable)
+warning-1 += $(call cc-option, -Wunused-const-variable)
 warning-1 += $(call cc-disable-warning, missing-field-initializers)
 warning-1 += $(call cc-disable-warning, sign-compare)
 
-- 
2.7.0

