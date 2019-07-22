Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:38014 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727845AbfGVVMY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 Jul 2019 17:12:24 -0400
Date: Mon, 22 Jul 2019 23:12:10 +0200
From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 2/5] x86_64, -march=native: POPCNT support
Message-ID: <20190722211210.GN6698@worktop.programming.kicks-ass.net>
References: <20190722202723.13408-1-adobriyan@gmail.com>
 <20190722202723.13408-2-adobriyan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190722202723.13408-2-adobriyan@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, linux-kernel@vger.kernel.org, x86@kernel.org, linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com, michal.lkml@markovi.net

On Mon, Jul 22, 2019 at 11:27:20PM +0300, Alexey Dobriyan wrote:
> Detect POPCNT instruction support and inline hweigth*() functions
> if it is supported by CPU.
> 
> Detect POPCNT at boot time and conditionally refuse to boot.
> 
> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> ---
>  arch/x86/include/asm/arch_hweight.h           | 24 +++++++++++++++++++
>  arch/x86/include/asm/segment.h                |  1 +
>  arch/x86/kernel/verify_cpu.S                  |  8 +++++++
>  arch/x86/lib/Makefile                         |  5 +++-
>  .../drm/i915/display/intel_display_power.c    |  2 +-
>  drivers/misc/sgi-gru/grumain.c                |  2 +-
>  fs/btrfs/tree-checker.c                       |  4 ++--
>  include/linux/bitops.h                        |  2 ++
>  lib/Makefile                                  |  2 ++
>  scripts/kconfig/cpuid.c                       |  7 ++++++
>  scripts/march-native.sh                       |  2 ++
>  11 files changed, 54 insertions(+), 5 deletions(-)

*WHY* ?

AFAICT this just adds lines and complexity and wins aboslutely nothing.
