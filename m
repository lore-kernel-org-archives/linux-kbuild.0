Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38303 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726444AbfKOHZQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Nov 2019 02:25:16 -0500
Date: Fri, 15 Nov 2019 08:25:11 +0100
From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [RFC PATCH v3 0/7] Speed booting by sorting ORC unwind tables at
 build time
Message-ID: <20191115072511.GA114447@gmail.com>
References: <20191115064750.47888-1-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191115064750.47888-1-shile.zhang@linux.alibaba.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Shile Zhang <shile.zhang@linux.alibaba.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org


* Shile Zhang <shile.zhang@linux.alibaba.com> wrote:

> Hi,
> 
> I refactored the sortextable code and add ORC unwind tables sort
> support, for kernel boot speedup by sorting kernel tables at build time
> as much as possible.
> 
> Followed Peter's suggestion, I put ORC tables sort into a separated
> thread makes these tables sort concurrently. That helps to avoid
> kernel's link time as possible.

Could you please also measure how much boot time this saves, 
approximately, and how long it takes to do it at build time?

Thanks,

	Ingo
