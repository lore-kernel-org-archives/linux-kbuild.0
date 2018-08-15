Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:51518 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728504AbeHOGb4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Aug 2018 02:31:56 -0400
MIME-Version: 1.0
In-Reply-To: <adc5b6e4-28c1-7fe2-b7b1-c6b1cd39f8ed@infradead.org>
References: <adc5b6e4-28c1-7fe2-b7b1-c6b1cd39f8ed@infradead.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 15 Aug 2018 12:40:36 +0900
Message-ID: <CAK7LNAT3nv2aJFvro4NmCyRNEBH_Kv=1cZaqt3PrQYGGatjnLg@mail.gmail.com>
Subject: Re: [PATCH] modpost: check strdup() return value
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Yuexing Wang <wangyxlandq@gmail.com>

2018-08-15 5:50 GMT+09:00 Randy Dunlap <rdunlap@infradead.org>:
> From: Randy Dunlap <rdunlap@infradead.org>
>
> Fix missing error check for function strdup() in scripts/mod/modpost.c.
>
> Fixes kernel bugzilla #200319:
> https://bugzilla.kernel.org/show_bug.cgi?id=200319
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Yuexing Wang <wangyxlandq@gmail.com>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>  scripts/mod/modpost.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- linux-next-20180814.orig/scripts/mod/modpost.c
> +++ linux-next-20180814/scripts/mod/modpost.c
> @@ -672,7 +672,7 @@ static void handle_modversions(struct mo
>                         if (ELF_ST_TYPE(sym->st_info) == STT_SPARC_REGISTER)
>                                 break;
>                         if (symname[0] == '.') {
> -                               char *munged = strdup(symname);
> +                               char *munged = NOFAIL(strdup(symname));
>                                 munged[0] = '_';
>                                 munged[1] = toupper(munged[1]);
>                                 symname = munged;
>
>


While you are here,
will you fix a little more?


line 1321:
            char *p = malloc(20);

line 1341:
            return strdup("");

line 2039:
            buf->p = realloc(buf->p, buf->size);



-- 
Best Regards
Masahiro Yamada
