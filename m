Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wj0-f194.google.com ([209.85.210.194]:34579 "EHLO
        mail-wj0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755577AbcLPHx5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Dec 2016 02:53:57 -0500
Subject: Re: default 0 if KASAN expression not working in kbuild
References: <e8e7205e-17f4-1d2c-f6d1-bd741b65e032@gmail.com>
 <18825051-61d0-e8a9-544a-4f7d89f30b3c@infradead.org>
 <a7a212c3-02f6-ce32-07fc-f073b2080ff8@gmail.com>
From: Nikolay Borisov <n.borisov.lkml@gmail.com>
Message-ID: <9d39c938-3f52-12f2-c1ae-4e27d9b3a8bd@gmail.com>
Date: Fri, 16 Dec 2016 09:53:54 +0200
MIME-Version: 1.0
In-Reply-To: <a7a212c3-02f6-ce32-07fc-f073b2080ff8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, yann.morin.1998@free.fr, mmarek@suse.com



On 16.12.2016 09:50, Nikolay Borisov wrote:
> 
> 
> On 15.12.2016 23:32, Randy Dunlap wrote:
>> On 12/15/16 10:09, Nikolay Borisov wrote:
>>> Hello,
>>>
>>> I was doing some kasan-related debugging and when I enabled it I started
>>> getting warnings for large stackframes. So CONFIG_FRAME_WARN has :
>>>
>>> int "Warn for stack frames larger than (needs gcc 4.4)"
>>>     range 0 8192
>>>     default 0 if KASAN
>>>     default 2048 if GCC_PLUGIN_LATENT_ENTROPY
>>>     default 1024 if !64BIT
>>>     default 2048 if 64BIT
>>>
>>> This means that frame_warns should effectively be disabled when kasan is
>>> enabled. However in my case this is not the situation.
>>> http://sprunge.us/FiGf here is the config file. It does have
>>> CONFIG_KASAN=y and CONFIG_FRAME_WARN=1024 . And even this is erroneous
>>> since it's a 64bit kernel, so it should be 2k. I haven't manually set
>>> the limit to 1k either.
>>
>> Yeah, it set FRAME_WARN=1024 for me also.
>>
>> It seems to be dependent on order of kconfig symbols in
>> lib/Kconfig.debug.
>>
>> If I move the line:
>>   source "lib/Kconfig.kasan"
>> to just after this line:
>>   menu "Compile-time checks and compiler options"
>> it seems to work for me.
>>
>> Can you test the patch below?
> 
> This patch has another problem that if I move the source line then I no
> longer get the kasan option in Memory Debugging section, furthermore the
> frame_warn wasn't changed either.

So actually kasan is being moved to the "Compile-time checks" menu, yet
the frame size still isn't changed for me.

> 
> 
>>
