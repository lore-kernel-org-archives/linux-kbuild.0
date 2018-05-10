Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:56170 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965664AbeEJO37 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 May 2018 10:29:59 -0400
Date: Thu, 10 May 2018 09:29:48 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v2 1/5] powerpc/kbuild: set default generic machine type for 32-bit compile
Message-ID: <20180510142947.GO17342@gate.crashing.org>
References: <20180510051659.15356-1-npiggin@gmail.com> <20180510051659.15356-2-npiggin@gmail.com> <20180510131002.GN17342@gate.crashing.org> <20180510232440.7374071f@roar.ozlabs.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180510232440.7374071f@roar.ozlabs.ibm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, linuxppc-dev@lists.ozlabs.org

On Thu, May 10, 2018 at 11:24:40PM +1000, Nicholas Piggin wrote:
> On Thu, 10 May 2018 08:10:03 -0500
> Segher Boessenkool <segher@kernel.crashing.org> wrote:
> > On Thu, May 10, 2018 at 03:16:55PM +1000, Nicholas Piggin wrote:
> > > The 64-bit toolchain uses the wrong ISA variant for compiling 32-bit
> > > kernels, eve with -m32. Set -mcpu=powerpc which is the generic 32-bit
> > > powerpc machine type and scheduling model. 32-bit platforms and CPUs
> > > can override this with -mcpu= options that come later on the command
> > > line.
> > > 
> > > This fixes a lot of build failures due to incompatible assembly when
> > > compiling 32-bit kernel with 64-bit toolchain.  
> > 
> > So what ISA is set for gas without this patch?  With what GCC version?
> 
> I'm not sure, how do I find that out?

gcc --version
gcc -v <rest of command>, look at the command line options passed to as
make something.s, look at what .machine is set (if any).


> > And, why is that wrong?
> 
> Some 32-bit platforms and CPU types do not provide -mcpu, so I assume
> for 32-bit toolchains that must result in the "powerpc" machine. With

It results in whatever is the default for that toolchain.  Depends on
many things.

> 64-bit toolchains 
> 
> arch/powerpc/mm/hash_low_32.S:353: Error: missing operand
> 
> Which is,
> 
>         tlbie   r4
> 
> Is that v2.06?

The original ISA did not have the L field, 2.xx does, for any xx even I think.


Segher
