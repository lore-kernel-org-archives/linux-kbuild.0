Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:56678 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753198AbeGEFjR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Jul 2018 01:39:17 -0400
MIME-Version: 1.0
In-Reply-To: <e230cffa-b3ea-d5c2-3d2c-5f822c9c2e7d@infradead.org>
References: <20180702144711.22111-1-hch@lst.de> <20180702144711.22111-2-hch@lst.de>
 <5c090e3f-ced0-62c5-c511-f4c66804ed32@infradead.org> <4dfba139-43a2-5949-3221-39cae3191ae7@infradead.org>
 <20180703133616.GB15589@lst.de> <e230cffa-b3ea-d5c2-3d2c-5f822c9c2e7d@infradead.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 5 Jul 2018 14:38:22 +0900
Message-ID: <CAK7LNAQJ+J_d6FbcHZ5+SM6mS3MjyGq_Q3x4_BxWzXzVZvMRkQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] kconfig: include common Kconfig files from top-level Kconfig
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Christoph Hellwig <hch@lst.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-07-04 1:11 GMT+09:00 Randy Dunlap <rdunlap@infradead.org>:
> On 07/03/18 06:36, Christoph Hellwig wrote:
>> On Mon, Jul 02, 2018 at 01:08:16PM -0700, Randy Dunlap wrote:
>>>> I would prefer to have init/Kconfig before arch/$(SRCARCH)/Kconfig.
>>>
>>> Ugh, that won't get this set correctly on x86_64:
>>> CONFIG_PGTABLE_LEVELS=2
>>
>> Did you try it?  As far as I can tell modern kconfig isn't really
>> order sensitive any more.
>> --
>
> Yes, it was wrong. :(
>
> Once the symbol has a default value, it won't be assigned a different
> default value (at least that's how it looks; I haven't read the kconfig
> source code).
>

The order does matter.

The 'default' properties are accumulated
as they appear.


If arch/Kconfig were parsed before arch/x86/Kconfig,
it would end up with this:



config PGTABLE_LEVELS
    int
    default 2                    <- from arch/Kconfig
    default 5 if X86_5LEVEL      <- from arch/x86/Kconfig
    default 4 if X86_64          <- from arch/x86/Kconfig
    default 3 if X86_PAE         <- from arch/x86/Kconfig
    default 2                    <- from arch/x86/Kconfig

So, PGTABLE_LEVELS would be always 2.
The last four lines are dead code.





The correct order is arch/x86/Kconfig, arch/Kconfig
then we can get this:

config PGTABLE_LEVELS
    int
    default 5 if X86_5LEVEL      <- from arch/x86/Kconfig
    default 4 if X86_64          <- from arch/x86/Kconfig
    default 3 if X86_PAE         <- from arch/x86/Kconfig
    default 2                    <- from arch/x86/Kconfig
    default 2                    <- from arch/Kconfig


-- 
Best Regards
Masahiro Yamada
