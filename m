Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr10047.outbound.protection.outlook.com ([40.107.1.47]:32373
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729413AbfAUQRA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Jan 2019 11:17:00 -0500
From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH 0/3] kbuild: Add wilddt function instead of listing dtbs
Date: Mon, 21 Jan 2019 16:16:55 +0000
Message-ID: <VI1PR04MB553355D6D5EBC2604E1AD256EE9F0@VI1PR04MB5533.eurprd04.prod.outlook.com>
References: <cover.1546888138.git.leonard.crestez@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Olof Johansson <olof@lixom.net>
Cc: Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Fabio Estevam <fabio.estevam@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, Leo Li <leoyang.li@nxp.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 1/7/2019 9:31 PM, Leonard Crestez wrote:=0A=
> The dts makefiles go through a lot of pointless churn when boards are=0A=
> added. Many SOCs (such as imx) have very simple naming conventions for=0A=
> all boards using a certain chip and board listings can be easily=0A=
> collapsed using wildcards.=0A=
> =0A=
> Add a "wilddt" function and use it for imx6/7/8 and layerscape. This can=
=0A=
> be applied to many other soc families later.=0A=
> =0A=
> Previously sent as RFC: https://lore.kernel.org/patchwork/patch/1022737/=
=0A=
=0A=
Any feedback? This should be reviewed by kbuild and arm-soc=0A=
=0A=
I think this is a worthwhile cleanup, are there any corner cases or more =
=0A=
exotic setup I should try in order to validate this series?=0A=
=0A=
--=0A=
Regards,=0A=
Leonard=0A=
