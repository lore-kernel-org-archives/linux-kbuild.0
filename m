Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from aserp2130.oracle.com ([141.146.126.79]:54118 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751367AbeDFSpq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Apr 2018 14:45:46 -0400
Subject: Re: [BUG] Fix drivers/memory O= build
References: <20180406102519.GN16141@n2100.armlinux.org.uk>
 <20180406164615.GL5700@atomide.com>
From: Santosh Shilimkar <santosh.shilimkar@oracle.com>
Message-ID: <06568f5b-3e4a-f761-7242-85dcc8aeb6a5@oracle.com>
Date: Fri, 6 Apr 2018 11:45:01 -0700
MIME-Version: 1.0
In-Reply-To: <20180406164615.GL5700@atomide.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tony Lindgren <tony@atomide.com>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Dave Gerlach <d-gerlach@ti.com>, linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-omap@vger.kernel.org, arm-soc@armlinux.org.uk

On 4/6/2018 9:46 AM, Tony Lindgren wrote:
> * Russell King - ARM Linux <linux@armlinux.org.uk> [180406 03:27]:
>> When building a kernel with split object directories, the following
>> failure occurs:
>>
>> .../drivers/memory/emif-asm-offsets.c:1:0: fatal error: can't open drivers/memory/emif-asm-offsets.s for writing: No such file or directory
>> compilation terminated.
>> drivers/memory/Makefile.asm-offsets:2: recipe for target 'drivers/memory/emif-asm-offsets.s' failed
>> make[2]: *** [drivers/memory/emif-asm-offsets.s] Error 1
>> .../Makefile:1060: recipe for target 'arch/arm/mach-omap2' failed
>> make[1]: *** [arch/arm/mach-omap2] Error 2
>>
>> This prevents any kernel being built that includes decending into
>> arch/arm/mach-omap2 with split object directories.
>>
>> This is a regression.
> 
> Dave, I presume you're looking into this already?
> 
Fix is already posted by 'Anders Roxell <anders.roxell@linaro.org>'
You are copied on the email Tony.

Regards,
Santosh
