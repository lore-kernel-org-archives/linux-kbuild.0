Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:30600 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbgBZMBf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Feb 2020 07:01:35 -0500
MIME-Version: 1.0
References: <20200224174129.2664-1-ndesaulniers@google.com>
 <CAK7LNASNsOmyqFWYtJHB4UcHAed5C_isWvMJ4MKHu0O=yUy=8w@mail.gmail.com> <CAKwvOd=mPg79CrYnDm8=z0iJpKL0FHm9J5qZF0_A6BFXBv8Dow@mail.gmail.com>
In-Reply-To: <CAKwvOd=mPg79CrYnDm8=z0iJpKL0FHm9J5qZF0_A6BFXBv8Dow@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 26 Feb 2020 21:00:34 +0900
Message-ID: <CAK7LNAQ83rLAm1GcvrgJbinyAVPpM_SoxfO7RdOAfmXyg2tBdQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: add documentation on building w/ Clang/LLVM
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Kees Cook <keescook@chromium.org>, Nathan Chancellor <natechancellor@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>

On Wed, Feb 26, 2020 at 5:52 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Mon, Feb 24, 2020 at 4:34 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Tue, Feb 25, 2020 at 2:41 AM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > > Added to kbuild documentation. Provides more official info on building
> > > kernels with Clang and LLVM than our wiki.
> > >
> > > Suggested-by: Kees Cook <keescook@chromium.org>
> > > Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> > > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > > ---
> >
> >
> > Perhaps, is it better to explicitly add it to MAINTAINERS?
> >
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -4118,6 +4118,7 @@ W:        https://clangbuiltlinux.github.io/
> >  B:     https://github.com/ClangBuiltLinux/linux/issues
> >  C:     irc://chat.freenode.net/clangbuiltlinux
> >  S:     Supported
> > +F:     Documentation/kbuild/llvm.rst
> >  K:     \b(?i:clang|llvm)\b
>
> I'm happy to leave it to the maintainers of Documentation/.  Otherwise
> we have a file for which there is no MAINTAINER, which seems
> ambiguous.

It is common that MAINTAINERS lists per-file (per-driver) maintainers.
It does not necessarily mean a person who picks up patches.

scripts/get_maintainer.pl lists maintainers that
match any F:, N:, K: patterns.
So, both Doc and Kbuild maintainers/ML will still be listed.

Having said that, it is up to you. Either is fine with me.
Another pattern 'K: \b(?i:clang|llvm)\b'  covers this file anyway.


(BTW, I am also happy to see your name as the maintainer of this entry.)


Thanks.

--
Best Regards
Masahiro Yamada
