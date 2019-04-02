Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:20968 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725778AbfDBEuh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Apr 2019 00:50:37 -0400
MIME-Version: 1.0
References: <20190211193008.24101-1-ndesaulniers@google.com>
 <20190211193008.24101-3-ndesaulniers@google.com> <CAK7LNATZY-K4g81LLvXpjp=+oMSY8L0wQoVXgHt-Bjrb2WXnNg@mail.gmail.com>
 <CAKwvOdmyNFsV=67eLQtETSDJJyDZ8aEJY1+LHuoP4OtpdQOdWQ@mail.gmail.com>
 <CAK7LNAQMoYNevPns0zSaSx0iU5LA+2146snNDmy9fF8v5ej5tg@mail.gmail.com> <CAKwvOd=h9F1hVjE7C=5mjtF0EXnBW9zTuR78gczhHBv9YUT=Cw@mail.gmail.com>
In-Reply-To: <CAKwvOd=h9F1hVjE7C=5mjtF0EXnBW9zTuR78gczhHBv9YUT=Cw@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 2 Apr 2019 13:49:44 +0900
Message-ID: <CAK7LNAQw7nPwykOEV5i+yWjkxzgf1gPa5ewFhDxbbn8XXjwFUA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] Makefile: lld: tell clang to use lld
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <natechancellor@gmail.com>, Sedat Dilek <sedat.dilek@gmail.com>, Kees Cook <keescook@chromium.org>, Sami Tolvanen <samitolvanen@google.com>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Dominik Brodowski <linux@dominikbrodowski.net>, Nicholas Piggin <npiggin@gmail.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Vasily Gorbik <gor@linux.ibm.com>, Adrian Reber <adrian@lisas.de>, Richard Guy Briggs <rgb@redhat.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Peter Smith <Peter.Smith@arm.com>, Stephen Hines <srhines@google.com>

Hi Nick,


On Tue, Apr 2, 2019 at 12:54 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Sat, Feb 16, 2019 at 10:09 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > On Thu, Feb 14, 2019 at 8:08 AM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > > On Wed, Feb 13, 2019 at 6:59 AM Masahiro Yamada
> > > <yamada.masahiro@socionext.com> wrote:
> > > >
> > > > On Tue, Feb 12, 2019 at 5:42 AM <ndesaulniers@google.com> wrote:
> > > > >
> > > > > This is needed because clang doesn't select which linker to use based on
> > > > > $LD but rather -fuse-ld=lld. This is problematic especially for
> > > > > cc-ldoption, which checks for linker flag support via invoking the
> > > > > compiler, rather than the linker.
> > > >
> > > >
> > > > Sorry, please explain what kind of problem
> > > > this patch solves.
> > > >
> > > >
> > > >
> > > > [1] $(LD) is used to link vmlinux, modules, etc.
> > > >
> > > > [2] $(CC) is used to link vdso, etc.
> > > >     and -fuse-ld= selects which linker is invoked from $(CC)
> > >
> > > It solves case 2.
> > >
> > > >
> > > >
> > > > Is it a problem to use a different
> > > > type of linker for [1] and [2] ?
> > >
> > > Ideally, no, but I can think of at least one case where it might be
> > > problematic to mix linkers like that:
> > > You might be mixing linker flags added via ld-option from one linker
> > > that aren't actually supported by the other linker.
> >
> > You can do this only when you are sure
> > that the _exactly_ same linker is used.
> >
> > In my understanding, -fuse-ld=lld does not guarantee it.
>
> I really don't think we should be mixing and matching linkers during a
> kernel build.  When we compile with clang, we don't have escape
> hatches that allow for some object files to be compiled with GCC
> (mixing clang and GCC compiled object files into one build).
> Following the same logic, I think mixing linkers during kernel build
> should similarly be dissuaded.  This patch AVOIDS clang using a
> different linker than what was specified via $LD, which is CRITICAL
> for cc-ldoption kbuild macro.  Masahiro, I hope this patch can be
> re-evaluated, or if I'm not understanding your point, that you can
> provide additional clarification.
>



You can pass an absolute pass to LD, like

make LD=/path/to/my/llvm/install/dir/bin/ld.lld

This clarifies which linker is being used
even when multiple versions of llvm are installed
on the machine.


However, -fuse-ld=lld is ambiguous.
Will it use the first ld.lld found in PATH?

So, you cannot avoid mixing linkers by this means.


If we could do -fuse=$(LD), I would agree with it.
Clang accepts -fuse=<absolute-path>, GCC does not.

Is there a way to control the linker search path?


-- 
Best Regards
Masahiro Yamada
