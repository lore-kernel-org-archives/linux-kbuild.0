Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:52065 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755091Ab0AMNnm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 13 Jan 2010 08:43:42 -0500
Message-ID: <4B4DCE0C.9040101@suse.cz>
Date: Wed, 13 Jan 2010 14:43:40 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] ncofig v7 minor fix
References: <1263360755-32281-1-git-send-email-nir.tzachar@gmail.com>
In-Reply-To: <1263360755-32281-1-git-send-email-nir.tzachar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nir Tzachar <nir.tzachar@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Jan Engelhardt <jengelh@medozas.de>

On 13.1.2010 06:32, Nir Tzachar wrote:
> This patch fixes two problems reported by Jan Engelhardt:
> 1) Border is now properly placed, to always be visible
> 2) Long menu items are properly displayed
> 
> Signed-off-by: Nir Tzachar <nir.tzachar@gmail.com>

Thanks, applied, but please CC linux-kbuild@vger.kernel.org next time.

Michal
> 
> ---
>  scripts/kconfig/nconf.c |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
> index 8c56150..cab6bb0 100644
> --- a/scripts/kconfig/nconf.c
> +++ b/scripts/kconfig/nconf.c
> @@ -984,7 +984,7 @@ static void build_conf(struct menu *menu)
>  				break;
>  			default:
>  				tmp = 2 + strlen(sym_get_string_value(sym));
> -				item_make(menu, 's', "(%s)",
> +				item_make(menu, 's', "    (%s)",
>  						sym_get_string_value(sym));
>  				tmp = indent - tmp + 4;
>  				if (tmp < 0)
> @@ -1072,8 +1072,8 @@ static void show_menu(const char *prompt, const char *instructions,
>  
>  	/* position the menu at the middle of the screen */
>  	scale_menu(curses_menu, &maxy, &maxx);
> -	maxx = min(maxx, mwin_max_cols);
> -	maxy = mwin_max_lines-1;
> +	maxx = min(maxx, mwin_max_cols-2);
> +	maxy = mwin_max_lines-2;
>  	menu_window = derwin(main_window,
>  			maxy,
>  			maxx,

