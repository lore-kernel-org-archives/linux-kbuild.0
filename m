Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pj1-f68.google.com ([209.85.216.68]:51375 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726749AbgDFSRI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Apr 2020 14:17:08 -0400
Received: by mail-pj1-f68.google.com with SMTP id fr8so198571pjb.1
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Apr 2020 11:17:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200405163052.18942-1-masahiroy@kernel.org>
In-Reply-To: <20200405163052.18942-1-masahiroy@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 6 Apr 2020 11:16:57 -0700
Message-ID: <CAKwvOdmEcC7SszqpEYeT3v_gi89vAyDyofZaKkfF_YhEXu=E5A@mail.gmail.com>
Subject: Re: [PATCH] MIPS: fw: arc: add __weak to prom_meminit and prom_free_prom_memory
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>, clang-built-linux <clang-built-linux@googlegroups.com>, LKML <linux-kernel@vger.kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Paul Burton <paulburton@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org

On Sun, Apr 5, 2020 at 9:31 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> As far as I understood, prom_meminit() in arch/mips/fw/arc/memory.c
> is overridden by the one in arch/mips/sgi-ip32/ip32-memory.c if
> CONFIG_SGI_IP32 is enabled.

I'm curious if this issue is affected by other combinations of files
that each define prom_meminit with external linkage and symbol
visibility.  I would expect __weak to be used when there's a base
implementation that we expect to be overridden, but I don't think
that's what's happening in this case.  It's not clear to me which
definition would be the default, let alone the one in
arch/mips/fw/arc/memory.c.

Looks like CONFIG_SGI_IP32 selects CONFIG_FW_ARC, so it's not clear
why arch/mips/sgi-ip32/ip32-memory.c and arch/mips/fw/arc/memory.c
define different implementations of prom_meminit, and which one was
expected to be used.

Hopefully the maintainers can clarify.

>
> The use of EXPORT_SYMBOL in static libraries potentially causes a
> problem for the llvm linker [1]. So, I want to forcibly link lib-y
> objects to vmlinux when CONFIG_MODULES=y.
>
> As a groundwork, we must fix multiple definitions that have previously
> been hidden by lib-y.
>
> The prom_cleanup() in this file is already marked as __weak (because
> it is overridden by the one in arch/mips/sgi-ip22/ip22-mc.c).
> I think it should be OK to do the same for these two.
>
> [1]: https://github.com/ClangBuiltLinux/linux/issues/515
>
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> If MIPS maintainers ack this patch,
> I want to inser it before the following patch:
>
> https://patchwork.kernel.org/patch/11432969/
>
>  arch/mips/fw/arc/memory.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/mips/fw/arc/memory.c b/arch/mips/fw/arc/memory.c
> index dbbcddc82823..89fa6e62a3b3 100644
> --- a/arch/mips/fw/arc/memory.c
> +++ b/arch/mips/fw/arc/memory.c
> @@ -117,7 +117,7 @@ static int __init prom_memtype_classify(union linux_memtypes type)
>         return memtype_classify_arc(type);
>  }
>
> -void __init prom_meminit(void)
> +void __weak __init prom_meminit(void)
>  {
>         struct linux_mdesc *p;
>
> @@ -162,7 +162,7 @@ void __weak __init prom_cleanup(void)
>  {
>  }
>
> -void __init prom_free_prom_memory(void)
> +void __weak __init prom_free_prom_memory(void)
>  {
>         int i;
>
> --

-- 
Thanks,
~Nick Desaulniers
