Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from one.firstfloor.org ([213.235.205.2]:53591 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750842Ab2D1MQd (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 28 Apr 2012 08:16:33 -0400
Date: Sat, 28 Apr 2012 14:16:31 +0200
From: Andi Kleen <andi@firstfloor.org>
Subject: Re: RFC: How to handle function tracing, frame pointers and -mfentry?
Message-ID: <20120428121631.GL27374@one.firstfloor.org>
References: <1335552399.28106.228.camel@gandalf.stny.rr.com> <20120428083603.GJ27374@one.firstfloor.org> <20120428085028.GA6507@merkur.ravnborg.org> <20120428091108.GA6847@merkur.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20120428091108.GA6847@merkur.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Andi Kleen <andi@firstfloor.org>, Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, "H. Peter Anvin" <hpa@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, Frederic Weisbecker <fweisbec@gmail.com>

> "make defconfig" in my box calls gcc 50 times.
> This looks much closer to the actual usage of cc-option in the
> above mentioned files.
> How did you manage to achieve 144 calls to gcc?
> 
> Any specific configuration that triggers this?

Hmm, thanks for double checking. I suspect I misgrepped
(included the children of the gcc from the strace log). 
If it calls two children that would be roughly your number.

But even 50 is quite bad.

-Andi
