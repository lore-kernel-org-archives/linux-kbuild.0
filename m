Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:44388 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965112AbeEJOwq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 May 2018 10:52:46 -0400
Date: Thu, 10 May 2018 09:52:35 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v2 1/5] powerpc/kbuild: set default generic machine type for 32-bit compile
Message-ID: <20180510145235.GP17342@gate.crashing.org>
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

So it turns out your compiler was configured with --with-cpu=power8;
it's not that GCC defaults are bad, but who built your compiler
overrode the defaults.

If the problem only happens in .S files, it might be better to put
.machine directives in those.  But your patch should work too, yes.


Segher
