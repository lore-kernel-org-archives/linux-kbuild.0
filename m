Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40016 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726004AbfFQRtM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Jun 2019 13:49:12 -0400
Received: by mail-pf1-f195.google.com with SMTP id p184so6072186pfp.7
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Jun 2019 10:49:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190617172829.164520-1-nhuck@google.com>
In-Reply-To: <20190617172829.164520-1-nhuck@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 17 Jun 2019 10:48:51 -0700
Message-ID: <CAKwvOdk4yvWQynR4uPzDFPonfVTTDt7_ZaqR2MJGUm78PQ4Gfg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Remove unnecessary -Wno-unused-value
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Huckleberry <nhuck@google.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>

On Mon, Jun 17, 2019 at 10:28 AM Nathan Huckleberry <nhuck@google.com> wrote:
>
> This flag turns off several other warnings that would
> be useful. Most notably -warn_unused_result is disabled.
> All of the following warnings are currently disabled:
>
> UnusedValue
> |-UnusedComparison
>   |-warn_unused_comparison
> |-UnusedResult
>   |-warn_unused_result
> |-UnevaluatedExpression
>   |-PotentiallyEvaluatedExpression
>     |-warn_side_effects_typeid
>   |-warn_side_effects_unevaluated_context
> |-warn_unused_expr
> |-warn_unused_voidptr
> |-warn_unused_container_subscript_expr
> |-warn_unused_call
>
> With this flag removed there are ~10 warnings.
> Patches have been submitted for each of these warnings.
>
> Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> Cc: clang-built-linux@googlegroups.com
> Link: https://github.com/ClangBuiltLinux/linux/issues/520
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>

Most importantly, it fixes __must_check, which has been silently not
working w/ Clang.  Nathan sent patches for the issues we could find w/
x86_65 and arm64 allyesconfig builds, and even fixed a bug in Clang.
https://reviews.llvm.org/D63369

Thanks for all of the work that went into this.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  scripts/Makefile.extrawarn | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 3ab8d1a303cd..b293246e48fe 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -68,7 +68,6 @@ else
>
>  ifdef CONFIG_CC_IS_CLANG
>  KBUILD_CFLAGS += -Wno-initializer-overrides
> -KBUILD_CFLAGS += -Wno-unused-value
>  KBUILD_CFLAGS += -Wno-format
>  KBUILD_CFLAGS += -Wno-sign-compare
>  KBUILD_CFLAGS += -Wno-format-zero-length
> --
> 2.22.0.410.gd8fdbe21b5-goog
>


-- 
Thanks,
~Nick Desaulniers
