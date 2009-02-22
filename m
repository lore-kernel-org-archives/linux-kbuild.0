Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:51601 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752391AbZBVMOs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 22 Feb 2009 07:14:48 -0500
Subject: Re: [PATCH] tracing/markers: make markers select tracepoints
From: Peter Zijlstra <peterz@infradead.org>
In-Reply-To: <y0mocwuptbc.fsf@ton.toronto.redhat.com>
References: <499edf47.1818d00a.060b.2b8d@mx.google.com>
	 <499EE162.4050008@oracle.com> <20090220172241.GF24538@elte.hu>
	 <1235302980.4632.8.camel@laptop>  <y0mocwuptbc.fsf@ton.toronto.redhat.com>
Content-Type: text/plain
Date: Sun, 22 Feb 2009 13:14:36 +0100
Message-Id: <1235304876.4632.10.camel@laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Frank Ch. Eigler" <fche@redhat.com>
Cc: Ingo Molnar <mingo@elte.hu>, Randy Dunlap <randy.dunlap@oracle.com>, Frederic Weisbecker <fweisbec@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org, zippel@linux-m68k.org, linux-kbuild@vger.kernel.org

On Sun, 2009-02-22 at 07:08 -0500, Frank Ch. Eigler wrote:
> Peter Zijlstra <peterz@infradead.org> writes:
> 
> > I would like to never merge an ftrace_printk() user... just as I'd like
> > to get rid of every marker.
> 
> But why?  They solve a problem well enough that Ingo had in effect
> reinvented them on Friday.

Because after a printk() debug spree, I don't commit them, I toss them
out and keep the fix.

