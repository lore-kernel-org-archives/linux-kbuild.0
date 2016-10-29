Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ackle.nomi.cz ([81.31.33.35]:41980 "EHLO ackle.nomi.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751816AbcJ2KTd (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 29 Oct 2016 06:19:33 -0400
Date: Sat, 29 Oct 2016 12:10:08 +0200
From: Tomas Janousek <tomi@nomi.cz>
Subject: Re: [RFC PATCH] kbuild: add -fno-PIE
Message-ID: <20161029101007.zwqv3lslbzd4urco@nomi.cz>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <874m41mz4h.fsf@turtle.gmx.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sven Joachim <svenjoac@gmx.de>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Joe Perches <joe@perches.com>, Adam Borowski <kilobyte@angband.pl>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, ben@decadent.org.uk

Hi Sven,

On Mon, Oct 24, 2016 at 07:32:30PM +0200, Sven Joachim wrote:
> The attached patch works for me with Debian's gcc-6 package.

I tried your patch when building 4.8.5 on an up-to-date Debian testing and
still got this:

  AS      arch/x86/entry/vdso/vdso32/note.o
arch/x86/entry/vdso/vdso32/note.S:1:0: sorry, unimplemented: -mfentry isn’t supported for 32-bit in combination with -fpic

Adding KBUILD_AFLAGS += $(call cc-option,-fno-pie,) helps.
(Maybe that should be as-option instead. Don't know. There are lots of
AFLAGS=$(call cc-option, ...) in the Makefiles, anyway.)

-- 
Tomáš Janoušek, a.k.a. Pivník, a.k.a. Liskni_si, http://work.lisk.in/
