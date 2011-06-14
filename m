Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:37187 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751410Ab1FNRQl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 14 Jun 2011 13:16:41 -0400
Message-ID: <4DF79770.8080002@linutronix.de>
Date: Tue, 14 Jun 2011 19:16:32 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
MIME-Version: 1.0
Subject: Re: generate one module from multiple object files (was: Re: [PATCH
 2/2] usb: gadget: convert all users to the new udc)
References: <Pine.LNX.4.44L0.1106141301000.2102-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1106141301000.2102-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Felipe Balbi <balbi@ti.com>, Arnaud Lacombe <lacombar@gmail.com>, Michal Nazarewicz <mina86@mina86.com>, Greg KH <greg@kroah.com>, Linux USB Mailing List <linux-usb@vger.kernel.org>, linux-kbuild@vger.kernel.org

Alan Stern wrote:
>> Do we support gcc --combine already ?
> 
> As far as I know, the only advantage of gcc -combine is that it allows
> the optimizer to work on more than one file at a time.  Would that
> really make any significant difference for these particular source
> files?

It should also remove static functions which are not used. However I
really don't know the root cause of the memory footprint.
Having every file as a separate module might be a little overkill because
you need usually ~2 guard pages per module in virtual address space. Maybe
a "library" like module.

> 
> Alan Stern
> 

Sebastian
