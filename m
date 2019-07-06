Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:52738 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbfGFOQ0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Jul 2019 10:16:26 -0400
MIME-Version: 1.0
References: <patch.git-3ffb613bd7b2.your-ad-here.call-01561742434-ext-8011@work.hours>
In-Reply-To: <patch.git-3ffb613bd7b2.your-ad-here.call-01561742434-ext-8011@work.hours>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 6 Jul 2019 23:15:43 +0900
Message-ID: <CAK7LNATUL3pWPDRx7xioEpp4MgRYiB2Z=6KwJ0iznu9zDy3spw@mail.gmail.com>
Subject: Re: [PATCH] kallsyms: exclude kasan local symbols on s390
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Vasily Gorbik <gor@linux.ibm.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrey Ryabinin <aryabinin@virtuozzo.com>

On Sat, Jun 29, 2019 at 2:22 AM Vasily Gorbik <gor@linux.ibm.com> wrote:
>
> gcc asan instrumentation emits the following sequence to store frame pc
> when the kernel is built with CONFIG_RELOCATABLE:
> debug/vsprintf.s:
>         .section        .data.rel.ro.local,"aw"
>         .align  8
> .LC3:
>         .quad   .LASANPC4826@GOTOFF
> .text
>         .align  8
>         .type   number, @function
> number:
> .LASANPC4826:
>
> and in case reloc is issued for LASANPC label it also gets into .symtab
> with the same address as actual function symbol:
> $ nm -n vmlinux | grep 0000000001397150
> 0000000001397150 t .LASANPC4826
> 0000000001397150 t number
>
> In the end kernel backtraces are almost unreadable:
> [  143.748476] Call Trace:
> [  143.748484] ([<000000002da3e62c>] .LASANPC2671+0x114/0x190)
> [  143.748492]  [<000000002eca1a58>] .LASANPC2612+0x110/0x160
> [  143.748502]  [<000000002de9d830>] print_address_description+0x80/0x3b0
> [  143.748511]  [<000000002de9dd64>] __kasan_report+0x15c/0x1c8
> [  143.748521]  [<000000002ecb56d4>] strrchr+0x34/0x60
> [  143.748534]  [<000003ff800a9a40>] kasan_strings+0xb0/0x148 [test_kasan]
> [  143.748547]  [<000003ff800a9bba>] kmalloc_tests_init+0xe2/0x528 [test_kasan]
> [  143.748555]  [<000000002da2117c>] .LASANPC4069+0x354/0x748
> [  143.748563]  [<000000002dbfbb16>] do_init_module+0x136/0x3b0
> [  143.748571]  [<000000002dbff3f4>] .LASANPC3191+0x2164/0x25d0
> [  143.748580]  [<000000002dbffc4c>] .LASANPC3196+0x184/0x1b8
> [  143.748587]  [<000000002ecdf2ec>] system_call+0xd8/0x2d8
>
> Since LASANPC labels are not even unique and get into .symtab only due
> to relocs filter them out in kallsyms.
>
> Signed-off-by: Vasily Gorbik <gor@linux.ibm.com>

Applied to linux-kbuild. Thanks.




> ---
>  scripts/kallsyms.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> index e17837f1d3f2..ae6504d07fd6 100644
> --- a/scripts/kallsyms.c
> +++ b/scripts/kallsyms.c
> @@ -150,6 +150,9 @@ static int read_symbol(FILE *in, struct sym_entry *s)
>         /* exclude debugging symbols */
>         else if (stype == 'N' || stype == 'n')
>                 return -1;
> +       /* exclude s390 kasan local symbols */
> +       else if (!strncmp(sym, ".LASANPC", 8))
> +               return -1;
>
>         /* include the type field in the symbol name, so that it gets
>          * compressed together */
> --
> 2.21.0
>


-- 
Best Regards
Masahiro Yamada
