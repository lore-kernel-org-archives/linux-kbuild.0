Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:58697 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756652Ab1IIHsC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 9 Sep 2011 03:48:02 -0400
Subject: Re: [PATCH] Kconfig: Fix help message for DEFAULT_HUNG_TASK_TIMEOUT
From: Jiaju Zhang <jjzhang@suse.de>
In-Reply-To: <4E692ED0.5040906@xenotime.net>
References: <1314783809-20903-1-git-send-email-jjzhang@suse.de>
	 <4E692ED0.5040906@xenotime.net>
Content-Type: text/plain
Date: Fri, 09 Sep 2011 15:46:08 +0800
Message-Id: <1315554368.5428.24.camel@linux-jjzhang>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: linux-kbuild@vger.kernel.org, jkosina@suse.cz, mmarek@suse.cz

On Thu, 2011-09-08 at 14:08 -0700, Randy Dunlap wrote:
> On 08/31/11 02:43, Jiaju Zhang wrote:
> > Added missing _secs in the help message of config DEFAULT_HUNG_TASK_TIMEOUT.
> > 
> > Signed-off-by: Jiaju Zhang <jjzhang@suse.de>
> > ---
> >  lib/Kconfig.debug |    5 +++--
> >  1 files changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index c0cb9c4..f285553 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -248,8 +248,9 @@ config DEFAULT_HUNG_TASK_TIMEOUT
> >  	  to determine when a task has become non-responsive and should
> >  	  be considered hung.
> >  
> > -	  It can be adjusted at runtime via the kernel.hung_task_timeout
> > -	  sysctl or by writing a value to /proc/sys/kernel/hung_task_timeout.
> > +	  It can be adjusted at runtime via the kernel.hung_task_timeout_secs
> > +	  sysctl or by writing a value to
> > +	  /proc/sys/kernel/hung_task_timeout_secs.
> >  
> >  	  A timeout of 0 disables the check.  The default is two minutes.
> >  	  Keeping the default should be fine in most cases.
> 
> Acked-by: Randy Dunlap <rdunlap@xenotime.net>

Many thanks for the ack;)

> 
> Jiri, merge in trivial tree?
> 
> Jiaju, would you also add 'hung_task_timeout_secs' to
> Documentation/sysctl/kernel.txt, please?

Yes. It seems Andrew Morton just added it in -mm tree. In order to avoid
merge conflict, I'd like to write another patch to do this modification
when I go back to office.

Thanks,
Jiaju

