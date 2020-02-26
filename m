Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:61090 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbgBZRtF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Feb 2020 12:49:05 -0500
MIME-Version: 1.0
References: <20200222190435.11767-1-masahiroy@kernel.org> <20200222190435.11767-4-masahiroy@kernel.org>
In-Reply-To: <20200222190435.11767-4-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 27 Feb 2020 02:48:14 +0900
Message-ID: <CAK7LNATBj30rmh8XCO_QGY6JbMcyBWx2e=1CxoWNJ_t4mPecJA@mail.gmail.com>
Subject: Re: [PATCH 4/5] kbuild: add dt_binding_check to PHONY in a correct place
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, DTML <devicetree@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sun, Feb 23, 2020 at 4:04 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The dt_binding_check is added to PHONY, but it is visible only
> when $(dtstree) is not empty. So, it is not specified as phony
> for ARCH=x86 etc.
>
> Add it to PHONY outside the ifneq ... endif block.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied with Rob's Ack.



>  Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 102710a9228c..83f9b8f6fbaf 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1238,7 +1238,7 @@ ifneq ($(dtstree),)
>  %.dtb: include/config/kernel.release scripts_dtc
>         $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
>
> -PHONY += dtbs dtbs_install dtbs_check dt_binding_check
> +PHONY += dtbs dtbs_install dtbs_check
>  dtbs dtbs_check: include/config/kernel.release scripts_dtc
>         $(Q)$(MAKE) $(build)=$(dtstree)
>
> @@ -1258,6 +1258,7 @@ PHONY += scripts_dtc
>  scripts_dtc: scripts_basic
>         $(Q)$(MAKE) $(build)=scripts/dtc
>
> +PHONY += dt_binding_check
>  dt_binding_check: scripts_dtc
>         $(Q)$(MAKE) $(build)=Documentation/devicetree/bindings
>
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
