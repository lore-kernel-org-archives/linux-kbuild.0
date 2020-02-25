Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pj1-f66.google.com ([209.85.216.66]:40379 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728162AbgBYUw2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Feb 2020 15:52:28 -0500
Received: by mail-pj1-f66.google.com with SMTP id 12so245843pjb.5
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Feb 2020 12:52:28 -0800 (PST)
MIME-Version: 1.0
References: <20200224174129.2664-1-ndesaulniers@google.com> <CAK7LNASNsOmyqFWYtJHB4UcHAed5C_isWvMJ4MKHu0O=yUy=8w@mail.gmail.com>
In-Reply-To: <CAK7LNASNsOmyqFWYtJHB4UcHAed5C_isWvMJ4MKHu0O=yUy=8w@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 25 Feb 2020 12:52:16 -0800
Message-ID: <CAKwvOd=mPg79CrYnDm8=z0iJpKL0FHm9J5qZF0_A6BFXBv8Dow@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: add documentation on building w/ Clang/LLVM
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Kees Cook <keescook@chromium.org>, Nathan Chancellor <natechancellor@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>

On Mon, Feb 24, 2020 at 4:34 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Tue, Feb 25, 2020 at 2:41 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > Added to kbuild documentation. Provides more official info on building
> > kernels with Clang and LLVM than our wiki.
> >
> > Suggested-by: Kees Cook <keescook@chromium.org>
> > Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
>
>
> Perhaps, is it better to explicitly add it to MAINTAINERS?
>
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4118,6 +4118,7 @@ W:        https://clangbuiltlinux.github.io/
>  B:     https://github.com/ClangBuiltLinux/linux/issues
>  C:     irc://chat.freenode.net/clangbuiltlinux
>  S:     Supported
> +F:     Documentation/kbuild/llvm.rst
>  K:     \b(?i:clang|llvm)\b

I'm happy to leave it to the maintainers of Documentation/.  Otherwise
we have a file for which there is no MAINTAINER, which seems
ambiguous.

-- 
Thanks,
~Nick Desaulniers
