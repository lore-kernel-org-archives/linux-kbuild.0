Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:36225 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753303Ab0BRE06 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 17 Feb 2010 23:26:58 -0500
Date: Wed, 17 Feb 2010 20:16:29 -0800
From: Greg KH <gregkh@suse.de>
Subject: Re: Compile error with gregkh-07-usb-2.6.33-rc7.patch
Message-ID: <20100218041629.GA11556@suse.de>
References: <Pine.LNX.4.44L0.1002121026420.1499-100000@iolanthe.rowland.org> <4B7BFE0D.4000509@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4B7BFE0D.4000509@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Alan Stern <stern@rowland.harvard.edu>, "Gadiyar, Anand" <gadiyar@ti.com>, jidong xiao <jidong.xiao@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, linux-kbuild@vger.kernel.org, Vegard Nossum <vegard.nossum@gmail.com>

On Wed, Feb 17, 2010 at 03:32:45PM +0100, Michal Marek wrote:
> On 12.2.2010 16:30, Alan Stern wrote:
> > On Fri, 12 Feb 2010, Gadiyar, Anand wrote:
> > 
> >>>>> I guess you did _not_ enable CONFIG_PM_RUNTIME, right?
> >>>>>
> >>>>> pm_wq is only defined when CONFIG_PM_RUNTIME is enabled.
> >>>>>
> >>>>>      15 #ifdef CONFIG_PM_RUNTIME
> >>>>>      16
> >>>>>      17 extern struct workqueue_struct *pm_wq;
> >>>>
> >>>> Right, I had CONFIG_PM_RUNTIME disabled. Enabling it allowed the
> >>>> compile to go through.
> >>>>
> >>>> Does that compile failure still needs to be fixed. I'm guessing
> >>>> not everyone will build with this option enabled?
> >>>>
> >>> Well, looking at gregkh-07-usb-2.6.33-rc7.patch, I noticed following
> >>> hunk of patch:
> >>>
> >>> diff -Naur -X linux-2.6.33-rc7-tty/Documentation/dontdiff linux-2.6.33-rc7-tty/drivers/usb/core/Kconfig linux-2.6.33-rc7-usb/drivers/usb/core/Kconfig
> >>> --- linux-2.6.33-rc7-tty/drivers/usb/core/Kconfig       2009-09-09 15:13:59.000000000 -0700
> >>> +++ linux-2.6.33-rc7-usb/drivers/usb/core/Kconfig       2010-02-09 13:21:32.000000000 -0800
> >>> @@ -91,8 +91,8 @@
> >>>           If you are unsure about this, say N here.
> >>>
> >>>  config USB_SUSPEND
> >>> -       bool "USB selective suspend/resume and wakeup"
> >>> -       depends on USB && PM
> >>> +       bool "USB runtime power management (suspend/resume and wakeup)"
> >>> +       depends on USB && PM_RUNTIME
> >>>         help
> >>>           If you say Y here, you can use driver calls or the sysfs
> >>>           "power/level" file to suspend or resume individual USB
> >>>
> >>> This patch is saying, USB_SUSPEND is depends on PM_RUNTIME, in your
> >>> case, USB_SUSPEND is enabled, but PM_RUNTIME is disabled, this is a
> >>> little bit strange, I guess you have manually edited .config instead
> >>> of running the command `make menuconfig`. I am afraid this might cause
> >>> some dependency problem.
> >>
> >> Nope. I did `make ARCH=arm omap_3430sdp_defconfig`, and this generated
> >> the .config. Wouldn't the dependencies be taken care of by this?
> >>
> >> (omap_3430sdp_defconfig has CONFIG_USB_SUSPEND=y and CONFIG_PM_RUNTIME
> >> not set, since the defconfig is old. But wouldn't CONFIG_USB_SUSPEND
> >> get turned off in this case?)
> > 
> > I would expect it to get turned off.  This sounds like a bug in the
> > kernel build system.  Adding the linux-kbuild mailing list to the CC:.
> 
> The problem is a few lines below
> 
> config USB_OTG
> 	bool
> 	depends on USB && EXPERIMENTAL
> 	select USB_SUSPEND
>         ^^^^^^^^^^^^^^^^^^
> 	default n
> 
> This triggers a know bug of the select statement
> (Documentation/kbuild/kconfig-language.txt):
> 
> 	select should be used with care. select will force
> 	a symbol to a value without visiting the dependencies.
> 	By abusing select you are able to select a symbol FOO even
> 	if FOO depends on BAR that is not set.
> 	In general use select only for non-visible symbols
> 	(no prompts anywhere) and for symbols with no dependencies.
> 	That will limit the usefulness but on the other hand avoid
> 	the illegal configurations all over.
> 	kconfig should one day warn about such things.
> 
> Vegard Nossum is going to work on replacing the current kconfig
> dependency solver with something smarter during this year's GSoC, so
> there is light at the end of the tunnel. In the meantime, you can change
> the logic from "select USB_SUSPEND" to "depends on USB_SUSPEND". This
> will force one to first set USB_SUSPEND manually, but will avoid the
> build error.

A patch to do this would probably be best so we don't run into it again.

thanks,

greg k-h
