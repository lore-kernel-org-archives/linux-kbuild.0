Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:38513 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753152AbdKWOT3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Nov 2017 09:19:29 -0500
MIME-Version: 1.0
In-Reply-To: <1510850953-8795-1-git-send-email-yamada.masahiro@socionext.com>
References: <1510850953-8795-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 23 Nov 2017 23:18:37 +0900
Message-ID: <CAK7LNARxbvz+Y9fXPftRucUh54x0gLCv8obD3f2EgoFusjC4wQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: clean up *.i and *.lst patterns by make clean
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-11-17 1:49 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> *.i and *.lst are supported by single targets build.  Clean up them.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 4299f94..3ea081a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1545,9 +1545,9 @@ clean: $(clean-dirs)
>         $(call cmd,rmdirs)
>         $(call cmd,rmfiles)
>         @find $(if $(KBUILD_EXTMOD), $(KBUILD_EXTMOD), .) $(RCS_FIND_IGNORE) \
> -               \( -name '*.[oas]' -o -name '*.ko' -o -name '.*.cmd' \
> +               \( -name '*.[aios]' -o -name '*.ko' -o -name '.*.cmd' \
>                 -o -name '*.ko.*' -o -name '*.dtb' -o -name '*.dtb.S' \
> -               -o -name '*.dwo'  \
> +               -o -name '*.dwo' -o -name '*.lst' \
>                 -o -name '*.su'  \
>                 -o -name '.*.d' -o -name '.*.tmp' -o -name '*.mod.c' \
>                 -o -name '*.symtypes' -o -name 'modules.order' \
> --


Applied to linux-kbuild.


-- 
Best Regards
Masahiro Yamada
