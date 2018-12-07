Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr730043.outbound.protection.outlook.com ([40.107.73.43]:31590
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725989AbeLGKrt (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Dec 2018 05:47:49 -0500
Subject: Re: [PATCH 2/7] microblaze: adjust the help to the real behavior
References: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
 <1543823457-32478-3-git-send-email-yamada.masahiro@socionext.com>
 <80bf0f6e-8f1f-314e-b22d-6e786cf15e45@monstr.eu>
 <CAK7LNAQBFfaJbFXf5h9LX689RUwA4kSeqPrimVOWDWq0XAVJ_Q@mail.gmail.com>
 <c8283f39-2d68-f7f7-82ee-c0da75755e5b@monstr.eu>
 <CAK7LNAROT8u5P1c4cXnDZwxZ-9RDGX_n2Xrbfu0TaPG68-EGzQ@mail.gmail.com>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <2183c01a-7c3d-8af7-0ae9-23cd0e8c9779@xilinx.com>
Date: Fri, 7 Dec 2018 11:47:28 +0100
MIME-Version: 1.0
In-Reply-To: <CAK7LNAROT8u5P1c4cXnDZwxZ-9RDGX_n2Xrbfu0TaPG68-EGzQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Simek <monstr@monstr.eu>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Simek <michal.simek@xilinx.com>

On 07. 12. 18 11:21, Masahiro Yamada wrote:
> On Thu, Dec 6, 2018 at 9:54 PM Michal Simek <monstr@monstr.eu> wrote:
>>
>> On 06. 12. 18 6:27, Masahiro Yamada wrote:
>>> Hi Michal,
>>>
>>> On Thu, Dec 6, 2018 at 12:41 AM Michal Simek <monstr@monstr.eu> wrote:
>>>>
>>>> On 03. 12. 18 8:50, Masahiro Yamada wrote:
>>>>> "make ARCH=microblaze help" mentions simpleImage.<dt>.unstrip,
>>>>> but it never works because Makefile assumes "system.unstrip" is
>>>>> the name of DT.
>>>>>
>>>>> $ make ARCH=microblaze CROSS_COMPILE=microblaze-linux- simpleImage.system.unstrip
>>>>>   [ snip ]
>>>>> make[1]: *** No rule to make target 'arch/microblaze/boot/dts/system.unstrip.dtb', needed by 'arch/microblaze/boot/dts/system.dtb'.  Stop.
>>>>> make: *** [Makefile;1060: arch/microblaze/boot/dts] Error 2
>>>>> make: *** Waiting for unfinished jobs....
>>>>>
>>>>> Rip off the never-working target.
>>>>>
>>>>> In my understanding, simpleImage.<dt> works like a phony target that
>>>>> generates multiple images. Reflect the behavior to the help message.
>>>>>
>>>>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>>>>> ---
>>>>>
>>>>>  arch/microblaze/Makefile | 4 +---
>>>>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/arch/microblaze/Makefile b/arch/microblaze/Makefile
>>>>> index 0823d29..97e1384 100644
>>>>> --- a/arch/microblaze/Makefile
>>>>> +++ b/arch/microblaze/Makefile
>>>>> @@ -89,9 +89,7 @@ define archhelp
>>>>>    echo '* linux.bin    - Create raw binary'
>>>>>    echo '  linux.bin.gz - Create compressed raw binary'
>>>>>    echo '  linux.bin.ub - Create U-Boot wrapped raw binary'
>>>>> -  echo '  simpleImage.<dt> - ELF image with $(arch)/boot/dts/<dt>.dts linked in'
>>>>> -  echo '                   - stripped elf with fdt blob'
>>>>> -  echo '  simpleImage.<dt>.unstrip - full ELF image with fdt blob'
>>>>> +  echo '  simpleImage.<dt> - Create images with $(arch)/boot/dts/<dt>.dts linked in'
>>>>>    echo '  *_defconfig      - Select default config from arch/microblaze/configs'
>>>>>    echo ''
>>>>>    echo '  Targets with <dt> embed a device tree blob inside the image'
>>>>>
>>>>
>>>> I understand what you are trying to say but I would still like to keep
>>>> information about unstrip file.
>>>> It is correct that it is not build target. It is just generated file and
>>>> message above was used for description what it is.
>>>> Definitely agree that this should be the part of targets but it should
>>>> be in description.
>>>> The same is for missing description for simpleImage.<dt>.strip and
>>>> simpleImage.<dt>.ub files.
>>>>
>>>> Thanks,
>>>> Michal
>>>>
>>>
>>> If we want to be precise to the current behavior,
>>> we could describe more.
>>> (Is it too much?)
>>>
>>>
>>> Architecture specific targets (microblaze):
>>> * linux.bin    - Create raw binary
>>>   linux.bin.gz - Create compressed raw binary
>>>   linux.bin.ub - Create U-Boot wrapped raw binary
>>>   simpleImage.<dt> - Create the following images with
>>> arch/macroblaze/boot/dts/<dt>.dts linked in
>>
>> type - microblaze
>> maybe <dtb> here.
> 
> 
> I will keep <dt> as is.
> 
> I see more <dt> references a few lines below:
> 
> 
>   echo '  Targets with <dt> embed a device tree blob inside the image'
>   echo '  These targets support board with firmware that does not'
>   echo '  support passing a device tree directly. Replace <dt> with the'
>   echo '  name of a dts file from the arch/microblaze/boot/dts/ directory'
>   echo '  (minus the .dts extension).'
> 

ok. Not a problem.
M
