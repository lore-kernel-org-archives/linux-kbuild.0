Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:38279 "EHLO
        mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1760377AbcLPKqz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Dec 2016 05:46:55 -0500
Received: by mail-wm0-f43.google.com with SMTP id f82so28208209wmf.1
        for <linux-kbuild@vger.kernel.org>; Fri, 16 Dec 2016 02:46:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161216102902epcms5p1acc3482dea59a0eb85523ed082a31841@epcms5p1>
References: <1481608665-26941-1-git-send-email-maninder1.s@samsung.com>
 <CACT4Y+bQLjn23Vdsyq-gZY55RA+=tRYpq3DwHdu5vQLKbNBykA@mail.gmail.com>
 <6cc0eadc-5204-ce36-f5e8-88ba76bb6826@virtuozzo.com> <CACT4Y+Zu9QAYNh3=nnwiRNd6C5sxS1WGR=93ovmZs0hWkucPow@mail.gmail.com>
 <e08cfce3-ef28-3c34-4cef-9ebca8769050@virtuozzo.com> <CACT4Y+atLpDCfNHP-WcVb3RqsyMyOij+6M4rg09bw_VooranOg@mail.gmail.com>
 <CGME20161213152904epcas3p15f600392fd9f54fe1f68ed9f87d9f03b@epcas3p1.samsung.com>
 <20161216102902epcms5p1acc3482dea59a0eb85523ed082a31841@epcms5p1>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 16 Dec 2016 11:46:18 +0100
Message-ID: <CACT4Y+Z7zUW=0XEYsPFHTJUY5aFc-noBEcixNJGijj989JogMg@mail.gmail.com>
Subject: Re: [PATCH v2] kasan: Support for r/w instrumentation control
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Vaneet narang <v.narang@samsung.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>, Maninder Singh <maninder1.s@samsung.com>, Alexander Potapenko <glider@google.com>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <mmarek@suse.com>, Andrew Morton <akpm@linux-foundation.org>, kasan-dev <kasan-dev@googlegroups.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "open list:KERNEL BUILD + fi..." <linux-kbuild@vger.kernel.org>, PANKAJ MISHRA <pankaj.m@samsung.com>, Ajeet Kumar Yadav <ajeet.y@samsung.com>

On Fri, Dec 16, 2016 at 11:29 AM, Vaneet Narang <v.narang@samsung.com> wrote:
>
> Hi Andrey,
>
>
> There are times when requirement is only to find write issues so user should have flexibility to
> skip read instrumentation for better performance with KASAN enabled build to find realtime
> issues as well.
>
> >> crashes of false positives). CONFIG_KASAN_READS/WRITES is intended for
> >> situations when one wants to disable instrumentation wholesale.
> >>
> >
> >I'm talking about UBSAN_SANITIZE_ALL/KCOV_INSTRUMENT_ALL/GCOV_PROFILE_ALL
> >KASAN doesn't have something similar. I didn't add this because IMO it's not very useful for KASAN.
> >One may have a bug in instrumented code, but it can be easily missed if access is done in generic
> >code. Very simple example is passing invalid pointer in strcpy()
>
>
> Old toolchains already add asan hooks before strcpy, strcmp. Please check assembly generated
> for module with below code using gcc 4.9.
>
> static noinline void __init test_kasan_module(void) {
>         strcpy(test, "testing strcpy");
> }
>
> 0000000000001108 <test_kasan_module>:
>     1108:       a9bd7bfd        stp     x29, x30, [sp,#-48]!
>     110c:       d28001e1        mov     x1, #0xf                        // #15
>     1110:       910003fd        mov     x29, sp
>     1114:       a90153f3        stp     x19, x20, [sp,#16]
>     1118:       58000253        ldr     x19, 1160 <test_kasan_module+0x58>
>     111c:       f90013f5        str     x21, [sp,#32]
>     1120:       aa1303e0        mov     x0, x19
>     1124:       94000000        bl      0 <__asan_loadN>              // Instrumented Read of size 15
>     1128:       58000215        ldr     x21, 1168 <test_kasan_module+0x60>
>     112c:       d28001e1        mov     x1, #0xf                        // #15
>     1130:       910042b4        add     x20, x21, #0x10
>     1134:       aa1403e0        mov     x0, x20
>     1138:       94000000        bl      0 <__asan_storeN>          // Instrumented Write of size 15
>     113c:       f9400260        ldr     x0, [x19]
>     1140:       f9000aa0        str     x0, [x21,#16]
>     1144:       f8407260        ldr     x0, [x19,#7]
>     1148:       f80172a0        str     x0, [x21,#23]
>     114c:       a94153f3        ldp     x19, x20, [sp,#16]
>
>
>
> Similar behaviour for strcmp, memset, memcpy ... but  with latest compiler 6.2,
> this implementation is removed from compiler in this case we can define wrappers
> in kasan.c for these function like we are already doing for memcpy, memmove, memset
>
>


One option would be to simply compile kernel as:
$ make CC="gcc --param asan-instrument-reads=0"
