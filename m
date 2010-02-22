Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from iolanthe.rowland.org ([192.131.102.54]:56123 "HELO
	iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751893Ab0BVQdt (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 22 Feb 2010 11:33:49 -0500
Date: Mon, 22 Feb 2010 11:33:47 -0500 (EST)
From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: Two problems with system sleep
In-Reply-To: <201002212139.39746.rjw@sisk.pl>
Message-ID: <Pine.LNX.4.44L0.1002221119590.1262-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Linux-pm mailing list <linux-pm@lists.linux-foundation.org>, Alan <alan@lxorguk.ukuu.org.uk>, linux-kbuild@vger.kernel.org

On Sun, 21 Feb 2010, Rafael J. Wysocki wrote:

> > > Anyway, we need to check if control gets back to acpi_suspend_enter().

Would PM_TRACE_RTC help?  What would I have to add in order to insert
an appropriate tracepoint?


> > > BTW, does anything change if you put acpi_sleep=sci_force_enable into the
> > > kernel command line?
> > 
> > Nothing changes.  I also added "pci=use_crs", based on a suggestion in 
> > the log, but that didn't make any difference either.
> 
> The failure to resume may be graphics-related, so please try to compile i915
> statically into the kernel and set CONFIG_DRM_I915_KMS.

Odd -- when I use "make menuconfig", that part of the menu 
doesn't show up.  Navigating through "Device Drivers -> Graphics 
support" gives me this screen:

    <*> /dev/agpgart (AGP Support)  --->                             
    <*> Direct Rendering Manager (XFree86 4.1.0 and higher DRI suppor 
    -*- Lowlevel video output switch controls                        
    -*- Support for frame buffer devices  --->                       
    [ ] Backlight & LCD device support  --->                         
        Display device support  --->                                 
        Console display driver support  --->                         
    [ ] Bootup logo  --->                                            

None of the entries in drivers/gpu/drm/Kconfig show up beyond the first 
one.  I had to go in and edit .config by hand to set CONFIG_DRM, 
CONFIG_DRM_KMS_HELPER, CONFIG_DRM_I915, and CONFIG_DRM_I915_KMS all to 
"y".  Is this a bug in menuconfig?  CC'ing the mailing list...

Anyway, it didn't make any difference.  The behavior was exactly the 
same.  Pressing the power button during suspend causes an 
almost-instant hang, before the screen or anything else revives.

By concentrating on the video drivers, you may be missing part of 
the problem.  Have you considered why pressing a key on the keyboard 
doesn't wake the system up?  Nothing happens -- the power LED on the 
desktop case just keeps on blinking.

Alan Stern

