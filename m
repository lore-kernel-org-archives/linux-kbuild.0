Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:55498 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727980AbfAXQEh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 24 Jan 2019 11:04:37 -0500
MIME-Version: 1.0
References: <cover.1546888138.git.leonard.crestez@nxp.com> <VI1PR04MB553355D6D5EBC2604E1AD256EE9F0@VI1PR04MB5533.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR04MB553355D6D5EBC2604E1AD256EE9F0@VI1PR04MB5533.eurprd04.prod.outlook.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 25 Jan 2019 01:03:46 +0900
Message-ID: <CAK7LNAQ+eNhkfNsjGEdAg+j2ButQ8R6NyZ10SckCGSP5MZ4jtg@mail.gmail.com>
Subject: Re: [PATCH 0/3] kbuild: Add wilddt function instead of listing dtbs
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Leonard Crestez <leonard.crestez@nxp.com>
Cc: Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Fabio Estevam <fabio.estevam@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, Leo Li <leoyang.li@nxp.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jan 22, 2019 at 1:17 AM Leonard Crestez <leonard.crestez@nxp.com> wrote:
>
> On 1/7/2019 9:31 PM, Leonard Crestez wrote:
> > The dts makefiles go through a lot of pointless churn when boards are
> > added. Many SOCs (such as imx) have very simple naming conventions for
> > all boards using a certain chip and board listings can be easily
> > collapsed using wildcards.
> >
> > Add a "wilddt" function and use it for imx6/7/8 and layerscape. This can
> > be applied to many other soc families later.
> >
> > Previously sent as RFC: https://lore.kernel.org/patchwork/patch/1022737/
>
> Any feedback? This should be reviewed by kbuild and arm-soc
>
> I think this is a worthwhile cleanup, are there any corner cases or more
> exotic setup I should try in order to validate this series?



Personally, I prefer explicit listing
because I can browse the Makefile to get a quick idea
of which boards are compiled.

I like this to be consistent.


 - Exploit wildcard for all platforms

    or

- Do not do this at all


But, I am pessimistic about the former
when I look at AT91 platform.


-- 
Best Regards
Masahiro Yamada
