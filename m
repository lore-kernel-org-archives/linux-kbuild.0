Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:57694 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727311AbfEMC1W (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 12 May 2019 22:27:22 -0400
MIME-Version: 1.0
References: <20190509024631.14406-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190509024631.14406-1-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 13 May 2019 11:26:41 +0900
Message-ID: <CAK7LNAQf3_mTpMwQ-sfxR9xsifGbOk5m7avO3kbj1C4CimW5aA@mail.gmail.com>
Subject: Re: [PATCH] kconfig: remove trailing whitespaces
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, May 9, 2019 at 11:46 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> There are still some trailing whitespaces under scripts/kconfig/tests/,
> but they must be kept. Otherwise, "make testconfig" would break.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild.


>  scripts/kconfig/gconf.c                  | 2 +-
>  scripts/kconfig/lxdialog/BIG.FAT.WARNING | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
> index 5d4ecf309ee4..e36b342f1065 100644
> --- a/scripts/kconfig/gconf.c
> +++ b/scripts/kconfig/gconf.c
> @@ -638,7 +638,7 @@ on_set_option_mode3_activate(GtkMenuItem *menuitem, gpointer user_data)
>  void on_introduction1_activate(GtkMenuItem * menuitem, gpointer user_data)
>  {
>         GtkWidget *dialog;
> -       const gchar *intro_text =
> +       const gchar *intro_text =
>             "Welcome to gkc, the GTK+ graphical configuration tool\n"
>             "For each option, a blank box indicates the feature is disabled, a\n"
>             "check indicates it is enabled, and a dot indicates that it is to\n"
> diff --git a/scripts/kconfig/lxdialog/BIG.FAT.WARNING b/scripts/kconfig/lxdialog/BIG.FAT.WARNING
> index a8999d82bdb3..7cb5a7ec93d2 100644
> --- a/scripts/kconfig/lxdialog/BIG.FAT.WARNING
> +++ b/scripts/kconfig/lxdialog/BIG.FAT.WARNING
> @@ -1,4 +1,4 @@
>  This is NOT the official version of dialog.  This version has been
>  significantly modified from the original.  It is for use by the Linux
> -kernel configuration script.  Please do not bother Savio Lam with
> +kernel configuration script.  Please do not bother Savio Lam with
>  questions about this program.
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
