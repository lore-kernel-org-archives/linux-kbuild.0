Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:37481 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgCFLif (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Mar 2020 06:38:35 -0500
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 026BcJ6Q015805
        for <linux-kbuild@vger.kernel.org>; Fri, 6 Mar 2020 20:38:20 +0900
Received: by mail-vk1-f169.google.com with SMTP id r5so512863vkf.2
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Mar 2020 03:38:19 -0800 (PST)
MIME-Version: 1.0
References: <1583476525-13505-1-git-send-email-amit.kachhap@arm.com> <1583476525-13505-17-git-send-email-amit.kachhap@arm.com>
In-Reply-To: <1583476525-13505-17-git-send-email-amit.kachhap@arm.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 6 Mar 2020 20:37:42 +0900
Message-ID: <CAK7LNAS63ed8zfoKukgHHmqVNEptXPh8XJTv-Zkh0ba=fLN+XQ@mail.gmail.com>
Subject: Re: [PATCH v6 16/18] kconfig: Add support for 'as-option'
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Amit Daniel Kachhap <amit.kachhap@arm.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, Kees Cook <keescook@chromium.org>, Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, Ramana Radhakrishnan <ramana.radhakrishnan@arm.com>, Kristina Martsenko <kristina.martsenko@arm.com>, Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>, Vincenzo Frascino <Vincenzo.Frascino@arm.com>, Mark Brown <broonie@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Fri, Mar 6, 2020 at 3:36 PM Amit Daniel Kachhap <amit.kachhap@arm.com> wrote:
>
> From: Vincenzo Frascino <vincenzo.frascino@arm.com>
>
> Currently kconfig does not have a feature that allows to detect if the
> used assembler supports a specific compilation option.
>
> Introduce 'as-option' to serve this purpose in the context of Kconfig:
>
>         config X
>                 def_bool $(as-option,...)
>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: linux-kbuild@vger.kernel.org
> Acked-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> Signed-off-by: Amit Daniel Kachhap <amit.kachhap@arm.com>
> ---
> Changes since v5:
>  * More descriptions for using /dev/zero.


FYI:

This has been fixed:

https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=3c968de5c7d1719b2f9b538f2f7f5f5922e5f311


So, this will not be a problem for the
future release of binutils.

Anyway, we need to take care of the released ones,
so I am fine with /dev/zero.





>  scripts/Kconfig.include | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> index 85334dc..a1c1925 100644
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -31,6 +31,12 @@ cc-option = $(success,$(CC) -Werror $(CLANG_FLAGS) $(1) -S -x c /dev/null -o /de
>  # Return y if the linker supports <flag>, n otherwise
>  ld-option = $(success,$(LD) -v $(1))
>
> +# $(as-option,<flag>)
> +# /dev/zero is used as output instead of /dev/null as some assembler cribs when
> +# both input and output are same. Also both of them have same write behaviour so
> +# can be easily substituted.
> +as-option = $(success, $(CC) $(CLANG_FLAGS) $(1) -c -x assembler /dev/null -o /dev/zero)
> +
>  # $(as-instr,<instr>)
>  # Return y if the assembler supports <instr>, n otherwise
>  as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -c -x assembler -o /dev/null -)
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
