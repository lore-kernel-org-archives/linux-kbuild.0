Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:41290 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726987AbfKHJV6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Nov 2019 04:21:58 -0500
Date: Fri, 8 Nov 2019 10:21:36 +0100
From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH 0/4] Speed booting by sorting ORC unwind tables at
 build time
Message-ID: <20191108092136.GH4114@hirez.programming.kicks-ass.net>
References: <20191107143205.206606-1-shile.zhang@linux.alibaba.com>
 <20191107152244.GD4114@hirez.programming.kicks-ass.net>
 <85abe498-f241-4752-81b5-6c0314f5a1e8@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85abe498-f241-4752-81b5-6c0314f5a1e8@linux.alibaba.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Shile Zhang <shile.zhang@linux.alibaba.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Josh Poimboeuf <jpoimboe@redhat.com>, x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Fri, Nov 08, 2019 at 09:42:55AM +0800, Shile Zhang wrote:

> > Can sort{ex,orc}table() be ran concurrently? Do they want to be the same
> > (threaded) tool?

> I think it is possible to do those sort work concurrently, likes deferred
> memory init which is big boot time speed up.
> But I don't know if the exception table and ORC unwind tables can be
> deferred, due to those tables might be used in early boot time, for early
> exception handling and early debugging. I'm not familiar with that.

I meant at link time, run both sorts concurrently such that we only have
to wait for the longest, instead of the sum of them.

They're not changing the same part of the ELF file, so it should be
possible to have one tool have multiple threads, each sorting a
different table.

Aside from the .ex_table and ORC there's also .jump_table that wants
sorting (see jump_label_sort_entries()).

I agree that doing it at link time makes sense, I just hate to do all
this sorting in sequence and blowing up the link time. I don't build for
customers, I build for single use boot and linking _SUCKS_.
