Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:59845 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727228AbfH2R4z (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Aug 2019 13:56:55 -0400
MIME-Version: 1.0
References: <20190828055425.24765-1-yamada.masahiro@socionext.com>
 <CA+icZUWigJkh-VtJc4=xE06oMgE=ci2Mfdo2JaDv0fth8PKH+A@mail.gmail.com> <CA+icZUUhhOLfOgwoKP4nKOdPakNJF7XafJ09ERP6r7dOUduMsg@mail.gmail.com>
In-Reply-To: <CA+icZUUhhOLfOgwoKP4nKOdPakNJF7XafJ09ERP6r7dOUduMsg@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 30 Aug 2019 02:56:07 +0900
Message-ID: <CAK7LNAQ+do3HNWYtBFgtGU817ryOrBvcqaxuS2xZif2nBjUNtQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: refactor scripts/Makefile.extrawarn
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <natechancellor@gmail.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Michal Marek <michal.lkml@markovi.net>, Clang-Built-Linux ML <clang-built-linux@googlegroups.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Aug 28, 2019 at 11:19 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Wed, Aug 28, 2019 at 9:20 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > On Wed, Aug 28, 2019 at 7:55 AM Masahiro Yamada
> > <yamada.masahiro@socionext.com> wrote:
> > >
> > > Instead of the warning-[123] magic, let's accumulate compiler options
> > > to KBUILD_CFLAGS directly as the top Makefile does. I think this makes
> > > easier to understand what is going on in this file.
> > >
> > > This commit slightly changes the behavior, I think all of which are OK.
> > >
> > > [1] Currently, cc-option calls are needlessly evaluated. For example,
> > >       warning-3 += $(call cc-option, -Wpacked-bitfield-compat)
> > >     needs evaluating only when W=3, but it is actually evaluated for
> > >     W=1, W=2 as well. With this commit, only relevant cc-option calls
> > >     will be evaluated. This is a slight optimization.
> > >
> > > [2] Currently, unsupported level like W=4 is checked by:
> > >       $(error W=$(KBUILD_ENABLE_EXTRA_GCC_CHECKS) is unknown)
> > >     This will no longer be checked, but I do not think it is a big
> > >     deal.
> > >
> >
> > Hi Masahiro Yamada,
> >
> > thanks for your patch series.
> >
> > If KBUILD_ENABLE_EXTRA_GCC_CHECKS does extra(-warning)-checks for GCC and Clang,
> > please rename the Kconfig into...

You repeatedly mentioned "Kconfig" in your posts,
where there is nothing related to Kconfig.


> >
> > KBUILD_ENABLE_EXTRA_CC_CHECKS

You missed the fact this is already used
not only for C compilers, but also for Device Tree compiler.
(see scripts/Makefile.lib)

One more thing, this is the environment variable
that Kbuild officially supports.
Keeping the backward compatibility is must.


When I mentioned to rename this before,
Arnd suggested to keep it as is.
https://patchwork.kernel.org/patch/10172331/#21385013

I do not know whether he is still planning that rework, though.


> > ...or something similiar (and maybe with some notes in its Kconfig help-text?).

What did you mean by "Kconfig help-text" ?



> >
>
> I have tested both patches against recent kbuild-next and can boot on
> bare metal with clang.
>
> I have *not* passed any W= to my make, but I see that clang's W=1
> kbuild-cflags are active.
>
> [ scripts/Makefile.extrawarn ]
>
> ifeq ("$(origin W)", "command line")
>   export KBUILD_ENABLE_EXTRA_GCC_CHECKS := $(W)
> endif
>
> #
> # W=1 - warnings that may be relevant and does not occur too often
> #
> ifneq ($(findstring 1, $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)),)
> [ ... ]
> KBUILD_CPPFLAGS += -DKBUILD_EXTRA_WARN1
>
> else
>
> # W=1 also stops suppressing some warnings
>
> ifdef CONFIG_CC_IS_CLANG
> KBUILD_CFLAGS += -Wno-initializer-overrides
> KBUILD_CFLAGS += -Wno-format
> KBUILD_CFLAGS += -Wno-sign-compare
> KBUILD_CFLAGS += -Wno-format-zero-length
> endif # CONFIG_CC_IS_CLANG
>
> endif # KBUILD_ENABLE_EXTRA_GCC_CHECKS
>
> These clang KBUILD_CFLAGS are active independently of passing W=1.
>
> $ grep '\-Wno-initializer-overrides'
> build-log_5.3.0-rc6-2-amd64-cbl-asmgoto.txt | wc -l
> 27195
>
> So the above comment is misleading?
>
> Is W=1 activated by default?
>
> Or do I miss something?


I won't comment back to your long analysis.

Instead, I will post v2.
I hope you will notice something.





> [ Documentation/kbuild/kbuild.rst ]
>
> KBUILD_ENABLE_EXTRA_GCC_CHECKS
> ------------------------------
> If enabled over the make command line with "W=1", it turns on additional
> gcc -W... options for more extensive build-time checking.
>
> What about?
>
> KBUILD_CC_EXTRA_CHECKS (or KBUILD_EXTRA_CC_CHECKS)
> ------------------------------
> If enabled over the make command line with "W=...", it turns on additional
> compiler warning options like -Wmissing-declarations for more extensive
> build-time checking. For more details see <Documentation/kbuild/kbuild.rst>.
>
> W=1 - warnings that may be relevant and does not occur too often
> W=1 - also stops suppressing some warnings
> W=2 - warnings that occur quite often but may still be relevant
> W=3 - the more obscure warnings, can most likely be ignored
>
> - Sedat -



--
Best Regards

Masahiro Yamada
