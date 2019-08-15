Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41521 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731937AbfHOXFb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Aug 2019 19:05:31 -0400
Received: by mail-pg1-f195.google.com with SMTP id x15so1954327pgg.8
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2019 16:05:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190815182029.197604-1-nhuck@google.com> <20190815204529.GA69414@archlinux-threadripper>
 <CANiq72nM4d-rc_qUMUEisXyEU9A0mbW=O_w5X0zoqWNPLacuNw@mail.gmail.com>
In-Reply-To: <CANiq72nM4d-rc_qUMUEisXyEU9A0mbW=O_w5X0zoqWNPLacuNw@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 15 Aug 2019 16:05:19 -0700
Message-ID: <CAKwvOdm4Lsj1mPn3+FtPDrNVSQovsw8Fe9u6Yw3te7pD-izAog@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Require W=1 for -Wimplicit-fallthrough with clang
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Nathan Chancellor <natechancellor@gmail.com>, Nathan Huckleberry <nhuck@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Joe Perches <joe@perches.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>

On Thu, Aug 15, 2019 at 3:59 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Aug 15, 2019 at 10:45 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> > * Revert commit bfd77145f35c ("Makefile: Convert -Wimplicit-fallthrough=3
> > to just -Wimplicit-fallthrough for clang") for the time being and just
> > rely on adding -Wimplicit-fallthrough to KCFLAGS for testing.
>
> I would avoid applying commits that will have to be reverted just for
> Clang, particularly since it is not fully supported yet.

"not fully supported yet" you say? *drops monocle*
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/MAINTAINERS?h=v5.3-rc4#n4001
-- 
Thanks,
~Nick Desaulniers
