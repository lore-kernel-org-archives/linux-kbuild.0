Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.124]:55035 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932996Ab0EYUOO (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 25 May 2010 16:14:14 -0400
Subject: Re: [PATCH 00/13] jump label v8
From: Steven Rostedt <rostedt@goodmis.org>
Reply-To: rostedt@goodmis.org
In-Reply-To: <20100525200414.GA10524@merkur.ravnborg.org>
References: <cover.1274283321.git.jbaron@redhat.com>
	 <20100523091856.GF25524@elte.hu> <20100524133455.GA2720@redhat.com>
	 <20100524192752.GA22554@elte.hu> <20100525190650.GB3548@redhat.com>
	 <1274816369.22648.214.camel@gandalf.stny.rr.com>
	 <20100525200414.GA10524@merkur.ravnborg.org>
Content-Type: text/plain; charset="ISO-8859-15"
Date: Tue, 25 May 2010 16:14:11 -0400
Message-ID: <1274818451.22648.223.camel@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Jason Baron <jbaron@redhat.com>, Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Fr?d?ric Weisbecker <fweisbec@gmail.com>, Michal Marek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Tue, 2010-05-25 at 22:04 +0200, Sam Ravnborg wrote:
> On Tue, May 25, 2010 at 03:39:29PM -0400, Steven Rostedt wrote:

> Could we move this to a small well-commented helper script like
> we do with gcc-version.sh?
> 
> Then we could simply do something like this in the top-level Makefile:

I'm fine with this idea. We just want to get rid of the binding a
feature to a version number.

> 
> # Check if gcc support' asm goto'
> 
> ifeq ($(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh $(CC))),y)
>     KBUILD_CFLAGS += -DCC_HAVE_ASM_GOTO
> endif
> 
> The top-level Makefile needs to be simpler - not more complicated.
> 
> PS. I think Michal is away until the end of this month.

Yeah, I got his away-from-office message.

-- Steve


