Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pqueueb.post.tele.dk ([193.162.153.10]:35363 "EHLO
	pqueueb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751695Ab0JFRLc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 6 Oct 2010 13:11:32 -0400
Received: from pfepb.post.tele.dk (pfepb.post.tele.dk [195.41.46.236])
	by pqueueb.post.tele.dk (Postfix) with ESMTP id 501218215
	for <linux-kbuild@vger.kernel.org>; Wed,  6 Oct 2010 18:50:30 +0200 (CEST)
Date: Wed, 6 Oct 2010 18:50:04 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [RFC PATCH] usb: makefile cleanup
Message-ID: <20101006165004.GA25221@merkur.ravnborg.org>
References: <1286351501-24413-1-git-send-email-mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1286351501-24413-1-git-send-email-mfm@muteddisk.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: matt mooney <mfm@muteddisk.com>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>

On Wed, Oct 06, 2010 at 12:51:41AM -0700, matt mooney wrote:
> For all modules, change <module>-objs to <module>-y; remove
> if-statements and replace with lists using the kbuild idiom; move
> flags to the top of the file; and fix alignment while trying to
> maintain the original scheme in each file.
> 
> None of the dependencies are modified.
> 
> Signed-off-by: matt mooney <mfm@muteddisk.com>

Looks good. I agree with Michal's comment about
moving the complexity from MAkefile to Kconfig.
But I think that should be a follow-up patch.

You can add my:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

Two trivial comments...
You can keep my ack independent of addressing these comments or not.

	Sam

> diff --git a/drivers/usb/host/whci/Kbuild b/drivers/usb/host/whci/Kbuild
> index 11e5040..26df013 100644
> --- a/drivers/usb/host/whci/Kbuild
> +++ b/drivers/usb/host/whci/Kbuild
> @@ -3,7 +3,7 @@ obj-$(CONFIG_USB_WHCI_HCD) += whci-hcd.o
>  whci-hcd-y := \
>  	asl.o	\
>  	debug.o \
> -	hcd.o 	\
> +	hcd.o	\
>  	hw.o	\
>  	init.o	\
>  	int.o	\

I would be good to loose the "\"

> diff --git a/drivers/usb/wusbcore/Makefile b/drivers/usb/wusbcore/Makefile
> index f0d8045..b3bd313 100644
> --- a/drivers/usb/wusbcore/Makefile
> +++ b/drivers/usb/wusbcore/Makefile
> @@ -1,9 +1,11 @@
> +ccflags-$(CONFIG_USB_WUSB_CBAF_DEBUG) := -DDEBUG
> +
>  obj-$(CONFIG_USB_WUSB)		+= wusbcore.o
>  obj-$(CONFIG_USB_HWA_HCD)	+= wusb-wa.o
>  obj-$(CONFIG_USB_WUSB_CBAF)	+= wusb-cbaf.o
>  
>  
> -wusbcore-objs := 	\
> +wusbcore-y :=		\
>  	crypto.o	\
>  	devconnect.o	\
>  	dev-sysfs.o	\
> @@ -14,11 +16,10 @@ wusbcore-objs := 	\
>  	security.o	\
>  	wusbhc.o
>  
> -wusb-cbaf-objs := cbaf.o
> +wusb-cbaf-y := cbaf.o
>  
> -wusb-wa-objs :=	wa-hc.o		\
> -		wa-nep.o	\
> -		wa-rpipe.o	\
> -		wa-xfer.o
> -
> -ccflags-$(CONFIG_USB_WUSB_CBAF_DEBUG) := -DDEBUG
> +wusb-wa-y :=		\
> +	wa-hc.o		\
> +	wa-nep.o	\
> +	wa-rpipe.o	\
> +	wa-xfer.o
This file could also benefit from loosing the excessive use of "\".

	Sam
