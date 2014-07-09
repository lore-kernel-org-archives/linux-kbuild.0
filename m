Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:22830 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932476AbaGITdr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Jul 2014 15:33:47 -0400
From: Andi Kleen <andi@firstfloor.org>
Subject: Re: [RFC/PATCH RESEND -next 03/21] x86: add kasan hooks fort memcpy/memmove/memset functions
References: <1404905415-9046-1-git-send-email-a.ryabinin@samsung.com>
	<1404905415-9046-4-git-send-email-a.ryabinin@samsung.com>
Date: Wed, 09 Jul 2014 12:31:58 -0700
In-Reply-To: <1404905415-9046-4-git-send-email-a.ryabinin@samsung.com> (Andrey
	Ryabinin's message of "Wed, 09 Jul 2014 15:29:57 +0400")
Message-ID: <87ion6nxap.fsf@tassilo.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Ryabinin <a.ryabinin@samsung.com>
Cc: linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>, Konstantin Serebryany <kcc@google.com>, Alexey Preobrazhensky <preobr@google.com>, Andrey Konovalov <adech.fo@gmail.com>, Yuri Gribov <tetra2005@gmail.com>, Konstantin Khlebnikov <koct9i@gmail.com>, Sasha Levin <sasha.levin@oracle.com>, Michal Marek <mmarek@suse.cz>, Russell King <linux@arm.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-mm@kvack.org

Andrey Ryabinin <a.ryabinin@samsung.com> writes:
> +
> +#undef memcpy
> +void *kasan_memset(void *ptr, int val, size_t len);
> +void *kasan_memcpy(void *dst, const void *src, size_t len);
> +void *kasan_memmove(void *dst, const void *src, size_t len);
> +
> +#define memcpy(dst, src, len) kasan_memcpy((dst), (src), (len))
> +#define memset(ptr, val, len) kasan_memset((ptr), (val), (len))
> +#define memmove(dst, src, len) kasan_memmove((dst), (src), (len))

I don't think just define is enough, gcc can call these functions
implicitely too (both with and without __). For example for a struct copy.

You need to have true linker level aliases. 

-Andi

-- 
ak@linux.intel.com -- Speaking for myself only
