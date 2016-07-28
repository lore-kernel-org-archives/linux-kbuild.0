Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.skyhub.de ([78.46.96.112]:53526 "EHLO mail.skyhub.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750754AbcG1Iqf (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Jul 2016 04:46:35 -0400
Date: Thu, 28 Jul 2016 10:46:24 +0200
From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] Kbuild: Move -Wmaybe-uninitialized to W=1
Message-ID: <20160728084624.GA30084@nazgul.tnic>
References: <20140616132045.GE8170@pd.tnic>
 <20140616211405.GA7914@ravnborg.org>
 <20140624213835.GD15068@pd.tnic>
 <20140707105339.GA4776@pd.tnic>
 <20160728042011.GA25498@nazgul.tnic>
 <20160728082915.GA2349@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20160728082915.GA2349@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, lkml <linux-kernel@vger.kernel.org>, Michael Matz <matz@suse.de>, linux-kbuild@vger.kernel.org, x86-ml <x86@kernel.org>

On Thu, Jul 28, 2016 at 10:29:15AM +0200, Ingo Molnar wrote:
> BUT, isn't this the natural state of things, that the 'final' warnings
> that don't get fixed are the obnoxious, false positive ones - because
> anyone who looks at them will say "oh crap, idiotic compiler!"?

Hmm, so my experience is like Linus' - that -Wmaybe thing generates too
much noise and a lot of false positives. The thing is, as Micha (on CC)
explained it to me, that warning simply says that GCC sometimes *cannot*
know whether the variable will be used uninitialized or not and eagerly
issues the warning message, just in case.

> But over the last couple of years I think we probably had hundreds of
> bugs avoided due to the warning (both at the development and at the
> integration stage) - and

Really?

And I've yet to see an example where it actually helped :-\

>   commit e01d8718de4170373cd7fbf5cf6f9cb61cebb1e9
>   Author: Peter Zijlstra <peterz@infradead.org>
>   Date:   Wed Jan 27 23:24:29 2016 +0100
> 
>     perf/x86: Fix uninitialized value usage
> 
>   ...
> 
>   Only took 6 hours of painful debugging to find this. Neither GCC nor
>   Smatch warnings flagged this bug.

So that warning didn't help here either.

> ... and my worry here is that we are now telling GCC: "don't you dare
> generate a false positive warning!" - at which point GCC folks will
> add even MORE heuristics to avoid false positives that generate even
> more false negatives

Why?

I think we should enable only the real warnings and turn off the stuff
which generates a lot of false positives. Or, we could put them behind
the -W= switch, so that people can still build the kernel with it but
not have them enabled by default.

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
