Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from qmta03.emeryville.ca.mail.comcast.net ([76.96.30.32]:51499 "EHLO
	qmta03.emeryville.ca.mail.comcast.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1759577Ab0JGATP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 6 Oct 2010 20:19:15 -0400
Date: Wed, 6 Oct 2010 17:17:03 -0700
From: matt mooney <mfm@muteddisk.com>
Subject: Re: [RFC PATCH] usb: makefile cleanup
Message-ID: <20101007001703.GA31483@haskell.muteddisk.com>
References: <1286351501-24413-1-git-send-email-mfm@muteddisk.com>
 <4CAC6521.3050303@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4CAC6521.3050303@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

On 14:01 Wed 06 Oct     , Michal Marek wrote:
> On 6.10.2010 09:51, matt mooney wrote:
> > For all modules, change <module>-objs to <module>-y; remove
> > if-statements and replace with lists using the kbuild idiom; move
> > flags to the top of the file; and fix alignment while trying to
> > maintain the original scheme in each file.
> > 
> > None of the dependencies are modified.
> > 
> > Signed-off-by: matt mooney <mfm@muteddisk.com>
> > ---
> > 
> > So here is a sample cleanup patch; I am not posting it to greg-kh or
> > the rest of the necessary usb guys yet because I would like to know
> > what you guys think first.
> 
> The elimination of conditionals in Makefiles is definitely worth it. Not
> sure about pure whitespace fixes, if the USB developers don't show
> interest, you can try pushing these through trivial@kernel.org. I have
> only one remark below:

I questioned this myself, but I concluded that whitespace fixes help with
readability (of course this is purely subjective).

> > diff --git a/drivers/usb/musb/Makefile b/drivers/usb/musb/Makefile
> > index 4fd29f8..b1f79ae 100644
> > --- a/drivers/usb/musb/Makefile
> > +++ b/drivers/usb/musb/Makefile
> > [...]
> >  # the kconfig must guarantee that only one of the
> >  # possible I/O schemes will be enabled at a time ...
> > @@ -54,24 +27,17 @@ endif
> >  ifneq ($(CONFIG_MUSB_PIO_ONLY),y)
> >  
> >    ifeq ($(CONFIG_USB_INVENTRA_DMA),y)
> > -    musb_hdrc-objs		+= musbhsdma.o
> > +    musb_hdrc-y			+= musbhsdma.o
> >  
> >    else
> >      ifeq ($(CONFIG_USB_TI_CPPI_DMA),y)
> > -      musb_hdrc-objs		+= cppi_dma.o
> > +      musb_hdrc-y		+= cppi_dma.o
> >  
> >      else
> >        ifeq ($(CONFIG_USB_TUSB_OMAP_DMA),y)
> > -        musb_hdrc-objs		+= tusb6010_omap.o
> > +	musb_hdrc-y		+= tusb6010_omap.o
> >  
> >        endif
> >      endif
> >    endif
> >  endif
> 
> So this wasn't exactly elegant before and you are only changing *-objs
> to *-y. Looking at drivers/usb/musb/Kconfig, al the three USB_*_DMA
> depend on !MUSB_PIO_ONLY, so the outermost if statement can go away.
> Furthermore, the intent seems to be to only enable one of the four modes
> (MUSB_PIO_ONLY, USB_INVENTRA_DMA, USB_TI_CPPI_DMA or USB_TUSB_OMAP_DMA),
> so it is a perfect candidate for a "choice" group. Have a look e.g. at
> "PCI access mode" in arch/x86/Kconfig. Then, the Makefile part can be
> reduced to three lines without any ifs.

I thought this section was more of a Kconfig issue although I am not all that
familiar with Kconfig yet. After I look into it a little more and better
understand your advice, I will send a separate patch to fix this.

Thanks,
mfm
