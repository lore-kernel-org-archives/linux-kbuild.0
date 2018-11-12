Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it1-f194.google.com ([209.85.166.194]:39001 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727354AbeKMDpP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Nov 2018 22:45:15 -0500
Received: by mail-it1-f194.google.com with SMTP id m15so14426815itl.4
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Nov 2018 09:50:58 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20181107165438.34kb5ufoe5ve2f6i@lakrids.cambridge.arm.com>
References: <cover.1541525354.git.andreyknvl@google.com> <86d1b17c755d8bfd6e44e6869a16f4a409e7bd06.1541525354.git.andreyknvl@google.com>
 <20181107165438.34kb5ufoe5ve2f6i@lakrids.cambridge.arm.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Mon, 12 Nov 2018 18:50:57 +0100
Message-ID: <CAAeHK+zOk9SDzUE38d2dJBE+mbwPwYr2pawV1JYEZFUCmR=ViA@mail.gmail.com>
Subject: Re: [PATCH v10 06/22] kasan, arm64: adjust shadow size for tag-based mode
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Christoph Lameter <cl@linux.com>, Andrew Morton <akpm@linux-foundation.org>, Nick Desaulniers <ndesaulniers@google.com>, Marc Zyngier <marc.zyngier@arm.com>, Dave Martin <dave.martin@arm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, "Eric W . Biederman" <ebiederm@xmission.com>, Ingo Molnar <mingo@kernel.org>, Paul Lawrence <paullawrence@google.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kate Stewart <kstewart@linuxfoundation.org>, Mike Rapoport <rppt@linux.vnet.ibm.com>, kasan-dev@googlegroups.com, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sparse@vger.kernel.org, Linux Memory Management List <linux-mm@kvack.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Kostya Serebryany <kcc@google.com>, Evgeniy Stepanov <eugenis@google.com>, Lee Smith <Lee.Smith@arm.com>, Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>, Jacob Bramley <Jacob.Bramley@arm.com>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>, Jann Horn <jannh@google.com>, Mark Brand <markbrand@google.com>, Chintan Pandya <cpandya@codeaurora.org>, Vishwath Mohan <vishwath@google.com>

On Wed, Nov 7, 2018 at 5:54 PM, Mark Rutland <mark.rutland@arm.com> wrote:

[...]

>> --- a/arch/arm64/Makefile
>> +++ b/arch/arm64/Makefile
>> @@ -94,7 +94,7 @@ endif
>>  # KASAN_SHADOW_OFFSET = VA_START + (1 << (VA_BITS - KASAN_SHADOW_SCALE_SHIFT))
>>  #                             - (1 << (64 - KASAN_SHADOW_SCALE_SHIFT))
>>  # in 32-bit arithmetic
>> -KASAN_SHADOW_SCALE_SHIFT := 3
>> +KASAN_SHADOW_SCALE_SHIFT := $(if $(CONFIG_KASAN_SW_TAGS), 4, 3)
>
>
> We could make this something like:
>
> ifeq ($(CONFIG_KASAN_SW_TAGS), y)
> KASAN_SHADOW_SCALE_SHIFT := 4
> else
> KASAN_SHADOW_SCALE_SHIFT := 3
> endif
>
> KBUILD_CFLAGS += -DKASAN_SHADOW_SCALE_SHIFT=$(KASAN_SHADOW_SCALE_SHIFT)

Seems that we need the same for KBUILD_CPPFLAGS and KBUILD_AFLAGS.


>> diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
>> index b96442960aea..0f1e024a951f 100644
>> --- a/arch/arm64/include/asm/memory.h
>> +++ b/arch/arm64/include/asm/memory.h
>> @@ -74,12 +74,17 @@
>>  #define KERNEL_END        _end
>>
>>  /*
>> - * KASAN requires 1/8th of the kernel virtual address space for the shadow
>> - * region. KASAN can bloat the stack significantly, so double the (minimum)
>> - * stack size when KASAN is in use.
>> + * Generic and tag-based KASAN require 1/8th and 1/16th of the kernel virtual
>> + * address space for the shadow region respectively. They can bloat the stack
>> + * significantly, so double the (minimum) stack size when they are in use.
>>   */
>> -#ifdef CONFIG_KASAN
>> +#ifdef CONFIG_KASAN_GENERIC
>>  #define KASAN_SHADOW_SCALE_SHIFT 3
>> +#endif
>> +#ifdef CONFIG_KASAN_SW_TAGS
>> +#define KASAN_SHADOW_SCALE_SHIFT 4
>> +#endif
>> +#ifdef CONFIG_KASAN
>
> ... and remove the constant entirely here, avoiding duplication.
>
> Maybe factor that into a Makefile.kasan if things are going to get much
> more complicated.

Will do in v11, thanks!
