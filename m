Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:43221 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752000Ab1FNPdd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 14 Jun 2011 11:33:33 -0400
MIME-Version: 1.0
In-Reply-To: <20110614073218.GR2353@legolas.emea.dhcp.ti.com>
References: <20110613085534.GD3633@legolas.emea.dhcp.ti.com>
	<Pine.LNX.4.44L0.1106131024100.1983-100000@iolanthe.rowland.org>
	<20110613153516.GC2353@legolas.emea.dhcp.ti.com>
	<op.vw1yw3ol3l0zgt@mnazarewicz-glaptop>
	<20110614073218.GR2353@legolas.emea.dhcp.ti.com>
Date: Tue, 14 Jun 2011 11:33:32 -0400
Message-ID: <BANLkTikYqgzZboNB48MnGr87w7w9u6kLMA@mail.gmail.com>
Subject: Re: generate one module from multiple object files (was: Re: [PATCH
 2/2] usb: gadget: convert all users to the new udc)
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: balbi@ti.com
Cc: Michal Nazarewicz <mina86@mina86.com>, Alan Stern <stern@rowland.harvard.edu>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Greg KH <greg@kroah.com>, Linux USB Mailing List <linux-usb@vger.kernel.org>, linux-kbuild@vger.kernel.org

Hi,

On Tue, Jun 14, 2011 at 3:32 AM, Felipe Balbi <balbi@ti.com> wrote:
> On Tue, Jun 14, 2011 at 08:28:05AM +0200, Michal Nazarewicz wrote:
>> On Mon, 13 Jun 2011 17:35:17 +0200, Felipe Balbi <balbi@ti.com> wrote:
>> >We also need to a find a better way to get rid of the inclusion of C
>> >source files. I understand why Dave did it, but it's been quite some
>> >time since those patches were committed - e.g.
>> >7e75bc0f9006e995a0fa25f0a285addc3d5fd5cb - and no progress has been made
>> >to fix that up. Probably Clang's link-time optimization would help a lot
>> >on that, but Clang still needs quite some work to be usable for us, so
>> >we need something else. Any ideas ?
>>
>> To me it always seemed like it's a bug in/lack of feature of Kbuild.
>> Would making Kbuild allow building module from separate .o files be
>> a problem?
>
> maybe the guys at linux-kbuild@vger can help answering this.
>
What is the problem exactly ?

The following patch:

diff --git a/drivers/usb/gadget/Makefile b/drivers/usb/gadget/Makefile
index 4fe92b1..cc432b8 100644
--- a/drivers/usb/gadget/Makefile
+++ b/drivers/usb/gadget/Makefile
@@ -34,6 +34,12 @@ obj-$(CONFIG_USB_FUSB300)    += fusb300_udc.o
 # USB gadget drivers
 #
 g_zero-y                       := zero.o
+g_zero-y                       += composite.o
+g_zero-y                       += usbstring.o
+g_zero-y                       += config.o
+g_zero-y                       += epautoconf.o
+g_zero-y                       += f_sourcesink.o
+g_zero-y                       += f_loopback.o
 g_audio-y                      := audio.o
 g_ether-y                      := ether.o
 g_serial-y                     := serial.o
diff --git a/drivers/usb/gadget/zero.c b/drivers/usb/gadget/zero.c
index 6d16db9..9e74d8f 100644
--- a/drivers/usb/gadget/zero.c
+++ b/drivers/usb/gadget/zero.c
@@ -60,23 +60,6 @@

 /*-------------------------------------------------------------------------*/

-/*
- * Kbuild is not very cooperative with respect to linking separately
- * compiled library objects into one module.  So for now we won't use
- * separate compilation ... ensuring init/exit sections work to shrink
- * the runtime footprint, and giving us at least some parts of what
- * a "gcc --combine ... part1.c part2.c part3.c ... " build would.
- */
-#include "composite.c"
-#include "usbstring.c"
-#include "config.c"
-#include "epautoconf.c"
-
-#include "f_sourcesink.c"
-#include "f_loopback.c"
-
-/*-------------------------------------------------------------------------*/
-
 #define DRIVER_VERSION         "Cinco de Mayo 2008"

 static const char longname[] = "Gadget Zero";


build fine for me with CONFIG_USB_ZERO=[ym], beside an obvious visibility issue:

diff --git a/drivers/usb/gadget/f_loopback.c b/drivers/usb/gadget/f_loopback.c
index b37960f..2300a3d 100644
--- a/drivers/usb/gadget/f_loopback.c
+++ b/drivers/usb/gadget/f_loopback.c
@@ -372,8 +372,8 @@ int __init loopback_add(struct usb_composite_dev
*cdev, bool autoresume)
        loopback_driver.iConfiguration = id;

        /* support autoresume for remote wakeup testing */
-       if (autoresume)
-               sourcesink_driver.bmAttributes |= USB_CONFIG_ATT_WAKEUP;
+//     if (autoresume)
+//             sourcesink_driver.bmAttributes |= USB_CONFIG_ATT_WAKEUP;

        /* support OTG systems */
        if (gadget_is_otg(cdev->gadget)) {


Thanks,
 - Arnaud

>> Also, at one point in time I had an idea of a framework in which each
>> individual composite function would be a separate module.  I haven't
>> thought it through though so it's probably not such a great idea after
>> all. ;)
>
> such a framework won't work for Certification. The original composite
> framework that I implemented with the guidance of Dave was doing exactly
> that. Each function driver was a module of its own and you built
> composite gadgets by loading the different drivers.
>
> That was until Dave explained to me why it wouldn't fly. You can't have
> completely dynamic USB peripherals. If you go to certification with
> something like that, you will be denied certification as your device can
> change how it appears to the bus at any time.
>
> So, the way we have things now, is good. We just need to figure out a
> way to avoid the inclusion of C files.
>
> --
> balbi
>
