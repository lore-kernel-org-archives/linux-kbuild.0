Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:38982 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388288AbfGWHU7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Jul 2019 03:20:59 -0400
Date: Tue, 23 Jul 2019 09:20:43 +0200
From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 2/5] x86_64, -march=native: POPCNT support
Message-ID: <20190723072043.GU3402@hirez.programming.kicks-ass.net>
References: <20190722202723.13408-1-adobriyan@gmail.com>
 <20190722202723.13408-2-adobriyan@gmail.com>
 <20190722211210.GN6698@worktop.programming.kicks-ass.net>
 <20190722211539.GA29979@avx2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190722211539.GA29979@avx2>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, linux-kernel@vger.kernel.org, x86@kernel.org, linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com, michal.lkml@markovi.net

On Tue, Jul 23, 2019 at 12:15:39AM +0300, Alexey Dobriyan wrote:
> On Mon, Jul 22, 2019 at 11:12:10PM +0200, Peter Zijlstra wrote:
> > On Mon, Jul 22, 2019 at 11:27:20PM +0300, Alexey Dobriyan wrote:
> > > Detect POPCNT instruction support and inline hweigth*() functions
> > > if it is supported by CPU.
> > > 
> > > Detect POPCNT at boot time and conditionally refuse to boot.
> > > 
> > > Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> > > ---
> > >  arch/x86/include/asm/arch_hweight.h           | 24 +++++++++++++++++++
> > >  arch/x86/include/asm/segment.h                |  1 +
> > >  arch/x86/kernel/verify_cpu.S                  |  8 +++++++
> > >  arch/x86/lib/Makefile                         |  5 +++-
> > >  .../drm/i915/display/intel_display_power.c    |  2 +-
> > >  drivers/misc/sgi-gru/grumain.c                |  2 +-
> > >  fs/btrfs/tree-checker.c                       |  4 ++--
> > >  include/linux/bitops.h                        |  2 ++
> > >  lib/Makefile                                  |  2 ++
> > >  scripts/kconfig/cpuid.c                       |  7 ++++++
> > >  scripts/march-native.sh                       |  2 ++
> > >  11 files changed, 54 insertions(+), 5 deletions(-)
> > 
> > *WHY* ?
> > 
> > AFAICT this just adds lines and complexity and wins aboslutely nothing.
> 
> If CPU is know to have POPCNT, it doesn't make sense to go through RDI.
> Additionally some CPUs (still?) have fake dependency on the destination,
> so "popcnt rax, rdi" is suboptimal.

You completely forgot to mention any of that in your Changelog, also I
doubt you can find code where this makes a measurable difference. IOW, I
still doubt it makes any kind of sense.
