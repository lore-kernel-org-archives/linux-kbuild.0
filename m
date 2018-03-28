Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f169.google.com ([209.85.217.169]:33273 "EHLO
        mail-ua0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752106AbeC1LSg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Mar 2018 07:18:36 -0400
Received: by mail-ua0-f169.google.com with SMTP id f6so1284323ual.0
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Mar 2018 04:18:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1522128575-5326-12-git-send-email-yamada.masahiro@socionext.com>
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com> <1522128575-5326-12-git-send-email-yamada.masahiro@socionext.com>
From: Kees Cook <keescook@chromium.org>
Date: Wed, 28 Mar 2018 04:18:32 -0700
Message-ID: <CAGXu5j+F1GXNE9T3vOo+Sq+GfX2Cy5a8tFU--qVBJwaJkt=s6Q@mail.gmail.com>
Subject: Re: [PATCH v2 11/21] stack-protector: test compiler capability in
 Kconfig and drop AUTO mode
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Ulf Magnusson <ulfalizer@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>

On Mon, Mar 26, 2018 at 10:29 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Move the test for -fstack-protector(-strong) option to Kconfig.
>
> If the compiler does not support the option, the corresponding menu
> is automatically hidden.  If _STRONG is not supported, it will fall
> back to _REGULAR.  If _REGULAR is not supported, it will be disabled.
> This means, _AUTO is implicitly handled by the dependency solver of
> Kconfig, hence removed.
>
> I also turned the 'choice' into only two boolean symbols.  The use of
> 'choice' is not a good idea here, because all of all{yes,mod,no}config
> would choose the first visible value, while we want allnoconfig to
> disable as many features as possible.
>
> X86 has additional shell scripts in case the compiler supports the
> option, but generates broken code.  I added CC_HAS_SANE_STACKPROTECTOR
> to test this.  I had to add -m32 to gcc-x86_32-has-stack-protector.sh
> to make it work correctly.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

This looks really good. Notes below...

> ---
>
> Changes in v2:
>   - Describe $(cc-option ...) directly in depends on context
>
>  Makefile                                  | 93 ++-----------------------------
>  arch/Kconfig                              | 29 +++-------
>  arch/x86/Kconfig                          |  8 ++-
>  scripts/gcc-x86_32-has-stack-protector.sh |  7 +--
>  scripts/gcc-x86_64-has-stack-protector.sh |  5 --
>  5 files changed, 22 insertions(+), 120 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 5c395ed..5cadffa 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -675,55 +675,11 @@ ifneq ($(CONFIG_FRAME_WARN),0)
>  KBUILD_CFLAGS += $(call cc-option,-Wframe-larger-than=${CONFIG_FRAME_WARN})
>  endif
>
> -# This selects the stack protector compiler flag. Testing it is delayed
> -# until after .config has been reprocessed, in the prepare-compiler-check
> -# target.
> -ifdef CONFIG_CC_STACKPROTECTOR_AUTO
> -  stackp-flag := $(call cc-option,-fstack-protector-strong,$(call cc-option,-fstack-protector))
> -  stackp-name := AUTO
> -else
> -ifdef CONFIG_CC_STACKPROTECTOR_REGULAR
> -  stackp-flag := -fstack-protector
> -  stackp-name := REGULAR
> -else
> -ifdef CONFIG_CC_STACKPROTECTOR_STRONG
> -  stackp-flag := -fstack-protector-strong
> -  stackp-name := STRONG
> -else
> -  # If either there is no stack protector for this architecture or
> -  # CONFIG_CC_STACKPROTECTOR_NONE is selected, we're done, and $(stackp-name)
> -  # is empty, skipping all remaining stack protector tests.
> -  #
> -  # Force off for distro compilers that enable stack protector by default.
> -  KBUILD_CFLAGS += $(call cc-option, -fno-stack-protector)
> -endif
> -endif
> -endif
> -# Find arch-specific stack protector compiler sanity-checking script.
> -ifdef stackp-name
> -ifneq ($(stackp-flag),)
> -  stackp-path := $(srctree)/scripts/gcc-$(SRCARCH)_$(BITS)-has-stack-protector.sh
> -  stackp-check := $(wildcard $(stackp-path))
> -  # If the wildcard test matches a test script, run it to check functionality.
> -  ifdef stackp-check
> -    ifneq ($(shell $(CONFIG_SHELL) $(stackp-check) $(CC) $(KBUILD_CPPFLAGS) $(biarch)),y)
> -      stackp-broken := y
> -    endif
> -  endif
> -  ifndef stackp-broken
> -    # If the stack protector is functional, enable code that depends on it.
> -    KBUILD_CPPFLAGS += -DCONFIG_CC_STACKPROTECTOR
> -    # Either we've already detected the flag (for AUTO) or we'll fail the
> -    # build in the prepare-compiler-check rule (for specific flag).
> -    KBUILD_CFLAGS += $(stackp-flag)
> -  else
> -    # We have to make sure stack protector is unconditionally disabled if
> -    # the compiler is broken (in case we're going to continue the build in
> -    # AUTO mode).

Let's keep this comment (slightly rewritten) since the reason for
setting this flag isn't obvious.

> -    KBUILD_CFLAGS += $(call cc-option, -fno-stack-protector)
> -  endif
> -endif
> -endif
> +stackp-flags-y                                 := -fno-stack-protector

This is a (minor?) regression in my testing. Making this unconditional
may break for a compiler built without stack-protector. It should be
rare, but it's technically possible. Perhaps:

stackp-flags-y := ($call cc-option, -fno-stack-protector)

> +stackp-flags-$(CONFIG_CC_STACKPROTECTOR)       := -fstack-protector
> +stackp-flags-$(CONFIG_CC_STACKPROTECTOR_STRONG)        := -fstack-protector-strong
> +
> +KBUILD_CFLAGS += $(stackp-flags-y)
> [...]
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 8e0d665..b42378d 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -535,13 +535,13 @@ config HAVE_CC_STACKPROTECTOR
>         bool
>         help
>           An arch should select this symbol if:
> -         - its compiler supports the -fstack-protector option

Please leave this note: it's still valid. An arch must still have
compiler support for this to be sensible.

>           - it has implemented a stack canary (e.g. __stack_chk_guard)
> [...]

Otherwise, this tests well for me. Nicely done!

-Kees

-- 
Kees Cook
Pixel Security
