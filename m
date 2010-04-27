Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:51763 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754682Ab0D0UiY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 27 Apr 2010 16:38:24 -0400
Date: Tue, 27 Apr 2010 13:36:28 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH 1/6] kconfig: print symbol type in help text
Message-Id: <20100427133628.785c69d9.randy.dunlap@oracle.com>
In-Reply-To: <4BD696C0.8050500@cn.fujitsu.com>
References: <4BD696C0.8050500@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Li Zefan <lizf@cn.fujitsu.com>
Cc: Michal Marek <mmarek@suse.cz>, Randy Dunlap <randy.dunlap@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org

On Tue, 27 Apr 2010 15:48:16 +0800 Li Zefan wrote:

> Randy suggested to print out the symbol type in gconfig.
> 
> Note this change does more than Randy's suggestion, that it also
> affects the display of help text in other config tools.
> 
>   │ Symbol: BLOCK [=y]
>   │ Type  : boolean
>   │ Prompt: Enable the block layer
>   │   Defined at block/Kconfig:4
>   │   Depends on: EMBEDDED [=n]
> 
> Signed-off-by: Li Zefan <lizf@cn.fujitsu.com>

Acked-by: Randy Dunlap <randy.dunlap@oracle.com>

Thanks.

> ---
>  scripts/kconfig/menu.c |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index e150176..b5d15fa 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -501,9 +501,11 @@ void get_symbol_str(struct gstr *r, struct symbol *sym)
>  	bool hit;
>  	struct property *prop;
>  
> -	if (sym && sym->name)
> +	if (sym && sym->name) {
>  		str_printf(r, "Symbol: %s [=%s]\n", sym->name,
>  			   sym_get_string_value(sym));
> +		str_printf(r, "Type  : %s\n", sym_type_name(sym->type));
> +	}
>  	for_all_prompts(sym, prop)
>  		get_prompt_str(r, prop);
>  	hit = false;
> -- 
> 1.6.3


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
