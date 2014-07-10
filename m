Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:35704 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751492AbaGJHqo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 10 Jul 2014 03:46:44 -0400
Message-id: <53BE4398.6020509@samsung.com>
Date: Thu, 10 Jul 2014 11:41:12 +0400
From: Andrey Ryabinin <a.ryabinin@samsung.com>
MIME-version: 1.0
Subject: Re: [RFC/PATCH RESEND -next 11/21] mm: slub: share slab_err and
 object_err functions
References: <1404905415-9046-1-git-send-email-a.ryabinin@samsung.com>
 <1404905415-9046-12-git-send-email-a.ryabinin@samsung.com>
 <alpine.DEB.2.11.1407090928530.1384@gentwo.org>
In-reply-to: <alpine.DEB.2.11.1407090928530.1384@gentwo.org>
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Lameter <cl@gentwo.org>
Cc: linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>, Konstantin Serebryany <kcc@google.com>, Alexey Preobrazhensky <preobr@google.com>, Andrey Konovalov <adech.fo@gmail.com>, Yuri Gribov <tetra2005@gmail.com>, Konstantin Khlebnikov <koct9i@gmail.com>, Sasha Levin <sasha.levin@oracle.com>, Michal Marek <mmarek@suse.cz>, Russell King <linux@arm.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-mm@kvack.org

On 07/09/14 18:29, Christoph Lameter wrote:
> On Wed, 9 Jul 2014, Andrey Ryabinin wrote:
> 
>> Remove static and add function declarations to mm/slab.h so they
>> could be used by kernel address sanitizer.
> 
> Hmmm... This is allocator specific. At some future point it would be good
> to move error reporting to slab_common.c and use those from all
> allocators.
> 

I could move declarations to kasan internals, but it will look ugly too.
I also had an idea about unifying SLAB_DEBUG and SLUB_DEBUG at some future.
I can't tell right now how hard it will be, but it seems doable.

