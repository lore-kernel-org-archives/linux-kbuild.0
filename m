Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:58339 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726022AbeKNJZk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Nov 2018 04:25:40 -0500
MIME-Version: 1.0
References: <1541473495-25262-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1541473495-25262-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 14 Nov 2018 08:24:22 +0900
Message-ID: <CAK7LNASVk788Za-2V58LjjiudiWDM=hjjS_ugVE2K7g9ir+3GQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: add -no-integrated-as Clang option unconditionally
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Stefan Agner <stefan@agner.ch>, Matthias Kaehlcke <mka@chromium.org>, Joel Stanley <joel@jms.id.au>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Nov 6, 2018 at 12:06 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> We are still a way off the Clang's integrated assembler support for
> the kernel. Hence, -no-integrated-as is mandatory to build the kernel
> with Clang. If you had an ancient version of Clang that does not
> recognize this option, you would not be able to compile the kernel
> anyway.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild.


>
> Changes in v2:
>   - New patch
>
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 93315eb..da11700 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -497,8 +497,8 @@ CLANG_GCC_TC        := --gcc-toolchain=$(GCC_TOOLCHAIN)
>  endif
>  KBUILD_CFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC) $(CLANG_PREFIX)
>  KBUILD_AFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC) $(CLANG_PREFIX)
> -KBUILD_CFLAGS += $(call cc-option, -no-integrated-as)
> -KBUILD_AFLAGS += $(call cc-option, -no-integrated-as)
> +KBUILD_CFLAGS += -no-integrated-as
> +KBUILD_AFLAGS += -no-integrated-as
>  endif
>
>  RETPOLINE_CFLAGS_GCC := -mindirect-branch=thunk-extern -mindirect-branch-register
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
