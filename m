Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:57075 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751397AbZGQUba (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 17 Jul 2009 16:31:30 -0400
Date: Fri, 17 Jul 2009 22:31:28 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Update/override CONFIG_ during kbuild?
Message-ID: <20090717203128.GB6872@merkur.ravnborg.org>
References: <1d3f23370906282226t5944cfc8xa4af82ffd0ce5095@mail.gmail.com> <20090629094123.9c3f3c14.randy.dunlap@oracle.com> <1d3f23370907051824m4a75dfd5uedb359b650741444@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d3f23370907051824m4a75dfd5uedb359b650741444@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: John Williams <john.williams@petalogix.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, John Linn <John.Linn@xilinx.com>, Michal Simek <michal.simek@petalogix.com>

On Mon, Jul 06, 2009 at 11:24:07AM +1000, John Williams wrote:
> On Tue, Jun 30, 2009 at 2:41 AM, Randy Dunlap <randy.dunlap@oracle.com> wrote:
> >
> > On Mon, 29 Jun 2009 15:26:51 +1000 John Williams wrote:
> >
> > > Is there a mechanism to override or update a CONFIG_ value during the
> > > make process?
> > >
> > > In the MicroBlaze architecture we have a highly configurable CPU -
> > > various ALU options can be enabled or disabled at will during the
> > > hardware build phase.  We have several Kconfig options that must match
> > > this, and which are used to generate the appropriate CFLAGS during
> > > kernel build.  e.g.
> > >
> > > CPUFLAGS-$(CONFIG_XILINX_MICROBLAZE0_USE_DIV) += -mno-xl-soft-div
> > > CPUFLAGS-$(CONFIG_XILINX_MICROBLAZE0_USE_BARREL) += -mxl-barrel-shift
> > > CPUFLAGS-$(CONFIG_XILINX_MICROBLAZE0_USE_PCMP_INSTR) += -mxl-pattern-compare
> > >
> > [snip]
> 
> 
> >
> > > Thus, returning to the question - is there a sane way that we can
> > > override or force the relevant CONFIG_ values, from within the
> > > Makefile itself?   Or, must we resort to a script, and do it as a
> > > preprocessing step?  Is there a reasonable way to still integrate this
> > > into the kernel build phase?
> >
> > I thought that it was possible to override CONFIG_ symbols on the
> > "make" command line, and my limited testing confirms that.
> >
> > E.g.:
> >
> > make ARCH=x86_64 O=xx64 defconfig
> > make CONFIG_HEADERS_CHECK=y CONFIG_BUILD_DOCSRC=y ARCH=x86_64 O=xx64 -j4 all
> >
> > does cause BUILD_DOCSRC builds to happen although BUILD_DOCSRC is not set in
> > the defconfig file.  (I set HEADERS_CHECK=y first since BUILD_DOCSRC depends
> > on HEADERS_CHECK.)
> 
> Sure, this works.  What I'm wondering is if there is a valid way we
> can do the override *inside* the kbuild process itself, ie in our arch
> Makefile we could parse the DTS file and automagically update the
> relevent CONFIG_* to match the DTS file.
> 
> Thoughts from any kbuild experts?  I can go hack something up but
> would prefer to have some non-zero probability of future merge
> acceptance.

I recall I already provided an answer. But my mailbox is on another box...

What you do is to use either a CONFIG_ or a dts defined symbol to decide
if you support a feature or not. And give precedence to the dts symbol.

In this was you do not need to override a config symbol, but you
rather use a config symbol to decide to final value for
a supported feature.

Would that work out for you?

	Sam
