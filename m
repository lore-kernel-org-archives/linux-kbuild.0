Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:24744 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbeKEMKt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Nov 2018 07:10:49 -0500
MIME-Version: 1.0
References: <20181104231133.30848-1-joel@jms.id.au> <20181104231133.30848-2-joel@jms.id.au>
In-Reply-To: <20181104231133.30848-2-joel@jms.id.au>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 5 Nov 2018 11:52:42 +0900
Message-ID: <CAK7LNASeoiNa0Z08KCVhS_nzLEcKE9G6=d_m-dQbX1oep3UPtQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] Makefile: Export clang toolchain variables
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nick Desaulniers <ndesaulniers@google.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>

Hi Joel,


On Mon, Nov 5, 2018 at 9:53 AM Joel Stanley <joel@jms.id.au> wrote:
>
> The powerpc makefile will use these in it's boot wrapper.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  Makefile | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 9aa352b38815..a2db3c885b38 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -495,6 +495,9 @@ endif
>  ifneq ($(GCC_TOOLCHAIN),)
>  CLANG_GCC_TC   := --gcc-toolchain=$(GCC_TOOLCHAIN)
>  endif
> +export CLANG_TARGET
> +export CLANG_GCC_TC
> +export CLANG_PREFIX
>  KBUILD_CFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC) $(CLANG_PREFIX)
>  KBUILD_AFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC) $(CLANG_PREFIX)
>  KBUILD_CFLAGS += $(call cc-option, -no-integrated-as)
> --
> 2.19.1
>


Before exporting these compiler flags,
I'd like to do a cleanup work.


Could you take a look at my patch, please?

https://patchwork.kernel.org/patch/10667369/


By using it as a prerequisite,
your patch set will be more simplified.


-- 
Best Regards
Masahiro Yamada
