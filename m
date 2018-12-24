Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:40758 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbeLXPUJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Dec 2018 10:20:09 -0500
MIME-Version: 1.0
References: <1545373382-29088-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1545373382-29088-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 25 Dec 2018 00:19:23 +0900
Message-ID: <CAK7LNATfbaLn55=MKnJb0RJym_tUfiOeO4Xq3+46n59f8yJ7iA@mail.gmail.com>
Subject: Re: [PATCH] kconfig: remove unused "file" field of yylval union
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Dec 21, 2018 at 5:59 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> This has never been used.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---


Applied to linux-kbuild/kconfig.


>  scripts/kconfig/zconf.y | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
> index 8a4d029..60ee8e7 100644
> --- a/scripts/kconfig/zconf.y
> +++ b/scripts/kconfig/zconf.y
> @@ -36,7 +36,6 @@ static struct menu *current_menu, *current_entry;
>  %union
>  {
>         char *string;
> -       struct file *file;
>         struct symbol *symbol;
>         struct expr *expr;
>         struct menu *menu;
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
