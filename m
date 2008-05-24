Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:52833 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756689AbYEXUs3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 24 May 2008 16:48:29 -0400
Date: Sat, 24 May 2008 13:48:15 -0700
From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [RFC PATCH] kconfig: introduce KCONFIG_* symbols for .c files
Message-Id: <20080524134815.116feb9d.akpm@linux-foundation.org>
In-Reply-To: <20080524202427.GA879@uranus.ravnborg.org>
References: <20080524192540.GA28067@uranus.ravnborg.org>
	<20080524125316.4b969936.akpm@linux-foundation.org>
	<20080524202427.GA879@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Roman Zippel <zippel@linux-m68k.org>, Jeremy Fitzhardinge <jeremy@goop.org>

On Sat, 24 May 2008 22:24:27 +0200 Sam Ravnborg <sam@ravnborg.org> wrote:

> > It could help to get us out of the occasional sticky situation, but it
> > does seem a bit risky.  What happens with Kconfig variables which are
> > just not known about at all with some .configs?
> > 
> > Silly example, one could add
> > 
> > 	if (KCONFIG_DVB_VES1820)
> > 
> > to kernel/sched.c and that would work happily until someone sets DVB=n,
> > in which case I assume KCONFIG_DVB_VES1820 doesn't get defined
> > anywhere?
> It would have helped if I had applied the correct patch...
> All boolean and tristate symbols in the konfiguration have
> their symbols defined as KCONFIG_* no matter their values.
> So KCONFIG_DVB_VES1820 would get defined.

But there are still holes - KCONFIG_ARCH_FOOTBRIDGE wouldn't be defined
on x86, for example.  Anything which is inside an `if' or inside an
if/source/endif will not be known about?  I assume?

It's all probably not a big problem in practice - we'd need to be
more-than-usually-silly to trip over things like this.

