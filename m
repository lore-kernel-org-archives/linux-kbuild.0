Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:40187 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933660AbeFVRrY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Jun 2018 13:47:24 -0400
Received: by mail-qk0-f193.google.com with SMTP id b129-v6so4110861qke.7
        for <linux-kbuild@vger.kernel.org>; Fri, 22 Jun 2018 10:47:24 -0700 (PDT)
Date: Fri, 22 Jun 2018 13:47:22 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: RE: [PATCHv4 4/4] ARM: versatile: support configuring versatile
 machine for no-MMU
In-Reply-To: <TY1PR01MB1562C54E8DD3942F40F8CBBD8A750@TY1PR01MB1562.jpnprd01.prod.outlook.com>
Message-ID: <nycvar.YSQ.7.76.1806221341300.16670@knanqh.ubzr>
References: <20180618141905.7789-1-gerg@linux-m68k.org> <20180618141905.7789-5-gerg@linux-m68k.org> <CAMuHMdUyCEq0U_CJindwcSEF+0dR-SJc1v8zGT-CcUqVkdOeVw@mail.gmail.com> <nycvar.YSQ.7.76.1806211212010.16670@knanqh.ubzr> <20180622110145.GU17671@n2100.armlinux.org.uk>
 <nycvar.YSQ.7.76.1806221110140.16670@knanqh.ubzr> <CAMuHMdWZPM3Q9fVXWiw1bMVWNRCYGoQa-XukJka-2xsP-=HmVQ@mail.gmail.com> <nycvar.YSQ.7.76.1806221146140.16670@knanqh.ubzr> <TY1PR01MB15624342267F973525BF45698A750@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <nycvar.YSQ.7.76.1806221244490.16670@knanqh.ubzr> <TY1PR01MB1562C54E8DD3942F40F8CBBD8A750@TY1PR01MB1562.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Russell King <linux@armlinux.org.uk>, Greg Ungerer <gerg@linux-m68k.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Fri, 22 Jun 2018, Chris Brandt wrote:

> On Friday, June 22, 2018, Nicolas Pitre wrote:
> > > So, why do we feel that XIP_KERNEL needs a warm safety blanket around
> > > it?
> > 
> > Because we simply try not to create invalid kernel configurations.
> > XIP_KERNEL is not more special than other symbols in that respect.
> 
> Then here's a question.
> 
> To be clear, the discussion is around
> 
>   "Being able to build a kernel that will not boot"
> 
> So which one of these is more important: build or boot?

Obviously both. Most people are ultimately interested in kernels that 
can boot.

> Meaning what if you can select multiple platforms in kconfig, but then 
> there is a .c file that does more sanity checking that then prevents the 
> full build using a #error.

Sorry, that is still cheating around the actual issue, which is the 
inability to properly express mutually exclusive config symbols in 
kconfig.


Nicolas
