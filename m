Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:49296 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751290AbdKCSYV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Nov 2017 14:24:21 -0400
Received: by mail-wr0-f195.google.com with SMTP id g90so3261040wrd.6
        for <linux-kbuild@vger.kernel.org>; Fri, 03 Nov 2017 11:24:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20171103171203.107569-2-samitolvanen@google.com>
References: <20171103171203.107569-1-samitolvanen@google.com> <20171103171203.107569-2-samitolvanen@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 3 Nov 2017 11:24:18 -0700
Message-ID: <CAKwvOdkRj9RdmmsRu+q6ntwD8ZVidAH7L+nGuzf7xEPuVap-Vw@mail.gmail.com>
Subject: Re: [PATCH 01/15] kbuild: add ld-name macro and support for GNU gold
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, Matthias Kaehlcke <mka@chromium.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

+ Kbuild mailing list and maintainers

The use of these ternary like operations will need to be expanded if
additional compilers come along (less likely), or additional linkers
(more likely, we are looking into lld right now) but we can cross that
bridge when we get there.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

On Fri, Nov 3, 2017 at 10:11 AM, Sami Tolvanen <samitolvanen@google.com> wrote:
> GNU gold may require different flags than GNU ld. Add a macro for
> detecting the linker and conditionally add gold specific flags from
> LDFLAGS_GOLD.
>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  Makefile               | 5 +++++
>  scripts/Kbuild.include | 4 ++++
>  2 files changed, 9 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 3a8868ee967e..59980d5a03d0 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -826,6 +826,11 @@ include scripts/Makefile.kasan
>  include scripts/Makefile.extrawarn
>  include scripts/Makefile.ubsan
>
> +# Add any flags specific to ld.gold
> +ifeq ($(ld-name),gold)
> +LDFLAGS                += $(LDFLAGS_GOLD)
> +endif
> +
>  # Add any arch overrides and user supplied CPPFLAGS, AFLAGS and CFLAGS as the
>  # last assignments
>  KBUILD_CPPFLAGS += $(ARCH_CPPFLAGS) $(KCPPFLAGS)
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index 9ffd3dda3889..584d6cecd7c0 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -172,6 +172,10 @@ ld-option = $(call try-run,\
>  # Important: no spaces around options
>  ar-option = $(call try-run, $(AR) rc$(1) "$$TMP",$(1),$(2))
>
> +# ld-name
> +# Expands to either bfd or gold
> +ld-name = $(shell $(LD) -v 2>&1 | grep -q "GNU gold" && echo gold || echo bfd)
> +
>  # ld-version
>  # Note this is mainly for HJ Lu's 3 number binutil versions
>  ld-version = $(shell $(LD) --version | $(srctree)/scripts/ld-version.sh)
> --
> 2.15.0.403.gc27cc4dac6-goog
>



-- 
Thanks,
~Nick Desaulniers
