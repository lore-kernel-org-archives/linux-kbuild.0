Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:60357 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbgBZRsf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Feb 2020 12:48:35 -0500
MIME-Version: 1.0
References: <20200222190435.11767-1-masahiroy@kernel.org> <20200222190435.11767-3-masahiroy@kernel.org>
In-Reply-To: <20200222190435.11767-3-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 27 Feb 2020 02:47:51 +0900
Message-ID: <CAK7LNAQoBXfSpQQee1wjx6wXJ2Zeuit6K+qfZwKZBhOG1M1p1g@mail.gmail.com>
Subject: Re: [PATCH 3/5] kbuild: add dtbs_check to PHONY
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, DTML <devicetree@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sun, Feb 23, 2020 at 4:04 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The dtbs_check should be a phony target, but currently it is not
> specified so.
>
> 'make dtbs_check' works even if a file named 'dtbs_check' exists
> because it depends on another phony target, scripts_dtc, but we
> should not rely on it.
>
> Add dtbs_check to PHONY.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied with Rob's Ack.


>
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index aab38cb02b24..102710a9228c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1238,7 +1238,7 @@ ifneq ($(dtstree),)
>  %.dtb: include/config/kernel.release scripts_dtc
>         $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
>
> -PHONY += dtbs dtbs_install dt_binding_check
> +PHONY += dtbs dtbs_install dtbs_check dt_binding_check
>  dtbs dtbs_check: include/config/kernel.release scripts_dtc
>         $(Q)$(MAKE) $(build)=$(dtstree)
>
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
