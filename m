Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:28455 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbgF1CSt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Jun 2020 22:18:49 -0400
MIME-Version: 1.0
References: <20200625154226.25692cd1@coco.lan> <371f4815f6daac50e90057520d5f2b40a6ca3a74.1593096720.git.mchehab+huawei@kernel.org>
In-Reply-To: <371f4815f6daac50e90057520d5f2b40a6ca3a74.1593096720.git.mchehab+huawei@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 28 Jun 2020 11:17:38 +0900
Message-ID: <CAK7LNATnariwQ14w7dDKRS76yXKzLn6pSbk02zQF6LHm4i=ppw@mail.gmail.com>
Subject: Re: [PATCH] kconfig: qconf: Fix find on split mode
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Maxim Levitsky <mlevitsk@redhat.com>

On Thu, Jun 25, 2020 at 11:53 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> The logic handling find on split mode is currently broken.
> Fix it, making it work again as expected.
>
> Reported-by: Maxim Levitsky <mlevitsk@redhat.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---


Applied to linux-kbuild.
Thanks.


>  scripts/kconfig/qconf.cc | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index c0ac8f7b5f1a..b8f577c6e8aa 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -1645,22 +1645,21 @@ void ConfigMainWindow::setMenuLink(struct menu *menu)
>                         return;
>                 list->setRootMenu(parent);
>                 break;
> -       case symbolMode:
> +       case menuMode:
>                 if (menu->flags & MENU_ROOT) {
> -                       configList->setRootMenu(menu);
> +                       menuList->setRootMenu(menu);
>                         configList->clearSelection();
> -                       list = menuList;
> -               } else {
>                         list = configList;
> +               } else {
> +                       configList->setRootMenu(menu);
> +                       configList->clearSelection();
> +
>                         parent = menu_get_parent_menu(menu->parent);
>                         if (!parent)
>                                 return;
> -                       item = menuList->findConfigItem(parent);
> -                       if (item) {
> -                               item->setSelected(true);
> -                               menuList->scrollToItem(item);
> -                       }
> -                       list->setRootMenu(parent);
> +                       menuList->setRootMenu(parent);
> +
> +                       list = menuList;
>                 }
>                 break;
>         case fullMode:
> --
> 2.26.2
>
>


-- 
Best Regards
Masahiro Yamada
