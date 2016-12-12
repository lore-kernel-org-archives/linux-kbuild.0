Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wj0-f177.google.com ([209.85.210.177]:33897 "EHLO
        mail-wj0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752314AbcLLNpH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Dec 2016 08:45:07 -0500
Received: by mail-wj0-f177.google.com with SMTP id tg4so72249244wjb.1
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Dec 2016 05:45:07 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CACT4Y+YGK=2beyfo14ibOx92Lf8MefjQe5PhH2BSSj=v2pFaRw@mail.gmail.com>
References: <1481535157-24628-1-git-send-email-maninder1.s@samsung.com>
 <CGME20161212100600epcas4p2417928d125eb8b25589023cf0fdb733f@epcas4p2.samsung.com>
 <20161212102905epcms5p4ae1ddc2405b942e2d65e5cda4bc4abd4@epcms5p4>
 <20161212111205epcms5p6f2937fb3bc5d923b18e0ea1b1a5f395e@epcms5p6> <CACT4Y+YGK=2beyfo14ibOx92Lf8MefjQe5PhH2BSSj=v2pFaRw@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 12 Dec 2016 14:44:40 +0100
Message-ID: <CACT4Y+b=-eL1mhaBVs2BtAeL0TStpcxMfB4_iVpdiQiNSK25Fw@mail.gmail.com>
Subject: Re: Re: [PATCH 1/1] kasan: Support for r/w instrumentation control
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Vaneet narang <v.narang@samsung.com>
Cc: Maninder Singh <maninder1.s@samsung.com>, Michal Marek <mmarek@suse.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, "open list:KERNEL BUILD + fi..." <linux-kbuild@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>, PANKAJ MISHRA <pankaj.m@samsung.com>, Ajeet Kumar Yadav <ajeet.y@samsung.com>

On Mon, Dec 12, 2016 at 2:43 PM, Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Mon, Dec 12, 2016 at 12:12 PM, Vaneet Narang <v.narang@samsung.com> wrote:
>>
>> Hi,
>>
>> >>> Do you actually hit an issue with image size? In what context?
>> >>> Do you use inline/outline instrumentation? Does switching to the other
>> >>> option help?
>> >>
>> >> Memory access with KASAN enabled Image has overhead in terms of cpu execution.
>> >> Sometimes we are not able to reproduce race condition issues with these overhead in
>> >> place. So user should have control atleast over read instrumentation.
>> >
>> >Don't you want to disable KASAN entirely in such case?
>>
>> hmmm, but we need KASAN to detect corruption issues so overhead can be
>> reduced by switching OFF read instrumentation. Generally Reads are much more frequent
>> than writes as latest arm64 kernel has 224000 reads and 62300 writes
>> which is almost 3.5 times. So i think this control is required.
>>
>>
>> >>> Does it make sense to ever disable writes? I assume that you are
>> >>
>> >> Write instrumentation control is majorly kept to be inline with ASAN for user space
>> >> applications.
>> >> Also write is sometimes useful when uImage is already sanitized and some corruption
>> >> is done by kernel modules by doing some direct memory access then both read / write sanity of uImage
>> >> can be avoided.
>> >
>> >But then you don't need KASAN at all.
>>
>> KASAN support is required in this case to detect module issues.
>> KASAN provides asan_load / asan_store definition as these functions
>> are added by compiler in modules before every memory access.
>> These are the functions which will do address sanity and detect errors.
>

[resending as plain text]

Ah, OK, I see. So you want to e.g. not instrument kernel (for both
reads and writes), but instrument a single module. That makes sense.
Please extend the Usage section of KASAN docs:
https://kernel.org/doc/html/latest/dev-tools/kasan.html#usage
mention not instrumenting writes for whole kernel, and instrumenting a
single module.
