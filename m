Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:43502 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753602AbdJQKy7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Oct 2017 06:54:59 -0400
Date: Tue, 17 Oct 2017 11:54:54 +0100
From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 2/4] arm64: prevent instrumentation of LL/SC atomics
Message-ID: <20171017105454.drmoezp6yaqmmczg@lakrids.cambridge.arm.com>
References: <20171016132440.38098-1-mark.rutland@arm.com>
 <20171016132440.38098-3-mark.rutland@arm.com>
 <20171017100315.GA22140@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171017100315.GA22140@arm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Will Deacon <will.deacon@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, adech.fo@gmail.com, aryabinin@virtuozzo.com, catalin.marinas@arm.com, christoffer.dall@linaro.org, dvyukov@google.com, linux-kbuild@vger.kernel.org, marc.zyngier@arm.com, yamada.masahiro@socionext.com

On Tue, Oct 17, 2017 at 11:03:15AM +0100, Will Deacon wrote:
> On Mon, Oct 16, 2017 at 02:24:38PM +0100, Mark Rutland wrote:
> > While we build the LL/SC atomics as a C object file, this does not
> > follow the AAPCS. This does not interoperate with other C code, and can
> > only be called from special wrapper assembly.
> > 
> > Bulding a kernel with CONFIG_KCOV and CONFIG_ARM64_LSE_ATOMICS results
> > in the cmopiler inserting calls to __sanitizer_cov_trace_pc within the
> 
> cmopiler

Bulding, too. ;)

> > LL/SC atomics. As __sanitizer_cov_trace_pc is built per the AAPCS, these
> > calls corrupt register values, resulting in failures at boot time.
> > 
> > Avoid this (and other similar issues) by opting out of all compiler
> > instrumentation. We can opt-in to specific instrumentation in future if
> > we want to.
> > 
> > Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will.deacon@arm.com>
> > ---
> >  arch/arm64/lib/Makefile | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm64/lib/Makefile b/arch/arm64/lib/Makefile
> > index a0abc142c92b..af77516f71b2 100644
> > --- a/arch/arm64/lib/Makefile
> > +++ b/arch/arm64/lib/Makefile
> > @@ -17,5 +17,6 @@ CFLAGS_atomic_ll_sc.o	:= -fcall-used-x0 -ffixed-x1 -ffixed-x2		\
> >  		   -fcall-saved-x10 -fcall-saved-x11 -fcall-saved-x12	\
> >  		   -fcall-saved-x13 -fcall-saved-x14 -fcall-saved-x15	\
> >  		   -fcall-saved-x18
> > +CC_INSTRUMENT_atomic_ll_sc.o := n
> 
> Does this mean we can lose the "notrace" definition of __LL_SC_INLINE
> when generating the out-of-line atomics?

Unfortunately not.

I'd missed -pg, since that isn't handled in scripts/Makefile.lib, and
doesn't seem to have a makefile-level disable.

I'll see if that can be remedied.

Thanks,
Mark.
