Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:54532 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751803Ab0LOGUX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Dec 2010 01:20:23 -0500
Received: by iwn9 with SMTP id 9so1664883iwn.19
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Dec 2010 22:20:23 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1291530566-23531-2-git-send-email-lacombar@gmail.com>
References: <1291530566-23531-1-git-send-email-lacombar@gmail.com>
	<1291530566-23531-2-git-send-email-lacombar@gmail.com>
Date: Wed, 15 Dec 2010 01:20:23 -0500
Message-ID: <AANLkTinOje2vEjb_NA7ULd+x7Wd_d9g5i4AQw11ne2dg@mail.gmail.com>
Subject: Re: [PATCH 2/5] kconfig: add more S_INT and S_HEX consistency checks
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>

Hi,

On Sun, Dec 5, 2010 at 1:29 AM, Arnaud Lacombe <lacombar@gmail.com> wrote:
> This patch add more number consistency checkg, trying to catch the following
> situation:
>
> config FOO0
>        hex
>        default 42
>
> config FOO1
>        string
>
> config BAR0
>        int
>        default FOO1
>
> config BAR1
>        hex
>        default FOO1
>
> config FOO2
>        hex
>        default 42h
>
> config FOO3
>        int
>        default "1bar"
>
> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> ---
>  scripts/kconfig/menu.c |   15 ++++++++++++---
>  1 files changed, 12 insertions(+), 3 deletions(-)
>
ping ?

 - Arnaud

> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index 7e83aef..8a8bc9b 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -183,7 +183,7 @@ void menu_add_option(int token, char *arg)
>        }
>  }
>
> -static int menu_range_valid_sym(struct symbol *sym, struct symbol *sym2)
> +static int menu_validate_number(struct symbol *sym, struct symbol *sym2)
>  {
>        return sym2->type == S_INT || sym2->type == S_HEX ||
>               (sym2->type == S_UNKNOWN && sym_string_valid(sym, sym2->name));
> @@ -201,6 +201,15 @@ static void sym_check_prop(struct symbol *sym)
>                                prop_warn(prop,
>                                    "default for config symbol '%s'"
>                                    " must be a single symbol", sym->name);
> +                       if (prop->expr->type != E_SYMBOL)
> +                               break;
> +                       sym2 = prop_get_symbol(prop);
> +                       if (sym->type == S_HEX || sym->type == S_INT) {
> +                               if (!menu_validate_number(sym, sym2))
> +                                       prop_warn(prop,
> +                                           "'%s': number is invalid",
> +                                           sym->name);
> +                       }
>                        break;
>                case P_SELECT:
>                        sym2 = prop_get_symbol(prop);
> @@ -220,8 +229,8 @@ static void sym_check_prop(struct symbol *sym)
>                        if (sym->type != S_INT && sym->type != S_HEX)
>                                prop_warn(prop, "range is only allowed "
>                                                "for int or hex symbols");
> -                       if (!menu_range_valid_sym(sym, prop->expr->left.sym) ||
> -                           !menu_range_valid_sym(sym, prop->expr->right.sym))
> +                       if (!menu_validate_number(sym, prop->expr->left.sym) ||
> +                           !menu_validate_number(sym, prop->expr->right.sym))
>                                prop_warn(prop, "range is invalid");
>                        break;
>                default:
> --
> 1.7.2.30.gc37d7.dirty
>
>
