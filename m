Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp5.pp.htv.fi ([213.243.153.39]:48085 "EHLO smtp5.pp.htv.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753927AbYJ3LDb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 30 Oct 2008 07:03:31 -0400
Date: Thu, 30 Oct 2008 13:02:11 +0200
From: Adrian Bunk <bunk@kernel.org>
Subject: Re: [patch 12/13] kconfig: add module_name shortcut
Message-ID: <20081030110211.GA25873@cs181140183.pp.htv.fi>
References: <200810292120.m9TLKFgx019406@imap1.linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <200810292120.m9TLKFgx019406@imap1.linux-foundation.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: sam@ravnborg.org, linux-kbuild@vger.kernel.org, adobriyan@gmail.com, zippel@linux-m68k.org

On Wed, Oct 29, 2008 at 02:20:14PM -0700, akpm@linux-foundation.org wrote:
> From: Alexey Dobriyan <adobriyan@gmail.com>
> 
> As correctly noticed in bug 11446
> (http://bugzilla.kernel.org/show_bug.cgi?id=11446) "To compile this driver
> as a module, blah-blah" boilerplate is being copy-pasted to death with
> slight variations.
> 
> Add Kconfig token "module_name" to supply module's name. Example:
> 
> 	config FOO
> 		tristate "foo"
> 		module_name foo
> 		---help---
> 		  foo
> 
> Print module's name as following on menuconfigs help screen (press 'h'):
> 
> 	Module name: foo
> 
> 8139too driver converted to show real-life example.
> 
> P.S.: menuconfig only, no checking wrt modular/standalone code et al.
>...

We have 4 interfaces, and for not losing information all of them have to 
support it.

> --- a/drivers/net/Kconfig~kconfig-add-module_name-shortcut
> +++ a/drivers/net/Kconfig
> @@ -1549,14 +1549,12 @@ config 8139TOO
>  	depends on NET_PCI && PCI
>  	select CRC32
>  	select MII
> +	module_name 8139too
>  	---help---
>  	  This is a driver for the Fast Ethernet PCI network cards based on
>  	  the RTL 8129/8130/8139 chips. If you have one of those, say Y and
>  	  read the Ethernet-HOWTO <http://www.tldp.org/docs.html#howto>.
>  
> -	  To compile this driver as a module, choose M here: the module
> -	  will be called 8139too.  This is recommended.
> -
>...

Are you planning any further usage of the module_name?

Currently your patch seems to be in menuconfig equivalent to

-       To compile this driver as a module, choose M here: the module
-       will be called 8139too.  This is recommended.
+	Module name: 8139too

I don't have any strong opinion whether that's better or worse, but if 
that's the only change we don't need a new kconfig syntax for it.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

