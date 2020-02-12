Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:59506 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728530AbgBLJVb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Feb 2020 04:21:31 -0500
MIME-Version: 1.0
References: <20200210161852.842-1-masahiroy@kernel.org>
In-Reply-To: <20200210161852.842-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 12 Feb 2020 18:20:42 +0900
Message-ID: <CAK7LNATLCAnrtqR8vv=jWiDcODGchMekOGMbSNvEQtnb3JqTDQ@mail.gmail.com>
Subject: Re: [PATCH] scripts/kallsyms: fix memory corruption caused by write over-run
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: youling257 <youling257@gmail.com>, Pavel Machek <pavel@ucw.cz>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Feb 11, 2020 at 1:19 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> scripts/kallsyms crashes because memcpy() writes one more byte than
> allocated.
>
> Fixes: 8d60526999aa ("scripts/kallsyms: change table to store (strcut sym_entry *)")
> Reported-by: youling257 <youling257@gmail.com>
> Reported-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied.
I will send a pull request shortly
because many people are tripping over this bug.




>  scripts/kallsyms.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> index a566d8201b56..0133dfaaf352 100644
> --- a/scripts/kallsyms.c
> +++ b/scripts/kallsyms.c
> @@ -210,7 +210,7 @@ static struct sym_entry *read_symbol(FILE *in)
>
>         len = strlen(name) + 1;
>
> -       sym = malloc(sizeof(*sym) + len);
> +       sym = malloc(sizeof(*sym) + len + 1);
>         if (!sym) {
>                 fprintf(stderr, "kallsyms failure: "
>                         "unable to allocate required amount of memory\n");
> @@ -219,7 +219,7 @@ static struct sym_entry *read_symbol(FILE *in)
>         sym->addr = addr;
>         sym->len = len;
>         sym->sym[0] = type;
> -       memcpy(sym_name(sym), name, len);
> +       strcpy(sym_name(sym), name);
>         sym->percpu_absolute = 0;
>
>         return sym;
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
