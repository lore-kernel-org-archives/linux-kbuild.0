Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.125]:53522 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932384AbZHUOuP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 21 Aug 2009 10:50:15 -0400
Date: Fri, 21 Aug 2009 10:50:15 -0400 (EDT)
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 00/14] kconfig: streamline distro configs for testers
In-Reply-To: <20090821143525.GH11098@elte.hu>
Message-ID: <alpine.DEB.2.00.0908211047160.16405@gandalf.stny.rr.com>
References: <20090819025634.987354707@goodmis.org> <20090821143525.GH11098@elte.hu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, Theodore Tso <tytso@mit.edu>, Arjan van de Ven <arjan@infradead.org>, Greg KH <greg@kroah.com>, "Luis R. Rodriguez" <mcgrof@gmail.com>, zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Jonathan Corbet <corbet@lwn.net>, Alan Jenkins <sourcejedi.lkml@googlemail.com>, Andi Kleen <andi@firstfloor.org>


On Fri, 21 Aug 2009, Ingo Molnar wrote:
> 
> btw., the way i tested this in the past (and which i dont have time 
> to test right now) is that i took a plain Fedora box with a regular 
> rpm kernel booted up and typed:
> 
> 	make localyesconfig
> 
> and built it and then 1) checked the size of the .config (it should 
> be much smaller than allyesconfig) and 2) tried to boot the 
> resulting bzImage.

Did you check the size without the # comments?

> 
> It either didnt boot in the past, or had a very large .config. It 
> would be nice if you could check whether it does on a box of yours. 
> (maybe you already did that!)

I went back to your old config and I could not reproduce it. But I'll try 
again with a new kernel rpm, and do the following:

# rpm -Uvh <some new kernel>
# reboot    # to that new kernel
$ git clone <latest-linus.git> linus.git
$ cd linus.git
$ make localyesconfig

and see what happens. Is this a good test for you?

Thanks,

-- Steve

