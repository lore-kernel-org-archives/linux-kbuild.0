Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:49753 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727809AbeHaSyd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 31 Aug 2018 14:54:33 -0400
MIME-Version: 1.0
In-Reply-To: <1535620722-14689-1-git-send-email-lukas.bulwahn@gmail.com>
References: <1535620722-14689-1-git-send-email-lukas.bulwahn@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 31 Aug 2018 23:45:58 +0900
Message-ID: <CAK7LNAQDm+=55UvLKp3ox_a64WU=W55=2ftAQ7MmMxA5E-bXkw@mail.gmail.com>
Subject: Re: [PATCH] kconfig: remove a spurious self-assignment
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-08-30 18:18 GMT+09:00 Lukas Bulwahn <lukas.bulwahn@gmail.com>:
> The self assignment was probably introduced by an automated code
> refactoring in
> commit 694c49a7c01c ("kconfig: drop localization support").
>
> The issue was identified by a self-assign warning when running
> make menuconfig with clang.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---

Applied to linux-kbuild/fixes. Thanks!


>  scripts/kconfig/mconf.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
> index 83b5836..143c05f 100644
> --- a/scripts/kconfig/mconf.c
> +++ b/scripts/kconfig/mconf.c
> @@ -490,7 +490,6 @@ static void build_conf(struct menu *menu)
>                         switch (prop->type) {
>                         case P_MENU:
>                                 child_count++;
> -                               prompt = prompt;
>                                 if (single_menu_mode) {
>                                         item_make("%s%*c%s",
>                                                   menu->data ? "-->" : "++>",
> --
> 2.7.4
>



-- 
Best Regards
Masahiro Yamada
