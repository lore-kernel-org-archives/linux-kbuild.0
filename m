Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:50968 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753323AbdFNB2D (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Jun 2017 21:28:03 -0400
MIME-Version: 1.0
In-Reply-To: <20170613230854.112282-2-mka@chromium.org>
References: <20170613230854.112282-1-mka@chromium.org> <20170613230854.112282-2-mka@chromium.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 14 Jun 2017 10:27:48 +0900
Message-ID: <CAK7LNAQ5zNgKLEfij_Ch1KyuFnK=6XudqDekJkXF=3uRZkEZuA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] kbuild: Add cc-option-raw macro
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, "H . J . Lu" <hjl.tools@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Michal Marek <mmarek@suse.com>, X86 ML <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <Bernhard.Rosenkranzer@linaro.org>, Peter Foley <pefoley2@pefoley.com>, Behan Webster <behanw@converseincode.com>, Douglas Anderson <dianders@chromium.org>

2017-06-14 8:08 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
> cc-option uses KBUILD_CFLAGS and KBUILD_CPPFLAGS when it determines
> whether an option is supported or not. This is fine for options used to
> build the kernel itself, however some components like the x86 boot code
> use a different set of flags.
>
> Add the new macro cc-option-raw which serves the same purpose as
> cc-option but has additional parameters. One parameter is the compiler
> with which the check should be performed, the other the compiler options
> to be used instead KBUILD_C*FLAGS. The compiler parameter allows other
> macros like hostcc-option to be implemented on top of cc-option-raw.
>
> Also rework cc-option to make use of cc-option-raw.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> Changes in v2:
> - Changed macro name from Add cc-option-no-kbuild to cc-option-raw
> - Added compiler as parameter to the macro
> - Reworked cc-option to make use of cc-option-raw
> - Updated commit message
>
>  scripts/Kbuild.include | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>

Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>
(if nothing better pops up)

-- 
Best Regards
Masahiro Yamada
