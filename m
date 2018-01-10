Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:57466 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754256AbeAJQNN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Jan 2018 11:13:13 -0500
MIME-Version: 1.0
In-Reply-To: <1507482683-22651-6-git-send-email-ulfalizer@gmail.com>
References: <1507482683-22651-1-git-send-email-ulfalizer@gmail.com> <1507482683-22651-6-git-send-email-ulfalizer@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 11 Jan 2018 01:12:18 +0900
Message-ID: <CAK7LNAQnQesyV9Vgs-xiW=dFWhbSwPE0YdmtA-HPQ4HHFM579Q@mail.gmail.com>
Subject: Re: [PATCH 5/6] kconfig: Don't leak help strings during parsing
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, zippel@linux-m68k.org, Nicolas Pitre <nicolas.pitre@linaro.org>, Michal Marek <michal.lkml@markovi.net>, dirk@gouders.net, Arnaud Lacombe <lacombar@gmail.com>, walch.martin@web.de, Jan Beulich <JBeulich@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-10-09 2:11 GMT+09:00 Ulf Magnusson <ulfalizer@gmail.com>:
> This is just for completeness to get rid of the last memory leak
> currently generated during parsing for ARCH=x86. The symbol
> DVB_NETUP_UNIDVB in drivers/media/pci/netup_unidvb/Kconfig currently has
> two help strings, and we leak the first one.

Looks like it was fixed by
561b29e4ec8d0aac7e094f70d649ee4abccdda03



> Summary from Valgrind on 'menuconfig' (ARCH=x86) before the fix:
>
>         LEAK SUMMARY:
>            definitely lost: 344,440 bytes in 14,350 blocks
>            ...
>
> Summary after the fix:
>
>         LEAK SUMMARY:
>            definitely lost: 344,376 bytes in 14,349 blocks
>            ...
>
> Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
> ---
>  scripts/kconfig/zconf.y | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
> index 468ab03..3c9f436 100644
> --- a/scripts/kconfig/zconf.y
> +++ b/scripts/kconfig/zconf.y
> @@ -435,6 +435,9 @@ help_start: T_HELP T_EOL
>
>  help: help_start T_HELPTEXT
>  {
> +       if (current_entry->help)
> +               /* Weird menu node with two help strings */
> +               free(current_entry->help);
>         current_entry->help = $2;
>  };


I applied this, but maybe is it better to warning message?
         zconfprint("warning: ...")  or zconf_error()?


If you send v2, I will replace this.




-- 
Best Regards
Masahiro Yamada
