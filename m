Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:17670 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751491AbdF0DCa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Jun 2017 23:02:30 -0400
Received: from mail-yb0-f170.google.com (mail-yb0-f170.google.com [209.85.213.170]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id v5R32EiC014241
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Jun 2017 12:02:14 +0900
Received: by mail-yb0-f170.google.com with SMTP id e201so5747258ybb.1
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Jun 2017 20:02:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170626114615.30e2a72d@roar.ozlabs.ibm.com>
References: <201706251957.uG7LtWSJ%fengguang.wu@intel.com> <20170626114615.30e2a72d@roar.ozlabs.ibm.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 27 Jun 2017 12:02:12 +0900
Message-ID: <CAK7LNASivy+nNv8_u7RCMjGq74C3YbTs2dUtXGtPkrPeqYtrPQ@mail.gmail.com>
Subject: Re: [kbuild:thin-ar 10/10] frv-linux-ld: Warning: size of symbol
 `sys_bpf' changed from 40 in kernel/sys_ni.o to 1800 in kernel/bpf/syscall.o
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, David Howells <dhowells@redhat.com>

2017-06-26 10:46 GMT+09:00 Nicholas Piggin <npiggin@gmail.com>:
> On Sun, 25 Jun 2017 19:29:14 +0800
> kbuild test robot <fengguang.wu@intel.com> wrote:
>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git thin-ar
>> head:   e7238f4fac14967bba823ef4b4b77ee928a4860a
>> commit: e7238f4fac14967bba823ef4b4b77ee928a4860a [10/10] kbuild: thin archives make default for all archs
>> config: frv-allmodconfig (attached as .config)
>> compiler: frv-linux-gcc (GCC) 6.2.0
>> reproduce:
>>         wget https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         git checkout e7238f4fac14967bba823ef4b4b77ee928a4860a
>>         # save the attached .config to linux build tree
>>         make.cross ARCH=frv
>>
>> All warnings (new ones prefixed by >>):
>
> [snip]
>
>>    frv-linux-ld: Warning: size of symbol `sys_eventfd' changed from 40 in kernel/sys_ni.o to 44 in fs/eventfd.o
>> >> frv-linux-ld: Warning: size of symbol `sys_userfaultfd' changed from 40 in kernel/sys_ni.o to 356 in fs/userfaultfd.o
>>    frv-linux-ld: Warning: size of symbol `sys_io_setup' changed from 40 in kernel/sys_ni.o to 2636 in fs/aio.o
>
> These warnings also happen with incremental linking and must be due to
> some bug in the arch port or toolchain.
>
>>    init/main.o: In function `do_one_initcall':
>>    init/main.c:792:(.text+0x1b8): relocation truncated to fit: R_FRV_GPREL12 against symbol `initcall_debug' defined in .sbss section in init/main.o
>
> [snip]
>
> These aren't new either, and due to the large allmodconfig kernel.
>
> So none of this is newly caused by the thin archives patch.
>



I tested "make ARCH=frv defconfig" in Linus' tree.

 v4.12-rc2 : failed
 v4.12-rc3 : failed
 v4.12-rc4 : success
 v4.12-rc5 : success
 v4.12-rc6 : success
 v4.12-rc7 : success

So, I think something was fixed between -rc3 and -rc4.
(I have not tried git-bisect)



The current thin-ar branch is based on v4.12-rc2 tag.
That's why we see frv build error.


By rebasing thin-ar onto v4.12-rc4 tag,
I do not see this build error any more.



-- 
Best Regards
Masahiro Yamada
