Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.11.71.1]:50853 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753810AbeFDOL0 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Jun 2018 10:11:26 -0400
In-Reply-To: <20180530121922.22122-2-npiggin@gmail.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [v5, 1/4] powerpc/kbuild: set default generic machine type for 32-bit compile
Message-Id: <40zxgc4r2sz9s4b@ozlabs.org>
Date: Tue,  5 Jun 2018 00:11:23 +1000 (AEST)
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>, linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linuxppc-dev@lists.ozlabs.org

On Wed, 2018-05-30 at 12:19:19 UTC, Nicholas Piggin wrote:
> Some 64-bit toolchains uses the wrong ISA variant for compiling 32-bit
> kernels, even with -m32. Debian's powerpc64le is one such case, and
> that is because it is built with --with-cpu=power8.
> 
> So when cross compiling a 32-bit kernel with a 64-bit toolchain, set
> -mcpu=powerpc initially, which is the generic 32-bit powerpc machine
> type and scheduling model. CPU and platform code can override this
> with subsequent -mcpu flags if necessary.
> 
> This is not done for 32-bit toolchains otherwise it would override
> their defaults, which are presumably set appropriately for the
> environment (moreso than a 64-bit cross compiler).
> 
> This fixes a lot of build failures due to incompatible assembly when
> compiling 32-bit kernel with th Debian powerpc64le 64-bit toolchain.
> 
> Cc: Segher Boessenkool <segher@kernel.crashing.org>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/4bf4f42a2febb449a5cc5d79e7c58e

cheers
