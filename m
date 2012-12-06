Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.wow.synacor.com ([64.8.70.55]:44428 "EHLO
	smtp.mail.wowway.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754104Ab2LFCQW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 5 Dec 2012 21:16:22 -0500
Date: Wed, 5 Dec 2012 21:16:20 -0500
From: Paul Thompson <set48035@gmail.com>
Subject: Re: IRQ subsystem menu
Message-ID: <20121206021620.GB8989@squish.home.loc>
References: <20121021074016.GA2604@squish.home.loc>
 <20121029140308.GA19316@sepie.suse.cz>
 <20121129203242.6D6CD3E09C2@localhost>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="sm4nu43k4a2Rpi4c"
Content-Disposition: inline
In-Reply-To: <20121129203242.6D6CD3E09C2@localhost>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>


--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Grant Likely <grant.likely@secretlab.ca>, on Thu  2012.11.29 said:
> On Mon, 29 Oct 2012 15:03:08 +0100, Michal Marek <mmarek@suse.cz> wrote:
> > (Adding lkml and Thomas as IRQ subsystem maintainer to CC)
> > 
> > On Sun, Oct 21, 2012 at 03:40:16AM -0400, Paul Thompson wrote:
> > > 	Hi;
> > > 
> > > 	In menuconfig, General setup -> IRQ subsystem, there are two
> > > possible menu-items. One depends partly on IRQ_DOMAIN, and the other
> > > on MAY_HAVE_SPARSE_IRQ.
> > > 
[...]
> > > 
> > > 	Ideally, the "IRQ subsystem" menu would not even show up
> > > if it would contain no menu-items, but I do not know enough to
> > > formulate that constraint.
> 
> First, move the 'menu "IRQ subsystem"' line does to right before the
> IRQ_DOMAIN_DEBUG line so that it wraps the options that matter, then you
> can add a "depends on MAY_HAVE_SPARSE_IRQ || IRQ_DOMAIN" line right
> below the menu item.
> 
> You'll also need to move the IRQ_FORCED_THREADING line out from inside
> the menu block.
> 
> Try it out and let me know how it goes.
> 
> g.

	Hi;

	The logic makes sense to me, and makes the menus appearance
dependent on if either option setting can exist. So, on my system,
the IRQ subsystem menu does not appear.

Paul

See if this attached patch looks right:

--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="irq-menu.patch"

--- linux-3.7-rc8/kernel/irq/Kconfig.orig	2012-12-05 20:59:00.963707538 -0500
+++ linux-3.7-rc8/kernel/irq/Kconfig	2012-12-05 21:00:18.454788693 -0500
@@ -3,7 +3,6 @@ config HAVE_GENERIC_HARDIRQS
 	bool
 
 if HAVE_GENERIC_HARDIRQS
-menu "IRQ subsystem"
 #
 # Interrupt subsystem related configuration options
 #
@@ -56,6 +55,13 @@ config GENERIC_IRQ_CHIP
 config IRQ_DOMAIN
 	bool
 
+# Support forced irq threading
+config IRQ_FORCED_THREADING
+       bool
+
+menu "IRQ subsystem"
+	depends on ( IRQ_DOMAIN && DEBUG_FS ) || MAY_HAVE_SPARSE_IRQ
+
 config IRQ_DOMAIN_DEBUG
 	bool "Expose hardware/virtual IRQ mapping via debugfs"
 	depends on IRQ_DOMAIN && DEBUG_FS
@@ -66,10 +72,6 @@ config IRQ_DOMAIN_DEBUG
 
 	  If you don't know what this means you don't need it.
 
-# Support forced irq threading
-config IRQ_FORCED_THREADING
-       bool
-
 config SPARSE_IRQ
 	bool "Support sparse irq numbering" if MAY_HAVE_SPARSE_IRQ
 	---help---

--sm4nu43k4a2Rpi4c--
