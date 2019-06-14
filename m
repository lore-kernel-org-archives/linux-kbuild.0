Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38087 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbfFNSQp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Jun 2019 14:16:45 -0400
Received: by mail-pg1-f196.google.com with SMTP id v11so1989159pgl.5
        for <linux-kbuild@vger.kernel.org>; Fri, 14 Jun 2019 11:16:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190614165242.79257-1-natechancellor@gmail.com>
In-Reply-To: <20190614165242.79257-1-natechancellor@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 14 Jun 2019 11:16:32 -0700
Message-ID: <CAKwvOdkyoEYe83HdF-0ofPckFkE5rsFdNnQw5NxXTUQfHNntsg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Enable -Wuninitialized
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, clang-built-linux <clang-built-linux@googlegroups.com>

On Fri, Jun 14, 2019 at 9:53 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> This helps fine very dodgy behavior through both -Wuninitialized
> (warning that a variable is always uninitialized) and
> -Wsometimes-uninitialized (warning that a variable is sometimes
> uninitialized, like GCC's -Wmaybe-uninitialized). These warnings
> catch things that GCC doesn't such as:
>
> https://lore.kernel.org/lkml/86649ee4-9794-77a3-502c-f4cd10019c36@lca.pw/

or this one, which was my favorite, and quite insidious from an
underhanded C contest perspective.
https://lore.kernel.org/lkml/20190226053855.7020-1-natechancellor@gmail.com/

Thank you very much for all the hard work you did tracking done and
fixing all of the cases we could find.  I very much look forward to
this patch as the capstone to all that work.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> We very much want to catch these so turn this warning on so that CI is
> aware of it.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/381
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  scripts/Makefile.extrawarn | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 98081ab300e5..699683a7c116 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -71,6 +71,5 @@ KBUILD_CFLAGS += -Wno-unused-value
>  KBUILD_CFLAGS += -Wno-format
>  KBUILD_CFLAGS += -Wno-sign-compare
>  KBUILD_CFLAGS += -Wno-format-zero-length
> -KBUILD_CFLAGS += -Wno-uninitialized
>  endif
>  endif
> --
> 2.22.0
>


-- 
Thanks,
~Nick Desaulniers
