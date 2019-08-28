Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46986 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbfH1Rjb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Aug 2019 13:39:31 -0400
Received: by mail-pg1-f194.google.com with SMTP id m3so86965pgv.13
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Aug 2019 10:39:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190815225844.145726-1-nhuck@google.com> <20190827004155.11366-1-natechancellor@gmail.com>
 <CAK7LNATHj5KrnFa0fvHjuC-=5mV8VBT14vrpPMfuNKWw7wabag@mail.gmail.com> <CANiq72ndWZWD-KBT1s-mUxQNa1jaD7oDaCB2+NPiT1chf14Z_g@mail.gmail.com>
In-Reply-To: <CANiq72ndWZWD-KBT1s-mUxQNa1jaD7oDaCB2+NPiT1chf14Z_g@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 28 Aug 2019 10:39:19 -0700
Message-ID: <CAKwvOdkuDPfOusJRneeTzg7tZ4VKxaRCNg2SgmjVas58cDwe8w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Do not enable -Wimplicit-fallthrough for clang
 for now
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Nathan Chancellor <natechancellor@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Nathan Huckleberry <nhuck@google.com>, Joe Perches <joe@perches.com>

On Wed, Aug 28, 2019 at 9:45 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Aug 28, 2019 at 6:21 PM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > Applied to linux-kbuild. Thanks.
> >
> > (If other clang folks give tags, I will add them later.)
>
> Acked-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

I verified that GCC didn't get support for -Wimplicit-fallthrough
until GCC ~7.1 release, so the cc-option guard is still required.
Acked-by: Nick Desaulniers <ndesaulniers@google.com>
Thanks for the patch Nathan.
-- 
Thanks,
~Nick Desaulniers
