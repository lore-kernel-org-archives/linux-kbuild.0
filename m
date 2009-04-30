Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:35516 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1762916AbZD3OoP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 30 Apr 2009 10:44:15 -0400
Date: Thu, 30 Apr 2009 16:43:09 +0200
From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH 0/3] removing unwanted module configs
Message-ID: <20090430144309.GC14897@elte.hu>
References: <20090430030821.523327994@goodmis.org> <20090430071830.GC16737@elte.hu> <alpine.DEB.2.00.0904300908110.20374@gandalf.stny.rr.com> <20090430132605.GA5289@elte.hu> <alpine.DEB.2.00.0904300932380.20374@gandalf.stny.rr.com> <alpine.DEB.2.00.0904300945440.20374@gandalf.stny.rr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.0904300945440.20374@gandalf.stny.rr.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Theodore Tso <tytso@mit.edu>, Arnaldo Carvalho de Melo <acme@redhat.com>, zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Jonathan Corbet <corbet@lwn.net>


* Steven Rostedt <rostedt@goodmis.org> wrote:

> On Thu, 30 Apr 2009, Steven Rostedt wrote:
> > 
> > Since this option can also be used for helping embedded 
> > developers (I used it for that) I would not want to bloat the 
> > kernel with running a script that is suppose to minimize it. But 
> > if IKCONFIG && !IKCONFIG_PROC does not add more data to the 
> > kernel, then I would be happy to turn it on by default.
> 
> Actually, I can let the user decide. If it sees that IKCONFIG is 
> not set, it can remove it from the .config output. When the 
> silentoldconfig runs afterwards, it will ask the user if they want 
> to enable it.

No, please offer reasonable non-interactive default behavior. It's 
pretty well-defined, and it can be engineered to be self-sufficient 
as well. Why not do that?

	Ingo
