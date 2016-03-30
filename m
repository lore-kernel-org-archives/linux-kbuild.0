Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ig0-f195.google.com ([209.85.213.195]:35061 "EHLO
	mail-ig0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752085AbcC3WQH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 30 Mar 2016 18:16:07 -0400
MIME-Version: 1.0
In-Reply-To: <CADYTM3Y6=JbyzyoR3m-gwaa5jWxfcStXLsKXyiUVhM4bQAd_AA@mail.gmail.com>
References: <ghr4asl38m.fsf@lena.gouders.net>
	<ghk3gkl32u.fsf@lena.gouders.net>
	<20131118180813.GB3458@free.fr>
	<CADYTM3YPscaS18KqAOkymRqWKGp4vQFsrefZNtuZddpkDoBWkg@mail.gmail.com>
	<ghd2c3h8bc.fsf@quad.gouders.net>
	<CADYTM3b6iL3xqoZTkHxbS3aUfZMywDkYekZVmGQy2TQt-4SnTA@mail.gmail.com>
	<ghwqaayzj6.fsf@quad.gouders.net>
	<CADYTM3Y6=JbyzyoR3m-gwaa5jWxfcStXLsKXyiUVhM4bQAd_AA@mail.gmail.com>
Date: Thu, 31 Mar 2016 01:16:06 +0300
Message-ID: <CAB=otbSUpt56JnJ4rXpLA2DDprATER9kCNNi_sD83wLbwszfDA@mail.gmail.com>
Subject: Re: [PATCH v4] kconfig/symbol.c: handle choice_values that depend on
 'm' symbols
From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bin Liu <binmlist@gmail.com>
Cc: Dirk Gouders <dirk@gouders.net>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, USB list <linux-usb@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Roger Quadros <rogerq@ti.com>

Hi,

On Thu, Mar 31, 2016 at 1:08 AM, Bin Liu <binmlist@gmail.com> wrote:
> Hi,
>
> On Fri, Aug 15, 2014 at 2:37 AM, Dirk Gouders <dirk@gouders.net> wrote:
>> Bin Liu <binmlist@gmail.com> writes:
>>
>>> Dirk,
>>>
>>> On Thu, Aug 14, 2014 at 1:52 AM, Dirk Gouders <dirk@gouders.net> wrote:
>>>> Bin Liu <binmlist@gmail.com> writes:
>>>>
>>>>> All,
>>>>>
>>>>> On Mon, Nov 18, 2013 at 12:08 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>>>>>> Dirk, All,
>>>>>>
>>>>>> On 2013-11-07 15:05 +0100, Dirk Gouders spake thusly:
>>>>>>> If choices consist of choice_values that depend on symbols set to 'm',
>>>>>>> those choice_values are not set to 'n' if the choice is changed from
>>>>>>> 'm' to 'y' (in which case only one active choice_value is allowed).
>>>>>>> Those values are also written to the config file causing modules to be
>>>>>>> built when they should not.
>>>>>>>
>>>>>>> The following config can be used to reproduce and examine the problem;
>>>>>>> with the frontend of your choice set "Choice 0" and "Choice 1" to 'm',
>>>>>>> then set "Tristate Choice" to 'y' and save the configuration:
>>>>>>>
>>>>>>> config modules
>>>>>>>       boolean modules
>>>>>>>       default y
>>>>>>>       option modules
>>>>>>>
>>>>>>> config dependency
>>>>>>>       tristate "Dependency"
>>>>>>>       default m
>>>>>>>
>>>>>>> choice
>>>>>>>       prompt "Tristate Choice"
>>>>>>>       default choice0
>>>>>>>
>>>>>>> config choice0
>>>>>>>       tristate "Choice 0"
>>>>>>>
>>>>>>> config choice1
>>>>>>>       tristate "Choice 1"
>>>>>>>       depends on dependency
>>>>>>>
>>>>>>> endchoice
>>>>>>>
>>>>>>> This patch sets choice_values' visibility that depend on symbols set
>>>>>>> to 'm' to 'n' if the corresponding choice is set to 'y'.  This makes
>>>>>>> them disappear from the choice list and will also cause the
>>>>>>> choice_values' value set to 'n' in sym_calc_value() and as a result
>>>>>>> they are written as "not set" to the resulting .config file.
>>>>>>>
>>>>>>> Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>>>>>>> Signed-off-by: Dirk Gouders <dirk@gouders.net>
>>>>>>> Tested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>>>>>>
>>>>>> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>>>>>
>>>>>> It will be in my tree soon. Thanks!
>>>>>
>>>>> I don't see this patch in 3.16 but 3.16 does not have the issue any
>>>>> more. Anyone has an idea how the issue got fixed? I am trying to find
>>>>> the right patch to backport.
>>>>
>>>> With the above sample kconfig I still see the issue.  How did you
>>>> notice the issue got fixed?
>>>
>>> I did not pay much attention on the above sample kconfig, but just
>>> focused on the USB gadget driver kconfig issue initially reported by
>>> Sebastian. I saw the issue exists in 3.14, but does not in 3.16,
>>> unless I messed up with my test. I will test 3.16 again some time next
>>> week.
>>
>> Hi Bin,
>>
>> I now also re-tested the initially reported steps to reproduce the
>> issue:
>>
>> ------------------------------------------------------------------------
>>> in USB gadget menu (that is Device Drivers ---> USB support ---> USB
>>> Gadget Support --->  USB Gadget Drivers) I can create a configuration
>>> which is "lost". Here is how to reproduce it:
>>>
>>> - first config two gadgets as M:
>>>  <M>   USB Gadget Drivers
>>>  <M>     Audio Gadget
>>>  <M>     Ethernet Gadget
>>>  <M>     MIDI Gadget
>>>
>>>  save config & leave
>>>
>>> - now start menu config again and go to the same menu, now select
>>>   built-in:
>>>   <*>   USB Gadget Drivers (Ethernet Gadget
>>>   the ethernet gadget is chosen automatically because we can have only
>>>   one gadget selected.
>>>   save config & leave
>>>
>>> - step three, go back to the menu and you will see that everything is
>>>   as it was (the <*> is ignored).
>> ------------------------------------------------------------------------
>>
>> Here, I still see the problem (I was wondering if the issue has been
>> solved/gone by a kconfig-file modification).
>
> This issue was gone since 3.16, but came back again due to commit
> 1fd6d08 ARM: omap2plus_defconfig: Enable n900 modem as loadable modules.
>

I can confirm this issue too, faced it on v4.5 (but didn't try v4.6-rc1 yet)

-- 
Best regards,
Ruslan Bilovol
