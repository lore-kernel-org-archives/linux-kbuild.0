Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37124 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726563AbfH1RoY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Aug 2019 13:44:24 -0400
Received: by mail-pg1-f194.google.com with SMTP id d1so119712pgp.4
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Aug 2019 10:44:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190815225844.145726-1-nhuck@google.com> <20190827004155.11366-1-natechancellor@gmail.com>
 <CAK7LNATHj5KrnFa0fvHjuC-=5mV8VBT14vrpPMfuNKWw7wabag@mail.gmail.com>
 <CANiq72ndWZWD-KBT1s-mUxQNa1jaD7oDaCB2+NPiT1chf14Z_g@mail.gmail.com> <CAKwvOdkuDPfOusJRneeTzg7tZ4VKxaRCNg2SgmjVas58cDwe8w@mail.gmail.com>
In-Reply-To: <CAKwvOdkuDPfOusJRneeTzg7tZ4VKxaRCNg2SgmjVas58cDwe8w@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 28 Aug 2019 10:44:12 -0700
Message-ID: <CAKwvOdnOo3RXm3cx5YDtPyM=9Ry7kss-i4HzjxQkK4pjE-n9Lw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Do not enable -Wimplicit-fallthrough for clang
 for now
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Nathan Chancellor <natechancellor@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Nathan Huckleberry <nhuck@google.com>, Joe Perches <joe@perches.com>

On Wed, Aug 28, 2019 at 10:39 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, Aug 28, 2019 at 9:45 AM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > On Wed, Aug 28, 2019 at 6:21 PM Masahiro Yamada
> > <yamada.masahiro@socionext.com> wrote:
> > >
> > > Applied to linux-kbuild. Thanks.
> > >
> > > (If other clang folks give tags, I will add them later.)
> >
> > Acked-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
>
> I verified that GCC didn't get support for -Wimplicit-fallthrough
> until GCC ~7.1 release, so the cc-option guard is still required.
> Acked-by: Nick Desaulniers <ndesaulniers@google.com>
> Thanks for the patch Nathan.

Also, there's an inconsistency between Makefile vs
scripts/Makefile.extrawarn that's been bugging me: it seems we enable
GCC only flags in Makefile, then disable certain Clang flags in
scripts/Makefile.extrawarn.  Not necessary to fix here and now, but I
hope one day to have one file that has all of the compiler specific
flags in one place (maybe its own file), so I only have to look in one
place.  I know, I know, "patches welcome." ;)

-- 
Thanks,
~Nick Desaulniers
