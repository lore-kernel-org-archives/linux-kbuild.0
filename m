Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:45068 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbeKNJf4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Nov 2018 04:35:56 -0500
MIME-Version: 1.0
References: <20181112042116.5271-1-joel@jms.id.au> <20181112042116.5271-2-joel@jms.id.au>
In-Reply-To: <20181112042116.5271-2-joel@jms.id.au>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 14 Nov 2018 08:34:41 +0900
Message-ID: <CAK7LNASUCBbjppeLEm83+y69ySV=d0E-MZ9eheFKznbhf4m9sw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Makefile: Export clang toolchain variables
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Michal Marek <michal.lkml@markovi.net>, dja@axtens.net, Nick Desaulniers <ndesaulniers@google.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>

On Mon, Nov 12, 2018 at 1:21 PM Joel Stanley <joel@jms.id.au> wrote:
>
> The powerpc makefile will use these in it's boot wrapper.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---


Applied to linux-kbuild.
Thanks!


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
>  KBUILD_CFLAGS  += $(CLANG_FLAGS)
>  KBUILD_AFLAGS  += $(CLANG_FLAGS)
> --
> 2.19.1
>


-- 
Best Regards
Masahiro Yamada
