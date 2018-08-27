Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58326 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726823AbeH0W7T (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Aug 2018 18:59:19 -0400
Date: Mon, 27 Aug 2018 14:11:23 -0500
From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH] objtool: remove workaround for unreachable warnings from
 old GCC
Message-ID: <20180827191123.meeqzru5y2kwnd47@treble>
References: <1535341183-19994-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1535341183-19994-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Mon, Aug 27, 2018 at 12:39:43PM +0900, Masahiro Yamada wrote:
> Commit cafa0010cd51 ("Raise the minimum required gcc version to 4.6")
> bumped the minimum GCC version to 4.6 for all architectures.
> 
> This effectively reverts commit da541b20021c ("objtool: Skip
> unreachable warnings for GCC 4.4 and older"), which was a workaround
> for GCC 4.4 or older.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>

> ---
> 
>  scripts/Makefile.build | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 1c48572..5a2d1c9 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -246,8 +246,6 @@ objtool_args += --no-fp
>  endif
>  ifdef CONFIG_GCOV_KERNEL
>  objtool_args += --no-unreachable
> -else
> -objtool_args += $(call cc-ifversion, -lt, 0405, --no-unreachable)
>  endif
>  ifdef CONFIG_RETPOLINE
>  ifneq ($(RETPOLINE_CFLAGS),)
> -- 
> 2.7.4
> 

-- 
Josh
