Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:61891 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726710AbgF3D4A (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jun 2020 23:56:00 -0400
MIME-Version: 1.0
References: <cover.1593444492.git.mchehab+huawei@kernel.org> <781cc3dc06dfe179f19c8aca8068c14890bace52.1593444492.git.mchehab+huawei@kernel.org>
In-Reply-To: <781cc3dc06dfe179f19c8aca8068c14890bace52.1593444492.git.mchehab+huawei@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 30 Jun 2020 12:55:05 +0900
Message-ID: <CAK7LNASQg8g7ad6SvZBQaq69+fcXLofV5WzRiFc8B3m6Rdy2vg@mail.gmail.com>
Subject: Re: [PATCH 2/2] kconfig: qconf: don't show goback button on splitMode
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Jun 30, 2020 at 12:30 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> the goback button does nothing on splitMode. So, why display
> it?


Hmm, I still see the goback button
on all of the three modes...



> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  scripts/kconfig/qconf.cc | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index d0bcc0b717f0..f49fbac91995 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -437,9 +437,10 @@ void ConfigList::updateList(ConfigItem* item)
>         if (rootEntry != &rootmenu && (mode == singleMode ||
>             (mode == symbolMode && rootEntry->parent != &rootmenu))) {
>                 item = (ConfigItem *)topLevelItem(0);
> -               if (!item)
> +               if (!item && mode != symbolMode) {
>                         item = new ConfigItem(this, 0, true);
> -               last = item;
> +                       last = item;
> +               }
>         }
>         if ((mode == singleMode || (mode == symbolMode && !(rootEntry->flags & MENU_ROOT))) &&
>             rootEntry->sym && rootEntry->prompt) {
> --
> 2.26.2
>


-- 
Best Regards
Masahiro Yamada
