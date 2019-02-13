Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f196.google.com ([209.85.214.196]:38658 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388850AbfBMRmE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Feb 2019 12:42:04 -0500
Received: by mail-pl1-f196.google.com with SMTP id e5so1511102plb.5
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Feb 2019 09:42:04 -0800 (PST)
MIME-Version: 1.0
References: <20190211193008.24101-1-ndesaulniers@google.com>
 <20190211193008.24101-3-ndesaulniers@google.com> <CAK7LNATZY-K4g81LLvXpjp=+oMSY8L0wQoVXgHt-Bjrb2WXnNg@mail.gmail.com>
In-Reply-To: <CAK7LNATZY-K4g81LLvXpjp=+oMSY8L0wQoVXgHt-Bjrb2WXnNg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 13 Feb 2019 09:41:52 -0800
Message-ID: <CAKwvOdmyNFsV=67eLQtETSDJJyDZ8aEJY1+LHuoP4OtpdQOdWQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] Makefile: lld: tell clang to use lld
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Nathan Chancellor <natechancellor@gmail.com>, Sedat Dilek <sedat.dilek@gmail.com>, Kees Cook <keescook@chromium.org>, Sami Tolvanen <samitolvanen@google.com>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Dominik Brodowski <linux@dominikbrodowski.net>, Nicholas Piggin <npiggin@gmail.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Vasily Gorbik <gor@linux.ibm.com>, Adrian Reber <adrian@lisas.de>, Richard Guy Briggs <rgb@redhat.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Feb 13, 2019 at 6:59 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> On Tue, Feb 12, 2019 at 5:42 AM <ndesaulniers@google.com> wrote:
> >
> > This is needed because clang doesn't select which linker to use based on
> > $LD but rather -fuse-ld=lld. This is problematic especially for
> > cc-ldoption, which checks for linker flag support via invoking the
> > compiler, rather than the linker.
>
>
> Sorry, please explain what kind of problem
> this patch solves.
>
>
>
> [1] $(LD) is used to link vmlinux, modules, etc.
>
> [2] $(CC) is used to link vdso, etc.
>     and -fuse-ld= selects which linker is invoked from $(CC)

It solves case 2.

>
>
> Is it a problem to use a different
> type of linker for [1] and [2] ?

Ideally, no, but I can think of at least one case where it might be
problematic to mix linkers like that:
You might be mixing linker flags added via ld-option from one linker
that aren't actually supported by the other linker.

-- 
Thanks,
~Nick Desaulniers
