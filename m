Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:20598 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751135AbeBUEks (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Feb 2018 23:40:48 -0500
MIME-Version: 1.0
In-Reply-To: <1518806331-7101-11-git-send-email-yamada.masahiro@socionext.com>
References: <1518806331-7101-1-git-send-email-yamada.masahiro@socionext.com> <1518806331-7101-11-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 21 Feb 2018 13:39:53 +0900
Message-ID: <CAK7LNAROZeja0sU-y83Wv+wTBwBnozN=Bcqi5KFzCrxbA5rnVA@mail.gmail.com>
Subject: Re: [PATCH 10/23] stack-protector: test compiler capability in
 Kconfig and drop AUTO mode
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Randy Dunlap <rdunlap@infradead.org>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>

2018-02-17 3:38 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Add CC_HAS_STACKPROTECTOR(_STRONG) to test if the compiler supports
> -fstack-protector(-strong) option.
>
> X86 has additional shell scripts in case the compiler supports the
> option, but generates broken code.  I added CC_HAS_SANE_STACKPROTECTOR
> to test this.  I had to add -m32 to gcc-x86_32-has-stack-protector.sh
> to make it work correctly.
>
> If the compiler does not support the option, the menu is automatically
> hidden.  If _STRONG is not supported, it will fall back to _REGULAR.
> This means, _AUTO is implicitly supported in the dependency solver of
> Kconfig, hence removed.
>
> I also turned the 'choice' into only two boolean symbols.  The use of
> 'choice' is not a good idea here, because all of all{yes,mod,no}config
> would choose the first visible value, while we want allnoconfig to
> disable as many features as possible.
>
> I did not add CC_HAS_STACKPROTECTOR_NONE in the hope that GCC versions
> we support will recognize -fno-stack-protector.
>
> If this turns out to be a problem, it will be possible to do this:
>
> stackp-flags-$(CONFIG_CC_HAS_STACKPROTECTOR_NONE) := -fno-stack-protector
> stackp-flags-$(CONFIG_CC_STACKPROTECTOR)          := -fstack-protector
> stackp-flags-$(CONFIG_CC_STACKPROTECTOR_STRONG)   := -fstack-protector-strong
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  Makefile                                  | 93 ++-----------------------------
>  arch/Kconfig                              | 37 ++++++------
>  arch/x86/Kconfig                          |  8 ++-
>  scripts/gcc-x86_32-has-stack-protector.sh |  7 +--
>  scripts/gcc-x86_64-has-stack-protector.sh |  5 --
>  5 files changed, 30 insertions(+), 120 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 9a8c689..e9fc7c9 100644
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
> -    KBUILD_CFLAGS += $(call cc-option, -fno-stack-protector)
> -  endif
> -endif
> -endif
> +stackp-flags-y                                 := -fno-stack-protector
> +stackp-flags-$(CONFIG_CC_STACKPROTECTOR)       := -fstack-protector
> +stackp-flags-$(CONFIG_CC_STACKPROTECTOR_STRONG)        := -fstack-protector-strong
> +
> +KBUILD_CFLAGS += $(stackp-flags-y)
>
>  ifeq ($(cc-name),clang)
>  KBUILD_CPPFLAGS += $(call cc-option,-Qunused-arguments,)
> @@ -1079,7 +1035,7 @@ endif
>  # prepare2 creates a makefile if using a separate output directory.
>  # From this point forward, .config has been reprocessed, so any rules
>  # that need to depend on updated CONFIG_* values can be checked here.
> -prepare2: prepare3 prepare-compiler-check outputmakefile asm-generic
> +prepare2: prepare3 outputmakefile asm-generic
>
>  prepare1: prepare2 $(version_h) include/generated/utsrelease.h \
>                     include/config/auto.conf
> @@ -1105,43 +1061,6 @@ uapi-asm-generic:
>  PHONY += prepare-objtool
>  prepare-objtool: $(objtool_target)
>
> -# Check for CONFIG flags that require compiler support. Abort the build
> -# after .config has been processed, but before the kernel build starts.
> -#
> -# For security-sensitive CONFIG options, we don't want to fallback and/or
> -# silently change which compiler flags will be used, since that leads to
> -# producing kernels with different security feature characteristics
> -# depending on the compiler used. (For example, "But I selected
> -# CC_STACKPROTECTOR_STRONG! Why did it build with _REGULAR?!")
> -PHONY += prepare-compiler-check
> -prepare-compiler-check: FORCE
> -# Make sure compiler supports requested stack protector flag.
> -ifdef stackp-name
> -  # Warn about CONFIG_CC_STACKPROTECTOR_AUTO having found no option.
> -  ifeq ($(stackp-flag),)
> -       @echo CONFIG_CC_STACKPROTECTOR_$(stackp-name): \
> -                 Compiler does not support any known stack-protector >&2
> -  else
> -  # Fail if specifically requested stack protector is missing.
> -  ifeq ($(call cc-option, $(stackp-flag)),)
> -       @echo Cannot use CONFIG_CC_STACKPROTECTOR_$(stackp-name): \
> -                 $(stackp-flag) not supported by compiler >&2 && exit 1
> -  endif
> -  endif
> -endif
> -# Make sure compiler does not have buggy stack-protector support. If a
> -# specific stack-protector was requested, fail the build, otherwise warn.
> -ifdef stackp-broken
> -  ifeq ($(stackp-name),AUTO)
> -       @echo CONFIG_CC_STACKPROTECTOR_$(stackp-name): \
> -                  $(stackp-flag) available but compiler is broken: disabling >&2
> -  else
> -       @echo Cannot use CONFIG_CC_STACKPROTECTOR_$(stackp-name): \
> -                  $(stackp-flag) available but compiler is broken >&2 && exit 1
> -  endif
> -endif
> -       @:
> -
>  # Generate some files
>  # ---------------------------------------------------------------------------
>
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 76c0b54..9b7a628 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -535,13 +535,21 @@ config HAVE_CC_STACKPROTECTOR
>         bool
>         help
>           An arch should select this symbol if:
> -         - its compiler supports the -fstack-protector option
>           - it has implemented a stack canary (e.g. __stack_chk_guard)
>
> -choice
> -       prompt "Stack Protector buffer overflow detection"
> +config CC_HAS_STACKPROTECTOR
> +       bool
> +       default $(cc-option -fstack-protector)
> +
> +config CC_HAS_STACKPROTECTOR_STRONG
> +       bool
> +       default $(cc-option -fstack-protector-strong)
> +
> +config CC_STACKPROTECTOR
> +       bool "Stack Protector buffer overflow detection"
>         depends on HAVE_CC_STACKPROTECTOR
> -       default CC_STACKPROTECTOR_AUTO
> +       depends on CC_HAS_STACKPROTECTOR
> +       default y
>         help



CC_HAS_STACKPROTECTOR is not mandatory in this case
because we can directly describe $(cc-option ...)
in 'depends on' context, like this:


config CC_STACKPROTECTOR
       bool "Stack Protector buffer overflow detection"
       depends on HAVE_CC_STACKPROTECTOR
       depends on $(cc-option -fstack-protector-strong)
       default y



The difference is CONFIG_CC_HAS_STACKPROTECTOR
will not be written into the .config file.


Maybe, is this useful information?

You can check .config in case
"BTW, can my compiler support this flag?"


I will keep CC_HAS_ symbols,
but I am open to this item.


-- 
Best Regards
Masahiro Yamada
