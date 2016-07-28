Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36418 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932666AbcG1RES (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Jul 2016 13:04:18 -0400
Date: Thu, 28 Jul 2016 19:04:13 +0200
From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH] Kbuild: Move -Wmaybe-uninitialized to W=1
Message-ID: <20160728170413.GA15229@gmail.com>
References: <20140616132045.GE8170@pd.tnic>
 <20140616211405.GA7914@ravnborg.org>
 <20140624213835.GD15068@pd.tnic>
 <20140707105339.GA4776@pd.tnic>
 <20160728042011.GA25498@nazgul.tnic>
 <20160728082915.GA2349@gmail.com>
 <20160728084624.GA30084@nazgul.tnic>
 <20160728164956.GA2865@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160728164956.GA2865@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, lkml <linux-kernel@vger.kernel.org>, Michael Matz <matz@suse.de>, linux-kbuild@vger.kernel.org, x86-ml <x86@kernel.org>, Arnaldo Carvalho de Melo <acme@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <a.p.zijlstra@chello.nl>


* Ingo Molnar <mingo@kernel.org> wrote:

> But that's my point, I believe the false positive rate is pretty low in fact, due 
> to three factors:
> 
>  - 90% of the warnings get fixed by developers, we never see them upstream
> 
>  - I'd say a majority (say 70%) of the remaining warnings are flagging 'complexity 
>    bugs'
>  
>  - only a residual 3% are obnoxious ones.
> 
> But these remaining 3% are the ones we are seeing again and again in various 
> compiler output, so we tend to get a subjective impression that this warning 
> produces countless false positives.

And note that I am well aware of the real risk this poses: people will ignore real 
warnings if there are so many residual false positives.

I think this approach worked pretty well for perf:

> So I *think* the better option would be to do what we are doing in the perf 
> tooling: force a build error for these warnings (by default, with an option 
> available to make it build). That flushes them out and also makes it sure that 
> those questionable sequences of code never get upstream to begin with.

... but might not be appropriate for the kernel which is a 2 orders of magnitude 
larger code base.

Thanks,

	Ingo
