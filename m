Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:20365 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732430AbeHBRlK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Aug 2018 13:41:10 -0400
MIME-Version: 1.0
In-Reply-To: <20180802134708.26456-1-dirk@gouders.net>
References: <20180802134708.26456-1-dirk@gouders.net>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 3 Aug 2018 00:48:22 +0900
Message-ID: <CAK7LNAS2JRuT2-2jx0t4BM9VrJROXZNL4zqsVNNvYnodHx+HAQ@mail.gmail.com>
Subject: Re: [PATCH] Kbuild: Makefile.modbuiltin: include auto.conf and
 tristate.conf mandatory
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-08-02 22:47 GMT+09:00 Dirk Gouders <dirk@gouders.net>:
> The files auto.conf and tristate.conf are mandatory for building
> modules.builtin files, therefore include them as such.
>
> Usually, the top-level Makefile ensures that those files exist but we
> want to make sure we get noticed if they are missing for whatever
> reason.
>
> Signed-off-by: Dirk Gouders <dirk@gouders.net>
> ---

Applied. Thanks!

>  scripts/Makefile.modbuiltin | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/Makefile.modbuiltin b/scripts/Makefile.modbuiltin
> index 40867a41615b..a072a4267746 100644
> --- a/scripts/Makefile.modbuiltin
> +++ b/scripts/Makefile.modbuiltin
> @@ -8,10 +8,10 @@ src := $(obj)
>  PHONY := __modbuiltin
>  __modbuiltin:
>
> --include include/config/auto.conf
> +include include/config/auto.conf
>  # tristate.conf sets tristate variables to uppercase 'Y' or 'M'
>  # That way, we get the list of built-in modules in obj-Y
> --include include/config/tristate.conf
> +include include/config/tristate.conf
>
>  include scripts/Kbuild.include
>
> --
> 2.16.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
