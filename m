Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:54438 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751923Ab0JFMBn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 6 Oct 2010 08:01:43 -0400
Message-ID: <4CAC6521.3050303@suse.cz>
Date: Wed, 06 Oct 2010 14:01:37 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [RFC PATCH] usb: makefile cleanup
References: <1286351501-24413-1-git-send-email-mfm@muteddisk.com>
In-Reply-To: <1286351501-24413-1-git-send-email-mfm@muteddisk.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: matt mooney <mfm@muteddisk.com>
Cc: linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

On 6.10.2010 09:51, matt mooney wrote:
> For all modules, change <module>-objs to <module>-y; remove
> if-statements and replace with lists using the kbuild idiom; move
> flags to the top of the file; and fix alignment while trying to
> maintain the original scheme in each file.
> 
> None of the dependencies are modified.
> 
> Signed-off-by: matt mooney <mfm@muteddisk.com>
> ---
> 
> So here is a sample cleanup patch; I am not posting it to greg-kh or
> the rest of the necessary usb guys yet because I would like to know
> what you guys think first.

The elimination of conditionals in Makefiles is definitely worth it. Not
sure about pure whitespace fixes, if the USB developers don't show
interest, you can try pushing these through trivial@kernel.org. I have
only one remark below:

> diff --git a/drivers/usb/musb/Makefile b/drivers/usb/musb/Makefile
> index 4fd29f8..b1f79ae 100644
> --- a/drivers/usb/musb/Makefile
> +++ b/drivers/usb/musb/Makefile
> [...]
>  # the kconfig must guarantee that only one of the
>  # possible I/O schemes will be enabled at a time ...
> @@ -54,24 +27,17 @@ endif
>  ifneq ($(CONFIG_MUSB_PIO_ONLY),y)
>  
>    ifeq ($(CONFIG_USB_INVENTRA_DMA),y)
> -    musb_hdrc-objs		+= musbhsdma.o
> +    musb_hdrc-y			+= musbhsdma.o
>  
>    else
>      ifeq ($(CONFIG_USB_TI_CPPI_DMA),y)
> -      musb_hdrc-objs		+= cppi_dma.o
> +      musb_hdrc-y		+= cppi_dma.o
>  
>      else
>        ifeq ($(CONFIG_USB_TUSB_OMAP_DMA),y)
> -        musb_hdrc-objs		+= tusb6010_omap.o
> +	musb_hdrc-y		+= tusb6010_omap.o
>  
>        endif
>      endif
>    endif
>  endif

So this wasn't exactly elegant before and you are only changing *-objs
to *-y. Looking at drivers/usb/musb/Kconfig, al the three USB_*_DMA
depend on !MUSB_PIO_ONLY, so the outermost if statement can go away.
Furthermore, the intent seems to be to only enable one of the four modes
(MUSB_PIO_ONLY, USB_INVENTRA_DMA, USB_TI_CPPI_DMA or USB_TUSB_OMAP_DMA),
so it is a perfect candidate for a "choice" group. Have a look e.g. at
"PCI access mode" in arch/x86/Kconfig. Then, the Makefile part can be
reduced to three lines without any ifs.

Michal

