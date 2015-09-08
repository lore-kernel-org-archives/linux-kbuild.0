Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:33902 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753254AbbIHNMz (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 8 Sep 2015 09:12:55 -0400
MIME-Version: 1.0
In-Reply-To: <1441281409.2439.96.camel@tiscali.nl>
References: <1438200556-13842-1-git-send-email-mcgrof@do-not-panic.com>
 <1438775840.30717.46.camel@tiscali.nl> <20150810185705.GX30479@wotan.suse.de> <1441281409.2439.96.camel@tiscali.nl>
From: "Luis R. Rodriguez" <mcgrof@suse.com>
Date: Tue, 8 Sep 2015 06:12:34 -0700
Message-ID: <CAB=NE6VupjBNWofYbqyajFbsJqJbTGeUh+eegmJctN-PdjZ3_w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: document recursive dependency limitation / resolution
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Michal Marek <mmarek@suse.com>, Josh Triplett <josh@joshtriplett.org>, jbottomley@odin.com, Geert Uytterhoeven <geert@linux-m68k.org>, Herbert Xu <herbert@gondor.apana.org.au>, Takashi Iwai <tiwai@suse.de>, Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Roberto Di Cosmo <roberto@dicosmo.org>, Stefano Zacchiroli <zack@upsilon.cc>

On Thu, Sep 3, 2015 at 4:56 AM, Paul Bolle <pebolle@tiscali.nl> wrote:
> Hi Luis,
>
> (This landed in my Inbox when I was away from keyboard for a few weeks.
> And then I dragged my feet a bit in answering this. Sorry about that.)

No worries.

> On ma, 2015-08-10 at 20:57 +0200, Luis R. Rodriguez wrote:
>> On Wed, Aug 05, 2015 at 01:57:20PM +0200, Paul Bolle wrote:
>> You're right this could use a bit more lengthy description. Can you help?
>
> I'll try.
>
>> How about:
>>
>> If a driver A selects a series of features, and driver B selects its own set of
>> features, if both have a common selected feature, they then cannot negate each
>> other's features. This means that we have an ongoing lump sum of intersection
>> of features and this is always the largest collection of features.
>>
>> I gave an example for you a while ago, below I provide it again to explain.
>> I will note you provided your own other example, I still like and prefer mine.
>> They're both similar, thought. We could perhaps combine? The shorter the
>> better.
>
> I'll paste a condensed version of your example at the end of this
> message. It triggers the same error. But perhaps it's too obvious to
> serve as an example.
>
>> Example extracted from: http://lkml.kernel.org/r/20150507182838.GA20018@wotan.suse.de
>> -------------------------------------------------------------------------------
>> Let's say rock climbers hate locker rooms, but swimmer need them. We can
>> then have:
>>
>> config GYM
>>         tristate
>>         default n
>>
>> config LOCKER
>>         tristate
>>         default n
>>         depends on GYM
>>
>> config SWIMMING
>>         tristate
>>         default n
>>         select GYM
>>         select LOCKER
>>
>> config ROCK_CLIMBING
>>         tristate
>>         default n
>>         depends on !LOCKER
>>         select GYM
>>
>> Kbuild seems to believe that because swimmers need lockers that rock climbers
>> need them too. That is obviously not true.
>
> (Could it be that the translation of
>         config ROCK_CLIMBING
>                 depends on !LOCKER
>
> into
>         symbol ROCK_CLIMBING depends on LOCKER
>
> is a bit confusing here?)

For your example alternative? Well its just a different concise
example, that's all. I understand now our differences which I'll
explain below.

>> mcgrof@ergon ~/linux-next (git::your-swimming-dad)$ make allnoconfig
>> scripts/kconfig/conf --allnoconfig Kconfig
>> drivers/crypto/qat/Kconfig:25:error: recursive dependency detected!
>> drivers/crypto/qat/Kconfig:25:  symbol GYM is selected by ROCK_CLIMBING
>> drivers/crypto/qat/Kconfig:40:  symbol ROCK_CLIMBING depends on LOCKER
>> drivers/crypto/qat/Kconfig:29:  symbol LOCKER depends on GYM
>
> I'll go through this example step by step (I haven't peeked at my
> previous attempt and hope this new explanation is a bit clearer).
>
> "The kconfig tools need to ensure that their input complies with the
> configuration requirements specified in the various Kconfig files. In
> order to do that they must determine the values that are possible for
> all Kconfig symbols. And that is not possible if there is a circular
> relation between two or more Kconfig symbols.
>
> For example, what values are possible for GYM? ROCK_CLIMBING selects
> GYM, which means that it influences the values that are possible for
> GYM. (Eg, if ROCK_CLIMBING is 'y', GYM must be 'y' too.)
>
> What influences ROCK_CLIMBING? ROCK_CLIMBING depends on !LOCKER. (So if
> LOCKER is 'y' ROCK_CLIMBING can not be set.)
>
> And what influences LOCKER? Well, LOCKER depends on GYM, so GYM
> influences LOCKER.
>
> But that is a problem. Because this means that in order to determine
> what values are possible for GYM we need to look at GYM itself. In other
> words, answering that question would make the kconfig tools run in a
> circle. So the kconfig tools return the "recursive dependency detected"
> error instead."
>
> (Note that SWIMMING doesn't matter for this analysis.)

Ah but there lies our difference, you see you are trying to just
explain *why* and *what* a recursive issue is, I'm trying to explain a
very common type of issue that can creep up. I think we should
document both. Your example just tries to go word by word by word
tying to explain *why* and how we end up in a loop, I'm trying to show
a practical issue that is implicated by the recursive issue. My
example clearly shows a limitation as well that folks have to be aware
of.

>> #
>> # configuration written to .config
>> -------------------------------------------------------------------------------
>
>> > Which are both variations on a theme: stop running in circles. See below
>> > for a (too?) small sample of 22 solutions I could easily find in git's
>> > log. Swapping one or more select's with depend on's was done in two
>> > thirds of these solutions.
>>
>> It may help to document this is the preferrred solution. This was the same
>> option I went with as well.
>
> Yes, I like your idea to offer one or more simple guidelines. I think we
> just disagree on their wording. Perhaps it's just that I've looked into
> all this kconfig stuff too often already to still be able to see how
> other people might think about that dreaded recursive dependency error.

I'll respin, include both examples to first include your example and
walk people over the recursive issue, and then provide my example to
show the implications for features on drivers. I'll also now include
some references to SAT solver solution stuff for the eager beaver that
may want to try to solve these issues.

 Luis
