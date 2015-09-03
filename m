Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb2-smtp-cloud3.xs4all.net ([194.109.24.26]:50474 "EHLO
	lb2-smtp-cloud3.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752010AbbICL44 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 3 Sep 2015 07:56:56 -0400
Message-ID: <1441281409.2439.96.camel@tiscali.nl>
Subject: Re: [PATCH] kbuild: document recursive dependency limitation /
 resolution
From: Paul Bolle <pebolle@tiscali.nl>
Date: Thu, 03 Sep 2015 13:56:49 +0200
In-Reply-To: <20150810185705.GX30479@wotan.suse.de>
References: <1438200556-13842-1-git-send-email-mcgrof@do-not-panic.com>
	 <1438775840.30717.46.camel@tiscali.nl>
	 <20150810185705.GX30479@wotan.suse.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Luis R. Rodriguez" <mcgrof@suse.com>
Cc: "Luis R. Rodriguez" <mcgrof@do-not-panic.com>, mmarek@suse.com, josh@joshtriplett.org, jbottomley@odin.com, geert@linux-m68k.org, herbert@gondor.apana.org.au, tiwai@suse.de, corbet@lwn.net, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, roberto@dicosmo.org, zack@upsilon.cc

Hi Luis,

(This landed in my Inbox when I was away from keyboard for a few weeks.
And then I dragged my feet a bit in answering this. Sorry about that.)

On ma, 2015-08-10 at 20:57 +0200, Luis R. Rodriguez wrote:
> On Wed, Aug 05, 2015 at 01:57:20PM +0200, Paul Bolle wrote:
> You're right this could use a bit more lengthy description. Can you help?

I'll try.

> How about:
> 
> If a driver A selects a series of features, and driver B selects its own set of
> features, if both have a common selected feature, they then cannot negate each
> other's features. This means that we have an ongoing lump sum of intersection
> of features and this is always the largest collection of features.
> 
> I gave an example for you a while ago, below I provide it again to explain.
> I will note you provided your own other example, I still like and prefer mine.
> They're both similar, thought. We could perhaps combine? The shorter the
> better.

I'll paste a condensed version of your example at the end of this
message. It triggers the same error. But perhaps it's too obvious to
serve as an example.

> Example extracted from: http://lkml.kernel.org/r/20150507182838.GA20018@wotan.suse.de
> -------------------------------------------------------------------------------
> Let's say rock climbers hate locker rooms, but swimmer need them. We can
> then have:
> 
> config GYM
>         tristate
>         default n
> 
> config LOCKER
>         tristate
>         default n
>         depends on GYM
> 
> config SWIMMING
>         tristate
>         default n
>         select GYM
>         select LOCKER
> 
> config ROCK_CLIMBING
>         tristate
>         default n
>         depends on !LOCKER
>         select GYM
> 
> Kbuild seems to believe that because swimmers need lockers that rock climbers
> need them too. That is obviously not true.

(Could it be that the translation of
	config ROCK_CLIMBING
		depends on !LOCKER

into
	symbol ROCK_CLIMBING depends on LOCKER

is a bit confusing here?)

> mcgrof@ergon ~/linux-next (git::your-swimming-dad)$ make allnoconfig
> scripts/kconfig/conf --allnoconfig Kconfig
> drivers/crypto/qat/Kconfig:25:error: recursive dependency detected!
> drivers/crypto/qat/Kconfig:25:  symbol GYM is selected by ROCK_CLIMBING
> drivers/crypto/qat/Kconfig:40:  symbol ROCK_CLIMBING depends on LOCKER
> drivers/crypto/qat/Kconfig:29:  symbol LOCKER depends on GYM

I'll go through this example step by step (I haven't peeked at my
previous attempt and hope this new explanation is a bit clearer).

"The kconfig tools need to ensure that their input complies with the
configuration requirements specified in the various Kconfig files. In
order to do that they must determine the values that are possible for
all Kconfig symbols. And that is not possible if there is a circular
relation between two or more Kconfig symbols.

For example, what values are possible for GYM? ROCK_CLIMBING selects
GYM, which means that it influences the values that are possible for
GYM. (Eg, if ROCK_CLIMBING is 'y', GYM must be 'y' too.)

What influences ROCK_CLIMBING? ROCK_CLIMBING depends on !LOCKER. (So if
LOCKER is 'y' ROCK_CLIMBING can not be set.)

And what influences LOCKER? Well, LOCKER depends on GYM, so GYM
influences LOCKER.

But that is a problem. Because this means that in order to determine
what values are possible for GYM we need to look at GYM itself. In other
words, answering that question would make the kconfig tools run in a
circle. So the kconfig tools return the "recursive dependency detected"
error instead."

(Note that SWIMMING doesn't matter for this analysis.)

> #
> # configuration written to .config
> -------------------------------------------------------------------------------

> > Which are both variations on a theme: stop running in circles. See below
> > for a (too?) small sample of 22 solutions I could easily find in git's
> > log. Swapping one or more select's with depend on's was done in two
> > thirds of these solutions.
> 
> It may help to document this is the preferrred solution. This was the same
> option I went with as well.

Yes, I like your idea to offer one or more simple guidelines. I think we
just disagree on their wording. Perhaps it's just that I've looked into
all this kconfig stuff too often already to still be able to see how
other people might think about that dreaded recursive dependency error.

Thanks,


Paul Bolle

$ cat Kconfig.locker 
# test with 'make KBUILD_KCONFIG=Kconfig.locker menuconfig'
mainmenu "Luis' locker"

config GYM
	tristate

config LOCKER
	tristate
	depends on GYM

config ROCK_CLIMBING
	tristate
	depends on LOCKER
        select GYM
