Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45151 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbfAQVzO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Jan 2019 16:55:14 -0500
Received: by mail-pf1-f194.google.com with SMTP id g62so5461673pfd.12
        for <linux-kbuild@vger.kernel.org>; Thu, 17 Jan 2019 13:55:13 -0800 (PST)
MIME-Version: 1.0
References: <1547706826-16833-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1547706826-16833-1-git-send-email-yamada.masahiro@socionext.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 17 Jan 2019 13:55:01 -0800
Message-ID: <CAKwvOdkzSTyiiBmpwGFj6K=1Ang6nsVVahaQstk_GkPAcyBZOg@mail.gmail.com>
Subject: Re: [RFC PATCH] kbuild: support llvm-ar
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nathan Chancellor <natechancellor@gmail.com>, Jordan Rupprecht <rupprecht@google.com>, Dmitry Golovin <dima@golovin.in>, Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, Nicholas Piggin <npiggin@gmail.com>, Michal Marek <michal.lkml@markovi.net>, LKML <linux-kernel@vger.kernel.org>

On Wed, Jan 16, 2019 at 10:34 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> I want to avoid applying this patch because this patch is ugly, and
> people are trying to fix llvm-ar. I tried the latest llvm-ar, and I
> saw some improvement, but still cannot build the kernel with it.
>
> The main reason of this post is for the record, and suggest how llvm-ar
> should work.
>
> As you may have noticed, there are two issues:
>
>  [1] llvm-ar does not recognize the 'P' option
>  [2] llvm-ar does not flatten thin archives (not fixed yet)
>
> Let me explain each of them.
>
> [1] Why is 'P' option needed for GNU ar?
>
> It may not be so clear the reason of commit 9a6cfca4f413 ("kbuild:
> thin archives use P option to ar").
>
> If two objects from different directories have the same file name,
> GNU ar may drop the one when flattening thin archives.
>
> Here is a simple test case:
>
>   $ gcc -c -x c /dev/null -o foo.o
>   $ mkdir a
>   $ gcc -c -x c /dev/null -o a/foo.o
>   $ ar rcST a/built-in.a a/foo.o
>   $ ar rcST built-in.a a/built-in.a foo.o
>   $ cat built-in.a
>   !<thin>
>   //                                              8         `
>   foo.o/
>
>   /0              0           0     0     644     944       `
>
> We expect built-in.a contains both a/foo.o and foo.o, but the former
> is lost. The 'P' option solves this.
>
>   $ rm -f built-in.a
>   $ ar rcSTP built-in.a a/built-in.a foo.o
>   $ cat built-in.a
>   !<thin>
>   //                                              16        `
>   a/foo.o/
>   foo.o/
>   /0              0           0     0     644     944       `
>   /9              0           0     0     644     944       `
>
> Interestingly, GNU ar works as expected without 'P' when the order of
> a/built-in.a and foo.o are opposite:
>
>   $ rm built-in.a
>   $ ar rcST built-in.a foo.o a/built-in.a
>   $ cat built-in.a
>   !<thin>
>   //                                              16        `
>   foo.o/
>   a/foo.o/
>   /0              0           0     0     644     944       `
>   /7              0           0     0     644     944       `
>
> Anyway, even the latest GNU toolchain works like that, so
> Kbuild does need the 'P' option.
>
> The real world example is sh.
>
>   arch/sh/kernel/cpu/fpu.c
>   arch/sh/kernel/cpu/sh2a/fpu.c
>   arch/sh/kernel/cpu/sh4/fpu.c
>   arch/sh/kernel/cpu/sh5/fpu.c
>
> [2] flattening thin archives
>
> llvm-ar cannot flatten archives.
>
> This issue was filed in the following:
>   https://bugs.llvm.org/show_bug.cgi?id=37530
>
> Its status was marked as "RESOLVED FIXED", but actually not fixed
> as of writing (Jan 17, 2019).
>
> The older version of llvm-ar worked like this:
>
>   $ rm -f built-in.a a/built-in.a
>   $ llvm-ar rcST a/built-in.a a/foo.o
>   $ llvm-ar rcST built-in.a a/built-in.a
>   $ cat built-in.a !<thin>
>   //                                              14        `
>   a/built-in.a/
>   /0              0           0     0     644     136       `
>
> Recently, two commits were pushed to the trunk.
>   [llvm-ar] Flatten thin archives.
>   [llvm-ar] Resubmit recursive thin archive test with fix for full path names and better error messages
>
> As far as I tested, the latest llvm-ar works as follows:
>
>   $ llvm-ar rcST a/built-in.a a/foo.o
>   $ llvm-ar rcST built-in.a a/built-in.a
>   $ cat built-in.a
>   !<thin>
>   //                                              8         `
>   foo.o/
>
>   /0              0           0     0     644     800       `
>
> OK, it flattens the thin archive, but the problem is it rips off
> the directory path.
>
> GNU ar works as follows:
>
>   $ ar rcST   a/built-in.a   a/foo.o
>   $ ar rcST    built-in.a a/built-in.a
>   $ cat built-in.a
>   !<thin>
>   //                                              10        `
>   a/foo.o/
>
>   /0              0           0     0     644     800       `
>
> If you use the latest llvm-ar for building the kernel, you will see
> a mysterious 'llvm-ar: error: No such file or directory.' error.
> (I think the error message could be improved because it is unclear
> what is missing.)
>
> [Workaround in this patch]
>
> Currently, llvm-ar cannot flatten thin archives correctly. So, Kbuild
> uses '$(AR) t' to expand thin archives from subdirectories, then repack
> all objects into the current directory built-in.a.
>
> The 'P' for cmd_link_l_target is unneeded because Kbuild does not
> support subdir objects for lib-y in the first place.
>
> [How to use]
>
> Pass AR=llvm-ar in the configuration and build command:
>
>  $ make AR=llvm-ar defconfig
>  $ make AR=llvm-ar
>
> Or, simply in one line:
>
>  $ make AR=llvm-ar defconfig all

Thank you Masahiro for the excellent feedback on what's missing with
llvm-ar.  I will work with Jordan (cc'ed) to sort out these remaining
issues.  I think we should do our best to fix these in llvm-ar to the
extent possible, before modifying Kbuild to support it.

>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

For the above reason;
Nacked-by: Nick Desaulniers <ndesaulniers@google.com>
to prevent this from going in before we've had time to address the
feedback from this patch in llvm-ar.  There's no rush to support
llvm-ar, so I'd like to not burden the kernel with these changes.  But
we will keep this patch in our backpocket should we determine that we
cannot meet compatibility with binutils ar.

> ---
>
> This patch can be cleanly applied to Linux 5.0-rc2 + the following:
> https://patchwork.kernel.org/patch/10761625/
> https://patchwork.kernel.org/patch/10767193/
> https://patchwork.kernel.org/patch/10767195/
> https://patchwork.kernel.org/patch/10767503/
> https://patchwork.kernel.org/patch/10767509/
>
>
>  init/Kconfig           | 3 +++
>  scripts/Makefile.build | 8 +++++++-
>  2 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index 513fa54..185274ac 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -23,6 +23,9 @@ config CLANG_VERSION
>         int
>         default $(shell,$(srctree)/scripts/clang-version.sh $(CC))
>
> +config AR_IS_LLVM
> +       def_bool $(success,$(AR) --version | head -n 1 | grep -q LLVM)
> +
>  config CC_HAS_ASM_GOTO
>         def_bool $(success,$(srctree)/scripts/gcc-goto.sh $(CC))
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index f8e2794..b866bb5 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -399,7 +399,13 @@ $(sort $(subdir-obj-y)): $(subdir-ym) ;
>  ifdef builtin-target
>
>  quiet_cmd_ar_builtin = AR      $@
> +ifdef CONFIG_AR_IS_LLVM
> +      cmd_ar_builtin = rm -f $@; $(AR) rcST$(KBUILD_ARFLAGS) $@ \
> +                      $(foreach f, $(real-prereqs), \
> +                      $(if $(filter $(subdir-obj-y), $(f)), $(shell $(AR) t $(f)), $(f)))
> +else
>        cmd_ar_builtin = rm -f $@; $(AR) rcSTP$(KBUILD_ARFLAGS) $@ $(real-prereqs)
> +endif
>
>  $(builtin-target): $(real-obj-y) FORCE
>         $(call if_changed,ar_builtin)
> @@ -427,7 +433,7 @@ ifdef lib-target
>  quiet_cmd_link_l_target = AR      $@
>
>  # lib target archives do get a symbol table and index
> -cmd_link_l_target = rm -f $@; $(AR) rcsTP$(KBUILD_ARFLAGS) $@ $(real-prereqs)
> +cmd_link_l_target = rm -f $@; $(AR) rcsT$(KBUILD_ARFLAGS) $@ $(real-prereqs)
>
>  $(lib-target): $(lib-y) FORCE
>         $(call if_changed,link_l_target)
> --
> 2.7.4
>


-- 
Thanks,
~Nick Desaulniers
