Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from iolanthe.rowland.org ([192.131.102.54]:50185 "HELO
	iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751728Ab1FNRGR (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 14 Jun 2011 13:06:17 -0400
Date: Tue, 14 Jun 2011 13:06:16 -0400 (EDT)
From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: generate one module from multiple object files (was: Re: [PATCH
 2/2] usb: gadget: convert all users to the new udc)
In-Reply-To: <20110614164513.GP2353@legolas.emea.dhcp.ti.com>
Message-ID: <Pine.LNX.4.44L0.1106141301000.2102-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Felipe Balbi <balbi@ti.com>
Cc: Arnaud Lacombe <lacombar@gmail.com>, Michal Nazarewicz <mina86@mina86.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Greg KH <greg@kroah.com>, Linux USB Mailing List <linux-usb@vger.kernel.org>, linux-kbuild@vger.kernel.org

On Tue, 14 Jun 2011, Felipe Balbi wrote:

> > --- a/drivers/usb/gadget/Makefile
> > +++ b/drivers/usb/gadget/Makefile
> > @@ -34,6 +34,12 @@ obj-$(CONFIG_USB_FUSB300)    += fusb300_udc.o
> >  # USB gadget drivers
> >  #
> >  g_zero-y                       := zero.o
> > +g_zero-y                       += composite.o
> > +g_zero-y                       += usbstring.o
> > +g_zero-y                       += config.o
> > +g_zero-y                       += epautoconf.o
> > +g_zero-y                       += f_sourcesink.o
> > +g_zero-y                       += f_loopback.o
> 
> yes, you can do that. But the problem is the runtime memory footprint
> that we will have with that. At least that was the reason why Greg had
> asked Dave to change it to how it is done now.

What exactly is the runtime memory footprint problem?  I thought the
whole reason for #include'ing .c files was that back then, the kbuild
system wasn't able to do this.

> Do we support gcc --combine already ?

As far as I know, the only advantage of gcc -combine is that it allows
the optimizer to work on more than one file at a time.  Would that
really make any significant difference for these particular source
files?

Alan Stern

