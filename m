Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:50343 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752055AbYAZJ0u (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 26 Jan 2008 04:26:50 -0500
From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH 12/77] kbuild: implement modules.order
Date: Sat, 26 Jan 2008 20:25:59 +1100
References: <20080124215813.GA4204@uranus.ravnborg.org> <200801261501.56198.rusty@rustcorp.com.au> <479AB57D.3080805@gmail.com>
In-Reply-To: <479AB57D.3080805@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200801262025.59593.rusty@rustcorp.com.au>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tejun Heo <htejun@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org, Bill Nottingham <notting@redhat.com>, Greg Kroah-Hartman <gregkh@suse.de>, Kay Sievers <kay.sievers@vrfy.org>, Jon Masters <jonathan@jonmasters.org>

On Saturday 26 January 2008 15:22:21 Tejun Heo wrote:
> Hello, Rusty.

Hi Tejun,

> There was a non-deterministic behavior involving ata_piix and ahci
> drivers on ich6.  Both drivers support the chipset but ata_piix is less
> capable while ahci might misbehave (chip bug).  Generally, ahci should
> be preferred as it seems the problem cases seem to be rare.  When
> drivers are linked in, this is forced by link order.

Right.  Nasty.  This is currently dealt with by blacklisting the lesser 
driver; if that's wrong, blacklist the other one (blacklisting means that 
aliases can't pull it in, it needs to be modprobed by name).  That kind of 
sucks because it's not under kernel control and the distros have to do it, 
but that's how it's always been.

After all, they chose to build two drivers for one device, perhaps they are 
the best people to decide?

> >> So, are you saying that modprobe chooses modules in the reverse order of
> >> modules.alias file?
> >
> > That is precisely what I'm saying, and more.
>
> Oops, then modprobe needs to be updated too.  Jon, can you please put
> this onto your to-do list too?

The modprobe beheavour of loading them all is IMHO correct.  The order was 
never defined however, and reverse was how it was implemented.

There is, of course, no reason to change modprobe; just define the current 
behaviour that the *last* alias is preferred, and generate modules.alias 
accordingly.

Jon's idea of having the later one pull the device away would also work, but 
seems like it's a complex solution to a corner case.

Thanks for the explanation!
Rusty.
