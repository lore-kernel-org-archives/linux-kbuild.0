Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from benson.vm.bytemark.co.uk ([212.110.190.137]:44043 "EHLO
	benson.vm.bytemark.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750749AbaFKGdm (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 11 Jun 2014 02:33:42 -0400
Message-ID: <1402468419.31087.42.camel@dagon.hellion.org.uk>
Subject: Re: [PATCH v2 1/2] deb-pkg: Add automatic support for armhf
 architecture
From: Ian Campbell <ijc@hellion.org.uk>
Date: Wed, 11 Jun 2014 07:33:39 +0100
In-Reply-To: <1402436539.23860.116.camel@deadeye.wl.decadent.org.uk>
References: <1402273294.23860.59.camel@deadeye.wl.decadent.org.uk>
	 <1402297488.31087.5.camel@dagon.hellion.org.uk>
	 <1402436539.23860.116.camel@deadeye.wl.decadent.org.uk>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, maximilian attems <max@stro.at>, Michal Marek <mmarek@suse.cz>, Fathi Boudra <fathi.boudra@linaro.org>, debian-arm@lists.debian.org, Hector Oron <hector.oron@gmail.com>

On Tue, 2014-06-10 at 22:42 +0100, Ben Hutchings wrote:
> On Mon, 2014-06-09 at 08:04 +0100, Ian Campbell wrote:
> > On Mon, 2014-06-09 at 01:21 +0100, Ben Hutchings wrote:
> > > The Debian armhf architecture uses the ARM EABI hard-float variant,
> > > whereas armel uses the soft-float variant.  Although the kernel
> > > doesn't use FP itself, CONFIG_VFP must be enabled to support
> > > hard-float userland and will probably be disabled when supporting a
> > > soft-float userland.  So set the architecture to armhf by default when
> > > CONFIG_AEABI and CONFIG_VFP are both enabled.
> > > 
> > > Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> > 
> > Acked-by: Ian Campbell <ijc@hellion.org.uk>
> > 
> > We should also add the following. If there is some reason to do a v3
> > feel free to squash it into you patch (if you wish).
> [...]
> 
> arm64 is already in -next.

Great, then please ignore my patch!

Cheers,
Ian.

>   Actually, that means my patch is fuzzy as
> it's based on v3.15.  I hope that's OK.
> 
> Ben.
> 


