Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from h1446028.stratoserver.net ([85.214.92.142]:32789 "EHLO
	mail.ahsoftware.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751273AbbA2WjX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 29 Jan 2015 17:39:23 -0500
Message-ID: <54CAB68E.7080307@ahsoftware.de>
Date: Thu, 29 Jan 2015 23:39:10 +0100
From: Alexander Holler <holler@ahsoftware.de>
MIME-Version: 1.0
Subject: Re: [PATCH v2] modsign: use shred to overwrite the private key before
 deleting it
References: <54C2F4F8.20809@draigBrady.com> <1422096327-4483-1-git-send-email-holler@ahsoftware.de> <54C383E0.9060408@ahsoftware.de> <54C38B6D.1060806@ahsoftware.de> <54C3901D.8040406@ahsoftware.de> <54C45153.2050703@draigBrady.com> <54C4583A.5040505@ahsoftware.de> <54C4C65A.2020403@ahsoftware.de>
In-Reply-To: <54C4C65A.2020403@ahsoftware.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?B?UMOhZHJhaWcgQnJhZHk=?= <P@draigBrady.com>, linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, David Howells <dhowells@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>

Am 25.01.2015 um 11:32 schrieb Alexander Holler:
> Am 25.01.2015 um 03:43 schrieb Alexander Holler:
>> Am 25.01.2015 um 03:13 schrieb Pádraig Brady:
>>> On 24/01/15 12:29, Alexander Holler wrote:
>>>> Am 24.01.2015 um 13:09 schrieb Alexander Holler:
>>>>> Am 24.01.2015 um 12:37 schrieb Alexander Holler:
>>>>>> Am 24.01.2015 um 11:45 schrieb Alexander Holler:
>>>>>>
>>>>>>> It uses shred, in the hope it will somedays learn how to shred
>>>>>>> stuff on
>>>>>>> FLASH based devices securely too, once that has become possible.
>>>>>>
>>>>>> BTW: This is a good example where technology failed to keep the
>>>>>> needs of
>>>>>> users in mind.
>>>>>
>>>>> Failed completely.
>>>>>
>>>>> Since ever it's a problem for people to securely delete files on
>>>>> storage.
>>>>>
>>>>> Also it should be very simple to securely erase files on block based
>>>>> devices, people have to try cruel ways in the hope to get securely rid
>>>>> of files nobody else should be able to see ever again.
>>>>>
>>>>> It's almost unbelievable how completely the IT industry (including the
>>>>> field I'm working myself: SW) failed in regard to that since 30
>>>>> years or
>>>>> even more.
>>>>
>>>> And it isn't such that this is a new requirement. Humans are doing such
>>>> since thousands of years. They use fire to get rid of paper documents
>>>> and even the old egypts were able to destroyed stuff on stones by using
>>>> simple steps. Just the IT failed completely.
>>>>
>>>> Really unbelievable.
>>>>
>>>> So, sorry if anyone got bored by this mail, but I think that really has
>>>> to be said and repeated.
>>>
>>> Well not failed completely, just used a different method (encryption).
>>>
>>> As for "shredding", that improves in effectiveness the lower you go.
>>> I.E. it's effective for the whole file system (SSD range), or whole
>>> device.
>>
>> That's the usual broken way to go by adding another layer. And if you
>> encrypt your whole device, it won't help if you want to delete one file.
>> As long as the encrypted device is mounted and the blocks aren't
>> overwritten, the stuff is still there. So your solution would end up
>> with:
>>
>> - mount encrypted device
>> - build kernel and secret key
>> - install kernel and secret key
>
> That's wrong, of course it should read "and signed modules".
>
>> - unmount encrypted device
>>
>> That's almost the same as shredding a whole device just to securely
>> delete one file, with the added complication that the encryption
>> requires an authentication, which usually is very uncomfortable to do,
>> at least if the authentication is somewhat secure.
>>
>> Or what do you have in mind?
>>
>> Sorry, but deleting a file such that it isn't readable anymore by anyone
>> shouldn't be a complicated sequence of geek-stuff and all filesystem and
>> storage designers should be ashamed that they haven't managed it in
>> around 30 years to accomplish that simple goal. (imho) ;)
>
> By the way, I still remember the time when people learned that if they
> delete a file on a FAT file system, it isn't really gone. Afterwards all
> kinds of device-shredding software and hardware appeared.
>
> But instead of fixing that broken design, now, around 30 years later,
> this stupid and broken design is almost part of any storage and filesystem.
>
> And even worse, because storage is nowadays often fixed to device (no
> floppy anymore you can easily destroy), it often has become almost
> impossible to really delete stuff on devices.
> E.g. how do you overwrite an eMMC which is soldered, without the
> possibility to boot from something else in order to launch the shredding
> software?
>
> So we are now at the point that the only way to keep some information
> private (forever) is to not store it on any computer.
>
> How crazy or userfriendly is that?

I've filed bugs #92271 (ext4) and #92261 (btrfs) in the kernels
bugzilla. That might be a more appropriate place for discussion. Here
are the links:

https://bugzilla.kernel.org/show_bug.cgi?id=92271

https://bugzilla.kernel.org/show_bug.cgi?id=92261

Regards,

Alexander Holler

