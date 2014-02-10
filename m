Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from iolanthe.rowland.org ([192.131.102.54]:40432 "HELO
	iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751807AbaBJQEe (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 10 Feb 2014 11:04:34 -0500
Date: Mon, 10 Feb 2014 11:04:33 -0500 (EST)
From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH 1/2] usb/host/Kconfig: ohci- / ehci-platform make sure
 PHY_GENERIC is available
In-Reply-To: <1392041327-12596-2-git-send-email-hdegoede@redhat.com>
Message-ID: <Pine.LNX.4.44L0.1402101059210.1593-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb <linux-usb@vger.kernel.org>, linux-kbuild@vger.kernel.org

On Mon, 10 Feb 2014, Hans de Goede wrote:

> Disallow ohci- / ehci-platform being built-in, when the phy core is build as
> a module.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/usb/host/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index e28cbe0..1dd73e3 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -255,7 +255,7 @@ config USB_EHCI_ATH79
>  
>  config USB_EHCI_HCD_PLATFORM
>  	tristate "Generic EHCI driver for a platform device"
> -	depends on !PPC_OF
> +	depends on !PPC_OF && (GENERIC_PHY || !GENERIC_PHY)
>  	default n
>  	---help---
>  	  Adds an EHCI host driver for a generic platform device, which
> @@ -512,6 +512,7 @@ config USB_CNS3XXX_OHCI
>  
>  config USB_OHCI_HCD_PLATFORM
>  	tristate "Generic OHCI driver for a platform device"
> +	depends on GENERIC_PHY || !GENERIC_PHY
>  	default n
>  	---help---
>  	  Adds an OHCI host driver for a generic platform device, which

I would very much like to know of a more straightforward way to do 
this.  Yann, can you suggest anything?

Alan Stern

