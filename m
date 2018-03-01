Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:53267 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1031631AbeCAPPE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 1 Mar 2018 10:15:04 -0500
MIME-Version: 1.0
In-Reply-To: <20180301085717.GA4508@gmail.com>
References: <20180301085717.GA4508@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 2 Mar 2018 00:14:14 +0900
Message-ID: <CAK7LNASZo27PwwbhMPV+KPv1u=933Vkt0-ve1HG1E2gxmnCUhA@mail.gmail.com>
Subject: Re: [PATCH] Coccinelle: memdup: Fix typo in warning messages
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dafna Hirschfeld <dafna3@gmail.com>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, outreachy-kernel@googlegroups.com

2018-03-01 17:57 GMT+09:00 Dafna Hirschfeld <dafna3@gmail.com>:
> Replace 'kmemdep' with 'kmemdup' in warning messages.
>
> Signed-off-by: Dafna Hirschfeld <dafna3@gmail.com>
> Acked-by: Julia Lawall <julia.lawall@lip6.fr>
> ---

Applied to linux-kbuild/fixes.  Thanks!


>  scripts/coccinelle/api/memdup.cocci | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/coccinelle/api/memdup.cocci b/scripts/coccinelle/api/memdup.cocci
> index 1249b72..8fd6437 100644
> --- a/scripts/coccinelle/api/memdup.cocci
> +++ b/scripts/coccinelle/api/memdup.cocci
> @@ -56,10 +56,10 @@ statement S;
>  p << r.p;
>  @@
>
> -coccilib.org.print_todo(p[0], "WARNING opportunity for kmemdep")
> +coccilib.org.print_todo(p[0], "WARNING opportunity for kmemdup")
>
>  @script:python depends on report@
>  p << r.p;
>  @@
>
> -coccilib.report.print_report(p[0], "WARNING opportunity for kmemdep")
> +coccilib.report.print_report(p[0], "WARNING opportunity for kmemdup")
> --
> 2.7.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
