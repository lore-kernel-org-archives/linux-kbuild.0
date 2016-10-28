Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:57886 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752824AbcJ1XAT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Oct 2016 19:00:19 -0400
Date: Fri, 28 Oct 2016 16:00:17 -0700
From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [RFC PATCH] kbuild: add -fno-PIE
Message-Id: <20161028160017.ebcb3a97f8e225f5f20fd874@linux-foundation.org>
In-Reply-To: <20161027072824.rt3d6wngz7lrfb7u@linutronix.de>
References: <20161021111600.9417-1-bigeasy@linutronix.de>
        <20161021212127.GA32611@angband.pl>
        <87eg37niky.fsf@turtle.gmx.de>
        <1477250598.3561.4.camel@perches.com>
        <8760oinqly.fsf@turtle.gmx.de>
        <20161024074332.uomcxyhqo6aq7vxk@linutronix.de>
        <874m41mz4h.fsf@turtle.gmx.de>
        <20161025073002.czwx2hysib77i7d5@linutronix.de>
        <87eg33kni0.fsf@turtle.gmx.de>
        <20161027072824.rt3d6wngz7lrfb7u@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Joe Perches <joe@perches.com>, Adam Borowski <kilobyte@angband.pl>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, ben@decadent.org.uk, Sven Joachim <svenjoac@gmx.de>

On Thu, 27 Oct 2016 09:28:24 +0200 Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:

> > Building with gcc 3.3 is apparently still possible, although it produces
> > tons of warnings and a modpost section mismatch.  Still, requiring gcc
> > 4.1 or newer would not be unreasonable, I think (still released a few
> > months earlier than binutils 2.17).
> 
> I remember you had once a server box running some enterprise distro
> which had an old gcc. Do you see any reason for not lifting the minimum
> gcc version to v4.1 ?

Seems OK to me.  I do have a gcc-3.4.5 for mips, sh and sparc64 sitting
around but I basically never use them and should update.

