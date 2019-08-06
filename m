Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:54321 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726713AbfHFJfx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Aug 2019 05:35:53 -0400
MIME-Version: 1.0
References: <20190806043729.5562-1-yamada.masahiro@socionext.com> <CAK8P3a2POcb+AReLKib513i_RTN9kLM_Tun7+G5LOacDuy7gjQ@mail.gmail.com>
In-Reply-To: <CAK8P3a2POcb+AReLKib513i_RTN9kLM_Tun7+G5LOacDuy7gjQ@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 6 Aug 2019 18:35:06 +0900
Message-ID: <CAK7LNARvsUB1a0LJvtJXKZZv2fiHAMrojKbF82--C4yQs=k35w@mail.gmail.com>
Subject: Re: [RFC PATCH] kbuild: re-implement detection of CONFIG options
 leaked to user-space
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, bpf@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Networking <netdev@vger.kernel.org>, Amit Pundir <amit.pundir@linaro.org>

Hi Arnd,

On Tue, Aug 6, 2019 at 6:00 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Aug 6, 2019 at 6:38 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > I was playing with sed yesterday, but the resulted code might be unreadable.
> >
> > Sed scripts tend to be somewhat unreadable.
> > I just wondered which language is appropriate for this?
> > Maybe perl, or what else? I am not good at perl, though.
>
> I like the sed version, in particular as it seems to do the job and
> I'm not volunteering to write it in anything else.
>
> > Maybe, it will be better to fix existing warnings
> > before enabling this check.
>
> Yes, absolutely.
>
> > If somebody takes a closer look at them, that would be great.
>
> Let's see:

Thanks for looking into these!

If possible, could you please send patches to fix them?
We can start with low-hanging fruits to reduce the number of warnings.

Thank you.

-- 
Best Regards
Masahiro Yamada
