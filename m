Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:17018 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727604AbeJ2B3G (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Oct 2018 21:29:06 -0400
MIME-Version: 1.0
References: <20181024040354.24879-1-leobras.c@gmail.com> <20181024040354.24879-5-leobras.c@gmail.com>
In-Reply-To: <20181024040354.24879-5-leobras.c@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 29 Oct 2018 01:42:57 +0900
Message-ID: <CAK7LNAQzgdFPpwHEtfDazLd2jAhNy8=f_4mvOQMWfOWCb07E1Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] modpost: Changes parameter name to avoid shadowing.
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?Q?Leonardo_Br=C3=A1s?= <leobras.c@gmail.com>
Cc: lkcamp@lists.libreplanetbr.org, Borislav Petkov <bp@alien8.de>, David.Laight@aculab.com, Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@kernel.org>, helen@koikeco.de, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Oct 24, 2018 at 1:05 PM Leonardo Bras <leobras.c@gmail.com> wrote:
>
> Changes the parameter name to avoid shadowing a variable.
>
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>


For this one, I'd rather like to see code refactoring
than renaming the variable.

I will take a closer look.




> ---
>  scripts/mod/modpost.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 0d998c54564d..368fe42340df 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -2228,13 +2228,13 @@ static int add_versions(struct buffer *b, struct module *mod)
>  }
>
>  static void add_depends(struct buffer *b, struct module *mod,
> -                       struct module *modules)
> +                       struct module *module_list)
>  {
>         struct symbol *s;
>         struct module *m;
>         int first = 1;
>
> -       for (m = modules; m; m = m->next)
> +       for (m = module_list; m; m = m->next)
>                 m->seen = is_vmlinux(m->name);
>
>         buf_printf(b, "\n");
> --
> 2.19.1
>


-- 
Best Regards
Masahiro Yamada
