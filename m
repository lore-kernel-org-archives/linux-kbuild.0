Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:64751 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752019Ab0ILIGS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 12 Sep 2010 04:06:18 -0400
MIME-Version: 1.0
In-Reply-To: <1284107570-17124-1-git-send-email-bebarino@gmail.com>
References: <1284107570-17124-1-git-send-email-bebarino@gmail.com>
Date: Sun, 12 Sep 2010 11:06:16 +0300
Message-ID: <AANLkTimy0Ygv6rtL7MA+Lf5_AX5F-VFiDeJZ7GMLbLia@mail.gmail.com>
Subject: Re: [PATCH] nconfig: Fix help for choice menus
From: Nir Tzachar <nir.tzachar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, bebarino@gmail.com

On Fri, Sep 10, 2010 at 11:32 AM, Stephen Boyd <bebarino@gmail.com> wrote:
> When getting the help for a choice menu with a help section (for example
> the "Choose SLAB allocator" menu) nconfig pops up a window with nothing
> inside it. This is due to show_help() passing an empty string to
> show_scroll_win()'s 3rd argument. The option really does have help
> though, but it isn't a config symbol, so just add the help text for
> the option, and don't try to add anything else like the config option
> name.


Acked-by: Nir Tzachar <nir.tzachar@gmail.com>

> Signed-off-by: Stephen Boyd <bebarino@gmail.com>
> Cc: Nir Tzachar <nir.tzachar@gmail.com>
> ---
>  scripts/kconfig/nconf.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
> index 2ba71bc..19d3401 100644
> --- a/scripts/kconfig/nconf.c
> +++ b/scripts/kconfig/nconf.c
> @@ -1252,6 +1252,8 @@ static void show_help(struct menu *menu)
>                        str_append(&help, _(menu_get_help(menu)));
>                        str_append(&help, "\n");
>                        get_symbol_str(&help, menu->sym);
> +               } else {
> +                       str_append(&help, _(menu_get_help(menu)));
>                }
>        } else {
>                str_append(&help, nohelp_text);
> --
> 1.7.2.3.313.gcd15
>
>
