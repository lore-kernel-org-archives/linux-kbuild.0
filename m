Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:48067 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbgBZMjh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Feb 2020 07:39:37 -0500
MIME-Version: 1.0
References: <20200224174129.2664-1-ndesaulniers@google.com>
 <20200225210250.64366-1-ndesaulniers@google.com> <CAK7LNAQJuF__26R+fEsdfYH1SAJuo3-8grGQAE4htjxzEG-nqw@mail.gmail.com>
 <CA+icZUWcW3+9QdZcACCXP6Yun__Sm_s4+qM4rALdFf=hGBt3FQ@mail.gmail.com>
In-Reply-To: <CA+icZUWcW3+9QdZcACCXP6Yun__Sm_s4+qM4rALdFf=hGBt3FQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 26 Feb 2020 21:38:38 +0900
Message-ID: <CAK7LNAQX0nFWruCgHDEkZsTKT895ahrAVQT12wuJQ_dUQtVrsg@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation/llvm: add documentation on building w/ Clang/LLVM
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, Kees Cook <keescook@chromium.org>, Nathan Chancellor <natechancellor@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>

On Wed, Feb 26, 2020 at 9:26 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Wed, Feb 26, 2020 at 12:31 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > Hi.
> >
> >
> > On Wed, Feb 26, 2020 at 6:02 AM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > > Added to kbuild documentation. Provides more official info on building
> > > kernels with Clang and LLVM than our wiki.
> > >
> > > Suggested-by: Randy Dunlap <rdunlap@infradead.org>
> > > Reviewed-by: Kees Cook <keescook@chromium.org>
> > > Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> > > Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>
> > > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > > ---
> > > Changes V1 -> V2:
> > > * s/On going/ongoing/
> > > * add Randy's Suggested-by
> >
> >
> > I do not understand this tag update.
> >
> > As far as I saw the review process,
> > I do not think Randy deserves to have Suggested-by
> > because he just pointed out a typo (on going -> ongoing) :
> > https://patchwork.kernel.org/patch/11401189/#23179575
> >
> > (or, was there off-line activity I had missed?)
> >
>
> Hi Masahiro,
>
> I got some credits from Nick for a review by seeing a typo - not on a
> review of the code - and H. Peter Anvin asked why.
>
> I am not sure what is here the correct credit to give.
> Depends a "Reviewed-by" and/or "Suggested-by" on a technical review?



Documentation/process/submitting-patches.rst

  13) Using Reported-by:, Tested-by:, Reviewed-by:, Suggested-by: and Fixes:

is a helpful guideline.







-- 
Best Regards
Masahiro Yamada
