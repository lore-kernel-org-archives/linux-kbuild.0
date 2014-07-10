Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:17189 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751762AbaGJHgl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 10 Jul 2014 03:36:41 -0400
Message-id: <53BE4141.6060908@samsung.com>
Date: Thu, 10 Jul 2014 11:31:13 +0400
From: Andrey Ryabinin <a.ryabinin@samsung.com>
MIME-version: 1.0
Subject: Re: [RFC/PATCH RESEND -next 01/21] Add kernel address sanitizer
 infrastructure.
References: <1404905415-9046-1-git-send-email-a.ryabinin@samsung.com>
 <1404905415-9046-2-git-send-email-a.ryabinin@samsung.com>
 <alpine.DEB.2.11.1407090924030.1384@gentwo.org>
In-reply-to: <alpine.DEB.2.11.1407090924030.1384@gentwo.org>
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Lameter <cl@gentwo.org>
Cc: linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>, Konstantin Serebryany <kcc@google.com>, Alexey Preobrazhensky <preobr@google.com>, Andrey Konovalov <adech.fo@gmail.com>, Yuri Gribov <tetra2005@gmail.com>, Konstantin Khlebnikov <koct9i@gmail.com>, Sasha Levin <sasha.levin@oracle.com>, Michal Marek <mmarek@suse.cz>, Russell King <linux@arm.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-mm@kvack.org

On 07/09/14 18:26, Christoph Lameter wrote:
> On Wed, 9 Jul 2014, Andrey Ryabinin wrote:
> 
>> +
>> +Markers of unaccessible bytes could be found in mm/kasan/kasan.h header:
>> +
>> +#define KASAN_FREE_PAGE         0xFF  /* page was freed */
>> +#define KASAN_PAGE_REDZONE      0xFE  /* redzone for kmalloc_large allocations */
>> +#define KASAN_SLAB_REDZONE      0xFD  /* Slab page redzone, does not belong to any slub object */
> 
> We call these zones "PADDING". Redzones are associated with an object.
> Padding is there because bytes are left over, unusable or necessary for
> alignment.
> 
Goop point. I will change the name to make it less confusing.
