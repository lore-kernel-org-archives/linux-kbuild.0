Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f193.google.com ([209.85.160.193]:43136 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725798AbfBTVNl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Feb 2019 16:13:41 -0500
MIME-Version: 1.0
References: <20190219214940.391081-1-arnd@arndb.de> <CAAeHK+xSpsu0tNmeq0wKXfT=0HuORnvU+XzLswDzhbtfZVa4Hw@mail.gmail.com>
 <CAK8P3a1NfHohd1xT7iHK85L2PGnD95RJvwFi-2cWrFpipQzqwg@mail.gmail.com>
 <b109ad0d-6995-8ca2-5426-7e2627d2032c@virtuozzo.com> <CAK8P3a0tg1WRLK=fs9S+X4TPB7sR55ZsjMbBVX07AtAfguXCsw@mail.gmail.com>
 <CAKwvOd=XrNNb=r3qgsT8O6JNzL4hg4pqfJJFcY2DzA0Ooc=E3w@mail.gmail.com>
 <20190220184408.GG9878@sirena.org.uk> <CAKwvOdne3aE5bUsQF-2C-L2Xezqq9qb=NqF8FA+B7nvqXKAXFA@mail.gmail.com>
In-Reply-To: <CAKwvOdne3aE5bUsQF-2C-L2Xezqq9qb=NqF8FA+B7nvqXKAXFA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 20 Feb 2019 22:13:22 +0100
Message-ID: <CAK8P3a1pop4WqWxV=-R4n1Lh3FYG0mb4iJk4=saq6CgzpsPe4A@mail.gmail.com>
Subject: Re: [PATCH] kasan: turn off asan-stack for clang-8 and earlier
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Mark Brown <broonie@kernel.org>, Kostya Serebryany <kcc@google.com>, Evgenii Stepanov <eugenis@google.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Andrey Konovalov <andreyknvl@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>, Qian Cai <cai@lca.pw>, Alexander Potapenko <glider@google.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Christoph Lameter <cl@linux.com>, LKML <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>

On Wed, Feb 20, 2019 at 9:02 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, Feb 20, 2019 at 10:44 AM Mark Brown <broonie@kernel.org> wrote:
> >
> > On Wed, Feb 20, 2019 at 10:07:36AM -0800, Nick Desaulniers wrote:
> >
> > > I like Evgenii's idea:
> > > https://bugs.llvm.org/show_bug.cgi?id=38809#c10
> >
> > That's a suggestion to tune the inlining heuristics.
>
> Yes; but it will also improve KASAN (if feasible).

From my experiments that I cited in the bug report, very few cases
seem to actually be the result of different inlining decisions, and those
that are tend to be kernel bugs (e.g. in drivers/scsi/bfa/bfa_fcs_lport.c
clang reports a larger stack than gcc because it combines two functions
that individually use 800 bytes each, but if one calls the other, we
use even more stack than the combined function).

In the example in https://bugs.llvm.org/show_bug.cgi?id=38809#c12
(https://godbolt.org/z/ylsGSQ) there is no inlining, yet clang uses
over ten times as much stack space as gcc, for reasons I still
can't explain. My assumption right now is that the underlying bug
causes most of the problems with excessive stack usage in
allmodconfig kernels.

> > > While I myself share Arnd's goal of driving compiler warnings to zero,
> > > in general I'd prefer not to disable warning-producing-features or
> > > disable warnings outright for cases where we have some ideas of
> > > changes we can make to the compiler.  There's probably a list now of
> > > false warnings produced by old versions of Clang from bugs in Clang
> > > that we fixed.  I'm not interested in additionally trying to work
> > > around those somehow in kernel sources.
> >
> > We do have infrastructure in the kernel for managing warnings based on
> > compiler version (Arnd was looking at some improvements to that IIRC),
> > if we've got a kernel that builds with a given compiler it's worth
> > looking at tuning what we do with that compiler.  If newer versions of
> > the compiler work better or have new options we can turn things on for
> > them.
>
> so maybe something like (pseudocode):
> if kasan && clang && clang_version < 9:
>   disable -Wframe-larger-than=
>
> If you overrun the stack with KASAN, a warning would be nice, but
> you'll hopefully find out the hard way at runtime.  And that doesn't
> require up to 114 Makefile changes, which would be kind of obnoxious
> for this papercut.

That would mean that build testing allmodconfig with clang would
ignore all the interesting stack overflow bugs that happen in real
user systems without KASAN.

       Arnd
