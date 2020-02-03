Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:46919 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727728AbgBCMEW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Feb 2020 07:04:22 -0500
MIME-Version: 1.0
References: <CAK7LNAS625YwKpv4wfKO78+Rexe2fP5pLDbMD4r71wwiQfN0Ng@mail.gmail.com>
 <CAHk-=wiTEVwmj-PH98reZTibx+C_GLwAmXO0RFmJa9weZcg70g@mail.gmail.com>
 <CAK7LNAQwJVnVti4cX2GHdekD0mx1Kc2A3xvsE63WhHAGvgW2QA@mail.gmail.com> <CAHk-=wi2=8tYULPzHNZXLcMYr-zPpMchfhy4nyTjLBpvH5yHhg@mail.gmail.com>
In-Reply-To: <CAHk-=wi2=8tYULPzHNZXLcMYr-zPpMchfhy4nyTjLBpvH5yHhg@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 3 Feb 2020 21:03:36 +0900
Message-ID: <CAK7LNARA9GmCE3fr4JiHKNBMnQ_D0yik2UHtPHXq621J8_satQ@mail.gmail.com>
Subject: Re: [GIT PULL 1/2] Kbuild updates for v5.6-rc1
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Linus,


On Mon, Feb 3, 2020 at 8:07 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
>
>
> On Mon, Feb 3, 2020, 01:16 Masahiro Yamada <masahiroy@kernel.org> wrote:
>>
>>
>> Generally, initramfs is passed from a boot-loader,
>> but some architectures embed initramfs into vmlinux
>> (perhaps due to poor boot-loader support??)
>
>
> You didn't answer my real question.
>
> Why do we give the user the choice, when it doesn't matter, and the user doesn't care?

I do not want that commit simply reverted.

Please let me clarify what you want to see:

[1] Remove this choice completely ?
    The build system will choose the best one.
    For example, CONFIG_RD_XZ  is enabled,
    '.xz' is _always_ preferred choice over '.gz'


[2] Hide this choice unless INITRAMFS_SOURCE!=""

    As Geert mentioned, we still could save
    a little more data size, but we assume
    people would not care about hundreds bytes.


Which one ?


[2] was the previous behavior.
I think you are complaining
because you noticed a new prompt showed up.


> The argument for the commit was "it's simpler".
>
> But that is simply not *true*.
>
> It's simpler only technically. It's more complexity for the only party that matters: the user.
>
> So I'm likely going to just revert that commit as incorrect and misleading. It's not simpler at all. It's more complex.
>
> The configuration code should care about the user interface more than it seems to do. Some complexity in order to make for less pointless questions is food m good.
>
>        Linus



--
Best Regards
Masahiro Yamada
