Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:55898 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbfD0TeF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Apr 2019 15:34:05 -0400
Subject: Re: mini.config with defconfig
References: <95724704-6bc7-d8d7-7d6c-88d316be0e61@infradead.org>
 <CAK7LNATEb3XytOUjCQ_jy8qT6gb2iy0a1phrmNmdJRjCM-mVkQ@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <73976992-e17d-4405-e601-868932f95ba9@infradead.org>
Date: Sat, 27 Apr 2019 12:34:04 -0700
MIME-Version: 1.0
In-Reply-To: <CAK7LNATEb3XytOUjCQ_jy8qT6gb2iy0a1phrmNmdJRjCM-mVkQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>

On 4/27/19 1:44 AM, Masahiro Yamada wrote:
> On Sat, Apr 27, 2019 at 12:46 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> Hi,
>>
>> Is the "defconfig" target supported when using a mini.config file?
> 
> No.
> 
> As you see line 584 of scripts/kconfig/conf.c,
> this is supported only for
>  allnoconfig
>  allyesconfig
>  allmodconfig
>  alldefconfig
>  randconfig
> 
> 
> defconfig reads a config fragment
> from arch/*/configs/*_defconfig.
> 
> So, we need to merge data
> from arch/*/configs/*_defconfig and mini.config
> 
> Currently, this is not supported by the kconfig binary,
> but by scripts/kconfig/merge_config.sh
> 

I see.  Thanks.

> 
> Thanks.
> 
> 
> 
>> I am trying to use this mini.config file with x86_64 defconfig:
>>
>> # CONFIG_UNWINDER_ORC is not set
>> CONFIG_UNWINDER_FRAME_POINTER=y
>> # CONFIG_UNWINDER_GUESS is not set
>>
>>
>> but the generated .config file always has:
>> CONFIG_UNWINDER_ORC=y
>> # CONFIG_UNWINDER_FRAME_POINTER is not set
>>
>>
>> command:
>> make KCONFIG_ALLCONFIG=mini.config ARCH=x86_64 O=MINI defconfig
>>
>>
>> thanks.
>> --
>> ~Randy
> 
> 
> 


-- 
~Randy
