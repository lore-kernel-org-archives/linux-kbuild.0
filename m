Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr10078.outbound.protection.outlook.com ([40.107.1.78]:25466
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727369AbfAGTbq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Jan 2019 14:31:46 -0500
From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: [PATCH 3/3] arm64: dts: freescale: Use wilddt function
Date: Mon, 7 Jan 2019 19:31:29 +0000
Message-ID: <3678c8f380da308469d6cdcda9938ce79f94d3ed.1546888138.git.leonard.crestez@nxp.com>
References: <cover.1546888138.git.leonard.crestez@nxp.com>
In-Reply-To: <cover.1546888138.git.leonard.crestez@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>, Shawn Guo <shawnguo@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Fabio Estevam <fabio.estevam@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, Leo Li <leoyang.li@nxp.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Use the wilddt function instead of listing dts files. This shrinks the
makefile and avoids needing future changes when boards are added.

Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/f=
reescale/Makefile
index f9be2426f83c..ab28e485179d 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -1,22 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls1012a-frdm.dtb
-dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls1012a-frwy.dtb
-dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls1012a-qds.dtb
-dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls1012a-rdb.dtb
-dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls1028a-qds.dtb
-dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls1028a-rdb.dtb
-dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls1043a-qds.dtb
-dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls1043a-rdb.dtb
-dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls1046a-qds.dtb
-dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls1046a-rdb.dtb
-dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls1088a-qds.dtb
-dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls1088a-rdb.dtb
-dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls2080a-qds.dtb
-dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls2080a-rdb.dtb
-dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls2080a-simu.dtb
-dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls2088a-qds.dtb
-dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls2088a-rdb.dtb
-dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-lx2160a-qds.dtb
-dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-lx2160a-rdb.dtb
-
-dtb-$(CONFIG_ARCH_MXC) +=3D imx8mq-evk.dtb
+dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D \
+	$(call wilddt,fsl-ls*) \
+	$(call wilddt,fsl-lx*)
+dtb-$(CONFIG_ARCH_MXC) +=3D $(call wilddt,imx*)
--=20
2.17.1
