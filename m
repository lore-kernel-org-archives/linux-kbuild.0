Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:35276 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932220AbZHUQcx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 21 Aug 2009 12:32:53 -0400
Date: Fri, 21 Aug 2009 18:32:20 +0200
From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH 00/14] kconfig: streamline distro configs for testers
Message-ID: <20090821163220.GB20898@elte.hu>
References: <20090819025634.987354707@goodmis.org> <20090820143025.7134930f.akpm@linux-foundation.org> <alpine.DEB.2.00.0908201741370.16405@gandalf.stny.rr.com> <20090820151326.b43038ce.akpm@linux-foundation.org> <20090821135249.GB30346@elte.hu> <alpine.DEB.2.00.0908211106560.16405@gandalf.stny.rr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.0908211106560.16405@gandalf.stny.rr.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, tglx@linutronix.de, peterz@infradead.org, torvalds@linux-foundation.org, tytso@mit.edu, arjan@infradead.org, greg@kroah.com, mcgrof@gmail.com, zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, sam@ravnborg.org, corbet@lwn.net, sourcejedi.lkml@googlemail.com, andi@firstfloor.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org


* Steven Rostedt <rostedt@goodmis.org> wrote:

> 
> On Fri, 21 Aug 2009, Ingo Molnar wrote:
> 
> > 
> > * Andrew Morton <akpm@linux-foundation.org> wrote:
> > 
> > > On Thu, 20 Aug 2009 17:43:38 -0400 (EDT)
> > > Steven Rostedt <rostedt@goodmis.org> wrote:
> > > 
> > > > > 
> > > > > > The following patches are in:
> > > > > > 
> > > > > >   git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-2.6-trace.git
> > > > > > 
> > > > > >     branch: kconfig
> > > > > 
> > > > > Sam's been quiet lately.  I suggest that you add this to linux-next
> > > > > now so people get a chance to poke at it.
> > > > 
> > > > I have no means of pushing into next. Would someone like to do a pull for 
> > > > me?
> > > 
> > > If suitably bribed, Stephen will add you tree directly to the 
> > > linux-nxt lineup.
> > 
> > Yep, we always needed another kconfig maintainer (Sam's being mostly 
> > busy with kbuild), and it's nice to see that Steve volunteered for 
> > that job now! ;-)
> 
> Sure why not?
> 
> I've created a new repo:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-2.6-kconfig.git
> 
> and the same changes are in the branch: for-next

Cool!

I'm wondering, what do you think about Vegard's 'warn about complex 
selects' feature for kconfig which he submitted some time ago:

  http://lkml.org/lkml/2008/5/4/13

That's a really sore kconfig spot we have. It's not a bug, but it 
sure bites people again and again, and it would be nice to have some 
built-in mechanism that gently nudges us away from complex selects. 
(many of which are inadvertent or become complex after the fact)

	Ingo
