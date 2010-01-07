Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:36702 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752216Ab0AGLko (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Jan 2010 06:40:44 -0500
Message-ID: <4B45C83A.9000803@suse.cz>
Date: Thu, 07 Jan 2010 12:40:42 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kallsyms: skip kernel symbols when lookup in module
References: <1262846626-27109-1-git-send-email-crquan@gmail.com>
In-Reply-To: <1262846626-27109-1-git-send-email-crquan@gmail.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Cheng Renquan <crquan@gmail.com>
Cc: linux-kbuild@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Rusty Russell <rusty@rustcorp.com.au>

On 7.1.2010 07:43, Cheng Renquan wrote:
> kernel symbols lookup is expensive, when we know it's a lookup in module,
> we can skip the heavy kernel symbols.
> 
> Signed-off-by: Cheng Renquan <crquan@gmail.com>
> ---
>  kernel/kallsyms.c |   12 ++++++++----
>  1 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
> index 8e5288a..bb9fdc5 100644
> --- a/kernel/kallsyms.c
> +++ b/kernel/kallsyms.c
> @@ -173,12 +173,16 @@ unsigned long kallsyms_lookup_name(const char *name)
>  	unsigned long i;
>  	unsigned int off;
>  
> -	for (i = 0, off = 0; i < kallsyms_num_syms; i++) {
> -		off = kallsyms_expand_symbol(off, namebuf);
> +	/* if a colon ':' found, skip the heavy kernel symbols */
> +	if (strchr(name, ':') == NULL) {
> +		for (i = 0, off = 0; i < kallsyms_num_syms; i++) {
> +			off = kallsyms_expand_symbol(off, namebuf);
>  
> -		if (strcmp(namebuf, name) == 0)
> -			return kallsyms_addresses[i];
> +			if (strcmp(namebuf, name) == 0)
> +				return kallsyms_addresses[i];
> +		}
>  	}
> +
>  	return module_kallsyms_lookup_name(name);
>  }
>  EXPORT_SYMBOL_GPL(kallsyms_lookup_name);

It think Rusty is the right person to handle this (CC added). But if you
want my opinion: The patch looks ok.

Acked-by: Michal Marek <mmarek@suse.cz>

Michal
