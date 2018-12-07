Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr40082.outbound.protection.outlook.com ([40.107.4.82]:52002
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726072AbeLGShM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Dec 2018 13:37:12 -0500
From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: [RFC] ARM: dts: Introduce wilddt function instead of listing imx
 boards
Date: Fri, 7 Dec 2018 18:35:13 +0000
Message-ID: <044dced6439a8ac35cf03336dcef64297e204fc4.1544206368.git.leonard.crestez@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Shawn Guo <shawnguo@kernel.org>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, Michal Marek <michal.lkml@markovi.net>, Mark Rutland <mark.rutland@arm.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

The dts makefiles go through a lot of pointless churn when boards are
added. Many SOCs (such as imx) have very simple naming conventions for
all boards using a certain SOC and board listings can be easily
collapsed using wildcards.

Add a "wilddt" function and use it for imx6/7

Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>

---
 arch/arm/boot/dts/Makefile | 203 ++++---------------------------------
 1 file changed, 19 insertions(+), 184 deletions(-)

If useful in v2 the wilddt function can be split into a separate patch
for "scripts/Makefile.lib"

A few other arches also have DT wildcards but not on a per-soc basis, in
theory they could $(call wilddt,*)

I'm not sure if $dtstree is used correctly here?

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index b0e966d625b9..42e6ba453adf 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1,6 +1,15 @@
 # SPDX-License-Identifier: GPL-2.0
+
+dtstree	:=3D $(srctree)/$(src)
+
+# return list of .dtb for all .dts matching $1 in current directory
+# Example usage: dtb-$CONFIG_SOC_ABC123 +=3D $(call wilddt,abc123-*)
+define wilddt
+	$(patsubst $(dtstree)/%.dts,%.dtb, $(wildcard $(dtstree)/$(1).dts))
+endef
+
 dtb-$(CONFIG_ARCH_ALPINE) +=3D \
 	alpine-db.dtb
 dtb-$(CONFIG_MACH_ARTPEC6) +=3D \
 	artpec6-devboard.dtb
 dtb-$(CONFIG_MACH_ASM9260) +=3D \
@@ -384,199 +393,25 @@ dtb-$(CONFIG_SOC_IMX53) +=3D \
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
-	imx7d-pico-pi.dtb \
-	imx7d-sbc-imx7.dtb \
-	imx7d-sdb.dtb \
-	imx7d-sdb-sht11.dtb \
-	imx7s-colibri-eval-v3.dtb \
-	imx7s-warp.dtb
+	$(call wilddt,imx7[ds]-*)
 dtb-$(CONFIG_SOC_LS1021A) +=3D \
 	ls1021a-moxa-uc-8410a.dtb \
 	ls1021a-qds.dtb \
 	ls1021a-twr.dtb
 dtb-$(CONFIG_SOC_VF610) +=3D \
--=20
2.17.1
