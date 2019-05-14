Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36879 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726174AbfENWqx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 May 2019 18:46:53 -0400
Received: by mail-pg1-f196.google.com with SMTP id e6so289203pgc.4
        for <linux-kbuild@vger.kernel.org>; Tue, 14 May 2019 15:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190514224047.28505-1-natechancellor@gmail.com>
In-Reply-To: <20190514224047.28505-1-natechancellor@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 14 May 2019 15:46:40 -0700
Message-ID: <CAKwvOdk1Zr+YJc8Q5YNi+48K_ib9qJ1WPww8QWir=EWhqBaNvw@mail.gmail.com>
Subject: Re: [PATCH] objtool: Allow AR to be overridden with HOSTAR
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, Peter Zijlstra <peterz@infradead.org>, clang-built-linux <clang-built-linux@googlegroups.com>, LKML <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

.On Tue, May 14, 2019 at 3:41 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Currently, this Makefile hardcodes GNU ar, meaning that if it is not
> available, there is no way to supply a different one and the build will
> fail.
>
> $ make AR=llvm-ar CC=clang LD=ld.lld HOSTAR=llvm-ar HOSTCC=clang \
>        HOSTLD=ld.lld HOSTLDFLAGS=-fuse-ld=lld defconfig modules_prepare
> ...
>   AR       /out/tools/objtool/libsubcmd.a
> /bin/sh: 1: ar: not found
> ...
>
> Follow the logic of HOST{CC,LD} and allow the user to specify a
> different ar tool via HOSTAR (which is used elsewhere in other
> tools/ Makefiles).
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/481
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  tools/objtool/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
> index 53f8be0f4a1f..88158239622b 100644
> --- a/tools/objtool/Makefile
> +++ b/tools/objtool/Makefile
> @@ -7,11 +7,12 @@ ARCH := x86
>  endif
>
>  # always use the host compiler
> +HOSTAR ?= ar
>  HOSTCC ?= gcc
>  HOSTLD ?= ld
> +AR      = $(HOSTAR)
>  CC      = $(HOSTCC)
>  LD      = $(HOSTLD)
> -AR      = ar

+ Kbuild
Seems to match what's going on in tools/perf/Makefile.perf and
tools/build/Makefile. Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

-- 
Thanks,
~Nick Desaulniers
