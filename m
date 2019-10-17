Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:46580 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727859AbfJQABh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Oct 2019 20:01:37 -0400
MIME-Version: 1.0
References: <20191015064906.13833-1-efremov@linux.com>
In-Reply-To: <20191015064906.13833-1-efremov@linux.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 17 Oct 2019 09:00:52 +0900
Message-ID: <CAK7LNATn62wLjwEFSVESRNXJAVHkcJ2hFFPbR8xbVHjXwONrcw@mail.gmail.com>
Subject: Re: [PATCH] modpost: add NOFAIL to strdup call
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Denis Efremov <efremov@linux.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Oct 15, 2019 at 3:49 PM Denis Efremov <efremov@linux.com> wrote:
>
> Add NOFAIL check for the strdup call, since the function
> allocates memory and can return NULL. All strdup calls in
> modpost are checked with NOFAIL.
>
> Signed-off-by: Denis Efremov <efremov@linux.com>
> ---
>  scripts/mod/modpost.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 936d3ad23c83..8e8975065cbc 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -384,7 +384,7 @@ static struct symbol *sym_add_exported(const char *name, const char *namespace,
>                 }
>         }
>         free(s->namespace);
> -       s->namespace = namespace ? strdup(namespace) : NULL;
> +       s->namespace = namespace ? NOFAIL(strdup(namespace)) : NULL;

This is correct, but I will put it off
because otherwise if would cause a conflict against this patch:

https://lore.kernel.org/patchwork/patch/1138151/

That patch is adding NOFAIL().




>         s->preloaded = 0;
>         s->vmlinux   = is_vmlinux(mod->name);
>         s->kernel    = 0;
> --
> 2.21.0
>


-- 
Best Regards
Masahiro Yamada
