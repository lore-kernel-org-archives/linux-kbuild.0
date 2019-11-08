Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:57566 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728513AbfKHJz3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Nov 2019 04:55:29 -0500
Date: Fri, 8 Nov 2019 10:55:20 +0100
From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH v2 1/3] scripts: Add sortorctable to sort ORC unwind
 tables
Message-ID: <20191108095520.GK4114@hirez.programming.kicks-ass.net>
References: <20191108071108.72132-1-shile.zhang@linux.alibaba.com>
 <20191108071108.72132-2-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191108071108.72132-2-shile.zhang@linux.alibaba.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: shile.zhang@linux.alibaba.com
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Josh Poimboeuf <jpoimboe@redhat.com>, x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Fri, Nov 08, 2019 at 03:11:06PM +0800, shile.zhang@linux.alibaba.com wrote:
> From: Shile Zhang <shile.zhang@linux.alibaba.com>
> 
> Sort orc_unwind and orc_unwind_ip tables at build time instead of runtime
> in boot pharse can save more boot time.

I still object to adding a copy of sortextable instead of making one
tool for all sorts.
