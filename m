Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:27992 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbfEMCYc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 12 May 2019 22:24:32 -0400
MIME-Version: 1.0
References: <20190509064635.1445-1-yamada.masahiro@socionext.com>
 <CA+icZUV03ZF_FWMMyY=36-zQZPWO0YUBuSs9bjQqpmXJzVYYRA@mail.gmail.com>
 <CAK7LNATgQaHU+6WiMvx0AAf=9AJ5nrL8f8=SJMOCJNQNb_=X1w@mail.gmail.com> <CAKwvOdn7bUOeiE8LobyENmPvYGO3j7rt1N+Ht7tcDWaOBuHhdg@mail.gmail.com>
In-Reply-To: <CAKwvOdn7bUOeiE8LobyENmPvYGO3j7rt1N+Ht7tcDWaOBuHhdg@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 13 May 2019 11:23:51 +0900
Message-ID: <CAK7LNARJiQcBSSkdyr6HKQd_v4uWD-2D1S9nhrponaYzivOABg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add some extra warning flags unconditionally
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Sedat Dilek <sedat.dilek@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nathan Chancellor <natechancellor@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Clang-Built-Linux ML <clang-built-linux@googlegroups.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, chromeos-toolchain <chromeos-toolchain@google.com>, Android-LLVM <android-llvm@google.com>

On Fri, May 10, 2019 at 1:47 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> From: Masahiro Yamada <yamada.masahiro@socionext.com>
> > On Thu, May 9, 2019 at 4:11 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > > BTW, is this a speedup when doing CC/LD FLAGS etc checks unconditionally?
> >
> > Yes.
> > cc-option is somewhat costly because it invoked the compiler to
> > check if the given flag is supported.
> >
> > So, I want to get rid of as many cc-option calls as possible.
> >
> >
> > > Asking in general - do you have any numbers :-)?
> >
> > Removing a couple of cc-options does not make
> > a measurable difference in general use-cases.
> >
> > But, this might be more beneficial for chrome OS
> > because $(CC) is a wrapper and invoking it is much more expensive.
>
> Android does too, which we plan on removing as we recently measured
> the performance cost of 5% for having a Python wrapper to aid in
> bisection.
>
> Anyways, I checked these options with clang 4 and gcc 4.6.4 in godbolt.
> Tested-by: Nick Desaulniers <ndesaulniers@google.com>
> --
> Thanks,
> ~Nick Desaulniers

Applied to linux-kbuild.


-- 
Best Regards
Masahiro Yamada
