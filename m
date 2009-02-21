Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.123]:57951 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753182AbZBUVyB (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 21 Feb 2009 16:54:01 -0500
Date: Sat, 21 Feb 2009 16:53:58 -0500 (EST)
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2] kconfig: check for select dependency errors on config
 load
In-Reply-To: <20090221215104.GA2030@uranus.ravnborg.org>
Message-ID: <alpine.DEB.2.00.0902211651180.18221@gandalf.stny.rr.com>
References: <499edf47.1818d00a.060b.2b8d@mx.google.com> <499EE162.4050008@oracle.com> <alpine.DEB.2.00.0902210008580.30069@gandalf.stny.rr.com> <20090220220810.6f4360f0.akpm@linux-foundation.org> <499F9D25.8010300@oracle.com> <alpine.DEB.2.00.0902211504200.30069@gandalf.stny.rr.com>
 <alpine.DEB.2.00.0902211535440.18221@gandalf.stny.rr.com> <20090221215104.GA2030@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, Frederic Weisbecker <fweisbec@gmail.com>, Ingo Molnar <mingo@elte.hu>, zippel@linux-m68k.org


On Sat, 21 Feb 2009, Sam Ravnborg wrote:
> 
> We do not want to have such hardcoded information
> about the Kconfig structure in the backend.
> Rather we should fix the configuration once and for all so EMBEDDED
> get split into the sensible options is actually is.
> 
> Options that come to my mind is:
> OPTIMIZE_FOR_TEXT_SIZE
> OPTIMIZE_FOR_DATA_SIZE
> KERNEL_EXPERT
> 
> And we should them make their use of select conform
> like the rest of the kernel configuration.
> 
> So the first version of your patch is IMO better - but
> it could use some comments so others better follows what is
> going on. The current level of comments in the kconfig
> source base is not an example to follw

Sounds good. Yeah, the first patch was an RFC mainly because I want 
someone to look at the code and tell me "yeah that works" or "No! you 
can't do that". Because I spent several hours staring at the kconfig code 
trying to figure out WTF it was doing. Luckily, I did have a compiler 
writing course and the flex and bison code was fine for me.

I will definitely update the code with comments when I'm more comfortable 
with the code.

-- Steve

