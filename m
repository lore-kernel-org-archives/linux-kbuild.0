Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:36182 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752896Ab2K2CMR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 28 Nov 2012 21:12:17 -0500
Date: Thu, 29 Nov 2012 10:12:12 +0800
From: Fengguang Wu <fengguang.wu@intel.com>
Subject: Re: [driver-core:driver-core-next 65/93] WARNING:
 drivers/built-in.o(.text+0xe2399): Section mismatch in reference from the
 function stmpe_i2c_probe() to the function .devinit.text:stmpe_probe()
Message-ID: <20121129021212.GF5785@localhost>
References: <50b68457.FDmXAd+1Sp92leEs%fengguang.wu@intel.com>
 <20121128221649.GB13534@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20121128221649.GB13534@kroah.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bill Pemberton <wfp5p@virginia.edu>, devel@driverdev.osuosl.org, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Wed, Nov 28, 2012 at 02:16:49PM -0800, Greg KH wrote:
> On Thu, Nov 29, 2012 at 05:38:31AM +0800, kbuild test robot wrote:
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git driver-core-next
> > head:   da095fd3d5063f2dd03468d71f7df39a0430d86f
> > commit: f791be492f76dea7b0641ed227a60eeb2fa7e255 [65/93] mfd: remove use of __devinit
> > config: x86_64-randconfig-s363 (attached as .config)
> > 
> > All warnings:
> > 
> > WARNING: drivers/built-in.o(.text+0xe2399): Section mismatch in reference from the function stmpe_i2c_probe() to the function .devinit.text:stmpe_probe()
> > The function stmpe_i2c_probe() references
> > the function __devinit stmpe_probe().
> > This is often because stmpe_i2c_probe lacks a __devinit
> > annotation or the annotation of stmpe_probe is wrong.
> 
> Not an issue anymore as __devinit is always defined to nothing, so this
> check doesn't mean anything.

So modpost.c or something in the kernel should be updated?

Thanks,
Fengguang
