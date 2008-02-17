Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:46096 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751208AbYBQTY1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 17 Feb 2008 14:24:27 -0500
Date: Sun, 17 Feb 2008 20:24:36 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: ccflags-y versus EXTRA_CFLAGS??
Message-ID: <20080217192436.GF14588@uranus.ravnborg.org>
References: <alpine.LFD.1.00.0802161615400.3910@localhost.localdomain> <20080216212618.GA16599@uranus.ravnborg.org> <alpine.LFD.1.00.0802161632260.4111@localhost.localdomain> <20080216222432.GB16599@uranus.ravnborg.org> <alpine.LFD.1.00.0802170533570.9596@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.1.00.0802170533570.9596@localhost.localdomain>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: kbuild devel list <linux-kbuild@vger.kernel.org>

On Sun, Feb 17, 2008 at 05:40:18AM -0500, Robert P. J. Day wrote:
> On Sat, 16 Feb 2008, Sam Ravnborg wrote:
> 
> > On Sat, Feb 16, 2008 at 04:44:44PM -0500, Robert P. J. Day wrote:
> > > On Sat, 16 Feb 2008, Sam Ravnborg wrote:
> > >
> > > > On Sat, Feb 16, 2008 at 04:21:18PM -0500, Robert P. J. Day wrote:
> > > > >
> > > > >   IIRC, there are a number of deprecated variables and preferred
> > > > > forms, along the lines of:
> > > > >
> > > > >   ccflags-y -> EXTRA_CFLAGS
> > > > >   asflags-y -> EXTRA_AFLAGS
> > > >
> > > > ccflags-y, asflags are preferred.
> > >
> > > ah, it goes the other way.  (i'm assuming you really meant asflags-y
> > > above, and this would also include EXTRA_LDFLAGS -> ldflags-y, yes?)
> >
> > Yes - all three of them. And yes they have the -y postfix all of them.
> >
> > A simple git log Documentation/kbuild/makefiles.txt would have told
> > you the story and what is preferred.
> 
> i *have* read that file and,
I know this.
I wrote "git log" to tell you to read the changelog entries which
document that we went from EXTRA_CFLAGS to ccflags-y etc.

> after grepping through the source tree,
> i'm still confused.  as a simple example, consider the possible
> variables for assembler flags.  so far, i've found occurrences of:
> 
>   * AFLAGS
>   * EXTRA_AFLAGS
>   * ASFLAGS
>   * AFLAGS-y
>   * KBUILD_AFLAGS
>   * aflags-y
>   * asflags-y
>   * extra-aflags-y

You need to open the files and look into their usage
of the above variables.
The above list is almost only local variables that has no
specific interpretation / functionality in kbuild.

Samples:
extra-aflags-y
Only referenced in arch/ppc/boot/simple/Makefile and never assigned.
Something to be cleaned up.

afalgs-y
Used as a local temporary variable in
arch/m32r/Makefile
arch/s390/Makefile

The new asflags-y should be introduced to clean it
up but not a bug

AFLAGS-y
Used as local variable in arch/powerpc/Makefile
asfalgs-y should be introduced to clean it up but
not a bug.

So see - with a bit of careful investigation things
are much less confusing.

	Sam
