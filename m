Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f177.google.com ([209.85.217.177]:37328 "EHLO
	mail-lb0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754629Ab3JXK7R (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Oct 2013 06:59:17 -0400
Received: by mail-lb0-f177.google.com with SMTP id u14so1705391lbd.8
        for <linux-kbuild@vger.kernel.org>; Thu, 24 Oct 2013 03:59:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1381694368.1301.91.camel@deadeye.wl.decadent.org.uk>
References: <1381079041.2788.25.camel@deadeye.wl.decadent.org.uk>
	<CAODfWeFOB8ciUUTkdFn7_TUELVQC48XCC1oz+aYhZotewDtqzA@mail.gmail.com>
	<1381694368.1301.91.camel@deadeye.wl.decadent.org.uk>
Date: Thu, 24 Oct 2013 12:59:16 +0200
Message-ID: <CAODfWeF5oMfMAavXK_C9qYtDuNyfUDhfmoVwRro2HW2HG9HRgw@mail.gmail.com>
Subject: Re: [PATCH 1/2] deb-pkg: Add automatic support for armhf architecture
From: Hector Oron <hector.oron@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, maximilian attems <max@stro.at>, Michal Marek <mmarek@suse.cz>, Fathi Boudra <fathi.boudra@linaro.org>, Debian ARM <debian-arm@lists.debian.org>

Hello,

2013/10/13 Ben Hutchings <ben@decadent.org.uk>:
> On Tue, 2013-10-08 at 02:23 +0200, Hector Oron wrote:
>> Hello,
>>
>> 2013/10/6 Ben Hutchings <ben@decadent.org.uk>:
>> > The Debian armhf architecture uses the ARM EABI hard-float variant,
>> > whereas armel uses the soft-float variant.  Although the kernel
>> > doesn't use FP itself, CONFIG_VFP must be enabled to support
>> > hard-float userland and will probably be disabled when supporting a
>> > soft-float userland.  So set the architecture to armhf by default when
>> > CONFIG_AEABI and CONFIG_VFP are both enabled.
>>
>> Debian armel userland can be run on any device, so it is suggested to
>> better rely on toolchain configuration rather than kernel config
>> symbols.
>>
>> For arm-gnueabi(hf) toolchain something like:
>>   $ gcc -dumpspecs | grep multilib_defaults -A2 | grep -q soft && echo
>> "This is armel"
>>   $ gcc -dumpspecs | grep multilib_defaults -A2 | grep -q hard && echo
>> "This is armhf"
>> could be checked instead.
> [...]
>
> Is the output of -dumpspecs really so stable that this is going to be
> reliable?

I am not sure about it... but up to date, I have never found a system
that makes it faulty. I would be interesting to check on other
distributions besides Debian.
