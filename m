Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:58017 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752255Ab2JPM63 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 16 Oct 2012 08:58:29 -0400
Date: Tue, 16 Oct 2012 08:58:21 -0400
From: Benjamin Poirier <bpoirier@suse.de>
Subject: Re: [menuconfig] build failure.
Message-ID: <20121016125821.GA997@d2.synalogic.ca>
References: <201210162049.HIC43747.OOtOJHFFFQMVSL@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201210162049.HIC43747.OOtOJHFFFQMVSL@I-love.SAKURA.ne.jp>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: mmarek@suse.cz, linux-kbuild@vger.kernel.org

Michal, do you think we're better off:
* copying the CIRCLEQ macros from sys/queue.h (about 30 lines needed,
  bsd licenced)
* switching over to kernel-style linked lists using:
	* a copy of tools/firewire/list.h
	* #include "../../../include/linux/list.h" like perf does in
	  tools/perf/util/include/linux/list.h

-Benjamin

On 2012/10/16 20:49, Tetsuo Handa wrote:
> Hello.
> 
> Commit 95ac9b3b "menuconfig: Assign jump keys per-page instead of globally"
> broke menuconfig on legacy environment (Debian Sarge). oops...
> 
> # make menuconfig
>   HOSTCC  scripts/kconfig/mconf.o
> scripts/kconfig/mconf.c: In function `update_text':
> scripts/kconfig/mconf.c:326: warning: implicit declaration of function `CIRCLEQ_FOREACH'
> scripts/kconfig/mconf.c:326: error: `entries' undeclared (first use in this function)
> scripts/kconfig/mconf.c:326: error: (Each undeclared identifier is reported only once
> scripts/kconfig/mconf.c:326: error: for each function it appears in.)
> scripts/kconfig/mconf.c:326: error: syntax error before '{' token
> scripts/kconfig/mconf.c:333: error: `header' undeclared (first use in this function)
> scripts/kconfig/mconf.c: At top level:
> scripts/kconfig/mconf.c:343: error: syntax error before '}' token
> scripts/kconfig/mconf.c: In function `search_conf':
> scripts/kconfig/mconf.c:378: warning: implicit declaration of function `CIRCLEQ_HEAD_INITIALIZER'
> scripts/kconfig/mconf.c:378: error: invalid initializer
> make[1]: *** [scripts/kconfig/mconf.o] Error 1
> make: *** [menuconfig] Error 2
