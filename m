Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:60922 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750952Ab0LDSLH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 4 Dec 2010 13:11:07 -0500
Received: by iwn6 with SMTP id 6so1344339iwn.19
        for <linux-kbuild@vger.kernel.org>; Sat, 04 Dec 2010 10:11:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1291482609.8025.57.camel@localhost>
References: <1290488397.6770.1404.camel@localhost>
	<20101203122347.GA12395@sepie.suse.cz>
	<1291482609.8025.57.camel@localhost>
Date: Sat, 4 Dec 2010 13:11:06 -0500
Message-ID: <AANLkTikjmWJ1+NFTHWGRBrZ2jKGs4r3O_tv+9yfCBEWC@mail.gmail.com>
Subject: Re: [PATCHv2] Kbuild: kconfig: Verbose version of --listnewconfig
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Michal Marek <mmarek@suse.cz>, Roman Zippel <zippel@linux-m68k.org>, linux-kbuild@vger.kernel.org, Debian kernel maintainers <debian-kernel@lists.debian.org>

Hi,

On Sat, Dec 4, 2010 at 12:10 PM, Ben Hutchings <ben@decadent.org.uk> wrote:
> If the KBUILD_VERBOSE environment variable is set to non-zero, show
> the default values of new symbols and not just their names.
>
> Based on work by Bastian Blank <waldi@debian.org> and
> maximilian attems <max@stro.at>.  Simplified by Michal Marek
> <mmarek@suse.cz>.
>
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> ---
> On Fri, 2010-12-03 at 13:23 +0100, Michal Marek wrote:
> [...]
>> this is almost a 1:1 copy of the conf_write_symbol() function, so what
>> about reusing it like this? Otherwise the patch looks OK.
> [...]
>
> Well spotted - I assume that function didn't exist when this code was
> first added in Debian, but it does seem to be exactly equivalent.  I've
> incorporated your change into this version.
>
> Ben.
>
>  scripts/kconfig/conf.c      |   45 +++++++++++++++++++++++++++++++++---------
>  scripts/kconfig/confdata.c  |    5 ++-
>  scripts/kconfig/expr.h      |    2 +
>  scripts/kconfig/lkc_proto.h |    1 +
>  4 files changed, 41 insertions(+), 12 deletions(-)
>
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index 5459a38..f4752b4 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -363,7 +363,6 @@ static void conf(struct menu *menu)
>                switch (prop->type) {
>                case P_MENU:
>                        if ((input_mode == silentoldconfig ||
> -                            input_mode == listnewconfig ||
>                             input_mode == oldnoconfig) &&
>                            rootEntry != menu) {
>                                check_conf(menu);
> @@ -423,11 +422,7 @@ static void check_conf(struct menu *menu)
>        if (sym && !sym_has_value(sym)) {
>                if (sym_is_changable(sym) ||
>                    (sym_is_choice(sym) && sym_get_tristate_value(sym) == yes)) {
> -                       if (input_mode == listnewconfig) {
> -                               if (sym->name && !sym_is_choice_value(sym)) {
> -                                       printf("%s%s\n", CONFIG_, sym->name);
> -                               }
> -                       } else if (input_mode != oldnoconfig) {
> +                       if (input_mode != oldnoconfig) {
>                                if (!conf_cnt++)
>                                        printf(_("*\n* Restart config...\n*\n"));
>                                rootEntry = menu_get_parent_menu(menu);
> @@ -440,6 +435,33 @@ static void check_conf(struct menu *menu)
>                check_conf(child);
>  }
>
> +static void report_conf(struct menu *menu, bool verbose)
> +{
> +       struct symbol *sym;
> +       struct menu *child;
> +
> +       if (!menu_is_visible(menu))
> +               return;
> +
> +       if (verbose && menu == &rootmenu) {
> +               printf("\n#\n"
> +                      "# Changes:\n"
> +                      "#\n");
> +       }
> +
I would not expect to see any header if there is no new symbol(s).
However, that might complicate the code too much. Btw, I find
"Changes" to be misleading, is that header necessary ?

> +       sym = menu->sym;
> +       if (sym && (sym->flags & SYMBOL_NEW) &&
> +           sym_is_changable(sym) && sym->name && !sym_is_choice_value(sym)) {
> +               if (verbose)
> +                       conf_write_symbol(sym, sym->type, stdout, true);
> +               else
> +                       printf("CONFIG_%s\n", sym->name);
Please don't hardcode the prefix string. This should be:

                       printf("%s%s\n", CONFIG_, sym->name);

 - Arnaud
