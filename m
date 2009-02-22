Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:35530 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751097AbZBVRiU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 22 Feb 2009 12:38:20 -0500
Date: Sun, 22 Feb 2009 12:38:00 -0500
From: "Frank Ch. Eigler" <fche@redhat.com>
Subject: Re: [PATCH] tracing/markers: make markers select tracepoints
Message-ID: <20090222173800.GB9951@redhat.com>
References: <499edf47.1818d00a.060b.2b8d@mx.google.com> <499EE162.4050008@oracle.com> <20090220172241.GF24538@elte.hu> <20090220173107.GH5732@nowhere> <20090220174811.GL24538@elte.hu> <y0mtz6nqwe9.fsf@ton.toronto.redhat.com> <20090222171344.GC6570@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090222171344.GC6570@elte.hu>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, Avi Kivity <avi@redhat.com>, Randy Dunlap <randy.dunlap@oracle.com>, Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Hi -

On Sun, Feb 22, 2009 at 06:13:44PM +0100, Ingo Molnar wrote:
> [...]
> > It would be even easier converted to the markers API directly,
> > without the KVMTRACE* macro intermediary:
> > 
> > before:
> >         KVMTRACE_3D(MSR_READ, &svm->vcpu, ecx, (u32)data,
> >                     (u32)(data >> 32), handler);
> > after:
> > 	trace_mark(kvmtrace, "MSR_READ: %p, %08lx, %016Lx\n",
> >                              &svm->vcpu, ecx, data);
> > 
> > All this already "just works".
> except that we are removing markers.

Perhaps that intention should be justified and reexamined, especially
considering the KVMTRACE* macro-replacement solution you suggested is
almost the same.


- FChE
