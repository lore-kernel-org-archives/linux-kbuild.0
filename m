Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.18]:49663 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751184AbaF3RCt (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 30 Jun 2014 13:02:49 -0400
Message-ID: <53B1982F.4030504@gmx.de>
Date: Mon, 30 Jun 2014 19:02:39 +0200
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] script/kconfig: remove a warning for menucofig
References: <1404098187-9638-1-git-send-email-zhen-hual@hp.com>
In-Reply-To: <1404098187-9638-1-git-send-email-zhen-hual@hp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Li, Zhen-Hua" <zhen-hual@hp.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 30.06.2014 05:16, Li, Zhen-Hua wrote:
> There is a warning when run "make menuconfig".
>
> scripts/kconfig/menu.c: In function ‘get_symbol_str’:
> scripts/kconfig/menu.c:591:18: warning: ‘jump’ may be used uninitialized in
> this function [-Wmaybe-uninitialized]
>       jump->offset = strlen(r->s);
>                    ^
> scripts/kconfig/menu.c:551:19: note: ‘jump’ was declared here
>    struct jump_key *jump;
>                     ^
>
> It is because the compiler think "jump" is not initialized, though in fact
> it is already initialized.
>
> Signed-off-by: Li, Zhen-Hua <zhen-hual@hp.com>
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
>
Hello Zhen-Hua,

the patch looks incomplete to me. A check
jump != NULL
should be added before accessing parts of structure jump_key.

Best regards

Heinrich Schuchardt
