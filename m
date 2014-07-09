Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from qmta09.emeryville.ca.mail.comcast.net ([76.96.30.96]:33053 "EHLO
	qmta09.emeryville.ca.mail.comcast.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751082AbaGIOdm (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Jul 2014 10:33:42 -0400
Date: Wed, 9 Jul 2014 09:33:39 -0500 (CDT)
From: Christoph Lameter <cl@gentwo.org>
Subject: Re: [RFC/PATCH RESEND -next 13/21] mm: slub: add allocation size
 field to struct kmem_cache
In-Reply-To: <1404905415-9046-14-git-send-email-a.ryabinin@samsung.com>
Message-ID: <alpine.DEB.2.11.1407090933170.1384@gentwo.org>
References: <1404905415-9046-1-git-send-email-a.ryabinin@samsung.com> <1404905415-9046-14-git-send-email-a.ryabinin@samsung.com>
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Ryabinin <a.ryabinin@samsung.com>
Cc: linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>, Konstantin Serebryany <kcc@google.com>, Alexey Preobrazhensky <preobr@google.com>, Andrey Konovalov <adech.fo@gmail.com>, Yuri Gribov <tetra2005@gmail.com>, Konstantin Khlebnikov <koct9i@gmail.com>, Sasha Levin <sasha.levin@oracle.com>, Michal Marek <mmarek@suse.cz>, Russell King <linux@arm.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-mm@kvack.org

On Wed, 9 Jul 2014, Andrey Ryabinin wrote:

> When caller creates new kmem_cache, requested size of kmem_cache
> will be stored in alloc_size. Later alloc_size will be used by
> kerenel address sanitizer to mark alloc_size of slab object as
> accessible and the rest of its size as redzone.

I think this patch is not needed since object_size == alloc_size right?
