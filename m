Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from orange.myspectrum.nl ([149.210.134.247]:50621 "EHLO
	orange.myspectrum.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750806AbaGaUQK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 31 Jul 2014 16:16:10 -0400
Message-ID: <53DAA2A0.3050205@myspectrum.nl>
Date: Thu, 31 Jul 2014 22:10:08 +0200
From: Jeroen Hofstee <dasuboot@myspectrum.nl>
MIME-Version: 1.0
Subject: Re: [U-Boot] [PATCH] kconfig: Fix compiler warning in menu.c
References: <1406816503-31963-1-git-send-email-hdegoede@redhat.com>
In-Reply-To: <1406816503-31963-1-git-send-email-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>, u-boot@lists.denx.de
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Hello Hans,

On 31-07-14 16:21, Hans de Goede wrote:
> This fixes the following compiler warning:
>
> In file included from scripts/kconfig/zconf.tab.c:2537:0:
> scripts/kconfig/menu.c: In function ‘get_symbol_str’:
> scripts/kconfig/menu.c:590:18: warning: ‘jump’ may be used uninitialized in this function [-Wmaybe-uninitialized]
>       jump->offset = strlen(r->s);
>                    ^
> In file included from scripts/kconfig/zconf.tab.c:2537:0:
> scripts/kconfig/menu.c:551:19: note: ‘jump’ was declared here
>    struct jump_key *jump;
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   scripts/kconfig/menu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index a26cc5d..584e0fc 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -548,7 +548,7 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
>   {
>   	int i, j;
>   	struct menu *submenu[8], *menu, *location = NULL;
> -	struct jump_key *jump;
> +	struct jump_key *jump = NULL;
>   
>   	str_printf(r, _("Prompt: %s\n"), _(prop->text));
>   	menu = prop->menu->parent;

just curious, which compiler is this? Since it is a false positive.
(and it could know)

Regards,
Jeroen
