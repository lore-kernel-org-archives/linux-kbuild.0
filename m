Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpb-ews02.kpnxchange.com ([213.75.39.5]:60146 "EHLO
	cpsmtpb-ews02.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751125AbaKDKfr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 4 Nov 2014 05:35:47 -0500
Message-ID: <1415097344.20372.143.camel@x220>
Subject: Re: [PATCH] kconfig: Fix warning
 =?UTF-8?Q?=22=E2=80=98jump=E2=80=99?= may be used uninitialized"
From: Paul Bolle <pebolle@tiscali.nl>
Date: Tue, 04 Nov 2014 11:35:44 +0100
In-Reply-To: <1415095202-19556-1-git-send-email-syntheticpp@gmx.net>
References: <1415095202-19556-1-git-send-email-syntheticpp@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Peter =?ISO-8859-1?Q?K=FCmmel?= <syntheticpp@gmx.net>
Cc: linux-kbuild@vger.kernel.org, yann.morin.1998@free.fr

On Tue, 2014-11-04 at 11:00 +0100, Peter Kümmel wrote:

If you add the warning here, people can git grep, or web search, for it.

> Signed-off-by: Peter Kümmel <syntheticpp@gmx.net>
> ---
>  scripts/kconfig/menu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index a26cc5d..bb08960 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -548,7 +548,7 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
>  {
>  	int i, j;
>  	struct menu *submenu[8], *menu, *location = NULL;
> -	struct jump_key *jump;
> +	struct jump_key *jump = NULL;

If this just silences a warning it would be nice to have something like
                                       /* silence GCC */;

here.

>  
>  	str_printf(r, _("Prompt: %s\n"), _(prop->text));
>  	menu = prop->menu->parent;
> @@ -586,7 +586,7 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
>  		str_printf(r, _("  Location:\n"));
>  		for (j = 4; --i >= 0; j += 2) {
>  			menu = submenu[i];
> -			if (head && location && menu == location)
> +			if (head && location && menu == location && jump)
>  				jump->offset = strlen(r->s);
>  			str_printf(r, "%*c-> %s", j, ' ',
>  				   _(menu_get_prompt(menu)));

Or can jump actually be used uninitialized? In that case it seems you
should change the commit summary and explain that in the commit
explanation.

But, either way, have a look at the short but heated discussion starting
in https://lkml.org/lkml/2014/10/12/34 first.


Paul Bolle

