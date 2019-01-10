Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:41254 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbfAJCBs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 9 Jan 2019 21:01:48 -0500
MIME-Version: 1.0
References: <CAMuHMdUw9LMVb-8RSNVBEcDMVB9SFOdfF+kb20=gxJiWF1x8sQ@mail.gmail.com>
 <20190109231539.24613-1-paul.burton@mips.com>
In-Reply-To: <20190109231539.24613-1-paul.burton@mips.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 10 Jan 2019 11:00:49 +0900
Message-ID: <CAK7LNAReiEzF1nS8WR_yUmi-boJnfLWw5bjUvL2rDEAYnxwCzw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Disable LD_DEAD_CODE_DATA_ELIMINATION with ftrace
 & GCC <= 4.7
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Burton <paul.burton@mips.com>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Burton <pburton@wavecomp.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Nicholas Piggin <npiggin@gmail.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>

On Thu, Jan 10, 2019 at 8:16 AM Paul Burton <paul.burton@mips.com> wrote:
>
> When building using GCC 4.7 or older, -ffunction-sections & the -pg flag
> used by ftrace are incompatible. This causes warnings or build failures
> (where -Werror applies) such as the following:
>
>   arch/mips/generic/init.c:
>     error: -ffunction-sections disabled; it makes profiling impossible
>
> This used to be taken into account by the ordering of calls to cc-option
> from within the top-level Makefile, which was introduced by commit
> 90ad4052e85c ("kbuild: avoid conflict between -ffunction-sections and
> -pg on gcc-4.7"). Unfortunately this was broken when the
> CONFIG_LD_DEAD_CODE_DATA_ELIMINATION cc-option check was moved to
> Kconfig in commit e85d1d65cd8a ("kbuild: test dead code/data elimination
> support in Kconfig"), because the flags used by this check no longer
> include -pg.
>
> Fix this by not allowing CONFIG_LD_DEAD_CODE_DATA_ELIMINATION to be
> enabled at the same time as ftrace/CONFIG_FUNCTION_TRACER when building
> using GCC 4.7 or older.
>
> Signed-off-by: Paul Burton <paul.burton@mips.com>
> Fixes: e85d1d65cd8a ("kbuild: test dead code/data elimination support in Kconfig")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: stable@vger.kernel.org # v4.19+
> ---
>  init/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index d47cb77a220e..c787f782148d 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1124,6 +1124,7 @@ config LD_DEAD_CODE_DATA_ELIMINATION
>         bool "Dead code and data elimination (EXPERIMENTAL)"
>         depends on HAVE_LD_DEAD_CODE_DATA_ELIMINATION
>         depends on EXPERT
> +       depends on !FUNCTION_TRACER || !CC_IS_GCC || GCC_VERSION >= 40800
>         depends on $(cc-option,-ffunction-sections -fdata-sections)
>         depends on $(ld-option,--gc-sections)
>         help


Thanks for the fix.

I prefer this explicit 'depends on'.

Relying on the order of $(call cc-option, ...) in Makefile is fragile.

We raise the compiler minimum version from time to time.
So, this 'depends on' will eventually go away in the future.


BTW, which one do you think more readable?


depends on !FUNCTION_TRACER || !CC_IS_GCC || GCC_VERSION >= 40800

    OR

depends on !(FUNCTION_TRACER && CC_IS_GCC && GCC_VERSION < 40800)


-- 
Best Regards
Masahiro Yamada
