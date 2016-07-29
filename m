Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.133]:62339 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752313AbcG2KiM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 29 Jul 2016 06:38:12 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] Kbuild: Move -Wmaybe-uninitialized to W=1
Date: Fri, 29 Jul 2016 12:35:57 +0200
Message-ID: <4090105.Iz5p5IbnPA@wuerfel>
In-Reply-To: <20160729101932.GA27543@nazgul.tnic>
References: <20140616132045.GE8170@pd.tnic> <19202646.LtBeEUK5Qq@wuerfel> <20160729101932.GA27543@nazgul.tnic>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>, Michal Marek <mmarek@suse.com>, Sam Ravnborg <sam@ravnborg.org>, lkml <linux-kernel@vger.kernel.org>, Michael Matz <matz@suse.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, x86-ml <x86@kernel.org>

On Friday, July 29, 2016 12:19:32 PM CEST Borislav Petkov wrote:
> On Fri, Jul 29, 2016 at 12:08:51PM +0200, Arnd Bergmann wrote:
> > Let me try to get to the bottom of this, maybe we can get the warning
> > back in the future. It has found a number of actual bugs. The majority
> > of -Wmaybe-uninitialized warnings that I fixed in linux-next were
> > false positives (maybe four out of five) but I would think the reason
> 
> So this is exactly the problem: we should not fix perfectly fine code
> just so that gcc remains quiet. So when you say "fixed false positives"
> you actually mean, "changed it so that gcc -Wmaybe-u... doesn't fire"
> right?
> 
> And we should not do that.

As I said elsewhere in the mail, in general the code becomes more
readable in the process and/or the compiler gets to optimize it better.

What typically happens here is that something prevents the compiler
from seeing that a condition is always true, so it has to evaluate
it at runtime when it should have noticed that it can never hit.

If the code is written in a way that the compiler can actually see
that the condition is known based on what happened earlier, we save
an extra branch, or in some cases duplication of object code.

There have been a small number of cases where this was not possible
and I actually ended up adding a fake initialization because rearranging
the code for the compiler would have made it less readable for humans
(e.g. b268c34e5ee92a [1]), but that has been the rare exception because
of the reasons that Rusty nicely described in [2].

	Arnd

[1] https://patchwork.kernel.org/patch/9212881/
[2] https://rusty.ozlabs.org/?p=232
