Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:36716 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1757097AbeEJNKj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 May 2018 09:10:39 -0400
Date: Thu, 10 May 2018 08:10:03 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v2 1/5] powerpc/kbuild: set default generic machine type for 32-bit compile
Message-ID: <20180510131002.GN17342@gate.crashing.org>
References: <20180510051659.15356-1-npiggin@gmail.com> <20180510051659.15356-2-npiggin@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180510051659.15356-2-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, linuxppc-dev@lists.ozlabs.org

On Thu, May 10, 2018 at 03:16:55PM +1000, Nicholas Piggin wrote:
> The 64-bit toolchain uses the wrong ISA variant for compiling 32-bit
> kernels, eve with -m32. Set -mcpu=powerpc which is the generic 32-bit
> powerpc machine type and scheduling model. 32-bit platforms and CPUs
> can override this with -mcpu= options that come later on the command
> line.
> 
> This fixes a lot of build failures due to incompatible assembly when
> compiling 32-bit kernel with 64-bit toolchain.

So what ISA is set for gas without this patch?  With what GCC version?
And, why is that wrong?


Segher


> +ifdef CONFIG_PPC32
> +# These options will be overridden by any -mcpu option that comes
> +# later on the command line, but they are needed to set a sane
> +# 32-bit cpu target for the 64-bit cross compiler.
> +KBUILD_CFLAGS		+= -mcpu=powerpc
> +KBUILD_AFLAGS		+= -mcpu=powerpc
> +endif
