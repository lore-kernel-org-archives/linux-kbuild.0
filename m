Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:53585 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751740AbYBPWYW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 16 Feb 2008 17:24:22 -0500
Date: Sat, 16 Feb 2008 23:24:32 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: ccflags-y versus EXTRA_CFLAGS??
Message-ID: <20080216222432.GB16599@uranus.ravnborg.org>
References: <alpine.LFD.1.00.0802161615400.3910@localhost.localdomain> <20080216212618.GA16599@uranus.ravnborg.org> <alpine.LFD.1.00.0802161632260.4111@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.1.00.0802161632260.4111@localhost.localdomain>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: kbuild devel list <linux-kbuild@vger.kernel.org>

On Sat, Feb 16, 2008 at 04:44:44PM -0500, Robert P. J. Day wrote:
> On Sat, 16 Feb 2008, Sam Ravnborg wrote:
> 
> > On Sat, Feb 16, 2008 at 04:21:18PM -0500, Robert P. J. Day wrote:
> > >
> > >   IIRC, there are a number of deprecated variables and preferred
> > > forms, along the lines of:
> > >
> > >   ccflags-y -> EXTRA_CFLAGS
> > >   asflags-y -> EXTRA_AFLAGS
> >
> > ccflags-y, asflags are preferred.
> 
> ah, it goes the other way.  (i'm assuming you really meant asflags-y
> above, and this would also include EXTRA_LDFLAGS -> ldflags-y, yes?)

Yes - all three of them. And yes they have the -y postfix all of them.

A simple git log Documentation/kbuild/makefiles.txt would have told you
the story and what is preferred.

	Sam
