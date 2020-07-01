Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:27852 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731586AbgGAPWj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Jul 2020 11:22:39 -0400
MIME-Version: 1.0
References: <cover.1593498345.git.mchehab+huawei@kernel.org>
 <6f7162e40f127e76c7169315d33a14946a85719a.1593498345.git.mchehab+huawei@kernel.org>
 <20200630084835.4db1331f@coco.lan>
In-Reply-To: <20200630084835.4db1331f@coco.lan>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 2 Jul 2020 00:21:36 +0900
Message-ID: <CAK7LNARjZWwKeFXMbDy76jYu21oCckz8qxkMSu7y1xmL+a3C3g@mail.gmail.com>
Subject: Re: [PATCH v3.1 7/7] kconfig: qconf: navigate menus on hyperlinks
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Maxim Levitsky <mlevitsk@redhat.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Jun 30, 2020 at 3:48 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Instead of just changing the helper window to show a
> dependency, also navigate to it at the config and menu
> widgets.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>
>
> ---
>
> I ended re-sending the same version as on patch series 2.

Do you mean this one should substitute 7/7 in v3, right?

Applied to linux-kbuild.



> Please
> consider this patch instead.
>
> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index 6a327b69ff5f..fd721c6c4c94 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -1233,7 +1233,6 @@ void ConfigInfoView::clicked(const QUrl &url)
>         char *data = new char[count + 1];
>         struct symbol **result;
>         struct menu *m = NULL;
> -       char type;
>
>         if (count < 1) {
>                 qInfo() << "Clicked link is empty";
> @@ -1243,7 +1242,6 @@ void ConfigInfoView::clicked(const QUrl &url)
>
>         memcpy(data, str.constData(), count);
>         data[count] = '\0';
> -       type = data[0];
>
>         /* Seek for exact match */
>         data[0] = '^';
> @@ -1256,15 +1254,8 @@ void ConfigInfoView::clicked(const QUrl &url)
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
> @@ -1273,16 +1264,13 @@ void ConfigInfoView::clicked(const QUrl &url)
>         }
>
>         if (!m) {
> -               qInfo() << "Clicked menu is invalid:" << data;
> -               free(result);
> -               delete data;
> -               return;
> +               /* Symbol is not visible as a menu */
> +               symbolInfo();
> +               emit showDebugChanged(true);
> +       } else {
> +               emit menuSelected(m);
>         }
>
> -       _menu = m;
> -       menuInfo();
> -
> -       emit showDebugChanged(true);
>         free(result);
>         delete data;
>  }
> @@ -1731,6 +1719,7 @@ void ConfigMainWindow::setMenuLink(struct menu *menu)
>                         list->setSelected(item, true);
>                         list->scrollToItem(item);
>                         list->setFocus();
> +                       helpText->setInfo(menu);
>                 }
>         }
>  }



-- 
Best Regards
Masahiro Yamada
