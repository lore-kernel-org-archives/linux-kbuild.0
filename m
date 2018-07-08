Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:57512 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751422AbeGHPrL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 8 Jul 2018 11:47:11 -0400
Subject: Re: powerpc: 32BIT vs. 64BIT (PPC32 vs. PPC64)
References: <3f906b03-98ff-c081-4e19-b490f0b35c51@infradead.org>
 <87sh4uj675.fsf@concordia.ellerman.id.au>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d5935c67-ac6d-2904-ae2a-134ba85a706d@infradead.org>
Date: Sun, 8 Jul 2018 08:46:52 -0700
MIME-Version: 1.0
In-Reply-To: <87sh4uj675.fsf@concordia.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, linux-kbuild <linux-kbuild@vger.kernel.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linuxppc-dev@lists.ozlabs.org

On 07/08/2018 04:51 AM, Michael Ellerman wrote:
> Randy Dunlap <rdunlap@infradead.org> writes:
>> Hi,
>>
>> Is there a good way (or a shortcut) to do something like:
> 
> The best I know of is:
> 
>> $ make ARCH=powerpc O=PPC32 [other_options] allmodconfig
>>   to get a PPC32/32BIT allmodconfig
> 
> $ echo CONFIG_PPC64=n > allmod.config
> $ KCONFIG_ALLCONFIG=1 make allmodconfig
> $ grep PPC32 .config
> CONFIG_PPC32=y
> 
> Which is still a bit clunky.
> 

That's close to what I already do.  And it's very script-able.

> 
> I looked at this a while back and the problem we have is that the 32-bit
> kernel is not a single thing. There are multiple 32-bit platforms which
> are mutually exclusive.
> 
> eg, from menuconfig:
> 
>  - 512x/52xx/6xx/7xx/74xx/82xx/83xx/86xx
>  - Freescale 85xx
>  - Freescale 8xx
>  - AMCC 40x
>  - AMCC 44x, 46x or 47x
>  - Freescale e200
> 
> 
> So we could have a 32-bit allmodconfig, but we'd need to chose one of
> the above, and we'd still only be testing some of the code.
> 
> Having said that you're the 2nd person to ask about this, so we should
> clearly do something to make a 32-bit allmodconfig easier, even if it's
> not perfect.

Thanks.

-- 
~Randy
