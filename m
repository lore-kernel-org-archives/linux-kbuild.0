Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:38958 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728452AbeGYO4D (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Jul 2018 10:56:03 -0400
Subject: Re: [PATCH v4 13/17] khwasan: add hooks implementation
References: <cover.1530018818.git.andreyknvl@google.com>
 <a2a93370d43ec85b02abaf8d007a15b464212221.1530018818.git.andreyknvl@google.com>
From: "Vincenzo Frascino@Foss" <vincenzo.frascino@arm.com>
Message-ID: <09cb5553-d84a-0e62-5174-315c14b88833@arm.com>
Date: Wed, 25 Jul 2018 14:44:10 +0100
MIME-Version: 1.0
In-Reply-To: <a2a93370d43ec85b02abaf8d007a15b464212221.1530018818.git.andreyknvl@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Konovalov <andreyknvl@google.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Christoph Lameter <cl@linux.com>, Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>, Nick Desaulniers <ndesaulniers@google.com>, Marc Zyngier <marc.zyngier@arm.com>, Dave Martin <dave.martin@arm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, "Eric W . Biederman" <ebiederm@xmission.com>, Ingo Molnar <mingo@kernel.org>, Paul Lawrence <paullawrence@google.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kate Stewart <kstewart@linuxfoundation.org>, Mike Rapoport <rppt@linux.vnet.ibm.com>, kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sparse@vger.kernel.org, linux-mm@kvack.org, linux-kbuild@vger.kernel.org
Cc: Chintan Pandya <cpandya@codeaurora.org>, Jacob Bramley <Jacob.Bramley@arm.com>, Jann Horn <jannh@google.com>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>, Lee Smith <Lee.Smith@arm.com>, Kostya Serebryany <kcc@google.com>, Mark Brand <markbrand@google.com>, Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>, Evgeniy Stepanov <eugenis@google.com>

On 06/26/2018 02:15 PM, Andrey Konovalov wrote:

> @@ -325,18 +341,41 @@ void kasan_init_slab_obj(struct kmem_cache *cache, const void *object)
>   
>   void *kasan_slab_alloc(struct kmem_cache *cache, void *object, gfp_t flags)
>   {
> -	return kasan_kmalloc(cache, object, cache->object_size, flags);
> +	object = kasan_kmalloc(cache, object, cache->object_size, flags);
> +	if (IS_ENABLED(CONFIG_KASAN_HW) && unlikely(cache->ctor)) {
> +		/*
> +		 * Cache constructor might use object's pointer value to
> +		 * initialize some of its fields.
> +		 */
> +		cache->ctor(object);
>
This seams breaking the kmem_cache_create() contract: "The @ctor is run 
when new pages are allocated by the cache." 
(https://elixir.bootlin.com/linux/v3.7/source/mm/slab_common.c#L83)

Since there might be preexisting code relying on it, this could lead to 
global side effects. Did you verify that this is not the case?

Another concern is performance related if we consider this solution 
suitable for "near-production", since with the current implementation 
you call the ctor (where present) on an object multiple times and this 
ends up memsetting and repopulating the memory every time (i.e. inode.c: 
inode_init_once). Do you know what is the performance impact?

-- 
Regards,
Vincenzo

