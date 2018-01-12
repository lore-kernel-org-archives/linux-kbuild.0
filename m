Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:36051 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933869AbeALOmb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Jan 2018 09:42:31 -0500
MIME-Version: 1.0
In-Reply-To: <1515567374-12722-5-git-send-email-yamada.masahiro@socionext.com>
References: <1515567374-12722-1-git-send-email-yamada.masahiro@socionext.com> <1515567374-12722-5-git-send-email-yamada.masahiro@socionext.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Fri, 12 Jan 2018 15:42:30 +0100
Message-ID: <CAFkk2KTauw-9m-qjhmwgM-m58VO5S0GD0Lc-o0EeSK9GLcA78Q@mail.gmail.com>
Subject: Re: [PATCH 5/6] kconfig: remove redundant input_mode test for
 check_conf() loop
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Marc Herbert <marc.herbert@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Jan 10, 2018 at 7:56 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> check_conf() never increments conf_cnt for listnewconfig, so conf_cnt
> is always zero.
>
> In other words, conf_cnt is not zero, "input_mode != listnewconfig"
> is met.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  scripts/kconfig/conf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index 693cd5f..1d2ed3e 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -669,7 +669,7 @@ int main(int ac, char **av)
>                 do {
>                         conf_cnt = 0;
>                         check_conf(&rootmenu);
> -               } while (conf_cnt && input_mode != listnewconfig);
> +               } while (conf_cnt);
>                 break;
>         case alldefconfig:
>         case defconfig:
> --
> 2.7.4
>

Acked-by: Ulf Magnusson <ulfalizer@gmail.com>

Cheers,
Ulf
