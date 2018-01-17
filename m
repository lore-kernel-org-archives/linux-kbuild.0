Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot0-f195.google.com ([74.125.82.195]:43244 "EHLO
        mail-ot0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753225AbeAQTkk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Jan 2018 14:40:40 -0500
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQNHtvQMaOxR2BMn21RtfE9pKc+g5MnGaRO=q8RK1tuWg@mail.gmail.com>
References: <1515662549-58933-1-git-send-email-wangxiongfeng2@huawei.com> <CAK7LNAQNHtvQMaOxR2BMn21RtfE9pKc+g5MnGaRO=q8RK1tuWg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 17 Jan 2018 20:40:37 +0100
Message-ID: <CAK8P3a3YNGqHXxWNHVnKbPuUeWMBMNTRApDc0YLqrOymTQQtCA@mail.gmail.com>
Subject: Re: [PATCH] Kbuild: suppress packed-not-aligned warning for default
 setting only
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Xiongfeng Wang <wangxiongfeng2@huawei.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Jan 17, 2018 at 5:12 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> 2018-01-11 18:22 GMT+09:00 Xiongfeng Wang <wangxiongfeng2@huawei.com>:
>> From: Xiongfeng Wang <xiongfeng.wang@linaro.org>
>>
>> gcc-8 reports many -Wpacked-not-aligned warnings. The below are some
>> examples.
>>
>> ./include/linux/ceph/msgr.h:67:1: warning: alignment 1 of 'struct
>> ceph_entity_addr' is less than 8 [-Wpacked-not-aligned]
>>  } __attribute__ ((packed));
>>
>> ./include/linux/ceph/msgr.h:67:1: warning: alignment 1 of 'struct
>> ceph_entity_addr' is less than 8 [-Wpacked-not-aligned]
>>  } __attribute__ ((packed));
>>
>> ./include/linux/ceph/msgr.h:67:1: warning: alignment 1 of 'struct
>> ceph_entity_addr' is less than 8 [-Wpacked-not-aligned]
>>  } __attribute__ ((packed));
>>
>> This patch suppress this kind of warnings for default setting.
>>
>> Signed-off-by: Xiongfeng Wang <xiongfeng.wang@linaro.org>
>> ---
>>  scripts/Makefile.extrawarn | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
>> index c6ebf42..8d53570 100644
>> --- a/scripts/Makefile.extrawarn
>> +++ b/scripts/Makefile.extrawarn
>> @@ -11,6 +11,8 @@
>>  # are not supported by all versions of the compiler
>>  # ==========================================================================
>>
>> +KBUILD_CFLAGS += $(call cc-disable-warning, packed-not-aligned)
>> +
>
> I moved this to else case of  KBUILD_ENABLE_EXTRA_GCC_CHECKS
>
> Please let me know if you see a problem.

It means we get the warning for any argument to W=, not just W=1, but
that's probably fine. I'd like to one day clean up the clang warnings
and those that we disable unconditionally in the top-level Makefile
so that each warning gets enabled at a specific level. For the time
being, I'm happy with the packed-not-aligned disabled by default.

       Arnd
