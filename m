Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:12045 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725991AbeKMKEP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Nov 2018 05:04:15 -0500
Subject: Re: [kbuild-all] [kbuild:kbuild 2/4]
 arch/openrisc/include/asm/spr.h:20:27: error: impossible constraint in 'asm'
References: <201811120258.np3G1anC%fengguang.wu@intel.com>
 <CAAfxs76Qe7ORo7RFqSXc28bY15DR3zCy6rUAvg9T76xWS1TsWw@mail.gmail.com>
 <CAAfxs76m4uk0VDah1AsMQMxtKUimc7LFKcuEGMtQbEQ_1xw9gQ@mail.gmail.com>
From: Rong Chen <rong.a.chen@intel.com>
Message-ID: <d8261318-27a8-aa28-bcc6-bc324cb711aa@intel.com>
Date: Tue, 13 Nov 2018 08:09:00 +0800
MIME-Version: 1.0
In-Reply-To: <CAAfxs76m4uk0VDah1AsMQMxtKUimc7LFKcuEGMtQbEQ_1xw9gQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stafford Horne <shorne@gmail.com>, kbuild test robot <lkp@intel.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, kbuild-all@01.org, Changbin Du <changbin.du@gmail.com>

Hi Atafford,

I do apologise for troubling you, we have updated the make.cross,
you could use "GCC_VERSION=6.0.0 make.cross ARCH=openrisc" to reproduce.

Best Regards,
Rong Chen

On 11/12/2018 05:51 AM, Stafford Horne wrote:
> Again, in plain text mode:
>
> Did something change with the compiler setup?  The error here says gcc
> 6.0.0.  however the version in the make.cross tool is 5.4.0, which is
> strange.  Fyi, We have binaries for 7.2.0 and 9.x which can be used.
>
> Also our toolchain is all upstream as of last week.
>
> On Mon, Nov 12, 2018 at 6:03 AM Stafford Horne <shorne@gmail.com> wrote:
>> Hello,
>>
>> Did something change with the compiler setup?  The error here says gcc 6.0.0.  however the version in the make.cross tool is 5.4.0, which is strange.  Fyi, We have binaries for 7.2.0 and 9.x which can be used.
>>
>> Also our toolchain is all upstream as of last week.
>>
>> -stafford
>>
>> On Mon, Nov 12, 2018, 3:17 AM kbuild test robot <lkp@intel.com wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
>>> head:   e73c4f947acbe6ff12d1f1711d6a8c0ad1c9483a
>>> commit: cc2b86bb90b2d045b82d45a6dbe7c9285e0f00b9 [2/4] kernel hacking: add a config option to disable compiler auto-inlining
>>> config: openrisc-allyesconfig (attached as .config)
>>> compiler: or1k-linux-gcc (GCC) 6.0.0 20160327 (experimental)
>>> reproduce:
>>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>>          chmod +x ~/bin/make.cross
>>>          git checkout cc2b86bb90b2d045b82d45a6dbe7c9285e0f00b9
>>>          # save the attached .config to linux build tree
>>>          make.cross ARCH=openrisc
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>     In file included from arch/openrisc/mm/cache.c:17:0:
>>>     arch/openrisc/mm/cache.c: In function 'cache_loop':
>>>     arch/openrisc/include/asm/spr.h:20:27: warning: asm operand 0 probably doesn't match constraints
>>>      #define mtspr(_spr, _val) __asm__ __volatile__ (  \
>>>                                ^
>>>     arch/openrisc/mm/cache.c:29:3: note: in expansion of macro 'mtspr'
>>>        mtspr(reg, line);
>>>        ^~~~~
>>>>> arch/openrisc/include/asm/spr.h:20:27: error: impossible constraint in 'asm'
>>>      #define mtspr(_spr, _val) __asm__ __volatile__ (  \
>>>                                ^
>>>     arch/openrisc/mm/cache.c:29:3: note: in expansion of macro 'mtspr'
>>>        mtspr(reg, line);
>>>        ^~~~~
>>>
>>> vim +/asm +20 arch/openrisc/include/asm/spr.h
>>>
>>> 58e0166a4 Jonas Bonn 2011-06-04  19
>>> 58e0166a4 Jonas Bonn 2011-06-04 @20  #define mtspr(_spr, _val) __asm__ __volatile__ (           \
>>> 58e0166a4 Jonas Bonn 2011-06-04  21     "l.mtspr r0,%1,%0"                                      \
>>> 58e0166a4 Jonas Bonn 2011-06-04  22     : : "K" (_spr), "r" (_val))
>>> 58e0166a4 Jonas Bonn 2011-06-04  23  #define mtspr_off(_spr, _off, _val) __asm__ __volatile__ ( \
>>> 58e0166a4 Jonas Bonn 2011-06-04  24     "l.mtspr %0,%1,%2"                                      \
>>> 58e0166a4 Jonas Bonn 2011-06-04  25     : : "r" (_off), "r" (_val), "K" (_spr))
>>> 58e0166a4 Jonas Bonn 2011-06-04  26
>>>
>>> :::::: The code at line 20 was first introduced by commit
>>> :::::: 58e0166a4772aaeb10c9b0f6d59f19099d2047df OpenRISC: Headers
>>>
>>> :::::: TO: Jonas Bonn <jonas@southpole.se>
>>> :::::: CC: Jonas Bonn <jonas@southpole.se>
>>>
>>> ---
>>> 0-DAY kernel test infrastructure                Open Source Technology Center
>>> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
>>> _______________________________________________
>>> kbuild-all mailing list
>>> kbuild-all@lists.01.org
>>> https://lists.01.org/mailman/listinfo/kbuild-all
> _______________________________________________
> kbuild-all mailing list
> kbuild-all@lists.01.org
> https://lists.01.org/mailman/listinfo/kbuild-all
