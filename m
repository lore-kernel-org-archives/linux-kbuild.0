Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43082 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbgDHIAp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Apr 2020 04:00:45 -0400
MIME-Version: 1.0
References: <CA+icZUWnZwaNooj4WLvS7FKhkDgq3R3xUaQ8hFjuDgZTSj0s2Q@mail.gmail.com>
 <CAK7LNATub3fpeTY67miVYJ27MtfwaeETW0HrWHYdM0mmaKCYPA@mail.gmail.com>
In-Reply-To: <CAK7LNATub3fpeTY67miVYJ27MtfwaeETW0HrWHYdM0mmaKCYPA@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Wed, 8 Apr 2020 10:00:30 +0200
Message-ID: <CA+icZUV0omDqrmcR__bLVCDevCBQV7KjJ=dOyuQct5AZEoKWew@mail.gmail.com>
Subject: Re: kbuild: do not pass $(KBUILD_CFLAGS) to scripts/mkcompile_h
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, Thomas Gleixner <tglx@linutronix.de>

On Tue, Apr 7, 2020 at 8:56 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Hi Sedat,
>
> On Mon, Apr 6, 2020 at 7:01 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > [ Please CC me I am not subscribed to this mailing-list ]
> >
> > Hi,
> >
> > I think with your patch in [1] line #56 can go away, too?
> >
> > [ scripts/mkcompile_h ]
> >
> > 53 # Generate a temporary compile.h
> > 54
> > 55 { echo /\* This file is auto generated, version $VERSION \*/
> > 56   if [ -n "$CONFIG_FLAGS" ] ; then echo "/* $CONFIG_FLAGS */"; fi
>
>
>
> I think the this inserts a comment line
> to make sure compile.h is updated
> when any of CONFIG_SMP, CONFIG_PREEMPT, CONFIG_PREEMPT_RT
> is changed.
>
> So, this is unrelated to my patch at least.
>

I mixed up CONFIG_FLAGS with KBUILD_CFLAGS - my bad.

- sed@ -

>
> > Thanks.
> >
> > Regards,
> > - Sedat -
> >
> > [1] https://patchwork.kernel.org/patch/11473667/
>
>
>
> --
> Best Regards
> Masahiro Yamada
