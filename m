Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:17934 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727013AbeINSWI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Sep 2018 14:22:08 -0400
MIME-Version: 1.0
In-Reply-To: <1536733082-19110-1-git-send-email-yamada.masahiro@socionext.com>
References: <1536733082-19110-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 14 Sep 2018 22:06:54 +0900
Message-ID: <CAK7LNARaKFfC_VR8HXWvMf7HQtP2b9YvHfH_WTLer0uGdkPVzg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove old check for CFLAGS use
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-09-12 15:18 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> This check has been here more than a decade since commit 0c53c8e6eb45
> ("kbuild: check for wrong use of CFLAGS").
>
> Enough time for migration has passed.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild.

>  scripts/Makefile.build | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 5a2d1c9..cb03774 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -36,21 +36,11 @@ subdir-ccflags-y :=
>
>  include scripts/Kbuild.include
>
> -# For backward compatibility check that these variables do not change
> -save-cflags := $(CFLAGS)
> -
>  # The filename Kbuild has precedence over Makefile
>  kbuild-dir := $(if $(filter /%,$(src)),$(src),$(srctree)/$(src))
>  kbuild-file := $(if $(wildcard $(kbuild-dir)/Kbuild),$(kbuild-dir)/Kbuild,$(kbuild-dir)/Makefile)
>  include $(kbuild-file)
>
> -# If the save-* variables changed error out
> -ifeq ($(KBUILD_NOPEDANTIC),)
> -        ifneq ("$(save-cflags)","$(CFLAGS)")
> -                $(error CFLAGS was changed in "$(kbuild-file)". Fix it to use ccflags-y)
> -        endif
> -endif
> -
>  include scripts/Makefile.lib
>
>  # Do not include host rules unless needed
> --
> 2.7.4
>



-- 
Best Regards
Masahiro Yamada
