Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:42768 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934642AbcJ0H2l (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 27 Oct 2016 03:28:41 -0400
Date: Thu, 27 Oct 2016 09:28:24 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [RFC PATCH] kbuild: add -fno-PIE
Message-ID: <20161027072824.rt3d6wngz7lrfb7u@linutronix.de>
References: <20161021111600.9417-1-bigeasy@linutronix.de>
 <20161021212127.GA32611@angband.pl>
 <87eg37niky.fsf@turtle.gmx.de>
 <1477250598.3561.4.camel@perches.com>
 <8760oinqly.fsf@turtle.gmx.de>
 <20161024074332.uomcxyhqo6aq7vxk@linutronix.de>
 <874m41mz4h.fsf@turtle.gmx.de>
 <20161025073002.czwx2hysib77i7d5@linutronix.de>
 <87eg33kni0.fsf@turtle.gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87eg33kni0.fsf@turtle.gmx.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Joe Perches <joe@perches.com>, Adam Borowski <kilobyte@angband.pl>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, ben@decadent.org.uk, Sven Joachim <svenjoac@gmx.de>

Hi Andrew,

On 2016-10-26 19:51:03 [+0200], Sven Joachim wrote:
> On 2016-10-25 09:30 +0200, Sebastian Andrzej Siewior wrote:
> 
> > On 2016-10-24 19:32:30 [+0200], Sven Joachim wrote:
> >> On 2016-10-24 09:43 +0200, Sebastian Andrzej Siewior wrote:
> >> 
> >> > On 2016-10-24 09:38:49 [+0200], Sven Joachim wrote:
> >> >> 
> >> >> But make still fails with it. :-(
> >> >
> >> > try setting CONFIG_CC_STACKPROTECTOR_NONE=y and please let me know if
> >> > the resulting kernel built with v3.2 gcc boots & works.
> >> 
> >> Sorry, I don't have gcc 3.2 around, and my gcc 3.3 environment produces
> >> assembler errors in arch/x86/entry/entry_32.S.  Maybe binutils 2.15 is
> >> not recent enough anymore?
> 
> I have done a few more tests, and I can confirm that binutils 2.17 is
> the oldest version that works.  Also, I have succeeded installing gcc
> 3.2 in a Debian 4.0 chroot now.
> 
> > so we use stone age gcc but take latest binutils and kernel? What about
> > lifting the limit of gcc 3.2?
> 
> Would probably make sense, since gcc 3.2 cannot compile kernel/bounds.c,
> at least not on x86.
> 
> ,----
> |   CC      kernel/bounds.s
> | In file included from /tmp/linux/arch/x86/include/asm/bitops.h:512,
> |                  from include/linux/bitops.h:22,
> |                  from include/linux/kernel.h:10,
> |                  from include/asm-generic/bug.h:13,
> |                  from /tmp/linux/arch/x86/include/asm/bug.h:38,
> |                  from include/linux/bug.h:4,
> |                  from include/linux/page-flags.h:9,
> |                  from kernel/bounds.c:9:
> | /tmp/linux/arch/x86/include/asm/arch_hweight.h: In function `__arch_hweight32':
> | /tmp/linux/arch/x86/include/asm/arch_hweight.h:29: syntax error before string constant
> | make[1]: *** [kernel/bounds.s] Error 1
> `----
> 
> Building with gcc 3.3 is apparently still possible, although it produces
> tons of warnings and a modpost section mismatch.  Still, requiring gcc
> 4.1 or newer would not be unreasonable, I think (still released a few
> months earlier than binutils 2.17).

I remember you had once a server box running some enterprise distro
which had an old gcc. Do you see any reason for not lifting the minimum
gcc version to v4.1 ?

> Cheers,
>        Sven

Sebastian
