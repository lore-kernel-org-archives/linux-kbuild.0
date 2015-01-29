Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:59201 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750767AbbA2XNd (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 29 Jan 2015 18:13:33 -0500
Date: Thu, 29 Jan 2015 15:13:32 -0800
From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v10 17/17] kasan: enable instrumentation of global
 variables
Message-Id: <20150129151332.3f87c0b2e335afd88af33e08@linux-foundation.org>
In-Reply-To: <1422544321-24232-18-git-send-email-a.ryabinin@samsung.com>
References: <1404905415-9046-1-git-send-email-a.ryabinin@samsung.com>
	<1422544321-24232-1-git-send-email-a.ryabinin@samsung.com>
	<1422544321-24232-18-git-send-email-a.ryabinin@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Ryabinin <a.ryabinin@samsung.com>
Cc: linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>, Konstantin Serebryany <kcc@google.com>, Dmitry Chernenkov <dmitryc@google.com>, Andrey Konovalov <adech.fo@gmail.com>, Yuri Gribov <tetra2005@gmail.com>, Konstantin Khlebnikov <koct9i@gmail.com>, Sasha Levin <sasha.levin@oracle.com>, Christoph Lameter <cl@linux.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Dave Hansen <dave.hansen@intel.com>, Andi Kleen <andi@firstfloor.org>, x86@kernel.org, linux-mm@kvack.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Rusty Russell <rusty@rustcorp.com.au>, Michal Marek <mmarek@suse.cz>, "open list:KERNEL BUILD + fi..." <linux-kbuild@vger.kernel.org>

On Thu, 29 Jan 2015 18:12:01 +0300 Andrey Ryabinin <a.ryabinin@samsung.com> wrote:

> This feature let us to detect accesses out of bounds
> of global variables.

global variables *within modules*, I think?  More specificity needed here.

> The idea of this is simple. Compiler increases each global variable
> by redzone size and add constructors invoking __asan_register_globals()
> function. Information about global variable (address, size,
> size with redzone ...) passed to __asan_register_globals() so we could
> poison variable's redzone.
> 
> This patch also forces module_alloc() to return 8*PAGE_SIZE aligned
> address making shadow memory handling ( kasan_module_alloc()/kasan_module_free() )
> more simple. Such alignment guarantees that each shadow page backing
> modules address space correspond to only one module_alloc() allocation.
> 
> ...
>
> +int kasan_module_alloc(void *addr, size_t size)
> +{
> +
> +	size_t shadow_size = round_up(size >> KASAN_SHADOW_SCALE_SHIFT,
> +				PAGE_SIZE);
> +	unsigned long shadow_start = kasan_mem_to_shadow((unsigned long)addr);
> +	void *ret;

Like this:

	size_t shadow_size;
	unsigned long shadow_start;
	void *ret;

	shadow_size = round_up(size >> KASAN_SHADOW_SCALE_SHIFT, PAGE_SIZE);
	shadow_start = kasan_mem_to_shadow((unsigned long)addr);

it's much easier to read and avoids the 80-column trickery.

I do suspect that

	void *kasan_mem_to_shadow(const void *addr);

would clean up lots and lots of code.

> +	if (WARN_ON(!PAGE_ALIGNED(shadow_start)))
> +		return -EINVAL;
> +
> +	ret = __vmalloc_node_range(shadow_size, 1, shadow_start,
> +			shadow_start + shadow_size,
> +			GFP_KERNEL | __GFP_HIGHMEM | __GFP_ZERO,
> +			PAGE_KERNEL, VM_NO_GUARD, NUMA_NO_NODE,
> +			__builtin_return_address(0));
> +	return ret ? 0 : -ENOMEM;
> +}
> +
> 
> ...
>
> +struct kasan_global {
> +	const void *beg;		/* Address of the beginning of the global variable. */
> +	size_t size;			/* Size of the global variable. */
> +	size_t size_with_redzone;	/* Size of the variable + size of the red zone. 32 bytes aligned */
> +	const void *name;
> +	const void *module_name;	/* Name of the module where the global variable is declared. */
> +	unsigned long has_dynamic_init;	/* This needed for C++ */

This can be removed?

> +#if KASAN_ABI_VERSION >= 4
> +	struct kasan_source_location *location;
> +#endif
> +};
> 
> ...
>

