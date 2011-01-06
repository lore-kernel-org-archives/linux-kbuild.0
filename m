Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from iolanthe.rowland.org ([192.131.102.54]:43671 "HELO
	iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753408Ab1AFPz5 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 6 Jan 2011 10:55:57 -0500
Date: Thu, 6 Jan 2011 10:55:55 -0500 (EST)
From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: kbuild system regression (final '/' in directory names)
In-Reply-To: <20110106092849.GA1841@sepie.suse.cz>
Message-ID: <Pine.LNX.4.44L0.1101061050140.1916-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

On Thu, 6 Jan 2011, Michal Marek wrote:

> On Wed, Jan 05, 2011 at 11:53:33AM -0500, Alan Stern wrote:
> > Up until the last kernel version or so, I could do something like:
> > 
> > 	make M=drivers/usb/misc/
> > 
> > and the kbuild system would automatically do the right thing by
> > removing the final '/'.  Now it does not do so, and instead it ends up
> > unnecessarily compiling bogus files like
> > 
> >   CC [M]  drivers/usb/misc//usbtest.o
> 
> It behaves the same on 2.6.36 and 2.6.35,

It did change sometime within the past year.  But it's not worth trying 
to go back and figure out exactly when.

>  BUT this is not what the M
> variable is meant for. It should be used to build external modules, if
> you want to build only a part of the kernel tree, use
> 
>   make drivers/usb/misc

Okay, will do; thanks for the hint.

By the way, there seems to be a lot of unnecessary build activity when 
a single module is changed.  For example:

[stern@iolanthe usb-2.6]$ make drivers/usb/gadget/
  CHK     include/linux/version.h
  CHK     include/generated/utsrelease.h
  CALL    scripts/checksyscalls.sh
[stern@iolanthe usb-2.6]$ touch drivers/usb/gadget/printer.c
[stern@iolanthe usb-2.6]$ make drivers/usb/gadget/
  CHK     include/linux/version.h
  CHK     include/generated/utsrelease.h
  CALL    scripts/checksyscalls.sh
  CC [M]  drivers/usb/gadget/printer.o
  LD [M]  drivers/usb/gadget/g_zero.o
  LD [M]  drivers/usb/gadget/g_ether.o
  LD [M]  drivers/usb/gadget/gadgetfs.o
  LD [M]  drivers/usb/gadget/g_file_storage.o
  LD [M]  drivers/usb/gadget/g_serial.o
  LD [M]  drivers/usb/gadget/g_printer.o
  LD [M]  drivers/usb/gadget/g_cdc.o

It's perfectly understandable that printer.o and g_printer.o need to be 
rebuilt.  But why all those other "LD [M]" lines?

Alan Stern

