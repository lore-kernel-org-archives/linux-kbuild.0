Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:18825 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726577AbeLBCFF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 1 Dec 2018 21:05:05 -0500
MIME-Version: 1.0
References: <1543460330-2219-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1543460330-2219-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 1 Dec 2018 23:51:42 +0900
Message-ID: <CAK7LNAQN7A=P0T7ON0LvENxs6rpUqonu9S0GcQwHP6HaPt2fQA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix UML build error with CONFIG_GCC_PLUGINS
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Kees Cook <keescook@chromium.org>, Emese Revfy <re.emese@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>, X86 ML <x86@kernel.org>, linux-um@lists.infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Michal Marek <michal.lkml@markovi.net>, Richard Weinberger <richard@nod.at>, Ingo Molnar <mingo@redhat.com>, Jeff Dike <jdike@addtoit.com>

On Thu, Nov 29, 2018 at 12:01 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> UML fails to build with CONFIG_GCC_PLUGINS=y.
>
> $ make -s ARCH=um mrproper
> $ make -s ARCH=um allmodconfig
> $ make ARCH=um
>   UPD     include/generated/uapi/linux/version.h
>   WRAP    arch/x86/include/generated/uapi/asm/bpf_perf_event.h
>   WRAP    arch/x86/include/generated/uapi/asm/poll.h
>   WRAP    arch/x86/include/generated/asm/dma-contiguous.h
>   WRAP    arch/x86/include/generated/asm/early_ioremap.h
>   WRAP    arch/x86/include/generated/asm/export.h
>   WRAP    arch/x86/include/generated/asm/mcs_spinlock.h
>   WRAP    arch/x86/include/generated/asm/mm-arch-hooks.h
>   SYSTBL  arch/x86/include/generated/asm/syscalls_32.h
>   SYSHDR  arch/x86/include/generated/asm/unistd_32_ia32.h
>   SYSHDR  arch/x86/include/generated/asm/unistd_64_x32.h
>   SYSTBL  arch/x86/include/generated/asm/syscalls_64.h
>   SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h
>   SYSHDR  arch/x86/include/generated/uapi/asm/unistd_64.h
>   SYSHDR  arch/x86/include/generated/uapi/asm/unistd_x32.h
>   HOSTCC  scripts/unifdef
>   CC      arch/x86/um/user-offsets.s
> cc1: error: cannot load plugin ./scripts/gcc-plugins/cyc_complexity_plugin.so
> ./scripts/gcc-plugins/cyc_complexity_plugin.so: cannot open shared object file: No such file or directory
> cc1: error: cannot load plugin ./scripts/gcc-plugins/structleak_plugin.so
> ./scripts/gcc-plugins/structleak_plugin.so: cannot open shared object file: No such file or directory
> cc1: error: cannot load plugin ./scripts/gcc-plugins/latent_entropy_plugin.so
> ./scripts/gcc-plugins/latent_entropy_plugin.so: cannot open shared object file: No such file or directory
> cc1: error: cannot load plugin ./scripts/gcc-plugins/randomize_layout_plugin.so
> ./scripts/gcc-plugins/randomize_layout_plugin.so: cannot open shared object file: No such file or directory
> make[1]: *** [scripts/Makefile.build;119: arch/x86/um/user-offsets.s] Error 1
> make: *** [arch/um/Makefile;152: arch/x86/um/user-offsets.s] Error 2
>
> Change the order of the preparation stage (with cleanups) to make sure
> gcc-plugins is built before descending to arch/x86/um/.
>
> Reported-by: kbuild test robot <lkp@intel.com>
> Fixes: 6b90bd4ba40b ("GCC plugin infrastructure")
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---


Applied to linux-kbuild.


>
> I will pick up this to kbuild tree to avoid conflicts.
> Ack from UML people is appreciated, though.
>
>
-- 
Best Regards
Masahiro Yamada
