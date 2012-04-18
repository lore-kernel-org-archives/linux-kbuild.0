Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from multi.imgtec.com ([194.200.65.239]:57758 "EHLO multi.imgtec.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751774Ab2DRVpl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Apr 2012 17:45:41 -0400
Message-ID: <4F8F3602.1010906@imgtec.com>
Date: Wed, 18 Apr 2012 22:45:38 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [BUG] savedefconfig results in different .config
References: <4F8E93A7.1070307@imgtec.com> <CACqU3MWsZRhuZ4WrK5UQE4ZBUBT9tcR=dnmHKvm5GGjgF+U3yA@mail.gmail.com>
In-Reply-To: <CACqU3MWsZRhuZ4WrK5UQE4ZBUBT9tcR=dnmHKvm5GGjgF+U3yA@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Will <will.newton@imgtec.com>

Hi,

On 18/04/12 18:05, Arnaud Lacombe wrote:
> Hi,
> 
> On Wed, Apr 18, 2012 at 6:12 AM, James Hogan <james.hogan@imgtec.com> wrote:
>> Hi,
>>
>> Is it a bug in kbuild if I have a .config produced by make menuconfig,
>> use savedefconfig to create a compact config file, and the defconfig
>> produces a different .config to the original .config file?
>>
>> I've attached a simple Kconfig patch based on v3.4-rc3 to help reproduce
>> it (easier than finding another example of it), and an initial .config:
>>
>> $ git apply defconfig_problem.patch
>> $ cp defconfig_problem_in.config .config
>> $ make oldconfig
>> $ make savedefconfig
>> $ cp defconfig arch/x86/configs/my_defconfig
>> $ make my_defconfig
>>
>> finally:
>>
>> $ diff -U0 .config defconfig_problem_in.config
>> --- .config     2012-04-18 11:04:59.631964466 +0100
>> +++ defconfig_problem_in.config 2012-04-18 10:43:44.423896052 +0100
>> @@ -1685 +1685 @@
>> -CONFIG_USB_GADGET_DWC_OTG=m
>> +CONFIG_USB_GADGET_DWC_OTG=y
>>
> I would assume there is something wrong with kconfig. That would not
> surprise me. That said, for the sake of asking, which tree are you
> playing with ? There is no such USB_GADGET_DWC_OTG in Linus' tree:
> 
> % git describe
> v3.4-rc3
> % git grep USB_GADGET_DWC_OTG
> %

the patch I attached to the previous email (which i've pasted below
in case it didn't get through) adds the necessary kconfig symbols.
The driver in question isn't in-tree yet.

Thanks
James

> 
> Thanks,
>  - Arnaud
> 
>> CONFIG_USB_GADGET_DWC_OTG is part of a tristate choice, and it doesn't
>> happen if CONFIG_USB_DWC_OTG=n (which depends on CONFIG_USB_GADGET_DWC_OTG).
>>
>> Is it a bug or is something wrong with the dependencies in the Kconfig
>> files?
>>
>> Thanks
>> James


diff --git a/drivers/usb/gadget/Kconfig b/drivers/usb/gadget/Kconfig
index 2633f75..4b88527 100644
--- a/drivers/usb/gadget/Kconfig
+++ b/drivers/usb/gadget/Kconfig
@@ -155,6 +155,13 @@ config USB_ATMEL_USBA
 	  USBA is the integrated high-speed USB Device controller on
 	  the AT32AP700x, some AT91SAM9 and AT91CAP9 processors from Atmel.
 
+config USB_GADGET_DWC_OTG
+	tristate "Synopsis DWC OTG Controller"
+	select USB_GADGET_DUALSPEED
+	help
+	  This driver provide USB Host and Device Controller support for the
+	  Synopsis Designware USB OTG Core.
+
 config USB_FSL_USB2
 	tristate "Freescale Highspeed USB DR Peripheral Controller"
 	depends on FSL_SOC || ARCH_MXC
diff --git a/drivers/usb/otg/Kconfig b/drivers/usb/otg/Kconfig
index 5c87db0..997de77 100644
--- a/drivers/usb/otg/Kconfig
+++ b/drivers/usb/otg/Kconfig
@@ -86,6 +86,41 @@ config NOP_USB_XCEIV
 	  built-in with usb ip or which are autonomous and doesn't require any
 	  phy programming such as ISP1x04 etc.
 
+menuconfig USB_DWC_OTG
+	tristate "Synopsis DWC OTG Controller"
+	help
+	  This driver provide USB Host and Device Controller support for the
+	  Synopsis Designware USB OTG Core
+
+choice
+	boolean "Operating Mode"
+	default USB_DWC_OTG_HOST_ONLY
+	depends on USB_DWC_OTG
+	help
+	  Select the operating mode of the controller OTG does both Host and
+	  Device with the selection made by the type of cable used.
+
+config USB_DWC_OTG_OTG
+	bool "OTG Support"
+	depends on USB_GADGET_DWC_OTG && USB
+	help
+	  Select this for Full OTG Mode. Important You must select Synopsis
+	  DWC_OTG as your peripheral controller in the Gadget Menu
+
+config USB_DWC_OTG_HOST_ONLY
+	bool "Host Only"
+	depends on USB
+	help
+	  Select this for Host only operation no device support
+
+config USB_DWC_OTG_DEVICE_ONLY
+	bool "Device Only"
+	depends on USB_GADGET_DWC_OTG
+	help
+	  Select this for Device only operation no host support
+
+endchoice
+
 config USB_MSM_OTG
 	tristate "OTG support for Qualcomm on-chip USB controller"
 	depends on (USB || USB_GADGET) && ARCH_MSM

