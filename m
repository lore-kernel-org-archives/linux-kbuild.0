Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:35719 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751314AbeBTUKB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Feb 2018 15:10:01 -0500
Received: by mail-ua0-f194.google.com with SMTP id n1so9190028uaa.2
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Feb 2018 12:10:00 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180220195119.GA14262@vmlxhi-102.adit-jv.com>
References: <cover.1518985888.git.erosca@de.adit-jv.com> <CAK7LNAQ4z9KHsCvzQRHozcXrxY5wsLnMCqWP7weSLFC4mxh6fg@mail.gmail.com>
 <CAK7LNARtH1fepGc_+E4uzhoc=ykuF1HXpy0g7wx=5xZyL7G1YQ@mail.gmail.com>
 <20180220150018.mjyjmdmao7xqyukr@huvuddator> <20180220195119.GA14262@vmlxhi-102.adit-jv.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Tue, 20 Feb 2018 21:09:59 +0100
Message-ID: <CAFkk2KRxERva+XZi_fR_Epr63TwA6hKjwjCYnwtnK+xOSJUWHg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Kconfig: Print reverse dependencies in groups
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Eugeniu Rosca <erosca@de.adit-jv.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Eugeniu Rosca <roscaeugeniu@gmail.com>, Petr Vorel <petr.vorel@gmail.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, Feb 20, 2018 at 8:52 PM, Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
> On Tue, Feb 20, 2018 at 04:00:18PM +0100, Ulf Magnusson wrote:
>> On Tue, Feb 20, 2018 at 05:24:01PM +0900, Masahiro Yamada wrote:
>> > 2018-02-20 17:13 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
>> > >
>> > > I do not like this implementation.
>> > > The code is super ugly, the diff-stat is too much than needed.
>> > >
>> > > Please rewrite the code within 20 lines.
>> > >
>> >
>> > For a hint, I cleaned up the code base.
>> > https://patchwork.kernel.org/patch/10229545/
>> >
>> > which should be equivalent to yours:
>> > https://patchwork.kernel.org/patch/10226951/
>> >
>> >
>> > No 'enum print_type', please.
>>
>> The reason I prefer them on separate lines consistently is to avoid stuff like the following:
>>
>>   Selected by [y]: MV_XOR_V2 [=y] && DMADEVICES [=y] && ARM64 [=y]
>>   Selected by [n]:
>>   - AMCC_PPC440SPE_ADMA [=n] && DMADEVICES [=y] && (440SPe || ...
>>   - FSL_RAID [=n] && DMADEVICES [=y] && FSL_SOC && ...
>>   - INTEL_IOATDMA [=n] && DMADEVICES [=y] && PCI [=y] && X86_64
>>
>> That looks confusing and unbalanced to me.
>
> I think nobody is disputing this. Masahiro's
> https://patchwork.kernel.org/patch/10229545/ is also showing every
> reverse dependency top level OR expression on a new row.

Ohh... sorry, didn't read closely enough.

Yeah, I agree that that looks like a nice and neat solution.

>
>>
>> There are some simple ways to trim down the size of this patchset
>> though.
>>
>> Eugeniu:
>> What do you think about the following refactoring of your 3/3 patch?
>> Maybe there's a way to have expr_print_revdep() take just a tristate
>> too, though it's not worth it if it just grows the code elsewhere.
>>
>
> Well, Masahiro requests not using 'enum print_type' and I still see it
> in your example.

One alternative would be to keep the 'revdep' flag and add an extra
tristate parameter for the kinds of selects to print.

I'm not a huge fan of having parameters that turn meaningless
depending on the values of other parameters, but it might not be
terrible there, if we must get rid of 'enum print_type'. I'm always
open to other suggestions too.

The whole expression printing code feels a bit twisty to me with all
the mutual recursion and stuff going on, but that's outside the scope
of this patchset. :)

>
>> (By the way, I noticed that expr_print_revdep() previously generated a
>> warning suggesting parentheses, which was my fault. If you saw that,
>> don't copy my mistakes. The build should be warning-free. :)
>
> I didn't notice any warnings using gcc 5.4.0.

I'm on 7.2.0, so that's probably why. It was "just" a style warning anyway. :)

Cheers,
Ulf
