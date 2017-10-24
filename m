Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:56886 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750732AbdJXEON (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Oct 2017 00:14:13 -0400
MIME-Version: 1.0
In-Reply-To: <20171020210913.64498-1-dtwlin@google.com>
References: <20171020210913.64498-1-dtwlin@google.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 24 Oct 2017 13:13:30 +0900
Message-ID: <CAK7LNATGBaX33uqxTmK8qmC2s1oij_f2LtMzxr8kZgyJwXpsiA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: clang: fix build failures with sparse check
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Lin <dtwlin@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, Behan Webster <behanw@converseincode.com>, Greg Hackmann <ghackmann@google.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-10-21 6:09 GMT+09:00 David Lin <dtwlin@google.com>:
> We should avoid using the space character when passing arguments to
> clang, because static code analysis check tool such as sparse may
> misinterpret the arguments followed by spaces as build targets hence
> cause the build to fail.
>
> Signed-off-by: David Lin <dtwlin@google.com>
> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 05f95df0a247..c8819d0de907 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -685,11 +685,11 @@ KBUILD_CFLAGS += $(stackp-flag)
>
>  ifeq ($(cc-name),clang)
>  ifneq ($(CROSS_COMPILE),)
> -CLANG_TARGET   := -target $(notdir $(CROSS_COMPILE:%-=%))
> +CLANG_TARGET   := --target=$(notdir $(CROSS_COMPILE:%-=%))
>  GCC_TOOLCHAIN  := $(realpath $(dir $(shell which $(LD)))/..)
>  endif
>  ifneq ($(GCC_TOOLCHAIN),)
> -CLANG_GCC_TC   := -gcc-toolchain $(GCC_TOOLCHAIN)
> +CLANG_GCC_TC   := --gcc-toolchain=$(GCC_TOOLCHAIN)
>  endif
>  KBUILD_CFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC)
>  KBUILD_AFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC)
> --
> 2.15.0.rc0.271.g36b669edcc-goog
>

Applied to linux-kbuild/fixes.  Thanks!


-- 
Best Regards
Masahiro Yamada
