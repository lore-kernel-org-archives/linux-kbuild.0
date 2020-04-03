Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44456 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727909AbgDCWpF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Apr 2020 18:45:05 -0400
Received: by mail-pl1-f193.google.com with SMTP id h11so3335581plr.11
        for <linux-kbuild@vger.kernel.org>; Fri, 03 Apr 2020 15:45:02 -0700 (PDT)
Date: Fri, 3 Apr 2020 15:45:00 -0700
From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] kbuild: do not pass $(KBUILD_CFLAGS) to
 scripts/mkcompile_h
Message-ID: <202004031544.FEFA2BF@keescook>
References: <20200403212459.13914-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200403212459.13914-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Thomas Gleixner <tglx@linutronix.de>

On Sat, Apr 04, 2020 at 06:24:59AM +0900, Masahiro Yamada wrote:
> scripts/mkcompile_h uses $(CC) only for getting the version string.
> 
> I suspected there was a specific reason why the additional flags were
> needed, and dug the commit history. This code dates back to at least
> 2002 [1], but I could not get any more clue.

I would be alarmed to find it changing the version string with flags. ;)

> Just get rid of it.
> 
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=29f3df7eba8ddf91a55183f9967f76fbcc3ab742
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
> 
>  init/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/init/Makefile b/init/Makefile
> index 30aa8ab11120..d45e967483b2 100644
> --- a/init/Makefile
> +++ b/init/Makefile
> @@ -35,4 +35,4 @@ include/generated/compile.h: FORCE
>  	@$($(quiet)chk_compile.h)
>  	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkcompile_h $@	\
>  	"$(UTS_MACHINE)" "$(CONFIG_SMP)" "$(CONFIG_PREEMPT)"	\
> -	"$(CONFIG_PREEMPT_RT)" "$(CC) $(KBUILD_CFLAGS)" "$(LD)"
> +	"$(CONFIG_PREEMPT_RT)" "$(CC)" "$(LD)"
> -- 
> 2.17.1
> 

-- 
Kees Cook
