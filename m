Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from out4.smtp.messagingengine.com ([66.111.4.28]:59862 "EHLO
	out4.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753303Ab1FNUWF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 14 Jun 2011 16:22:05 -0400
Date: Tue, 14 Jun 2011 13:21:09 -0700
From: Greg KH <greg@kroah.com>
Subject: Re: generate one module from multiple object files (was: Re: [PATCH
 2/2] usb: gadget: convert all users to the new udc)
Message-ID: <20110614202109.GB16736@kroah.com>
References: <20110614164513.GP2353@legolas.emea.dhcp.ti.com>
 <Pine.LNX.4.44L0.1106141301000.2102-100000@iolanthe.rowland.org>
 <20110614172859.GS2353@legolas.emea.dhcp.ti.com>
 <BANLkTimRUyt-7gJc--Ja4XuAS5H0UBdNUg@mail.gmail.com>
 <20110614183621.GA30763@legolas.emea.dhcp.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20110614183621.GA30763@legolas.emea.dhcp.ti.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Felipe Balbi <balbi@ti.com>
Cc: Arnaud Lacombe <lacombar@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, Michal Nazarewicz <mina86@mina86.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Linux USB Mailing List <linux-usb@vger.kernel.org>, linux-kbuild@vger.kernel.org

On Tue, Jun 14, 2011 at 09:36:22PM +0300, Felipe Balbi wrote:
> Hi,
> 
> On Tue, Jun 14, 2011 at 01:48:39PM -0400, Arnaud Lacombe wrote:
> > On Tue, Jun 14, 2011 at 1:29 PM, Felipe Balbi <balbi@ti.com> wrote:
> > > [...]
> > > In summary:
> > >
> > > We don't want to have library code into their own drivers because,
> > I am not sure to parse that correctly, could you elaborate ?
> 
> u_*.c and composite.c are basically library code. We don't want to have
> composite.ko and/or u_*.ko.
> 
> > > well, you can only have one gadget driver at a time anyway. And we don't
> > > want separate compilation due to having stuff out of init sections.
> > >
> > on that last point, are you implying that section mapping is not kept
> > across the different linking steps ?
> 
> could be. I don't remember all the details. That was back on 2.6.27
> times. I would need to really revisit all the details on the archives.
> 
> What I remember is that Dave noted code shrunk when combining the source
> files, even if he didn't mark all the other functions as "static".
> 
> Greg, do you remember why you started this discussion when you first
> introduced g_utils.ko ??

That was a while ago.  I think I was having some build issues with the
including of the .c files due to some driver core changes I was working
on, so I tried to create that, but then ran into other issues with
#defines causing different things to be build in odd ways and breaking
the parallel build system.

I really can't remember the specifics, sorry.

If you can figure a way to clean this up, I would not object to that at
all.

Sorry I can't be of more help here.

greg k-h
