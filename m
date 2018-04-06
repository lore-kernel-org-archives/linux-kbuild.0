Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from muru.com ([72.249.23.125]:35522 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750962AbeDFQqT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Apr 2018 12:46:19 -0400
Date: Fri, 6 Apr 2018 09:46:15 -0700
From: Tony Lindgren <tony@atomide.com>
Subject: Re: [BUG] Fix drivers/memory O= build
Message-ID: <20180406164615.GL5700@atomide.com>
References: <20180406102519.GN16141@n2100.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180406102519.GN16141@n2100.armlinux.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, Dave Gerlach <d-gerlach@ti.com>, Santosh Shilimkar <santosh.shilimkar@oracle.com>, linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-omap@vger.kernel.org, arm-soc@armlinux.org.uk

* Russell King - ARM Linux <linux@armlinux.org.uk> [180406 03:27]:
> When building a kernel with split object directories, the following
> failure occurs:
> 
> .../drivers/memory/emif-asm-offsets.c:1:0: fatal error: can't open drivers/memory/emif-asm-offsets.s for writing: No such file or directory
> compilation terminated.
> drivers/memory/Makefile.asm-offsets:2: recipe for target 'drivers/memory/emif-asm-offsets.s' failed
> make[2]: *** [drivers/memory/emif-asm-offsets.s] Error 1
> .../Makefile:1060: recipe for target 'arch/arm/mach-omap2' failed
> make[1]: *** [arch/arm/mach-omap2] Error 2
> 
> This prevents any kernel being built that includes decending into
> arch/arm/mach-omap2 with split object directories.
> 
> This is a regression.

Dave, I presume you're looking into this already?

Regards,

Tony
