Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f195.google.com ([209.85.217.195]:35746 "EHLO
        mail-ua0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751230AbdJHWZM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 8 Oct 2017 18:25:12 -0400
MIME-Version: 1.0
In-Reply-To: <1507482683-22651-7-git-send-email-ulfalizer@gmail.com>
References: <1507482683-22651-1-git-send-email-ulfalizer@gmail.com> <1507482683-22651-7-git-send-email-ulfalizer@gmail.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Mon, 9 Oct 2017 00:25:10 +0200
Message-ID: <CAFkk2KTW2aBQVrSEtH-O_p6DeTZ38=N6BMf0Y1s2w1A0OGi_qw@mail.gmail.com>
Subject: Re: [PATCH 6/6] kconfig: Regenerate parser
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org
Cc: sam@ravnborg.org, zippel@linux-m68k.org, Nicolas Pitre <nicolas.pitre@linaro.org>, michal.lkml@markovi.net, dirk@gouders.net, Masahiro Yamada <yamada.masahiro@socionext.com>, Arnaud Lacombe <lacombar@gmail.com>, walch.martin@web.de, Jan Beulich <JBeulich@suse.com>, linux-kernel@vger.kernel.org, Ulf Magnusson <ulfalizer@gmail.com>

On Sun, Oct 8, 2017 at 7:11 PM, Ulf Magnusson <ulfalizer@gmail.com> wrote:
> After the parsing memory leak fixes.
>
> Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
> ---
>  scripts/kconfig/zconf.tab.c_shipped | 562 +++++++++++++++++++-----------------
>  1 file changed, 294 insertions(+), 268 deletions(-)
>
> diff --git a/scripts/kconfig/zconf.tab.c_shipped b/scripts/kconfig/zconf.tab.c_shipped
> index a22b285..d513857 100644
> --- a/scripts/kconfig/zconf.tab.c_shipped
> +++ b/scripts/kconfig/zconf.tab.c_shipped
...
> --
> 2.7.4
>

...though the parser should really be regenerated manually to be sure it matches
zconf.y:

        $ make REGENERATE_PARSERS=1 conf

Cheers,
Ulf
