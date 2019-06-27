Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43323 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726384AbfF0VaT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 27 Jun 2019 17:30:19 -0400
Received: by mail-pl1-f194.google.com with SMTP id cl9so1957631plb.10
        for <linux-kbuild@vger.kernel.org>; Thu, 27 Jun 2019 14:30:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190627191448.110756-1-natechancellor@gmail.com>
In-Reply-To: <20190627191448.110756-1-natechancellor@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 27 Jun 2019 14:30:06 -0700
Message-ID: <CAKwvOdkmacZ0Pu+KcmHb+-e4x0DZs1=FfAKHSo-2xf9LWtknAQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Add ability to test Clang's integrated assembler
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Dmitry Golovin <dima@golovin.in>

On Thu, Jun 27, 2019 at 12:15 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> There are some people interested in experimenting with Clang's
> integrated assembler. To make it easy to do so without source
> modification, allow the user to specify 'AS=clang' as part of the
> make command to avoid adding '-no-integrated-as' to the {A,C}FLAGS.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/577
> Suggested-by: Dmitry Golovin <dima@golovin.in>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 5102b2bbd224..d77481129339 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -527,7 +527,9 @@ endif
>  ifneq ($(GCC_TOOLCHAIN),)
>  CLANG_FLAGS    += --gcc-toolchain=$(GCC_TOOLCHAIN)
>  endif
> +ifeq ($(shell $(AS) --version 2>&1 | head -n 1 | grep clang),)
>  CLANG_FLAGS    += -no-integrated-as
> +endif

This is a nice suggestion and solution.  Thanks Dima and Nathan.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>
-- 
Thanks,
~Nick Desaulniers
