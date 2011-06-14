Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from iolanthe.rowland.org ([192.131.102.54]:45173 "HELO
	iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753100Ab1FNT1s (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 14 Jun 2011 15:27:48 -0400
Date: Tue, 14 Jun 2011 15:27:47 -0400 (EDT)
From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: generate one module from multiple object files (was: Re: [PATCH
 2/2] usb: gadget: convert all users to the new udc)
In-Reply-To: <20110614172859.GS2353@legolas.emea.dhcp.ti.com>
Message-ID: <Pine.LNX.4.44L0.1106141453420.2102-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Felipe Balbi <balbi@ti.com>
Cc: Arnaud Lacombe <lacombar@gmail.com>, Michal Nazarewicz <mina86@mina86.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Greg KH <greg@kroah.com>, Linux USB Mailing List <linux-usb@vger.kernel.org>, linux-kbuild@vger.kernel.org

On Tue, 14 Jun 2011, Felipe Balbi wrote:

> On Tue, Jun 14, 2011 at 01:06:16PM -0400, Alan Stern wrote:
> > On Tue, 14 Jun 2011, Felipe Balbi wrote:
> > 
> > > > --- a/drivers/usb/gadget/Makefile
> > > > +++ b/drivers/usb/gadget/Makefile
> > > > @@ -34,6 +34,12 @@ obj-$(CONFIG_USB_FUSB300)    += fusb300_udc.o
> > > >  # USB gadget drivers
> > > >  #
> > > >  g_zero-y                       := zero.o
> > > > +g_zero-y                       += composite.o
> > > > +g_zero-y                       += usbstring.o
> > > > +g_zero-y                       += config.o
> > > > +g_zero-y                       += epautoconf.o
> > > > +g_zero-y                       += f_sourcesink.o
> > > > +g_zero-y                       += f_loopback.o
> > > 
> > > yes, you can do that. But the problem is the runtime memory footprint
> > > that we will have with that. At least that was the reason why Greg had
> > > asked Dave to change it to how it is done now.
> > 
> > What exactly is the runtime memory footprint problem?  I thought the
> > whole reason for #include'ing .c files was that back then, the kbuild
> > system wasn't able to do this.
> 
> not at all. Kbuild has always been able to generate one module from
> several objects. But then we need to remove "static" from many
> functions to achieve that.

If you insist on building an object from multiple source files with
separate compilation, the price you pay is making symbols non-static.  
That's what we have .h files for.  And that's also why the [eou]hci-hcd
drivers use the same trick of #include'ing various .c files.  I really
don't know why people object to this idiom.  (Note that if the object 
is a module, non-static symbols don't matter.  It's an issue only when 
the object is linked into the main kernel.)

> AFAICT, gcc --combine will really combine the files as if they were one,
> pretty much the same as including the entire C source.
> 
> Just look at the rationale from the commit log itself:
> 
> commit 4e9ba518ec19c6c961bf6074ec05ae1a927230bc
> Author: David Brownell <dbrownell@users.sourceforge.net>
> Date:   Mon Aug 18 17:41:02 2008 -0700

Much as I admired David's work, he could sometimes be a little 
difficult to understand.

>     usb gadget: link fixes for serial gadget
>     
>     Change how the serial gadget driver builds:  don't use
>     separate compilation, since it works poorly when key parts
>     are library code (with init sections etc).  Instead be as

"works poorly" how?  That is, what goes wrong when you try to use 
separate compilation?

>     close as we can to "gcc --combine ...".
> 
>     Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
>     Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>
> 
> part of it is also in any gadget driver:
> 
> /*
>  * Kbuild is not very cooperative with respect to linking separately
>  * compiled library objects into one module.  So for now we won't use

(I assume this doesn't use the word "library" in a significant sense.  
It isn't referring to static-link .a library archives, for instance.)

In what way is kbuild uncooperative?  You said above that kbuild has 
always been able to build modules from separately-compiled objects.

>  * separate compilation ... ensuring init/exit sections work to shrink
>  * the runtime footprint, and giving us at least some parts of what
>  * a "gcc --combine ... part1.c part2.c part3.c ... " build would.
>  */

Is the use of init sections the problem?  I don't see why it should 
be.  If you link multiple objects into a single module, all the init 
code should go into a single section.  Plenty of drivers throughout the 
kernel do this successfully.  In fact, g_serial did before David's 
patch, didn't it?

> you can find all such commits by:
> 
> $ git log --author="David Brownell" --grep="link fixes" -- drivers/usb/gadget/
> 
> And here are the original discussions:
> 
> http://marc.info/?l=linux-usb&m=121868805717787&w=2
> http://marc.info/?l=linux-usb&m=121875765411492&w=2

The problem Greg faced was that he tried to put all the library code 
into a separate module.  This clearly leads to potential problems.  
Suppose module A contains library code in an init section, which is 
used by the init code in module B.  When A is finished loading, its 
init code is jettisoned.  Then when B loads and tries to call that 
code, the system crashes.

It's not clear why single compilation saves space.  The difference
wasn't tremendous -- in David's g_serial test case
(http://marc.info/?l=linux-usb&m=121875765411492&w=2), 42 bytes were
saved out of 20000.  And the savings was almost entirely in data and
bss; you'd have to do some serious digging to figure what really was
going on.

> In summary:
> 
> We don't want to have library code into their own drivers because, well,
> you can only have one gadget driver at a time anyway.

That sentence isn't clear.  Perhaps you mean that having a single copy
of the executable library code at runtime, which could be shared among
multiple gadget drivers, doesn't help because there's only one gadget
driver present at a time.  With the new UDC framework, that won't be
true any more.

> And we don't want
> separate compilation due to having stuff out of init sections.

I still don't understand what the issue is with that.  There are plenty 
of driver modules built from multiple, separately-compiled objects 
that use init sections without trouble.

On the other hand, if you want to share a single copy of the executable
library code among multiple gadget drivers, then none of it can go in
an init section.  Since gadget drivers can be loaded and unloaded at
any time, the library code would have to remain in memory permanently 
-- it couldn't go in an init section.

Alan Stern

