Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from quartz.orcorp.ca ([184.70.90.242]:43083 "EHLO quartz.orcorp.ca"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751906Ab2J3PTO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 30 Oct 2012 11:19:14 -0400
Date: Tue, 30 Oct 2012 09:19:13 -0600
From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Subject: Re: [PATCH] [KBUILD] Put the CROSS_COMPILE and ARCH variables in
 the build directory makefile
Message-ID: <20121030151913.GA13176@obsidianresearch.com>
References: <20120930232005.GB30637@obsidianresearch.com>
 <508FDA2B.9000001@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <508FDA2B.9000001@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

On Tue, Oct 30, 2012 at 02:46:19PM +0100, Michal Marek wrote:
> On 1.10.2012 01:20, Jason Gunthorpe wrote:
> > To make cross building a little simpler. The usage with mini-config would
> > be something like:
> > 
> > $ mkdir build
> > $ make ARCH=arm CROSS_COMPILE=arm-v5te-linux-gnueabi- \
> >        KCONFIG_ALLCONFIG=mini.config O=build allnoconfig
> > $ make -C build/
> 
> Are you sure this is not going to suffer from the same issues as
> 5755433? See

Thanks for this link, this is the first time I've seen that, so no :)

The approaches are different, my version that uses mkmakefile probably
avoids some problems (like the quoting issue) but I'm not sure about
mrproper. I've never seen mrproper complain, but I've always used this
patch with O=..

Let me review this information and get back to you.

Jason
