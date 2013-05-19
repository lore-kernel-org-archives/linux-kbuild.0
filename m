Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f169.google.com ([74.125.82.169]:33254 "EHLO
	mail-we0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752662Ab3ESPMc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 19 May 2013 11:12:32 -0400
Received: by mail-we0-f169.google.com with SMTP id x54so4635619wes.0
        for <linux-kbuild@vger.kernel.org>; Sun, 19 May 2013 08:12:31 -0700 (PDT)
Date: Sun, 19 May 2013 17:12:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH] mconf: handle keys in empty dialogs
Message-ID: <20130519151227.GA3339@free.fr>
References: <1368780523-19382-2-git-send-email-dirk@gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1368780523-19382-2-git-send-email-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: linux-kbuild@vger.kernel.org

Dirk, All,

On 2013-05-17 10:48 +0200, Dirk Gouders spake thusly:
> When entering an empty dialog, using the movement keys resulted in
> unexpected characters beeing displayed, other keys like "z" and "h" did
> not work as expected.
> 
> This patch handles the movement keys as well as other keys,
> especially "z", "h" and "/".

Yes, thank you!

> Signed-off-by: Dirk Gouders <dirk@gouders.net>
> ---
>  scripts/kconfig/lxdialog/menubox.c |  8 ++++----
>  scripts/kconfig/mconf.c            | 11 ++++++-----
>  2 files changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/scripts/kconfig/lxdialog/menubox.c b/scripts/kconfig/lxdialog/menubox.c
> index 48d382e..f5aff9c 100644
> --- a/scripts/kconfig/lxdialog/menubox.c
> +++ b/scripts/kconfig/lxdialog/menubox.c
> @@ -303,10 +303,10 @@ do_resize:
>  				}
>  		}
>  
> -		if (i < max_choice ||
> -		    key == KEY_UP || key == KEY_DOWN ||
> -		    key == '-' || key == '+' ||
> -		    key == KEY_PPAGE || key == KEY_NPAGE) {
> +		if ((i < max_choice ||
> +		     key == KEY_UP || key == KEY_DOWN ||
> +		     key == '-' || key == '+' ||
> +		     key == KEY_PPAGE || key == KEY_NPAGE) && item_count()) {

item_count() returns a number, not true/false, so you have to use it
thus:
    item_count() != 0

>  			/* Remove highligt of current item */
>  			print_item(scroll + choice, choice, FALSE);
>  
> diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
> index 387dc8d..ccb71ae 100644
> --- a/scripts/kconfig/mconf.c
> +++ b/scripts/kconfig/mconf.c
> @@ -670,11 +670,12 @@ static void conf(struct menu *menu, struct menu *active_menu)
>  				  active_menu, &s_scroll);
>  		if (res == 1 || res == KEY_ESC || res == -ERRDISPLAYTOOSMALL)
>  			break;
> -		if (!item_activate_selected())
> -			continue;
> -		if (!item_tag())
> -			continue;
> -
> +		if (item_count()) {

Ditto.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
