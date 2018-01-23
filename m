Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr10118.outbound.protection.outlook.com ([40.107.1.118]:26708
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751169AbeAWJfD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Jan 2018 04:35:03 -0500
Subject: Re: [PATCH v2] kasan: don't emit builtin calls when sanitization is
 off
References: <8ffecfffe04088c52c42b92739c2bd8a0bcb3f5e.1516384594.git.andreyknvl@google.com>
 <20180122182047.1da66312c5d94cb4632efabd@linux-foundation.org>
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
Message-ID: <9e61ea96-e10e-e200-e88d-51fc202c36c9@virtuozzo.com>
Date: Tue, 23 Jan 2018 12:35:13 +0300
MIME-Version: 1.0
In-Reply-To: <20180122182047.1da66312c5d94cb4632efabd@linux-foundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Andrey Konovalov <andreyknvl@google.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, Kostya Serebryany <kcc@google.com>, Evgeniy Stepanov <eugenis@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Pirama Arumuga Nainar <pirama@google.com>, Manoj Gupta <manojgupta@google.com>, Greg Hackmann <ghackmann@google.com>, Arnd Bergmann <arnd@arndb.de>



On 01/23/2018 05:20 AM, Andrew Morton wrote:
> On Fri, 19 Jan 2018 18:58:12 +0100 Andrey Konovalov <andreyknvl@google.com> wrote:
> 
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
>> The solution is to add -fno-builtin flag for files with KASAN_SANITIZE := n
>> marker.
> 
> This clashes somewhat with Arnd's asan-rework-kconfig-settings.patch. 
> Could you two please put heads together and decide what we want for a
> final result?
> 
> Meanwhile I'll "fix" the reject with
> 
> +ifdef CONFIG_KASAN_EXTRA
>  CFLAGS_KASAN += $(call cc-option, -fsanitize-address-use-after-scope)
> +endif
> 

Looks correct.
