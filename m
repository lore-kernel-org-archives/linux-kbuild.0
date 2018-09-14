Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:16747 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727013AbeINSVI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Sep 2018 14:21:08 -0400
MIME-Version: 1.0
In-Reply-To: <1536734610-22173-1-git-send-email-yamada.masahiro@socionext.com>
References: <1536734610-22173-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 14 Sep 2018 22:05:38 +0900
Message-ID: <CAK7LNAR2_5iak0iQ6xvsgyuvJdUD6TJe=g3VAPe08DA3UtK4nA@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: hide most of targets when running config or
 mixed targets
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-09-12 15:43 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> When mixed/config targets are being processed, the top Makefile
> does not need to parse the rest of targets.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild.


>  Makefile | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 4d5c883..4b76e22 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1615,9 +1615,6 @@ namespacecheck:
>  export_report:
>         $(PERL) $(srctree)/scripts/export_report.pl
>
> -endif #ifeq ($(config-targets),1)
> -endif #ifeq ($(mixed-targets),1)
> -
>  PHONY += checkstack kernelrelease kernelversion image_name
>
>  # UML needs a little special treatment here.  It wants to use the host
> @@ -1732,6 +1729,8 @@ ifneq ($(cmd_files),)
>    include $(cmd_files)
>  endif
>
> +endif   # ifeq ($(config-targets),1)
> +endif   # ifeq ($(mixed-targets),1)
>  endif  # skip-makefile
>
>  PHONY += FORCE
> --
> 2.7.4
>



-- 
Best Regards
Masahiro Yamada
