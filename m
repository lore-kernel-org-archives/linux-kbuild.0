Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:24525 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752405AbdLLO7W (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Dec 2017 09:59:22 -0500
MIME-Version: 1.0
In-Reply-To: <1507172808-12246-1-git-send-email-ulfalizer@gmail.com>
References: <1507172808-12246-1-git-send-email-ulfalizer@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 12 Dec 2017 23:58:16 +0900
Message-ID: <CAK7LNAT2_Su7=ADrVUsZ0EgTsyh_3QT=nWZV9E5DyFHFDhegbQ@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Sync zconf.y with zconf.tab.c_shipped
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, Arnaud Lacombe <lacombar@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-10-05 12:06 GMT+09:00 Ulf Magnusson <ulfalizer@gmail.com>:
> Looks like a change to a comment in zconf.y was never committed, because
> the updated version only appears it zconf.tab.c_shipped. Update the
> comment in zconf.y to match.
>
> Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
> ---
>  scripts/kconfig/zconf.y | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
> index c8f396c..4b2cf41 100644
> --- a/scripts/kconfig/zconf.y
> +++ b/scripts/kconfig/zconf.y
> @@ -101,7 +101,7 @@ static struct menu *current_menu, *current_entry;
>  } if_entry menu_entry choice_entry
>
>  %{
> -/* Include zconf_id.c here so it can see the token constants. */
> +/* Include kconf_id.c here so it can see the token constants. */
>  #include "kconf_id.c"
>  %}


Applied to linux-kbuild/kconfig.
Thanks!

BTW, I do not know the historical reason
why zconf instead of kconf in the first place...


-- 
Best Regards
Masahiro Yamada
