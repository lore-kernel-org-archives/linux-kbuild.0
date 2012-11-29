Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.19.201]:41108 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751185Ab2K2Qj2 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 29 Nov 2012 11:39:28 -0500
Date: Thu, 29 Nov 2012 08:39:22 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [driver-core:driver-core-next 65/93] WARNING:
 drivers/built-in.o(.text+0xe2399):
Message-ID: <20121129163922.GA5872@kroah.com>
References: <50B78237.9020005@suse.cz>
 <20121129155150.5B667801FC@viridian.itc.virginia.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20121129155150.5B667801FC@viridian.itc.virginia.edu>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bill Pemberton <wfp5p@viridian.itc.virginia.edu>
Cc: Michal Marek <mmarek@suse.cz>, Fengguang Wu <fengguang.wu@intel.com>, devel@driverdev.osuosl.org, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Thu, Nov 29, 2012 at 10:51:50AM -0500, Bill Pemberton wrote:
> Michal Marek writes:
> > 
> > On 29.11.2012 03:12, Fengguang Wu wrote:
> > > On Wed, Nov 28, 2012 at 02:16:49PM -0800, Greg KH wrote:
> > >> On Thu, Nov 29, 2012 at 05:38:31AM +0800, kbuild test robot wrote:
> > >>> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git driver-core-next
> > >>> head:   da095fd3d5063f2dd03468d71f7df39a0430d86f
> > >>> commit: f791be492f76dea7b0641ed227a60eeb2fa7e255 [65/93] mfd: remove use of __devinit
> > >>> config: x86_64-randconfig-s363 (attached as .config)
> > >>>
> > >>> All warnings:
> > >>>
> > >>> WARNING: drivers/built-in.o(.text+0xe2399): Section mismatch in reference from the function stmpe_i2c_probe() to the function .devinit.text:stmpe_probe()
> > >>> The function stmpe_i2c_probe() references
> > >>> the function __devinit stmpe_probe().
> > >>> This is often because stmpe_i2c_probe lacks a __devinit
> > >>> annotation or the annotation of stmpe_probe is wrong.
> > >>
> > >> Not an issue anymore as __devinit is always defined to nothing, so this
> > >> check doesn't mean anything.
> > 
> > Really? If __devinit was defined to do nothing, then the function would
> > not end up in .devinit.text.
> > 
> 
> Yes, the __dev* #defines are still in init.h right now.  I've not
> touched them yet on the thinking they can't be removed until all users
> of them are gone.
> 
> Maybe it'd be a good idea to change them to nothing now.  That way
> anything that's still using them won't have compile failures, but the
> section mismatches would go away.

Yes, I'll work on that later today.

greg k-h
