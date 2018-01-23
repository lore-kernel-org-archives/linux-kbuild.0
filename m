Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ve1eur01on0139.outbound.protection.outlook.com ([104.47.1.139]:29772
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751154AbeAWJYq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Jan 2018 04:24:46 -0500
Subject: Re: [PATCH v2] kasan: don't emit builtin calls when sanitization is
 off
References: <8ffecfffe04088c52c42b92739c2bd8a0bcb3f5e.1516384594.git.andreyknvl@google.com>
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
Message-ID: <15410102-0647-10e3-beeb-9e4debede735@virtuozzo.com>
Date: Tue, 23 Jan 2018 12:24:54 +0300
MIME-Version: 1.0
In-Reply-To: <8ffecfffe04088c52c42b92739c2bd8a0bcb3f5e.1516384594.git.andreyknvl@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Konovalov <andreyknvl@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Cc: Kostya Serebryany <kcc@google.com>, Evgeniy Stepanov <eugenis@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Pirama Arumuga Nainar <pirama@google.com>, Manoj Gupta <manojgupta@google.com>, Greg Hackmann <ghackmann@google.com>, Andrew Morton <akpm@linux-foundation.org>



On 01/19/2018 08:58 PM, Andrey Konovalov wrote:
> With KASAN enabled the kernel has two different memset() functions, one
> with KASAN checks (memset) and one without (__memset). KASAN uses some
> macro tricks to use the proper version where required. For example memset()
> calls in mm/slub.c are without KASAN checks, since they operate on poisoned
> slab object metadata.
> 
> The issue is that clang emits memset() calls even when there is no memset()
> in the source code. They get linked with improper memset() implementation
> and the kernel fails to boot due to a huge amount of KASAN reports during
> early boot stages.
> 

So how did you observe this? Why am I not seeing this problem?

> The solution is to add -fno-builtin flag for files with KASAN_SANITIZE := n
> marker.
> 

I'm not sure I understand how is this solves the problem. And what clang does
instead of memset()? Does it inlines memset()? But according to GCC's man (clang's man is very vague about this)
-fno-builtin should do exactly the opposite  - prevent inlining builtin functions
and always generate a function call.
