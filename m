Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44167 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729697AbfGVVPo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 Jul 2019 17:15:44 -0400
Date: Tue, 23 Jul 2019 00:15:39 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: [PATCH 2/5] x86_64, -march=native: POPCNT support
Message-ID: <20190722211539.GA29979@avx2>
References: <20190722202723.13408-1-adobriyan@gmail.com>
 <20190722202723.13408-2-adobriyan@gmail.com>
 <20190722211210.GN6698@worktop.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190722211210.GN6698@worktop.programming.kicks-ass.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, linux-kernel@vger.kernel.org, x86@kernel.org, linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com, michal.lkml@markovi.net

On Mon, Jul 22, 2019 at 11:12:10PM +0200, Peter Zijlstra wrote:
> On Mon, Jul 22, 2019 at 11:27:20PM +0300, Alexey Dobriyan wrote:
> > Detect POPCNT instruction support and inline hweigth*() functions
> > if it is supported by CPU.
> > 
> > Detect POPCNT at boot time and conditionally refuse to boot.
> > 
> > Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> > ---
> >  arch/x86/include/asm/arch_hweight.h           | 24 +++++++++++++++++++
> >  arch/x86/include/asm/segment.h                |  1 +
> >  arch/x86/kernel/verify_cpu.S                  |  8 +++++++
> >  arch/x86/lib/Makefile                         |  5 +++-
> >  .../drm/i915/display/intel_display_power.c    |  2 +-
> >  drivers/misc/sgi-gru/grumain.c                |  2 +-
> >  fs/btrfs/tree-checker.c                       |  4 ++--
> >  include/linux/bitops.h                        |  2 ++
> >  lib/Makefile                                  |  2 ++
> >  scripts/kconfig/cpuid.c                       |  7 ++++++
> >  scripts/march-native.sh                       |  2 ++
> >  11 files changed, 54 insertions(+), 5 deletions(-)
> 
> *WHY* ?
> 
> AFAICT this just adds lines and complexity and wins aboslutely nothing.

If CPU is know to have POPCNT, it doesn't make sense to go through RDI.
Additionally some CPUs (still?) have fake dependency on the destination,
so "popcnt rax, rdi" is suboptimal.
