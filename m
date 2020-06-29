Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731758AbgF2TOU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jun 2020 15:14:20 -0400
From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] kbuild: introduce ccflags-remove-y and asflags-remove-y
In-Reply-To: <20200628015041.1000002-1-masahiroy@kernel.org>
References: <20200628015041.1000002-1-masahiroy@kernel.org>
Date: Mon, 29 Jun 2020 15:57:11 +1000
Message-ID: <87imfa8le0.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Ingo Molnar <mingo@redhat.com>, Michal Marek <michal.lkml@markovi.net>, Paul Mackerras <paulus@samba.org>, Rich Felker <dalias@libc.org>, Russell King <linux@armlinux.org.uk>, Steven Rostedt <rostedt@goodmis.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

Masahiro Yamada <masahiroy@kernel.org> writes:
> CFLAGS_REMOVE_<file>.o works per object, that is, there is no
> convenient way to filter out flags for every object in a directory.
>
> Add ccflags-remove-y and asflags-remove-y to make it easily.
>
> Use ccflags-remove-y to clean up some Makefiles.
>
> Suggested-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/arm/boot/compressed/Makefile | 6 +-----
>  arch/powerpc/xmon/Makefile        | 3 +--
>  arch/sh/boot/compressed/Makefile  | 5 +----
>  kernel/trace/Makefile             | 4 ++--
>  lib/Makefile                      | 5 +----
>  scripts/Makefile.lib              | 4 ++--
>  6 files changed, 8 insertions(+), 19 deletions(-)
>
> diff --git a/arch/powerpc/xmon/Makefile b/arch/powerpc/xmon/Makefile
> index 89c76ca35640..55cbcdd88ac0 100644
> --- a/arch/powerpc/xmon/Makefile
> +++ b/arch/powerpc/xmon/Makefile
> @@ -7,8 +7,7 @@ UBSAN_SANITIZE := n
>  KASAN_SANITIZE := n
>  
>  # Disable ftrace for the entire directory
> -ORIG_CFLAGS := $(KBUILD_CFLAGS)
> -KBUILD_CFLAGS = $(subst $(CC_FLAGS_FTRACE),,$(ORIG_CFLAGS))
> +ccflags-remove-y += $(CC_FLAGS_FTRACE)

This could be:

ccflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_FTRACE)

Similar to kernel/trace/Makefile below.

I don't mind though.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

> diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
> index 6575bb0a0434..7492844a8b1b 100644
> --- a/kernel/trace/Makefile
> +++ b/kernel/trace/Makefile
> @@ -2,9 +2,9 @@
>  
>  # Do not instrument the tracer itself:
>  
> +ccflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_FTRACE)
> +
>  ifdef CONFIG_FUNCTION_TRACER
> -ORIG_CFLAGS := $(KBUILD_CFLAGS)
> -KBUILD_CFLAGS = $(subst $(CC_FLAGS_FTRACE),,$(ORIG_CFLAGS))
>  
>  # Avoid recursion due to instrumentation.
>  KCSAN_SANITIZE := n
