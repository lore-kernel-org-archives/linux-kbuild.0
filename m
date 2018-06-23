Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:17883 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751734AbeFWILX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Jun 2018 04:11:23 -0400
MIME-Version: 1.0
In-Reply-To: <b2854ed6-073d-11b9-b344-571a0903995c@infradead.org>
References: <b2854ed6-073d-11b9-b344-571a0903995c@infradead.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 23 Jun 2018 17:10:32 +0900
Message-ID: <CAK7LNAT9YQHJVXBevFG=ckkUVguakCwBuck8NO+rxoTi8o8GOA@mail.gmail.com>
Subject: Re: [PATCH] kconfig: document Kconfig source file comments
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

2018-06-23 12:08 GMT+09:00 Randy Dunlap <rdunlap@infradead.org>:
> From: Randy Dunlap <rdunlap@infradead.org>
>
> I saw this type of Kconfig construct on LKML:
>
> config SYMBOOL
>         #bool "prompt string"
>         default y
>
> and wondered what it does.  Then I wondered if '#' comments are
> even documented.  They aren't, so add a little doc for that.
>
> Ah, good.  kconfig says:
> arch/x86/Kconfig:2942:warning: config symbol defined without type
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---


Applied to linux-kbuild/fixes.  Thanks!


>  Documentation/kbuild/kconfig-language.txt |    6 ++++++
>  1 file changed, 6 insertions(+)
>
> --- lnx-418-rc1.orig/Documentation/kbuild/kconfig-language.txt
> +++ lnx-418-rc1/Documentation/kbuild/kconfig-language.txt
> @@ -430,6 +430,12 @@ This sets the config program's title bar
>  to use it. It should be placed at the top of the configuration, before any
>  other statement.
>
> +'#' Kconfig source file comment:
> +
> +An unquoted '#' character anywhere in a source file line indicates
> +the beginning of a source file comment.  The remainder of that line
> +is a comment.
> +
>
>  Kconfig hints
>  -------------
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
