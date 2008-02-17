Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:53759 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752722AbYBQKk0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 17 Feb 2008 05:40:26 -0500
Date: Sun, 17 Feb 2008 05:40:18 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: ccflags-y versus EXTRA_CFLAGS??
In-Reply-To: <20080216222432.GB16599@uranus.ravnborg.org>
Message-ID: <alpine.LFD.1.00.0802170533570.9596@localhost.localdomain>
References: <alpine.LFD.1.00.0802161615400.3910@localhost.localdomain> <20080216212618.GA16599@uranus.ravnborg.org> <alpine.LFD.1.00.0802161632260.4111@localhost.localdomain> <20080216222432.GB16599@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: kbuild devel list <linux-kbuild@vger.kernel.org>

On Sat, 16 Feb 2008, Sam Ravnborg wrote:

> On Sat, Feb 16, 2008 at 04:44:44PM -0500, Robert P. J. Day wrote:
> > On Sat, 16 Feb 2008, Sam Ravnborg wrote:
> >
> > > On Sat, Feb 16, 2008 at 04:21:18PM -0500, Robert P. J. Day wrote:
> > > >
> > > >   IIRC, there are a number of deprecated variables and preferred
> > > > forms, along the lines of:
> > > >
> > > >   ccflags-y -> EXTRA_CFLAGS
> > > >   asflags-y -> EXTRA_AFLAGS
> > >
> > > ccflags-y, asflags are preferred.
> >
> > ah, it goes the other way.  (i'm assuming you really meant asflags-y
> > above, and this would also include EXTRA_LDFLAGS -> ldflags-y, yes?)
>
> Yes - all three of them. And yes they have the -y postfix all of them.
>
> A simple git log Documentation/kbuild/makefiles.txt would have told
> you the story and what is preferred.

i *have* read that file and, after grepping through the source tree,
i'm still confused.  as a simple example, consider the possible
variables for assembler flags.  so far, i've found occurrences of:

  * AFLAGS
  * EXTRA_AFLAGS
  * ASFLAGS
  * AFLAGS-y
  * KBUILD_AFLAGS
  * aflags-y
  * asflags-y
  * extra-aflags-y

should i continue?  and you're suggesting that reading that docs file
is going to clarify all of this?  really?  good luck.

rday
--
========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================
