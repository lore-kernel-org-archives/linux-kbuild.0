Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:45806 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933820AbeFVSiz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Jun 2018 14:38:55 -0400
Date: Fri, 22 Jun 2018 19:38:38 +0100
From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCHv4 4/4] ARM: versatile: support configuring versatile
 machine for no-MMU
Message-ID: <20180622183838.GZ17671@n2100.armlinux.org.uk>
References: <20180618141905.7789-5-gerg@linux-m68k.org>
 <CAMuHMdUyCEq0U_CJindwcSEF+0dR-SJc1v8zGT-CcUqVkdOeVw@mail.gmail.com>
 <nycvar.YSQ.7.76.1806211212010.16670@knanqh.ubzr>
 <20180622110145.GU17671@n2100.armlinux.org.uk>
 <nycvar.YSQ.7.76.1806221110140.16670@knanqh.ubzr>
 <CAMuHMdWZPM3Q9fVXWiw1bMVWNRCYGoQa-XukJka-2xsP-=HmVQ@mail.gmail.com>
 <nycvar.YSQ.7.76.1806221146140.16670@knanqh.ubzr>
 <TY1PR01MB15624342267F973525BF45698A750@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <nycvar.YSQ.7.76.1806221244490.16670@knanqh.ubzr>
 <TY1PR01MB1562C54E8DD3942F40F8CBBD8A750@TY1PR01MB1562.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1562C54E8DD3942F40F8CBBD8A750@TY1PR01MB1562.jpnprd01.prod.outlook.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Fri, Jun 22, 2018 at 05:23:09PM +0000, Chris Brandt wrote:
> Then here's a question.
> 
> To be clear, the discussion is around
> 
>   "Being able to build a kernel that will not boot"
> 
> So which one of these is more important: build or boot?

We care about both.

> Meaning what if you can select multiple platforms in kconfig, but then 
> there is a .c file that does more sanity checking that then prevents the 
> full build using a #error.

... which is not acceptable.  We have a lot of automated build
infrastructure to build almost every commit in the mainline kernel
against almost every build configuration that is present in the
kernel and every architecture that is present in the mainline kernel.
We also have people that build random configurations and fix any
build failures and warnings which result from that.

I also build randconfigs here.

> In that case you can never "build" a kernel that has no chance of 
> booting on all the selected platforms.
> 
> There are configs options today that you can select, but unless some 
> external criteria is  met during build time, the build will fail (like
> with a "missing .h file" message or something)

Such as?  I don't think that's found by the randconfig builders - I've
never noticed any such failures on ARM.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
According to speedtest.net: 8.21Mbps down 510kbps up
