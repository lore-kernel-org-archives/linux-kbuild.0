Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-la0-f43.google.com ([209.85.215.43]:53397 "EHLO
	mail-la0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750865AbaDOFGm (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 15 Apr 2014 01:06:42 -0400
Received: by mail-la0-f43.google.com with SMTP id e16so6467830lan.16
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Apr 2014 22:06:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1397503641.31481.10.camel@deadeye.wl.decadent.org.uk>
References: <1397477996-24575-1-git-send-email-fathi.boudra@linaro.org>
	<1397503641.31481.10.camel@deadeye.wl.decadent.org.uk>
Date: Tue, 15 Apr 2014 08:06:41 +0300
Message-ID: <CAGNsrLBDidU9mW-Mz2bD4F2ZPMQzkFc4172ocUsd1S41v8_z-w@mail.gmail.com>
Subject: Re: [PATCH] builddeb: fix missing headers in linux-headers package on
 arm architecture
From: Fathi Boudra <fathi.boudra@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Maximilian Attems <maks@debian.org>

On 14 April 2014 22:27, Ben Hutchings <ben@decadent.org.uk> wrote:
> On Mon, 2014-04-14 at 15:19 +0300, Fathi Boudra wrote:
>> The kernel headers package (linux-headers) doesn't include
>> the arch/arm/mach-*/include header files.
>>
>> It makes the package unusable on ARM architecture and prevent
>> out-of-tree modules build:
>>  /usr/src/linux-headers-3.14.0/arch/arm/include/asm/memory.h:24:25:
>>  fatal error: mach/memory.h: No such file or directory
>>  #include <mach/memory.h>
>>  ^
>>  compilation terminated.
>>
>> While this patch explicitely test arm architecture, avr32 and blackfin are
>> affected since they ship mach-* headers. However, they haven't been included
>> in the test because they aren't official architectures supported by Debian.
>
> I don't see why you can't generically look for all include directories
> in arch/$SRCARCH.

If you think that we should all include dirs independently from their
support in the official archive, that's fine to me.
The header package is a bit bigger but it's still reasonable. I'll fix in v2.

> There also seem to be some files missing for several
> other architectures:
>
> arch/ia64/module.lds
> arch/m68k/kernel/module.lds
> arch/mips/Kbuild.platforms
> arch/mips/*/Platform
>
> In the Debian official packages we use these commands to find
> arch-specific headers and scripts:
>
>           find arch/$(KERNEL_ARCH) -maxdepth 1 -name 'Makefile*' -print; \
>           find arch/$(KERNEL_ARCH) \( -name 'module.lds' -o -name 'Kbuild.platforms' -o -name 'Platform' \) -print; \
>           find $$(find arch/$(KERNEL_ARCH) \( -name include -o -name scripts \) -type d -print) -print; \

It will be fixed in v2.

>> minor tweak: clean up the linux-headers package by using tar exclude option.
> [...]
>
> Shouldn't that be a separate patch?

Ack.

> Ben.
>
> --
> Ben Hutchings
> I say we take off; nuke the site from orbit.  It's the only way to be sure.

Thanks for the review.
