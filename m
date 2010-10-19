Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:34819 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751388Ab0JSGVl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Oct 2010 02:21:41 -0400
Date: Tue, 19 Oct 2010 08:21:29 +0200
From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH v2][GIT PULL] ftrace: Remove recursion between
 recordmcount and scripts/mod/empty
Message-ID: <20101019062127.GA21782@elte.hu>
References: <1287437213.16971.333.camel@gandalf.stny.rr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1287437213.16971.333.camel@gandalf.stny.rr.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Frederic Weisbecker <fweisbec@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>


* Steven Rostedt <rostedt@goodmis.org> wrote:

> 
> Ingo,
> 
> Please pull the latest tip/perf/recordmcount-2 tree, which can be found at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-2.6-trace.git
> tip/perf/recordmcount-2
> 
> 
> Steven Rostedt (1):
>       ftrace: Remove recursion between recordmcount and scripts/mod/empty
> 
> ----
>  scripts/Makefile.build |    8 +++++++-
>  1 files changed, 7 insertions(+), 1 deletions(-)

Pulled, thanks Steve!

	Ingo
