Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f196.google.com ([209.85.217.196]:41426 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965425AbeAMJcM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 13 Jan 2018 04:32:12 -0500
MIME-Version: 1.0
In-Reply-To: <20180112193857.GA426@ravnborg.org>
References: <1507172808-12246-1-git-send-email-ulfalizer@gmail.com>
 <CAK7LNAT2_Su7=ADrVUsZ0EgTsyh_3QT=nWZV9E5DyFHFDhegbQ@mail.gmail.com>
 <CAFkk2KSZgjuNxq1keqbJtHsWF_c=opkBmu+_NyVUAnsHcTrM3Q@mail.gmail.com> <20180112193857.GA426@ravnborg.org>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Sat, 13 Jan 2018 10:32:11 +0100
Message-ID: <CAFkk2KR=N+9rGbVjMwksi7fYeE1KzzDZQz9zA34PbDXVAkwwtw@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Sync zconf.y with zconf.tab.c_shipped
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, Arnaud Lacombe <lacombar@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Jan 12, 2018 at 8:38 PM, Sam Ravnborg <sam@ravnborg.org> wrote:
> Hi Ulf, Masahiro
>
>> >
>> > BTW, I do not know the historical reason
>> > why zconf instead of kconf in the first place...
>>
>> I have no idea either. kconfig.{l,y} and kconfig_*() would be a lot
>> less confusing.
>
> zconf was the name originally invented by Roman Zippel.
> kconfig had the name "lc" in the original submission,
> but was later renamed to kconfig.
> And if memory serves me correct the original codebase used zconf.
>
> The use of Kconfig for the files was first introduced here:
> https://sourceforge.net/p/kbuild/mailman/message/8519479/
> This was before lc aka kconfig was included in the kernel.
>
> This was all in a period after the huge CML2 flamewars
> which some oldies may remember.
>
> Surfing dwom memory lane was fun - lot of mails.
>
> This was also back when Keith Ownes attempt for a new generation
> kbuild was rejected and Kai Germaschewski migrated the
> old build system to something that was good and reliable.
>
> Fun times indeed :-)
> For some of the involved this was not fun at all - investing a lot
> of time and then see it rejected is never fun.
>
>         Sam

Thanks for the history lesson.

Had heard of the CML2 drama. Bit of a second-system effect going on
there I think.

Python all the way back in 2002 was unexpected. Can see why people
might have been opposed to that.

History aside, I'm all for renaming some things if anyone steps up.
Explicit naming goes a long way for me.

Cheers,
Ulf
