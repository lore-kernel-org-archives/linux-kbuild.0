Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:60936 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751047AbdDKMBq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Apr 2017 08:01:46 -0400
MIME-Version: 1.0
In-Reply-To: <20170403212537.124217-1-mka@chromium.org>
References: <20170403212537.124217-1-mka@chromium.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 11 Apr 2017 21:01:41 +0900
Message-ID: <CAK7LNATZq8CWNxf_KAk6p4v2ZG6HEd70nxPB8MDWOcR5K5aQsA@mail.gmail.com>
Subject: Re: [RFC PATCH] kbuild: Fix asm-offset generation to work with clang
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Michal Marek <mmarek@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Grant Grundler <grundler@chromium.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Behan Webster <behanw@converseincode.com>, Peter Foley <pefoley2@pefoley.com>

Hi Matthias,


2017-04-04 6:25 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
> When using clang with -no-integerated-as clang will use the gnu
> assembler instead of the integrated assembler. However clang will
> still perform asm error checking before sending the inline assembly
> language to gas.
>
> The generation of asm-offsets from within C code is dependent on gcc's
> blind passing of whatever is in asm() through to gas. Arbirary text is
> passed through which is then modified by a sed script into the
> appropriate .h and .S code. Since the arbitrary text is not valid
> assembly language, clang fails.
>
> This can be fixed by making the arbitrary text into an ASM comment and
> then updating the sed scripts accordingly to work as expected.
>
> This solution works for both gcc and clang.
>
> Based-on-patch-from: Behan Webster <behanw@converseincode.com>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>



Could you check Jeroen Hofstee's work for U-Boot?

http://patchwork.ozlabs.org/patch/375026/


His idea is to use .ascii string
in order to handle this in arch-agnostic way.

If you are happy about this idea,
I can forward his patch (with a little bit adjustment).

We may want to refactor the patch because
the double mark ".ascii" and "->" seem redundant,
but it is just a detail.



Masahiro



> Dependencies
>   all architectures
>     kbuild: Consolidate header generation from ASM offset information
>       https://patchwork.kernel.org/patch/9660459/
>
>   um
>     um: Include kbuild.h instead of duplicating its macros
>       https://patchwork.kernel.org/patch/9660503/
>
>   frv
>     frv: Use OFFSET macro in DEF_*REG()
>       https://patchwork.kernel.org/patch/9660473/
>
> The change has been build tested on a wide range of architectures.
>
> The if cascade in kbuild.h and the comment symbol list in
> Makefile.asm-offsets won't win a beauty price. Alternatively the comment
> symbol could be specified in arch/Kconfig. Personally I don't have a
> strong preference on this point.
>
>  include/linux/kbuild.h       | 34 ++++++++++++++++++++++++++++---
>  scripts/Makefile.asm-offsets | 48 ++++++++++++++++++++++++++++++++++++++++----
>  2 files changed, 75 insertions(+), 7 deletions(-)
>
> diff --git a/include/linux/kbuild.h b/include/linux/kbuild.h
> index 22a72198c14b..632e33d3b70c 100644
> --- a/include/linux/kbuild.h
> +++ b/include/linux/kbuild.h
> @@ -1,15 +1,43 @@
>  #ifndef __LINUX_KBUILD_H
>  #define __LINUX_KBUILD_H
>
> +#if defined(CONFIG_ALPHA) || defined(CONFIG_AVR32) ||        \
> +       defined(CONFIG_MICROBLAZE) || defined(CONFIG_MIPS) || \
> +       defined(CONFIG_MN10300) || defined(CONFIG_PPC) || \
> +       defined(CONFIG_S390) || defined(CONFIG_SCORE) ||      \
> +       defined(CONFIG_UML_X86) || defined(CONFIG_X86) ||     \
> +       defined(CONFIG_XTENSA)
> +#define ASM_COMMENT_SYM "#"
> +#elif defined(CONFIG_ARM) || defined(CONFIG_ARM64)
> +#define ASM_COMMENT_SYM "@"
> +#elif defined(CONFIG_ARC) || defined(CONFIG_C6X) ||            \
> +       defined(CONFIG_CRIS) || defined(CONFIG_FRV) ||          \
> +       defined(CONFIG_H8300) || defined(CONFIG_M32R) ||        \
> +       defined(CONFIG_PARISC)
> +#define ASM_COMMENT_SYM ";"
> +#elif defined(CONFIG_BLACKFIN) || defined(CONFIG_HEXAGON) || \
> +       defined(CONFIG_IA64) || defined(CONFIG_NIOS2) ||     \
> +       defined(CONFIG_OPENRISC)
> +#define ASM_COMMENT_SYM "//"
> +#elif defined(CONFIG_METAG) || defined(CONFIG_SUPERH) ||       \
> +       defined(CONFIG_SPARC) || defined(CONFIG_TILE) ||        \
> +       defined(CONFIG_UNICORE32)
> +#define ASM_COMMENT_SYM "!"
> +#elif defined(CONFIG_M68K)
> +#define ASM_COMMENT_SYM "|"
> +#else
> +#error Symbol for ASM inline comments is not defined for ARCH
> +#endif
> +
>  #define DEFINE(sym, val) \
> -        asm volatile("\n->" #sym " %0 " #val : : "i" (val))
> +       asm volatile("\n" ASM_COMMENT_SYM "->" #sym " %0 " #val : : "i" (val))
>
> -#define BLANK() asm volatile("\n->" : : )
> +#define BLANK() asm volatile("\n" ASM_COMMENT_SYM "->" : : )
>
>  #define OFFSET(sym, str, mem) \
>         DEFINE(sym, offsetof(struct str, mem))
>
>  #define COMMENT(x) \
> -       asm volatile("\n->#" x)
> +       asm volatile("\n" ASM_COMMENT_SYM "->#" x)
>
>  #endif
> diff --git a/scripts/Makefile.asm-offsets b/scripts/Makefile.asm-offsets
> index 4ba80ba29b82..7f8d3cbc5901 100644
> --- a/scripts/Makefile.asm-offsets
> +++ b/scripts/Makefile.asm-offsets
> @@ -1,9 +1,49 @@
> +# Symbols for ASM inline comments for all architectures
> +asm_comment_sym_arch_alpha = \#
> +asm_comment_sym_arch_arc = \;
> +asm_comment_sym_arch_arm = @
> +asm_comment_sym_arch_arm64 = @
> +asm_comment_sym_arch_avr32 = \#
> +asm_comment_sym_arch_blackfin = //
> +asm_comment_sym_arch_c6x = \;
> +asm_comment_sym_arch_cris = \;
> +asm_comment_sym_arch_frv = \;
> +asm_comment_sym_arch_h8300 = \;
> +asm_comment_sym_arch_hexagon = //
> +asm_comment_sym_arch_ia64 = //
> +asm_comment_sym_arch_m32r = \;
> +asm_comment_sym_arch_m68k = |
> +asm_comment_sym_arch_metag = !
> +asm_comment_sym_arch_microblaze = \#
> +asm_comment_sym_arch_mips = \#
> +asm_comment_sym_arch_mn10300 = \#
> +asm_comment_sym_arch_nios2 = //
> +asm_comment_sym_arch_openrisc = //
> +asm_comment_sym_arch_parisc = \;
> +asm_comment_sym_arch_powerpc = \#
> +asm_comment_sym_arch_s390 = \#
> +asm_comment_sym_arch_score = \#
> +asm_comment_sym_arch_sh = !
> +asm_comment_sym_arch_sparc = !
> +asm_comment_sym_arch_tile = !
> +# Note: assumes uml_x86
> +asm_comment_sym_arch_um = \#
> +asm_comment_sym_arch_unicore32 = !
> +asm_comment_sym_arch_x86 = \#
> +asm_comment_sym_arch_xtensa = \#
> +
> +ASM_COMMENT_SYM = $(asm_comment_sym_arch_$(SRCARCH))
> +
> +ifeq ($(ASM_COMMENT_SYM),)
> +$(error Symbol for ASM inline comments is not defined for ARCH=$(SRCARCH))
> +endif
> +
>  # Default sed regexp - multiline due to syntax constraints
>  define sed-asm-offsets-to-c
> -       "/^->/{s:->#\(.*\):/* \1 */:; \
> -       s:^->\([^ ]*\) [\$$#]*\([-0-9]*\) \(.*\):#define \1 \2 /* \3 */:; \
> -       s:^->\([^ ]*\) [\$$#]*\([^ ]*\) \(.*\):#define \1 \2 /* \3 */:; \
> -       s:->::; p;}"
> +       "\:^$(ASM_COMMENT_SYM)->:{s:$(ASM_COMMENT_SYM)->#\(.*\):/* \1 */:; \
> +       s:^$(ASM_COMMENT_SYM)->\([^ ]*\) [\$$#]*\([-0-9]*\) \(.*\):#define \1 \2 /* \3 */:; \
> +       s:^$(ASM_COMMENT_SYM)->\([^ ]*\) [\$$#]*\([^ ]*\) \(.*\):#define \1 \2 /* \3 */:; \
> +       s:$(ASM_COMMENT_SYM)->::; p;}"
>  endef
>
>  define gen_header_from_asm_offsets
> --
