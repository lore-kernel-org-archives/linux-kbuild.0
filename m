Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:17926 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbfAMDzD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 12 Jan 2019 22:55:03 -0500
MIME-Version: 1.0
References: <CAK7LNAS-r4gZOxdJCNaQwHtOYbxHbdupu57qncWkE+bhGfb_7g@mail.gmail.com>
 <20190111190538.6744-1-paul.burton@mips.com>
In-Reply-To: <20190111190538.6744-1-paul.burton@mips.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 13 Jan 2019 12:54:17 +0900
Message-ID: <CAK7LNATEs-+GcVohYPLW3sVMDfpLNtT3dbRYcO5FNqJTf9G5SA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Disable LD_DEAD_CODE_DATA_ELIMINATION with
 ftrace & GCC <= 4.7
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Burton <paul.burton@mips.com>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Burton <pburton@wavecomp.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Nicholas Piggin <npiggin@gmail.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>

On Sat, Jan 12, 2019 at 6:00 AM Paul Burton <paul.burton@mips.com> wrote:
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
> Cc: linux-kbuild@vger.kernel.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
> Changes in v2:
> - Invert the dependency as Masahiro suggested.


Applied to linux-kbuild/fixes.


Thanks!


-- 
Best Regards
Masahiro Yamada
