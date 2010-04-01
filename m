Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 27.mail-out.ovh.net ([91.121.30.210]:47872 "HELO
	27.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1754140Ab0DARoN (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 1 Apr 2010 13:44:13 -0400
Message-ID: <4BB4DB68.1030800@example.com>
Date: Thu, 01 Apr 2010 19:44:08 +0200
From: Piotr Hosowicz <piotr@hosowicz.com>
Reply-To: piotr@hosowicz.com
MIME-Version: 1.0
Subject: Re: Maybe my frequent kernel building could be of some help to the
 community? And how to build?
References: <4B9FD5D1.8040203@example.com>	<4B9FDAF3.9010804@xenotime.net>	<20100318084012.0cca4b6a.rdunlap@xenotime.net>	<4BAB9D7F.8020506@xenotime.net> <20100401090239.ecf26ce2.randy.dunlap@oracle.com> <4BB4D6E3.9030100@example.com>
In-Reply-To: <4BB4D6E3.9030100@example.com>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: piotr@hosowicz.com
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Randy Dunlap <rdunlap@xenotime.net>, linux-kbuild@vger.kernel.org

Piotr Hosowicz wrote:
> Randy Dunlap wrote:
>> On Thu, 25 Mar 2010 10:29:35 -0700 Randy Dunlap wrote:
>>
>>> On 03/18/10 08:40, Randy Dunlap wrote:
>>>> On Tue, 16 Mar 2010 12:24:35 -0700 Randy Dunlap wrote:
>>>>
>>>>> On 03/16/10 12:02, Piotr Hosowicz wrote:
>>>>>> Hello,
>>>>>>
>>>>>> I own quite strong PC, 4 core Pentium. I recently started to build my
>>>>>> kernel frequently, whenever I see a new patch on kernel.org I build
>>>>>> again. Bothers me that I do it only for doing it. Maybe it could 
>>>>>> be of
>>>>>> some help to the community? And if so, what would be more 
>>>>>> appreciated -
>>>>>> linux-next patched kernel or gitN patched kernel? And how should I
>>>>>> configure the kernel for this purpose? I am afraid of putting all the
>>>>>> options on, yesterday I tried to put everything on as a module plus I
>>>>>> tinkered with some other options that seemed innocent. The kernel was
>>>>>> built but could not boot, saying that there was a problem with the 
>>>>>> root
>>>>>> device, it could not recoginze /dev/sda2, which is my correct root
>>>>>> device. I did not investigate much and reverted to working kernel.
>>>>>>
>>>>>> Thanks in advance for your remarks.
>>>>> Many linux-next builds are done daily: see
>>>>>   http://kisskb.ellerman.id.au/kisskb/branch/9/
>>>>>
>>>>> and then I do 25 x86_32 randconfigs and 25 x64_64 randconfigs
>>>>> daily and fix most build errors that I find in them.
>>>>> (I am also using a quad-core PC with a cron job that finds the
>>>>> next day's linux-next, downloads it, and does 50 builds.)
>>>>>
>>>>> You are welcome to do the same or test mainline (with daily
>>>>> builds) and/or Andrew Morton's mmotm patchset.
>>>>
>>>> One thing that you could do that no one focuses on is building
>>>> with some kconfig symbols disabled (ones that are typically enabled),
>>>> such as CONFIG_SMP=n, CONFIG_SYSFS=n, CONFIG_PROC_FS=n, CONFIG_PM=n,
>>>> CONFIG_PCI=n, CONFIG_BLOCK=n, CONFIG_NET=n, CONFIG_INET=n (but latter
>>>> with CONFIG_NET=y), CONFIG_HOTPLUG=n.  Not all of these at the same 
>>>> time,
>>>> just various/random combinations of them.
>>> and CONFIG_SYSRQ=n  (just found some errors due to this one)
>>
>> and CONFIG_INPUT randomly enabled/disabled
>>
>> Basically any major subsystem that can be enabled/disabled should be
>> tested.
> 
> Randy, but as for now (please find my messages) I do not know how to 
> randomly generate .config, I do not understand how make oldconfig works. 
> So I am stopped.

Randy, sorry, I just now saw, that You advised to use:

yes '' | make oldconfig

I got it wrong, and used - to my confusion:

yes | make oldconfig

I'll get to it tommorrow.

Godd night.

Piotr Hosowicz

-- 
TV: "Jeszcze trzy ruchy i Otylia bêdzie szczê¶liwa."
NP: Alice In Chains - All Secrets Known
NB: 2.6.34-rc3-next-20100401+
