Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:60518 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726983AbfKOKdu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Nov 2019 05:33:50 -0500
Date: Fri, 15 Nov 2019 11:33:36 +0100
From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH v3 6/7] scripts/sorttable: Add ORC unwind tables sort
 concurrently
Message-ID: <20191115103336.GD4131@hirez.programming.kicks-ass.net>
References: <20191115064750.47888-1-shile.zhang@linux.alibaba.com>
 <20191115064750.47888-7-shile.zhang@linux.alibaba.com>
 <20191115090723.GS4114@hirez.programming.kicks-ass.net>
 <9594afbc-52bc-5ae7-4a19-8fc4b36a1abd@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9594afbc-52bc-5ae7-4a19-8fc4b36a1abd@linux.alibaba.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Shile Zhang <shile.zhang@linux.alibaba.com>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Fri, Nov 15, 2019 at 05:43:49PM +0800, Shile Zhang wrote:
> On 2019/11/15 17:07, Peter Zijlstra wrote:
> > On Fri, Nov 15, 2019 at 02:47:49PM +0800, Shile Zhang wrote:

> > > +/**
> > > + * sort - sort an array of elements
> > > + * @base: pointer to data to sort
> > > + * @num: number of elements
> > > + * @size: size of each element
> > > + * @cmp_func: pointer to comparison function
> > > + * @swap_func: pointer to swap function
> > > + *
> > > + * This function does a heapsort on the given array. You may provide a
> > > + * swap_func function optimized to your element type.
> > > + *
> > > + * Sorting time is O(n log n) both on average and worst-case. While
> > > + * qsort is about 20% faster on average, it suffers from exploitable
> > > + * O(n*n) worst-case behavior and extra memory requirements that make
> > > + * it less suitable for kernel use.
> > > + *
> > > + * This code token out of /lib/sort.c.
> > > + */
> > > +static void sort(void *base, size_t num, size_t size,
> > > +	  int (*cmp_func)(const void *, const void *),
> > > +	  void (*swap_func)(void *, void *, int size))
> > > +{

> > > +}

> > Do we really need to copy the heapsort implementation? That is, why not
> > use libc's qsort() ? This is userspace after all.
> 
> Yes, I think qsort is better choice than copy-paste here. But qsort does not
> support customized swap func, which is needed for ORC unwind swap two tables
> together.
> I think it's hard to do with qsort, so I used sort same with original orc
> unwind table sort.

Urgh, you're right. That's unforunate.
