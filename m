Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f44.google.com ([209.85.213.44]:35591 "EHLO
        mail-vk0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755152AbdAAXGQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 1 Jan 2017 18:06:16 -0500
Received: by mail-vk0-f44.google.com with SMTP id y197so110933841vky.2
        for <linux-kbuild@vger.kernel.org>; Sun, 01 Jan 2017 15:06:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161210004638.23417-1-dtwlin@google.com>
References: <20161210004638.23417-1-dtwlin@google.com>
From: David Lin <dtwlin@google.com>
Date: Sun, 1 Jan 2017 15:05:45 -0800
Message-ID: <CAPzFB+Wwn+qMh8esnoJ+E4Zym1V7JQZoztz70bPH0HqZSNpGjg@mail.gmail.com>
Subject: Re: [PATCH] jump label: pass kbuild_cflags when checking for asm goto support
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, jbaron@akamai.com, rostedt@goodmis.org, will.deacon@arm.com
Cc: David Lin <dtwlin@google.com>

+Cc: Steven Rostedt <rostedt@goodmis.org>
+Cc: Will Deacon <will.deacon@arm.com>

On Fri, Dec 9, 2016 at 4:46 PM, David Lin <dtwlin@google.com> wrote:
> Some versions of ARM GCC compiler such as Android toolchain throws in a
> '-fpic' flag by default. This causes the gcc-goto check script to fail
> although some config would have '-fno-pic' flag in the KBUILD_CFLAGS.
>
> This patch passes the KBUILD_CFLAGS to the check script so that the
> script does not rely on the default config from different compilers.
>
> Signed-off-by: David Lin <dtwlin@google.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 694111b..f667daa 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -790,7 +790,7 @@ KBUILD_CFLAGS   += $(call cc-option,-Werror=incompatible-pointer-types)
>  KBUILD_ARFLAGS := $(call ar-option,D)
>
>  # check for 'asm goto'
> -ifeq ($(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh $(CC)), y)
> +ifeq ($(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh $(CC) $(KBUILD_CFLAGS)), y)
>         KBUILD_CFLAGS += -DCC_HAVE_ASM_GOTO
>         KBUILD_AFLAGS += -DCC_HAVE_ASM_GOTO
>  endif
> --
> 2.10.2
>
