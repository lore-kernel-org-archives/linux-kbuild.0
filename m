Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:34849 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751150AbZIJQI2 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 10 Sep 2009 12:08:28 -0400
Date: Thu, 10 Sep 2009 09:08:06 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: UWB Kconfig: cannot set UWB to N in gconfig
Message-Id: <20090910090806.e8db2300.randy.dunlap@oracle.com>
In-Reply-To: <1252577154.2340.12.camel@castor>
References: <1252577154.2340.12.camel@castor>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Richard Kennedy <richard@rsk.demon.co.uk>
Cc: David Vrabel <david.vrabel@csr.com>, Roman Zippel <zippel@linux-m68k.org>, linux-usb <linux-usb@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

On Thu, 10 Sep 2009 11:05:54 +0100 Richard Kennedy wrote:

> I sometimes use 'make gconfig' and I noticed that I cannot disable the
> UWB option -- it just won't let me set it to N.

Not specific to 'gconfig'.

> AFAICT this is because the CONFIG USB_WUSB selects UWB which forces it
> on.

Yes.

> applying this patch fixes the issue but I'm not sure if this is the
> right way to go about it.
> 
> any thoughts?

UWB can be disabled by disabling both of these options that are several
entries below it in the same menu:

USB_WHCI_HCD and USB_HWA_HCD

and then returning to UWB and disabling it.

Should users have to figure that out?  no.


> This is against 2.6.31
> 
> 
> diff --git a/drivers/usb/wusbcore/Kconfig b/drivers/usb/wusbcore/Kconfig
> index eb09a0a..cc97041 100644
> --- a/drivers/usb/wusbcore/Kconfig
> +++ b/drivers/usb/wusbcore/Kconfig
> @@ -5,7 +5,7 @@ config USB_WUSB
>  	tristate "Enable Wireless USB extensions (EXPERIMENTAL)"
>  	depends on EXPERIMENTAL
>  	depends on USB
> -        select UWB
> +        depends on UWB
>          select CRYPTO
>          select CRYPTO_BLKCIPHER
>          select CRYPTO_CBC

use tabs, not spaces.


---
~Randy
LPC 2009, Sept. 23-25, Portland, Oregon
http://linuxplumbersconf.org/2009/
