Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:56898 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932233AbcJXHnw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Oct 2016 03:43:52 -0400
Date: Mon, 24 Oct 2016 09:43:32 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [RFC PATCH] kbuild: add -fno-PIE
Message-ID: <20161024074332.uomcxyhqo6aq7vxk@linutronix.de>
References: <20161021111600.9417-1-bigeasy@linutronix.de>
 <20161021212127.GA32611@angband.pl>
 <87eg37niky.fsf@turtle.gmx.de>
 <1477250598.3561.4.camel@perches.com>
 <8760oinqly.fsf@turtle.gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8760oinqly.fsf@turtle.gmx.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sven Joachim <svenjoac@gmx.de>
Cc: Joe Perches <joe@perches.com>, Adam Borowski <kilobyte@angband.pl>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, ben@decadent.org.uk

On 2016-10-24 09:38:49 [+0200], Sven Joachim wrote:
> 
> But make still fails with it. :-(

try setting CONFIG_CC_STACKPROTECTOR_NONE=y and please let me know if
the resulting kernel built with v3.2 gcc boots & works.

> 
> Cheers,
>        Sven

Sebastian
