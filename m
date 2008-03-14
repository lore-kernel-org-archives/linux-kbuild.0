Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:44277 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754774AbYCNUn6 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Mar 2008 16:43:58 -0400
Date: Fri, 14 Mar 2008 13:43:01 -0700
From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] THERMAL must not select HWMON
Message-Id: <20080314134301.ed77baf7.akpm@linux-foundation.org>
In-Reply-To: <20080314183758.GA15028@wavehammer.waldi.eu.org>
References: <20080314175501.GA11107@wavehammer.waldi.eu.org>
	<20080314112112.c00cbcdd.rdunlap@xenotime.net>
	<20080314183758.GA15028@wavehammer.waldi.eu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bastian Blank <bastian@waldi.eu.org>
Cc: rdunlap@xenotime.net, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, rui.zhang@intel.com

On Fri, 14 Mar 2008 19:37:58 +0100
Bastian Blank <bastian@waldi.eu.org> wrote:

> On Fri, Mar 14, 2008 at 11:21:12AM -0700, Randy Dunlap wrote:
> 
> [ select forces HWMON to yes even if deps are never applicable ]
> 
> > Yes, that's a known & longstanding problem (that select does not
> > follow/honor dependencies).
> 
> Okay.
> 
> So THERMAL can't select HWMON, instead it needs to do a proper depends.
> 
> Bastian
> 
> Signed-off-by: Bastian Blank <waldi@debian.org>
> Cc: Zhang Rui <rui.zhang@intel.com>
> 
> diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
> index 3ab313e..394912c 100644
> --- a/drivers/thermal/Kconfig
> +++ b/drivers/thermal/Kconfig
> @@ -4,7 +4,7 @@
>  
>  menuconfig THERMAL
>  	bool "Generic Thermal sysfs driver"
> -	select HWMON
> +	depends on HWMON
>  	default y
>  	help
>  	  Generic Thermal Sysfs driver offers a generic mechanism for

Sorry, but we have insufficient information here.

Presumably it fixes some build error, but the changelog should tell us (at
least) what that error was, why it occurs and how the patch fixes it.

Often (for bugfixes) I'll go off and find this stuff out from the mailing
list and put together a proper description.  I also need to do this so I
can work out whether the patch is needed in 2.6.25 or -stable.  But I can't
even find any reference to the original problem in the lkml archives.

