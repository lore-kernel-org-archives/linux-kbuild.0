Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f196.google.com ([209.85.214.196]:44953 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729077AbgDFPxi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Apr 2020 11:53:38 -0400
Received: by mail-pl1-f196.google.com with SMTP id h11so6061123plr.11
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Apr 2020 08:53:37 -0700 (PDT)
Date: Mon, 6 Apr 2020 08:53:35 -0700
From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] kbuild: mkcompile_h: Include $LD version in /proc/version
Message-ID: <202004060851.CCB538AD1@keescook>
References: <202004020117.6E434C035@keescook>
 <CA+icZUW0R9LDGJ1YjJAB2oWkcEQxCO79xYmdVEoh=P8Fy_AL1A@mail.gmail.com>
 <CA+icZUVowLVpAxiWw=FJHfQ38KtU7AXXkVnw46D2XLM41-NCEA@mail.gmail.com>
 <CAK7LNAQ6ji3=2+7R1DL7eFveH7L7No6e3XkqfqgiH5QFyQj==A@mail.gmail.com>
 <CA+icZUV3rhvmBv91KMKCgvGSvJUoWDVfaV+08eC-kTMdThRn6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+icZUV3rhvmBv91KMKCgvGSvJUoWDVfaV+08eC-kTMdThRn6w@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Clang-Built-Linux ML <clang-built-linux@googlegroups.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Apr 06, 2020 at 12:35:35PM +0200, Sedat Dilek wrote:
> On Sun, Apr 5, 2020 at 3:56 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Sun, Apr 5, 2020 at 8:23 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > >
> > > On Thu, Apr 2, 2020 at 4:24 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > > >
> > > > On Thu, Apr 2, 2020 at 10:18 AM Kees Cook <keescook@chromium.org> wrote:
> > > > >
> > > > > When doing Clang builds of the kernel, it is possible to link with
> > > > > either ld.bfd (binutils) or ld.lld (LLVM), but it is not possible to
> > > > > discover this from a running kernel. Add the "$LD -v" output to
> > > > > /proc/version.
> > > > >
> > > > > Signed-off-by: Kees Cook <keescook@chromium.org>
> > > >
> > >
> > > Please feel free and add:
> > >
> > > Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>
> > > Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
> >
> >
> > Thanks.
> >
> > I collected all Reviewed-by and Tested-by.
> >
> 
> How to test scripts/mkcompile_h?

There's probably a better way, but I do:

$ rm include/generated/compile.h init/version.o
$ make init/version.o
$ cat include/generated/compile.h

-Kees

> 
> I did:
> 
> $ cd /path/to/linux
> 
> $ head -10 scripts/mkcompile_h
> #!/bin/sh
> # SPDX-License-Identifier: GPL-2.0
> 
> TARGET=$1
> ARCH=$2
> SMP=$3
> PREEMPT=$4
> PREEMPT_RT=$5
> CC=$6
> LD=$7
> 
> $ scripts/mkcompile_h include/generated/compile.h x86_64 SMP "" ""
> clang-10 ld.lld-10
>   UPD     include/generated/compile.h
> 
> $ cat include/generated/compile.h
> /* This file is auto generated, version 1 */
> /* SMP */
> #define UTS_MACHINE "x86_64"
> #define UTS_VERSION "#1 SMP Mon Apr 6 12:29:53 CEST 2020"
> #define LINUX_COMPILE_BY "dileks"
> #define LINUX_COMPILE_HOST "iniza"
> #define LINUX_COMPILER "clang version 10.0.0-2, LLD 10.0.0"
> 
> This is with clang-10 and ld.lld-10 from Debian/unstable:
> 
> $ clang-10 -v
> clang version 10.0.0-2
> Target: x86_64-pc-linux-gnu
> Thread model: posix
> InstalledDir: /usr/bin
> Found candidate GCC installation: /usr/bin/../lib/gcc/x86_64-linux-gnu/10
> Found candidate GCC installation: /usr/bin/../lib/gcc/x86_64-linux-gnu/8
> Found candidate GCC installation: /usr/bin/../lib/gcc/x86_64-linux-gnu/9
> Found candidate GCC installation: /usr/lib/gcc/x86_64-linux-gnu/10
> Found candidate GCC installation: /usr/lib/gcc/x86_64-linux-gnu/8
> Found candidate GCC installation: /usr/lib/gcc/x86_64-linux-gnu/9
> Selected GCC installation: /usr/bin/../lib/gcc/x86_64-linux-gnu/10
> Candidate multilib: .;@m64
> Candidate multilib: 32;@m32
> Candidate multilib: x32;@mx32
> Selected multilib: .;@m64
> 
> $ ld.lld-10 -v
> LLD 10.0.0 (compatible with GNU linkers)
> 
> Thanks.
> 
> - sed@ -

-- 
Kees Cook
