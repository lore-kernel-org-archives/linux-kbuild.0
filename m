Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi1-f195.google.com ([209.85.167.195]:33521 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726962AbgBYEQr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Feb 2020 23:16:47 -0500
Date: Mon, 24 Feb 2020 21:16:43 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] Documentation/llvm: add documentation on building w/
 Clang/LLVM
Message-ID: <20200225041643.GA17425@ubuntu-m2-xlarge-x86>
References: <20200224174129.2664-1-ndesaulniers@google.com>
 <202002242003.870E5F80@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202002242003.870E5F80@keescook>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, corbet@lwn.net, masahiroy@kernel.org, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com

On Mon, Feb 24, 2020 at 08:08:26PM -0800, Kees Cook wrote:
> On Mon, Feb 24, 2020 at 09:41:28AM -0800, Nick Desaulniers wrote:
> > Added to kbuild documentation. Provides more official info on building
> > kernels with Clang and LLVM than our wiki.
> > 
> > Suggested-by: Kees Cook <keescook@chromium.org>
> > Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> >  Documentation/kbuild/index.rst |  1 +
> >  Documentation/kbuild/llvm.rst  | 80 ++++++++++++++++++++++++++++++++++
> >  2 files changed, 81 insertions(+)
> >  create mode 100644 Documentation/kbuild/llvm.rst
> > 
> > diff --git a/Documentation/kbuild/index.rst b/Documentation/kbuild/index.rst
> > index 0f144fad99a6..3882bd5f7728 100644
> > --- a/Documentation/kbuild/index.rst
> > +++ b/Documentation/kbuild/index.rst
> > @@ -19,6 +19,7 @@ Kernel Build System
> >  
> >      issues
> >      reproducible-builds
> > +    llvm
> >  
> >  .. only::  subproject and html
> >  
> > diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> > new file mode 100644
> > index 000000000000..68ae022aebc0
> > --- /dev/null
> > +++ b/Documentation/kbuild/llvm.rst
> > @@ -0,0 +1,80 @@
> > +==============================
> > +Building Linux with Clang/LLVM
> > +==============================
> > +
> > +This document covers how to build the Linux kernel with Clang and LLVM
> > +utilities.
> > +
> > +About
> > +-----
> > +
> > +The Linux kernel has always traditionally been compiled with GNU toolchains
> > +such as GCC and binutils. On going work has allowed for `Clang
> > +<https://clang.llvm.org/>`_ and `LLVM <https://llvm.org/>`_ utilities to be
> > +used as viable substitutes. Distributions such as `Android
> > +<https://www.android.com/>`_, `ChromeOS
> > +<https://www.chromium.org/chromium-os>`_, and `OpenMandriva
> > +<https://www.openmandriva.org/>`_ use Clang built kernels.  `LLVM is a
> > +collection of toolchain components implemented in terms of C++ objects
> > +<https://www.aosabook.org/en/llvm.html>`_. Clang is a front-end to LLVM that
> > +supports C and the GNU C extensions required by the kernel, and is pronounced
> > +"klang," not "see-lang."
> > +
> > +Clang
> > +-----
> > +
> > +The compiler used can be swapped out via `CC=` command line argument to `make`.
> > +`CC=` should be set when selecting a config and during a build.
> > +
> > +	make CC=clang defconfig
> > +
> > +	make CC=clang
> > +
> > +Cross Compiling
> > +---------------
> > +
> > +A single Clang compiler binary will typically contain all supported backends,
> > +which can help simplify cross compiling.
> > +
> > +	ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make CC=clang
> > +
> > +`CROSS_COMPILE` is not used to suffix the Clang compiler binary, instead
> 
> s/suffix/prefix/
> 
> > +`CROSS_COMPILE` is used to set a command line flag: `--target <triple>`. For
> > +example:
> > +
> > +	clang --target aarch64-linux-gnu foo.c
> > +
> > +LLVM Utilities
> > +--------------
> > +
> > +LLVM has substitutes for GNU binutils utilities. These can be invoked as
> > +additional parameters to `make`.
> > +
> > +	make CC=clang AS=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \\
> > +	  OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump OBJSIZE=llvm-objsize \\
> > +	  READELF=llvm-readelf HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar \\
> > +	  HOSTLD=ld.lld
> > +
> > +Getting Help
> > +------------
> > +
> > +- `Website <https://clangbuiltlinux.github.io/>`_
> > +- `Mailing List <https://groups.google.com/forum/#!forum/clang-built-linux>`_: <clang-built-linux@googlegroups.com>
> > +- `Issue Tracker <https://github.com/ClangBuiltLinux/linux/issues>`_
> > +- IRC: #clangbuiltlinux on chat.freenode.net
> > +- `Telegram <https://t.me/ClangBuiltLinux>`_: @ClangBuiltLinux
> > +- `Wiki <https://github.com/ClangBuiltLinux/linux/wiki>`_
> > +- `Beginner Bugs <https://github.com/ClangBuiltLinux/linux/issues?q=is%3Aopen+is%3Aissue+label%3A%22good+first+issue%22>`_
> > +
> > +Getting LLVM
> > +-------------
> > +
> > +- http://releases.llvm.org/download.html
> > +- https://github.com/llvm/llvm-project
> > +- https://llvm.org/docs/GettingStarted.html
> > +- https://llvm.org/docs/CMake.html
> > +- https://apt.llvm.org/
> > +- https://www.archlinux.org/packages/extra/x86_64/llvm/
> > +- https://github.com/ClangBuiltLinux/tc-build
> > +- https://github.com/ClangBuiltLinux/linux/wiki/Building-Clang-from-source
> > +- https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/
> 
> Should this also include an update to Documentation/process/changes.rst
> with the minimum version required? (I would expect this to be "9" for Clang,
> and "11" for ld.lld.)

I think the clang one should be added in a separate patch that
solidifies that in include/linux/compiler-clang.h with a CLANG_VERSION
macro and version check, like in include/linux/compiler-gcc.h.

ld.lld's minimum version should also be 9, what is the blocking issue
that makes it 11?

> Otherwise, yes, with Randy and Masahiro's suggestions, please consider it:
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>
> 
> -- 
> Kees Cook

Cheers,
Nathan
