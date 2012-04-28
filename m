Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:53426 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752217Ab2D1JLK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 28 Apr 2012 05:11:10 -0400
Date: Sat, 28 Apr 2012 11:11:08 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: RFC: How to handle function tracing, frame pointers and
	-mfentry?
Message-ID: <20120428091108.GA6847@merkur.ravnborg.org>
References: <1335552399.28106.228.camel@gandalf.stny.rr.com> <20120428083603.GJ27374@one.firstfloor.org> <20120428085028.GA6507@merkur.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20120428085028.GA6507@merkur.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, "H. Peter Anvin" <hpa@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, Frederic Weisbecker <fweisbec@gmail.com>

On Sat, Apr 28, 2012 at 10:50:28AM +0200, Sam Ravnborg wrote:
> > 
> > I just measured and a null compile (nothing changes) of a current
> > tree calls "gcc" 141 times.
> Something is wrong then which must be fixed.
> There are 55 uses of cc-option in */x86/*
> And only 7 uses of cc-option in the top-level Makefile.
> 
> So it looks like we evalute the same assignmet twice or more.

"make defconfig" in my box calls gcc 50 times.
This looks much closer to the actual usage of cc-option in the
above mentioned files.
How did you manage to achieve 144 calls to gcc?

Any specific configuration that triggers this?

	Sam
