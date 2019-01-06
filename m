Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:63729 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbfAFBDx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 5 Jan 2019 20:03:53 -0500
MIME-Version: 1.0
References: <CAK7LNAQzEHv7Y69xFTPDEhyMP6JX4ghb96UMqMdxYyVyah6-VA@mail.gmail.com>
 <CAHk-=whg49nn5q_2QVMGN0u4rQFBmRKywtqJUSk+5=rBzTk1kg@mail.gmail.com>
 <20190105203906.GA22423@ravnborg.org> <CAHk-=wh0rrLKYOxW6hAVaQ8rFGno7Q=XKrd13mfLXyd__WnTPw@mail.gmail.com>
In-Reply-To: <CAHk-=wh0rrLKYOxW6hAVaQ8rFGno7Q=XKrd13mfLXyd__WnTPw@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 6 Jan 2019 10:03:12 +0900
Message-ID: <CAK7LNAQjCdt1Ts7t=+92YRK_ThhLaE0Af5W-S9yEg1Br2DvmTA@mail.gmail.com>
Subject: Re: [GIT PULL 1/4] Kbuild updates for v4.21
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Linus,


On Sun, Jan 6, 2019 at 5:44 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sat, Jan 5, 2019 at 12:39 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > Not exactly what you ask for - but we have make V=2
>
> Yeah, that's certainly more convenient than "make --debug".
>
> That said, I was more thinking of not any particular "oh, it's
> recompiling everything" situation (by then it's too late, obviously),
> but if somebody has been looking at tools for finding and maybe
> breaking some of our deeper include chains.
>
> I know it has come up before (the x86 people did the
> <linux/schedule.h> split some years ago) and then it was all manual.
> But I was kind of hoping that maybe some of the kbuild people had
> looked at this?


Sorry, I do not know more information than Sam provided.

I got rid of some unneeded header inclusions in the past,
but my work was also manual.



-- 
Best Regards
Masahiro Yamada
