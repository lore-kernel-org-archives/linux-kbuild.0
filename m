Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:59170 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730144AbfKHJZq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Nov 2019 04:25:46 -0500
Date: Fri, 8 Nov 2019 10:25:33 +0100
From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH 0/4] Speed booting by sorting ORC unwind tables at
 build time
Message-ID: <20191108092533.GN5671@hirez.programming.kicks-ass.net>
References: <20191107143205.206606-1-shile.zhang@linux.alibaba.com>
 <20191107152244.GD4114@hirez.programming.kicks-ass.net>
 <85abe498-f241-4752-81b5-6c0314f5a1e8@linux.alibaba.com>
 <20191108092136.GH4114@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191108092136.GH4114@hirez.programming.kicks-ass.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Shile Zhang <shile.zhang@linux.alibaba.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Josh Poimboeuf <jpoimboe@redhat.com>, x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Fri, Nov 08, 2019 at 10:21:36AM +0100, Peter Zijlstra wrote:
> On Fri, Nov 08, 2019 at 09:42:55AM +0800, Shile Zhang wrote:
> 
> > > Can sort{ex,orc}table() be ran concurrently? Do they want to be the same
> > > (threaded) tool?
> 
> > I think it is possible to do those sort work concurrently, likes deferred
> > memory init which is big boot time speed up.
> > But I don't know if the exception table and ORC unwind tables can be
> > deferred, due to those tables might be used in early boot time, for early
> > exception handling and early debugging. I'm not familiar with that.
> 
> I meant at link time, run both sorts concurrently such that we only have
> to wait for the longest, instead of the sum of them.
> 
> They're not changing the same part of the ELF file, so it should be
> possible to have one tool have multiple threads, each sorting a
> different table.
> 
> Aside from the .ex_table and ORC there's also .jump_table that wants
> sorting (see jump_label_sort_entries()).

Oh, and I'll be adding .static_call_sites soon, see:

  https://lkml.kernel.org/r/20191007082708.013939311@infradead.org

(I should repost that)

That gives us 4 tables to sort which we can do concurrently in 4
threads.

> I agree that doing it at link time makes sense, I just hate to do all
> this sorting in sequence and blowing up the link time. I don't build for
> customers, I build for single use boot and linking _SUCKS_.
