Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:42014 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752071AbeBWWSS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 23 Feb 2018 17:18:18 -0500
Received: by mail-ua0-f193.google.com with SMTP id b23so4377574uak.9
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Feb 2018 14:18:18 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180223140420.GA10547@vmlxhi-102.adit-jv.com>
References: <cover.1518985888.git.erosca@de.adit-jv.com> <CAK7LNAQ4z9KHsCvzQRHozcXrxY5wsLnMCqWP7weSLFC4mxh6fg@mail.gmail.com>
 <CAK7LNARtH1fepGc_+E4uzhoc=ykuF1HXpy0g7wx=5xZyL7G1YQ@mail.gmail.com>
 <20180220150018.mjyjmdmao7xqyukr@huvuddator> <20180220195119.GA14262@vmlxhi-102.adit-jv.com>
 <CAFkk2KRxERva+XZi_fR_Epr63TwA6hKjwjCYnwtnK+xOSJUWHg@mail.gmail.com>
 <CAK7LNATTqqzJReUfkoxE=5+GsVUMv4wjOuz--=-PY_B4eK4NeA@mail.gmail.com>
 <20180221061052.GA29861@example.com> <CAK7LNATHuCmU3WJJZs_S6ppZ2dbaZJa66yWhaCRJxqB6PLXgQg@mail.gmail.com>
 <20180223140420.GA10547@vmlxhi-102.adit-jv.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Fri, 23 Feb 2018 23:18:17 +0100
Message-ID: <CAFkk2KRfaDZQG-F=3i-kQbGH6JzxP1q_fvKPzK1A_hJUb0GkMQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Kconfig: Print reverse dependencies in groups
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Eugeniu Rosca <erosca@de.adit-jv.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Eugeniu Rosca <roscaeugeniu@gmail.com>, Petr Vorel <petr.vorel@gmail.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Fri, Feb 23, 2018 at 3:04 PM, Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
>
> Hi Masahiro,
>
> On Fri, Feb 23, 2018 at 09:10:37PM +0900, Masahiro Yamada wrote:
>> Eugeniu,
>>
>>
>> 2018-02-21 15:10 GMT+09:00 Eugeniu Rosca <roscaeugeniu@gmail.com>:
>>
>> >
>> > I've tested https://patchwork.kernel.org/patch/10229545/ and
>> > https://patchwork.kernel.org/patch/10231295/ and they work great for me.
>> > Thank you for this feature.
>> >
>>
>> I will give you that code in the second one.
>
> I appreciate that, although I am open minded who takes the authorship.
> This feature makes my life easier and that's the most important part.
>
>>
>> Please fill the commit log with yours,
>> and also fix the bugs pointed by Petr.
>
> Sure. Will do that.
>
>> Anyway, I will claim my contribution
>> in the form of Signed-off-by when I pick it up.  :)
>
> I have one side question loosely related to this patch.
>
> Reverse dependencies are still not printed in zconfdump() (used in our kernel
> team for e.g. cross platform .config alignment/comparison). My gut feeling
> tells me this is mainly caused by the extremely unfriendly unreadable
> expressions which is how reverse dependencies used to be represented before
> commit 1ccb27143360 ("kconfig: make "Selected by:" and "Implied by:"
> readable"). Since this is now greatly improved, would you mind printing
> Selected/Implied-by in zconfdump? There are also other zconfdump fixes
> sitting in my local branch, like https://patchwork.kernel.org/patch/9253535/ .
> I would like to push them to you (they probably deserve a separate
> thread), if you think this is appropriate.
>
> Best regards,
> Eugeniu.

Shameless plug:

If you need to do any fancy Kconfig parsing and comparison, then
Kconfiglib (https://github.com/ulfalizer/Kconfiglib) might be handy.
It makes it easy to walk the menu tree, print and inspect symbols and
expressions, etc.

Cheers,
Ulf
