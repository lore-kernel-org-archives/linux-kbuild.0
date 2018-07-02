Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:61650 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752055AbeGBPPj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Jul 2018 11:15:39 -0400
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com [209.85.213.47]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id w62FFXD3001278
        for <linux-kbuild@vger.kernel.org>; Tue, 3 Jul 2018 00:15:33 +0900
Received: by mail-vk0-f47.google.com with SMTP id l189-v6so4834551vke.1
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Jul 2018 08:15:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180629091237.16620-3-dirk@gouders.net>
References: <ghd0wc58z6.fsf@lena.gouders.net> <20180629091237.16620-1-dirk@gouders.net>
 <20180629091237.16620-3-dirk@gouders.net>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 3 Jul 2018 00:14:52 +0900
Message-ID: <CAK7LNASQ6mJkn69BkLm40t8-dxJfdQJ+G0nBrtUCeU2hBN_b3Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] kconfig: fix comment for symbol flag SYMBOL_AUTO
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>

2018-06-29 18:12 GMT+09:00 Dirk Gouders <dirk@gouders.net>:
> I could not verify the comment for that symbol flag.

Good catch.
I forgot to fix up the comment
in commit 104daea149c4.


> I could only find that flag set for choices and the defconfig_list
> symbol in a dump of all symbols, which corresponds to the only two
> locations in the code where that flag is being set explicitely.
>
> Signed-off-by: Dirk Gouders <dirk@gouders.net>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  scripts/kconfig/expr.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
> index 94a383b21df6..0f53e44f14d6 100644
> --- a/scripts/kconfig/expr.h
> +++ b/scripts/kconfig/expr.h
> @@ -141,7 +141,9 @@ struct symbol {
>  #define SYMBOL_OPTIONAL   0x0100  /* choice is optional - values can be 'n' */
>  #define SYMBOL_WRITE      0x0200  /* write symbol to file (KCONFIG_CONFIG) */
>  #define SYMBOL_CHANGED    0x0400  /* ? */
> -#define SYMBOL_AUTO       0x1000  /* value from environment variable */
> +#define SYMBOL_AUTO       0x1000  /* Symbols of type choice and the
> +                                  * symbol with option defconfig_list
> +                                  * have this flag set */

Hmm.  This explanation is not very helpful in my opinion.
Could you reword that?

In my understanding, symbols with SYMBOL_AUTO
are never written out to file.





>  #define SYMBOL_CHECKED    0x2000  /* used during dependency checking */
>  #define SYMBOL_WARNED     0x8000  /* warning has been issued */
>
> --
> 2.16.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
