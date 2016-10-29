Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.20]:63910 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752273AbcJ2RDz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 29 Oct 2016 13:03:55 -0400
From: Sven Joachim <svenjoac@gmx.de>
Subject: Re: [RFC PATCH] kbuild: add -fno-PIE
References: <20161021111600.9417-1-bigeasy@linutronix.de>
        <20161021212127.GA32611@angband.pl> <87eg37niky.fsf@turtle.gmx.de>
        <1477250598.3561.4.camel@perches.com> <8760oinqly.fsf@turtle.gmx.de>
        <20161024074332.uomcxyhqo6aq7vxk@linutronix.de>
        <874m41mz4h.fsf@turtle.gmx.de>
        <20161029101007.zwqv3lslbzd4urco@nomi.cz>
Date: Sat, 29 Oct 2016 19:03:30 +0200
In-Reply-To: <20161029101007.zwqv3lslbzd4urco@nomi.cz> (Tomas Janousek's
        message of "Sat, 29 Oct 2016 12:10:08 +0200")
Message-ID: <87insbnl3x.fsf@turtle.gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tomas Janousek <tomi@nomi.cz>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Joe Perches <joe@perches.com>, Adam Borowski <kilobyte@angband.pl>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, ben@decadent.org.uk

On 2016-10-29 12:10 +0200, Tomas Janousek wrote:

> On Mon, Oct 24, 2016 at 07:32:30PM +0200, Sven Joachim wrote:
>> The attached patch works for me with Debian's gcc-6 package.
>
> I tried your patch when building 4.8.5 on an up-to-date Debian testing and
> still got this:
>
>   AS      arch/x86/entry/vdso/vdso32/note.o
> arch/x86/entry/vdso/vdso32/note.S:1:0: sorry, unimplemented: -mfentry
> isn’t supported for 32-bit in combination with -fpic

I cannot reproduce that, FWIW.  Also, arch/x86/entry/vdso/Makefile seems
to explicitly filter out -mfentry from the compiler flags, but maybe I
misunderstand something.

Could you please show the exact command that's failing with "make V=1"?

> Adding KBUILD_AFLAGS += $(call cc-option,-fno-pie,) helps.
> (Maybe that should be as-option instead. Don't know. There are lots of
> AFLAGS=$(call cc-option, ...) in the Makefiles, anyway.)

This is what Ubuntu is doing, so it works at least for them, I suppose.

Cheers,
       Sven
