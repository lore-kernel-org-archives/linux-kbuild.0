Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:26895 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbfH1P5H (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Aug 2019 11:57:07 -0400
MIME-Version: 1.0
References: <20190827122023.15086-1-efremov@linux.com>
In-Reply-To: <20190827122023.15086-1-efremov@linux.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 29 Aug 2019 00:56:08 +0900
Message-ID: <CAK7LNASMc058_R4ewCQQ9KZJcZDckDw9EjJo-YyVne6hYGm-Zw@mail.gmail.com>
Subject: Re: [PATCH] modpost: add NOFAIL to strndup
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Denis Efremov <efremov@linux.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Aug 27, 2019 at 9:20 PM Denis Efremov <efremov@linux.com> wrote:
>
> Add NOFAIL check for the strndup call, because the function
> allocates memory and can return NULL. All calls to strdup in
> modpost are checked with NOFAIL.
>
> Signed-off-by: Denis Efremov <efremov@linux.com>
> ---

Applied to linux-kbuild. Thanks.


>  scripts/mod/modpost.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index f277e116e0eb..0255538528fe 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -795,9 +795,9 @@ static int match(const char *sym, const char * const pat[])
>
>                 /* "*foo*" */
>                 if (*p == '*' && *endp == '*') {
> -                       char *here, *bare = strndup(p + 1, strlen(p) - 2);
> +                       char *bare = NOFAIL(strndup(p + 1, strlen(p) - 2));
> +                       char *here = strstr(sym, bare);
>
> -                       here = strstr(sym, bare);
>                         free(bare);
>                         if (here != NULL)
>                                 return 1;
> --
> 2.21.0
>


-- 
Best Regards
Masahiro Yamada
