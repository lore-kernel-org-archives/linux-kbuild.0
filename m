Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-sn1nam01on0049.outbound.protection.outlook.com ([104.47.32.49]:23872
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S933004AbdKPUxW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Nov 2017 15:53:22 -0500
Date: Thu, 16 Nov 2017 23:53:00 +0300
From: Yury Norov <ynorov@caviumnetworks.com>
Subject: Re: [PATCH v2 00/18] Add support for clang LTO
Message-ID: <20171116205300.5p3vjjqouw3prr3t@yury-thinkpad>
References: <20171115213428.22559-1-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171115213428.22559-1-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Matthias Kaehlcke <mka@chromium.org>

On Wed, Nov 15, 2017 at 01:34:10PM -0800, Sami Tolvanen wrote:
> This series adds build system support for compiling the kernel with clang
> Link Time Optimization (LTO), using GNU gold with the LLVMgold plug-in
> for linking. Some background for clang's LTO support is available here:
> 
>   https://llvm.org/docs/LinkTimeOptimization.html
> 
> With -flto, clang produces LLVM bitcode instead of object files, and
> the compilation to native code happens at link time. In addition, clang
> cannot use an external assembler for inline assembly when LTO is enabled,
> which causes further compatibility issues.
> 
> The patches in this series remove intermediate linking steps when LTO is
> used, postpone processing done on object files until after the LTO link
> step, add workarounds for GNU gold incompatibilities, and address inline
> assembly incompatibilities for arm64.
> 
> These changes allow arm64 defconfig to be compiled with LTO, but other
> architectures are not enabled until compatibility issues have been
> addressed. In particular, x86 inline assembly doesn't currently compile
> with clang's integrated assembler due to this LLVM bug:
> 
>   https://bugs.llvm.org/show_bug.cgi?id=24487
> 
> Due to recent bug fixes in the toolchain, it's recommended to use clang
> 5.0 or later, and GNU gold from binutils 2.27 or later, although older
> versions may also work depending on your kernel configuration.

So, you don't guarantee that kernel will work with old compiler and
toolchain? If so, I would suggest you to add the patch that checks
their versions and disables LTO if needed.

Yury
