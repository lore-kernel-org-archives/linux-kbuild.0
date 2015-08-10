Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:58779 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932162AbbHJS5K (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 10 Aug 2015 14:57:10 -0400
Date: Mon, 10 Aug 2015 20:57:05 +0200
From: "Luis R. Rodriguez" <mcgrof@suse.com>
Subject: Re: [PATCH] kbuild: document recursive dependency limitation /
 resolution
Message-ID: <20150810185705.GX30479@wotan.suse.de>
References: <1438200556-13842-1-git-send-email-mcgrof@do-not-panic.com>
 <1438775840.30717.46.camel@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1438775840.30717.46.camel@tiscali.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: "Luis R. Rodriguez" <mcgrof@do-not-panic.com>, mmarek@suse.com, josh@joshtriplett.org, jbottomley@odin.com, geert@linux-m68k.org, herbert@gondor.apana.org.au, tiwai@suse.de, corbet@lwn.net, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, roberto@dicosmo.org, zack@upsilon.cc

On Wed, Aug 05, 2015 at 01:57:20PM +0200, Paul Bolle wrote:
> > --- a/Documentation/kbuild/kconfig-language.txt
> > +++ b/Documentation/kbuild/kconfig-language.txt
> > @@ -393,3 +393,25 @@ config FOO
> >  	depends on BAR && m
> >  
> >  limits FOO to module (=m) or disabled (=n).
> > +
> > +Kconfig recursive dependency limitations
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +If you've hit the Kconfig error: "recursive dependency detected" you've run
> > +into a recursive dependency issue with Kconfig. Kconfig does not do recursive
> > +dependency resolution,
> 
> (True. But what could Kconfig do other than note that a chain of
> select's and depend on's makes it run in circles? See below.)

That's the purpose of the documentation. To annotate as TODO to
hopefuly enthusiastic kconfig developers what would need to be
looked into, some small reference material, and obviously something
for the lazy driver developer who just wants to fix the problem within
what has been discussed and accepted.

> >  this has a few implications for Kconfig file writers. In
> > +practice it means that for instance if a driver A selects a few kconfig symbols
> > +another driver B which selects any of these symbols cannot negate any of the
> > +symbols the driver A selected.
> 
> I'm afraid I don't follow this.

You're right this could use a bit more lengthy description. Can you help?
How about:

If a driver A selects a series of features, and driver B selects its own set of
features, if both have a common selected feature, they then cannot negate each
other's features. This means that we have an ongoing lump sum of intersection
of features and this is always the largest collection of features.

I gave an example for you a while ago, below I provide it again to explain.
I will note you provided your own other example, I still like and prefer mine.
They're both similar, thought. We could perhaps combine? The shorter the
better.

Example extracted from: http://lkml.kernel.org/r/20150507182838.GA20018@wotan.suse.de
-------------------------------------------------------------------------------
Let's say rock climbers hate locker rooms, but swimmer need them. We can
then have:

config GYM
        tristate
        default n

config LOCKER
        tristate
        default n
        depends on GYM

config SWIMMING
        tristate
        default n
        select GYM
        select LOCKER

config ROCK_CLIMBING
        tristate
        default n
        depends on !LOCKER
        select GYM

Kbuild seems to believe that because swimmers need lockers that rock climbers
need them too. That is obviously not true.

mcgrof@ergon ~/linux-next (git::your-swimming-dad)$ make allnoconfig
scripts/kconfig/conf --allnoconfig Kconfig
drivers/crypto/qat/Kconfig:25:error: recursive dependency detected!
drivers/crypto/qat/Kconfig:25:  symbol GYM is selected by ROCK_CLIMBING
drivers/crypto/qat/Kconfig:40:  symbol ROCK_CLIMBING depends on LOCKER
drivers/crypto/qat/Kconfig:29:  symbol LOCKER depends on GYM
#
# configuration written to .config
-------------------------------------------------------------------------------

> > +who run into this type of recursive dependency issue have two diverging
> > +options:
> > +
> > +  a) Either swap all "select FOO" to "depends on FOO" or,
> 
> all? "one or more" perhaps.

No I mean all, so in the above example the solution would be to switch
all select GYM to depends on GYM. One concrete example here was the
firmware issue with crypto stuff I was trying to add, ie firmware signing,
and a conflict with a driver I had. One option was to change all "select FW_LOADER"
to "depends on FW_LOADER" but since that was redundant given FW_LOADER is prevalent
my original proposed patch was to just remove all FW_LOADER selects [0]. Since
this was a lot of churn, I decided to go with option documented b) below.

[0] http://lkml.kernel.org/r/1432241149-8762-1-git-send-email-mcgrof@do-not-panic.com

> > +  b) Change the offending "depends on FOO" to "select FOO"
> 
> "the offending"? We're looking at a circle. So maybe:
>     Change one or more "depends on BAR" to "select BAR"   

The conflict would come up with *new* code so what I mean by
offending is to change the incoming code's use of "depends on"
to "select BAR".

> Which are both variations on a theme: stop running in circles. See below
> for a (too?) small sample of 22 solutions I could easily find in git's
> log. Swapping one or more select's with depend on's was done in two
> thirds of these solutions.

It may help to document this is the preferrred solution. This was the same
option I went with as well.

> > +Kconfig's limitations can be addressed by implementing a SAT solver for it,
> 
> Unlike Josh, I'm not familiar with SAT solvers, so it's hard to comment
> on this.
> 
> But given the two building blocks involved:
>     depends on
>     select
> 
> it's clear you can make Kconfig run in circles. (Using only blocks of
> one of those types could do that too. Kconfig uses both building blocks.
> And in practice we always see blocks of both types involved when we make
> Kconfig run in circles.)
> 
> What would a SAT solver do once it makes the obvious observation that
> certain combinations of these two building blocks are circular?

I think that's outside of the scope of the required documentation but
leave it to Josh or James to chime in if they wish.

> > +but until then, Kconfig is limitted to require developers to use one of
> > +the above two mechanisms to address recursive dependency issues. For more
> > +details you can refer to this thread and discussion:
> > +
> > +http://lkml.kernel.org/r/1432241149-8762-1-git-send-email-mcgrof@do-not-panic.com
> 
> > --- a/scripts/kconfig/symbol.c
> > +++ b/scripts/kconfig/symbol.c
> > @@ -1117,6 +1117,8 @@ static void sym_check_print_recursive(struct
> 
> > +			fprintf(stderr, "For a resolution refer to Documentation/kbuild/kconfig-language.txt\n");
> > +			fprintf(stderr, "section \"Kconfig recursive dependency limitations\"\n");
> 
> Nit: subsection.

Will change thanks.

> Sorry for being so verbose. And thanks for doing this!
> 
> 
> Paul Bolle
> 
> 
> sample of solutions for recursive dependency errors
> ===================================================
> 
> 21 commits contain the quote "recursive dependency detected". They
> contain 22 fixes for 21 errors. (One error was solved twice. One commit
> contained two fixes.)
> 
> All errors appear to involve one or more select's and one or more depend
> on's.
> 
> commit		fix
> ======  	===
> 06b718c01208	select A -> depends on A
> c22eacfe82f9	depends on A -> depends on B
> 6a91e854442c	select A -> depends on A
> 118c565a8f2e	select A -> select B
> f004e5594705	select A -> depends on A
> c7861f37b4c6	depends on A -> (null)
> 80c69915e5fb	select A -> (null)		(1)
> c2218e26c0d0	select A -> depends on A	(1)
> d6ae99d04e1c	select A -> depends on A
> 95ca19cf8cbf	select A -> depends on A
> 8f057d7bca54	depends on A -> (null)
> 8f057d7bca54	depends on A -> select A
> a0701f04846e	select A -> depends on A
> 0c8b92f7f259	depends on A -> (null)
> e4e9e0540928	select A -> depends on A	(2)
> 7453ea886e87	depends on A > (null)		(1)
> 7b1fff7e4fdf	select A -> depends on A
> 86c747d2a4f0	select A -> depends on A
> d9f9ab51e55e	select A -> depends on A
> 0c51a4d8abd6	depends on A -> select A	(3)
> e98062ed6dc4	select A -> depends on A	(3)
> 91e5d284a7f1	select A -> (null)     
> 
> 
> (1) Partial (or no) quote of error.
> (2) That seems to be the gist of that fix.
> (3) Same error.

Maybe I'll tack this on.

  Luis
