Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728004AbgGECnW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Jul 2020 22:43:22 -0400
Date: Sat, 4 Jul 2020 19:43:18 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] kbuild: Allow Clang global merging if !MODULES
Message-ID: <20200705024318.GA433@Ryzen-9-3900X.localdomain>
References: <20200702233929.181409-1-danny@kdrag0n.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200702233929.181409-1-danny@kdrag0n.dev>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Danny Lin <danny@kdrag0n.dev>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com

Hi Danny,

On Thu, Jul 02, 2020 at 04:39:29PM -0700, Danny Lin wrote:
> The old reasoning for disabling Clang's global merging optimization is
> that it breaks modpost by coalescing many symbols into _MergedGlobals.
> However, modpost is only used in builds with dynamic modules;
> vmlinux.symvers is still created during standalone builds, but it's
> effectively just an empty dummy file.
> 
> Enabling the optimization whenever possible allows us to reap the
> benefits of reduced register pressure when many global variables are
> used in the same function.

Have you run into any place within the kernel that this is the case or
this more of a "could help if this ever happens" type of deal?

> An x86 defconfig kernel built with this optimization boots fine in qemu,
> and a downstream 4.14 kernel has been used on arm64 for nearly a year
> without any issues caused by this optimization.

If I am reading LLVM's source correctly, this option only seems relevant
for ARM and AArch64?

$ rg --no-heading createGlobalMergePass
llvm/lib/CodeGen/GlobalMerge.cpp:679:Pass *llvm::createGlobalMergePass(const TargetMachine *TM, unsigned Offset,
llvm/lib/Target/AArch64/AArch64TargetMachine.cpp:524:    addPass(createGlobalMergePass(TM, 4095, OnlyOptimizeForSize,
llvm/lib/Target/ARM/ARMTargetMachine.cpp:456:    addPass(createGlobalMergePass(TM, 127, OnlyOptimizeForSize,
llvm/include/llvm/CodeGen/Passes.h:419:  Pass *createGlobalMergePass(const TargetMachine *TM, unsigned MaximalOffset,

Otherwise, I think this is probably okay. According to [1], when the
optimization level is less than -O3, we get a less aggressive version of
this optimization level, which is good for code size:

https://github.com/llvm/llvm-project/commit/8207641251706ea808df6d2a1ea8f87b8ee04c6d

However, we do potentially get merging of extern globals if we do not
specify -mglobal-merge (if I am reading the source correctly), which
this commit claims might hurt performance? Not sure if there is any way
to test or verify that?

https://github.com/llvm/llvm-project/commit/de73404b8c4332190750537eb93ce0d5b6451300

> Signed-off-by: Danny Lin <danny@kdrag0n.dev>
> ---
>  Makefile | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index a60c98519c37..f04c3639cf61 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -772,10 +772,13 @@ ifdef CONFIG_CC_IS_CLANG
>  KBUILD_CPPFLAGS += -Qunused-arguments
>  KBUILD_CFLAGS += -Wno-format-invalid-specifier
>  KBUILD_CFLAGS += -Wno-gnu
> +
> +ifdef CONFIG_MODULES
>  # CLANG uses a _MergedGlobals as optimization, but this breaks modpost, as the
>  # source of a reference will be _MergedGlobals and not on of the whitelisted names.
>  # See modpost pattern 2
>  KBUILD_CFLAGS += -mno-global-merge
> +endif
>  else
>  
>  # These warnings generated too much noise in a regular build.
> -- 
> 2.27.0
> 

Cheers,
Nathan
