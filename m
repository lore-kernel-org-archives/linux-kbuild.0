Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:37806 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756998AbeEJNYz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 May 2018 09:24:55 -0400
Received: by mail-pg0-f66.google.com with SMTP id a13-v6so976215pgu.4
        for <linux-kbuild@vger.kernel.org>; Thu, 10 May 2018 06:24:55 -0700 (PDT)
Date: Thu, 10 May 2018 23:24:40 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 1/5] powerpc/kbuild: set default generic machine type
 for 32-bit compile
Message-ID: <20180510232440.7374071f@roar.ozlabs.ibm.com>
In-Reply-To: <20180510131002.GN17342@gate.crashing.org>
References: <20180510051659.15356-1-npiggin@gmail.com>
        <20180510051659.15356-2-npiggin@gmail.com>
        <20180510131002.GN17342@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, linuxppc-dev@lists.ozlabs.org

On Thu, 10 May 2018 08:10:03 -0500
Segher Boessenkool <segher@kernel.crashing.org> wrote:

> On Thu, May 10, 2018 at 03:16:55PM +1000, Nicholas Piggin wrote:
> > The 64-bit toolchain uses the wrong ISA variant for compiling 32-bit
> > kernels, eve with -m32. Set -mcpu=powerpc which is the generic 32-bit
> > powerpc machine type and scheduling model. 32-bit platforms and CPUs
> > can override this with -mcpu= options that come later on the command
> > line.
> > 
> > This fixes a lot of build failures due to incompatible assembly when
> > compiling 32-bit kernel with 64-bit toolchain.  
> 
> So what ISA is set for gas without this patch?  With what GCC version?

I'm not sure, how do I find that out?

> And, why is that wrong?

Some 32-bit platforms and CPU types do not provide -mcpu, so I assume
for 32-bit toolchains that must result in the "powerpc" machine. With
64-bit toolchains 

arch/powerpc/mm/hash_low_32.S:353: Error: missing operand

Which is,

        tlbie   r4

Is that v2.06?

Thanks,
Nick
