Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:33152 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752296AbdFMGiF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Jun 2017 02:38:05 -0400
Date: Tue, 13 Jun 2017 08:38:00 +0200
From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH 3/3] x86/build: Specify stack alignment for clang
Message-ID: <20170613063800.l24mai3lipzzypin@gmail.com>
References: <20170613005531.77656-1-mka@chromium.org>
 <20170613005531.77656-4-mka@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170613005531.77656-4-mka@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, "H . J . Lu" <hjl.tools@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Bernhard.Rosenkranzer@linaro.org, Peter Foley <pefoley2@pefoley.com>, Behan Webster <behanw@converseincode.com>, Douglas Anderson <dianders@chromium.org>


* Matthias Kaehlcke <mka@chromium.org> wrote:

> For gcc stack alignment is configured with -mpreferred-stack-boundary=N,
> clang has the option -mstack-alignment=N for that purpose. Use the same
> alignment as for gcc.
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
>  arch/x86/Makefile | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index 86b725d69423..7f6c33f4d428 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -11,6 +11,14 @@ else
>          KBUILD_DEFCONFIG := $(ARCH)_defconfig
>  endif
>  
> +# Handle different option names for specifying stack alignment with gcc and
> +# clang.
> +ifeq ($(cc-name),clang)
> +	stack_align_opt := -mstack-alignment
> +else
> +	stack_align_opt := -mpreferred-stack-boundary
> +endif

Nit: I'd name it cc_stack_align_opt or so, to make it clear this is a C compiler 
option.

> @@ -65,8 +73,8 @@ ifeq ($(CONFIG_X86_32),y)
>          # with nonstandard options
>          KBUILD_CFLAGS += -fno-pic
>  
> -        # prevent gcc from keeping the stack 16 byte aligned
> -        KBUILD_CFLAGS += $(call cc-option,-mpreferred-stack-boundary=2)
> +        # prevent the compiler from keeping the stack 16 byte aligned
> +        KBUILD_CFLAGS += $(call cc-option,$(stack_align_opt)=2)

So the comment appears inaccurate: the point isn't really to 'keep' the compiler 
from 16-byte alignment (there's nothing wrong with that, functionally), the point 
is to use a more optimal alignment, right?

>  
>          # Disable unit-at-a-time mode on pre-gcc-4.0 compilers, it makes gcc use
>          # a lot more stack due to the lack of sharing of stacklots:
> @@ -98,8 +106,8 @@ else
>          KBUILD_CFLAGS += $(call cc-option,-mno-80387)
>          KBUILD_CFLAGS += $(call cc-option,-mno-fp-ret-in-387)
>  
> -	# Use -mpreferred-stack-boundary=3 if supported.
> -	KBUILD_CFLAGS += $(call cc-option,-mpreferred-stack-boundary=3)
> +	# Align the stack to 8 bytes if supported.
> +	KBUILD_CFLAGS += $(call cc-option,$(stack_align_opt)=3)

Here too the reason should be outlined: performance, features or correctness?

Thanks,

	Ingo
