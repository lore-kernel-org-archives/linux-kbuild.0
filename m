Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from www262.sakura.ne.jp ([202.181.97.72]:59385 "EHLO
	www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751194Ab2JSOq1 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 19 Oct 2012 10:46:27 -0400
Subject: Re: [menuconfig] build failure.
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
References: <201210162049.HIC43747.OOtOJHFFFQMVSL@I-love.SAKURA.ne.jp>
	<20121016125821.GA997@d2.synalogic.ca>
In-Reply-To: <20121016125821.GA997@d2.synalogic.ca>
Message-Id: <201210192346.CEF90655.tVFFSOOFOHQLMJ@I-love.SAKURA.ne.jp>
Date: Fri, 19 Oct 2012 23:46:11 +0900
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: bpoirier@suse.de
Cc: mmarek@suse.cz, linux-kbuild@vger.kernel.org

Benjamin Poirier wrote:
> Michal, do you think we're better off:
> * copying the CIRCLEQ macros from sys/queue.h (about 30 lines needed,
>   bsd licenced)

Oops, I didn't notice that sys/queue.h is bsd licenced.
Then, how can we use missing CIRCLEQ macros (from gpl licenced
scripts/kconfig/ files) which is not defined inside bsd licenced
old sys/queue.h but is defined inside bsd licenced new sys/queue.h ?
Is it OK to copy these missing CIRCLEQ macros from bsd licenced new
sys/queue.h to gpl licenced scripts/kconfig/expr.h ?
Or, create a separate file containing only missing CIRCLEQ macros
and #include it (provided that userland tools included in linux's
tarball accepts bsd licenced file)?

> * switching over to kernel-style linked lists using:
> 	* a copy of tools/firewire/list.h
> 	* #include "../../../include/linux/list.h" like perf does in
> 	  tools/perf/util/include/linux/list.h
> 
> -Benjamin
> 
> On 2012/10/16 20:49, Tetsuo Handa wrote:
> > Hello.
> > 
> > Commit 95ac9b3b "menuconfig: Assign jump keys per-page instead of globally"
> > broke menuconfig on legacy environment (Debian Sarge). oops...
> > 
> > # make menuconfig
> >   HOSTCC  scripts/kconfig/mconf.o
> > scripts/kconfig/mconf.c: In function `update_text':
> > scripts/kconfig/mconf.c:326: warning: implicit declaration of function `CIRCLEQ_FOREACH'
> > scripts/kconfig/mconf.c:326: error: `entries' undeclared (first use in this function)
> > scripts/kconfig/mconf.c:326: error: (Each undeclared identifier is reported only once
> > scripts/kconfig/mconf.c:326: error: for each function it appears in.)
> > scripts/kconfig/mconf.c:326: error: syntax error before '{' token
> > scripts/kconfig/mconf.c:333: error: `header' undeclared (first use in this function)
> > scripts/kconfig/mconf.c: At top level:
> > scripts/kconfig/mconf.c:343: error: syntax error before '}' token
> > scripts/kconfig/mconf.c: In function `search_conf':
> > scripts/kconfig/mconf.c:378: warning: implicit declaration of function `CIRCLEQ_HEAD_INITIALIZER'
> > scripts/kconfig/mconf.c:378: error: invalid initializer
> > make[1]: *** [scripts/kconfig/mconf.o] Error 1
> > make: *** [menuconfig] Error 2
> 
