Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lhrrgout.huawei.com ([185.176.76.210]:2242 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727861AbgAIQX6 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Jan 2020 11:23:58 -0500
Subject: Re: [PATCH] merge_config.sh: Add option for allmodconfig
References: <1575979754-184896-1-git-send-email-john.garry@huawei.com>
 <7e769634-eb22-5827-e2d8-df68134056c0@huawei.com>
 <CAK7LNAS+XHGete9u2SV7fTj3HpROQmzfuJhV8tXW_xXkoPOYvg@mail.gmail.com>
 <538733b2-19af-9a66-f8d2-03e0f6ca7b25@huawei.com>
 <CAK7LNARtznvDh9fuQn5O5S-u6JNk-gcNr61Em=e7T4DN8CrX_g@mail.gmail.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <7a8a378f-c16b-c32e-b288-c279def947fb@huawei.com>
Date: Thu, 9 Jan 2020 16:23:55 +0000
MIME-Version: 1.0
In-Reply-To: <CAK7LNARtznvDh9fuQn5O5S-u6JNk-gcNr61Em=e7T4DN8CrX_g@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Anders Roxell <anders.roxell@linaro.org>

On 09/01/2020 16:21, Masahiro Yamada wrote:
> On Tue, Jan 7, 2020 at 6:19 PM John Garry <john.garry@huawei.com> wrote:
>>
>> On 06/01/2020 18:04, Masahiro Yamada wrote:
>>> On Mon, Jan 6, 2020 at 6:18 PM John Garry <john.garry@huawei.com> wrote:
>>>>
>>>> On 10/12/2019 12:09, John Garry wrote:
>>>>
>>>> Hi Masahiro,
>>>>
>>>> Could you please consider this patch?
>>>>
>>>> Thanks,
>>>> John
>>>>
>>>>> Recently there has been some work in reporting and fixing bugs in booting
>>>>> an allmodconfig kernel - here are a few examples:
>>>>>
>>>>> https://lore.kernel.org/linux-edac/304df85b-8b56-b77e-1a11-aa23769f2e7c@huawei.com/T/#t
>>>>> https://lore.kernel.org/linux-ide/bdf02e03-86a1-3d35-2908-28187f504495@huawei.com/T/#t
>>>>> https://lore.kernel.org/netdev/CADYN=9LCPfbpwdTWKw03B22-y3Text=RWXW7XP7wJBHYsMOgrA@mail.gmail.com/
>>>>> https://sourceforge.net/p/openipmi/mailman/message/36871567/
>>>>>
>>>>> If we want to boot an allmodconfig kernel we may still want to force some
>>>>> loadable modules built-in, like UART drivers. Or just still turn off some
>>>>> configs.
>>>
>>>
>>> I do not understand why you need to use merge_config.sh
>>> for this purpose.
>>>
>>> KCONFIG_ALLCONFIG=<path-to-your-config-fragment> make allmodconfig
>>>
>>> should work.
>>>
>>>
>>
>> Right, I could use that. But generally some people like to use
>> merge_config.sh directly:
>>
>> ./scripts/kconfig/merge_config.sh [-a] fragment
>>
>> so nice to have -a option for completeness.
>>
> 
> 
> Honestly, I am getting scared
> about people extending this script more and more
> to do what they want.
> 
> Since allmodconfig works enough for this usecase,
> I do not see a good reason to add the new option.
> 

ok, fine.

cheers
