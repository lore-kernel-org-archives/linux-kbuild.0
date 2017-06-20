Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:26402 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752918AbdFTJiK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Jun 2017 05:38:10 -0400
MIME-Version: 1.0
In-Reply-To: <20170619183757.124992-2-mka@chromium.org>
References: <20170619183757.124992-1-mka@chromium.org> <20170619183757.124992-2-mka@chromium.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 20 Jun 2017 18:37:56 +0900
Message-ID: <CAK7LNAQY67JE5cZ_csKk=VxDSx107Oua_g_JvqdTCt3t34Lhnw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] kbuild: Add __cc-option macro
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, "H . J . Lu" <hjl.tools@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Michal Marek <mmarek@suse.com>, X86 ML <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <Bernhard.Rosenkranzer@linaro.org>, Peter Foley <pefoley2@pefoley.com>, Behan Webster <behanw@converseincode.com>, Douglas Anderson <dianders@chromium.org>

Hi Matthias,

2017-06-20 3:37 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
> cc-option uses KBUILD_CFLAGS and KBUILD_CPPFLAGS when it determines
> whether an option is supported or not. This is fine for options used to
> build the kernel itself, however some components like the x86 boot code
> use a different set of flags.
>
> Add the new macro __cc-option which is a more generic version of
> cc-option with additional parameters. One parameter is the compiler
> with which the check should be performed, the other the compiler options
> to be used instead KBUILD_C*FLAGS.
>
> Refactor cc-option and hostcc-option to use __cc-option and move
> hostcc-option to scripts/Kbuild.include.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> Changes in v4:
> - Remove extra space before alternative option in cc-option and
>   hostcc-option
>
>  Makefile               |  2 +-
>  scripts/Kbuild.include | 14 ++++++++++++--
>  scripts/Makefile.host  |  6 ------
>  3 files changed, 13 insertions(+), 9 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 83f6d9972cab..b234bba6d652 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -303,7 +303,7 @@ CONFIG_SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
>
>  HOSTCC       = gcc
>  HOSTCXX      = g++
> -HOSTCFLAGS   = -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89
> +HOSTCFLAGS   := -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89
>  HOSTCXXFLAGS = -O2
>
>  ifeq ($(shell $(HOSTCC) -v 2>&1 | grep -c "clang version"), 1)
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index 61f87a99bf0a..81a58d1f53af 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -108,6 +108,11 @@ as-option = $(call try-run,\
>  as-instr = $(call try-run,\
>         printf "%b\n" "$(1)" | $(CC) $(KBUILD_AFLAGS) -c -x assembler -o "$$TMP" -,$(2),$(3))
>
> +# __cc-option
> +# Usage: MY_CFLAGS += $(call __cc-option,$(CC),$(MY_CFLAGS),-march=winchip-c6,-march=i586)
> +__cc-option = $(call try-run,\
> +       $(1) -Werror $(2) $(3) -c -x c /dev/null -o "$$TMP",$(3),$(4))
> +
>  # Do not attempt to build with gcc plugins during cc-option tests.
>  # (And this uses delayed resolution so the flags will be up to date.)
>  CC_OPTION_CFLAGS = $(filter-out $(GCC_PLUGINS_CFLAGS),$(KBUILD_CFLAGS))
> @@ -115,8 +120,13 @@ CC_OPTION_CFLAGS = $(filter-out $(GCC_PLUGINS_CFLAGS),$(KBUILD_CFLAGS))
>  # cc-option
>  # Usage: cflags-y += $(call cc-option,-march=winchip-c6,-march=i586)
>
> -cc-option = $(call try-run,\
> -       $(CC) -Werror $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
> +cc-option = $(call __cc-option, $(CC), $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS),\
> +       $(1),$(2))


I think this will introduce an extra tab for the true case.

Could you wrap the line after $(CC),?

cc-option = $(call __cc-option, $(CC),\
       $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS),$(1),$(2))


I would not have requested v5 only for this,
but it looks like you have a chance for re-spin to improve 3/3.




-- 
Best Regards
Masahiro Yamada
