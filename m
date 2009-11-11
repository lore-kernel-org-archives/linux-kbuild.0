Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.gmx.net ([213.165.64.20]:51480 "HELO mail.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1753761AbZKKHf0 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 11 Nov 2009 02:35:26 -0500
Date: Wed, 11 Nov 2009 08:35:32 +0100 (CET)
From: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Subject: Re: [PATCH/RFC] fb: put framebuffer drivers back under the "frame
 buffer devices" menu
In-Reply-To: <20091110165114.4972b8b4.akpm@linux-foundation.org>
Message-ID: <Pine.LNX.4.64.0911110834010.4072@axis700.grange>
References: <Pine.LNX.4.64.0911082339090.24656@axis700.grange>
 <20091110165114.4972b8b4.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-fbdev-devel@lists.sourceforge.net, linux-kbuild@vger.kernel.org, Roman Zippel <zippel@linux-m68k.org>

On Tue, 10 Nov 2009, Andrew Morton wrote:

> On Sun, 8 Nov 2009 23:46:24 +0100 (CET)
> Guennadi Liakhovetski <g.liakhovetski@gmx.de> wrote:
> 
> > The config FB_PRE_INIT_FB entry in drivers/video/Kconfig pushes all entries
> > below it out of the menuconfig selection. Fix this.
> > 
> > Signed-off-by: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> > ---
> > 
> > This is _most_ _probably_ not a right fix, but rather an observation, that 
> > the patch below fixes the problem, whereby all entires below 
> > FB_PRE_INIT_FB get displaced from the "frame buffer devices" menu. A bug 
> > in kconfig? The additional dependency on FB in this patch is certainly 
> > redundant.
> > 
> >  drivers/video/Kconfig |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> > 
> > diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
> > index 9bbb285..188e1ba 100644
> > --- a/drivers/video/Kconfig
> > +++ b/drivers/video/Kconfig
> > @@ -2121,7 +2121,7 @@ config FB_EP93XX
> >  
> >  config FB_PRE_INIT_FB
> >  	bool "Don't reinitialize, use bootloader's GDC/Display configuration"
> > -	depends on FB_MB862XX_LIME
> > +	depends on FB && FB_MB862XX_LIME
> >  	---help---
> >  	  Select this option if display contents should be inherited as set by
> >  	  the bootloader.
> 
> hmm, well, lots of surrounding records also have `depends on FB', and
> it fixes the bug, so I see no problem with using the patch as-is.

Well, not that much of a problem with applying this patch, but this seems 
like a bug in kernel kconfig system, and by applying this patch we paper 
over it without having found, understood and fixed it.

Thanks
Guennadi
---
Guennadi Liakhovetski, Ph.D.
Freelance Open-Source Software Developer
http://www.open-technology.de/
