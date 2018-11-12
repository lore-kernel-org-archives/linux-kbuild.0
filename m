Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:44548 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727354AbeKME5z (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Nov 2018 23:57:55 -0500
Received: by mail-pl1-f194.google.com with SMTP id s5-v6so4753829plq.11
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Nov 2018 11:03:23 -0800 (PST)
MIME-Version: 1.0
References: <20181112042116.5271-1-joel@jms.id.au> <20181112042116.5271-3-joel@jms.id.au>
In-Reply-To: <20181112042116.5271-3-joel@jms.id.au>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 12 Nov 2018 11:03:11 -0800
Message-ID: <CAKwvOd=Sck9MMyq4sBe24iNbcVd=KX7enfxN=+Y7uvL-YrxHrg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] powerpc/boot: Set target when cross-compiling for clang
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: joel@jms.id.au
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, mpe@ellerman.id.au, Michal Marek <michal.lkml@markovi.net>, dja@axtens.net, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org

On Sun, Nov 11, 2018 at 8:21 PM Joel Stanley <joel@jms.id.au> wrote:
>
> Clang needs to be told which target it is building for when cross
> compiling.

Neat! This will help us for continuous integration.
https://github.com/ClangBuiltLinux/continuous-integration

>
> Link: https://github.com/ClangBuiltLinux/linux/issues/259
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Assuming patch 1/2 gets fixed up (or is fine) and doesn't radically change:
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  arch/powerpc/boot/Makefile | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> index 39354365f54a..111f97b1ccec 100644
> --- a/arch/powerpc/boot/Makefile
> +++ b/arch/powerpc/boot/Makefile
> @@ -55,6 +55,11 @@ BOOTAFLAGS   := -D__ASSEMBLY__ $(BOOTCFLAGS) -traditional -nostdinc
>
>  BOOTARFLAGS    := -cr$(KBUILD_ARFLAGS)
>
> +ifdef CONFIG_CC_IS_CLANG
> +BOOTCFLAGS += $(CLANG_FLAGS)
> +BOOTAFLAGS += $(CLANG_FLAGS)
> +endif
> +
>  ifdef CONFIG_DEBUG_INFO
>  BOOTCFLAGS     += -g
>  endif
> --
> 2.19.1
>


-- 
Thanks,
~Nick Desaulniers
