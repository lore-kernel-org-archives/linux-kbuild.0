Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:60395 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754653AbcJYHaP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Oct 2016 03:30:15 -0400
Date: Tue, 25 Oct 2016 09:30:02 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [RFC PATCH] kbuild: add -fno-PIE
Message-ID: <20161025073002.czwx2hysib77i7d5@linutronix.de>
References: <20161021111600.9417-1-bigeasy@linutronix.de>
 <20161021212127.GA32611@angband.pl>
 <87eg37niky.fsf@turtle.gmx.de>
 <1477250598.3561.4.camel@perches.com>
 <8760oinqly.fsf@turtle.gmx.de>
 <20161024074332.uomcxyhqo6aq7vxk@linutronix.de>
 <874m41mz4h.fsf@turtle.gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <874m41mz4h.fsf@turtle.gmx.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sven Joachim <svenjoac@gmx.de>
Cc: Joe Perches <joe@perches.com>, Adam Borowski <kilobyte@angband.pl>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, ben@decadent.org.uk

On 2016-10-24 19:32:30 [+0200], Sven Joachim wrote:
> On 2016-10-24 09:43 +0200, Sebastian Andrzej Siewior wrote:
> 
> > On 2016-10-24 09:38:49 [+0200], Sven Joachim wrote:
> >> 
> >> But make still fails with it. :-(
> >
> > try setting CONFIG_CC_STACKPROTECTOR_NONE=y and please let me know if
> > the resulting kernel built with v3.2 gcc boots & works.
> 
> Sorry, I don't have gcc 3.2 around, and my gcc 3.3 environment produces
> assembler errors in arch/x86/entry/entry_32.S.  Maybe binutils 2.15 is
> not recent enough anymore?

so we use stone age gcc but take latest binutils and kernel? What about
lifting the limit of gcc 3.2? Is there any use case in 2016 to use gcc
3.2 on a recent kernel except whether it still compiles or not?

Sebastian
