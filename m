Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:37708 "EHLO
	mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750869AbcF0QFL (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 27 Jun 2016 12:05:11 -0400
Received: by mail-wm0-f46.google.com with SMTP id a66so122206326wme.0
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Jun 2016 09:05:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160626173451.c8406cd0c7a87cc3f94d9753@gmail.com>
References: <20160626173451.c8406cd0c7a87cc3f94d9753@gmail.com>
From: Kees Cook <keescook@chromium.org>
Date: Mon, 27 Jun 2016 09:05:08 -0700
Message-ID: <CAGXu5jJw-HcYRo8muSQ7Av9ZGuO3jTgV2x_xDcqmK-i=2nu1aw@mail.gmail.com>
Subject: Re: [PATCH] powerpc/kernel: Disable the latent entropy plugin unconditionally
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Emese Revfy <re.emese@gmail.com>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, "kernel-hardening@lists.openwall.com" <kernel-hardening@lists.openwall.com>, PaX Team <pageexec@freemail.hu>

On Sun, Jun 26, 2016 at 8:34 AM, Emese Revfy <re.emese@gmail.com> wrote:
>
> Reported-by: PaX Team <pageexec@freemail.hu>
> Signed-off-by: Emese Revfy <re.emese@gmail.com>

Thanks! Can you include a body in the commit message? For this, something like:

Disable the gcc-plugin unconditionlly here because ... *reason it is required*

etc

-Kees

> ---
>  arch/powerpc/kernel/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index 01935b8..e9ef44f 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -14,11 +14,12 @@ CFLAGS_prom_init.o      += -fPIC
>  CFLAGS_btext.o         += -fPIC
>  endif
>
> -ifdef CONFIG_FUNCTION_TRACER
>  CFLAGS_cputable.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)
>  CFLAGS_init.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)
>  CFLAGS_btext.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)
>  CFLAGS_prom.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)
> +
> +ifdef CONFIG_FUNCTION_TRACER
>  # Do not trace early boot code
>  CFLAGS_REMOVE_cputable.o = -mno-sched-epilog $(CC_FLAGS_FTRACE)
>  CFLAGS_REMOVE_prom_init.o = -mno-sched-epilog $(CC_FLAGS_FTRACE)
> --
> 2.8.1



-- 
Kees Cook
Chrome OS & Brillo Security
