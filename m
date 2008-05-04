Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rgminet01.oracle.com ([148.87.113.118]:61485 "EHLO
	rgminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751959AbYEDR1x (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 4 May 2008 13:27:53 -0400
Message-ID: <481DF1A5.1030103@oracle.com>
Date: Sun, 04 May 2008 10:25:57 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
MIME-Version: 1.0
Subject: Re: [2.6 patch] kconfig-language.txt: remove bogus hint
References: <20080503231535.GY5838@cs181133002.pp.htv.fi> <20080504061741.GA14784@uranus.ravnborg.org> <20080504080137.GF5838@cs181133002.pp.htv.fi> <20080504112741.GA18379@uranus.ravnborg.org> <20080504121014.GJ5838@cs181133002.pp.htv.fi> <20080504122640.GA19513@uranus.ravnborg.org>
In-Reply-To: <20080504122640.GA19513@uranus.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Adrian Bunk <bunk@kernel.org>, linux-kbuild@vger.kernel.org

Sam Ravnborg wrote:
> On Sun, May 04, 2008 at 03:10:14PM +0300, Adrian Bunk wrote:
>> On Sun, May 04, 2008 at 01:27:41PM +0200, Sam Ravnborg wrote:
>>> On Sun, May 04, 2008 at 11:01:37AM +0300, Adrian Bunk wrote:
>>>> On Sun, May 04, 2008 at 08:17:41AM +0200, Sam Ravnborg wrote:
>>>>> On Sun, May 04, 2008 at 02:15:35AM +0300, Adrian Bunk wrote:
>>>>>> This kconfig construct described here is required in a different and 
>>>>>> much more complicated situation.
>>>>> Please elaborate...
>>>> In the hint C is described as a tristate.
>>>>
>>>> But you need this idiom only when A is a tristate and C is a bool.
>>> Thats another case.
>>> What is described is following simple situation:
>>>
>>> config FOO
>>>         bool "Modules"
>>>         option modules
>>>
>>> config A
>>>         tristate "a"
>>>
>>> config B
>>>         tristate "b"
>>>         depends on A
>>>
>>> config C
>>>         tristate "c"
>>>         depends on B
>>>         depends on A = y || A = B
>>>
>>>
>>> C uses a symbol defined by A - let us name it foo().
>>> If C is build-in and A is a module => 
>>> 	link error - unable to resolve foo.
>>>
>>> So we say: 
>>> if A is buildin C may be built-in or module.
>>> if A is a module C may not be built-in.
>>>
>>> This is what this hint describes.
>> In your example C does not need any dependency on A at all since it 
>> is already handled through the dependency chain C->B->A.
> 
> You are right.
> Randy - what problem was it this text tried to describe/solve?

I thought that it was related to USB_STORAGE, but I don't find it
in current kernels.

If the text is misleading, it should be yanked, of course.
And other places checked, e.g.:

$ find drivers/ -name Kconfig\* | xargs grep -s "depends on.*=.*||.*=" | grep -v \.orig

(samples:)
drivers/net/wan/Kconfig:        depends on HDLC && (LAPB=m && HDLC=m || LAPB=y)
drivers/net/wireless/b43/Kconfig:       depends on B43 && (RFKILL = y || RFKILL = B43) && RFKILL_INPUT && (INPUT_POLLDEV = y || INPUT_POLLDEV = B43)
drivers/scsi/Kconfig:   depends on SCSI_TGT = y || SCSI_TGT = SCSI_FC_ATTRS
drivers/scsi/Kconfig:   depends on SCSI_TGT = y || SCSI_TGT = SCSI_SRP_ATTRS
drivers/scsi/libsas/Kconfig:    depends on ATA = y || ATA = SCSI_SAS_LIBSAS
drivers/ssb/Kconfig:    depends on SSB && (PCI = y || PCI = SSB)
drivers/ssb/Kconfig:    depends on SSB && (PCMCIA = y || PCMCIA = SSB) && EXPERIMENTAL
drivers/usb/host/Kconfig:       depends on USB_OHCI_HCD && (SSB = y || SSB = USB_OHCI_HCD) && EXPERIMENTAL


>>> I would certainly love to see some of the other typical cases 
>>> described too.
>>>
>>> We need a description that covers the LED case. And I think
>>> you would be the best to come up with a description considering
>>> the time you have spent investigating it.
>>> Could you try to come up with either a suggested wording
>>> or a patch?
>> Roman is the one who actually fixed it:
>>   http://lkml.org/lkml/2008/4/30/615
>>
>> I'm not sure whether we have often the opportunity to solve something 
>> this way.
> I see.
> 
> 	Sam


-- 
~Randy
