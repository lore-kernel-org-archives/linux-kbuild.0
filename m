Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:43628 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727481AbeGQH07 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Jul 2018 03:26:59 -0400
Subject: Re: [PATCH 4/9] kconfig: include common Kconfig files from top-level
 Kconfig
From: Randy Dunlap <rdunlap@infradead.org>
References: <20180708152004.21679-1-hch@lst.de>
 <20180708152004.21679-5-hch@lst.de>
 <CAK7LNAT5dzU-SOvqwnDs=bn3WA1_fmDj2abETmoHUdUExVF+WA@mail.gmail.com>
 <e36e6b2c-0984-199e-8c19-3ec54b31c12e@infradead.org>
 <7d4e0925-3d6b-7698-1ef3-4c66500d8507@infradead.org>
 <f533eb02-479b-d6b2-82e3-27abb33e7ebd@infradead.org>
Message-ID: <cfdf8aa2-8ea3-1a13-9e4e-697c19acb854@infradead.org>
Date: Mon, 16 Jul 2018 23:55:52 -0700
MIME-Version: 1.0
In-Reply-To: <f533eb02-479b-d6b2-82e3-27abb33e7ebd@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Christoph Hellwig <hch@lst.de>
Cc: Richard Weinberger <richard@nod.at>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-um@lists.infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 07/16/2018 11:44 PM, Randy Dunlap wrote:
> On 07/16/2018 11:42 PM, Randy Dunlap wrote:
>> On 07/16/2018 11:33 PM, Randy Dunlap wrote:
>>> On 07/11/2018 05:21 AM, Masahiro Yamada wrote:
>>>> 2018-07-09 0:19 GMT+09:00 Christoph Hellwig <hch@lst.de>:
>>>>> Instead of duplicating the source statements in every architecture just
>>>>> do it once in the toplevel Kconfig file.
>>>>>
>>>>> Note that with this the inclusion of arch/$(SRCARCH/Kconfig moves out of
>>>>> the top-level Kconfig into arch/Kconfig so that don't violate ordering
>>>>> constraits while keeping a sensible menu structure.
>>>>>
>>>>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>>>>
>>>>
>>>>> diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
>>>>> index dd4f3d3e644f..7ab7b148181b 100644
>>>>> --- a/arch/sh/Kconfig
>>>>> +++ b/arch/sh/Kconfig
>>>>> @@ -168,10 +168,6 @@ config PGTABLE_LEVELS
>>>>>         default 3 if X2TLB
>>>>>         default 2
>>>>>
>>>>> -source "init/Kconfig"
>>>>> -
>>>>> -source "kernel/Kconfig.freezer"
>>>>> -
>>>>>  menu "System type"
>>>>>
>>>>>  #
>>>>> @@ -553,8 +549,6 @@ endchoice
>>>>>
>>>>>  endif
>>>>>
>>>>> -source "arch/sh/mm/Kconfig"
>>>>
>>>>
>>>> I noticed at least sh is broken
>>>> because "arch/sh/mm/Kconfig" is no longer included by anyone.
>>>>
>>>> I am not doing further tests.
>>>>
>>>
>>> Hi,
>>>
>>> Thanks for noticing that.
>>>
>>> I have tested all $ARCH (except um) with "allmodconfig" and so far, arch/sh/
>>> is the only one that has a problem.
>>>
>>
>> Well, there are 3 $ARCH-es that have an arch/$ARCH/mm/Kconfig file:
>> arm, sh, and unicore32.
>>
>> We can either merge those into arch/$ARCH/Kconfig or we can source
>> arch/$ARCH/mm/Kconfig for all $ARCH (where most of these files will be
>> empty).
>>
>> Christoph, thoughts/ideas?
>>
> 
> The first option (merge into arch/$ARCH/Kconfig) is not a good option.
> Some of these mm/Kconfig files are Large, so the second option is the only
> one that makes sense to me.
> 

All that *should* be needed is to add

source arch/sh/mm/Kconfig into arch/sh/Kconfig (as is done in arm and unicore32),
but that causes lots of .config diffs (as seen by scripts/diffconfig).

and I can't work on this any more tonight.  :)


>>>> Please test *ALL* architectures.
>>>>
>>>> If possible, matrix tests (arch, config-target), where
>>>> arch = arm, arm64, ...
>>>> config-target = allyesconfig, allnoconfig, alldefconfig, ...
>>>>
>>>>
>>>> Note:
>>>> scripts/diffconf is helpful.


-- 
~Randy
