Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr20112.outbound.protection.outlook.com ([40.107.2.112]:13216
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752457AbdGJK2O (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Jul 2017 06:28:14 -0400
Subject: Re: [PATCH 1/4] kasan: support alloca() poisoning
References: <20170706220114.142438-1-ghackmann@google.com>
 <20170706220114.142438-2-ghackmann@google.com>
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
Message-ID: <66645c53-de05-8371-ead8-d4e939af60a7@virtuozzo.com>
Date: Mon, 10 Jul 2017 13:30:09 +0300
MIME-Version: 1.0
In-Reply-To: <20170706220114.142438-2-ghackmann@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg Hackmann <ghackmann@google.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kbuild@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>, Michael Davidson <md@google.com>

On 07/07/2017 01:01 AM, Greg Hackmann wrote:
> clang's AddressSanitizer implementation adds redzones on either side of
> alloca()ed buffers.  These redzones are 32-byte aligned and at least 32
> bytes long.

gcc now supports this too. So I think this patch should enable it.
It's off by default so you'll have to add --param asan-instrument-allocas=1 into cflags
to make it work


> 
> __asan_alloca_poison() is passed the size and address of the allocated
> buffer, *excluding* the redzones on either side.  The left redzone will
> always be to the immediate left of this buffer; but AddressSanitizer may
> need to add padding between the end of the buffer and the right redzone.
> If there are any 8-byte chunks inside this padding, we should poison
> those too.
> 
> __asan_allocas_unpoison() is just passed the top and bottom of the
> dynamic stack area, so unpoisoning is simpler.
> 
> Signed-off-by: Greg Hackmann <ghackmann@google.com>
> ---
>  lib/test_kasan.c  | 22 ++++++++++++++++++++++

Tests would be better as a separate patch.


>  mm/kasan/kasan.c  | 26 ++++++++++++++++++++++++++
>  mm/kasan/kasan.h  |  8 ++++++++
>  mm/kasan/report.c |  3 +++
>  4 files changed, 59 insertions(+)
> 
> diff --git a/lib/test_kasan.c b/lib/test_kasan.c
> index a25c9763fce1..f774fcafb696 100644
> --- a/lib/test_kasan.c
> +++ b/lib/test_kasan.c
> @@ -473,6 +473,26 @@ static noinline void __init use_after_scope_test(void)
>  	p[1023] = 1;
>  }
>  
> +static noinline void __init kasan_alloca_oob_left(void)
> +{
> +	volatile int i = 10;
> +	char alloca_array[i];
> +	char *p = alloca_array - 1;
> +
> +	pr_info("out-of-bounds to left on alloca\n");
> +	*(volatile char *)p;
> +}
> +
> +static noinline void __init kasan_alloca_oob_right(void)
> +{
> +	volatile int i = 10;
> +	char alloca_array[i];
> +	char *p = alloca_array + round_up(i, 8);

Why round_up() ?

> +
> +	pr_info("out-of-bounds to right on alloca\n");
> +	*(volatile char *)p;
> +}
> +
>  static int __init kmalloc_tests_init(void)
>  {
>  	/*
> @@ -503,6 +523,8 @@ static int __init kmalloc_tests_init(void)
>  	memcg_accounted_kmem_cache();
>  	kasan_stack_oob();
>  	kasan_global_oob();
> +	kasan_alloca_oob_left();
> +	kasan_alloca_oob_right();
>  	ksize_unpoisons_memory();
>  	copy_user_test();
>  	use_after_scope_test();
> diff --git a/mm/kasan/kasan.c b/mm/kasan/kasan.c
> index c81549d5c833..892b626f564b 100644
> --- a/mm/kasan/kasan.c
> +++ b/mm/kasan/kasan.c
> @@ -802,6 +802,32 @@ void __asan_unpoison_stack_memory(const void *addr, size_t size)
>  }
>  EXPORT_SYMBOL(__asan_unpoison_stack_memory);
>  
> +/* Emitted by compiler to poison alloca()ed objects. */
> +void __asan_alloca_poison(unsigned long addr, size_t size)
> +{
> +	size_t rounded_up_size = round_up(size, KASAN_SHADOW_SCALE_SIZE);
> +	size_t padding_size = round_up(size, KASAN_ALLOCA_REDZONE_SIZE) -
> +			round_up(size, KASAN_SHADOW_SCALE_SIZE);
> +
> +	const void *left_redzone = (const void *)(addr -
> +			KASAN_ALLOCA_REDZONE_SIZE);
> +	const void *right_redzone = (const void *)(addr + rounded_up_size);
> +
> +	kasan_poison_shadow(left_redzone, KASAN_ALLOCA_REDZONE_SIZE,
> +			KASAN_ALLOCA_LEFT);
> +	kasan_poison_shadow(right_redzone,
> +			padding_size + KASAN_ALLOCA_REDZONE_SIZE,
> +			KASAN_ALLOCA_RIGHT);

As Dmitry pointed out, the memory between [addr+size, addr+rounded_up_size) is left
unpoisoned. kasan_alloca_oob_right() without round_up() would have caught this.
