Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:48095 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753076Ab3DVRI6 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 22 Apr 2013 13:08:58 -0400
Message-ID: <51756E95.7010800@infradead.org>
Date: Mon, 22 Apr 2013 10:08:37 -0700
From: Randy Dunlap <rdunlap@infradead.org>
MIME-Version: 1.0
Subject: Re: non-visible options vs menuconfigs
References: <201304221251.54695.vapier@gentoo.org>
In-Reply-To: <201304221251.54695.vapier@gentoo.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mike Frysinger <vapier@gentoo.org>
Cc: linux-kbuild@vger.kernel.org

On 04/22/13 09:51, Mike Frysinger wrote:
> the current EXPERT menuconfig is broken by some new options that happen to be 
> sprinkled into the wrong place.  seems like if a node is unprintable, it 
> should get skipped for menuconfig purposes ?  otherwise, this is a constantly 
> losing battle where someone inserts new Kconfig options and forgets this 
> nuance, and then it stays broken for a while until someone notices.  this 
> particular bug wrt EXPERT has been linux-3.2.

I only noticed a few days ago and then forgot to send a patch for it.

> for example, in the General setup section, you currently see:
> 	[ ] Configure standard kernel features (expert users)  --->
> 	[ ] Embedded system
> 
> if you enable EXPERT there, the options get dumped into the same level instead 
> of being under that menuconfig:
> 	[*] Configure standard kernel features (expert users)  --->
> 	[ ] Sysctl syscall support
> 	[*] Load all symbols for debugging/ksymoops
> 	...
> 	[ ] Embedded system
> 
> is this feasible in the kconfig code ?

A kconfig fix would be very nice.

for the patch below:
Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> -mike
> 
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1177,6 +1177,35 @@ config SYSCTL
>  config ANON_INODES
>  	bool
>  
> +config HAVE_UID16
> +	bool
> +
> +config SYSCTL_EXCEPTION_TRACE
> +	bool
> +	help
> +	  Enable support for /proc/sys/debug/exception-trace.
> +
> +config SYSCTL_ARCH_UNALIGN_NO_WARN
> +	bool
> +	help
> +	  Enable support for /proc/sys/kernel/ignore-unaligned-usertrap
> +	  Allows arch to define/use @no_unaligned_warning to possibly warn
> +	  about unaligned access emulation going on under the hood.
> +
> +config SYSCTL_ARCH_UNALIGN_ALLOW
> +	bool
> +	help
> +	  Enable support for /proc/sys/kernel/unaligned-trap
> +	  Allows arches to define/use @unaligned_enabled to runtime toggle
> +	  the unaligned access emulation.
> +	  see arch/parisc/kernel/unaligned.c for reference
> +
> +config HOTPLUG
> +	def_bool y
> +
> +config HAVE_PCSPKR_PLATFORM
> +	bool
> +
>  menuconfig EXPERT
>  	bool "Configure standard kernel features (expert users)"
>  	# Unhide debug options, to make the on-by-default options visible
> @@ -1187,9 +1216,6 @@ menuconfig EXPERT
>            environments which can tolerate a "non-standard" kernel.
>            Only use this if you really know what you are doing.
>  
> -config HAVE_UID16
> -	bool
> -
>  config UID16
>  	bool "Enable 16-bit UID system calls" if EXPERT
>  	depends on HAVE_UID16
> @@ -1214,26 +1240,6 @@ config SYSCTL_SYSCALL
>  
>  	  If unsure say N here.
>  
> -config SYSCTL_EXCEPTION_TRACE
> -	bool
> -	help
> -	  Enable support for /proc/sys/debug/exception-trace.
> -
> -config SYSCTL_ARCH_UNALIGN_NO_WARN
> -	bool
> -	help
> -	  Enable support for /proc/sys/kernel/ignore-unaligned-usertrap
> -	  Allows arch to define/use @no_unaligned_warning to possibly warn
> -	  about unaligned access emulation going on under the hood.
> -
> -config SYSCTL_ARCH_UNALIGN_ALLOW
> -	bool
> -	help
> -	  Enable support for /proc/sys/kernel/unaligned-trap
> -	  Allows arches to define/use @unaligned_enabled to runtime toggle
> -	  the unaligned access emulation.
> -	  see arch/parisc/kernel/unaligned.c for reference
> -
>  config KALLSYMS
>  	 bool "Load all symbols for debugging/ksymoops" if EXPERT
>  	 default y
> @@ -1259,9 +1265,6 @@ config KALLSYMS_ALL
>  
>  	   Say N unless you really need all symbols.
>  
> -config HOTPLUG
> -	def_bool y
> -
>  config PRINTK
>  	default y
>  	bool "Enable support for printk" if EXPERT
> @@ -1300,9 +1303,6 @@ config PCSPKR_PLATFORM
>            This option allows to disable the internal PC-Speaker
>            support, saving some memory.
>  
> -config HAVE_PCSPKR_PLATFORM
> -	bool
> -
>  config BASE_FULL
>  	default y
>  	bool "Enable full-sized data structures for core" if EXPERT
> 


-- 
~Randy
