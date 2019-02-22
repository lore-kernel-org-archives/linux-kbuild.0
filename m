Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33443 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbfBVAxJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Feb 2019 19:53:09 -0500
Received: by mail-pl1-f195.google.com with SMTP id y10so272149plp.0
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Feb 2019 16:53:09 -0800 (PST)
MIME-Version: 1.0
References: <1550722418-9189-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1550722418-9189-1-git-send-email-yamada.masahiro@socionext.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 21 Feb 2019 16:52:55 -0800
Message-ID: <CAKwvOd=YBsupApffP_5QUB5dbQr8k-43DgKhckqkcsGiuXK=MA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: compute false-positive -Wmaybe-uninitialized
 cases in Kconfig
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nathan Chancellor <natechancellor@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Ingo Molnar <mingo@redhat.com>

On Wed, Feb 20, 2019 at 8:14 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Since -Wmaybe-uninitialized was introduced by GCC 4.7, we have patched
> various false positives:
>
>  - commit e74fc973b6e5 ("Turn off -Wmaybe-uninitialized when building
>    with -Os") turned off this option for -Os.
>
>  - commit 815eb71e7149 ("Kbuild: disable 'maybe-uninitialized' warning
>    for CONFIG_PROFILE_ALL_BRANCHES") turned off this option for
>    CONFIG_PROFILE_ALL_BRANCHES
>
>  - commit a76bcf557ef4 ("Kbuild: enable -Wmaybe-uninitialized warning
>    for "make W=1"") turned off this option for GCC < 4.9
>    Arnd provided more explanation in https://lkml.org/lkml/2017/3/14/903
>
> I think this looks better by shifting the logic from Makefile to Kconfig.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

I verified that mainline+this patch did not regression arm64
allyesconfig clang build.
Tested-by: Nick Desaulniers <ndesaulniers@google.com>
Thanks for the patch! Would you mind adding a link tag to:
Link: https://github.com/ClangBuiltLinux/linux/issues/350

> ---
>
>  Makefile             | 10 +++-------
>  init/Kconfig         | 17 +++++++++++++++++
>  kernel/trace/Kconfig |  1 +
>  3 files changed, 21 insertions(+), 7 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 1bb0535..b21aa2e3 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -656,17 +656,13 @@ KBUILD_CFLAGS     += $(call cc-disable-warning, int-in-bool-context)
>
>  ifdef CONFIG_CC_OPTIMIZE_FOR_SIZE
>  KBUILD_CFLAGS  += $(call cc-option,-Oz,-Os)
> -KBUILD_CFLAGS  += $(call cc-disable-warning,maybe-uninitialized,)
> -else
> -ifdef CONFIG_PROFILE_ALL_BRANCHES
> -KBUILD_CFLAGS  += -O2 $(call cc-disable-warning,maybe-uninitialized,)
>  else
>  KBUILD_CFLAGS   += -O2
>  endif
> -endif
>
> -KBUILD_CFLAGS += $(call cc-ifversion, -lt, 0409, \
> -                       $(call cc-disable-warning,maybe-uninitialized,))
> +ifdef CONFIG_CC_DISABLE_WARN_MAYBE_UNINITIALIZED
> +KBUILD_CFLAGS   += -Wno-maybe-uninitialized
> +endif
>
>  # Tell gcc to never replace conditional load with a non-conditional one
>  KBUILD_CFLAGS  += $(call cc-option,--param=allow-store-data-races=0)
> diff --git a/init/Kconfig b/init/Kconfig
> index c9386a3..1f05a88 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -26,6 +26,22 @@ config CLANG_VERSION
>  config CC_HAS_ASM_GOTO
>         def_bool $(success,$(srctree)/scripts/gcc-goto.sh $(CC))
>
> +config CC_HAS_WARN_MAYBE_UNINITIALIZED
> +       def_bool $(cc-option,-Wmaybe-uninitialized)
> +       help
> +         GCC >= 4.7 supports this option.
> +
> +config CC_DISABLE_WARN_MAYBE_UNINITIALIZED
> +       bool
> +       depends on CC_HAS_WARN_MAYBE_UNINITIALIZED
> +       default CC_IS_GCC && GCC_VERSION < 40900  # unreliable for GCC < 4.9
> +       help
> +         GCC's -Wmaybe-uninitialized is not reliable by definition.
> +         Lots of false positive warnings are produced in some cases.
> +
> +         If this option is enabled, -Wno-maybe-uninitialzed is passed
> +         to the compiler to suppress maybe-uninitialized warnings.
> +
>  config CONSTRUCTORS
>         bool
>         depends on !UML
> @@ -1113,6 +1129,7 @@ config CC_OPTIMIZE_FOR_PERFORMANCE
>
>  config CC_OPTIMIZE_FOR_SIZE
>         bool "Optimize for size"
> +       imply CC_DISABLE_WARN_MAYBE_UNINITIALIZED  # avoid false positives
>         help
>           Enabling this option will pass "-Os" instead of "-O2" to
>           your compiler resulting in a smaller kernel.
> diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
> index fa8b1fe..8bd1d6d 100644
> --- a/kernel/trace/Kconfig
> +++ b/kernel/trace/Kconfig
> @@ -370,6 +370,7 @@ config PROFILE_ANNOTATED_BRANCHES
>  config PROFILE_ALL_BRANCHES
>         bool "Profile all if conditionals" if !FORTIFY_SOURCE
>         select TRACE_BRANCH_PROFILING
> +       imply CC_DISABLE_WARN_MAYBE_UNINITIALIZED  # avoid false positives
>         help
>           This tracer profiles all branch conditions. Every if ()
>           taken in the kernel is recorded whether it hit or miss.
> --
> 2.7.4
>


-- 
Thanks,
~Nick Desaulniers
