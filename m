Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35897 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbfH1S0U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Aug 2019 14:26:20 -0400
Received: by mail-pf1-f194.google.com with SMTP id w2so337362pfi.3
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Aug 2019 11:26:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190828055425.24765-1-yamada.masahiro@socionext.com> <CA+icZUWigJkh-VtJc4=xE06oMgE=ci2Mfdo2JaDv0fth8PKH+A@mail.gmail.com>
In-Reply-To: <CA+icZUWigJkh-VtJc4=xE06oMgE=ci2Mfdo2JaDv0fth8PKH+A@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 28 Aug 2019 11:26:08 -0700
Message-ID: <CAKwvOd=Zwkm33_8MTFKoVfs8XEEUKgzQFqJN3nar_ryKnbJTPw@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: refactor scripts/Makefile.extrawarn
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nathan Chancellor <natechancellor@gmail.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Michal Marek <michal.lkml@markovi.net>, Clang-Built-Linux ML <clang-built-linux@googlegroups.com>, LKML <linux-kernel@vger.kernel.org>

On Wed, Aug 28, 2019 at 12:20 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Wed, Aug 28, 2019 at 7:55 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > Instead of the warning-[123] magic, let's accumulate compiler options
> > to KBUILD_CFLAGS directly as the top Makefile does. I think this makes
> > easier to understand what is going on in this file.
> >
> > This commit slightly changes the behavior, I think all of which are OK.
> >
> > [1] Currently, cc-option calls are needlessly evaluated. For example,
> >       warning-3 += $(call cc-option, -Wpacked-bitfield-compat)
> >     needs evaluating only when W=3, but it is actually evaluated for
> >     W=1, W=2 as well. With this commit, only relevant cc-option calls
> >     will be evaluated. This is a slight optimization.
> >
> > [2] Currently, unsupported level like W=4 is checked by:
> >       $(error W=$(KBUILD_ENABLE_EXTRA_GCC_CHECKS) is unknown)
> >     This will no longer be checked, but I do not think it is a big
> >     deal.
> >
>
> Hi Masahiro Yamada,
>
> thanks for your patch series.
>
> If KBUILD_ENABLE_EXTRA_GCC_CHECKS does extra(-warning)-checks for GCC and Clang,
> please rename the Kconfig into...
>
> KBUILD_ENABLE_EXTRA_CC_CHECKS
>
> ...or something similiar (and maybe with some notes in its Kconfig help-text?).

I too would like to see that changed.

-- 
Thanks,
~Nick Desaulniers
