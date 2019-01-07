Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr10078.outbound.protection.outlook.com ([40.107.1.78]:25466
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726934AbfAGTbk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Jan 2019 14:31:40 -0500
From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: [PATCH 2/3] ARM: dts: imx: Use wilddt function
Date: Mon, 7 Jan 2019 19:31:28 +0000
Message-ID: <1b21795fa78829dd8aee3e9e257ff91d91a76d93.1546888138.git.leonard.crestez@nxp.com>
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

Use the wilddt function instead of listing imx6/7 dts files. This
shrinks the makefile and avoids needing future changes when boards are
added.

Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
---
 arch/arm/boot/dts/Makefile | 201 ++-----------------------------------
 1 file changed, 11 insertions(+), 190 deletions(-)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index bd40148a15b2..b71c8af4cd57 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -385,206 +385,27 @@ dtb-$(CONFIG_SOC_IMX53) +=3D \
 	imx53-tx53-x03x.dtb \
 	imx53-tx53-x13x.dtb \
 	imx53-usbarmory.dtb \
 	imx53-voipac-bsb.dtb
 dtb-$(CONFIG_SOC_IMX6Q) +=3D \
-	imx6dl-apf6dev.dtb \
-	imx6dl-aristainetos_4.dtb \
-	imx6dl-aristainetos_7.dtb \
-	imx6dl-aristainetos2_4.dtb \
-	imx6dl-aristainetos2_7.dtb \
-	imx6dl-colibri-eval-v3.dtb \
-	imx6dl-cubox-i.dtb \
-	imx6dl-cubox-i-emmc-som-v15.dtb \
-	imx6dl-cubox-i-som-v15.dtb \
-	imx6dl-dfi-fs700-m60.dtb \
-	imx6dl-emcon-avari.dtb \
-	imx6dl-gw51xx.dtb \
-	imx6dl-gw52xx.dtb \
-	imx6dl-gw53xx.dtb \
-	imx6dl-gw54xx.dtb \
-	imx6dl-gw551x.dtb \
-	imx6dl-gw552x.dtb \
-	imx6dl-gw553x.dtb \
-	imx6dl-gw560x.dtb \
-	imx6dl-gw5903.dtb \
-	imx6dl-gw5904.dtb \
-	imx6dl-hummingboard.dtb \
-	imx6dl-hummingboard-emmc-som-v15.dtb \
-	imx6dl-hummingboard-som-v15.dtb \
-	imx6dl-hummingboard2.dtb \
-	imx6dl-hummingboard2-emmc-som-v15.dtb \
-	imx6dl-hummingboard2-som-v15.dtb \
-	imx6dl-icore.dtb \
-	imx6dl-icore-mipi.dtb \
-	imx6dl-icore-rqs.dtb \
-	imx6dl-mamoj.dtb \
-	imx6dl-nit6xlite.dtb \
-	imx6dl-nitrogen6x.dtb \
-	imx6dl-phytec-mira-rdk-nand.dtb \
-	imx6dl-phytec-pbab01.dtb \
-	imx6dl-rex-basic.dtb \
-	imx6dl-riotboard.dtb \
-	imx6dl-sabreauto.dtb \
-	imx6dl-sabrelite.dtb \
-	imx6dl-sabresd.dtb \
-	imx6dl-savageboard.dtb \
-	imx6dl-ts4900.dtb \
-	imx6dl-ts7970.dtb \
-	imx6dl-tx6dl-comtft.dtb \
-	imx6dl-tx6s-8034.dtb \
-	imx6dl-tx6s-8034-mb7.dtb \
-	imx6dl-tx6s-8035.dtb \
-	imx6dl-tx6s-8035-mb7.dtb \
-	imx6dl-tx6u-801x.dtb \
-	imx6dl-tx6u-80xx-mb7.dtb \
-	imx6dl-tx6u-8033.dtb \
-	imx6dl-tx6u-8033-mb7.dtb \
-	imx6dl-tx6u-811x.dtb \
-	imx6dl-tx6u-81xx-mb7.dtb \
-	imx6dl-udoo.dtb \
-	imx6dl-wandboard.dtb \
-	imx6dl-wandboard-revb1.dtb \
-	imx6dl-wandboard-revd1.dtb \
-	imx6q-apalis-eval.dtb \
-	imx6q-apalis-ixora.dtb \
-	imx6q-apalis-ixora-v1.1.dtb \
-	imx6q-apf6dev.dtb \
-	imx6q-arm2.dtb \
-	imx6q-b450v3.dtb \
-	imx6q-b650v3.dtb \
-	imx6q-b850v3.dtb \
-	imx6q-cm-fx6.dtb \
-	imx6q-cubox-i.dtb \
-	imx6q-cubox-i-emmc-som-v15.dtb \
-	imx6q-cubox-i-som-v15.dtb \
-	imx6q-dfi-fs700-m60.dtb \
-	imx6q-dhcom-pdk2.dtb \
-	imx6q-display5-tianma-tm070-1280x768.dtb \
-	imx6q-dmo-edmqmx6.dtb \
-	imx6q-dms-ba16.dtb \
-	imx6q-emcon-avari.dtb \
-	imx6q-evi.dtb \
-	imx6q-gk802.dtb \
-	imx6q-gw51xx.dtb \
-	imx6q-gw52xx.dtb \
-	imx6q-gw53xx.dtb \
-	imx6q-gw5400-a.dtb \
-	imx6q-gw54xx.dtb \
-	imx6q-gw551x.dtb \
-	imx6q-gw552x.dtb \
-	imx6q-gw553x.dtb \
-	imx6q-gw560x.dtb \
-	imx6q-gw5903.dtb \
-	imx6q-gw5904.dtb \
-	imx6q-h100.dtb \
-	imx6q-hummingboard.dtb \
-	imx6q-hummingboard-emmc-som-v15.dtb \
-	imx6q-hummingboard-som-v15.dtb \
-	imx6q-hummingboard2.dtb \
-	imx6q-hummingboard2-emmc-som-v15.dtb \
-	imx6q-hummingboard2-som-v15.dtb \
-	imx6q-icore.dtb \
-	imx6q-icore-mipi.dtb \
-	imx6q-icore-ofcap10.dtb \
-	imx6q-icore-ofcap12.dtb \
-	imx6q-icore-rqs.dtb \
-	imx6q-kp-tpc.dtb \
-	imx6q-marsboard.dtb \
-	imx6q-mccmon6.dtb \
-	imx6q-nitrogen6x.dtb \
-	imx6q-nitrogen6_max.dtb \
-	imx6q-nitrogen6_som2.dtb \
-	imx6q-novena.dtb \
-	imx6q-phytec-mira-rdk-emmc.dtb \
-	imx6q-phytec-mira-rdk-nand.dtb \
-	imx6q-phytec-pbab01.dtb \
-	imx6q-pistachio.dtb \
-	imx6q-rex-pro.dtb \
-	imx6q-sabreauto.dtb \
-	imx6q-sabrelite.dtb \
-	imx6q-sabresd.dtb \
-	imx6q-savageboard.dtb \
-	imx6q-sbc6x.dtb \
-	imx6q-tbs2910.dtb \
-	imx6q-ts4900.dtb \
-	imx6q-ts7970.dtb \
-	imx6q-tx6q-1010.dtb \
-	imx6q-tx6q-1010-comtft.dtb \
-	imx6q-tx6q-1020.dtb \
-	imx6q-tx6q-1020-comtft.dtb \
-	imx6q-tx6q-1036.dtb \
-	imx6q-tx6q-1036-mb7.dtb \
-	imx6q-tx6q-10x0-mb7.dtb \
-	imx6q-tx6q-1110.dtb \
-	imx6q-tx6q-11x0-mb7.dtb \
-	imx6q-udoo.dtb \
-	imx6q-utilite-pro.dtb \
-	imx6q-var-dt6customboard.dtb \
-	imx6q-wandboard.dtb \
-	imx6q-wandboard-revb1.dtb \
-	imx6q-wandboard-revd1.dtb \
-	imx6q-zii-rdu2.dtb \
-	imx6qp-nitrogen6_max.dtb \
-	imx6qp-nitrogen6_som2.dtb \
-	imx6qp-phytec-mira-rdk-nand.dtb \
-	imx6qp-sabreauto.dtb \
-	imx6qp-sabresd.dtb \
-	imx6qp-tx6qp-8037.dtb \
-	imx6qp-tx6qp-8037-mb7.dtb \
-	imx6qp-tx6qp-8137.dtb \
-	imx6qp-tx6qp-8137-mb7.dtb \
-	imx6qp-wandboard-revd1.dtb \
-	imx6qp-zii-rdu2.dtb
+	$(call wilddt,imx6dl-*) \
+	$(call wilddt,imx6q-*) \
+	$(call wilddt,imx6qp-*)
 dtb-$(CONFIG_SOC_IMX6SL) +=3D \
-	imx6sl-evk.dtb \
-	imx6sl-warp.dtb
+	$(call wilddt,imx6sl-*)
 dtb-$(CONFIG_SOC_IMX6SLL) +=3D \
-	imx6sll-evk.dtb
+	$(call wilddt,imx6sll-*)
 dtb-$(CONFIG_SOC_IMX6SX) +=3D \
-	imx6sx-nitrogen6sx.dtb \
-	imx6sx-sabreauto.dtb \
-	imx6sx-sdb-reva.dtb \
-	imx6sx-sdb-sai.dtb \
-	imx6sx-sdb.dtb \
-	imx6sx-softing-vining-2000.dtb \
-	imx6sx-udoo-neo-basic.dtb \
-	imx6sx-udoo-neo-extended.dtb \
-	imx6sx-udoo-neo-full.dtb
+	$(call wilddt,imx6sx-*)
 dtb-$(CONFIG_SOC_IMX6UL) +=3D \
-	imx6ul-14x14-evk.dtb \
-	imx6ul-ccimx6ulsbcexpress.dtb \
-	imx6ul-ccimx6ulsbcpro.dtb \
-	imx6ul-geam.dtb \
-	imx6ul-isiot-emmc.dtb \
-	imx6ul-isiot-nand.dtb \
-	imx6ul-liteboard.dtb \
-	imx6ul-opos6uldev.dtb \
-	imx6ul-pico-hobbit.dtb \
-	imx6ul-pico-pi.dtb \
-	imx6ul-tx6ul-0010.dtb \
-	imx6ul-tx6ul-0011.dtb \
-	imx6ul-tx6ul-mainboard.dtb \
-	imx6ull-14x14-evk.dtb \
-	imx6ull-colibri-eval-v3.dtb \
-	imx6ull-colibri-wifi-eval-v3.dtb \
-	imx6ulz-14x14-evk.dtb
+	$(call wilddt,imx6ul-*) \
+	$(call wilddt,imx6ull-*) \
+	$(call wilddt,imx6ulz-*)
 dtb-$(CONFIG_SOC_IMX7D) +=3D \
-	imx7d-cl-som-imx7.dtb \
-	imx7d-colibri-emmc-eval-v3.dtb \
-	imx7d-colibri-eval-v3.dtb \
-	imx7d-nitrogen7.dtb \
-	imx7d-pico-hobbit.dtb \
-	imx7d-pico-pi.dtb \
-	imx7d-sbc-imx7.dtb \
-	imx7d-sdb.dtb \
-	imx7d-sdb-reva.dtb \
-	imx7d-sdb-sht11.dtb \
-	imx7s-colibri-eval-v3.dtb \
-	imx7s-warp.dtb
+	$(call wilddt,imx7[ds]-*)
 dtb-$(CONFIG_SOC_IMX7ULP) +=3D \
-	imx7ulp-evk.dtb
+	$(call wilddt,imx7ulp-*)
 dtb-$(CONFIG_SOC_LS1021A) +=3D \
 	ls1021a-moxa-uc-8410a.dtb \
 	ls1021a-qds.dtb \
 	ls1021a-twr.dtb
 dtb-$(CONFIG_SOC_VF610) +=3D \
--=20
2.17.1
