Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:35767 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755406Ab2HTHBi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 Aug 2012 03:01:38 -0400
From: Rusty Russell <rusty@ozlabs.org>
Subject: Re: [PATCH 27/74] lto: Mark EXPORT_SYMBOL symbols __visible
In-Reply-To: <1345345030-22211-28-git-send-email-andi@firstfloor.org>
References: <1345345030-22211-1-git-send-email-andi@firstfloor.org> <1345345030-22211-28-git-send-email-andi@firstfloor.org>
Date: Mon, 20 Aug 2012 16:24:04 +0930
Message-ID: <87txvy3vg3.fsf@rustcorp.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org
Cc: x86@kernel.org, mmarek@suse.cz, linux-kbuild@vger.kernel.org, JBeulich@suse.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>

On Sat, 18 Aug 2012 19:56:23 -0700, Andi Kleen <andi@firstfloor.org> wrote:
> @@ -78,11 +78,13 @@ extern struct module __this_module;
>  
>  #else /* !CONFIG_MODULES... */
>  
> -#define EXPORT_SYMBOL(sym)
> -#define EXPORT_SYMBOL_GPL(sym)
> -#define EXPORT_SYMBOL_GPL_FUTURE(sym)
> -#define EXPORT_UNUSED_SYMBOL(sym)
> -#define EXPORT_UNUSED_SYMBOL_GPL(sym)
> +/* Even without modules keep the __visible side effect */
> +
> +#define EXPORT_SYMBOL(sym) extern typeof(sym) sym __visible
> +#define EXPORT_SYMBOL_GPL(sym) extern typeof(sym) sym __visible
> +#define EXPORT_SYMBOL_GPL_FUTURE(sym) extern typeof(sym) sym __visible
> +#define EXPORT_UNUSED_SYMBOL(sym) extern typeof(sym) sym __visible
> +#define EXPORT_UNUSED_SYMBOL_GPL(sym) extern typeof(sym) sym __visible
>  
>  #endif /* CONFIG_MODULES */

Really, why?  Seems like a win to have them eliminated if unused.

Naively, I would think many cases of __visible should be #ifdef
CONFIG_MODULES.  What am I missing?

Thanks,
Rusty.
