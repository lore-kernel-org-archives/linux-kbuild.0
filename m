Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:45986 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965110AbeF0QbY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 27 Jun 2018 12:31:24 -0400
Received: from mail-ua0-f169.google.com (mail-ua0-f169.google.com [209.85.217.169]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id w5RGVFxH013701
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Jun 2018 01:31:16 +0900
Received: by mail-ua0-f169.google.com with SMTP id r18-v6so1645107ual.13
        for <linux-kbuild@vger.kernel.org>; Wed, 27 Jun 2018 09:31:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180622192739.5327-3-dirk@gouders.net>
References: <20180622192739.5327-1-dirk@gouders.net> <20180622192739.5327-3-dirk@gouders.net>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 28 Jun 2018 01:30:34 +0900
Message-ID: <CAK7LNARBO2u4fn5_R08Q34DLZfg3VEa_N=mg3+vgNcGYr-_1wA@mail.gmail.com>
Subject: Re: [PATCH 2/3] kconfig: handle P_SYMBOL in print_symbol()
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>

2018-06-23 4:27 GMT+09:00 Dirk Gouders <dirk@gouders.net>:
> Each symbol has a property of type P_SYMBOL since commit
> 59e89e3ddf8523be (kconfig: save location of config symbols).
> Handle those properties in print_symbol().
>
> Further, place a pointer to print_symbol() in the comment above the
> list of known property type.
>
> Signed-off-by: Dirk Gouders <dirk@gouders.net>
> Cc: Sam Ravnborg <sam@ravnborg.org>


Applied to linux-kbuild/fixes. Thanks!

> ---
>  scripts/kconfig/expr.h  | 3 +++
>  scripts/kconfig/zconf.y | 4 ++++
>  2 files changed, 7 insertions(+)
>
> diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
> index 94a383b21df6..f63b41b0dd49 100644
> --- a/scripts/kconfig/expr.h
> +++ b/scripts/kconfig/expr.h
> @@ -171,6 +171,9 @@ struct symbol {
>   * config BAZ
>   *         int "BAZ Value"
>   *         range 1..255
> + *
> + * Please, also check zconf.y:print_symbol() when modifying the
> + * list of property types!
>   */
>  enum prop_type {
>         P_UNKNOWN,
> diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
> index 6f9b0aa32a82..525b82c5fb58 100644
> --- a/scripts/kconfig/zconf.y
> +++ b/scripts/kconfig/zconf.y
> @@ -717,6 +717,10 @@ static void print_symbol(FILE *out, struct menu *menu)
>                         print_quoted_string(out, prop->text);
>                         fputc('\n', out);
>                         break;
> +               case P_SYMBOL:
> +                       fputs( "  symbol ", out);
> +                       fprintf(out, "%s\n", prop->sym->name);
> +                       break;
>                 default:
>                         fprintf(out, "  unknown prop %d!\n", prop->type);
>                         break;
> --
> 2.13.6
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
