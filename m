Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:42393 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751395AbdK3I3r (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Nov 2017 03:29:47 -0500
Received: by mail-pf0-f195.google.com with SMTP id d23so2804066pfe.9
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Nov 2017 00:29:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CACT4Y+YOZPW3R2_bOU2ueNGaVMQm+1JfBDGVRKuaVSgR36zkGw@mail.gmail.com>
References: <20171129215050.158653-1-paullawrence@google.com>
 <20171129215050.158653-2-paullawrence@google.com> <CACT4Y+YOZPW3R2_bOU2ueNGaVMQm+1JfBDGVRKuaVSgR36zkGw@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 30 Nov 2017 09:29:26 +0100
Message-ID: <CACT4Y+ZGnBoXo7uG9Q9TOP-2E=SjyPNsbo7bC+xB=FsEqhQS2w@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] kasan: support alloca() poisoning
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Lawrence <paullawrence@google.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>, Linux-MM <linux-mm@kvack.org>, "open list:KERNEL BUILD + fi..." <linux-kbuild@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>

On Thu, Nov 30, 2017 at 9:26 AM, Dmitry Vyukov <dvyukov@google.com> wrote:
> /\/\/\/\/\/\On Wed, Nov 29, 2017 at 10:50 PM, Paul Lawrence
> <paullawrence@google.com> wrote:
>> clang's AddressSanitizer implementation adds redzones on either side of
>> alloca()ed buffers.  These redzones are 32-byte aligned and at least 32
>> bytes long.
>>
>> __asan_alloca_poison() is passed the size and address of the allocated
>> buffer, *excluding* the redzones on either side.  The left redzone will
>> always be to the immediate left of this buffer; but AddressSanitizer may
>> need to add padding between the end of the buffer and the right redzone.
>> If there are any 8-byte chunks inside this padding, we should poison
>> those too.
>>
>> __asan_allocas_unpoison() is just passed the top and bottom of the
>> dynamic stack area, so unpoisoning is simpler.
>>
>> Signed-off-by: Greg Hackmann <ghackmann@google.com>
>> Signed-off-by: Paul Lawrence <paullawrence@google.com>
>>
>>  mm/kasan/kasan.c  | 32 ++++++++++++++++++++++++++++++++
>>  mm/kasan/kasan.h  |  8 ++++++++
>>  mm/kasan/report.c |  4 ++++
>>  3 files changed, 44 insertions(+)
>>
>> diff --git a/mm/kasan/kasan.c b/mm/kasan/kasan.c
>> index 405bba487df5..f86f862f41f8 100644
>> --- a/mm/kasan/kasan.c
>> +++ b/mm/kasan/kasan.c
>> @@ -736,6 +736,38 @@ void __asan_unpoison_stack_memory(const void *addr, size_t size)
>>  }
>>  EXPORT_SYMBOL(__asan_unpoison_stack_memory);
>>
>> +/* Emitted by compiler to poison alloca()ed objects. */
>> +void __asan_alloca_poison(unsigned long addr, size_t size)
>> +{
>> +       size_t rounded_up_size = round_up(size, KASAN_SHADOW_SCALE_SIZE);
>> +       size_t padding_size = round_up(size, KASAN_ALLOCA_REDZONE_SIZE) -
>> +                       rounded_up_size;
>> +
>> +       const void *left_redzone = (const void *)(addr -
>> +                       KASAN_ALLOCA_REDZONE_SIZE);
>> +       const void *right_redzone = (const void *)(addr + rounded_up_size);
>> +
>> +       WARN_ON(!IS_ALIGNED(addr, KASAN_ALLOCA_REDZONE_SIZE));
>> +
>> +       kasan_unpoison_shadow((const void *)addr, size);
>
> /\/\/\/\/\/\
>
> Why do we need this? Stack must be clean. Compiler instrumentation
> does not clear shadow for objects in function prologue, if stack is
> dirty KASAN would explode.
>
>
>> +       kasan_poison_shadow(left_redzone, KASAN_ALLOCA_REDZONE_SIZE,
>> +                       KASAN_ALLOCA_LEFT);
>> +       kasan_poison_shadow(right_redzone,
>> +                       padding_size + KASAN_ALLOCA_REDZONE_SIZE,
>> +                       KASAN_ALLOCA_RIGHT);
>
> We also need to poison [size, rounded_up_size) with partial value if
> the range is not empty. I.e. we can poison exactly, say, 3 bytes
> there.

Wait, kasan_unpoison_shadow does this, right?
Somewhat counter-intuitive and more expensive than needed. Let's
poison only the last byte.



>> +}
>> +EXPORT_SYMBOL(__asan_alloca_poison);
>> +
>> +/* Emitted by compiler to unpoison alloca()ed areas when the stack unwinds. */
>> +void __asan_allocas_unpoison(const void *stack_top, const void *stack_bottom)
>> +{
>> +       if (unlikely(!stack_top || stack_top > stack_bottom))
>> +               return;
>> +
>> +       kasan_unpoison_shadow(stack_top, stack_bottom - stack_top);
>> +}
>> +EXPORT_SYMBOL(__asan_allocas_unpoison);
>> +
>>  #ifdef CONFIG_MEMORY_HOTPLUG
>>  static int __meminit kasan_mem_notifier(struct notifier_block *nb,
>>                         unsigned long action, void *data)
>> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
>> index c70851a9a6a4..7c0bcd1f4c0d 100644
>> --- a/mm/kasan/kasan.h
>> +++ b/mm/kasan/kasan.h
>> @@ -24,6 +24,14 @@
>>  #define KASAN_STACK_PARTIAL     0xF4
>>  #define KASAN_USE_AFTER_SCOPE   0xF8
>>
>> +/*
>> + * alloca redzone shadow values
>> + */
>> +#define KASAN_ALLOCA_LEFT      0xCA
>> +#define KASAN_ALLOCA_RIGHT     0xCB
>> +
>> +#define KASAN_ALLOCA_REDZONE_SIZE      32
>> +
>>  /* Don't break randconfig/all*config builds */
>>  #ifndef KASAN_ABI_VERSION
>>  #define KASAN_ABI_VERSION 1
>> diff --git a/mm/kasan/report.c b/mm/kasan/report.c
>> index 6bcfb01ba038..25419d426426 100644
>> --- a/mm/kasan/report.c
>> +++ b/mm/kasan/report.c
>> @@ -102,6 +102,10 @@ static const char *get_shadow_bug_type(struct kasan_access_info *info)
>>         case KASAN_USE_AFTER_SCOPE:
>>                 bug_type = "use-after-scope";
>>                 break;
>> +       case KASAN_ALLOCA_LEFT:
>> +       case KASAN_ALLOCA_RIGHT:
>> +               bug_type = "alloca-out-of-bounds";
>> +               break;
>>         }
>>
>>         return bug_type;
>> --
>> 2.15.0.531.g2ccb3012c9-goog
>>
