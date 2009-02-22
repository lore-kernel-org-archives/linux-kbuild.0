Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from toq6.bellnexxia.net ([209.226.175.62]:45961 "EHLO
	toq6-srv.bellnexxia.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752419AbZBVQZv (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 22 Feb 2009 11:25:51 -0500
Date: Sun, 22 Feb 2009 11:04:06 -0500
From: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>
Subject: Re: [PATCH] tracing/markers: make markers select tracepoints
Message-ID: <20090222160405.GA17875@Krystal>
References: <499EE162.4050008@oracle.com> <20090220172241.GF24538@elte.hu> <20090222121821.3599.A69D9226@jp.fujitsu.com> <1235302660.4632.4.camel@laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
In-Reply-To: <1235302660.4632.4.camel@laptop>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>, Ingo Molnar <mingo@elte.hu>, Randy Dunlap <randy.dunlap@oracle.com>, Frederic Weisbecker <fweisbec@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org, zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, "Frank Ch. Eigler" <fche@redhat.com>

* Peter Zijlstra (peterz@infradead.org) wrote:
> On Sun, 2009-02-22 at 12:23 +0900, KOSAKI Motohiro wrote:
> 
> > IIRC, this suggestion still don't get agreement of all tracing feature stakeholder.
> > We need to definitely discuss more lot and deep.
> > so I wonder why don't we create linux-tracing new mailing list.
> 
> Yes, lets hide it from general view, sounds like a brilliant plan.
> 
> 
> 

I guess Kosaki's point is that there may be a disconnect between the
work that is done on the LTTng side and the ftrace side. LTTng uses the
markers as a core infrastructure part (and tracepoints for
instrumentation). I guess his idea is to improve communication, not to
stop it. So by your reaction, I guess his proposal might not be ideal,
but I hear his concerns. I'll try to post the core lttng patchset
shortly.

Mathieu


-- 
Mathieu Desnoyers
OpenPGP key fingerprint: 8CD5 52C3 8E3C 4140 715F  BA06 3F25 A8FE 3BAE 9A68
