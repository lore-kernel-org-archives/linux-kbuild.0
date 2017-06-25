Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:29300 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750709AbdFYEFg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 25 Jun 2017 00:05:36 -0400
MIME-Version: 1.0
In-Reply-To: <20170621232805.149448-4-mka@chromium.org>
References: <20170621232805.149448-1-mka@chromium.org> <20170621232805.149448-4-mka@chromium.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 25 Jun 2017 13:05:30 +0900
Message-ID: <CAK7LNAQ9HMZxPsa_KM1_hCSNNxHkJELssBHtKic7GtwauWtdgw@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] x86/build: Specify stack alignment for clang
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, "H . J . Lu" <hjl.tools@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Michal Marek <mmarek@suse.com>, X86 ML <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <Bernhard.Rosenkranzer@linaro.org>, Peter Foley <pefoley2@pefoley.com>, Behan Webster <behanw@converseincode.com>, Douglas Anderson <dianders@chromium.org>

2017-06-22 8:28 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
> For gcc stack alignment is configured with -mpreferred-stack-boundary=N,
> clang has the option -mstack-alignment=N for that purpose. Use the same
> alignment as with gcc.
>
> If the alignment is not specified clang assumes an alignment of
> 16 bytes, as required by the standard ABI. However as mentioned in
> d9b0cde91c60 ("x86-64, gcc: Use -mpreferred-stack-boundary=3 if
> supported") the standard kernel entry on x86-64 leaves the stack
> on an 8-byte boundary, as a consequence clang will keep the stack
> misaligned.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> Changes in v5:
> - Use cc-option to probe for a compiler option instead of selecting
>   it based on the compiler name.
>
>  arch/x86/Makefile | 26 +++++++++++++++++++++-----
>  1 file changed, 21 insertions(+), 5 deletions(-)
>
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index b2dae639f778..b32b32b422c2 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -11,6 +11,14 @@ else
>          KBUILD_DEFCONFIG := $(ARCH)_defconfig
>  endif
>
> +# For gcc stack alignment is specified with -mpreferred-stack-boundary,
> +# clang has the option -mstack-alignment for that purpose.
> +ifneq ($(call cc-option, -mpreferred-stack-boundary=4,),)
> +        cc_stack_align_opt := -mpreferred-stack-boundary
> +else ifneq ($(call cc-option, -mstack-alignment=4,),)
> +        cc_stack_align_opt := -mstack-alignment
> +endif
> +

The commas after "=4" are redundant.

I removed them when I applied this patch.





-- 
Best Regards
Masahiro Yamada
