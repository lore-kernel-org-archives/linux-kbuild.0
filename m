Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:30757 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751780AbeDGC4X (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Apr 2018 22:56:23 -0400
MIME-Version: 1.0
In-Reply-To: <20180406185505.GD10990@n2100.armlinux.org.uk>
References: <20180406102519.GN16141@n2100.armlinux.org.uk> <20180406164615.GL5700@atomide.com>
 <06568f5b-3e4a-f761-7242-85dcc8aeb6a5@oracle.com> <20180406185505.GD10990@n2100.armlinux.org.uk>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 7 Apr 2018 11:55:22 +0900
Message-ID: <CAK7LNARbST+-oy-J9B2Q2vSp0nhnn9gqOnT7urZdjQZhSpYB-Q@mail.gmail.com>
Subject: Re: [BUG] Fix drivers/memory O= build
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Santosh Shilimkar <santosh.shilimkar@oracle.com>, Tony Lindgren <tony@atomide.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Dave Gerlach <d-gerlach@ti.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux-OMAP <linux-omap@vger.kernel.org>, arm-soc@armlinux.org.uk

2018-04-07 3:55 GMT+09:00 Russell King - ARM Linux <linux@armlinux.org.uk>:
> On Fri, Apr 06, 2018 at 11:45:01AM -0700, Santosh Shilimkar wrote:
>> On 4/6/2018 9:46 AM, Tony Lindgren wrote:
>> >* Russell King - ARM Linux <linux@armlinux.org.uk> [180406 03:27]:
>> >>When building a kernel with split object directories, the following
>> >>failure occurs:
>> >>
>> >>.../drivers/memory/emif-asm-offsets.c:1:0: fatal error: can't open drivers/memory/emif-asm-offsets.s for writing: No such file or directory
>> >>compilation terminated.
>> >>drivers/memory/Makefile.asm-offsets:2: recipe for target 'drivers/memory/emif-asm-offsets.s' failed
>> >>make[2]: *** [drivers/memory/emif-asm-offsets.s] Error 1
>> >>.../Makefile:1060: recipe for target 'arch/arm/mach-omap2' failed
>> >>make[1]: *** [arch/arm/mach-omap2] Error 2
>> >>
>> >>This prevents any kernel being built that includes decending into
>> >>arch/arm/mach-omap2 with split object directories.
>> >>
>> >>This is a regression.
>> >
>> >Dave, I presume you're looking into this already?
>> >
>> Fix is already posted by 'Anders Roxell <anders.roxell@linaro.org>'
>> You are copied on the email Tony.
>
> Arnd also has a fix for it as well, which moves emif-asm-offsets.s
> into include/generated, as that will always exist prior to these
> rules being invoked.  Arnd's passing it through his randconfig
> builder before publishing it.


I do not like this idea.

Not sure exactly what Arnd is trying to do,
but the same file should not be touched from multiple points
in case Kbuild descends into mach-omap2/ and memory/ at the same time.


I recommend to put copies in each directory:

arch/arm/mach-omap2/emif-asm-offsets.h
drivers/memory/ti-emif-asm-offsets.h


If you want me to send a patch,
I will give it a try.




-- 
Best Regards
Masahiro Yamada
