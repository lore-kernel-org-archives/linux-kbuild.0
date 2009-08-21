Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:41171 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932073AbZHUQDe (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 21 Aug 2009 12:03:34 -0400
Date: Fri, 21 Aug 2009 12:03:32 -0400 (EDT)
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 00/14] kconfig: streamline distro configs for testers
In-Reply-To: <20090821145406.GA3659@elte.hu>
Message-ID: <alpine.DEB.2.00.0908211200160.30182@gandalf.stny.rr.com>
References: <20090819025634.987354707@goodmis.org> <20090821143525.GH11098@elte.hu> <alpine.DEB.2.00.0908211047160.16405@gandalf.stny.rr.com> <20090821145406.GA3659@elte.hu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, Theodore Tso <tytso@mit.edu>, Arjan van de Ven <arjan@infradead.org>, Greg KH <greg@kroah.com>, "Luis R. Rodriguez" <mcgrof@gmail.com>, zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Jonathan Corbet <corbet@lwn.net>, Alan Jenkins <sourcejedi.lkml@googlemail.com>, Andi Kleen <andi@firstfloor.org>


On Fri, 21 Aug 2009, Ingo Molnar wrote:
> * Steven Rostedt <rostedt@goodmis.org> wrote:
> > I went back to your old config and I could not reproduce it. But I'll try 
> > again with a new kernel rpm, and do the following:
> > 
> > # rpm -Uvh <some new kernel>
> > # reboot    # to that new kernel
> > $ git clone <latest-linus.git> linus.git
> > $ cd linus.git
> > $ make localyesconfig
> > 
> > and see what happens. Is this a good test for you?
> 
> Yes, of course. The whole patch-set is lovely and the sooner we put 
> this upstream the better.

OK, I found the bug. There's a dependency missing.

$ make localyesconfig
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/basic/docproc
  HOSTCC  scripts/basic/hash
using config: '/boot/config-2.6.27.25-78.2.56.fc9.x86_64'
/bin/sh: line 8: scripts/kconfig/conf: No such file or directory
make[1]: *** [localyesconfig] Error 127
make: *** [localyesconfig] Error 2

Thus the script failed to run. But the sed command that converts the '=m' 
to '=y' still ran. This gives us a distro config with all modules 
converted to built in!

I'll fix this.

Thanks,

-- Steve

