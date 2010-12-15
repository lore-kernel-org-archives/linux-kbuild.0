Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:52543 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752384Ab0LOG0U convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Dec 2010 01:26:20 -0500
Received: by iwn9 with SMTP id 9so1670011iwn.19
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Dec 2010 22:26:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1291530796-16379-1-git-send-email-lacombar@gmail.com>
References: <1291530796-16379-1-git-send-email-lacombar@gmail.com>
Date: Wed, 15 Dec 2010 01:26:19 -0500
Message-ID: <AANLkTi=+6UhwF7ZYq70nZNJ=OqyLS8yFq4My8VURQh8H@mail.gmail.com>
Subject: Re: [PATCH] kconfig: nuke second argument of conf_write_symbol()
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>

Hi,

On Sun, Dec 5, 2010 at 1:33 AM, Arnaud Lacombe <lacombar@gmail.com> wrote:
> Replacing S_TRISTATE by S_BOOLEAN is a no-op for conf_write_symbol().
>
> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> ---
>  scripts/kconfig/confdata.c |   17 +++++------------
>  1 files changed, 5 insertions(+), 12 deletions(-)
>
ping ?

 - Arnaud

> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index f349bdc..6fd43d7 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -440,12 +440,11 @@ static void conf_write_string(bool headerfile, const char *name,
>        fputs("\"\n", out);
>  }
>
> -static void conf_write_symbol(struct symbol *sym, enum symbol_type type,
> -                              FILE *out, bool write_no)
> +static void conf_write_symbol(struct symbol *sym, FILE *out, bool write_no)
>  {
>        const char *str;
>
> -       switch (type) {
> +       switch (sym->type) {
>        case S_BOOLEAN:
>        case S_TRISTATE:
>                switch (sym_get_tristate_value(sym)) {
> @@ -532,7 +531,7 @@ int conf_write_defconfig(const char *filename)
>                                                goto next_menu;
>                                }
>                        }
> -                       conf_write_symbol(sym, sym->type, out, true);
> +                       conf_write_symbol(sym, out, true);
>                }
>  next_menu:
>                if (menu->list != NULL) {
> @@ -633,14 +632,8 @@ int conf_write(const char *name)
>                        if (!(sym->flags & SYMBOL_WRITE))
>                                goto next;
>                        sym->flags &= ~SYMBOL_WRITE;
> -                       type = sym->type;
> -                       if (type == S_TRISTATE) {
> -                               sym_calc_value(modules_sym);
> -                               if (modules_sym->curr.tri == no)
> -                                       type = S_BOOLEAN;
> -                       }
>                        /* Write config symbol to file */
> -                       conf_write_symbol(sym, type, out, true);
> +                       conf_write_symbol(sym, out, true);
>                }
>
>  next:
> @@ -842,7 +835,7 @@ int conf_write_autoconf(void)
>                        continue;
>
>                /* write symbol to config file */
> -               conf_write_symbol(sym, sym->type, out, false);
> +               conf_write_symbol(sym, out, false);
>
>                /* update autoconf and tristate files */
>                switch (sym->type) {
> --
> 1.7.2.30.gc37d7.dirty
>
>
