Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.134]:51417 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755526AbcGFTzc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 6 Jul 2016 15:55:32 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] [RFC] Kbuild: avoid "make tinyconfig" warnings
Date: Wed, 06 Jul 2016 21:58:13 +0200
Message-ID: <4422475.YhNHUqYhih@wuerfel>
In-Reply-To: <20160706183250.GA28362@x>
References: <20160704142608.2069991-1-arnd@arndb.de> <7677316.bvNVmygFDv@wuerfel> <20160706183250.GA28362@x>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Triplett <josh@joshtriplett.org>
Cc: Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Darren Hart <dvhart@linux.intel.com>, linux-kbuild@vger.kernel.org, kernel-build-reports@lists.linaro.org, Michal Marek <mmarek@suse.com>, Thiago Macieira <thiago.macieira@intel.com>, linux-kernel@vger.kernel.org

On Wednesday, July 6, 2016 11:32:50 AM CEST Josh Triplett wrote:
> On Wed, Jul 06, 2016 at 03:56:25PM +0200, Arnd Bergmann wrote:
> > On Monday, July 4, 2016 12:58:15 PM CEST Josh Triplett wrote:
> > > On Mon, Jul 04, 2016 at 12:51:56PM -0700, Josh Triplett wrote:
> > > > As another possibility, which would preserve the ability to use
> > > > KCONFIG_ALLCONFIG, what about adding a parameter to mergeconfig to
> > > > disable this warning?  I've seen many other uses of mergeconfig in
> > > > production systems that have the same problem.
> > > 
> > > Actually, I just realized something: does this actually do the right
> > > thing if both tiny.config files exist?  The documentation for
> > > KCONFIG_ALLCONFIG doesn't suggest that it can take two files as
> > > arguments.  And if it can, this also need quotes; otherwise, this will
> > > expand to "... allnoconfig KCONFIG=path/to/a/tiny.config
> > > another/path/to/a/tiny.config".
> > 
> > You are right, my patch doesn't work.
> > 
> > I can think of a few other ways to work around this, though none seems
> > perfect:
> > 
> > - add a flag to the kconfig tool to ignore 'choice' symbol overrides and not
> >   warn about them (as you suggested). This may be problematic if there
> >   are cases in which the warning is actually helpful.
> 
> As long as this remains an option and not the default, I don't think it
> would cause problems.
> 
> > - drop the feature of allowing multiple tiny.config files to be combined
> >   and instead have the x86 file include everything from the architecture
> >   independent file. This would only be a small annoyance, but it doesn't
> >   solve the other cases you mention in which we see similar warnings.
> 
> And I'd rather not duplicate the base config into every
> architecture-specific tiny.config; that'll become even more problematic
> if other architectures add their own.

Fair enough.

> > - change merge_config.sh to do a 'savedefconfig' step before applying
> >   the fragment, so it doesn't warn about choice statements that are
> >   overridden from their default, as opposed to having conflicting choices.
> 
> This sounds like a potentially interesting approach.  This would produce
> warnings only if overriding explicit configuration, but not when
> changing a choice from the implicit default?

Yes, that is the idea. Actually after looking at merge_config.sh I think
this is not the best approach though, based on the way it works: it
looks at all the fragments and merges them together first, then applies
the combined fragment as a single override file, prioritizing this
override over ${objdir}/config, which in turn looks at either
the "olddefconfig" or "allnoconfig" defaults as a fallback.

Our "%.config" Makefile rule in turn passes the current .config into
mergeconfig.sh, so the current defaults get passed in twice. What I
think would work better here is to have an unchanged mergeconfig.sh,
and then change the Makefile to call 'savedefconfig' first, remove
the .config file and then merge the saved defconfig with the other
fragments. It should not be hard to do, but I don't think I can
implement this correctly at the moment for lack of attention.

If any of the folks on Cc could give this a try, that would be very
nice, otherwise I can try to come up with something next week.

	Arnd
