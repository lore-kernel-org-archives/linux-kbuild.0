Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:38236 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727311AbfEMCcC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 12 May 2019 22:32:02 -0400
MIME-Version: 1.0
References: <1557507408-7992-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1557507408-7992-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 13 May 2019 11:31:06 +0900
Message-ID: <CAK7LNARFntzRDbqK=-hnbW7LkCtqgFN7804d=PsRxkFS4tjdyA@mail.gmail.com>
Subject: Re: [PATCH] kconfig: remove useless pointer check in conf_write_dep()
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sat, May 11, 2019 at 1:56 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> conf_write_dep() has just one caller:
>
>     conf_write_dep("include/config/auto.conf.cmd");
>
> "name" always points to a valid string.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild.


>  scripts/kconfig/confdata.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index 399973e..431b805 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -961,8 +961,6 @@ static int conf_write_dep(const char *name)
>         struct file *file;
>         FILE *out;
>
> -       if (!name)
> -               name = ".kconfig.d";
>         out = fopen("..config.tmp", "w");
>         if (!out)
>                 return 1;
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
