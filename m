Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from fllnx209.ext.ti.com ([198.47.19.16]:58608 "EHLO
        fllnx209.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753424AbeDMDBI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Apr 2018 23:01:08 -0400
Subject: Re: [PATCH] ARM: omap2: Fix build when using split object directories
References: <20180411211543.7923-1-d-gerlach@ti.com>
 <20180412082157.GB4002@localhost.localdomain>
 <CAK7LNAQiq-4daX2K4dPyzN7zr+yfkQWSJ-yy9JHgacPpYFp94w@mail.gmail.com>
From: Dave Gerlach <d-gerlach@ti.com>
Message-ID: <3d7e801a-7eab-7421-1dc8-b718aec33ffc@ti.com>
Date: Thu, 12 Apr 2018 22:00:37 -0500
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQiq-4daX2K4dPyzN7zr+yfkQWSJ-yy9JHgacPpYFp94w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Anders Roxell <anders.roxell@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Santosh Shilimkar <santosh.shilimkar@oracle.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux-OMAP <linux-omap@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

Hi,
On 04/12/2018 04:08 AM, Masahiro Yamada wrote:
> 2018-04-12 17:21 GMT+09:00 Anders Roxell <anders.roxell@linaro.org>:
>> On 2018-04-11 16:15, Dave Gerlach wrote:
>>> The sleep33xx and sleep43xx files should not depend on a header file
>>> generated in drivers/memory. Remove this dependency and instead allow
>>> both drivers/memory and arch/arm/mach-omap2 to generate all macros
>>> needed in headers local to their own paths.
>>>
>>> This fixes an issue where the build fail will when using O= to set a
>>> split object directory and arch/arm/mach-omap2 is built before
>>> drivers/memory with the following error:
>>>
>>> .../drivers/memory/emif-asm-offsets.c:1:0: fatal error: can't open drivers/memory/emif-asm-offsets.s for writing: No such file or directory
>>> compilation terminated.
>>>
>>> Fixes: 41d9d44d7258 ("ARM: OMAP2+: pm33xx-core: Add platform code needed for PM")
>>> Acked-by: Tony Lindgren <tony@atomide.com>
>>> Reviewed-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>>> Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
>>
>> Tested-by: Anders Roxell <anders.roxell@linaro.org>
>>
>> Maybe we can remove drivers/memory/Makefile.asm-offsets and move those
>> changes into drivers/memory/Makefile ?
> 
> Agree!

Alright, I agree as well, fixed in v2.

Regards,
Dave

> 
> 
> 
> 

