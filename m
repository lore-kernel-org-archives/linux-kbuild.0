Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:23206 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgDGS4q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Apr 2020 14:56:46 -0400
MIME-Version: 1.0
References: <CA+icZUWnZwaNooj4WLvS7FKhkDgq3R3xUaQ8hFjuDgZTSj0s2Q@mail.gmail.com>
In-Reply-To: <CA+icZUWnZwaNooj4WLvS7FKhkDgq3R3xUaQ8hFjuDgZTSj0s2Q@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 8 Apr 2020 03:55:59 +0900
Message-ID: <CAK7LNATub3fpeTY67miVYJ27MtfwaeETW0HrWHYdM0mmaKCYPA@mail.gmail.com>
Subject: Re: kbuild: do not pass $(KBUILD_CFLAGS) to scripts/mkcompile_h
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, Thomas Gleixner <tglx@linutronix.de>

Hi Sedat,

On Mon, Apr 6, 2020 at 7:01 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> [ Please CC me I am not subscribed to this mailing-list ]
>
> Hi,
>
> I think with your patch in [1] line #56 can go away, too?
>
> [ scripts/mkcompile_h ]
>
> 53 # Generate a temporary compile.h
> 54
> 55 { echo /\* This file is auto generated, version $VERSION \*/
> 56   if [ -n "$CONFIG_FLAGS" ] ; then echo "/* $CONFIG_FLAGS */"; fi



I think the this inserts a comment line
to make sure compile.h is updated
when any of CONFIG_SMP, CONFIG_PREEMPT, CONFIG_PREEMPT_RT
is changed.

So, this is unrelated to my patch at least.


> Thanks.
>
> Regards,
> - Sedat -
>
> [1] https://patchwork.kernel.org/patch/11473667/



-- 
Best Regards
Masahiro Yamada
