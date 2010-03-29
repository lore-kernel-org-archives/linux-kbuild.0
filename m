Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 26.mail-out.ovh.net ([91.121.27.225]:48325 "HELO
	26.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753342Ab0C2Wod (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Mar 2010 18:44:33 -0400
Message-ID: <4BB12D4C.7080904@example.com>
Date: Tue, 30 Mar 2010 00:44:28 +0200
From: Piotr Hosowicz <piotr@hosowicz.com>
Reply-To: piotr@hosowicz.com
MIME-Version: 1.0
Subject: Re: Is root kernel parameter expected to be the first one or something?
References: <4B9FD5D1.8040203@example.com>	<4B9FDAF3.9010804@xenotime.net>	<4BB10A9D.7000506@example.com>	<20100329133809.af969338.rdunlap@xenotime.net>	<4BB1108C.60202@example.com>	<20100329143334.9b295e1d.rdunlap@xenotime.net>	<4BB12A8A.1040202@example.com> <20100329153916.18afaf25.rdunlap@xenotime.net>
In-Reply-To: <20100329153916.18afaf25.rdunlap@xenotime.net>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: linux-kbuild@vger.kernel.org

Randy Dunlap wrote:
> On Tue, 30 Mar 2010 00:32:42 +0200 Piotr Hosowicz wrote:
> 
>> Randy Dunlap wrote:
>>> On Mon, 29 Mar 2010 22:41:48 +0200 Piotr Hosowicz wrote:
>>>
>>>> Randy Dunlap wrote:
>>>>> On Mon, 29 Mar 2010 22:16:29 +0200 Piotr Hosowicz wrote:
>>>>>
>>>>>> Hello,
>>>>>>
>>>>>> Today I had built a new next kernel with these parameters. I did not get 
>>>>>> what I expected
>>>>> I don't think I understand your question.
>>>>> What did you expect?
>>>> I expected higher resolution console, smaller font etc
>>> Boy was I confused.  I thought that your question was about the root=
>>> kernel boot parameter.
>>>
>>> Well, there are several questions to be asked.  and one more comment.
>>>
>>> 1.  what video (framebuffer) driver are you using?
>> Ashamed to say, but I do not know. vga=791 works perfectly when I 
>> specifiy it via GRUB modification, either during pre-booting phase or in 
>> menu.lst. I thought that it would work if I enable it by the oprions I 
>> provided in the previous message.
> 
> That does sound, hm, suspicious.
> 
>>> 2.  is it builtin the kernel image or is it a loadable module?
>> Loadable mofule I suppose, I can see nvidia.ko in /lib/modules/... - I 
>> install Nbvidia driver with Nvidia tool each time after kernel change. 
>> Each time the module has to be compiled anew.
> 
> So this nvidia driver supports "vga=<value>" ?

I suppose it does because it works perfectly when I put it in menu.lst 
file in GRUB config or specify it in GRUB before the kernel boots.

>>> 3.  have you read Documentation/svga.txt and Documentation/fb/{fbcon,vesafb}.txt ?
>> No, I havent, yet.
> 
> 
>>> And my comment is that your question (about video) would be better on the
>>> linux-fbdev@vger.kernel.org mailing list.  It's not about kbuild/kconfig,
>>> unless kconfig is not saving the build parameters correctly...
>> But I don't know if it is a fb problem, I quoted kernel config 
>> parameters I used, may be there is a problem with them?
> 
> 
> Well, to me, all of the questions are about video/framebuffer usage.
> That's why I recommended that mailing list.

But I read a bit and this is not a case of framebuffer, pkain svga mode.

> Although if you are using the binary-only nvidia driver, it will probably
> be difficult to help you.

It is not binary-only, I have to rebuild the driver in every kernel change.

Regards,

Piotr Hosowicz

-- 
"Chcemy waszego dobra!" - powiedzia³ lider
socjaldemokratów. Zaniepokojeni obywatele
zaczeli ukrywaæ swoje dobra w bezpiecznych
miejscach.
NP: Mark Knopfler - Hard Shoulder
NB: 2.6.34-rc2-next-20100329+
