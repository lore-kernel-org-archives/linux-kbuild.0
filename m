Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:36964 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730798AbeGWCsv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 22 Jul 2018 22:48:51 -0400
Received: from mail-ua0-f178.google.com (mail-ua0-f178.google.com [209.85.217.178]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id w6N1o22j000661
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Jul 2018 10:50:02 +0900
Received: by mail-ua0-f178.google.com with SMTP id g18-v6so10750970uam.6
        for <linux-kbuild@vger.kernel.org>; Sun, 22 Jul 2018 18:50:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <ff6eeb9d-a7de-0bc3-05ef-53bb1286347f@infradead.org>
References: <ff6eeb9d-a7de-0bc3-05ef-53bb1286347f@infradead.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 23 Jul 2018 10:49:21 +0900
Message-ID: <CAK7LNAQNyMLiHxfHNG7U6to9vovPBD6dRHgE-GNA4WKBZHQ5-Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix typos in description of "choice" in kconfig-language.txt
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>

2018-07-19 14:46 GMT+09:00 Randy Dunlap <rdunlap@infradead.org>:
> From: Randy Dunlap <rdunlap@infradead.org>
>
> Fix a couple of punctuation "typos" in the description of the
> "choice" keyword.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
>  Documentation/kbuild/kconfig-language.txt |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Applied.  Thanks!


> --- linux-next-20180717.orig/Documentation/kbuild/kconfig-language.txt
> +++ linux-next-20180717/Documentation/kbuild/kconfig-language.txt
> @@ -370,7 +370,7 @@ choices:
>
>  This defines a choice group and accepts any of the above attributes as
>  options. A choice can only be of type bool or tristate.  If no type is
> -specified for a choice, it's type will be determined by the type of
> +specified for a choice, its type will be determined by the type of
>  the first choice element in the group or remain unknown if none of the
>  choice elements have a type specified, as well.
>
> @@ -384,7 +384,7 @@ A choice accepts another option "optiona
>  choice to 'n' and no entry needs to be selected.
>  If no [symbol] is associated with a choice, then you can not have multiple
>  definitions of that choice. If a [symbol] is associated to the choice,
> -then you may define the same choice (ie. with the same entries) in another
> +then you may define the same choice (i.e. with the same entries) in another
>  place.
>
>  comment:
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
