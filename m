Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44503 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727712AbeKMEuf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Nov 2018 23:50:35 -0500
Received: by mail-pf1-f196.google.com with SMTP id b81-v6so4243412pfe.11
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Nov 2018 10:56:05 -0800 (PST)
MIME-Version: 1.0
References: <20181112042116.5271-1-joel@jms.id.au> <20181112042116.5271-2-joel@jms.id.au>
In-Reply-To: <20181112042116.5271-2-joel@jms.id.au>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 12 Nov 2018 10:55:53 -0800
Message-ID: <CAKwvOdnBMFYXvS+GH0cUiczgkpLWtBinPRjkTJBQGrKjxktUUg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Makefile: Export clang toolchain variables
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: joel@jms.id.au
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, mpe@ellerman.id.au, Michal Marek <michal.lkml@markovi.net>, dja@axtens.net, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org

On Sun, Nov 11, 2018 at 8:21 PM Joel Stanley <joel@jms.id.au> wrote:
>
> The powerpc makefile will use these in it's boot wrapper.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Makefile b/Makefile
> index 09278330282d..840efe6eb54c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -495,6 +495,7 @@ endif
>  ifneq ($(GCC_TOOLCHAIN),)
>  CLANG_FLAGS    += --gcc-toolchain=$(GCC_TOOLCHAIN)
>  endif
> +export CLANG_FLAGS
>  CLANG_FLAGS    += -no-integrated-as

Does this export CLANG_FLAGS before `-no-integrated-as` is set?
Either way, I think it would be clearer to export this after all the
relevant flags are set.

>  KBUILD_CFLAGS  += $(CLANG_FLAGS)
>  KBUILD_AFLAGS  += $(CLANG_FLAGS)
> --
> 2.19.1
>


-- 
Thanks,
~Nick Desaulniers
