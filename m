Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:26156 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728273AbgB0D6u (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Feb 2020 22:58:50 -0500
MIME-Version: 1.0
References: <20200225210250.64366-1-ndesaulniers@google.com> <20200226232336.252872-1-ndesaulniers@google.com>
In-Reply-To: <20200226232336.252872-1-ndesaulniers@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 27 Feb 2020 12:58:04 +0900
Message-ID: <CAK7LNASGSWTO+MRAFg0XKvucSe0-y6-i0MiUoSLB4fMyFaLj0g@mail.gmail.com>
Subject: Re: [PATCH v3] Documentation/llvm: add documentation on building w/ Clang/LLVM
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Kees Cook <keescook@chromium.org>, Nathan Chancellor <natechancellor@gmail.com>, Sedat Dilek <sedat.dilek@gmail.com>

On Thu, Feb 27, 2020 at 8:23 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Added to kbuild documentation. Provides more official info on building
> kernels with Clang and LLVM than our wiki.
>
> Suggested-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
> Changes V2 -> V3:
> * Drop Randy's Suggested-by tag. Sorry Randy, I do appreciate the review
>   though.
> * Add F: line to MAINTAINERS.
>
> Changes V1 -> V2:
> * s/On going/ongoing/
> * add Randy's Suggested-by
> * add Nathan and Sedat's Reviewed-by
> * Upgrade Kees' Sugguested-by to Reviewed-by
> * s/suffix/prefix/


Setting aside the minimal version discussion,
I am fine with this patch version.

I will apply it shortly.

Thanks.



-- 
Best Regards
Masahiro Yamada
