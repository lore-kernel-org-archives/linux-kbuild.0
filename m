Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:53714 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753038AbdFNBaZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Jun 2017 21:30:25 -0400
MIME-Version: 1.0
In-Reply-To: <20170613230854.112282-1-mka@chromium.org>
References: <20170613230854.112282-1-mka@chromium.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 14 Jun 2017 10:30:08 +0900
Message-ID: <CAK7LNAQn74G3K5czGCXWqmZgqGrZ0OyNMMN0wcEprKTBPwFfpg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] x86: stack alignment for boot code and clang
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, "H . J . Lu" <hjl.tools@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Michal Marek <mmarek@suse.com>, X86 ML <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <Bernhard.Rosenkranzer@linaro.org>, Peter Foley <pefoley2@pefoley.com>, Behan Webster <behanw@converseincode.com>, Douglas Anderson <dianders@chromium.org>

2017-06-14 8:08 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
> This series fixes an issue with the stack of the x86 boot code not
> being aligned as intended. Further it adapts the Makefile to account
> for the fact that clang uses a different option to configure the
> stack alignment than gcc (-mstack-alignment=N vs
> -mpreferred-stack-boundary=N)
>
> Collaterally the series adds the new kbuild macros cc-option-raw and
> hostcc-option, it also reworks cc-option to make use of cc-option-raw.
>
> Matthias Kaehlcke (4):
>   kbuild: Add cc-option-raw macro
>   kbuild: Add hostcc-option macro
>   x86/build: Use cc-option-raw for boot code compiler options
>   x86/build: Specify stack alignment for clang
>
>  Makefile               |  2 +-
>  arch/x86/Makefile      | 33 +++++++++++++++++++++++++--------
>  scripts/Kbuild.include | 13 +++++++++++--
>  3 files changed, 37 insertions(+), 11 deletions(-)


I gave Acked-by to 1/4 and 2/4
so that the whole series can go to x86 tree.

Thanks!

-- 
Best Regards
Masahiro Yamada
