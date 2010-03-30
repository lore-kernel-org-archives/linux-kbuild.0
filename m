Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 27.mail-out.ovh.net ([91.121.30.210]:54636 "HELO
	27.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753379Ab0C3TAU (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 30 Mar 2010 15:00:20 -0400
Message-ID: <4BB24A3F.4030908@example.com>
Date: Tue, 30 Mar 2010 21:00:15 +0200
From: Piotr Hosowicz <piotr@hosowicz.com>
Reply-To: piotr@hosowicz.com
MIME-Version: 1.0
Subject: Re: Is root kernel parameter expected to be the first one or something?
References: <4B9FD5D1.8040203@example.com>	<4B9FDAF3.9010804@xenotime.net>	<4BB10A9D.7000506@example.com>	<20100329133809.af969338.rdunlap@xenotime.net>	<4BB1108C.60202@example.com>	<20100329143334.9b295e1d.rdunlap@xenotime.net>	<4BB12A8A.1040202@example.com>	<20100329153916.18afaf25.rdunlap@xenotime.net>	<4BB12D4C.7080904@example.com> <20100329154852.5476ed2e.rdunlap@xenotime.net> <4BB228CD.3050609@example.com> <4BB23CF1.7090708@example.com>
In-Reply-To: <4BB23CF1.7090708@example.com>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: piotr@hosowicz.com
Cc: Randy Dunlap <rdunlap@xenotime.net>, linux-kbuild@vger.kernel.org

Piotr Hosowicz wrote:
> Piotr Hosowicz wrote:
>> Randy Dunlap wrote:
>>> On Tue, 30 Mar 2010 00:44:28 +0200 Piotr Hosowicz wrote:
>>>
>>>> Randy Dunlap wrote:
>>>>> On Tue, 30 Mar 2010 00:32:42 +0200 Piotr Hosowicz wrote:
>>>>>
>>>>>> Randy Dunlap wrote:
>>>>>>> On Mon, 29 Mar 2010 22:41:48 +0200 Piotr Hosowicz wrote:
>>>>>>>
>>>>>>>> Randy Dunlap wrote:
>>>>>>>>> On Mon, 29 Mar 2010 22:16:29 +0200 Piotr Hosowicz wrote:
>>>>>>>>>
>>>>>>>>>> Hello,
>>>>>>>>>>
>>>>>>>>>> Today I had built a new next kernel with these parameters. I 
>>>>>>>>>> did not get what I expected
>>>>>>>>> I don't think I understand your question.
>>>>>>>>> What did you expect?
>>>>>>>> I expected higher resolution console, smaller font etc
>>>>>>> Boy was I confused.  I thought that your question was about the 
>>>>>>> root=
>>>>>>> kernel boot parameter.
>>>>>>>
>>>>>>> Well, there are several questions to be asked.  and one more 
>>>>>>> comment.
>>>>>>>
>>>>>>> 1.  what video (framebuffer) driver are you using?
>>>>>> Ashamed to say, but I do not know. vga=791 works perfectly when I 
>>>>>> specifiy it via GRUB modification, either during pre-booting phase 
>>>>>> or in menu.lst. I thought that it would work if I enable it by the 
>>>>>> oprions I provided in the previous message.
>>>>> That does sound, hm, suspicious.
>>>
>>>
>>> OK, the above is the main problem, right?
>>> If so, I'll try to find time to test it.
>>
>> aapi205:/usr/src/linux# gzip -cd /proc/config.gz | grep -A 1 vga=791
>> CONFIG_CMDLINE="root=/dev/sda2 ro quiet vga=791"
>> CONFIG_CMDLINE_OVERRIDE=y
>> aapi205:/usr/src/linux# cat /proc/cmdline
>> root=/dev/sda2 ro quiet vga=791
>>
>> First if all I tried to test whether the overriding code works at all, 
>> and it seems it works, I am now booted having edited 
>> root=/dev/nonexistent at GRUB prompt, and it seems that the values set 
>> at build time have overriden values set at GRUB prompt. But the 
>> vga=791 parameter does not work at all, I have the usual console, with 
>> big characters.
> 
> This is on 2.6.34-rc2-git4, sorry, I forgot to say.

Same results with 2.6.34-rc3, I've just tested.

-- 
Nie pytaj co rz±d mo¿e zrobiæ dla ciebie. Pytaj, jak mo¿esz temu zapobiec.
NP: Patrick O'Hearn - Facing the Sun
NB: 2.6.34-rc3
