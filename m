Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:36925 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933757AbeALOiY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Jan 2018 09:38:24 -0500
MIME-Version: 1.0
In-Reply-To: <1515567374-12722-4-git-send-email-yamada.masahiro@socionext.com>
References: <1515567374-12722-1-git-send-email-yamada.masahiro@socionext.com> <1515567374-12722-4-git-send-email-yamada.masahiro@socionext.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Fri, 12 Jan 2018 15:38:22 +0100
Message-ID: <CAFkk2KTnmx0c-R8M9YEHvpCF4GDDgVc=5i1iwB8VXsz5T6nLrw@mail.gmail.com>
Subject: Re: [PATCH 4/6] kconfig: remove unneeded input_mode test in conf()
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Marc Herbert <marc.herbert@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Jan 10, 2018 at 7:56 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> conf() is never called for listnewconfig / olddefconfig.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  scripts/kconfig/conf.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index 8364811..693cd5f 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -368,9 +368,7 @@ static void conf(struct menu *menu)
>
>                 switch (prop->type) {
>                 case P_MENU:
> -                       if ((input_mode == silentoldconfig ||
> -                            input_mode == listnewconfig ||
> -                            input_mode == olddefconfig) &&
> +                       if (input_mode == silentoldconfig &&
>                             rootEntry != menu) {
>                                 check_conf(menu);
>                                 return;
> --
> 2.7.4
>

LGTM

Acked-by: Ulf Magnusson <ulfalizer@gmail.com>

Cheers,
Ulf
