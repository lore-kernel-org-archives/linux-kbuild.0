Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pqueuea.post.tele.dk ([193.162.153.9]:49596 "EHLO
	pqueuea.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933761Ab0EYUEh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 25 May 2010 16:04:37 -0400
Received: from pfepb.post.tele.dk (pfepb.post.tele.dk [195.41.46.236])
	by pqueuea.post.tele.dk (Postfix) with ESMTP id B9400DBB43
	for <linux-kbuild@vger.kernel.org>; Tue, 25 May 2010 22:04:35 +0200 (CEST)
Date: Tue, 25 May 2010 22:04:14 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 00/13] jump label v8
Message-ID: <20100525200414.GA10524@merkur.ravnborg.org>
References: <cover.1274283321.git.jbaron@redhat.com> <20100523091856.GF25524@elte.hu> <20100524133455.GA2720@redhat.com> <20100524192752.GA22554@elte.hu> <20100525190650.GB3548@redhat.com> <1274816369.22648.214.camel@gandalf.stny.rr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1274816369.22648.214.camel@gandalf.stny.rr.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Jason Baron <jbaron@redhat.com>, Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Fr?d?ric Weisbecker <fweisbec@gmail.com>, Michal Marek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Tue, May 25, 2010 at 03:39:29PM -0400, Steven Rostedt wrote:
> [ Added Michal to Cc ]
> 
> > 
> > ok, here's what we've come up with based on Ingo's suggestion. Any
> > chance this feature can be considered for 2.6.35? I've a got a few
> > other small fixes too...
> > 
> > thanks,
> > 
> > -Jason
> > 
> > diff --git a/Makefile b/Makefile
> > index 85edb67..b51ddfb 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -582,6 +582,11 @@ KBUILD_CFLAGS	+= $(call cc-option,-fno-dwarf2-cfi-asm)
> >  # conserve stack if available
> >  KBUILD_CFLAGS   += $(call cc-option,-fconserve-stack)
> >  
> > +# check for 'asm goto'
> > +ifeq ($(shell sh -c "(echo 'int main(void) { entry: asm goto (\"\"::::entry); return 0; }') | $(CC) -x c - >/dev/null 2>&1 && echo y"), y)
> > +	KBUILD_CFLAGS += -DCC_HAVE_ASM_GOTO
> > +endif
> 
> Yeah, also this would help prevent bugs with other archs where the GCC
> version may not have supported it either.
> 
> Acked-by: Steven Rostedt <rostedt@goodmis.org>

Could we move this to a small well-commented helper script like
we do with gcc-version.sh?

Then we could simply do something like this in the top-level Makefile:

# Check if gcc support' asm goto'

ifeq ($(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh $(CC))),y)
    KBUILD_CFLAGS += -DCC_HAVE_ASM_GOTO
endif

The top-level Makefile needs to be simpler - not more complicated.

PS. I think Michal is away until the end of this month.

	Sam
