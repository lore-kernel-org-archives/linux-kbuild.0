Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:49160 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbfLBKdD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Dec 2019 05:33:03 -0500
Date: Mon, 2 Dec 2019 11:32:48 +0100
From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH v5 0/7] Speed booting by sorting ORC unwind tables at
 build time
Message-ID: <20191202103248.GB2827@hirez.programming.kicks-ass.net>
References: <20191128110206.2107-1-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191128110206.2107-1-shile.zhang@linux.alibaba.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Shile Zhang <shile.zhang@linux.alibaba.com>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@amacapital.net>, x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Thu, Nov 28, 2019 at 07:01:59PM +0800, Shile Zhang wrote:
> This series refactored the original sortextable tools, add ORC unwind
> tables sort at build time.
> 
> To sort the ORC unwind tables(.orc_unwind & .orc_unwind_ip) can save
> about 100ms in my test ENV (2C4G VM w/ Xeon 2.5GHz CPU).
> It costs about 30ms sort by new sorttable tool.

IIRC from your previous emails the new build-time sort is actually
shorter than that, so even for single build+run scenarios we win.

The code looks good to me, so:

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Who it going to apply this? I suppose we could take it through -tip,
like we do with all x86 and objtool related bits.
