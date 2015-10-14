Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yk0-f179.google.com ([209.85.160.179]:35902 "EHLO
	mail-yk0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753703AbbJNQyz (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 14 Oct 2015 12:54:55 -0400
Received: by ykey125 with SMTP id y125so53159055yke.3
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Oct 2015 09:54:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1444779780.12197.3.camel@ellerman.id.au>
References: <1442986835-13985-1-git-send-email-mpe@ellerman.id.au>
	<20151002074708.CF4DC14076A@ozlabs.org>
	<CAOesGMjDC99RFEenyUqc2uhpT9EhqhevrqxiO5Gd7AN_GWmrkg@mail.gmail.com>
	<1444779780.12197.3.camel@ellerman.id.au>
Date: Wed, 14 Oct 2015 09:54:55 -0700
Message-ID: <CAOesGMgd2rnAs9hmi1B9PWN2=fr6HUDn+krxdDdGPUKBrZOQGw@mail.gmail.com>
Subject: Re: [RFC, 1/2] scripts/kconfig/Makefile: Allow KBUILD_DEFCONFIG to be
 a target
From: Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@ozlabs.org, mmarek@suse.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, yann.morin.1998@free.fr, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>

On Tue, Oct 13, 2015 at 4:43 PM, Michael Ellerman <mpe@ellerman.id.au> wrote:
> On Tue, 2015-10-13 at 14:02 -0700, Olof Johansson wrote:
>> On Fri, Oct 2, 2015 at 12:47 AM, Michael Ellerman <mpe@ellerman.id.au> wrote:
>> > On Wed, 2015-23-09 at 05:40:34 UTC, Michael Ellerman wrote:
>> >> Arch Makefiles can set KBUILD_DEFCONFIG to tell kbuild the name of the
>> >> defconfig that should be built by default.
>> >>
>> >> However currently there is an assumption that KBUILD_DEFCONFIG points to
>> >> a file at arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG).
>> >>
>> >> We would like to use a target, using merge_config, as our defconfig, so
>> >> adapt the logic in scripts/kconfig/Makefile to allow that.
>> >>
>> >> To minimise the chance of breaking anything, we first check if
>> >> KBUILD_DEFCONFIG is a file, and if so we do the old logic. If it's not a
>> >> file, then we call the top-level Makefile with KBUILD_DEFCONFIG as the
>> >> target.
>> >>
>> >> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> >> Acked-by: Michal Marek <mmarek@suse.com>
>> >
>> > Applied to powerpc next.
>> >
>> > https://git.kernel.org/powerpc/c/d2036f30cfe1daa19e63ce75
>>
>> This breaks arm64 defconfig for me:
>>
>> mkdir obj-tmp
>> make -f Makefile O=obj-tmp ARCH=arm64 defconfig
>> ... watch loop of:
>> *** Default configuration is based on target 'defconfig'
>>   GEN     ./Makefile
>
> Crap, sorry. I knew I shouldn't have touched that code!
>
> Does this fix it for you?

Yes, it does, however:

>
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index b2b9c87..3043d6b 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -96,7 +96,7 @@ savedefconfig: $(obj)/conf
>  defconfig: $(obj)/conf
>  ifeq ($(KBUILD_DEFCONFIG),)
>         $< $(silent) --defconfig $(Kconfig)
> -else ifneq ($(wildcard arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)),)
> +else ifneq ($(wildcard $(srctree)/arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)),)
>         @$(kecho) "*** Default configuration is based on '$(KBUILD_DEFCONFIG)'"
>         $(Q)$< $(silent) --defconfig=arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG) $(Kconfig)

Do you need a $(srctree) prefix here too? I'm not entirely sure what I
would do to reproduce a run that goes down this path so I can't
confirm.


-Olof
