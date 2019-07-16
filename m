Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:51426 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbfGPMyw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jul 2019 08:54:52 -0400
Date: Tue, 16 Jul 2019 14:54:47 +0200
From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: kbuild: Fail if gold linker is detected
Message-ID: <20190716125447.GZ3402@hirez.programming.kicks-ass.net>
References: <alpine.DEB.2.21.1907161434260.1767@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1907161434260.1767@nanos.tec.linutronix.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org, "H.J. Lu" <hjl.tools@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org

On Tue, Jul 16, 2019 at 02:47:56PM +0200, Thomas Gleixner wrote:
> The gold linker has known issues of failing the build in random and
> predictible ways. H.J. stated:
> 
>   "Since building a workable kernel for different kernel configurations
>    isn't a requirement for gold, I don't recommend gold for kernel."
> 
> So instead of dealing with attempts to duct tape gold support without
> understanding the root cause, fail the build when gold is detected.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Right, life is too short to fight toolchains that aren't interested in
working.

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

> ---
>  scripts/Kconfig.include |    3 +++
>  1 file changed, 3 insertions(+)
> 
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -35,5 +35,8 @@ ld-option = $(success,$(LD) -v $(1))
>  $(error-if,$(failure,command -v $(CC)),compiler '$(CC)' not found)
>  $(error-if,$(failure,command -v $(LD)),linker '$(LD)' not found)
>  
> +# Fail if the linker is gold as it's not capable of linking the kernel proper
> +$(error-if,$(success, command -v $(LD) -v | grep -q gold), gold linker '$(LD)' not supported)
> +
>  # gcc version including patch level
>  gcc-version := $(shell,$(srctree)/scripts/gcc-version.sh $(CC))
