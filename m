Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:65020 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753766Ab2K2WJk (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 29 Nov 2012 17:09:40 -0500
Received: by mail-wg0-f44.google.com with SMTP id dr13so4525060wgb.1
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Nov 2012 14:09:39 -0800 (PST)
From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: IRQ subsystem menu
In-Reply-To: <20121029140308.GA19316@sepie.suse.cz>
References: <20121021074016.GA2604@squish.home.loc> <20121029140308.GA19316@sepie.suse.cz>
Date: Thu, 29 Nov 2012 20:32:42 +0000
Message-Id: <20121129203242.6D6CD3E09C2@localhost>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, Paul Thompson <set.mailinglist@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>

On Mon, 29 Oct 2012 15:03:08 +0100, Michal Marek <mmarek@suse.cz> wrote:
> (Adding lkml and Thomas as IRQ subsystem maintainer to CC)
> 
> On Sun, Oct 21, 2012 at 03:40:16AM -0400, Paul Thompson wrote:
> > 	Hi;
> > 
> > 	In menuconfig, General setup -> IRQ subsystem, there are two
> > possible menu-items. One depends partly on IRQ_DOMAIN, and the other
> > on MAY_HAVE_SPARSE_IRQ.
> > 
> > 	On the x86-64 arch, neither of these seems to be set, so the
> > menu entry is blank if entered (displaying an odd ^@ if you try to
> > navigate up or down. And sometimes some screen garbage on the sides.)
> > 
> > 	Previously (in the 3.2 kernel at least) this menu used to be
> > populated by the "Support sparse IRQ numbering" menu-item, which
> > at that time depended on HAVE_SPARSE_IRQ, and was forced to YES.
> > 
> > 	I do not know if the current behaviour is intended, but it
> > is ugly and confusing to be confronted with a blank menu page.
> > 
> > 	Ideally, the "IRQ subsystem" menu would not even show up
> > if it would contain no menu-items, but I do not know enough to
> > formulate that constraint.

First, move the 'menu "IRQ subsystem"' line does to right before the
IRQ_DOMAIN_DEBUG line so that it wraps the options that matter, then you
can add a "depends on MAY_HAVE_SPARSE_IRQ || IRQ_DOMAIN" line right
below the menu item.

You'll also need to move the IRQ_FORCED_THREADING line out from inside
the menu block.

Try it out and let me know how it goes.

g.

