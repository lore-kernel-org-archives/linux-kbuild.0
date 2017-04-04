Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f174.google.com ([209.85.223.174]:34303 "EHLO
        mail-io0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754167AbdDDTOl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Apr 2017 15:14:41 -0400
Received: by mail-io0-f174.google.com with SMTP id b140so102347133iof.1
        for <linux-kbuild@vger.kernel.org>; Tue, 04 Apr 2017 12:14:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1491295954-124682-1-git-send-email-chao.p.peng@linux.intel.com>
References: <1491295954-124682-1-git-send-email-chao.p.peng@linux.intel.com>
From: Kees Cook <keescook@chromium.org>
Date: Tue, 4 Apr 2017 12:14:39 -0700
Message-ID: <CAGXu5jJH8s6sRn32zf2=WtDxrczTSxgCcT7iwoK7FDF3LEyF5w@mail.gmail.com>
Subject: Re: [PATCH v2] x86/boot: Support uncompressed kernel
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "x86@kernel.org" <x86@kernel.org>, Michal Marek <mmarek@suse.com>, Yinghai Lu <yinghai@kernel.org>, Baoquan He <bhe@redhat.com>, Jiri Kosina <jkosina@suse.cz>, "H.J. Lu" <hjl.tools@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Masahiro Yamada <yamada.masahiro@socionext.com>, Borislav Petkov <bp@suse.de>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Petr Mladek <pmladek@suse.com>, "David S. Miller" <davem@davemloft.net>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Andy Lutomirski <luto@kernel.org>, Thomas Garnier <thgarnie@google.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Tejun Heo <tj@kernel.org>, Daniel Mack <daniel@zonque.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Helge Deller <deller@gmx.de>, Rik van Riel <riel@redhat.com>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Tue, Apr 4, 2017 at 1:52 AM, Chao Peng <chao.p.peng@linux.intel.com> wrote:
> Compressed kernel has its own drawback: decompressing takes time. Even
> though the time is short enough to ignore for most cases but for cases when
> time is critical decompressing time still matters.
>
> The patch adds a 'CONFIG_KERNEL_RAW' configure choice so the built binary
> can have no decompressing at all. The experiment shows:
>
>     kernel               kernel size    time in decompress_kernel
>     compressed (gzip)    3.3M           53ms
>     compressed (lz4)     4.5M           16ms
>     uncompressed         14M            2ms
>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> ---
> v2:
>   * add HAVE_KERNEL_RAW
>   * decode ELF kernel in place instead of getting another copy
>   * minor comment fix
> ---
>  arch/x86/Kconfig                  |  1 +
>  arch/x86/boot/compressed/Makefile |  3 +++
>  arch/x86/boot/compressed/misc.c   | 18 +++++++++++++-----
>  init/Kconfig                      | 13 ++++++++++++-
>  scripts/Makefile.lib              |  8 ++++++++
>  5 files changed, 37 insertions(+), 6 deletions(-)
>
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index cc98d5a..207695c 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -142,6 +142,7 @@ config X86
>         select HAVE_KERNEL_LZ4
>         select HAVE_KERNEL_LZMA
>         select HAVE_KERNEL_LZO
> +       select HAVE_KERNEL_RAW
>         select HAVE_KERNEL_XZ
>         select HAVE_KPROBES
>         select HAVE_KPROBES_ON_FTRACE
> diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
> index 44163e8..ed366e1 100644
> --- a/arch/x86/boot/compressed/Makefile
> +++ b/arch/x86/boot/compressed/Makefile
> @@ -120,6 +120,8 @@ $(obj)/vmlinux.relocs: vmlinux FORCE
>  vmlinux.bin.all-y := $(obj)/vmlinux.bin
>  vmlinux.bin.all-$(CONFIG_X86_NEED_RELOCS) += $(obj)/vmlinux.relocs
>
> +$(obj)/vmlinux.bin.raw: $(vmlinux.bin.all-y) FORCE
> +       $(call if_changed,raw)
>  $(obj)/vmlinux.bin.gz: $(vmlinux.bin.all-y) FORCE
>         $(call if_changed,gzip)
>  $(obj)/vmlinux.bin.bz2: $(vmlinux.bin.all-y) FORCE
> @@ -133,6 +135,7 @@ $(obj)/vmlinux.bin.lzo: $(vmlinux.bin.all-y) FORCE
>  $(obj)/vmlinux.bin.lz4: $(vmlinux.bin.all-y) FORCE
>         $(call if_changed,lz4)
>
> +suffix-$(CONFIG_KERNEL_RAW)    := raw
>  suffix-$(CONFIG_KERNEL_GZIP)   := gz
>  suffix-$(CONFIG_KERNEL_BZIP2)  := bz2
>  suffix-$(CONFIG_KERNEL_LZMA)   := lzma
> diff --git a/arch/x86/boot/compressed/misc.c b/arch/x86/boot/compressed/misc.c
> index b3c5a5f0..9791ca9 100644
> --- a/arch/x86/boot/compressed/misc.c
> +++ b/arch/x86/boot/compressed/misc.c
> @@ -51,6 +51,10 @@
>  static int vidport;
>  static int lines, cols;
>
> +#ifdef CONFIG_KERNEL_RAW
> +#include <linux/decompress/mm.h>
> +#endif
> +
>  #ifdef CONFIG_KERNEL_GZIP
>  #include "../../../../lib/decompress_inflate.c"
>  #endif
> @@ -265,7 +269,7 @@ static inline void handle_relocations(void *output, unsigned long output_len,
>  { }
>  #endif
>
> -static void parse_elf(void *output)
> +static void parse_elf(void* buf, void *output)

I think "buf" is too generic a name here. "input" would be better, IMO.

>  {
>  #ifdef CONFIG_X86_64
>         Elf64_Ehdr ehdr;
> @@ -277,7 +281,7 @@ static void parse_elf(void *output)
>         void *dest;
>         int i;
>
> -       memcpy(&ehdr, output, sizeof(ehdr));
> +       memcpy(&ehdr, buf, sizeof(ehdr));
>         if (ehdr.e_ident[EI_MAG0] != ELFMAG0 ||
>            ehdr.e_ident[EI_MAG1] != ELFMAG1 ||
>            ehdr.e_ident[EI_MAG2] != ELFMAG2 ||
> @@ -292,7 +296,7 @@ static void parse_elf(void *output)
>         if (!phdrs)
>                 error("Failed to allocate space for phdrs");
>
> -       memcpy(phdrs, output + ehdr.e_phoff, sizeof(*phdrs) * ehdr.e_phnum);
> +       memcpy(phdrs, buf + ehdr.e_phoff, sizeof(*phdrs) * ehdr.e_phnum);
>
>         for (i = 0; i < ehdr.e_phnum; i++) {
>                 phdr = &phdrs[i];
> @@ -305,7 +309,7 @@ static void parse_elf(void *output)
>  #else
>                         dest = (void *)(phdr->p_paddr);
>  #endif
> -                       memmove(dest, output + phdr->p_offset, phdr->p_filesz);
> +                       memmove(dest, buf + phdr->p_offset, phdr->p_filesz);

With the renaming from "buf" to "input" this becomes much more
comprehensible: the PT_LOAD segments from "input" are loaded into
"output". However, does this mean that the RAW load uses parse_elf to
move the kernel into place? Does this happen safely? If it's already
safe, shouldn't we not need "input" at all, and leave this as-is, like
how the decompressed kernel operate?

>                         break;
>                 default: /* Ignore other PT_* */ break;
>                 }
> @@ -401,10 +405,14 @@ asmlinkage __visible void *extract_kernel(void *rmode, memptr heap,
>                 error("Destination virtual address changed when not relocatable");
>  #endif
>
> +#ifdef CONFIG_KERNEL_RAW
> +       parse_elf(input_data, output);
> +#else
>         debug_putstr("\nDecompressing Linux... ");
>         __decompress(input_data, input_len, NULL, NULL, output, output_len,
>                         NULL, error);
> -       parse_elf(output);
> +       parse_elf(output, output);
> +#endif

We should continue to avoid #ifdef blocks like this when possible. I'd
recommended C-style:

if (!IS_ENABLED(CONFIG_KERNEL_RAW)) {
       debug_putstr("\nDecompressing Linux... ");
       __decompress(input_data, input_len, NULL, NULL, output, output_len,
                       NULL, error);
} else
    output = input_data;
parse_elf(output);

>         handle_relocations(output, output_len, virt_addr);
>         debug_putstr("done.\nBooting the kernel.\n");
>         return output;
> diff --git a/init/Kconfig b/init/Kconfig
> index a92f27d..b8926bb 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -109,6 +109,9 @@ config LOCALVERSION_AUTO
>
>           which is done within the script "scripts/setlocalversion".)
>
> +config HAVE_KERNEL_RAW
> +       bool
> +
>  config HAVE_KERNEL_GZIP
>         bool
>
> @@ -130,7 +133,7 @@ config HAVE_KERNEL_LZ4
>  choice
>         prompt "Kernel compression mode"
>         default KERNEL_GZIP
> -       depends on HAVE_KERNEL_GZIP || HAVE_KERNEL_BZIP2 || HAVE_KERNEL_LZMA || HAVE_KERNEL_XZ || HAVE_KERNEL_LZO || HAVE_KERNEL_LZ4
> +       depends on HAVE_KERNEL_RAW || HAVE_KERNEL_GZIP || HAVE_KERNEL_BZIP2 || HAVE_KERNEL_LZMA || HAVE_KERNEL_XZ || HAVE_KERNEL_LZO || HAVE_KERNEL_LZ4
>         help
>           The linux kernel is a kind of self-extracting executable.
>           Several compression algorithms are available, which differ
> @@ -149,6 +152,14 @@ choice
>
>           If in doubt, select 'gzip'
>
> +config KERNEL_RAW
> +       bool "RAW"
> +       depends on HAVE_KERNEL_RAW
> +       help
> +         No compression. It creates much bigger kernel and uses much more
> +         space (disk/memory) than other choices. It can be useful when
> +         decompression speed is the most concern while space matters less.
> +
>  config KERNEL_GZIP
>         bool "Gzip"
>         depends on HAVE_KERNEL_GZIP
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 0a07f90..8a8f9a9 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -357,6 +357,14 @@ cmd_lz4 = (cat $(filter-out FORCE,$^) | \
>         lz4c -l -c1 stdin stdout && $(call size_append, $(filter-out FORCE,$^))) > $@ || \
>         (rm -f $@ ; false)
>
> +# RAW
> +# ---------------------------------------------------------------------------
> +quiet_cmd_raw = RAW     $@
> +cmd_raw = (cat $(filter-out FORCE,$^) && \
> +       $(call size_append, $(filter-out FORCE,$^))) > $@ || \
> +       (rm -f $@ ; false)
> +
> +
>  # U-Boot mkimage
>  # ---------------------------------------------------------------------------
>
> --
> 1.8.3.1
>

-Kees

-- 
Kees Cook
Pixel Security
