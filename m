Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from iolanthe.rowland.org ([192.131.102.54]:55980 "HELO
	iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1756259Ab0BLPaG (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 12 Feb 2010 10:30:06 -0500
Date: Fri, 12 Feb 2010 10:30:01 -0500 (EST)
From: Alan Stern <stern@rowland.harvard.edu>
Subject: RE: Compile error with gregkh-07-usb-2.6.33-rc7.patch
In-Reply-To: <5A47E75E594F054BAF48C5E4FC4B92AB031E80D6E0@dbde02.ent.ti.com>
Message-ID: <Pine.LNX.4.44L0.1002121026420.1499-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Gadiyar, Anand" <gadiyar@ti.com>
Cc: jidong xiao <jidong.xiao@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Greg Kroah-Hartman <gregkh@suse.de>, linux-kbuild@vger.kernel.org

On Fri, 12 Feb 2010, Gadiyar, Anand wrote:

> > >> I guess you did _not_ enable CONFIG_PM_RUNTIME, right?
> > >>
> > >> pm_wq is only defined when CONFIG_PM_RUNTIME is enabled.
> > >>
> > >>      15 #ifdef CONFIG_PM_RUNTIME
> > >>      16
> > >>      17 extern struct workqueue_struct *pm_wq;
> > >
> > > Right, I had CONFIG_PM_RUNTIME disabled. Enabling it allowed the
> > > compile to go through.
> > >
> > > Does that compile failure still needs to be fixed. I'm guessing
> > > not everyone will build with this option enabled?
> > >
> > Well, looking at gregkh-07-usb-2.6.33-rc7.patch, I noticed following
> > hunk of patch:
> > 
> > diff -Naur -X linux-2.6.33-rc7-tty/Documentation/dontdiff linux-2.6.33-rc7-tty/drivers/usb/core/Kconfig linux-2.6.33-rc7-usb/drivers/usb/core/Kconfig
> > --- linux-2.6.33-rc7-tty/drivers/usb/core/Kconfig       2009-09-09 15:13:59.000000000 -0700
> > +++ linux-2.6.33-rc7-usb/drivers/usb/core/Kconfig       2010-02-09 13:21:32.000000000 -0800
> > @@ -91,8 +91,8 @@
> >           If you are unsure about this, say N here.
> > 
> >  config USB_SUSPEND
> > -       bool "USB selective suspend/resume and wakeup"
> > -       depends on USB && PM
> > +       bool "USB runtime power management (suspend/resume and wakeup)"
> > +       depends on USB && PM_RUNTIME
> >         help
> >           If you say Y here, you can use driver calls or the sysfs
> >           "power/level" file to suspend or resume individual USB
> > 
> > This patch is saying, USB_SUSPEND is depends on PM_RUNTIME, in your
> > case, USB_SUSPEND is enabled, but PM_RUNTIME is disabled, this is a
> > little bit strange, I guess you have manually edited .config instead
> > of running the command `make menuconfig`. I am afraid this might cause
> > some dependency problem.
> 
> Nope. I did `make ARCH=arm omap_3430sdp_defconfig`, and this generated
> the .config. Wouldn't the dependencies be taken care of by this?
> 
> (omap_3430sdp_defconfig has CONFIG_USB_SUSPEND=y and CONFIG_PM_RUNTIME
> not set, since the defconfig is old. But wouldn't CONFIG_USB_SUSPEND
> get turned off in this case?)

I would expect it to get turned off.  This sounds like a bug in the
kernel build system.  Adding the linux-kbuild mailing list to the CC:.

Alan Stern

