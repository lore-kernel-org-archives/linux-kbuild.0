Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:38172 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755049AbdCJRE1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 Mar 2017 12:04:27 -0500
Date: Fri, 10 Mar 2017 12:04:22 -0500
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] jump label: fix passing kbuild_cflags when checking for
 asm goto support
Message-ID: <20170310120422.14e19269@gandalf.local.home>
In-Reply-To: <20170310162411.GA18175@glebfm.cloud.tilaa.com>
References: <20170310162411.GA18175@glebfm.cloud.tilaa.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, David Lin <dtwlin@google.com>, "Anton V. Boyarshinov" <boyarsh@altlinux.org>, "Dmitry V. Levin" <ldv@altlinux.org>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Fri, 10 Mar 2017 19:24:18 +0300
Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org> wrote:

> The latest change of asm goto support check added passing of
> KBUILD_CFLAGS to compiler.  When these flags reference gcc plugins,
> there is a race condition between the build of these plugins and their
> use in this asm goto support check.
> 
> This change moves the check before all these references are added
> to KBUILD_CFLAGS.  This is correct because subsequent KBUILD_CFLAGS
> modifications are not relevant to this check.

What exactly breaks when the race happens?

-- Steve

> 
> Reported-by: Anton V. Boyarshinov <boyarsh@altlinux.org>
> Fixes: 35f860f9ba6a ("jump label: pass kbuild_cflags when checking for asm goto support")
> Cc: stable@vger.kernel.org	# v4.10
> Signed-off-by: Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>
> Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>
> ---
>  Makefile | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 165cf97..7e3aade 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -653,6 +653,12 @@ KBUILD_CFLAGS += $(call cc-ifversion, -lt, 0409, \
>  # Tell gcc to never replace conditional load with a non-conditional one
>  KBUILD_CFLAGS	+= $(call cc-option,--param=allow-store-data-races=0)
>  
> +# check for 'asm goto'
> +ifeq ($(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh $(CC) $(KBUILD_CFLAGS)), y)
> +	KBUILD_CFLAGS += -DCC_HAVE_ASM_GOTO
> +	KBUILD_AFLAGS += -DCC_HAVE_ASM_GOTO
> +endif
> +
>  include scripts/Makefile.gcc-plugins
>  
>  ifdef CONFIG_READABLE_ASM
> @@ -798,12 +804,6 @@ KBUILD_CFLAGS   += $(call cc-option,-Werror=incompatible-pointer-types)
>  # use the deterministic mode of AR if available
>  KBUILD_ARFLAGS := $(call ar-option,D)
>  
> -# check for 'asm goto'
> -ifeq ($(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh $(CC) $(KBUILD_CFLAGS)), y)
> -	KBUILD_CFLAGS += -DCC_HAVE_ASM_GOTO
> -	KBUILD_AFLAGS += -DCC_HAVE_ASM_GOTO
> -endif
> -
>  include scripts/Makefile.kasan
>  include scripts/Makefile.extrawarn
>  include scripts/Makefile.ubsan
> 

