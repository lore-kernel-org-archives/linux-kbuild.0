Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:59441 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751266AbeFVSFJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Jun 2018 14:05:09 -0400
Received: from mail-ua0-f173.google.com (mail-ua0-f173.google.com [209.85.217.173]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id w5MI52ON001774
        for <linux-kbuild@vger.kernel.org>; Sat, 23 Jun 2018 03:05:03 +0900
Received: by mail-ua0-f173.google.com with SMTP id c23-v6so4844439uan.3
        for <linux-kbuild@vger.kernel.org>; Fri, 22 Jun 2018 11:05:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180621133054.21090-1-dirk@gouders.net>
References: <20180621133054.21090-1-dirk@gouders.net>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 23 Jun 2018 03:04:21 +0900
Message-ID: <CAK7LNASJqRkufPo8RM1oTNVxJjHqNNzihf=oR1TFHWnUoqvmpA@mail.gmail.com>
Subject: Re: [PATCH] kconfig: fix line numbers for if-entries in menu tree
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2018-06-21 22:30 GMT+09:00 Dirk Gouders <dirk@gouders.net>:
> The line numers for if-entries in the menu tree are off by one or more
> lines which is confusing when debugging for correctness of unrelated changes.
>
> According to the git log, commit a02f0570ae201c49 (kconfig: improve
> error handling in the parser) was the last one that changed that part
> of the parser and replaced
>
>         "if_entry: T_IF expr T_EOL"
> by
>         "if_entry: T_IF expr nl"
>
> but the commit message does not state why this has been done.
>
> When reverting that part of the commit, only the line numers are
> corrected (checked with cdebug = DEBUG_PARSE in zconf.y), otherwise
> the menu tree remains unchanged (checked with zconfdump() enabled in
> conf.c).
>
> An example for the corrected line numbers:
>
> drivers/soc/Kconfig:15:source drivers/soc/tegra/Kconfig
> drivers/soc/tegra/Kconfig:4:if
> drivers/soc/tegra/Kconfig:6:if
>
> changes to:
>
> drivers/soc/Kconfig:15:source drivers/soc/tegra/Kconfig
> drivers/soc/tegra/Kconfig:1:if
> drivers/soc/tegra/Kconfig:4:if
>
> Signed-off-by: Dirk Gouders <dirk@gouders.net>

Applied to linux-kbuild/fixes.  Thanks!



> ---
>  scripts/kconfig/zconf.y | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
> index 6f9b0aa32a82..ed84d4a8e288 100644
> --- a/scripts/kconfig/zconf.y
> +++ b/scripts/kconfig/zconf.y
> @@ -31,7 +31,7 @@ struct symbol *symbol_hash[SYMBOL_HASHSIZE];
>  static struct menu *current_menu, *current_entry;
>
>  %}
> -%expect 32
> +%expect 31
>
>  %union
>  {
> @@ -337,7 +337,7 @@ choice_block:
>
>  /* if entry */
>
> -if_entry: T_IF expr nl
> +if_entry: T_IF expr T_EOL
>  {
>         printd(DEBUG_PARSE, "%s:%d:if\n", zconf_curname(), zconf_lineno());
>         menu_add_entry(NULL);
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
