Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:49774 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733027AbfETPJE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 May 2019 11:09:04 -0400
MIME-Version: 1.0
References: <20190423212741.12219-1-ndesaulniers@google.com>
In-Reply-To: <20190423212741.12219-1-ndesaulniers@google.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 21 May 2019 00:08:19 +0900
Message-ID: <CAK7LNARdZa16J56AxhM5bcr9oHdAw+zpa4EDjPpF8YO77==Etw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: drop support for cc-ldoption
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Jonathan Corbet <corbet@lwn.net>, clang-built-linux <clang-built-linux@googlegroups.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Apr 24, 2019 at 6:27 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> If you want to see if your linker supports a certain flag, then ask the
> linker directly with ld-option (not the compiler with cc-ldoption).
> Checking for linker flag support is an antipattern that complicates the
> usage of various linkers other than bfd via -fuse-ld={bfd|gold|lld}.
>
> Cc: clang-built-linux@googlegroups.com
> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---

Applied to linux-kbuild. Thanks.




> This should probably wait until all of the call sites have been cleaned
> up. Masahiro sent them for arm and arm64, while I sent cleanups for all
> the rest.
>
>
>  Documentation/kbuild/makefiles.txt | 14 --------------
>  scripts/Kbuild.include             |  5 -----
>  2 files changed, 19 deletions(-)
>
> diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
> index 03c065855eaf..d65ad5746f94 100644
> --- a/Documentation/kbuild/makefiles.txt
> +++ b/Documentation/kbuild/makefiles.txt
> @@ -437,20 +437,6 @@ more details, with real examples.
>         The second argument is optional, and if supplied will be used
>         if first argument is not supported.
>
> -    cc-ldoption
> -       cc-ldoption is used to check if $(CC) when used to link object files
> -       supports the given option.  An optional second option may be
> -       specified if first option are not supported.
> -
> -       Example:
> -               #arch/x86/kernel/Makefile
> -               vsyscall-flags += $(call cc-ldoption, -Wl$(comma)--hash-style=sysv)
> -
> -       In the above example, vsyscall-flags will be assigned the option
> -       -Wl$(comma)--hash-style=sysv if it is supported by $(CC).
> -       The second argument is optional, and if supplied will be used
> -       if first argument is not supported.
> -
>      as-instr
>         as-instr checks if the assembler reports a specific instruction
>         and then outputs either option1 or option2
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index 7484b9d8272f..fbfb37d1bcc8 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -138,11 +138,6 @@ cc-disable-warning = $(call try-run,\
>  # Usage:  EXTRA_CFLAGS += $(call cc-ifversion, -lt, 0402, -O1)
>  cc-ifversion = $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ] && echo $(3) || echo $(4))
>
> -# cc-ldoption
> -# Usage: ldflags += $(call cc-ldoption, -Wl$(comma)--hash-style=both)
> -cc-ldoption = $(call try-run,\
> -       $(CC) $(1) $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) -nostdlib -x c /dev/null -o "$$TMP",$(1),$(2))
> -
>  # ld-option
>  # Usage: KBUILD_LDFLAGS += $(call ld-option, -X, -Y)
>  ld-option = $(call try-run, $(LD) $(KBUILD_LDFLAGS) $(1) -v,$(1),$(2),$(3))
> --
> 2.21.0.593.g511ec345e18-goog
>


-- 
Best Regards
Masahiro Yamada
