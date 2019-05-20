Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:46044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726126AbfETJkX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 May 2019 05:40:23 -0400
Date: Mon, 20 May 2019 11:40:20 +0200
From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] kbuild: do not check name uniqueness of builtin modules
Message-ID: <20190520094020.GC15326@kroah.com>
References: <20190520025437.13825-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190520025437.13825-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@arndb.de>, Jessica Yu <jeyu@kernel.org>, Lucas De Marchi <lucas.de.marchi@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Michael Schmitz <schmitzmic@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Rusty Russell <rusty@rustcorp.com.au>, Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>, Lucas De Marchi <lucas.demarchi@intel.com>

On Mon, May 20, 2019 at 11:54:37AM +0900, Masahiro Yamada wrote:
> I just thought it was a good idea to scan builtin.modules in the name
> uniqueness checking, but Stephen reported a false positive.
> 
> ppc64_defconfig produces:
> 
>   warning: same basename if the following are built as modules:
>     arch/powerpc/platforms/powermac/nvram.ko
>     drivers/char/nvram.ko
> 
> ..., which is a false positive because the former is never built as
> a module as you see in arch/powerpc/platforms/powermac/Makefile:
> 
>   # CONFIG_NVRAM is an arch. independent tristate symbol, for pmac32 we really
>   # need this to be a bool.  Cheat here and pretend CONFIG_NVRAM=m is really
>   # CONFIG_NVRAM=y
>   obj-$(CONFIG_NVRAM:m=y)         += nvram.o
> 
> Since we cannot predict how tricky Makefiles are written in wild,
> builtin.modules may potentially contain false positives. I do not
> think it is a big deal as far as kmod is concerned, but false positive
> warnings in the kernel build makes people upset. It is better to not
> do it.
> 
> Even without checking builtin.modules, we have enough (and more solid)
> test coverage with allmodconfig.
> 
> While I touched this part, I replaced the sed code with neater one
> provided by Stephen.
> 
> Link: https://lkml.org/lkml/2019/5/19/120
> Link: https://lkml.org/lkml/2019/5/19/123
> Fixes: 3a48a91901c5 ("kbuild: check uniqueness of module names")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
