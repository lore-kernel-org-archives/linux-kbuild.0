Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:46098 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728741AbgAUKB4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Jan 2020 05:01:56 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: bcm2835: Drop select of nonexistent HAVE_ARM_ARCH_TIMER
Date: Tue, 21 Jan 2020 11:01:50 +0100
Message-Id: <20200121100150.31660-1-geert+renesas@glider.be>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, Eric Anholt <eric@anholt.net>, Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <masahiroy@kernel.org>, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-kbuild@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

Unlike on arm32, the HAVE_ARM_ARCH_TIMER config symbol does not exist on
arm64.

Note that the toplevel ARM64 symbol always selects ARM_ARCH_TIMER, so
support for it is always included.

Fixes: 628d30d1ccb897fe ("arm64: Add platform selection for BCM2835.")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Manually reverting f072181e6403b0fe ("kconfig: drop the ""trying to assign
nonexistent symbol" warning") does not help.

 arch/arm64/Kconfig.platforms | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index b2b504ea6fd69495..ad4335122e70a3b7 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -39,7 +39,6 @@ config ARCH_BCM2835
 	select ARM_AMBA
 	select ARM_GIC
 	select ARM_TIMER_SP804
-	select HAVE_ARM_ARCH_TIMER
 	help
 	  This enables support for the Broadcom BCM2837 and BCM2711 SoC.
 	  These SoCs are used in the Raspberry Pi 3 and 4 devices.
-- 
2.17.1
