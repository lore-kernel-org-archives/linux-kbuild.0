Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:35842 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753687AbYBSJwK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Feb 2008 04:52:10 -0500
Date: Tue, 19 Feb 2008 10:52:14 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: packaging issues:  some serious, some not so serious
Message-ID: <20080219095214.GA4164@uranus.ravnborg.org>
References: <alpine.LFD.1.00.0802181054100.9323@localhost.localdomain> <20080218181747.GA23691@uranus.ravnborg.org> <alpine.LFD.1.00.0802190442500.25509@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.1.00.0802190442500.25509@localhost.localdomain>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: kbuild devel list <linux-kbuild@vger.kernel.org>

On Tue, Feb 19, 2008 at 04:43:56AM -0500, Robert P. J. Day wrote:
> On Mon, 18 Feb 2008, Sam Ravnborg wrote:
> 
> > We could add something like:
> > diff --git a/Makefile b/Makefile
> > index 0d585c0..fb5bbc3 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -358,6 +358,11 @@ export MODVERDIR := $(if $(KBUILD_EXTMOD),$(firstword $(KBU
> >  RCS_FIND_IGNORE := \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS
> >  export RCS_TAR_IGNORE := --exclude SCCS --exclude BitKeeper --exclude .svn --ex
> >
> > +# all dirs
> > +KBUILD_ALL_DIRS := arch block crypto Documentation drivers fs include init
> > +KBUILD_ALL_DIRS += ipc net samples scripts security sound usr virt
> > +export KBUILD_ALL_DIRS
> > +
> 
> would you not also need to include the regular files at the top of the
> source tree as well?  for some of the packaging targets, those files
> should be included as well.
Yes.
'find --max-depth=1 *' or maybe we should provide a seperate list
for all the relevant filenmaes?

	Sam
