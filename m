Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38412 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729535AbgAPWam (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Jan 2020 17:30:42 -0500
Received: by mail-pg1-f194.google.com with SMTP id a33so10637635pgm.5
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Jan 2020 14:30:40 -0800 (PST)
MIME-Version: 1.0
References: <20200115115249.27774-1-ilie.halip@gmail.com>
In-Reply-To: <20200115115249.27774-1-ilie.halip@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 16 Jan 2020 14:30:28 -0800
Message-ID: <CAKwvOdkdD9VF1k==G4vMeo4bBLarYz8gPvWfv6+N2kejeoXfjA@mail.gmail.com>
Subject: Re: [RFC PATCH] lib: move memcat_p.o to obj-y
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ilie Halip <ilie.halip@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>

On Wed, Jan 15, 2020 at 3:53 AM Ilie Halip <ilie.halip@gmail.com> wrote:
>
> The semantics of `--undefined` differ between ld.bfd and ld.lld:
>     $ echo | gcc -x c -c - -o a.o
>     $ echo "EXTERN(test)" > a.lds
>     $ ld.bfd a.o -t a.lds -o - 2>/dev/null && objdump -t | grep test
>     0000000000000000         *UND*      0000000000000000 test
>     $ ld.lld a.o -t a.lds -o - 2>/dev/null && objdump -t | grep test
>     $
>
> When building with CONFIG_STM=m, there are no in-kernel users of memcat_p()
> and ld.lld discards this symbol because it's linked in via --no-whole-archive.
> It's marked as undefined by a linker script but ld.lld discards it anyway (as
> seen in the above snippet).
>
> Work around the ld.lld behavior by moving the object file to obj-y.
>
> Signed-off-by: Ilie Halip <ilie.halip@gmail.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/515

Thanks for the patch.  This solves the observed linkage failure.
Maybe Masahiro has more input based on the discussion in the above
Link?
Tested-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  lib/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/Makefile b/lib/Makefile
> index 93217d44237f..eac343b81f77 100644
> --- a/lib/Makefile
> +++ b/lib/Makefile
> @@ -30,7 +30,7 @@ lib-y := ctype.o string.o vsprintf.o cmdline.o \
>          flex_proportions.o ratelimit.o show_mem.o \
>          is_single_threaded.o plist.o decompress.o kobject_uevent.o \
>          earlycpio.o seq_buf.o siphash.o dec_and_lock.o \
> -        nmi_backtrace.o nodemask.o win_minmax.o memcat_p.o
> +        nmi_backtrace.o nodemask.o win_minmax.o
>
>  lib-$(CONFIG_PRINTK) += dump_stack.o
>  lib-$(CONFIG_MMU) += ioremap.o
> @@ -45,7 +45,7 @@ obj-y += bcd.o sort.o parser.o debug_locks.o random32.o \
>          bsearch.o find_bit.o llist.o memweight.o kfifo.o \
>          percpu-refcount.o rhashtable.o \
>          once.o refcount.o usercopy.o errseq.o bucket_locks.o \
> -        generic-radix-tree.o
> +        generic-radix-tree.o memcat_p.o
>  obj-$(CONFIG_STRING_SELFTEST) += test_string.o
>  obj-y += string_helpers.o
>  obj-$(CONFIG_TEST_STRING_HELPERS) += test-string_helpers.o
>
> base-commit: ee02f9544ebd8d38900dfe955710897b99483686
> --
> 2.17.1
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200115115249.27774-1-ilie.halip%40gmail.com.



-- 
Thanks,
~Nick Desaulniers
