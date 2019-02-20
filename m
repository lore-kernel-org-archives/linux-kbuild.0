Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43126 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725798AbfBTUCm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Feb 2019 15:02:42 -0500
Received: by mail-pg1-f196.google.com with SMTP id l11so924946pgq.10
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Feb 2019 12:02:42 -0800 (PST)
MIME-Version: 1.0
References: <20190219214940.391081-1-arnd@arndb.de> <CAAeHK+xSpsu0tNmeq0wKXfT=0HuORnvU+XzLswDzhbtfZVa4Hw@mail.gmail.com>
 <CAK8P3a1NfHohd1xT7iHK85L2PGnD95RJvwFi-2cWrFpipQzqwg@mail.gmail.com>
 <b109ad0d-6995-8ca2-5426-7e2627d2032c@virtuozzo.com> <CAK8P3a0tg1WRLK=fs9S+X4TPB7sR55ZsjMbBVX07AtAfguXCsw@mail.gmail.com>
 <CAKwvOd=XrNNb=r3qgsT8O6JNzL4hg4pqfJJFcY2DzA0Ooc=E3w@mail.gmail.com> <20190220184408.GG9878@sirena.org.uk>
In-Reply-To: <20190220184408.GG9878@sirena.org.uk>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 20 Feb 2019 12:02:30 -0800
Message-ID: <CAKwvOdne3aE5bUsQF-2C-L2Xezqq9qb=NqF8FA+B7nvqXKAXFA@mail.gmail.com>
Subject: Re: [PATCH] kasan: turn off asan-stack for clang-8 and earlier
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Kostya Serebryany <kcc@google.com>, Evgenii Stepanov <eugenis@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Andrey Konovalov <andreyknvl@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>, Qian Cai <cai@lca.pw>, Alexander Potapenko <glider@google.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Christoph Lameter <cl@linux.com>, LKML <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>

On Wed, Feb 20, 2019 at 10:44 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Feb 20, 2019 at 10:07:36AM -0800, Nick Desaulniers wrote:
>
> > I like Evgenii's idea:
> > https://bugs.llvm.org/show_bug.cgi?id=38809#c10
>
> That's a suggestion to tune the inlining heuristics.

Yes; but it will also improve KASAN (if feasible).

> > While I myself share Arnd's goal of driving compiler warnings to zero,
> > in general I'd prefer not to disable warning-producing-features or
> > disable warnings outright for cases where we have some ideas of
> > changes we can make to the compiler.  There's probably a list now of
> > false warnings produced by old versions of Clang from bugs in Clang
> > that we fixed.  I'm not interested in additionally trying to work
> > around those somehow in kernel sources.
>
> We do have infrastructure in the kernel for managing warnings based on
> compiler version (Arnd was looking at some improvements to that IIRC),
> if we've got a kernel that builds with a given compiler it's worth
> looking at tuning what we do with that compiler.  If newer versions of
> the compiler work better or have new options we can turn things on for
> them.

so maybe something like (pseudocode):
if kasan && clang && clang_version < 9:
  disable -Wframe-larger-than=

If you overrun the stack with KASAN, a warning would be nice, but
you'll hopefully find out the hard way at runtime.  And that doesn't
require up to 114 Makefile changes, which would be kind of obnoxious
for this papercut.

>
> > Qian previously pointed out that most drivers don't produce this
> > warning under KASAN+Clang.  While 114 is a lot, what are the chances
> > that someone NEEDS a KASAN+Clang build to compile warning free and
> > happen to include one of these problematic drivers?  And if there is a
> > chance they do observe the warning, are we doing a disservice by
> > disabling the feature (-asan-stack=1) outright for the whole kernel,
> > or disabling the warning (`-Wstack-frame-larger-than=`) which can flag
> > issues unrelated to KASAN?
>
> People doing treewide work and subsystem maintainers are a reasonably
> important target for this sort of thing - for example people looking at
> the kernelci output.  It's a lot easier to pay attention to problems if
> you don't have to wade through large numbers of false positives.

Good point.  Current reports are a flood of -Wframe-larger-than=
because of KASAN (we've fixed just about everything else), and I have
to pick out what's new from that sea of false positives.  I would hate
for these warnings from KASAN to be the last thing before people start
taking clang builds seriously due to false positive warnings.

-- 
Thanks,
~Nick Desaulniers
