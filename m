Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f176.google.com ([74.125.82.176]:40293 "EHLO
	mail-we0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752549Ab3ESPOW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 19 May 2013 11:14:22 -0400
Received: by mail-we0-f176.google.com with SMTP id p58so1357633wes.21
        for <linux-kbuild@vger.kernel.org>; Sun, 19 May 2013 08:14:20 -0700 (PDT)
Date: Sun, 19 May 2013 17:14:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH v2] mconf/nconf: mark empty menus/menuconfigs different
 from non-empty ones
Message-ID: <20130519151417.GB3339@free.fr>
References: <1368786492-23751-2-git-send-email-dirk@gouders.net>
 <1368794526-7875-1-git-send-email-dirk@gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1368794526-7875-1-git-send-email-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: linux-kbuild@vger.kernel.org

Dirk, All,

On 2013-05-17 14:42 +0200, Dirk Gouders spake thusly:
> Submenus are sometimes empty and it would be nice if there is
> something that notifies us that we should not expect any content
> _before_ we enter a submenu.
> 
> A new function menu_is_empty() was introduced and empty menus and
> menuconfigs are now marked by "----" as opposed to non-empty
> ones that are marked by "--->".
> 
> This scheme was suggested by "Yann E. MORIN" <yann.morin.1998@free.fr>.
> 
> Signed-off-by: Dirk Gouders <dirk@gouders.net>
> ---
[--SNIP--]
> diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
> index ccb71ae..80b289c 100644
> --- a/scripts/kconfig/mconf.c
> +++ b/scripts/kconfig/mconf.c
[--SNIP--]
> @@ -497,9 +497,14 @@ static void build_conf(struct menu *menu)
>  					item_make("%s%*c%s",
>  						  menu->data ? "-->" : "++>",
>  						  indent + 1, ' ', prompt);
> -				} else
> -					item_make("   %*c%s  --->", indent + 1, ' ', prompt);
> -
> +				} else {
> +					if (menu_is_empty(menu))
> +						item_make("   %*c%s  ----",
> +							  indent + 1, ' ', prompt);
> +					else
> +						item_make("   %*c%s  --->",
> +							  indent + 1, ' ', prompt);
> +				}

What about:
        item_make("   %*c%s  %s",
                  indent + 1, ' ', prompt,
                  menu_is_empty(menu) ? "----" : "--->" );

[--SNIP--]
> diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
> index dbf31ed..8b31180 100644
> --- a/scripts/kconfig/nconf.c
> +++ b/scripts/kconfig/nconf.c
[--SNIP--]
> @@ -757,11 +757,18 @@ static void build_conf(struct menu *menu)
>  						"%s%*c%s",
>  						menu->data ? "-->" : "++>",
>  						indent + 1, ' ', prompt);
> -				} else
> -					item_make(menu, 'm',
> -						"   %*c%s  --->",
> -						indent + 1,
> -						' ', prompt);
> +				} else {
> +					if (menu_is_empty(menu))
> +						item_make(menu, 'm',
> +							  "   %*c%s  ----",
> +							  indent + 1,
> +							  ' ', prompt);
> +					else
> +						item_make(menu, 'm',
> +							  "   %*c%s  --->",
> +							  indent + 1,
> +							  ' ', prompt);
> +				}

Ditto.

Otherwise, looks good to me.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
