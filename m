Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:40105 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933444AbeE2NIa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 May 2018 09:08:30 -0400
MIME-Version: 1.0
In-Reply-To: <20180528134722.11358-1-luc.vanoostenryck@gmail.com>
References: <20180528134722.11358-1-luc.vanoostenryck@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 29 May 2018 22:07:46 +0900
Message-ID: <CAK7LNAT+kRLrpLTxxEPO1_O2SUEFJG-R+ZN5rRcc_Cy6yaar7A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: $(CHECK) doesnt need NOSTDINC_FLAGS twice
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2018-05-28 22:47 GMT+09:00 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>:
> Currently, $(CHECK) receives NOSTDINC_FLAGS twice:
> * first directly in the main Makefile via CHECKFLAGS,
> * then indirectly in scripts/Makefile.build via c_flags.
>
> Since once is enough, leave the occurence via c_flags and
> remove the one via CHECKFLAGS.
>
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---

Applied to linux-kbuild. Thanks.


>  Makefile | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 56ba070df..3140ab1db 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -808,7 +808,6 @@ endif
>
>  # arch Makefile may override CC so keep this after arch Makefile is included
>  NOSTDINC_FLAGS += -nostdinc -isystem $(call shell-cached,$(CC) -print-file-name=include)
> -CHECKFLAGS     += $(NOSTDINC_FLAGS)
>
>  # warn about C99 declaration after statement
>  KBUILD_CFLAGS += $(call cc-option,-Wdeclaration-after-statement,)
> --
> 2.17.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
