Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:33222 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726162AbfKMVMk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Nov 2019 16:12:40 -0500
Date: Wed, 13 Nov 2019 13:12:37 -0800
From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] mm/vmalloc: Fix regression caused by needless
 vmalloc_sync_all()
Message-Id: <20191113131237.1757241fb0c458484c2b19aa@linux-foundation.org>
In-Reply-To: <20191113095530.228959-1-shile.zhang@linux.alibaba.com>
References: <20191113095530.228959-1-shile.zhang@linux.alibaba.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Shile Zhang <shile.zhang@linux.alibaba.com>
Cc: Joerg Roedel <jroedel@suse.de>, linux-mm@kvack.org, linux-kbuild@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Dave Hansen <dave.hansen@intel.com>, Qian Cai <cai@lca.pw>

On Wed, 13 Nov 2019 17:55:30 +0800 Shile Zhang <shile.zhang@linux.alibaba.com> wrote:

> vmalloc_sync_all() was put in the common path in
> __purge_vmap_area_lazy(), for one sync issue only happened on X86_32
> with PTI enabled. It is needless for X86_64, which caused a big regression
> in UnixBench Shell8 testing on X86_64.
> Similar regression also reported by 0-day kernel test robot in reaim
> benchmarking:
> https://lists.01.org/hyperkitty/list/lkp@lists.01.org/thread/4D3JPPHBNOSPFK2KEPC6KGKS6J25AIDB/

That is indeed a large performance regression.

> Fix it by adding more conditions.
> 
> Fixes: 3f8fd02b1bf1 ("mm/vmalloc: Sync unmappings in __purge_vmap_area_lazy()")
>
> ...
>
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -1255,11 +1255,17 @@ static bool __purge_vmap_area_lazy(unsigned long start, unsigned long end)
>  	if (unlikely(valist == NULL))
>  		return false;
>  
> +#if defined(CONFIG_X86_32) && defined(CONFIG_X86_PAE)

Are we sure that x86_32 is the only architecture whcih is (or ever will
be) affected?

>  	/*
>  	 * First make sure the mappings are removed from all page-tables
>  	 * before they are freed.
> +	 *
> +	 * This is only needed on x86-32 with !SHARED_KERNEL_PMD, which is
> +	 * the case on a PAE kernel with PTI enabled.
>  	 */
> -	vmalloc_sync_all();
> +	if (!SHARED_KERNEL_PMD && boot_cpu_has(X86_FEATURE_PTI))
> +		vmalloc_sync_all();
> +#endif
>  
>  	/*
>  	 * TODO: to calculate a flush range without looping.

CONFIG_X86_PAE depends on CONFIG_X86_32 so no need to check
CONFIG_X86_32?

From: Andrew Morton <akpm@linux-foundation.org>
Subject: mm-vmalloc-fix-regression-caused-by-needless-vmalloc_sync_all-fix

simplify config expression, use IS_ENABLED()

Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Joerg Roedel <jroedel@suse.de>
Cc: Qian Cai <cai@lca.pw>
Cc: Shile Zhang <shile.zhang@linux.alibaba.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 mm/vmalloc.c |   21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

--- a/mm/vmalloc.c~mm-vmalloc-fix-regression-caused-by-needless-vmalloc_sync_all-fix
+++ a/mm/vmalloc.c
@@ -1255,16 +1255,17 @@ static bool __purge_vmap_area_lazy(unsig
 	if (unlikely(valist == NULL))
 		return false;
 
-#if defined(CONFIG_X86_32) && defined(CONFIG_X86_PAE)
-	/*
-	 * First make sure the mappings are removed from all page-tables
-	 * before they are freed.
-	 *
-	 * This is only needed on x86-32 with !SHARED_KERNEL_PMD, which is
-	 * the case on a PAE kernel with PTI enabled.
-	 */
-	if (!SHARED_KERNEL_PMD && boot_cpu_has(X86_FEATURE_PTI))
-		vmalloc_sync_all();
+	if (IS_ENABLED(CONFIG_X86_PAE)) {
+		/*
+		 * First make sure the mappings are removed from all page-tables
+		 * before they are freed.
+		 *
+		 * This is only needed on x86-32 with !SHARED_KERNEL_PMD, which
+		 * is the case on a PAE kernel with PTI enabled.
+		 */
+		if (!SHARED_KERNEL_PMD && boot_cpu_has(X86_FEATURE_PTI))
+			vmalloc_sync_all();
+	}
 #endif
 
 	/*
_
