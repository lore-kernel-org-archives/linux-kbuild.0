Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot0-f182.google.com ([74.125.82.182]:45308 "EHLO
        mail-ot0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751243AbeAWQeZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Jan 2018 11:34:25 -0500
Received: by mail-ot0-f182.google.com with SMTP id r4so925709oti.12
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Jan 2018 08:34:24 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <15410102-0647-10e3-beeb-9e4debede735@virtuozzo.com>
References: <8ffecfffe04088c52c42b92739c2bd8a0bcb3f5e.1516384594.git.andreyknvl@google.com>
 <15410102-0647-10e3-beeb-9e4debede735@virtuozzo.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Tue, 23 Jan 2018 17:34:23 +0100
Message-ID: <CAAeHK+xmVFSn0C=Uumx0=K9+qwDn6FyyOpxW1WtL4AJz-uC23w@mail.gmail.com>
Subject: Re: [PATCH v2] kasan: don't emit builtin calls when sanitization is off
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>, Kostya Serebryany <kcc@google.com>, Evgeniy Stepanov <eugenis@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Pirama Arumuga Nainar <pirama@google.com>, Manoj Gupta <manojgupta@google.com>, Greg Hackmann <ghackmann@google.com>, Andrew Morton <akpm@linux-foundation.org>

On Tue, Jan 23, 2018 at 10:24 AM, Andrey Ryabinin
<aryabinin@virtuozzo.com> wrote:
>
>
> On 01/19/2018 08:58 PM, Andrey Konovalov wrote:
>> With KASAN enabled the kernel has two different memset() functions, one
>> with KASAN checks (memset) and one without (__memset). KASAN uses some
>> macro tricks to use the proper version where required. For example memset()
>> calls in mm/slub.c are without KASAN checks, since they operate on poisoned
>> slab object metadata.
>>
>> The issue is that clang emits memset() calls even when there is no memset()
>> in the source code. They get linked with improper memset() implementation
>> and the kernel fails to boot due to a huge amount of KASAN reports during
>> early boot stages.
>>
>
> So how did you observe this? Why am I not seeing this problem?

I only observed this when I tried to cross-compile the kernel for
arm64 with clang. I suspect this can happen on x86 as well.

>
>> The solution is to add -fno-builtin flag for files with KASAN_SANITIZE := n
>> marker.
>>
>
> I'm not sure I understand how is this solves the problem. And what clang does
> instead of memset()? Does it inlines memset()? But according to GCC's man (clang's man is very vague about this)
> -fno-builtin should do exactly the opposite  - prevent inlining builtin functions
> and always generate a function call.

The issue is that the compiler is allowed to replace plain assignment
with memset() calls. And -fno-builtin suppresses that behavior, but
there are no mentions of this in the documentation that I could find.
I also failed to find the exact place in the source code that leads to
this, perhaps Nick can help with that.
