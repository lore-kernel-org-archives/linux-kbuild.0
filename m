Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40613 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726161AbfCGShp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Mar 2019 13:37:45 -0500
Received: by mail-pf1-f196.google.com with SMTP id h1so12100207pfo.7
        for <linux-kbuild@vger.kernel.org>; Thu, 07 Mar 2019 10:37:44 -0800 (PST)
MIME-Version: 1.0
References: <20190307133514.44378-1-glider@google.com> <20190307133514.44378-2-glider@google.com>
In-Reply-To: <20190307133514.44378-2-glider@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 7 Mar 2019 10:37:32 -0800
Message-ID: <CAKwvOdnRNyANL4T3CZxWiE_s+mKTYBBXbczeei8Ne6Sy7jb+og@mail.gmail.com>
Subject: Re: [PATCH 1/1] RFC: initmem: introduce CONFIG_INIT_ALL_MEMORY and CONFIG_INIT_ALL_STACK
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexander Potapenko <glider@google.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, jmorris@namei.org, serge@hallyn.com, linux-security-module@vger.kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Kostya Serebryany <kcc@google.com>, Dmitry Vyukov <dvyukov@google.com>, Kees Cook <keescook@chromium.org>, sspatil@android.com

On Thu, Mar 7, 2019 at 5:35 AM Alexander Potapenko <glider@google.com> wrote:
>
> This patch is a part of a bigger initiative to allow initializing
> heap/stack memory in the Linux kernels by default.
> The rationale behind doing so is to reduce the severity of bugs caused
> by using uninitialized memory.
>
> CONFIG_INIT_ALL_MEMORY is going to be an umbrella config for options
> that force heap and stack initialization.
>
> CONFIG_INIT_ALL_STACK turns on stack initialization based on the
> -ftrivial-auto-var-init Clang flag.
>
> -ftrivial-auto-var-init is a Clang flag that provides trivial
> initializers for uninitialized local variables, variable fields and
> padding.
>
> It has three possible values:
>   pattern - uninitialized locals are filled with a fixed pattern
>     (mostly 0xAA on 64-bit platforms, see https://reviews.llvm.org/D54604

Hopefully the disagreements there about "defining a new dialect of
C++" don't apply to us in the kernel.  We'd like to have this feature;
our dialect of C is already quite far from what ISO has specified,
both through the explicit use of `-f` compiler flags and use of most
GNU C extensions.  We already have our own dialect of C for the
kernel, it's too late for that.  But maybe I should go bikeshed in
cfe-dev...

Thanks for this patch.  I'll take a closer look once Kees' feedback
has been addressed.

>     for more details) likely to cause crashes when uninitialized value is
>     used;
>   zero (it's still debated whether this flag makes it to the official
>     Clang release) - uninitialized locals are filled with zeroes;
>   uninitialized (default) - uninitialized locals are left intact.
>
> The proposed config builds the kernel with
> -ftrivial-auto-var-init=pattern.
>
> Developers have the possibility to opt-out of this feature on a
> per-file (by using the INIT_ALL_MEMORY_ Makefile prefix) or per-variable
> (by using __attribute__((uninitialized))) basis.
>
> Signed-off-by: Alexander Potapenko <glider@google.com>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: James Morris <jmorris@namei.org>
> Cc: "Serge E. Hallyn" <serge@hallyn.com>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Kostya Serebryany <kcc@google.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Sandeep Patil <sspatil@android.com>
> Cc: linux-security-module@vger.kernel.org
> Cc: linux-kbuild@vger.kernel.org
>
> ---
>  Makefile                 |  3 ++-
>  scripts/Makefile.initmem | 17 +++++++++++++++++
>  scripts/Makefile.lib     |  6 ++++++
>  security/Kconfig         |  1 +
>  security/Kconfig.initmem | 22 ++++++++++++++++++++++
>  5 files changed, 48 insertions(+), 1 deletion(-)
>  create mode 100644 scripts/Makefile.initmem
>  create mode 100644 security/Kconfig.initmem
>
> diff --git a/Makefile b/Makefile
> index f070e0d65186..028ca37878fd 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -448,7 +448,7 @@ export HOSTCXX KBUILD_HOSTCXXFLAGS LDFLAGS_MODULE CHECK CHECKFLAGS
>
>  export KBUILD_CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS KBUILD_LDFLAGS
>  export KBUILD_CFLAGS CFLAGS_KERNEL CFLAGS_MODULE
> -export CFLAGS_KASAN CFLAGS_KASAN_NOSANITIZE CFLAGS_UBSAN
> +export CFLAGS_KASAN CFLAGS_KASAN_NOSANITIZE CFLAGS_UBSAN CFLAGS_INITMEM
>  export KBUILD_AFLAGS AFLAGS_KERNEL AFLAGS_MODULE
>  export KBUILD_AFLAGS_MODULE KBUILD_CFLAGS_MODULE KBUILD_LDFLAGS_MODULE
>  export KBUILD_AFLAGS_KERNEL KBUILD_CFLAGS_KERNEL
> @@ -840,6 +840,7 @@ KBUILD_ARFLAGS := $(call ar-option,D)
>  include scripts/Makefile.kasan
>  include scripts/Makefile.extrawarn
>  include scripts/Makefile.ubsan
> +include scripts/Makefile.initmem
>
>  # Add any arch overrides and user supplied CPPFLAGS, AFLAGS and CFLAGS as the
>  # last assignments
> diff --git a/scripts/Makefile.initmem b/scripts/Makefile.initmem
> new file mode 100644
> index 000000000000..f49be398f2c1
> --- /dev/null
> +++ b/scripts/Makefile.initmem
> @@ -0,0 +1,17 @@
> +ifdef CONFIG_INIT_ALL_MEMORY
> +
> +# Clang's -ftrivial-auto-var-init=pattern flag initializes the
> +# uninitialized parts of local variables (including fields and padding)
> +# with a fixed pattern (0xAA in most cases).
> +ifdef CONFIG_INIT_ALL_STACK
> + CFLAGS_INITMEM := -ftrivial-auto-var-init=pattern
> +endif
> +
> +ifeq ($(call cc-option, $(CFLAGS_INITMEM) -Werror),)
> +   ifneq ($(CONFIG_COMPILE_TEST),y)
> +        $(warning Cannot use CONFIG_INIT_ALL_MEMORY: \
> +            -ftrivial-auto-var-init is not supported by compiler)
> +   endif
> +endif
> +
> +endif
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 12b88d09c3a4..53d18fd15c79 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -131,6 +131,12 @@ _c_flags += $(if $(patsubst n%,, \
>                 $(CFLAGS_UBSAN))
>  endif
>
> +ifeq ($(CONFIG_INIT_ALL_MEMORY),y)
> +_c_flags += $(if $(patsubst n%,, \
> +               $(INIT_ALL_MEMORY_$(basetarget).o)$(INIT_ALL_MEMORY)y), \
> +               $(CFLAGS_INITMEM))
> +endif
> +
>  ifeq ($(CONFIG_KCOV),y)
>  _c_flags += $(if $(patsubst n%,, \
>         $(KCOV_INSTRUMENT_$(basetarget).o)$(KCOV_INSTRUMENT)$(CONFIG_KCOV_INSTRUMENT_ALL)), \
> diff --git a/security/Kconfig b/security/Kconfig
> index e4fe2f3c2c65..cc12a39424dd 100644
> --- a/security/Kconfig
> +++ b/security/Kconfig
> @@ -230,6 +230,7 @@ config STATIC_USERMODEHELPER_PATH
>           If you wish for all usermode helper programs to be disabled,
>           specify an empty string here (i.e. "").
>
> +source "security/Kconfig.initmem"
>  source "security/selinux/Kconfig"
>  source "security/smack/Kconfig"
>  source "security/tomoyo/Kconfig"
> diff --git a/security/Kconfig.initmem b/security/Kconfig.initmem
> new file mode 100644
> index 000000000000..5ac3cf3e7f88
> --- /dev/null
> +++ b/security/Kconfig.initmem
> @@ -0,0 +1,22 @@
> +menu "Initialize all memory"
> +
> +config INIT_ALL_MEMORY
> +       bool "Initialize all memory"
> +       default n
> +       help
> +         Enforce memory initialization to mitigate infoleaks and make
> +         the control-flow bugs depending on uninitialized values more
> +         deterministic.
> +
> +if INIT_ALL_MEMORY
> +
> +config INIT_ALL_STACK
> +       bool "Initialize all stack"
> +       depends on INIT_ALL_MEMORY
> +       default y
> +       help
> +         Initialize uninitialized stack data with a 0xAA pattern.
> +         This config option only supports Clang builds at the moment.
> +
> +endif # INIT_ALL_MEMORY
> +endmenu
> --
> 2.21.0.352.gf09ad66450-goog
>


-- 
Thanks,
~Nick Desaulniers
