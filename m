Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:30370 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbfH1QpQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Aug 2019 12:45:16 -0400
MIME-Version: 1.0
References: <20190819085843.3554-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190819085843.3554-1-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 29 Aug 2019 01:44:34 +0900
Message-ID: <CAK7LNAQq_P9eFOOhR_vA+YzgVdoOigCdiqufJBssoOO-Q5X8ig@mail.gmail.com>
Subject: Re: [PATCH] kbuild: move modkern_{c,a}flags to Makefile.lib from Makefile.build
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Aug 19, 2019 at 5:59 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Makefile.lib is included by Makefile.modfinal as well as Makefile.build.
>
> Move modkern_cflags to Makefile.lib in order to simplify cmd_cc_o_c
> in Makefile.modfinal. Move modkern_cflags as well for consistency.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild.

>
>  scripts/Makefile.build    | 13 -------------
>  scripts/Makefile.lib      | 12 ++++++++++++
>  scripts/Makefile.modfinal |  6 +++---
>  3 files changed, 15 insertions(+), 16 deletions(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 10adf3b558de..b46e608f9931 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -92,15 +92,6 @@ endif
>  # Compile C sources (.c)
>  # ---------------------------------------------------------------------------
>
> -# Default is built-in, unless we know otherwise
> -part-of-module = $(if $(filter $(basename $@).o, $(real-obj-m)),y)
> -
> -modkern_cflags =                                          \
> -       $(if $(part-of-module),                           \
> -               $(KBUILD_CFLAGS_MODULE) $(CFLAGS_MODULE), \
> -               $(KBUILD_CFLAGS_KERNEL) $(CFLAGS_KERNEL))
> -quiet_modtag = $(if $(part-of-module),[M],   )
> -
>  quiet_cmd_cc_s_c = CC $(quiet_modtag)  $@
>        cmd_cc_s_c = $(CC) $(filter-out $(DEBUG_CFLAGS), $(c_flags)) $(DISABLE_LTO) -fverbose-asm -S -o $@ $<
>
> @@ -304,10 +295,6 @@ $(obj)/%.h.s: $(src)/%.h FORCE
>  # Compile assembler sources (.S)
>  # ---------------------------------------------------------------------------
>
> -modkern_aflags = $(if $(part-of-module),                               \
> -                       $(KBUILD_AFLAGS_MODULE) $(AFLAGS_MODULE),       \
> -                       $(KBUILD_AFLAGS_KERNEL) $(AFLAGS_KERNEL))
> -
>  # .S file exports must have their C prototypes defined in asm/asm-prototypes.h
>  # or a file that it includes, in order to get versioned symbols. We build a
>  # dummy C file that includes asm-prototypes and the EXPORT_SYMBOL lines from
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 264611972c4a..888e5c830646 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -159,6 +159,18 @@ _cpp_flags += -I $(srctree)/$(src) -I $(objtree)/$(obj)
>  endif
>  endif
>
> +part-of-module = $(if $(filter $(basename $@).o, $(real-obj-m)),y)
> +quiet_modtag = $(if $(part-of-module),[M],   )
> +
> +modkern_cflags =                                          \
> +       $(if $(part-of-module),                           \
> +               $(KBUILD_CFLAGS_MODULE) $(CFLAGS_MODULE), \
> +               $(KBUILD_CFLAGS_KERNEL) $(CFLAGS_KERNEL))
> +
> +modkern_aflags = $(if $(part-of-module),                               \
> +                       $(KBUILD_AFLAGS_MODULE) $(AFLAGS_MODULE),       \
> +                       $(KBUILD_AFLAGS_KERNEL) $(AFLAGS_KERNEL))
> +
>  c_flags        = -Wp,-MD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
>                  -include $(srctree)/include/linux/compiler_types.h       \
>                  $(_c_flags) $(modkern_cflags)                           \
> diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> index 2e49d536a9b3..059dbcf5ae77 100644
> --- a/scripts/Makefile.modfinal
> +++ b/scripts/Makefile.modfinal
> @@ -17,12 +17,12 @@ modules := $(sort $(shell cat $(MODORDER)))
>  __modfinal: $(modules)
>         @:
>
> -# modname is set to make c_flags define KBUILD_MODNAME
> +# modname and part-of-module are set to make c_flags define proper module flags
>  modname = $(notdir $(@:.mod.o=))
> +part-of-module = y
>
>  quiet_cmd_cc_o_c = CC [M]  $@
> -      cmd_cc_o_c = $(CC) $(c_flags) $(KBUILD_CFLAGS_MODULE) $(CFLAGS_MODULE) \
> -                  -c -o $@ $<
> +      cmd_cc_o_c = $(CC) $(c_flags) -c -o $@ $<
>
>  %.mod.o: %.mod.c FORCE
>         $(call if_changed_dep,cc_o_c)
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
