Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:35623 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932222AbeE3WAJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 30 May 2018 18:00:09 -0400
Subject: Re: [PATCH] kbuild: add machine size to CHEKCFLAGS
References: <20180530204838.22079-1-luc.vanoostenryck@gmail.com>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Message-ID: <d47b72cc-9209-a190-38b3-969870e1bf26@suse.de>
Date: Thu, 31 May 2018 00:00:03 +0200
MIME-Version: 1.0
In-Reply-To: <20180530204838.22079-1-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, "James E . J . Bottomley" <jejb@parisc-linux.org>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Brendan Higgins <brendanhiggins@google.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Cao jin <caoj.fnst@cn.fujitsu.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-mips@linux-mips.org, linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Christoph Hellwig <hch@infradead.org>, Rob Landley <rob@landley.net>

Hi Luc,

The typo in the subject made me curious...

Am 30.05.2018 um 22:48 schrieb Luc Van Oostenryck:
> By default, sparse assumes a 64bit machine when compiled on x86-64
> and 32bit when compiled on anything else.
> 
> This can of course create all sort of problems for the other archs, like
> issuing false warnings ('shift too big (32) for type unsigned long'), or
> worse, failing to emit legitimate warnings.
> 
> Fix this by adding the -m32/-m64 flag, depending on CONFIG_64BIT,
> to CHECKFLAGS in the main Makefile (and so for all archs).
> Also, remove the now unneeded -m32/-m64 in arch specific Makefiles.
> 
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  Makefile             | 3 +++
>  arch/alpha/Makefile  | 2 +-
>  arch/arm/Makefile    | 2 +-
>  arch/arm64/Makefile  | 2 +-
>  arch/ia64/Makefile   | 2 +-
>  arch/mips/Makefile   | 3 ---
>  arch/parisc/Makefile | 2 +-
>  arch/sparc/Makefile  | 2 +-
>  arch/x86/Makefile    | 2 +-
>  9 files changed, 10 insertions(+), 10 deletions(-)

What about the architectures not touched by your patch that previously
had no -m32/-m64? (arc, c6x, h8300, hexagon, m68k, microblaze, nds32,
nios2, openrisc, powerpc, riscv, s390, sh, unicore32, xtensa)

You forgot to CC them on this patch.

Have you really checked that all their toolchains support the -m32/-m64
flags you newly introduce for them? Apart from non-biarch architectures,
I'm thinking of 31-bit s390 as a corner case where !64 != 32.

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
