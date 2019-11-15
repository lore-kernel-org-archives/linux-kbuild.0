Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:43576 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726912AbfKOABM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Nov 2019 19:01:12 -0500
Date: Thu, 14 Nov 2019 16:01:08 -0800
From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] mm/vmalloc: Fix regression caused by needless
 vmalloc_sync_all()
Message-Id: <20191114160108.57a72907f7b1aa9860471a06@linux-foundation.org>
In-Reply-To: <20191114171231.GA21753@suse.de>
References: <20191113095530.228959-1-shile.zhang@linux.alibaba.com>
        <20191114171231.GA21753@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joerg Roedel <jroedel@suse.de>
Cc: Shile Zhang <shile.zhang@linux.alibaba.com>, linux-mm@kvack.org, linux-kbuild@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, hpa@zytor.com

On Thu, 14 Nov 2019 18:12:31 +0100 Joerg Roedel <jroedel@suse.de> wrote:

> On Wed, Nov 13, 2019 at 05:55:30PM +0800, Shile Zhang wrote:
> > +#if defined(CONFIG_X86_32) && defined(CONFIG_X86_PAE)
> >  	/*
> >  	 * First make sure the mappings are removed from all page-tables
> >  	 * before they are freed.
> > +	 *
> > +	 * This is only needed on x86-32 with !SHARED_KERNEL_PMD, which is
> > +	 * the case on a PAE kernel with PTI enabled.
> >  	 */
> > -	vmalloc_sync_all();
> > +	if (!SHARED_KERNEL_PMD && boot_cpu_has(X86_FEATURE_PTI))
> > +		vmalloc_sync_all();
> > +#endif
> 
> I already submitted another fix for this quite some time ago:
> 
> 	https://lore.kernel.org/lkml/20191009124418.8286-1-joro@8bytes.org/
> 

Your patch is more verbose but looks quite a bit nicer than this patch
(Link:
http://lkml.kernel.org/r/20191113095530.228959-1-shile.zhang@linux.alibaba.com).
The separation of sync-for-a-mapping versus sync-for-an-unmapping adds
clarity.


It's fairly urgent - I consider this to be -stable material.

Thomas & co, was that a deliberate skip?
