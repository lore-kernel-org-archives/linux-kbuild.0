Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:63799 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727013AbeINSUU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Sep 2018 14:20:20 -0400
MIME-Version: 1.0
In-Reply-To: <1536727974-28211-1-git-send-email-yamada.masahiro@socionext.com>
References: <1536727974-28211-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 14 Sep 2018 22:04:57 +0900
Message-ID: <CAK7LNAQPnZW9fa5AvACotct5CfFNvHp-ivqoiqQiPXDQKVyQmg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: prefix Makefile.dtbinst path with $(srctree) unconditionally
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-09-12 13:52 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> $(srctree) always points to the top of the source tree whether
> KBUILD_SRC is set or not.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild.


>  scripts/Kbuild.include | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index ce53639..46cc43e 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -193,7 +193,7 @@ modbuiltin := -f $(srctree)/scripts/Makefile.modbuiltin obj
>  # Shorthand for $(Q)$(MAKE) -f scripts/Makefile.dtbinst obj=
>  # Usage:
>  # $(Q)$(MAKE) $(dtbinst)=dir
> -dtbinst := -f $(if $(KBUILD_SRC),$(srctree)/)scripts/Makefile.dtbinst obj
> +dtbinst := -f $(srctree)/scripts/Makefile.dtbinst obj
>
>  ###
>  # Shorthand for $(Q)$(MAKE) -f scripts/Makefile.clean obj=
> --
> 2.7.4
>



-- 
Best Regards
Masahiro Yamada
