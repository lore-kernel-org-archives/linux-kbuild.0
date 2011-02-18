Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:32945 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752846Ab1BRAIe (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 17 Feb 2011 19:08:34 -0500
From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH] simplify kernel/power/Kconfig
Date: Fri, 18 Feb 2011 01:08:14 +0100
References: <4D5D31E3020000780003263F@vpn.id2.novell.com>
In-Reply-To: <4D5D31E3020000780003263F@vpn.id2.novell.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201102180108.14916.rjw@sisk.pl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@novell.com>
Cc: pavel@ucw.cz, Linux-pm mailing list <linux-pm@lists.linux-foundation.org>, linux-kbuild@vger.kernel.org

On Thursday, February 17, 2011, Jan Beulich wrote:
> 'n' defaults are pretty pointless and actually bogus when used with
> prompt-less config options.
> 
> The "bool"/"default y" pair with no prompt can be expressed more
> compactly using def_bool.
> 
> Signed-off-by: Jan Beulich <jbeulich@novell.com>

Applied to suspend-2.6/linux-next, but I had to rebase it.  Please
remember to check if the patch applies to linux-next next time.

Thanks,
Rafael


> ---
>  kernel/power/Kconfig |   13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
> 
> --- 2.6.38-rc5/kernel/power/Kconfig
> +++ 2.6.38-rc5-kconfig-power/kernel/power/Kconfig
> @@ -30,7 +30,6 @@ config PM_DEBUG
>  config PM_ADVANCED_DEBUG
>  	bool "Extra PM attributes in sysfs for low-level debugging/testing"
>  	depends on PM_DEBUG
> -	default n
>  	---help---
>  	Add extra sysfs attributes allowing one to access some Power Management
>  	fields of device objects from user space.  If you are not a kernel
> @@ -39,7 +38,6 @@ config PM_ADVANCED_DEBUG
>  config PM_VERBOSE
>  	bool "Verbose Power Management debugging"
>  	depends on PM_DEBUG
> -	default n
>  	---help---
>  	This option enables verbose messages from the Power Management code.
>  
> @@ -67,7 +65,6 @@ config PM_TRACE_RTC
>  	depends on CAN_PM_TRACE
>  	depends on X86
>  	select PM_TRACE
> -	default n
>  	---help---
>  	This enables some cheesy code to save the last PM event point in the
>  	RTC across reboots, so that you can debug a machine that just hangs
> @@ -82,23 +79,20 @@ config PM_TRACE_RTC
>  	set to an invalid time after a resume.
>  
>  config PM_SLEEP_SMP
> -	bool
> +	def_bool y
>  	depends on SMP
>  	depends on ARCH_SUSPEND_POSSIBLE || ARCH_HIBERNATION_POSSIBLE
>  	depends on PM_SLEEP
>  	select HOTPLUG
>  	select HOTPLUG_CPU
> -	default y
>  
>  config PM_SLEEP
> -	bool
> +	def_bool y
>  	depends on SUSPEND || HIBERNATION || XEN_SAVE_RESTORE
> -	default y
>  
>  config PM_SLEEP_ADVANCED_DEBUG
>  	bool
>  	depends on PM_ADVANCED_DEBUG
> -	default n
>  
>  config SUSPEND
>  	bool "Suspend to RAM and standby"
> @@ -237,9 +231,8 @@ config PM_RUNTIME
>  	  wake-up events.
>  
>  config PM_OPS
> -	bool
> +	def_bool y
>  	depends on PM_SLEEP || PM_RUNTIME
> -	default y
>  
>  config ARCH_HAS_OPP
>  	bool
> 
> 
> 
> 
> 

