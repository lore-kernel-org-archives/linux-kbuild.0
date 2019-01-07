Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr10078.outbound.protection.outlook.com ([40.107.1.78]:25466
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726934AbfAGTbc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Jan 2019 14:31:32 -0500
From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: [PATCH 0/3] kbuild: Add wilddt function instead of listing dtbs
Date: Mon, 7 Jan 2019 19:31:25 +0000
Message-ID: <cover.1546888138.git.leonard.crestez@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>, Shawn Guo <shawnguo@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Fabio Estevam <fabio.estevam@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, Leo Li <leoyang.li@nxp.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

The dts makefiles go through a lot of pointless churn when boards are
added. Many SOCs (such as imx) have very simple naming conventions for
all boards using a certain chip and board listings can be easily
collapsed using wildcards.

Add a "wilddt" function and use it for imx6/7/8 and layerscape. This can
be applied to many other soc families later.

Previously sent as RFC: https://lore.kernel.org/patchwork/patch/1022737/

Changes since RFC:
 * Split into 3-part series
 * Move the wilddt to Kbuild.include so that it's available everywhere
 * Use $(srctree)/$(src) instead of $(dtstree)
 * Also use wilddt in arm64/boot/dts/freescale

Series is against next-20190107, conflicts are to be expected as board
list keeps changing.

Leonard Crestez (3):
  kbuild: Add wilddt function
  ARM: dts: imx: Use wilddt function
  arm64: dts: freescale: Use wilddt function

 arch/arm/boot/dts/Makefile             | 201 ++-----------------------
 arch/arm64/boot/dts/freescale/Makefile |  25 +--
 scripts/Kbuild.include                 |   6 +
 3 files changed, 21 insertions(+), 211 deletions(-)

--=20
2.17.1
