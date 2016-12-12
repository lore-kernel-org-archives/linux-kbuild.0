Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:36292 "EHLO
        mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751266AbcLLKti (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Dec 2016 05:49:38 -0500
Received: by mail-wm0-f49.google.com with SMTP id g23so55329468wme.1
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Dec 2016 02:49:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161212102905epcms5p4ae1ddc2405b942e2d65e5cda4bc4abd4@epcms5p4>
References: <1481535157-24628-1-git-send-email-maninder1.s@samsung.com>
 <CGME20161212100600epcas4p2417928d125eb8b25589023cf0fdb733f@epcas4p2.samsung.com>
 <20161212102905epcms5p4ae1ddc2405b942e2d65e5cda4bc4abd4@epcms5p4>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 12 Dec 2016 11:49:16 +0100
Message-ID: <CACT4Y+ZOh=PMxhuw12qossNn9d3MDO=YmTYriT_QcjFN2tSHmg@mail.gmail.com>
Subject: Re: Re: [PATCH 1/1] kasan: Support for r/w instrumentation control
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Vaneet narang <v.narang@samsung.com>
Cc: Maninder Singh <maninder1.s@samsung.com>, Michal Marek <mmarek@suse.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, "open list:KERNEL BUILD + fi..." <linux-kbuild@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>, PANKAJ MISHRA <pankaj.m@samsung.com>, Ajeet Kumar Yadav <ajeet.y@samsung.com>

On Mon, Dec 12, 2016 at 11:29 AM, Vaneet Narang <v.narang@samsung.com> wrote:
>  Hi,
>
>> Do you actually hit an issue with image size? In what context?
>> Do you use inline/outline instrumentation? Does switching to the other
>> option help?
>
> Memory access with KASAN enabled Image has overhead in terms of cpu execution.
> Sometimes we are not able to reproduce race condition issues with these overhead in
> place. So user should have control atleast over read instrumentation.

Don't you want to disable KASAN entirely in such case?


>> Does it make sense to ever disable writes? I assume that you are
>
> Write instrumentation control is majorly kept to be inline with ASAN for user space
> applications.
> Also write is sometimes useful when uImage is already sanitized and some corruption
> is done by kernel modules by doing some direct memory access then both read / write sanity of uImage
> can be avoided.

But then you don't need KASAN at all.


>> disabling reads, right?
>> Disabling both certainly does not make sense.
