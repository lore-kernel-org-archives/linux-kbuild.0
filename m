Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:59087 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbgF1Omm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jun 2020 10:42:42 -0400
MIME-Version: 1.0
References: <ff9d1c3369b96c1d14b1e898e3d5f64ad945b604.1593346883.git.mchehab+huawei@kernel.org>
In-Reply-To: <ff9d1c3369b96c1d14b1e898e3d5f64ad945b604.1593346883.git.mchehab+huawei@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 28 Jun 2020 23:41:46 +0900
Message-ID: <CAK7LNARnDe0ToxYj9mMpocxzmrUvp6yf14iDRxgG8nGuGcxFKw@mail.gmail.com>
Subject: Re: [PATCH] kconfig: qconf: make debug links work again
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Maxim Levitsky <mlevitsk@redhat.com>

On Sun, Jun 28, 2020 at 9:21 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> The Qt5 conversion broke support for debug info links.
>
> Restore the behaviour added by changeset
> ab45d190fd4a ("kconfig: create links in info window").
>
> Reported-by: Maxim Levitsky <mlevitsk@redhat.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>


I tested this patch, but this caused
segmentation fault.


I enabled 'Show Debug Info',
and then clicked
dep: <symbol name>.

Then, xconfig crashed.

(without this patch, it did not cause
segfault at least)

Did you see this?











> ---
>  scripts/kconfig/qconf.cc | 35 ++++++++++++++++++++++++++++++++++-
>  scripts/kconfig/qconf.h  |  1 +
>  2 files changed, 35 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index 631e19659504..03cadf27a376 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -1012,7 +1012,7 @@ ConfigInfoView::ConfigInfoView(QWidget* parent, const char *name)
>         : Parent(parent), sym(0), _menu(0)
>  {
>         setObjectName(name);
> -
> +       setOpenLinks(false);
>
>         if (!objectName().isEmpty()) {
>                 configSettings->beginGroup(objectName());
> @@ -1224,6 +1224,36 @@ void ConfigInfoView::expr_print_help(void *data, struct symbol *sym, const char
>                 *text += str2;
>  }
>
> +void ConfigInfoView::clicked(const QUrl &url)
> +{
> +       QByteArray str = url.toEncoded();
> +       const std::size_t count = str.size();
> +       char *hex = new char[count];
> +       unsigned long p;
> +
> +       if (count < 1)
> +               return;
> +
> +       memcpy(hex, str.constData(), count);
> +       p = (int)strtol(hex + 1, NULL, 16);
> +
> +       if (!p)
> +               return;
> +
> +       if (hex[0] == 's') {
> +               struct symbol *s = (struct symbol *)p;
> +
> +               sym = s;
> +               symbolInfo();
> +       } else {
> +               struct menu *m = (struct menu *)p;
> +
> +               _menu = m;
> +               menuInfo();
> +       }
> +       emit showDebugChanged(true);
> +}
> +
>  QMenu* ConfigInfoView::createStandardContextMenu(const QPoint & pos)
>  {
>         QMenu* popup = Parent::createStandardContextMenu(pos);
> @@ -1497,6 +1527,9 @@ ConfigMainWindow::ConfigMainWindow(void)
>         helpMenu->addAction(showIntroAction);
>         helpMenu->addAction(showAboutAction);
>
> +       connect (helpText, SIGNAL (anchorClicked (const QUrl &)),
> +                helpText, SLOT (clicked (const QUrl &)) );
> +
>         connect(configList, SIGNAL(menuChanged(struct menu *)),
>                 helpText, SLOT(setInfo(struct menu *)));
>         connect(configList, SIGNAL(menuSelected(struct menu *)),
> diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
> index d913a02967ae..a193137f2314 100644
> --- a/scripts/kconfig/qconf.h
> +++ b/scripts/kconfig/qconf.h
> @@ -250,6 +250,7 @@ public slots:
>         void setInfo(struct menu *menu);
>         void saveSettings(void);
>         void setShowDebug(bool);
> +       void clicked (const QUrl &url);
>
>  signals:
>         void showDebugChanged(bool);
> --
> 2.26.2
>


-- 
Best Regards
Masahiro Yamada
