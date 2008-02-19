Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:33810 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751892AbYBSMZy (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Feb 2008 07:25:54 -0500
Date: Tue, 19 Feb 2008 07:25:48 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: packaging issues:  some serious, some not so serious
In-Reply-To: <20080219114949.GA5604@uranus.ravnborg.org>
Message-ID: <alpine.LFD.1.00.0802190718360.28461@localhost.localdomain>
References: <alpine.LFD.1.00.0802181054100.9323@localhost.localdomain> <20080218181747.GA23691@uranus.ravnborg.org> <alpine.LFD.1.00.0802190442500.25509@localhost.localdomain> <20080219095214.GA4164@uranus.ravnborg.org> <alpine.LFD.1.00.0802190512540.25846@localhost.localdomain>
 <20080219114949.GA5604@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: kbuild devel list <linux-kbuild@vger.kernel.org>

On Tue, 19 Feb 2008, Sam Ravnborg wrote:

> On Tue, Feb 19, 2008 at 05:15:10AM -0500, Robert P. J. Day wrote:
> > On Tue, 19 Feb 2008, Sam Ravnborg wrote:
> >
> > > On Tue, Feb 19, 2008 at 04:43:56AM -0500, Robert P. J. Day wrote:
> > > > On Mon, 18 Feb 2008, Sam Ravnborg wrote:
> > > >
> > > > > We could add something like:
> > > > > diff --git a/Makefile b/Makefile
> > > > > index 0d585c0..fb5bbc3 100644
> > > > > --- a/Makefile
> > > > > +++ b/Makefile
> > > > > @@ -358,6 +358,11 @@ export MODVERDIR := $(if $(KBUILD_EXTMOD),$(firstword $(KBU
> > > > >  RCS_FIND_IGNORE := \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS
> > > > >  export RCS_TAR_IGNORE := --exclude SCCS --exclude BitKeeper --exclude .svn --ex
> > > > >
> > > > > +# all dirs
> > > > > +KBUILD_ALL_DIRS := arch block crypto Documentation drivers fs include init
> > > > > +KBUILD_ALL_DIRS += ipc net samples scripts security sound usr virt
> > > > > +export KBUILD_ALL_DIRS
> > > > > +
> > > >
> > > > would you not also need to include the regular files at the top of the
> > > > source tree as well?  for some of the packaging targets, those files
> > > > should be included as well.
> > > Yes.
> > > 'find --max-depth=1 *' or maybe we should provide a seperate list
> > > for all the relevant filenmaes?
> >
> > oh, dang ... it just occurred to me that it's still a good idea to
> > add dirs like lost+found to the RCS_FIND_IGNORE and RCS_TAR_IGNORE
> > variables since someone might, weirdly, decide to mount a
> > subdirectory of the kernel source tree on a separate partition.
> > unlikely, yes, but it can happen.
>
> If they do I would not care at all. We should strive to make the
> normal cases behave as expected and try to come up with general
> solutions that does not prevent the more exotic cases.  But trying
> to imagine all the weird cases and handle them will only result in
> an un-maintainable mess.

  i agree.  from what seemed like a simple fix, this has gotten a bit
out of hand.  i think the easiest solution would be to just come up
with a single whitelist, and a number of command-specific blacklists,
and leave it at that.  that's guaranteed to work, and it's trivially
extensible.

  so, as an example, define the global whitelist:

KBUILD_ALL_FILES := COPYING CREDITS Kbuild MAINTAINERS Makefile README REPORTING-BUGS
KBUILD_ALL_DIRS := arch block crypto Documentation drivers fs include init ipc
KBUILD_ALL_DIRS += kernel lib mm net samples scripts security sound usr virt
KBUILD_ALL SRCS := $(KBUILD_ALL_FILES) $(KBUILD_ALL_DIRS)
export KBUILD_ALL_FILES KBUILD_ALL_DIRS KBUILD_ALL_SRCS

those variables above are valid for everything and are easily
augmented.

  in terms of what are currently called RCS_FIND_IGNORE and
RCS_TAR_IGNORE, scrap those entirely as they clearly reflect only
"rcs"-related objects, and just invent new variables:

  FIND_OBJS_TO_IGNORE := ... both files and dirs ...
  TAR_OBJS_TO_IGNORE := ... both files and dirs ...

and that's it.  problem solved.  don't try to partition off the
RCS-related stuff into its own list of objects, it's not worth the
trouble.  and note how that entirely solves the lost+found issue, and
any other issues that might ever arise.

  thoughts?

rday
--



========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================
