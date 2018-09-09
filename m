Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:25229 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726447AbeIILyi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 9 Sep 2018 07:54:38 -0400
MIME-Version: 1.0
In-Reply-To: <1536021744-2552-1-git-send-email-yamada.masahiro@socionext.com>
References: <1536021744-2552-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 9 Sep 2018 16:04:58 +0900
Message-ID: <CAK7LNAQOY4fkkTnOwXs8YtS+q8UNTZ+iYgx1Jim=LQkRGNF5OQ@mail.gmail.com>
Subject: Re: [PATCH] kallsyms: remove left-over Blackfin code
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Aaron Wu <Aaron.Wu@analog.com>, Bryan Wu <cooloney@gmail.com>, Robin Getz <robin.getz@analog.com>, Rusty Russell <rusty@rustcorp.com.au>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-09-04 9:42 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> These symbols were added by commit 028f042613c3 ("kallsyms: support
> kernel symbols in Blackfin on-chip memory") for Blackfin.
>
> The Blackfin support was removed by commit 4ba66a976072 ("arch: remove
> blackfin port").
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild.



>  scripts/kallsyms.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> index a9186a9..50af068 100644
> --- a/scripts/kallsyms.c
> +++ b/scripts/kallsyms.c
> @@ -48,8 +48,6 @@ static unsigned long long relative_base;
>  static struct addr_range text_ranges[] = {
>         { "_stext",     "_etext"     },
>         { "_sinittext", "_einittext" },
> -       { "_stext_l1",  "_etext_l1"  }, /* Blackfin on-chip L1 inst SRAM */
> -       { "_stext_l2",  "_etext_l2"  }, /* Blackfin on-chip L2 SRAM */
>  };
>  #define text_range_text     (&text_ranges[0])
>  #define text_range_inittext (&text_ranges[1])
> --
> 2.7.4
>





-- 
Best Regards
Masahiro Yamada
