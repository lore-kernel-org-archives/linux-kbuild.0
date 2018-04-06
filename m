Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:54324 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751538AbeDFSz0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Apr 2018 14:55:26 -0400
Date: Fri, 6 Apr 2018 19:55:06 +0100
From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [BUG] Fix drivers/memory O= build
Message-ID: <20180406185505.GD10990@n2100.armlinux.org.uk>
References: <20180406102519.GN16141@n2100.armlinux.org.uk>
 <20180406164615.GL5700@atomide.com>
 <06568f5b-3e4a-f761-7242-85dcc8aeb6a5@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06568f5b-3e4a-f761-7242-85dcc8aeb6a5@oracle.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Santosh Shilimkar <santosh.shilimkar@oracle.com>
Cc: Tony Lindgren <tony@atomide.com>, linux-arm-kernel@lists.infradead.org, Dave Gerlach <d-gerlach@ti.com>, linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-omap@vger.kernel.org, arm-soc@armlinux.org.uk

On Fri, Apr 06, 2018 at 11:45:01AM -0700, Santosh Shilimkar wrote:
> On 4/6/2018 9:46 AM, Tony Lindgren wrote:
> >* Russell King - ARM Linux <linux@armlinux.org.uk> [180406 03:27]:
> >>When building a kernel with split object directories, the following
> >>failure occurs:
> >>
> >>.../drivers/memory/emif-asm-offsets.c:1:0: fatal error: can't open drivers/memory/emif-asm-offsets.s for writing: No such file or directory
> >>compilation terminated.
> >>drivers/memory/Makefile.asm-offsets:2: recipe for target 'drivers/memory/emif-asm-offsets.s' failed
> >>make[2]: *** [drivers/memory/emif-asm-offsets.s] Error 1
> >>.../Makefile:1060: recipe for target 'arch/arm/mach-omap2' failed
> >>make[1]: *** [arch/arm/mach-omap2] Error 2
> >>
> >>This prevents any kernel being built that includes decending into
> >>arch/arm/mach-omap2 with split object directories.
> >>
> >>This is a regression.
> >
> >Dave, I presume you're looking into this already?
> >
> Fix is already posted by 'Anders Roxell <anders.roxell@linaro.org>'
> You are copied on the email Tony.

Arnd also has a fix for it as well, which moves emif-asm-offsets.s
into include/generated, as that will always exist prior to these
rules being invoked.  Arnd's passing it through his randconfig
builder before publishing it.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
According to speedtest.net: 8.21Mbps down 510kbps up
