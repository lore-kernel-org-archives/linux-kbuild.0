Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:53090 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750800AbdKEFdw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 5 Nov 2017 01:33:52 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/2] MIPS: dts: remove bogus bcm96358nb4ser.dtb from dtb-y entry
Date: Sun,  5 Nov 2017 14:30:52 +0900
Message-Id: <1509859853-27473-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1509859853-27473-1-git-send-email-yamada.masahiro@socionext.com>
References: <1509859853-27473-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

arch/mips/boot/dts/brcm/bcm96358nb4ser.dts does not exist, so
we cannot build bcm96358nb4ser.dtb .

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/mips/boot/dts/brcm/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/boot/dts/brcm/Makefile b/arch/mips/boot/dts/brcm/Makefile
index 69a69d1..ad76130 100644
--- a/arch/mips/boot/dts/brcm/Makefile
+++ b/arch/mips/boot/dts/brcm/Makefile
@@ -22,7 +22,6 @@ dtb-$(CONFIG_DT_NONE) += \
 	bcm63268-comtrend-vr-3032u.dtb \
 	bcm93384wvg.dtb \
 	bcm93384wvg_viper.dtb \
-	bcm96358nb4ser.dtb \
 	bcm96368mvwg.dtb \
 	bcm9ejtagprb.dtb \
 	bcm97125cbmb.dtb \
-- 
2.7.4

