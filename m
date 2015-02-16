Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49290 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752565AbbBPEKs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 15 Feb 2015 23:10:48 -0500
From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH v11 19/19] kasan: enable instrumentation of global variables
In-Reply-To: <1422985392-28652-20-git-send-email-a.ryabinin@samsung.com>
References: <1404905415-9046-1-git-send-email-a.ryabinin@samsung.com> <1422985392-28652-1-git-send-email-a.ryabinin@samsung.com> <1422985392-28652-20-git-send-email-a.ryabinin@samsung.com>
Date: Mon, 16 Feb 2015 13:28:09 +1030
Message-ID: <87a90ea7ge.fsf@rustcorp.com.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Ryabinin <a.ryabinin@samsung.com>, linux-kernel@vger.kernel.org
Cc: Dmitry Vyukov <dvyukov@google.com>, Konstantin Serebryany <kcc@google.com>, Dmitry Chernenkov <dmitryc@google.com>, Andrey Konovalov <adech.fo@gmail.com>, Yuri Gribov <tetra2005@gmail.com>, Konstantin Khlebnikov <koct9i@gmail.com>, Sasha Levin <sasha.levin@oracle.com>, Christoph Lameter <cl@linux.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, Dave Hansen <dave.hansen@intel.com>, Andi Kleen <andi@firstfloor.org>, x86@kernel.org, linux-mm@kvack.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Michal Marek <mmarek@suse.cz>, "open list:KERNEL BUILD + fi..." <linux-kbuild@vger.kernel.org>

Andrey Ryabinin <a.ryabinin@samsung.com> writes:
> This feature let us to detect accesses out of bounds of
> global variables. This will work as for globals in kernel
> image, so for globals in modules. Currently this won't work
> for symbols in user-specified sections (e.g. __init, __read_mostly, ...)
>
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

Hmm, I understand why you only fixed x86, but it's weird.

I think MODULE_ALIGN belongs in linux/moduleloader.h, and every arch
should be fixed up to use it (though you could leave that for later).

Might as well fix the default implementation at least.

> @@ -49,8 +49,15 @@ void kasan_krealloc(const void *object, size_t new_size);
>  void kasan_slab_alloc(struct kmem_cache *s, void *object);
>  void kasan_slab_free(struct kmem_cache *s, void *object);
>  
> +#define MODULE_ALIGN (PAGE_SIZE << KASAN_SHADOW_SCALE_SHIFT)
> +
> +int kasan_module_alloc(void *addr, size_t size);
> +void kasan_module_free(void *addr);
> +
>  #else /* CONFIG_KASAN */
>  
> +#define MODULE_ALIGN 1

Hmm, that should be PAGE_SIZE (we assume that in several places).

> @@ -1807,6 +1808,7 @@ static void unset_module_init_ro_nx(struct module *mod) { }
>  void __weak module_memfree(void *module_region)
>  {
>  	vfree(module_region);
> +	kasan_module_free(module_region);
>  }

This looks racy (memory reuse?).  Perhaps try other order?

Cheers,
Rusty.
