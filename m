Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:62879 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728816AbgF3Cua (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jun 2020 22:50:30 -0400
MIME-Version: 1.0
References: <cover.1593423060.git.mchehab+huawei@kernel.org> <45fa5ad583de1766de6169366df1df5837c5dc7c.1593423060.git.mchehab+huawei@kernel.org>
In-Reply-To: <45fa5ad583de1766de6169366df1df5837c5dc7c.1593423060.git.mchehab+huawei@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 30 Jun 2020 11:49:24 +0900
Message-ID: <CAK7LNASSeZiod0i1205_HrWNOb5BLb9FNbK2Y4ekx0sZ7QRLpQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] kconfig: qconf: navigate menus on hyperlinks
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Maxim Levitsky <mlevitsk@redhat.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Jun 29, 2020 at 6:35 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Instead of just changing the helper window to show a
> dependency, also navigate to it at the config and menu
> widgets.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>


Thanks, I think this is a nice improvement.

When I click a link, both the previous config
and the new one are highlighted.
Is this intentional behavior?

For example, put the following simple Kconfig
at the top-level.

From the info window of FOO,
click the 'select BAR' link,
and then both FOO and BAR are highlighted.

------------>8---------------
config FOO
       bool "foo"
       select BAR
       default y

config BAR
       bool "bar"
       default y
------------>8-----------------








> ---
>  scripts/kconfig/qconf.cc | 24 +++++-------------------
>  1 file changed, 5 insertions(+), 19 deletions(-)
>
> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index 49f0688fceb8..d8870b15a178 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -1232,7 +1232,6 @@ void ConfigInfoView::clicked(const QUrl &url)
>         char *data = new char[count + 1];
>         struct symbol **result;
>         struct menu *m = NULL;
> -       char type;
>
>         if (count < 1) {
>                 qInfo() << "Clicked link is empty";
> @@ -1242,7 +1241,6 @@ void ConfigInfoView::clicked(const QUrl &url)
>
>         memcpy(data, str.constData(), count);
>         data[count] = '\0';
> -       type = data[0];
>
>         /* Seek for exact match */
>         data[0] = '^';
> @@ -1255,15 +1253,8 @@ void ConfigInfoView::clicked(const QUrl &url)
>         }
>
>         sym = *result;
> -       if (type == 's') {
> -               symbolInfo();
> -               emit showDebugChanged(true);
> -               free(result);
> -               delete data;
> -               return;
> -       }
>
> -       /* URL is a menu */
> +       /* Seek for the menu which holds the symbol */
>         for (struct property *prop = sym->prop; prop; prop = prop->next) {
>                     if (prop->type != P_PROMPT && prop->type != P_MENU)
>                             continue;
> @@ -1271,17 +1262,11 @@ void ConfigInfoView::clicked(const QUrl &url)
>                     break;
>         }
>
> -       if (!m) {
> +       if (!m)
>                 qInfo() << "Clicked menu is invalid:" << data;
> -               free(result);
> -               delete data;
> -               return;
> -       }
> +       else
> +               emit menuSelected(m);
>
> -       _menu = m;
> -       menuInfo();
> -
> -       emit showDebugChanged(true);
>         free(result);
>         delete data;
>  }
> @@ -1750,6 +1735,7 @@ void ConfigMainWindow::setMenuLink(struct menu *menu)
>                         item->setSelected(true);
>                         list->scrollToItem(item);
>                         list->setFocus();
> +                       helpText->setInfo(menu);
>                 }
>         }
>  }
> --
> 2.26.2
>


--
Best Regards
Masahiro Yamada
