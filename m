Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:34068 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932563AbcG1QuC (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Jul 2016 12:50:02 -0400
Date: Thu, 28 Jul 2016 18:49:56 +0200
From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH] Kbuild: Move -Wmaybe-uninitialized to W=1
Message-ID: <20160728164956.GA2865@gmail.com>
References: <20140616132045.GE8170@pd.tnic>
 <20140616211405.GA7914@ravnborg.org>
 <20140624213835.GD15068@pd.tnic>
 <20140707105339.GA4776@pd.tnic>
 <20160728042011.GA25498@nazgul.tnic>
 <20160728082915.GA2349@gmail.com>
 <20160728084624.GA30084@nazgul.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160728084624.GA30084@nazgul.tnic>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, lkml <linux-kernel@vger.kernel.org>, Michael Matz <matz@suse.de>, linux-kbuild@vger.kernel.org, x86-ml <x86@kernel.org>, Arnaldo Carvalho de Melo <acme@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <a.p.zijlstra@chello.nl>


Firstly, I'd like to stress it that I know that the commit is upstream and there's 
a less than 1% chance for it to be reverted. I'm not arguing with the expectation 
to see it reverted, I'm arguing because I'm not convinced about the underlying 
technical arguments.

Secondly, I'd like to stress it that there are a number of truly crappy GCC 
warnings that not only are obnoxious but also actively create the *wrong* kind of 
'fixes': -Wsign-compare or -fno-strict-aliasing for example.

* Borislav Petkov <bp@alien8.de> wrote:

> On Thu, Jul 28, 2016 at 10:29:15AM +0200, Ingo Molnar wrote:
> > BUT, isn't this the natural state of things, that the 'final' warnings
> > that don't get fixed are the obnoxious, false positive ones - because
> > anyone who looks at them will say "oh crap, idiotic compiler!"?
> 
> Hmm, so my experience is like Linus' - that -Wmaybe thing generates too
> much noise and a lot of false positives. [...]

But it's only the *residual* warnings we get to see in a huge, 1000+ commits per 
week, 20+ MLOC code base, every 3 months.

We are only seeing a very small minority of warnings, and are seeing them again 
and again in the allmodconfig output because nobody is fixing them because 'GCC is 
obviously wrong'.

So I might be wrong about this, but by its very nature this warning, even if it's 
implemented well, has the natural property that 'crappy corner cases coalesce at 
the bottom'.

> > But over the last couple of years I think we probably had hundreds of
> > bugs avoided due to the warning (both at the development and at the
> > integration stage) - and
> 
> Really?

Yes, really - even many of the false positives were useful to me, because they 
flagged questionable coding practices and overly complex code.

> And I've yet to see an example where it actually helped :-\

I think partly because you are used to working on x86 architecture code where we 
take a look at every warning ASAP.

Check out:

 commit 8e8a6b23f115906678252190c8fcf4168cc60fd5
 Author: Hans Verkuil <hverkuil@xs4all.nl>
 Date:   Tue Jul 28 05:33:55 2015 -0300

    [media] mt9v032: fix uninitialized variable warning

    It can indeed be uninitialized in one corner case. Initialize to NULL.

... we now turn these warnings into false negatives.

This one's a real fix too I think:

  c30400fcffb7 drm/i915: set FDI translations to NULL on SKL

and these were literally the first two random examples I took with a bit of 
grepping.

Plus I'd say that in many cases even if it's a false positive, these warnings 
often flag borderline code complexity bug: code flow should essentially never be 
so complex as to confuse a compiler. If it confuses a compiler it will confuse 9 
coders out of 10.

These two commits:

  3354781a2184 sched/numa: Reflow task_numa_group() to avoid a compiler warning
  719038de98bc x86/intel/cacheinfo: Shut up last long-standing warning

show cases where it flagged actively confusing code.

But these are only those rare warnings that make it upstream - I'd expect more 
than 90% of them to be caught by developers.

> >   commit e01d8718de4170373cd7fbf5cf6f9cb61cebb1e9
> >   Author: Peter Zijlstra <peterz@infradead.org>
> >   Date:   Wed Jan 27 23:24:29 2016 +0100
> > 
> >     perf/x86: Fix uninitialized value usage
> > 
> >   ...
> > 
> >   Only took 6 hours of painful debugging to find this. Neither GCC nor
> >   Smatch warnings flagged this bug.
> 
> So that warning didn't help here either.

Exactly, and now we'll get more such false negatives!

> > ... and my worry here is that we are now telling GCC: "don't you dare
> > generate a false positive warning!" - at which point GCC folks will
> > add even MORE heuristics to avoid false positives that generate even
> > more false negatives
> 
> Why?

Because people react to incentives, and the incentives we are creating here is for 
compiler writers to choose between two options:

1) Solve a really difficult code flow analysis problem and implement the perfect 
   warning detector.

2) Slap even more heuristics on top of existing heuristics to make warnings go
   away.

Guess which one is more likely to be picked?

Now granted, GCC folks will probably not react to 'incentives' created by the 
kernel project (we are one project out of thousands), but still.

> I think we should enable only the real warnings and turn off the stuff which 
> generates a lot of false positives. Or, we could put them behind the -W= switch, 
> so that people can still build the kernel with it but not have them enabled by 
> default.

But that's my point, I believe the false positive rate is pretty low in fact, due 
to three factors:

 - 90% of the warnings get fixed by developers, we never see them upstream

 - I'd say a majority (say 70%) of the remaining warnings are flagging 'complexity 
   bugs'
 
 - only a residual 3% are obnoxious ones.

But these remaining 3% are the ones we are seeing again and again in various 
compiler output, so we tend to get a subjective impression that this warning 
produces countless false positives.

So I *think* the better option would be to do what we are doing in the perf 
tooling: force a build error for these warnings (by default, with an option 
available to make it build). That flushes them out and also makes it sure that 
those questionable sequences of code never get upstream to begin with.

Thanks,

	Ingo
