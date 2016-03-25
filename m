Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f47.google.com ([209.85.213.47]:36007 "EHLO
	mail-vk0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753338AbcCYXB3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 25 Mar 2016 19:01:29 -0400
MIME-Version: 1.0
In-Reply-To: <CA+ekxPUF5yUuRr6mES2z=BhAqzmrrtL=tXEBFoKjqafveBAt0Q@mail.gmail.com>
References: <20160314235035.GA5799@localhost.localdomain>
	<1457999823.11972.143.camel@perches.com>
	<20160315112458.7248d665@canb.auug.org.au>
	<20160325083621.GA21959@gmail.com>
	<CA+ekxPUYPuVMjejTPztNd6FGcMgrdWUNM2HL_2ZwAjQij4+nmw@mail.gmail.com>
	<CA+ekxPUF5yUuRr6mES2z=BhAqzmrrtL=tXEBFoKjqafveBAt0Q@mail.gmail.com>
Date: Fri, 25 Mar 2016 17:01:27 -0600
Message-ID: <CA+ekxPVrWrz6UOkBDtNxZ1KAO7A95=88z8ZE=mt8AKui0CU5mQ@mail.gmail.com>
Subject: Re: [GIT PULL v4.6] MDB Linux Kernel Debugger x86/x86_64
From: Jeffrey Merkey <jeffmerkey@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, linux-kbuild <linux-kbuild@vger.kernel.org>

On 3/25/16, Jeffrey Merkey <jeffmerkey@gmail.com> wrote:
> On 3/25/16, Jeffrey Merkey <jeffmerkey@gmail.com> wrote:
>> On 3/25/16, Ingo Molnar <mingo@kernel.org> wrote:
>>>
>>> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>
>>>> Hi Joe,
>>>>
>>>> On Mon, 14 Mar 2016 16:57:03 -0700 Joe Perches <joe@perches.com> wrote:
>>>> >
>>>> > On Mon, 2016-03-14 at 17:50 -0600, Jeffrey Merkey wrote:
>>>> > > The following changes since commit
>>>> > > b562e44f507e863c6792946e4e1b1449fbbac85d:
>>>> > >
>>>> > >   Linux 4.5 (2016-03-13 21:28:54 -0700)
>>>> > >
>>>> > > are available in the git repository at:
>>>> > >
>>>> > >   https://github.com/jeffmerkey/linux.git tags/mdb-v4.5-signed
>>>> > >
>>>> > > for you to fetch changes up to
>>>> > > 2e9c184e1215dca2b4c59c347f40a0986b8e7460:
>>>> > >
>>>> > >   Add MDB Debugger to linux v4.5 (2016-03-14 15:17:44 -0600)
>>>> >
>>>> > If Linus doesn't pull this, Stephen, could you please add this
>>>> > tree to -next so it has some testing and validation done?
>>>>
>>>> Well, I really need a request from the ongoing maintainer and also some
>>>> indication of which kernel release (if any) it is likely to be merged
>>>> into ...
>>>
>>> So neither the x86 nor other affected maintainers have acked these
>>> changes
>>> or have
>>> agreed to merge it - in fact there are outstanding NAKs against this
>>> tree,
>>> which
>>> were not mentioned in the pull request.
>>>
>>> Here's one of the objections by me:
>>>
>>>    https://lkml.org/lkml/2016/1/29/64
>>>
>>> ... which technical objections were replied to by Jeff Merkey by
>>> accusing
>>> me
>>> of
>>> trolling:
>>>
>>>   "You were not included on the post since you are not a maintainer of
>>> watchdog.c
>>>    so I am confused as to why you are nacking and trolling me on
>>> something
>>> not in
>>>    your area."
>>>
>>>    https://lkml.org/lkml/2016/1/29/397
>>>
>>> So this tree is very far from being ready and I'm not convinced we want
>>> to
>>> merge
>>> it in its current form. If we merge bits of it then we want to merge it
>>> via
>>> the
>>> x86 tree, not a separate tree.
>>>
>>> In fact I also have more fundamental objections as well, such as the
>>> question of
>>> unnecessary code duplication: this new MDB debugger overlaps in
>>> functionality with
>>> the already in-tree kgdb+KDB live kernel debugger approach:
>>>
>>> I don't think we want to see two overlapping solutions in this area,
>>> both
>>> of
>>> which
>>> are inferior in their own ways. If then the KDB frontend should be
>>> improved:
>>>
>>> features such as disassembler output, more commands and usability
>>> improvements
>>> that can and should be added to the KDB front-end instead. I see nothing
>>> in
>>> this
>>> patch that couldn't be added to KDB/KGDB.
>>>
>>> All in one, I'd much rather like to see a gradual set of improvement
>>> patches
>>> to
>>> KDB, to improve live kernel debugging, than this kind of monolithic,
>>> arch
>>> dependent duplication of functionality.
>>>
>>> Thanks,
>>>
>>> 	Ingo
>>>
>>
>> Hi Ingo,
>>
>> Adding the disassembler to kgb/kgdb would not be all that
>> straightforward. the architecture of kgdb/kdb does not support it --
>> it would be significant rewrite of kdb -- in fact, it would have to be
>> completely restructured .  There are also as you point out some
>> patches in the debugger you nacked. but removing these is easy.
>>
>> I also would have to go to whomever is maintaining kdb and to be
>> honest, I am not all that interested in doing a bunch of work only to
>> have it rejected or ignored, so the "bait and switch" game of saying
>> "Please do X for us and we'll think about adding Y" isn't something I
>> am going to waste my time on.  Linux has more than one file system,
>> more than one ethernet card driver, so there is no reason it can have
>> more than one debugger.
>>
>> Kdb locks up a lot due to the design of it's smp roundup code for
>> stoping processors, it's a different design totally.
>>
>> If you want me to do these things I would need free reign and to be
>> honest, kdb is nowhere near as complete as mdb is.
>>
>> All that being said if you want me to do as you ask then you need to
>> show me that you are serious about taking work I do for these areas.
>>
>> Jeff
>
>
> In simple terms if you pull mdb as a branch to the x86 tree then I
> will do whatever you ask me to do to integrate it into kdb.  You have
> to accept the code as is to show me you are serious, then I will adapt
> it however you ask me to.
>
> Jeff
>

I went back and checked the code and as it turns out, none of the
patches you nak'd are in the current branch, there are different
patches there now.   There are two patches you ignored that are in it,
but no record of a Nak for either of them.


Jeff
