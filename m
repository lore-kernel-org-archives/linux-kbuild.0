Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:35986 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbgACCLX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Jan 2020 21:11:23 -0500
MIME-Version: 1.0
References: <0ea3e528-4835-ff9c-f5a2-f711666ba75f@infradead.org> <20200102231402.1052657-1-nivedita@alum.mit.edu>
In-Reply-To: <20200102231402.1052657-1-nivedita@alum.mit.edu>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 3 Jan 2020 11:10:28 +0900
Message-ID: <CAK7LNAQrD4wcjqFTendbBGA2TXkbmxccRbv31HBCXz+J82w47g@mail.gmail.com>
Subject: Re: [PATCH] kconfig: restore prompt dependencies in help text
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arvind Sankar <nivedita@alum.mit.edu>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Rob Landley <rob@landley.net>, Randy Dunlap <rdunlap@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Jan 3, 2020 at 8:14 AM Arvind Sankar <nivedita@alum.mit.edu> wrote:
>
> Commit bcdedcc1afd6 ("menuconfig: print more info for symbol without
> prompts") moved some code from get_prompt_str to get_symbol_str so that
> dependency information for symbols without prompts could be shown.
>
> This code would be better copied rather than moved, as the change had
> the side-effect of not showing any extra dependencies that the prompt
> might have over the symbol.
>
> Put back a copy of the dependency printing code in get_prompt_str.
>
> The following is an example for NAMESPACES:
>
> Before:
>         Symbol: NAMESPACES [=y]
>         Type  : bool
>         Prompt: Namespaces support
>           Location:
>         (2) -> General setup
>           Defined at init/Kconfig:1064
>           Depends on: MULTIUSER [=y]
>
> After:
>         Symbol: NAMESPACES [=y]
>         Type  : bool
>         Prompt: Namespaces support
>           Editable if: MULTIUSER [=y] && EXPERT [=y]
>           Location:
>         (2) -> General setup
>           Defined at init/Kconfig:1064
>           Depends on: MULTIUSER [=y]
>
> Fixes: bcdedcc1afd6 ("menuconfig: print more info for symbol without prompts")
> Signed-off-by: Arvind Sankar <nivedita@alum.mit.edu>
> ---


I had already applied the following patch;
https://patchwork.kernel.org/patch/11298143/

It it available in linux-next.




>  scripts/kconfig/menu.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index d9d16469859a..6fbbe41302dc 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -706,6 +706,12 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
>         struct jump_key *jump = NULL;
>
>         str_printf(r, "Prompt: %s\n", prop->text);
> +       if (!expr_is_yes(prop->visible.expr)) {
> +               str_append(r, "  Editable if: ");
> +               expr_gstr_print(prop->visible.expr, r);
> +               str_append(r, "\n");
> +       }
> +
>         menu = prop->menu->parent;
>         for (i = 0; menu != &rootmenu && i < 8; menu = menu->parent) {
>                 bool accessible = menu_is_visible(menu);
> --
> 2.24.1
>


-- 
Best Regards
Masahiro Yamada
