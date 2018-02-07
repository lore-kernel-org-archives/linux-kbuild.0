Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:44423 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750745AbeBGXek (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Feb 2018 18:34:40 -0500
MIME-Version: 1.0
In-Reply-To: <1517877294-4826-5-git-send-email-yamada.masahiro@socionext.com>
References: <1517877294-4826-1-git-send-email-yamada.masahiro@socionext.com> <1517877294-4826-5-git-send-email-yamada.masahiro@socionext.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Thu, 8 Feb 2018 00:34:38 +0100
Message-ID: <CAFkk2KSA6L_Ti_rFN9waJWZvntNT6qnvW1bzcbAbfnHpZM_wyw@mail.gmail.com>
Subject: Re: [PATCH 04/14] kconfig: print additional new line for choice for redirection
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, "Luis R . Rodriguez" <mcgrof@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Marc Herbert <marc.herbert@intel.com>

On Tue, Feb 6, 2018 at 1:34 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> If stdout is redirected to a file, prompts look differently due to
> missing new lines.
>
> Currently, conf_askvalue() takes care of this by putting additional
> new line, but conf_choice() does not.  Do likewise so that prompts
> after 'choice' look properly.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  scripts/kconfig/conf.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index d346642..6ce06c8 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -317,6 +317,8 @@ static int conf_choice(struct menu *menu)
>                 case oldaskconfig:
>                         fflush(stdout);
>                         xfgets(line, sizeof(line), stdin);
> +                       if (!tty_stdio)
> +                               printf("\n");
>                         strip(line);
>                         if (line[0] == '?') {
>                                 print_help(menu);
> --
> 2.7.4
>

Reviewed-by: Ulf Magnusson <ulfalizer@gmail.com>

Maybe this could be moved into the xfgets() function as well.

Cheers,
Ulf
