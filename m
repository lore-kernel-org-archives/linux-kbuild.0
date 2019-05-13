Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ed1-f65.google.com ([209.85.208.65]:33785 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbfEMEr0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 May 2019 00:47:26 -0400
Date: Sun, 12 May 2019 21:47:21 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] kbuild: terminate Kconfig when $(CC) or $(LD) is missing
Message-ID: <20190513044721.GA3664@archlinux-i9>
References: <20190509073555.15545-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190509073555.15545-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Joel Stanley <joel@jms.id.au>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, Nick Desaulniers <ndesaulniers@google.com>

On Thu, May 09, 2019 at 04:35:55PM +0900, Masahiro Yamada wrote:
> If the compiler specified by $(CC) is not present, the Kconfig stage
> sprinkles 'not found' messages, then succeeds.
> 
>   $ make CROSS_COMPILE=foo defconfig
>   /bin/sh: 1: foogcc: not found
>   /bin/sh: 1: foogcc: not found
>   *** Default configuration is based on 'x86_64_defconfig'
>   ./scripts/gcc-version.sh: 17: ./scripts/gcc-version.sh: foogcc: not found
>   ./scripts/gcc-version.sh: 18: ./scripts/gcc-version.sh: foogcc: not found
>   ./scripts/gcc-version.sh: 19: ./scripts/gcc-version.sh: foogcc: not found
>   ./scripts/gcc-version.sh: 17: ./scripts/gcc-version.sh: foogcc: not found
>   ./scripts/gcc-version.sh: 18: ./scripts/gcc-version.sh: foogcc: not found
>   ./scripts/gcc-version.sh: 19: ./scripts/gcc-version.sh: foogcc: not found
>   ./scripts/clang-version.sh: 11: ./scripts/clang-version.sh: foogcc: not found
>   ./scripts/gcc-plugin.sh: 11: ./scripts/gcc-plugin.sh: foogcc: not found
>   init/Kconfig:16:warning: 'GCC_VERSION': number is invalid
>   #
>   # configuration written to .config
>   #
> 
> Terminate parsing files immediately if $(CC) or $(LD) is not found.
> "make *config" will fail more nicely.
> 
>   $ make CROSS_COMPILE=foo defconfig
>   *** Default configuration is based on 'x86_64_defconfig'
>   scripts/Kconfig.include:34: compiler 'foogcc' not found
>   make[1]: *** [scripts/kconfig/Makefile;82: defconfig] Error 1
>   make: *** [Makefile;557: defconfig] Error 2
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  Makefile                | 2 +-
>  scripts/Kconfig.include | 8 ++++++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 28965187c528..bd7ae11947cb 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -537,7 +537,7 @@ endif
>  # Some architectures define CROSS_COMPILE in arch/$(SRCARCH)/Makefile.
>  # CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
>  # and from include/config/auto.conf.cmd to detect the compiler upgrade.
> -CC_VERSION_TEXT = $(shell $(CC) --version | head -n 1)
> +CC_VERSION_TEXT = $(shell $(CC) --version 2>/dev/null | head -n 1)
>  
>  ifeq ($(config-targets),1)
>  # ===========================================================================
> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> index 87ff1dcc6bd5..0b267fb27f07 100644
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -18,6 +18,10 @@ if-success = $(shell,{ $(1); } >/dev/null 2>&1 && echo "$(2)" || echo "$(3)")
>  # Return y if <command> exits with 0, n otherwise
>  success = $(if-success,$(1),y,n)
>  
> +# $(failure,<command>)
> +# Return n if <command> exits with 0, y otherwise
> +failure = $(if-success,$(1),n,y)
> +
>  # $(cc-option,<flag>)
>  # Return y if the compiler supports <flag>, n otherwise
>  cc-option = $(success,$(CC) -Werror $(1) -E -x c /dev/null -o /dev/null)
> @@ -26,5 +30,9 @@ cc-option = $(success,$(CC) -Werror $(1) -E -x c /dev/null -o /dev/null)
>  # Return y if the linker supports <flag>, n otherwise
>  ld-option = $(success,$(LD) -v $(1))
>  
> +# check if $(CC) and $(LD) exist
> +$(error-if,$(failure,command -v $(CC)),compiler '$(CC)' not found)
> +$(error-if,$(failure,command -v $(LD)),linker '$(LD)' not found)

As mentioned in the other thread, $(AS) should be checked as well since
it's possible that neither $(CC) nor $(LD) will involve $(CROSS_COMPILE),
like the combination of clang + ld.lld, whereas $(AS) will (currently)
always involve $(CROSS_COMPILE).

> +
>  # gcc version including patch level
>  gcc-version := $(shell,$(srctree)/scripts/gcc-version.sh $(CC))
> -- 
> 2.17.1
> 
