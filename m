Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:55436 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752800Ab1AFQMk (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 6 Jan 2011 11:12:40 -0500
Date: Thu, 6 Jan 2011 17:12:38 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: kbuild system regression (final '/' in directory names)
Message-ID: <20110106161238.GA15497@merkur.ravnborg.org>
References: <20110106092849.GA1841@sepie.suse.cz> <Pine.LNX.4.44L0.1101061050140.1916-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1101061050140.1916-100000@iolanthe.rowland.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

> 
> By the way, there seems to be a lot of unnecessary build activity when 
> a single module is changed.  For example:
> 
> [stern@iolanthe usb-2.6]$ make drivers/usb/gadget/
>   CHK     include/linux/version.h
>   CHK     include/generated/utsrelease.h
>   CALL    scripts/checksyscalls.sh
> [stern@iolanthe usb-2.6]$ touch drivers/usb/gadget/printer.c
> [stern@iolanthe usb-2.6]$ make drivers/usb/gadget/
>   CHK     include/linux/version.h
>   CHK     include/generated/utsrelease.h
>   CALL    scripts/checksyscalls.sh
>   CC [M]  drivers/usb/gadget/printer.o
>   LD [M]  drivers/usb/gadget/g_zero.o
>   LD [M]  drivers/usb/gadget/g_ether.o
>   LD [M]  drivers/usb/gadget/gadgetfs.o
>   LD [M]  drivers/usb/gadget/g_file_storage.o
>   LD [M]  drivers/usb/gadget/g_serial.o
>   LD [M]  drivers/usb/gadget/g_printer.o
>   LD [M]  drivers/usb/gadget/g_cdc.o
> 
> It's perfectly understandable that printer.o and g_printer.o need to be 
> rebuilt.  But why all those other "LD [M]" lines?
Good question...
$ make allmodconfig
...
$ make drivers/usb/gadget/
...
$ make drivers/usb/gadget/
  CHK     include/linux/version.h
  CHK     include/generated/utsrelease.h
  CALL    scripts/checksyscalls.sh
$ touch drivers/usb/gadget/printer.c
$ make V=2 drivers/usb/gadget/
  CHK     include/linux/version.h
  CHK     include/generated/utsrelease.h
  CALL    scripts/checksyscalls.sh - due to target is PHONY
  CC [M]  drivers/usb/gadget/printer.o - due to: drivers/usb/gadget/printer.c
  LD [M]  drivers/usb/gadget/g_zero.o - due to: drivers/usb/gadget/printer.o
  LD [M]  drivers/usb/gadget/g_audio.o - due to: drivers/usb/gadget/printer.o
  LD [M]  drivers/usb/gadget/g_ether.o - due to: drivers/usb/gadget/printer.o
  LD [M]  drivers/usb/gadget/gadgetfs.o - due to: drivers/usb/gadget/printer.o
  LD [M]  drivers/usb/gadget/g_file_storage.o - due to: drivers/usb/gadget/printer.o
  LD [M]  drivers/usb/gadget/g_mass_storage.o - due to: drivers/usb/gadget/printer.o
  LD [M]  drivers/usb/gadget/g_serial.o - due to: drivers/usb/gadget/printer.o
  LD [M]  drivers/usb/gadget/g_printer.o - due to: drivers/usb/gadget/printer.o
  LD [M]  drivers/usb/gadget/g_midi.o - due to: drivers/usb/gadget/printer.o
  LD [M]  drivers/usb/gadget/g_cdc.o - due to: drivers/usb/gadget/printer.o
  LD [M]  drivers/usb/gadget/g_hid.o - due to: drivers/usb/gadget/printer.o
  LD [M]  drivers/usb/gadget/g_dbgp.o - due to: drivers/usb/gadget/printer.o
  LD [M]  drivers/usb/gadget/g_multi.o - due to: drivers/usb/gadget/printer.o
  LD [M]  drivers/usb/gadget/g_nokia.o - due to: drivers/usb/gadget/printer.o
  LD [M]  drivers/usb/gadget/g_webcam.o - due to: drivers/usb/gadget/printer.o

Yup - this is a limitation in kbuild...
From Makefile.build:
# We would rather have a list of rules like
#       foo.o: $(foo-objs)
# but that's not so easy, so we rather make all composite objects depend
# on the set of all their parts

We do not properly handle the prerequisites of individual
composite modules.
So a composite module depend on all .o files used in
any composite module (in the same dir).

	Sam
