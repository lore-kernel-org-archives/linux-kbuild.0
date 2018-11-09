Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44812 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728026AbeKJDur (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Nov 2018 22:50:47 -0500
Received: by mail-pg1-f195.google.com with SMTP id w3-v6so1155695pgs.11
        for <linux-kbuild@vger.kernel.org>; Fri, 09 Nov 2018 10:09:05 -0800 (PST)
MIME-Version: 1.0
References: <1541473495-25262-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1541473495-25262-1-git-send-email-yamada.masahiro@socionext.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 9 Nov 2018 10:08:53 -0800
Message-ID: <CAKwvOdkfGZDWr5vjNTvn707+Muna3JNKObwOfjjvS2-tAXK2QA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: add -no-integrated-as Clang option unconditionally
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Stefan Agner <stefan@agner.ch>, Matthias Kaehlcke <mka@chromium.org>, joel@jms.id.au, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, Michal Marek <michal.lkml@markovi.net>, LKML <linux-kernel@vger.kernel.org>

On Mon, Nov 5, 2018 at 7:05 PM Masahiro Yamada
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

Sorry for the delay in review.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>

>  endif
>
>  RETPOLINE_CFLAGS_GCC := -mindirect-branch=thunk-extern -mindirect-branch-register
> --
> 2.7.4
>


-- 
Thanks,
~Nick Desaulniers
