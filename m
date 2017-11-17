Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.cn.fujitsu.com ([183.91.158.132]:56379 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S933291AbdKQGnQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Nov 2017 01:43:16 -0500
Subject: Re: [kbuild:kbuild 28/31] include/linux/dynamic_debug.h:76:14: error:
 'KBUILD_MODNAME' undeclared
References: <201711161323.scU2nJRf%fengguang.wu@intel.com>
 <bc7d9e6d2541494685beac1b4916d9fa@SOC-EX01V.e01.socionext.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <d2901f65-2557-453e-d201-fefa62dc2e65@cn.fujitsu.com>
Date: Fri, 17 Nov 2017 14:42:41 +0800
MIME-Version: 1.0
In-Reply-To: <bc7d9e6d2541494685beac1b4916d9fa@SOC-EX01V.e01.socionext.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, fengguang.wu@intel.com
Cc: kbuild-all@01.org, linux-kbuild@vger.kernel.org



On 11/16/2017 03:59 PM, yamada.masahiro@socionext.com wrote:
> 
> 
>> -----Original Message-----
>> From: kbuild test robot [mailto:fengguang.wu@intel.com]
>> Sent: Thursday, November 16, 2017 2:29 PM
>> To: Cao jin <caoj.fnst@cn.fujitsu.com>
>> Cc: kbuild-all@01.org; linux-kbuild@vger.kernel.org; Yamada, Masahiro/
>> 山田 真弘 <yamada.masahiro@socionext.com>
>> Subject: [kbuild:kbuild 28/31] include/linux/dynamic_debug.h:76:14:
>> error: 'KBUILD_MODNAME' undeclared
>>
>> tree:
>> https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild
>> .git kbuild
>> head:   ea15c8cd3601640e202828e3b563653a8b3c76cd
>> commit: 1ac0408bbb3f47ef2411976fbd2bf758d747bbee [28/31] kbuild: fix
>> modname for composite modules
>> config: x86_64-allmodconfig (attached as .config)
>> compiler: gcc-6 (Debian 6.4.0-9) 6.4.0 20171026
>> reproduce:
>>         git checkout 1ac0408bbb3f47ef2411976fbd2bf758d747bbee
>>         # save the attached .config to linux build tree
>>         make ARCH=x86_64
>>
>> All error/warnings (new ones prefixed by >>):
>>
>>    In file included from include/linux/printk.h:329:0,
>>                     from include/linux/kernel.h:13,
>>                     from include/linux/list.h:8,
>>                     from include/linux/timer.h:4,
>>                     from include/linux/netdevice.h:28,
>>                     from
>> drivers/net/ethernet/cavium/liquidio/lio_ethtool.c:18:
>>    drivers/net/ethernet/cavium/liquidio/octeon_main.h: In function
>> 'octeon_unmap_pci_barx':
>>>> include/linux/dynamic_debug.h:76:14: error: 'KBUILD_MODNAME'
>> undeclared (first use in this function)
>>       .modname = KBUILD_MODNAME,   \
>>                  ^
>>    include/linux/dynamic_debug.h:98:2: note: in expansion of macro
>> 'DEFINE_DYNAMIC_DEBUG_METADATA_KEY'
>>      DEFINE_DYNAMIC_DEBUG_METADATA_KEY(name, fmt, .key.dd_key_false, \
>>      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>    include/linux/dynamic_debug.h:132:2: note: in expansion of macro
> 
> [snip lots of errors]
>>
>> ---
>> 0-DAY kernel test infrastructure                Open Source Technology
>> Center
>> https://lists.01.org/pipermail/kbuild-all                   Intel
>> Corporation
> 
> 
> OK.
> Looks like this potential issue has been hidden.
> 
> I plan to insert the following patch before Cao's one:
> https://patchwork.kernel.org/patch/10060825/
> 
> We should better to take time for testing by 0day bot, though.
> 

It took me a while to figure out why the build is ok before my patch.

before my patch, the liquidio-m belongs to $(real-objs-m), so there is:

    modname = $(basetarget)

after my patch, liquidio-m belongs to $(multi-objs-m), so there is:

    modname = $(modname-multi)

And, these files both belong to liquidio-m & liquidio_vf-m, so
modname-multi has 2 words, and so modname is null, and build fail.

-- 
Sincerely,
Cao jin


