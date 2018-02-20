Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:15638 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750710AbeBTLs2 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Feb 2018 06:48:28 -0500
Date: Tue, 20 Feb 2018 19:48:24 +0800
From: Fengguang Wu <fengguang.wu@intel.com>
Subject: Re: [kbuild:kbuild 3/4] make[2]: *** No rule to make target
 'arch/sh/boot/dts/.dtb.o', needed by 'arch/sh/boot/dts/built-in.a'.
Message-ID: <20180220114824.nsdhxu7xas6zshig@wfg-t540p.sh.intel.com>
References: <201802192300.ISBrXbI4%fengguang.wu@intel.com>
 <CAK7LNAQ3Mej-Rvfs23M0W3P8YJWbd346bv6YG_1yVMCDKpYFUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAK7LNAQ3Mej-Rvfs23M0W3P8YJWbd346bv6YG_1yVMCDKpYFUw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, kbuild-all@01.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Masahiro,

On Tue, Feb 20, 2018 at 01:49:31AM +0900, Masahiro Yamada wrote:
>Hi test robot,
>
>
>2018-02-20 0:18 GMT+09:00 kbuild test robot <fengguang.wu@intel.com>:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
>> head:   4f89933b6227d330b98e01aed504cce515636215
>> commit: ffe8d1693c0fdb93b07f1b6449ae68bc6aba2efb [3/4] kbuild: rename built-in.o to built-in.a
>> config: sh-allmodconfig (attached as .config)
>> compiler: sh4-linux-gnu-gcc (Debian 7.2.0-11) 7.2.0
>> reproduce:
>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         git checkout ffe8d1693c0fdb93b07f1b6449ae68bc6aba2efb
>>         # save the attached .config to linux build tree
>>         make.cross ARCH=sh
>>
>> All errors (new ones prefixed by >>):
>>
>>>> make[2]: *** No rule to make target 'arch/sh/boot/dts/.dtb.o', needed by 'arch/sh/boot/dts/built-in.a'.
>>    make[2]: Target '__build' not remade because of errors.
>>
>> ---
>> 0-DAY kernel test infrastructure                Open Source Technology Center
>> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
>
>
>This is not a new error.
>(it just looked new because it was previously built-in.o,
> the it is now built-in.a)
>
>all{yes,mod}config for ARCH=sh was already broken.
>
>I can send a fix-up patch for sh later,
>but Nicholas's patch is innocent, so I will keep his patch.

Got it, thank you!

Cheers,
Fengguang
