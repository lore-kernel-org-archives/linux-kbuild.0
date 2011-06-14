Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:45866 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751410Ab1FNRP3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 14 Jun 2011 13:15:29 -0400
MIME-Version: 1.0
In-Reply-To: <20110614164513.GP2353@legolas.emea.dhcp.ti.com>
References: <20110613085534.GD3633@legolas.emea.dhcp.ti.com>
	<Pine.LNX.4.44L0.1106131024100.1983-100000@iolanthe.rowland.org>
	<20110613153516.GC2353@legolas.emea.dhcp.ti.com>
	<op.vw1yw3ol3l0zgt@mnazarewicz-glaptop>
	<20110614073218.GR2353@legolas.emea.dhcp.ti.com>
	<BANLkTikYqgzZboNB48MnGr87w7w9u6kLMA@mail.gmail.com>
	<20110614164513.GP2353@legolas.emea.dhcp.ti.com>
Date: Tue, 14 Jun 2011 13:15:28 -0400
Message-ID: <BANLkTi=n2uL44G8XomrsDT9DH5n5r-h3=w@mail.gmail.com>
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

On Tue, Jun 14, 2011 at 12:45 PM, Felipe Balbi <balbi@ti.com> wrote:
> Hi,
>
> On Tue, Jun 14, 2011 at 11:33:32AM -0400, Arnaud Lacombe wrote:
>> On Tue, Jun 14, 2011 at 3:32 AM, Felipe Balbi <balbi@ti.com> wrote:
>> > On Tue, Jun 14, 2011 at 08:28:05AM +0200, Michal Nazarewicz wrote:
>> >> On Mon, 13 Jun 2011 17:35:17 +0200, Felipe Balbi <balbi@ti.com> wrote:
>> >> >We also need to a find a better way to get rid of the inclusion of C
>> >> >source files. I understand why Dave did it, but it's been quite some
>> >> >time since those patches were committed - e.g.
>> >> >7e75bc0f9006e995a0fa25f0a285addc3d5fd5cb - and no progress has been made
>> >> >to fix that up. Probably Clang's link-time optimization would help a lot
>> >> >on that, but Clang still needs quite some work to be usable for us, so
>> >> >we need something else. Any ideas ?
>> >>
>> >> To me it always seemed like it's a bug in/lack of feature of Kbuild.
>> >> Would making Kbuild allow building module from separate .o files be
>> >> a problem?
>> >
>> > maybe the guys at linux-kbuild@vger can help answering this.
>> >
>> What is the problem exactly ?
>>
>> The following patch:
>>
>> diff --git a/drivers/usb/gadget/Makefile b/drivers/usb/gadget/Makefile
>> index 4fe92b1..cc432b8 100644
>> --- a/drivers/usb/gadget/Makefile
>> +++ b/drivers/usb/gadget/Makefile
>> @@ -34,6 +34,12 @@ obj-$(CONFIG_USB_FUSB300)    += fusb300_udc.o
>>  # USB gadget drivers
>>  #
>>  g_zero-y                       := zero.o
>> +g_zero-y                       += composite.o
>> +g_zero-y                       += usbstring.o
>> +g_zero-y                       += config.o
>> +g_zero-y                       += epautoconf.o
>> +g_zero-y                       += f_sourcesink.o
>> +g_zero-y                       += f_loopback.o
>
> yes, you can do that. But the problem is the runtime memory footprint
> that we will have with that. At least that was the reason why Greg had
> asked Dave to change it to how it is done now.
>
What number are we talking about ?

Using the same hack in `f_loopback.c'[0], here is the numbers I get on
x86-64, using gcc 4.5.1, with -O2:

combined (C):
   14017    1440     288   15745    3d81 drivers/usb/gadget/g_zero.o

not combined (P):
   13835    1472     296   15603    3cf3 drivers/usb/gadget/g_zero.o

the result at -Os is slightly worse:

(C)  11318    1344     256   12918    3276 drivers/usb/gadget/g_zero.o
(P)  11353    1360     264   12977    32b1 drivers/usb/gadget/g_zero.o

 - Arnaud

[0]: btw, this is a nice source of code duplication, as
sourcesink_add() and loopback_add() are pretty much identical. To some
extend, f_loopback.c and f_sourcesink.c seem to share very similar
code structure...

> Do we support gcc --combine already ?
>
not I know of, but my knowledge are limited.

 - Arnaud

> --
> balbi
>
