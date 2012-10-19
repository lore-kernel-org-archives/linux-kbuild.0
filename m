Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:58727 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932281Ab2JSPRf (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 19 Oct 2012 11:17:35 -0400
Message-ID: <50816F0B.7040001@suse.cz>
Date: Fri, 19 Oct 2012 17:17:31 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [menuconfig] build failure.
References: <201210162049.HIC43747.OOtOJHFFFQMVSL@I-love.SAKURA.ne.jp> <20121016125821.GA997@d2.synalogic.ca>
In-Reply-To: <20121016125821.GA997@d2.synalogic.ca>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Benjamin Poirier <bpoirier@suse.de>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, linux-kbuild@vger.kernel.org, Arnaud Lacombe <lacombar@gmail.com>

On 16.10.2012 14:58, Benjamin Poirier wrote:
> Michal, do you think we're better off:
> * copying the CIRCLEQ macros from sys/queue.h (about 30 lines needed,
>   bsd licenced)
> * switching over to kernel-style linked lists using:
> 	* a copy of tools/firewire/list.h
> 	* #include "../../../include/linux/list.h" like perf does in
> 	  tools/perf/util/include/linux/list.h

I did not know that linux/list.h can be used by userspace without
modifications. But I guess such dependency would still be inconvenient
for people who are using kconfig externally. Arnaud, what do you think?
So I think that the next-best thing is to copy tools/firewire/list.h.
That way, we avoid all the ifdefs.

Michal
