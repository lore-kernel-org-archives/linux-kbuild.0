Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:43321 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751678Ab3D2PBh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Apr 2013 11:01:37 -0400
Date: Mon, 29 Apr 2013 11:01:33 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: strange behaviour from "make localmodconfig" throws out ath9k
 stuff
In-Reply-To: <1367246499.30667.9.camel@gandalf.local.home>
Message-ID: <alpine.DEB.2.02.1304291056410.13584@oneiric>
References: <alpine.DEB.2.02.1304261459030.17575@oneiric>   <20130427153833.GC3355@free.fr>   <alpine.DEB.2.02.1304271325240.12586@oneiric>   <20130427174226.GA25088@free.fr>   <alpine.DEB.2.02.1304271412250.27554@oneiric>   <20130428202854.GC4571@free.fr>
   <alpine.DEB.2.02.1304290645150.16211@oneiric>  <1367244700.28120.6.camel@fedora>  <alpine.DEB.2.02.1304291022320.9234@oneiric> <1367246499.30667.9.camel@gandalf.local.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Mon, 29 Apr 2013, Steven Rostedt wrote:

... snip ...

> I should probably have localmodconfig stop here and wait for user input,
> as this is usually lost in the make oldconfig that runs later.
>
> >
> >   so it sees the currently loaded modules:
> >
> > ath9k                 110134  0
> > ath9k_common           14053  1 ath9k
> > ath9k_hw              405771  2 ath9k,ath9k_common
> > ath                    23827  3 ath9k,ath9k_common,ath9k_hw
> >
> > it just has no idea how to hang onto them, yes?
> >
> >   at this point, i think this is one of those anomalous corner cases
> > that has to be recognized and resolved manually. but i can reproduce
> > all of this from scratch if you'd like to see it.
>
> This looks like one of those things that happen when you use an older
> config with a newer kernel. localmodconfig is really made for just
> turning off what's not used, not for turning on things that were not
> there before. This is because it wont know the right dependency to turn
> on.
>
> I don't consider this a bug, just something you need to be aware of.
>
> I could add to localmodconfig to stop after the warnings and say
> something like:
>
> "The above warnings could be caused by running an older config with a
> newer kernel. You may want to run the origin config against 'make
> oldconfig' to select any new dependencies that might be required."

  i threw all this onto a wiki page, if anyone else wants to play
along:

http://www.crashcourse.ca/wiki/index.php/Atheros_and_localmodconfig

and you're right, of course, it's not a "localmodconfig" thing after
all.

  however, the last bit on that wiki page still puzzles me and i just
noticed it -- even after i manually add in the atheros stuff,
localmodconfig still throws it away again, this time without warning.

  anyway, i know the workaround so i'll go with that. i figure i've
beaten this adequately senseless.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
