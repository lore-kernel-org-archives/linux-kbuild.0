Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from out4.smtp.messagingengine.com ([66.111.4.28]:48630 "EHLO
	out4.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751275Ab1FNU2u (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 14 Jun 2011 16:28:50 -0400
Date: Tue, 14 Jun 2011 13:24:51 -0700
From: Greg KH <greg@kroah.com>
Subject: Re: generate one module from multiple object files (was: Re: [PATCH
 2/2] usb: gadget: convert all users to the new udc)
Message-ID: <20110614202451.GA17182@kroah.com>
References: <20110614194151.GC30763@legolas.emea.dhcp.ti.com>
 <Pine.LNX.4.44L0.1106141553220.2102-100000@iolanthe.rowland.org>
 <20110614201632.GD30763@legolas.emea.dhcp.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20110614201632.GD30763@legolas.emea.dhcp.ti.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Felipe Balbi <balbi@ti.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, Arnaud Lacombe <lacombar@gmail.com>, Michal Nazarewicz <mina86@mina86.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Linux USB Mailing List <linux-usb@vger.kernel.org>, linux-kbuild@vger.kernel.org

On Tue, Jun 14, 2011 at 11:16:33PM +0300, Felipe Balbi wrote:
> Hi,
> 
> On Tue, Jun 14, 2011 at 04:01:29PM -0400, Alan Stern wrote:
> > Consider usbcore as an example.  Grepping through drivers/usb/core/*.c,
> > you'll see there are init routines in devio.c, inode.c, and usb.c.  
> > These files are all compiled separately.  Yet they are linked into a
> > single object module, usbcore.ko, and the init sections work out just
> > fine.
> > 
> > In short, I don't see what's wrong with separate compilation.  
> > Apparently the only problem David found was that it increased the size 
> > of the final driver by 42 bytes.  Is that really worth worrying about?
> 
> probably not... But Greg initiated the discussion. It was something
> related with always recompiling the same objects or something. I really
> don't recall.

42 bytes is not worth worrying about :)

If it can be merged into a single .ko that the others use, please do it.
But for some reason I had problems the last time I tried it, but I can't
remember what they were.

greg k-h
