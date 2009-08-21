Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.125]:37712 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932123AbZHUUMU (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 21 Aug 2009 16:12:20 -0400
Date: Fri, 21 Aug 2009 16:12:18 -0400 (EDT)
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 00/14] kconfig: streamline distro configs for testers
In-Reply-To: <20090821195131.GE5356@elte.hu>
Message-ID: <alpine.DEB.2.00.0908211601000.30182@gandalf.stny.rr.com>
References: <20090819025634.987354707@goodmis.org> <20090821143525.GH11098@elte.hu> <alpine.DEB.2.00.0908211047160.16405@gandalf.stny.rr.com> <20090821145406.GA3659@elte.hu> <alpine.DEB.2.00.0908211200160.30182@gandalf.stny.rr.com>
 <alpine.DEB.2.00.0908211204490.30182@gandalf.stny.rr.com> <20090821162822.GA20898@elte.hu> <alpine.DEB.2.00.0908211253080.30182@gandalf.stny.rr.com> <20090821195131.GE5356@elte.hu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, Theodore Tso <tytso@mit.edu>, Arjan van de Ven <arjan@infradead.org>, Greg KH <greg@kroah.com>, "Luis R. Rodriguez" <mcgrof@gmail.com>, zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Jonathan Corbet <corbet@lwn.net>, Alan Jenkins <sourcejedi.lkml@googlemail.com>, Andi Kleen <andi@firstfloor.org>


On Fri, 21 Aug 2009, Ingo Molnar wrote:
> > OK, I'll add that to my todo list. Note, it the local config is 
> > only as good as the starting .config. That is, it never touches =y 
> > settings, because it only uses loaded modules as a base. Thus if 
> > something is set to =y it will always be set to =y.
> > 
> > What would you have in mind. Just randomly enabling modules? If we 
> > enable a "y" config then the next local*config will still keep 
> > that set.
> 
> Why - isnt local*config picking up environmental (currently running 
> kernel) properties? I.e. it would always set those things that are 
> needed - and randomize the rest. Have i misunderstood how it works?

Yes, this is a simple script. The only thing it does to find out what is 
configured is run "lsmod". Others have tried (in vain) to be able to look 
into things like lspci and lsusb to figure out what options to enable, 
just to end up with something so complex that it doesn't work.

It truly would be great to be able to have something examine the box and 
be able to enable everything that it finds. But that is not what I set out 
to do. I only wanted to disable the hundreds of modules that a distro 
gives us so I can have a streamed line config that will boot my system and 
build in a decent time.

I've been using this script since 2005 and it has worked out great. I even 
posted it after I first wrote it:

  http://lkml.org/lkml/2005/3/11/39

This seems to be a very useful tool. I don't want to prevent it from going 
further because we try to make it do too much. Lets get what we have now 
in, and then we can look at alternatives.

-- Steve

