Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from iolanthe.rowland.org ([192.131.102.54]:51242 "HELO
	iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751145Ab1FNUBa (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 14 Jun 2011 16:01:30 -0400
Date: Tue, 14 Jun 2011 16:01:29 -0400 (EDT)
From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: generate one module from multiple object files (was: Re: [PATCH
 2/2] usb: gadget: convert all users to the new udc)
In-Reply-To: <20110614194151.GC30763@legolas.emea.dhcp.ti.com>
Message-ID: <Pine.LNX.4.44L0.1106141553220.2102-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Felipe Balbi <balbi@ti.com>
Cc: Arnaud Lacombe <lacombar@gmail.com>, Michal Nazarewicz <mina86@mina86.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Greg KH <greg@kroah.com>, Linux USB Mailing List <linux-usb@vger.kernel.org>, linux-kbuild@vger.kernel.org

On Tue, 14 Jun 2011, Felipe Balbi wrote:

> > > And we don't want
> > > separate compilation due to having stuff out of init sections.
> > 
> > I still don't understand what the issue is with that.  There are plenty 
> > of driver modules built from multiple, separately-compiled objects 
> > that use init sections without trouble.
> 
> Maybe we should turn u_*.c and composite.c into their own modules now
> that we're starting to allow multiple gadget controllers and thus
> multiple gadget drivers loaded. I failed to see that, great catch.

That's not what I meant.  I was asking for an explanation of your
statement: 

	And we don't want separate compilation due to having stuff
	out of init sections.

Why should separate compilation force you to move stuff out of init
sections?

Consider usbcore as an example.  Grepping through drivers/usb/core/*.c,
you'll see there are init routines in devio.c, inode.c, and usb.c.  
These files are all compiled separately.  Yet they are linked into a
single object module, usbcore.ko, and the init sections work out just
fine.

In short, I don't see what's wrong with separate compilation.  
Apparently the only problem David found was that it increased the size 
of the final driver by 42 bytes.  Is that really worth worrying about?

Alan Stern

