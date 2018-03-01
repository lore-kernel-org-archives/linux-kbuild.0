Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from zm-mta-out-2.u-ga.fr ([152.77.200.57]:60890 "EHLO
        zm-mta-out-2.u-ga.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1033214AbeCATzY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 1 Mar 2018 14:55:24 -0500
Reply-To: nicolas.palix@univ-grenoble-alpes.fr
Subject: Re: [PATCH] Coccinelle: memdup: Fix typo in warning messages
References: <20180301085717.GA4508@gmail.com>
From: "Nicolas Palix (LIG)" <Nicolas.Palix@imag.fr>
Message-ID: <8cc75580-b29a-a599-4af1-6bb3783bc705@imag.fr>
Date: Thu, 1 Mar 2018 20:45:59 +0100
MIME-Version: 1.0
In-Reply-To: <20180301085717.GA4508@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dafna Hirschfeld <dafna3@gmail.com>, Julia.Lawall@lip6.fr, Gilles.Muller@lip6.fr, michal.lkml@markovi.net, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: outreachy-kernel@googlegroups.com

Le 01/03/2018 à 09:57, Dafna Hirschfeld a écrit :
> Replace 'kmemdep' with 'kmemdup' in warning messages.
> 
> Signed-off-by: Dafna Hirschfeld <dafna3@gmail.com>
> Acked-by: Julia Lawall <julia.lawall@lip6.fr>
Acked-by: Nicolas Palix <nicolas.palix@imag.fr>
> ---
>   scripts/coccinelle/api/memdup.cocci | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/coccinelle/api/memdup.cocci b/scripts/coccinelle/api/memdup.cocci
> index 1249b72..8fd6437 100644
> --- a/scripts/coccinelle/api/memdup.cocci
> +++ b/scripts/coccinelle/api/memdup.cocci
> @@ -56,10 +56,10 @@ statement S;
>   p << r.p;
>   @@
>   
> -coccilib.org.print_todo(p[0], "WARNING opportunity for kmemdep")
> +coccilib.org.print_todo(p[0], "WARNING opportunity for kmemdup")
>   
>   @script:python depends on report@
>   p << r.p;
>   @@
>   
> -coccilib.report.print_report(p[0], "WARNING opportunity for kmemdep")
> +coccilib.report.print_report(p[0], "WARNING opportunity for kmemdup")
> 


-- 
Nicolas Palix
http://lig-membres.imag.fr/palix/
