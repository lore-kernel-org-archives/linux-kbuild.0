Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:55457 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726574AbfF1F47 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Jun 2019 01:56:59 -0400
MIME-Version: 1.0
References: <20190628020433.19156-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190628020433.19156-1-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 28 Jun 2019 14:56:09 +0900
Message-ID: <CAK7LNASnMwUNgHh38aGkuc8KdBG3TW02qZf1Kw_OYcTPYjWYOQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: get rid of misleading $(AS) from documents
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, Sam Ravnborg <sam@ravnborg.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>

On Fri, Jun 28, 2019 at 11:06 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> The assembler files in the kernel are *.S instead of *.s, so they must
> be preprocessed. Hence, we always use $(CC) as an assembler driver.
>
> $(AS) is almost unused in Kbuild. As of writing, there is just one user.
>
>   $ git grep '$(AS)' -- :^Documentation
>   drivers/net/wan/Makefile:  AS68K = $(AS)


In Makefile, a variable is also referenced in a curly brace form like ${AS}.
In shell scripts, it can be referenced in the form of $AR.

I grepped more patterns.

$ git grep -e '$(AS)' -e '${AS}' -e '$AS' -e '$(AS:' -e '${AS:' --
:^Documentation
drivers/net/wan/Makefile:  AS68K = $(AS)

I found only user still.



> The documentation about *_AFLAGS* sounds like the flags were passed
> to $(AS). This is somewhat misleading since we do not invoke $(AS)
> directly.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  Documentation/kbuild/kbuild.txt    |  5 ++---
>  Documentation/kbuild/makefiles.txt | 12 ++++++------
>  2 files changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/Documentation/kbuild/kbuild.txt b/Documentation/kbuild/kbuild.txt
> index 9c230ea71963..7a7e2aa2fab5 100644
> --- a/Documentation/kbuild/kbuild.txt
> +++ b/Documentation/kbuild/kbuild.txt
> @@ -31,12 +31,11 @@ Additional options to the assembler (for built-in and modules).
>
>  AFLAGS_MODULE
>  --------------------------------------------------
> -Additional module specific options to use for $(AS).
> +Additional module specific options to use for assembler.
>
>  AFLAGS_KERNEL
>  --------------------------------------------------
> -Additional options for $(AS) when used for assembler
> -code for code that is compiled as built-in.
> +Additional options when used for assembling code that is compiled as built-in.
>
>  KCFLAGS
>  --------------------------------------------------
> diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
> index d65ad5746f94..f0b3a30b985d 100644
> --- a/Documentation/kbuild/makefiles.txt
> +++ b/Documentation/kbuild/makefiles.txt
> @@ -306,7 +306,7 @@ more details, with real examples.
>         variable $(KBUILD_CFLAGS) and uses it for compilation flags for the
>         entire tree.
>
> -       asflags-y specifies options for assembling with $(AS).
> +       asflags-y specifies options for assembling.
>
>         Example:
>                 #arch/sparc/kernel/Makefile
> @@ -441,7 +441,7 @@ more details, with real examples.
>         as-instr checks if the assembler reports a specific instruction
>         and then outputs either option1 or option2
>         C escapes are supported in the test instruction
> -       Note: as-instr-option uses KBUILD_AFLAGS for $(AS) options
> +       Note: as-instr-option uses KBUILD_AFLAGS for assembler options
>
>      cc-option
>         cc-option is used to check if $(CC) supports a given option, and if
> @@ -814,7 +814,7 @@ When kbuild executes, the following steps are followed (roughly):
>         In this example, the binary $(obj)/image is a binary version of
>         vmlinux. The usage of $(call if_changed,xxx) will be described later.
>
> -    KBUILD_AFLAGS              $(AS) assembler flags
> +    KBUILD_AFLAGS              assembler flags
>
>         Default value - see top level Makefile
>         Append or modify as required per architecture.
> @@ -853,15 +853,15 @@ When kbuild executes, the following steps are followed (roughly):
>         The first example utilises the trick that a config option expands
>         to 'y' when selected.
>
> -    KBUILD_AFLAGS_KERNEL       $(AS) options specific for built-in
> +    KBUILD_AFLAGS_KERNEL       assembler options specific for built-in
>
>         $(KBUILD_AFLAGS_KERNEL) contains extra C compiler flags used to compile
>         resident kernel code.
>
> -    KBUILD_AFLAGS_MODULE   Options for $(AS) when building modules
> +    KBUILD_AFLAGS_MODULE   Options for assembler when building modules
>
>         $(KBUILD_AFLAGS_MODULE) is used to add arch-specific options that
> -       are used for $(AS).
> +       are used for assembler.
>         From commandline AFLAGS_MODULE shall be used (see kbuild.txt).
>
>      KBUILD_CFLAGS_KERNEL       $(CC) options specific for built-in
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
