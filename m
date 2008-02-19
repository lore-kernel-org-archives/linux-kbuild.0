Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:58678 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752897AbYBSKPZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Feb 2008 05:15:25 -0500
Date: Tue, 19 Feb 2008 05:15:10 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: packaging issues:  some serious, some not so serious
In-Reply-To: <20080219095214.GA4164@uranus.ravnborg.org>
Message-ID: <alpine.LFD.1.00.0802190512540.25846@localhost.localdomain>
References: <alpine.LFD.1.00.0802181054100.9323@localhost.localdomain> <20080218181747.GA23691@uranus.ravnborg.org> <alpine.LFD.1.00.0802190442500.25509@localhost.localdomain> <20080219095214.GA4164@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: kbuild devel list <linux-kbuild@vger.kernel.org>

On Tue, 19 Feb 2008, Sam Ravnborg wrote:

> On Tue, Feb 19, 2008 at 04:43:56AM -0500, Robert P. J. Day wrote:
> > On Mon, 18 Feb 2008, Sam Ravnborg wrote:
> >
> > > We could add something like:
> > > diff --git a/Makefile b/Makefile
> > > index 0d585c0..fb5bbc3 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -358,6 +358,11 @@ export MODVERDIR := $(if $(KBUILD_EXTMOD),$(firstword $(KBU
> > >  RCS_FIND_IGNORE := \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS
> > >  export RCS_TAR_IGNORE := --exclude SCCS --exclude BitKeeper --exclude .svn --ex
> > >
> > > +# all dirs
> > > +KBUILD_ALL_DIRS := arch block crypto Documentation drivers fs include init
> > > +KBUILD_ALL_DIRS += ipc net samples scripts security sound usr virt
> > > +export KBUILD_ALL_DIRS
> > > +
> >
> > would you not also need to include the regular files at the top of the
> > source tree as well?  for some of the packaging targets, those files
> > should be included as well.
> Yes.
> 'find --max-depth=1 *' or maybe we should provide a seperate list
> for all the relevant filenmaes?

oh, dang ... it just occurred to me that it's still a good idea to add
dirs like lost+found to the RCS_FIND_IGNORE and RCS_TAR_IGNORE
variables since someone might, weirdly, decide to mount a subdirectory
of the kernel source tree on a separate partition.  unlikely, yes, but
it can happen.

it may be that we want a more general variable for those blacklists as
well -- ALL_FIND_IGNORE, ALL_TAR_IGNORE, that sort of thing.

thoughts?

rday
--


========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================
