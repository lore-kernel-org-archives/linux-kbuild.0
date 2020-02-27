Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:39879 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730245AbgB0Qpe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 27 Feb 2020 11:45:34 -0500
MIME-Version: 1.0
References: <20200218100031.10018-1-masahiroy@kernel.org>
In-Reply-To: <20200218100031.10018-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 28 Feb 2020 01:44:41 +0900
Message-ID: <CAK7LNASvgJ2tBhM7s-cnpwuy1GZy0kZ96tLETBVuEZSCTCKmcA@mail.gmail.com>
Subject: Re: [PATCH] fixdep: remove redundant null character check
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Feb 18, 2020 at 7:00 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> If *q is '\0', the condition (isalnum(*q) || *q == '_') is false anyway.
>
> Ensuring non-zero *q is redundant.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---


Applied to linux-kbuild.

>  scripts/basic/fixdep.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
> index ad2041817985..877ca2c88246 100644
> --- a/scripts/basic/fixdep.c
> +++ b/scripts/basic/fixdep.c
> @@ -246,7 +246,7 @@ static void parse_config_file(const char *p)
>                 }
>                 p += 7;
>                 q = p;
> -               while (*q && (isalnum(*q) || *q == '_'))
> +               while (isalnum(*q) || *q == '_')
>                         q++;
>                 if (str_ends_with(p, q - p, "_MODULE"))
>                         r = q - 7;
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
