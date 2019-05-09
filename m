Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44658 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726195AbfEINtq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 09:49:46 -0400
MIME-Version: 1.0
References: <CAK7LNASpsid7_sh4rdRNSTwZ1YtW_+uH2eoarJNNUttntQZ-kg@mail.gmail.com>
 <20190509114824.25866-1-natechancellor@gmail.com>
In-Reply-To: <20190509114824.25866-1-natechancellor@gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 9 May 2019 15:49:32 +0200
Message-ID: <CA+icZUUN7cVXnkUv9DzYC7voys_CS=DJDm19EeYSWPyQwVdXVw@mail.gmail.com>
Subject: Re: [PATCH] Makefile: Don't try to add '-fcatch-undefined-behavior' flag
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Clang-Built-Linux ML <clang-built-linux@googlegroups.com>, Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>

On Thu, May 9, 2019 at 1:49 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> This is no longer a valid option in clang, it was removed in 3.5, which
> we don't support.
>
> https://github.com/llvm/llvm-project/commit/cb3f812b6b9fab8f3b41414f24e90222170417b4
>

Cool.

Can you test with -mglobal-merge (inverted -mno-global-merge) which is
default for Clang?
I could build, link and boot with my llvm-toolchain (incl. lld-9) on x86-64.

Maybe this is also no more needed?

Thanks.

- Sedat -

> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>
> Let me know if you want this incremental to your patch. I figured it
> made more sense to remove this then do the cc-option/cc-disable-warning
> removal because it will simplify the commit message.
>
>  Makefile | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index d24f5a8009ee..e4788eb2c9b9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -740,7 +740,6 @@ KBUILD_CFLAGS += $(call cc-disable-warning, tautological-compare)
>  # source of a reference will be _MergedGlobals and not on of the whitelisted names.
>  # See modpost pattern 2
>  KBUILD_CFLAGS += $(call cc-option, -mno-global-merge,)
> -KBUILD_CFLAGS += $(call cc-option, -fcatch-undefined-behavior)
>  else
>
>  # These warnings generated too much noise in a regular build.
> --
> 2.21.0
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To post to this group, send email to clang-built-linux@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20190509114824.25866-1-natechancellor%40gmail.com.
> For more options, visit https://groups.google.com/d/optout.
