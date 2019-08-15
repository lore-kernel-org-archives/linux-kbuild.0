Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45378 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726504AbfHOXyN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Aug 2019 19:54:13 -0400
MIME-Version: 1.0
References: <20190815182029.197604-1-nhuck@google.com> <20190815204529.GA69414@archlinux-threadripper>
 <CANiq72nM4d-rc_qUMUEisXyEU9A0mbW=O_w5X0zoqWNPLacuNw@mail.gmail.com> <CAKwvOdm4Lsj1mPn3+FtPDrNVSQovsw8Fe9u6Yw3te7pD-izAog@mail.gmail.com>
In-Reply-To: <CAKwvOdm4Lsj1mPn3+FtPDrNVSQovsw8Fe9u6Yw3te7pD-izAog@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 16 Aug 2019 01:53:59 +0200
Message-ID: <CANiq72mVSyr6zvem13v5JNR=GTDnB1fgO=9P2Qimc=GekLB-kA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Require W=1 for -Wimplicit-fallthrough with clang
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <natechancellor@gmail.com>, Nathan Huckleberry <nhuck@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Joe Perches <joe@perches.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>

On Fri, Aug 16, 2019 at 1:05 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Aug 15, 2019 at 3:59 PM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > On Thu, Aug 15, 2019 at 10:45 PM Nathan Chancellor
> > <natechancellor@gmail.com> wrote:
> > > * Revert commit bfd77145f35c ("Makefile: Convert -Wimplicit-fallthrough=3
> > > to just -Wimplicit-fallthrough for clang") for the time being and just
> > > rely on adding -Wimplicit-fallthrough to KCFLAGS for testing.
> >
> > I would avoid applying commits that will have to be reverted just for
> > Clang, particularly since it is not fully supported yet.
>
> "not fully supported yet" you say? *drops monocle*
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/MAINTAINERS?h=v5.3-rc4#n4001

By fully supported I mean it already works and people can rely on it
out of the box using a released version of Clang/LLVM. Is that the
case already? If so, many places need updating!

  * include/linux/compiler-clang.h should check for the minimum
supported version
  * Documentation/process/programming-language.rst should be updated
  * https://github.com/ClangBuiltLinux/linux/wiki does not mention anything

etc.

Cheers,
Miguel
