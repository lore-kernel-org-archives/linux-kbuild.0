Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:65097 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727741AbfFDRKp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Jun 2019 13:10:45 -0400
MIME-Version: 1.0
References: <20190529080434.1409-1-malat@debian.org>
In-Reply-To: <20190529080434.1409-1-malat@debian.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 5 Jun 2019 02:09:58 +0900
Message-ID: <CAK7LNAT7tdqVzbo0Un6mZfKoVGMpVtXAh=UakjOLOqY-pr8V0g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Remove -Waggregate-return from scripts/Makefile.extrawarn
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mathieu Malaterre <malat@debian.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, May 29, 2019 at 5:16 PM Mathieu Malaterre <malat@debian.org> wrote:
>
> It makes little sense to pass -Waggregate-return these days since large
> part of the linux kernel rely on returning struct(s). For instance:
>
>   ../include/linux/timekeeping.h: In function 'show_uptime':
>   ../include/linux/ktime.h:91:34: error: function call has aggregate value [-Werror=aggregate-return]
>    #define ktime_to_timespec64(kt)  ns_to_timespec64((kt))
>                                     ^~~~~~~~~~~~~~~~~~~~~~
>   ../include/linux/timekeeping.h:166:8: note: in expansion of macro 'ktime_to_timespec64'
>     *ts = ktime_to_timespec64(ktime_get_coarse_boottime());
>
> Remove this warning from W=2 completely.
>
> Signed-off-by: Mathieu Malaterre <malat@debian.org>
> ---

Applied to linux-kbuild. Thanks.



>  scripts/Makefile.extrawarn | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 3ab8d1a303cd..98081ab300e5 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -34,7 +34,6 @@ warning-1 += $(call cc-option, -Wstringop-truncation)
>  warning-1 += -Wno-missing-field-initializers
>  warning-1 += -Wno-sign-compare
>
> -warning-2 := -Waggregate-return
>  warning-2 += -Wcast-align
>  warning-2 += -Wdisabled-optimization
>  warning-2 += -Wnested-externs
> --
> 2.20.1
>


-- 
Best Regards
Masahiro Yamada
