Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.123]:39474 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757402Ab0BCQMe (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 3 Feb 2010 11:12:34 -0500
Subject: Re: [PATCH 4/4] kconfig: Add LSMOD=file to override the lsmod for
 localmodconfig
From: Steven Rostedt <rostedt@goodmis.org>
Reply-To: rostedt@goodmis.org
In-Reply-To: <20100203160708.GA9035@sepie.suse.cz>
References: <20100203154605.461025238@goodmis.org>
	 <20100203154906.499020585@goodmis.org>
	 <20100203160708.GA9035@sepie.suse.cz>
Content-Type: text/plain; charset="ISO-8859-15"
Date: Wed, 03 Feb 2010 11:12:33 -0500
Message-ID: <1265213553.24386.0.camel@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Anibal Monsalve Salazar <anibal@debian.org>

On Wed, 2010-02-03 at 17:07 +0100, Michal Marek wrote:
> On Wed, Feb 03, 2010 at 10:46:09AM -0500, Steven Rostedt wrote:
> > +# if no path is given, then use src directory to find file
> > +ifdef LSMOD
> > +LSMOD_F = $(shell if [ `basename $(LSMOD)` == $(LSMOD) ]; then \
> > +		echo $(objtree)/$(LSMOD);			\
> > +	else							\
> > +		echo $(LSMOD);					\
> > +	fi)
> > +endif
> 
> You can do this within make like:
> 
> ifdef LSMOD
> LSMOD_F := $(LSMOD)
> ifeq ($(findstring /,$(LSMOD)),)
>   LSMOD_F := $(objtree)/$(LSMOD)
> endif
> endif

You can send me a patch and I'll apply it on top.

Thanks,

-- Steve


