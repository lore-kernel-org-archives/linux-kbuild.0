Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ie0-f178.google.com ([209.85.223.178]:32777 "EHLO
	mail-ie0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752804AbbC3REg (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 30 Mar 2015 13:04:36 -0400
Received: by iecvj10 with SMTP id vj10so123230279iec.0
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Mar 2015 10:04:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <551959F1.4030704@suse.cz>
References: <1427716167-25078-1-git-send-email-ard.biesheuvel@linaro.org>
	<1427716167-25078-3-git-send-email-ard.biesheuvel@linaro.org>
	<551943CB.3010303@suse.cz>
	<20150330132617.GI24899@n2100.arm.linux.org.uk>
	<CAKv+Gu8-4XR5D-0_JnVfS2LNkH_Uvcc5txe4wJhwZogc5hZ-1w@mail.gmail.com>
	<551959F1.4030704@suse.cz>
Date: Mon, 30 Mar 2015 19:04:35 +0200
Message-ID: <CAKv+Gu-gRuf8L+NKtez4Jm9Mqe1HeeufH9MPqRztLcD+NTo+sA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] Kbuild: avoid partial linking of drivers/built-in.o
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-kbuild@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>

On 30 March 2015 at 16:13, Michal Marek <mmarek@suse.cz> wrote:
> On 2015-03-30 15:31, Ard Biesheuvel wrote:
>> On 30 March 2015 at 15:26, Russell King - ARM Linux
>> <linux@arm.linux.org.uk> wrote:
>>> On Mon, Mar 30, 2015 at 02:38:35PM +0200, Michal Marek wrote:
>>>> Is this a limitation of a particular ARM ABI or a limitation of a state
>>>> of the art ARM linker or something else?
>>>
>>> It's a limitation of the ARM ISA.
>>>
>>> Normal PC-relative branches, which are emitted by the C compiler, can
>>> branch +/- 32MB for ARM, or +/- 16MB of Thumb.  Beyond that, the address
>>> offset is not representable in the instruction.
>
> Thank you both for the explanation!
>
>
>>> The question is: how far do we go with allyesconfig... do we want it
>>> to work, or is reaching the final link sufficient?
>
> It certainly is more useful as a test tool if the baseline is a
> successful compile and link. Because you can have genuine link errors
> due to missing symbols.
>

Agreed

>
>>> If we do tweak
>>> stuff to allow the link to work, are we going to try running it?
>
> Good question. I myself always treated all{yes,mod}config as a build
> test only and never dared to run it. Allyesconfig produces a giant
> kernel image and allmodconfig builds binfmt_script as a module. And if
> people used all*config for boot tests, they would probably be sending
> patches to tweak the Kconfigs for that purpose. And this is not the case
> as far as I can tell.
>

Russell should confirm this, but I think running such a large kernel
is non-trivial on ARM, since the decompressor should make room for the
decompressed image by moving itself upward in memory, and it may
overwrite the device tree binary in the process.

>
>> That is an excellent question, hence the RFC in the subject line.
>>
>> Note that the other patch, the one against kallsyms, addresses the
>> issue where the distance between the beginning of .text and the end of
>> .init.text  exceeds this limit, which is not as unlikely as the issue
>> that this patch addresses, where just drivers/built-in.o in isolation
>> already exceeds this limit.
>>
>> So I am quite happy to drop this, especially as we can add
>> -ffunction-sections as well.
>
> What you could do is to add a Kconfig option to arch/arm/Kconfig adding
> -ffunction-sections to the compiler flags. Then allyesconfig would
> select it and work around the problem in a somewhat elegant way.
>

Excellent idea! Arnd hasn't chimed in yet, but he is the one doing
lots and lots of randconfig builds and other test builds, so I will
wait for him to confirm that this is a useful thing to have.

Thanks,
Ard.
