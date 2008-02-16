Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:39985 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756929AbYBPVou (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 16 Feb 2008 16:44:50 -0500
Date: Sat, 16 Feb 2008 16:44:44 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: ccflags-y versus EXTRA_CFLAGS??
In-Reply-To: <20080216212618.GA16599@uranus.ravnborg.org>
Message-ID: <alpine.LFD.1.00.0802161632260.4111@localhost.localdomain>
References: <alpine.LFD.1.00.0802161615400.3910@localhost.localdomain> <20080216212618.GA16599@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: kbuild devel list <linux-kbuild@vger.kernel.org>

On Sat, 16 Feb 2008, Sam Ravnborg wrote:

> On Sat, Feb 16, 2008 at 04:21:18PM -0500, Robert P. J. Day wrote:
> >
> >   IIRC, there are a number of deprecated variables and preferred
> > forms, along the lines of:
> >
> >   ccflags-y -> EXTRA_CFLAGS
> >   asflags-y -> EXTRA_AFLAGS
>
> ccflags-y, asflags are preferred.

ah, it goes the other way.  (i'm assuming you really meant asflags-y
above, and this would also include EXTRA_LDFLAGS -> ldflags-y, yes?)

> A set of patches to fix this up subsystem by subsystem, arch by arch
> would be appreciated.

  yeah, that might take a while for ccflags-y, although the ldflags-y
transformation looks fairly small.

rday
--

========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================
