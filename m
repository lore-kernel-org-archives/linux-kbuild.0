Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:38702 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751310Ab2LJXUb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 10 Dec 2012 18:20:31 -0500
Received: by mail-wi0-f174.google.com with SMTP id hm9so1859466wib.1
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Dec 2012 15:20:30 -0800 (PST)
From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: IRQ subsystem menu
In-Reply-To: <20121206021620.GB8989@squish.home.loc>
References: <20121021074016.GA2604@squish.home.loc> <20121029140308.GA19316@sepie.suse.cz> <20121129203242.6D6CD3E09C2@localhost> <20121206021620.GB8989@squish.home.loc>
Date: Mon, 10 Dec 2012 23:18:50 +0000
Message-Id: <20121210231850.367713E081F@localhost>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Thompson <set48035@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>

On Wed, 5 Dec 2012 21:16:20 -0500, Paul Thompson <set48035@gmail.com> wrote:
> Grant Likely <grant.likely@secretlab.ca>, on Thu  2012.11.29 said:
> > On Mon, 29 Oct 2012 15:03:08 +0100, Michal Marek <mmarek@suse.cz> wrote:
> > > (Adding lkml and Thomas as IRQ subsystem maintainer to CC)
> > > 
> > > On Sun, Oct 21, 2012 at 03:40:16AM -0400, Paul Thompson wrote:
> > > > 	Hi;
> > > > 
> > > > 	In menuconfig, General setup -> IRQ subsystem, there are two
> > > > possible menu-items. One depends partly on IRQ_DOMAIN, and the other
> > > > on MAY_HAVE_SPARSE_IRQ.
> > > > 
> [...]
> > > > 
> > > > 	Ideally, the "IRQ subsystem" menu would not even show up
> > > > if it would contain no menu-items, but I do not know enough to
> > > > formulate that constraint.
> > 
> > First, move the 'menu "IRQ subsystem"' line does to right before the
> > IRQ_DOMAIN_DEBUG line so that it wraps the options that matter, then you
> > can add a "depends on MAY_HAVE_SPARSE_IRQ || IRQ_DOMAIN" line right
> > below the menu item.
> > 
> > You'll also need to move the IRQ_FORCED_THREADING line out from inside
> > the menu block.
> > 
> > Try it out and let me know how it goes.
> > 
> > g.
> 
> 	Hi;
> 
> 	The logic makes sense to me, and makes the menus appearance
> dependent on if either option setting can exist. So, on my system,
> the IRQ subsystem menu does not appear.
> 
> Paul

Looks right to me. Please repost with a proper commit log and
"Signed-off-by" line and I'll apply this patch.
(See Documentation/SubmittingPatches)

g.

