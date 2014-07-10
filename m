Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:64285 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751942AbaGJJ3p (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 10 Jul 2014 05:29:45 -0400
Message-id: <53BE5BC1.6050802@samsung.com>
Date: Thu, 10 Jul 2014 13:24:17 +0400
From: Andrey Ryabinin <a.ryabinin@samsung.com>
MIME-version: 1.0
Subject: Re: [RFC/PATCH RESEND -next 15/21] mm: slub: add kernel address
 sanitizer hooks to slub allocator
References: <1404905415-9046-1-git-send-email-a.ryabinin@samsung.com>
 <1404905415-9046-16-git-send-email-a.ryabinin@samsung.com>
 <alpine.DEB.2.11.1407090947020.1384@gentwo.org>
In-reply-to: <alpine.DEB.2.11.1407090947020.1384@gentwo.org>
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Lameter <cl@gentwo.org>
Cc: linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>, Konstantin Serebryany <kcc@google.com>, Alexey Preobrazhensky <preobr@google.com>, Andrey Konovalov <adech.fo@gmail.com>, Yuri Gribov <tetra2005@gmail.com>, Konstantin Khlebnikov <koct9i@gmail.com>, Sasha Levin <sasha.levin@oracle.com>, Michal Marek <mmarek@suse.cz>, Russell King <linux@arm.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-mm@kvack.org

On 07/09/14 18:48, Christoph Lameter wrote:
> On Wed, 9 Jul 2014, Andrey Ryabinin wrote:
> 
>> With this patch kasan will be able to catch bugs in memory allocated
>> by slub.
>> Allocated slab page, this whole page marked as unaccessible
>> in corresponding shadow memory.
>> On allocation of slub object requested allocation size marked as
>> accessible, and the rest of the object (including slub's metadata)
>> marked as redzone (unaccessible).
>>
>> We also mark object as accessible if ksize was called for this object.
>> There is some places in kernel where ksize function is called to inquire
>> size of really allocated area. Such callers could validly access whole
>> allocated memory, so it should be marked as accessible by kasan_krealloc call.
> 
> Do you really need to go through all of this? Add the hooks to
> kmem_cache_alloc_trace() instead and use the existing instrumentation
> that is there for other purposes?
> 

I could move kasan_kmalloc hooks kmem_cache_alloc_trace(), and I think it will look better.
Hovewer I will require two hooks instead of one (for CONFIG_TRACING=y and CONFIG_TRACING=n).

Btw, seems I broke CONFIG_SL[AO]B configurations in this patch by  introducing __ksize function
which used in krealloc now.
